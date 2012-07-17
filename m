Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1Sr4X8-0006fb-UF
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 11:57:35 +0200
Received: from mail56-am1-R.bigfish.com (10.3.201.237) by
	AM1EHSOBE008.bigfish.com (10.3.204.28) with Microsoft SMTP Server id
	14.1.225.23; Tue, 17 Jul 2012 08:30:55 +0000
Received: from mail56-am1 (localhost [127.0.0.1])	by mail56-am1-R.bigfish.com
	(Postfix) with ESMTP id C9C7C4E04EE	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 08:30:55 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -9
X-BigFish: VS-9(zz98dI9371I936eI1102I542M1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah107ahbe9i)
Received: from mail56-am1 (localhost.localdomain [127.0.0.1]) by mail56-am1
	(MessageSwitch) id 1342513855464399_25756;
	Tue, 17 Jul 2012 08:30:55 +0000 (UTC)
Received: from AM1EHSMHS016.bigfish.com (unknown [10.3.201.242])	by
	mail56-am1.bigfish.com (Postfix) with ESMTP id 6F4E04C004E	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 08:30:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS016.bigfish.com
	(10.3.207.154) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 17 Jul 2012 08:30:55 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.250]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Tue, 17 Jul 2012 03:30:53 -0500
From: Liu Ting-B28495 <B28495@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] kernel.bbclass: update image name to keep it
	same in D and DEPLOYDIR
Thread-Index: AQHNYA8p99xYXlwyIE28jo2qSUrTopclz30AgARkl7CAAKX+AIACTysQ
Date: Tue, 17 Jul 2012 08:30:52 +0000
Message-ID: <AF604684617F454390621992F367F169011A0AD9@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1342084646-23822-1-git-send-email-b28495@freescale.com>
	<1342090978.22262.7.camel@ted>
	<AF604684617F454390621992F367F169011A007D@039-SN2MPN1-021.039d.mgd.msft.net>
	<CAMKF1soCkrVRrkWbr9Sx+2JEtXajwPeORAN_mNkzS4KXWcgzTg@mail.gmail.com>
In-Reply-To: <CAMKF1soCkrVRrkWbr9Sx+2JEtXajwPeORAN_mNkzS4KXWcgzTg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.96]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: [PATCH] kernel.bbclass: update image name to keep it same in D and DEPLOYDIR
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
X-List-Received-Date: Tue, 17 Jul 2012 09:57:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: Monday, July 16, 2012 12:02 AM
> To: Patches and discussions about the oe-core layer
> Cc: McClintock Matthew-B29882; Luo Zhenhua-B19537
> Subject: Re: [OE-core] [PATCH] kernel.bbclass: update image name to keep
> it same in D and DEPLOYDIR
>=20
> On Sun, Jul 15, 2012 at 4:18 AM, Liu Ting-B28495 <B28495@freescale.com>
> wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Richard Purdie
> > Sent: Thursday, July 12, 2012 7:03 PM
> > To: Patches and discussions about the oe-core layer
> > Cc: McClintock Matthew-B29882
> > Subject: Re: [OE-core] [PATCH] kernel.bbclass: update image name to
> > keep it same in D and DEPLOYDIR
> >
> > On Thu, 2012-07-12 at 04:17 -0500, b28495@freescale.com wrote:
> >> From: Ting Liu <b28495@freescale.com>
> >>
> >> Signed-off-by: Ting Liu <b28495@freescale.com>
> >> ---
> >>  meta/classes/kernel.bbclass |    7 ++++++-
> >>  1 files changed, 6 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/meta/classes/kernel.bbclass
> >> b/meta/classes/kernel.bbclass index 81c334b..420a1ec 100644
> >> --- a/meta/classes/kernel.bbclass
> >> +++ b/meta/classes/kernel.bbclass
> >> @@ -122,7 +122,12 @@ kernel_do_install() {
> >>       #
> >>       install -d ${D}/${KERNEL_IMAGEDEST}
> >>       install -d ${D}/boot
> >> -     install -m 0644 ${KERNEL_OUTPUT}
> ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
> >> +        install -m 0644 ${KERNEL_OUTPUT}
> ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGE_BASE_NAME}.bin
> >> +        cd ${D}/${KERNEL_IMAGEDEST}/
> >> +        rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
> >> +        ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin
> ${KERNEL_IMAGE_SYMLINK_NAME}.bin
> >> +        ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
> >> +     cd -
> >>       install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION=
}
> >>       install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
> >>       install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
> >
> > This is going to break users who rely on the existing naming/layout.
> >
> > The patch description is lacking on why we need to do this too, it just
> says what you're doing and not why.
> >
> > Cheers,
> >
> > Richard
> >
> >
> > [Liu Ting-B28495] on our side, we used two ways to load the kernel
> images. 1) load from Ethernet 2) load from hard disk which deployed with
> the rootfs image containing kernel image (installing the package 'kernel-
> image'). We cannot use the same bootargs in u-boot due to the mismatched
> name.
>=20
> so define two macros nfsboot and diskboot which take care of setting all
> required parameters as well as other env vars.
>=20

[Liu Ting-B28495] Maybe I made a misunderstanding here. The problem is that=
:
for the same kernel image, the one get deployed has a name, and the one=20
contained in rootfs has another name. It will be helpful if we can unify th=
em.





