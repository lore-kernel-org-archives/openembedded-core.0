Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TR82L-0001Ux-TY for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 22:58:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9OKjJwh007665;
	Wed, 24 Oct 2012 21:45:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06617-08; Wed, 24 Oct 2012 21:45:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9OKj9i9007659
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 24 Oct 2012 21:45:11 +0100
Message-ID: <1351111509.22340.133.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 24 Oct 2012 21:45:09 +0100
In-Reply-To: <20121024151234.GH3269@jama.jama.net>
References: <1350569021-17352-1-git-send-email-ross.burton@intel.com>
	<50880419.9000203@linux.intel.com>
	<20121024151234.GH3269@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmare: upgrade to latest commit
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
X-List-Received-Date: Wed, 24 Oct 2012 20:58:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-24 at 17:12 +0200, Martin Jansa wrote:
> On Wed, Oct 24, 2012 at 08:07:05AM -0700, Saul Wold wrote:
> > On 10/18/2012 07:03 AM, Ross Burton wrote:
> > > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > ---
> > >   meta/recipes-kernel/linux-firmware/linux-firmware_git.bb |    4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > > index 559f82a..f4eb4cf 100644
> > > --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > > +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > > @@ -19,10 +19,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=e56b405656593a0c97e478513051ea0e \
> > >                       file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
> > >                      "
> > >
> > > -SRCREV = "e98750f0d68d0037ce5a186f7f863a9c13bf773a"
> > > +SRCREV = "0d6729f2b0bc6254d3628eb831bc80a36b5a17db"
> > >   PE = "1"
> > >   PV = "0.0+git${SRCPV}"
> > > -PR = "r4"
> > > +PR = "r5"
> > >
> > >   SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=git"
> > >
> > >
> > Merged into OE-Core
> 
> Probably not caused by this upgrade, but do you also see:
> 
> NOTE: Running setscene task 1956 of 2655 (/OE/shr-core/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb, do_package_setscene)
> NOTE: recipe linux-firmware-1_0.0+git2+0d6729f2b0bc6254d3628eb831bc80a36b5a17db-r5: task do_populate_sysroot_setscene: Started
> NOTE: recipe linux-firmware-1_0.0+git2+0d6729f2b0bc6254d3628eb831bc80a36b5a17db-r5: task do_package_setscene: Started
> WARNING: The recipe linux-firmware is trying to install files into a shared area when those files already exist. Those files are:
>    /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/ti_5052.fw
>    /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/mts_edge.fw
>    /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/whiteheat_loader.fw
>    /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/mts_cdma.fw
>    /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/whiteheat.fw
>    /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/mts_gsm.fw
>    /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/ti_3410.fw
>    /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/kaweth/new_code_fix.bin
>    /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/kaweth/trigger_code_fix.bin
>    /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/kaweth/new_code.bin
>    /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/kaweth/trigger_code.bin
>    /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/keyspan_pda/keyspan_pda.fw
>    /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/keyspan_pda/xircom_pgs.fw
>    /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/edgeport/down.fw
>    /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/edgeport/down3.bin
>    /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/edgeport/down2.fw
>    /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/edgeport/boot.fw
>    /OE/shr-core/tmp-eglibc/sysroots/om-gta02/lib/firmware/edgeport/boot2.fw
> NOTE: recipe linux-firmware-1_0.0+git2+0d6729f2b0bc6254d3628eb831bc80a36b5a17db-r5: task do_populate_sysroot_setscene: Succeeded
> 
> Here it's installed by kernel recipe (linux-openmoko not linux-yocto based) but I don't 
> see firmware install disabled in kernel.bbclass or linux-yocto.

I've not seen those warnings in my builds or on the autobuilder...

Cheers,

Richard



