Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJNBm-000619-Ju for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 13:32:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q93BJSRn026815;
	Wed, 3 Oct 2012 12:19:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26503-02; Wed,  3 Oct 2012 12:19:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q93BJIFm026809
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 3 Oct 2012 12:19:19 +0100
Message-ID: <1349263162.18301.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Wed, 03 Oct 2012 12:19:22 +0100
In-Reply-To: <1349261089.32611.115.camel@phil-desktop>
References: <1349259854.32611.106.camel@phil-desktop>
	<20121003103141.GA21043@jama.jama.net>
	<1349261089.32611.115.camel@phil-desktop>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Martin Jansa <martin.jansa@gmail.com>,
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane: detect and warn about relocations in .text
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
X-List-Received-Date: Wed, 03 Oct 2012 11:32:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-03 at 11:44 +0100, Phil Blundell wrote:
> On Wed, 2012-10-03 at 12:31 +0200, Martin Jansa wrote:
> > On Wed, Oct 03, 2012 at 11:24:12AM +0100, Phil Blundell wrote:
> > > Signed-off-by: Phil Blundell <pb@pbcl.net>
> > 
> > Can you add a bit longer description of possible issues with relocations
> > in .text? So that people seeing this issue will know how dangerous it is
> > for them?
> > 
> > From my understanding (after reading
> > http://www.gentoo.org/proj/en/hardened/pic-fix-guide.xml) it's mostly
> > performance issue?
> 
> Yes, that's correct.  It basically falls into the same sort of category
> as useless-rpaths; the binary will still work, but there will be some
> adverse impact on performance and memory usage.  
> 
> Historically, the most common cause of DT_TEXTREL was accidentally
> linking non-PIC code into a DSO.  Recent versions of the linker will
> flatly refuse to do this on at least some architectures, though, so
> hopefully this problem will just go away over time.

Am I right in thinking this is also a marginal help to 'security' since
if the .text segment is loaded read only, it becomes slightly harder for
certain kinds of overflow attacks to work?

Cheers,

Richard



