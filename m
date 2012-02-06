Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1RuPRx-0001tY-Hz
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 15:21:45 +0100
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q16EDgK8002850;
	Mon, 6 Feb 2012 08:13:42 -0600
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q16EDgVS003178;
	Mon, 6 Feb 2012 08:13:42 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 6 Feb 2012 08:13:42 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] u-boot inc: update inc file for newer
	u-boot versions
Thread-Index: AQHM4rxXFGUKbBfvPUajoHn7Z2ryvpYrs7HQgACB8ICAA7fQwA==
Date: Mon, 6 Feb 2012 14:13:42 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1012765D45F@DLEE12.ent.ti.com>
References: <1328305049-18696-1-git-send-email-Chase.Maupin@ti.com>
	<1328305049-18696-2-git-send-email-Chase.Maupin@ti.com>
	<7D46E86EC0A8354091174257B2FED10127649BE9@DFLE34.ent.ti.com>
	<4F2C6D27.8050501@linux.intel.com>
In-Reply-To: <4F2C6D27.8050501@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: B1SZ C9BH DUzY DU56 EZXf FchJ GKS+ Harg HgLm K3US L958
	Mhdc NRh5 ONyd RQqj Sp4q; 2;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBjAG8AcgBlAEAAbABpAHMAdABzAC4AbwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALgBvAHIAZwA7AHMAZwB3AEAAbABpAG4AdQB4AC4AaQBuAHQAZQBsAC4AYwBvAG0A;
	Sosha1_v1; 7; {0E2B9F11-74A7-42A7-8F52-2A3F199EEB51};
	YwBoAGEAcwBlAC4AbQBhAHUAcABpAG4AQAB0AGkALgBjAG8AbQA=; Mon,
	06 Feb 2012 14:13:37 GMT;
	UgBFADoAIABbAE8ARQAtAGMAbwByAGUAXQAgAFsAUABBAFQAQwBIACAAMQAvADEAXQAgAHUALQBiAG8AbwB0ACAAaQBuAGMAOgAgAHUAcABkAGEAdABlACAAaQBuAGMAIABmAGkAbABlACAAZgBvAHIAIABuAGUAdwBlAHIAIAB1AC0AYgBvAG8AdAAgAHYAZQByAHMAaQBvAG4AcwA=
x-cr-puzzleid: {0E2B9F11-74A7-42A7-8F52-2A3F199EEB51}
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] u-boot inc: update inc file for newer u-boot versions
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
X-List-Received-Date: Mon, 06 Feb 2012 14:21:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Friday, February 03, 2012 5:27 PM
> To: Patches and discussions about the oe-core layer
> Cc: Maupin, Chase
> Subject: Re: [OE-core] [PATCH 1/1] u-boot inc: update inc file for
> newer u-boot versions
>=20
> On 02/03/2012 01:43 PM, Maupin, Chase wrote:
> >> -----Original Message-----
> >> From: Maupin, Chase
> >> Sent: Friday, February 03, 2012 3:37 PM
> >> To: openembedded-core@lists.openembedded.org
> >> Cc: Maupin, Chase
> >> Subject: [PATCH 1/1] u-boot inc: update inc file for newer u-
> boot
> >> versions
> >>
> >> * Add support for different suffixes found with later u-boot
> >>    versions which have switched from .bin to .img
> >> * Allow recipes that include u-boot.inc to also package an
> >>    SPL if they build one.
> >>      * Minimum requirement is to set the SPL_BINARY value to add
> >>        the SPL to the u-boot package as well as into the deploy
> >>        directory.
> >>
> >> Signed-off-by: Chase Maupin<Chase.Maupin@ti.com>
> >> ---
> >>   meta/recipes-bsp/u-boot/u-boot.inc |   37
> >> ++++++++++++++++++++++++++++++++---
> >>   1 files changed, 33 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-
> >> bsp/u-boot/u-boot.inc
> >> index 4180345..dcf5463 100644
> >> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> >> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> >> @@ -19,11 +19,22 @@ python () {
> >>   		raise bb.parse.SkipPackage("because UBOOT_MACHINE is
> >> not set")
> >>   }
> >>
> >> -UBOOT_IMAGE ?=3D "u-boot-${MACHINE}-${PV}-${PR}.bin"
> >> -UBOOT_BINARY ?=3D "u-boot.bin"
> >> -UBOOT_SYMLINK ?=3D "u-boot-${MACHINE}.bin"
> >> +# Some versions of u-boot use .bin and others use .img.  By
> >> default use .bin
> >> +# but enable individual recipes to change this value.
> >> +UBOOT_SUFFIX ?=3D "bin"
> >> +UBOOT_IMAGE ?=3D "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> >> +UBOOT_BINARY ?=3D "u-boot.${UBOOT_SUFFIX}"
> >> +UBOOT_SYMLINK ?=3D "u-boot-${MACHINE}.${UBOOT_SUFFIX}"
> >>   UBOOT_MAKE_TARGET ?=3D "all"
> >>
> >> +# Some versions of u-boot build an SPL (Second Program Loader)
> >> image that
> >> +# should be packaged along with the u-boot binary as well as
> >> placed in the
> >> +# deploy directory.  For those versions they can set the
> following
> >> variables
> >> +# to allow packaging the SPL.
> >> +SPL_BINARY ?=3D ""
> >> +SPL_IMAGE ?=3D "${SPL_BINARY}-${PV}-${PR}"
> >> +SPL_SYMLINK ?=3D "${SPL_BINARY}-${MACHINE}"
> >> +
> >>   do_compile () {
> >>   	unset LDFLAGS
> >>   	unset CFLAGS
> >> @@ -36,15 +47,33 @@ do_install () {
> >>       install -d ${D}/boot
> >>       install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
> >>       ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
> >> +
> >> +    if [ "x${SPL_BINARY}" !=3D "x" ]
> >> +    then
> >> +        install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
> >> +        ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
> >> +    fi
> >>   }
> >>
> >>   FILES_${PN} =3D "/boot"
> >> +# no gnu_hash in uboot.bin, by design, so skip QA
> >> +INSANE_SKIP_${PN} =3D True
> >
> > BTW, I believe I can remove this line since I didn't see any QA
> warnings when building without it.  I have seen versions of u-
> boot.inc that use the INSANE_SKIP and versions that don't so I'm
> not sure what the right thing is here.
> >
> If you are going to set it, it should be the list of which tests to
> skip
> rather than True.
>=20
> INSANE_SKIP_${PN} =3D "ldflags" for the gnu_hash check, need to read
> insane.bbclass to figure that out.

Thanks for the feedback.  I'll resend this patch without the INSANE_SKIP

>=20
> Sau!
>=20
> >>
> >>   do_deploy () {
> >> -	install ${S}/u-boot.bin ${DEPLOYDIR}/${UBOOT_IMAGE}
> >> +    install -d ${DEPLOYDIR}
> >> +	install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
> >>
> >>   	cd ${DEPLOYDIR}
> >>   	rm -f ${UBOOT_SYMLINK}
> >>   	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
> >> +
> >> +    if [ "x${SPL_BINARY}" !=3D "x" ]
> >> +    then
> >> +        install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
> >> +        rm -f ${DEPLOYDIR}/${SPL_BINARY}
> >> ${DEPLOYDIR}/${SPL_SYMLINK}
> >> +        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
> >> +        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
> >> +    fi
> >>   }
> >> +
> >>   addtask deploy before do_build after do_compile
> >> --
> >> 1.7.0.4
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> core
> >


