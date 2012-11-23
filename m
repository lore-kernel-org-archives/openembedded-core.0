Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Tbr28-00084T-IR
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 12:02:57 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TbqoV-0005It-8R; Fri, 23 Nov 2012 11:48:51 +0100
From: Phil Blundell <philb@gnu.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 23 Nov 2012 10:48:36 +0000
In-Reply-To: <20121123102258.GJ12637@jama.jama.net>
References: <1353661767-13873-1-git-send-email-Martin.Jansa@gmail.com>
	<1353664350.13864.701.camel@phil-desktop>
	<20121123102258.GJ12637@jama.jama.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1353667731.13864.723.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] arch-armv4.inc: add --fix-v4bx to TARGET_LD_KERNEL_ARCH only for armv4 and strongarm1100
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2012 11:02:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-11-23 at 11:22 +0100, Martin Jansa wrote:
> On Fri, Nov 23, 2012 at 09:52:28AM +0000, Phil Blundell wrote:
> > On Fri, 2012-11-23 at 10:09 +0100, Martin Jansa wrote:
> > > -TARGET_LD_KERNEL_ARCH += "${@bb.utils.contains("TUNE_FEATURES", "armv4", "--fix-v4bx", "", d)}"
> > > +TARGET_LD_KERNEL_ARCH += "${@bb.utils.contains("DEFAULTTUNE", "armv4", "--fix-v4bx", "", d)}"
> > 
> > Testing DEFAULTTUNE doesn't really seem like the right thing.  Not that
> > I am any expert in the twisty maze of tune variables, but I would have
> > thought this should be:
> > 
> > TARGET_LD_KERNEL_ARCH += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "", "--fix-v4bx", d)}"
> 
> Depends if we want to apply it on e.g. armv5te device without thumb in
> TUNE_FEATURES.

Oh, yes, right.  Well, if you aren't using thumb then --fix-v4bx is
going to be mostly harmless, but I suppose the correct thing would be to
check for TUNE_FEATURES containing neither thumb nor armv5. 

p.




