Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SyiXT-0002bL-Dz; Tue, 07 Aug 2012 14:05:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77Brla8010358;
	Tue, 7 Aug 2012 12:53:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09711-03; Tue,  7 Aug 2012 12:53:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77Brcpr010352
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Aug 2012 12:53:38 +0100
Message-ID: <1344340419.9756.223.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 07 Aug 2012 12:53:39 +0100
In-Reply-To: <20120807105045.GR3267@jama.jama.net>
References: <20120807102142.00BD510217@opal>
	<20120807105045.GR3267@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : Revert "linux-firware: use ${base_libdir} instead of / lib for packaging"
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
X-List-Received-Date: Tue, 07 Aug 2012 12:05:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-07 at 12:50 +0200, Martin Jansa wrote:
> On Tue, Aug 07, 2012 at 10:21:41AM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 1da5966290954f4148cb39a0628b10f8f902ba18
> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=1da5966290954f4148cb39a0628b10f8f902ba18
> > 
> > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Date:   Tue Aug  7 11:16:54 2012 +0100
> > 
> > Revert "linux-firware: use ${base_libdir} instead of /lib for packaging"
> > 
> > This change breaks firmware loading on 64 bit platforms. This therefore
> > reverts commit ce2665b6ae77770d69ffbc4d45c96ce829d16738.
> > 
> > ---
> > 
> >  .../linux-firmware/linux-firmware_git.bb           |   36 ++++++++++----------
> >  1 files changed, 18 insertions(+), 18 deletions(-)
> > 
> > diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > index 5b93975..a7e4ed6 100644
> > --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > @@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=e56b405656593a0c97e478513051ea0e \
> >  SRCREV = "e98750f0d68d0037ce5a186f7f863a9c13bf773a"
> >  PE = "1"
> >  PV = "0.0+git${SRCPV}"
> > -PR = "r3"
> > +PR = "r2"
> 
> ^ breaks binary feeds

Sorry, fix pushed.

Cheers,

Richard



