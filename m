Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qer9I-0001lg-Gj for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 18:09:56 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qer5b-0005mi-5Y; Thu, 07 Jul 2011 18:06:07 +0200
From: Phil Blundell <pb@pbcl.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 07 Jul 2011 17:06:06 +0100
In-Reply-To: <201107071611.03605.paul.eggleton@linux.intel.com>
References: <1309881139.2410.14.camel@phil-desktop>
	<4E14F23C.5050001@linux.intel.com>
	<1310050317.6337.87.camel@phil-desktop>
	<201107071611.03605.paul.eggleton@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310054767.6337.96.camel@phil-desktop>
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bluez-dtl1-workaround: remove PRIORITY
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jul 2011 16:09:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-07 at 16:11 +0100, Paul Eggleton wrote:
> On Thursday 07 July 2011 15:51:54 Phil Blundell wrote:
> > On Wed, 2011-07-06 at 16:39 -0700, Saul Wold wrote:
> > > I will take a patch that deletes from here and adds it into the
> > > meta-extra's layer.
> > 
> > OK.  What's meta-extra's?  I don't think I'm familiar with that layer.
> 
> It's a Yocto layer that has been traditionally the place to preserve obsolete 
> stuff that was removed from Poky.
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-extras/

Ah, right, I see.

I've just sent a patch to this list to delete the recipe from oe-core.
I don't know where (or how) to send patches for meta-extras, but I guess
applying patch 2/2 in reverse against that repo would produce the
desired effect should anybody wish to do so.

p.




