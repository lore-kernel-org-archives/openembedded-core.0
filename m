Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id E9AE871440
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 18:24:03 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id k11so10119084wes.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jan 2015 10:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GyTmp6Lb5KvW4RoSdwdiyGp4Be2uL1VaAr3c6MM/DaI=;
	b=sv3c9wTz4CY/UWEk7dGs/n37O8ldn5+U31B5Zomzmj0i+CFZprLUBbRWnmuyIDmHXj
	K5JmV2AHb5Rl6mp6WugIB8q4w70jGBDYh7kCbZUPMB4uWIExQuHu6j+CiZesNTVW0a54
	TKSySqxAlrhL0pviogjICKfzs4XqaDa/Zyj91BOzEcpJdugRrqALufy8udUIR4ktrwR2
	dZzteBbk/yzrR5Z1UIPiWBKcqz2XC7V8ZKwQynFlFQ9Ug+jJERnzwNW+GDqsPQdmNhfC
	/FylghLRKQir1tgBG4TW9rPPmcQeNsZSXlnIYW3rewTxJz5SCb3uxnr6MCu+hvMCNWud
	r8TA==
X-Received: by 10.180.24.167 with SMTP id v7mr40270977wif.5.1420568644142;
	Tue, 06 Jan 2015 10:24:04 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	nj9sm14906447wic.10.2015.01.06.10.24.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 10:24:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 Jan 2015 19:24:05 +0100
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20150106182405.GC29986@jama>
References: <alpine.LFD.2.11.1501061257160.4810@localhost>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.11.1501061257160.4810@localhost>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Tidy up aesthetics of packagegroup recipe files.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Jan 2015 18:24:05 -0000
X-Groupsio-MsgNum: 61069
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mvpLiMfbWzRoNl4x"
Content-Disposition: inline

--mvpLiMfbWzRoNl4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 01:03:04PM -0500, Robert P. J. Day wrote:
>=20
> Some aesthetic cleanup of packagegroup files to make them more
> consistent and easier to read:
>=20
>  * standard indentation and line continuation
>  * as much as possible, use ${PN} instead of hardcoded filename

I think the consensus was to put closing quote as first character on own
line (not aligned with other entries).

This way it's easier to spot where multi-line variable starts and ends.

If you really want, you can find discussion about this on ML.

> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>=20
> ---
>=20
>   while pedantic, this cleanup makes the packagegroup files easier to
> peruse and use for demo when i'm teaching classes. also, as much as
> possible and when consistent over the entire file, i replaced the
> hardcoded packagegroup filename with the variable ${PN} to make it
> more visually obvious that that's what was happening.
>=20
>   to test, i just created a new project and ran a bitbake parse, and
> everything seemed fine.
>=20
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/=
recipes-core/packagegroups/packagegroup-base.bb
> index f4b2cd5..61031c7 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -11,38 +11,37 @@ inherit packagegroup
>=20
>  PROVIDES =3D "${PACKAGES}"
>  PACKAGES =3D ' \
> -            packagegroup-base \
> -            packagegroup-base-extended \
> -            packagegroup-distro-base \
> -            packagegroup-machine-base \
> -            \
> -            ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "packagegro=
up-base-acpi", "",d)} \
> -            ${@bb.utils.contains("MACHINE_FEATURES", "alsa", "packagegro=
up-base-alsa", "", d)} \
> -            ${@bb.utils.contains("MACHINE_FEATURES", "apm", "packagegrou=
p-base-apm", "", d)} \
> -            ${@bb.utils.contains("MACHINE_FEATURES", "ext2", "packagegro=
up-base-ext2", "", d)} \
> -            ${@bb.utils.contains("MACHINE_FEATURES", "vfat", "packagegro=
up-base-vfat", "", d)} \
> -            ${@bb.utils.contains("MACHINE_FEATURES", "irda", "packagegro=
up-base-irda", "",d)} \
> -            ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "packag=
egroup-base-keyboard", "", d)} \
> -            ${@bb.utils.contains("MACHINE_FEATURES", "pci", "packagegrou=
p-base-pci", "",d)} \
> -            ${@bb.utils.contains("MACHINE_FEATURES", "pcmcia", "packageg=
roup-base-pcmcia", "", d)} \
> -            ${@bb.utils.contains("MACHINE_FEATURES", "phone", "packagegr=
oup-base-phone", "", d)} \
> -            ${@bb.utils.contains("MACHINE_FEATURES", "serial", "packageg=
roup-base-serial", "", d)} \
> -            ${@bb.utils.contains("MACHINE_FEATURES", "usbgadget", "packa=
gegroup-base-usbgadget", "", d)} \
> -            ${@bb.utils.contains("MACHINE_FEATURES", "usbhost", "package=
group-base-usbhost", "", d)} \
> -            \
> -            ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth", "packag=
egroup-base-bluetooth", "", d)} \
> -            ${@bb.utils.contains("DISTRO_FEATURES", "wifi", "packagegrou=
p-base-wifi", "", d)} \
> -            ${@bb.utils.contains("DISTRO_FEATURES", "3g", "packagegroup-=
base-3g", "", d)} \
> -            ${@bb.utils.contains("DISTRO_FEATURES", "nfc", "packagegroup=
-base-nfc", "", d)} \
> -            ${@bb.utils.contains("DISTRO_FEATURES", "cramfs", "packagegr=
oup-base-cramfs", "", d)} \
> -            ${@bb.utils.contains("DISTRO_FEATURES", "ipsec", "packagegro=
up-base-ipsec", "", d)} \
> -            ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "packagegrou=
p-base-ipv6", "", d)} \
> -            ${@bb.utils.contains("DISTRO_FEATURES", "nfs", "packagegroup=
-base-nfs", "", d)} \
> -            ${@bb.utils.contains("DISTRO_FEATURES", "ppp", "packagegroup=
-base-ppp", "", d)} \
> -            ${@bb.utils.contains("DISTRO_FEATURES", "smbfs", "packagegro=
up-base-smbfs", "", d)} \
> -            ${@bb.utils.contains("DISTRO_FEATURES", "zeroconf", "package=
group-base-zeroconf", "", d)} \
> -            \
> -            '
> +    packagegroup-base \
> +    packagegroup-base-extended \
> +    packagegroup-distro-base \
> +    packagegroup-machine-base \
> +    \
> +    ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "packagegroup-base-=
acpi", "",d)} \
> +    ${@bb.utils.contains("MACHINE_FEATURES", "alsa", "packagegroup-base-=
alsa", "", d)} \
> +    ${@bb.utils.contains("MACHINE_FEATURES", "apm", "packagegroup-base-a=
pm", "", d)} \
> +    ${@bb.utils.contains("MACHINE_FEATURES", "ext2", "packagegroup-base-=
ext2", "", d)} \
> +    ${@bb.utils.contains("MACHINE_FEATURES", "vfat", "packagegroup-base-=
vfat", "", d)} \
> +    ${@bb.utils.contains("MACHINE_FEATURES", "irda", "packagegroup-base-=
irda", "",d)} \
> +    ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "packagegroup-b=
ase-keyboard", "", d)} \
> +    ${@bb.utils.contains("MACHINE_FEATURES", "pci", "packagegroup-base-p=
ci", "",d)} \
> +    ${@bb.utils.contains("MACHINE_FEATURES", "pcmcia", "packagegroup-bas=
e-pcmcia", "", d)} \
> +    ${@bb.utils.contains("MACHINE_FEATURES", "phone", "packagegroup-base=
-phone", "", d)} \
> +    ${@bb.utils.contains("MACHINE_FEATURES", "serial", "packagegroup-bas=
e-serial", "", d)} \
> +    ${@bb.utils.contains("MACHINE_FEATURES", "usbgadget", "packagegroup-=
base-usbgadget", "", d)} \
> +    ${@bb.utils.contains("MACHINE_FEATURES", "usbhost", "packagegroup-ba=
se-usbhost", "", d)} \
> +    \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth", "packagegroup-b=
ase-bluetooth", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "wifi", "packagegroup-base-w=
ifi", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "3g", "packagegroup-base-3g"=
, "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "nfc", "packagegroup-base-nf=
c", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "cramfs", "packagegroup-base=
-cramfs", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "ipsec", "packagegroup-base-=
ipsec", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "packagegroup-base-i=
pv6", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "nfs", "packagegroup-base-nf=
s", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "ppp", "packagegroup-base-pp=
p", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "smbfs", "packagegroup-base-=
smbfs", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "zeroconf", "packagegroup-ba=
se-zeroconf", "", d)} \
> +    '
>=20
>  # Override by distro if needed
>  VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
> @@ -91,7 +90,8 @@ RRECOMMENDS_packagegroup-base =3D "\
>      kernel-module-rtc-dev \
>      kernel-module-rtc-proc \
>      kernel-module-rtc-sysfs \
> -    kernel-module-unix"
> +    kernel-module-unix \
> +    "
>=20
>  RDEPENDS_packagegroup-base-extended =3D "\
>      packagegroup-base \
> @@ -144,28 +144,33 @@ RRECOMMENDS_packagegroup-machine-base =3D "${MACHIN=
E_EXTRA_RRECOMMENDS}"
>=20
>  SUMMARY_packagegroup-base-keyboard =3D "Keyboard support"
>  RDEPENDS_packagegroup-base-keyboard =3D "\
> -    ${VIRTUAL-RUNTIME_keymaps}"
> +    ${VIRTUAL-RUNTIME_keymaps} \
> +    "
>=20
>  SUMMARY_packagegroup-base-pci =3D "PCI bus support"
>  RDEPENDS_packagegroup-base-pci =3D "\
> -    pciutils"
> +    pciutils \
> +    "
>=20
>  SUMMARY_packagegroup-base-acpi =3D "ACPI support"
>  RDEPENDS_packagegroup-base-acpi =3D "\
>      acpid \
> -    libacpi "
> +    libacpi \
> +    "
>=20
>  SUMMARY_packagegroup-base-apm =3D "APM support"
>  RDEPENDS_packagegroup-base-apm =3D "\
>      ${VIRTUAL-RUNTIME_apm} \
> -    apmd"
> +    apmd \
> +    "
>=20
>  SUMMARY_packagegroup-base-ext2 =3D "ext2 filesystem support"
>  RDEPENDS_packagegroup-base-ext2 =3D "\
>      hdparm \
>      e2fsprogs \
>      e2fsprogs-e2fsck \
> -    e2fsprogs-mke2fs"
> +    e2fsprogs-mke2fs \
> +    "
>=20
>  SUMMARY_packagegroup-base-vfat =3D "FAT filesystem support"
>  RRECOMMENDS_packagegroup-base-vfat =3D "\
> @@ -173,17 +178,20 @@ RRECOMMENDS_packagegroup-base-vfat =3D "\
>      kernel-module-vfat \
>      kernel-module-nls-iso8859-1 \
>      kernel-module-nls-cp437 \
> -    dosfstools"
> +    dosfstools \
> +    "
>=20
>  SUMMARY_packagegroup-base-alsa =3D "ALSA sound support"
>  RDEPENDS_packagegroup-base-alsa =3D "\
>      alsa-utils-alsactl \
>      alsa-utils-alsamixer \
> -    ${VIRTUAL-RUNTIME_alsa-state}"
> +    ${VIRTUAL-RUNTIME_alsa-state} \
> +    "
>=20
>  RRECOMMENDS_packagegroup-base-alsa =3D "\
>      kernel-module-snd-mixer-oss \
> -    kernel-module-snd-pcm-oss"
> +    kernel-module-snd-pcm-oss \
> +    "
>=20
>  SUMMARY_packagegroup-base-pcmcia =3D "PC card slot support"
>  RDEPENDS_packagegroup-base-pcmcia =3D "\
> @@ -225,7 +233,8 @@ RRECOMMENDS_packagegroup-base-bluetooth =3D "\
>=20
>  SUMMARY_packagegroup-base-irda =3D "IrDA support"
>  RDEPENDS_packagegroup-base-irda =3D "\
> -    irda-utils"
> +    irda-utils \
> +    "
>=20
>  RRECOMMENDS_packagegroup-base-irda =3D "\
>      kernel-module-pxaficp-ir \
> @@ -238,7 +247,8 @@ RRECOMMENDS_packagegroup-base-irda =3D "\
>      kernel-module-irtty \
>      kernel-module-irtty-sir \
>      kernel-module-sir-dev \
> -    ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-=
ir-usb', '',d)} "
> +    ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-=
ir-usb', '',d)} \
> +    "
>=20
>  SUMMARY_packagegroup-base-usbgadget =3D "USB gadget support"
>  RRECOMMENDS_packagegroup-base-usbgadget =3D "\
> @@ -246,11 +256,13 @@ RRECOMMENDS_packagegroup-base-usbgadget =3D "\
>      kernel-module-gadgetfs \
>      kernel-module-g-file-storage \
>      kernel-module-g-serial \
> -    kernel-module-g-ether"
> +    kernel-module-g-ether \
> +    "
>=20
>  SUMMARY_packagegroup-base-usbhost =3D "USB host support"
>  RDEPENDS_packagegroup-base-usbhost =3D "\
> -    usbutils "
> +    usbutils \
> +    "
>=20
>  RRECOMMENDS_packagegroup-base-usbhost =3D "\
>      kernel-module-uhci-hcd \
> @@ -264,26 +276,30 @@ RRECOMMENDS_packagegroup-base-usbhost =3D "\
>      kernel-module-usbmouse \
>      kernel-module-mousedev \
>      kernel-module-usbserial \
> -    kernel-module-usb-storage "
> +    kernel-module-usb-storage \
> +    "
>=20
>  SUMMARY_packagegroup-base-ppp =3D "PPP dial-up protocol support"
>  RDEPENDS_packagegroup-base-ppp =3D "\
>      ppp \
> -    ppp-dialin"
> +    ppp-dialin \
> +    "
>=20
>  RRECOMMENDS_packagegroup-base-ppp =3D "\
>      kernel-module-ppp-async \
>      kernel-module-ppp-deflate \
>      kernel-module-ppp-generic \
>      kernel-module-ppp-mppe \
> -    kernel-module-slhc"
> +    kernel-module-slhc \
> +    "
>=20
>  SUMMARY_packagegroup-base-ipsec =3D "IPSEC support"
>  RDEPENDS_packagegroup-base-ipsec =3D "\
>      "
>=20
>  RRECOMMENDS_packagegroup-base-ipsec =3D "\
> -    kernel-module-ipsec"
> +    kernel-module-ipsec \
> +    "
>=20
>  #
>  # packagegroup-base-wifi contain everything needed to get WiFi working
> @@ -294,7 +310,8 @@ RDEPENDS_packagegroup-base-wifi =3D "\
>      wireless-tools \
>      ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'hostap-utils', =
'',d)} \
>      ${@bb.utils.contains('COMBINED_FEATURES', 'pci', 'hostap-utils', '',=
d)} \
> -    wpa-supplicant"
> +    wpa-supplicant \
> +    "
>=20
>  RRECOMMENDS_packagegroup-base-wifi =3D "\
>      ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-=
zd1211rw', '',d)} \
> @@ -308,59 +325,72 @@ RRECOMMENDS_packagegroup-base-wifi =3D "\
>      kernel-module-cryptomgr \
>      kernel-module-michael-mic \
>      kernel-module-aes-generic \
> -    kernel-module-aes"
> +    kernel-module-aes \
> +    "
>=20
>  SUMMARY_packagegroup-base-nfc =3D "Near Field Communication support"
>  RDEPENDS_packagegroup-base-nfc =3D "\
> -    neard"
> +    neard \
> +    "
>=20
>  RRECOMMENDS_packagegroup-base-nfc =3D "\
> -    kernel-module-nfc"
> +    kernel-module-nfc \
> +    "
>=20
>  SUMMARY_packagegroup-base-3g =3D "Cellular data support"
>  RDEPENDS_packagegroup-base-3g =3D "\
> -    ofono"
> +    ofono \
> +    "
>=20
>  RRECOMMENDS_packagegroup-base-3g =3D "\
>      kernel-module-cdc-acm \
> -    kernel-module-cdc-wdm"
> +    kernel-module-cdc-wdm \
> +    "
>=20
>  SUMMARY_packagegroup-base-smbfs =3D "SMB network filesystem support"
>  RRECOMMENDS_packagegroup-base-smbfs =3D "\
>      kernel-module-cifs \
> -    kernel-module-smbfs"
> +    kernel-module-smbfs \
> +    "
>=20
>  SUMMARY_packagegroup-base-cramfs =3D "cramfs filesystem support"
>  RRECOMMENDS_packagegroup-base-cramfs =3D "\
> -    kernel-module-cramfs"
> +    kernel-module-cramfs \
> +    "
>=20
>  #
>  # packagegroup-base-nfs provides ONLY client support - server is in nfs-=
utils package
>  #
>  SUMMARY_packagegroup-base-nfs =3D "NFS network filesystem support"
>  RDEPENDS_packagegroup-base-nfs =3D "\
> -    rpcbind"
> +    rpcbind \
> +    "
>=20
>  RRECOMMENDS_packagegroup-base-nfs =3D "\
> -    kernel-module-nfs "
> +    kernel-module-nfs \
> +    "
>=20
>  SUMMARY_packagegroup-base-zeroconf =3D "Zeroconf support"
>  RDEPENDS_packagegroup-base-zeroconf =3D "\
>      libnss-mdns \
> -    avahi-daemon"
> +    avahi-daemon \
> +    "
>=20
>  SUMMARY_packagegroup-base-ipv6 =3D "IPv6 support"
>  RDEPENDS_packagegroup-base-ipv6 =3D "\
>      "
>=20
>  RRECOMMENDS_packagegroup-base-ipv6 =3D "\
> -    kernel-module-ipv6 "
> +    kernel-module-ipv6 \
> +    "
>=20
>  SUMMARY_packagegroup-base-serial =3D "Serial port support"
>  RDEPENDS_packagegroup-base-serial =3D "\
>      setserial \
> -    lrzsz "
> +    lrzsz \
> +    "
>=20
>  SUMMARY_packagegroup-base-phone =3D "Cellular telephony (voice) support"
>  RDEPENDS_packagegroup-base-phone =3D "\
> -    ofono"
> +    ofono \
> +    "
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/=
meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> index 09f5373..5f080be 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> @@ -41,7 +41,9 @@ RDEPENDS_${PN} =3D "\
>      ${VIRTUAL-RUNTIME_init_manager} \
>      ${VIRTUAL-RUNTIME_dev_manager} \
>      ${VIRTUAL-RUNTIME_update-alternatives} \
> -    ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
> +    ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS} \
> +    "
>=20
>  RRECOMMENDS_${PN} =3D "\
> -    ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS}"
> +    ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS} \
> +    "
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessen=
tial.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.=
bb
> index 74ed247..f0b7a41 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
> @@ -8,7 +8,7 @@ LICENSE =3D "MIT"
>=20
>  inherit packagegroup
>=20
> -RDEPENDS_packagegroup-core-buildessential =3D "\
> +RDEPENDS_${PN} =3D "\
>      autoconf \
>      automake \
>      binutils \
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/m=
eta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> index a544bbd..3d95f09 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> @@ -10,7 +10,7 @@ inherit packagegroup
>=20
>  #PACKAGEFUNCS =3D+ 'generate_sdk_pkgs'
>=20
> -RDEPENDS_packagegroup-core-sdk =3D "\
> +RDEPENDS_${PN} =3D "\
>      packagegroup-core-buildessential \
>      coreutils \
>      ccache \
> @@ -26,7 +26,7 @@ RDEPENDS_packagegroup-core-sdk =3D "\
>      file \
>      tcl"
>=20
> -RRECOMMENDS_packagegroup-core-sdk =3D "\
> +RRECOMMENDS_${PN} =3D "\
>      libgomp \
>      libgomp-dev"
>=20
> diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb =
b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> index f95ce77..5047e5c 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> @@ -10,27 +10,27 @@ LICENSE =3D "MIT"
>  inherit packagegroup
>=20
>  PACKAGES =3D "\
> -    packagegroup-self-hosted \
> -    packagegroup-self-hosted-debug \
> -    packagegroup-self-hosted-sdk \
> -    packagegroup-self-hosted-extended \
> -    packagegroup-self-hosted-graphics \
> -    packagegroup-self-hosted-host-tools \
> +    ${PN} \
> +    ${PN}-debug \
> +    ${PN}-sdk \
> +    ${PN}-extended \
> +    ${PN}-graphics \
> +    ${PN}-host-tools \
>      "
>=20
> -RDEPENDS_packagegroup-self-hosted =3D "\
> -    packagegroup-self-hosted-debug \
> -    packagegroup-self-hosted-sdk \
> -    packagegroup-self-hosted-extended \
> -    packagegroup-self-hosted-graphics \
> -    packagegroup-self-hosted-host-tools \
> +RDEPENDS_${PN} =3D "\
> +    ${PN}-debug \
> +    ${PN}-sdk \
> +    ${PN}-extended \
> +    ${PN}-graphics \
> +    ${PN}-host-tools \
>      "
>=20
>  # midori depends on webkit-gtk which could not build for mips64
>  MIDORI =3D "midori"
>  MIDORI_mips64 =3D ""
>=20
> -RDEPENDS_packagegroup-self-hosted-host-tools =3D "\
> +RDEPENDS_${PN}-host-tools =3D "\
>      connman \
>      connman-plugin-ethernet \
>      dhcp-client \
> @@ -51,7 +51,7 @@ RDEPENDS_packagegroup-self-hosted-host-tools =3D "\
>      screen \
>      "
>=20
> -RRECOMMENDS_packagegroup-self-hosted-host-tools =3D "\
> +RRECOMMENDS_${PN}-host-tools =3D "\
>      kernel-module-tun \
>      kernel-module-iptable-raw \
>      kernel-module-iptable-nat \
> @@ -60,7 +60,7 @@ RRECOMMENDS_packagegroup-self-hosted-host-tools =3D "\
>  	"
>=20
>  # glibc-utils: for rpcgen
> -RDEPENDS_packagegroup-self-hosted-sdk =3D "\
> +RDEPENDS_${PN}-sdk =3D "\
>      autoconf \
>      automake \
>      binutils \
> @@ -96,7 +96,7 @@ RDEPENDS_packagegroup-self-hosted-sdk =3D "\
>      sed \
>      "
>=20
> -RDEPENDS_packagegroup-self-hosted-debug =3D " \
> +RDEPENDS_${PN}-debug =3D " \
>      gdb \
>      gdbserver \
>      rsync \
> @@ -104,7 +104,7 @@ RDEPENDS_packagegroup-self-hosted-debug =3D " \
>      tcf-agent"
>=20
>=20
> -RDEPENDS_packagegroup-self-hosted-extended =3D "\
> +RDEPENDS_${PN}-extended =3D "\
>      bzip2 \
>      chkconfig \
>      chrpath \
> @@ -209,7 +209,7 @@ RDEPENDS_packagegroup-self-hosted-extended =3D "\
>      "
>=20
>=20
> -RDEPENDS_packagegroup-self-hosted-graphics =3D "\
> +RDEPENDS_${PN}-graphics =3D "\
>      builder \
>      libgl \
>      libgl-dev \
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-c=
mdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdl=
ine.bb
> index ad3f240..80ac3df 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.=
bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.=
bb
> @@ -10,14 +10,14 @@ LICENSE =3D "MIT"
>  inherit packagegroup
>=20
>  PACKAGES =3D "\
> -    packagegroup-core-full-cmdline \
> -    packagegroup-core-full-cmdline-libs \
> -    packagegroup-core-full-cmdline-utils \
> -    packagegroup-core-full-cmdline-extended \
> -    packagegroup-core-full-cmdline-dev-utils \
> -    packagegroup-core-full-cmdline-multiuser \
> -    packagegroup-core-full-cmdline-initscripts \
> -    packagegroup-core-full-cmdline-sys-services \
> +    ${PN} \
> +    ${PN}-libs \
> +    ${PN}-utils \
> +    ${PN}-extended \
> +    ${PN}-dev-utils \
> +    ${PN}-multiuser \
> +    ${PN}-initscripts \
> +    ${PN}-sys-services \
>      "
>=20
>  python __anonymous () {
> @@ -54,21 +54,21 @@ python __anonymous () {
>  }
>=20
>=20
> -RDEPENDS_packagegroup-core-full-cmdline =3D "\
> -    packagegroup-core-full-cmdline-libs \
> -    packagegroup-core-full-cmdline-utils \
> -    packagegroup-core-full-cmdline-extended \
> -    packagegroup-core-full-cmdline-dev-utils \
> -    packagegroup-core-full-cmdline-multiuser \
> -    packagegroup-core-full-cmdline-initscripts \
> -    packagegroup-core-full-cmdline-sys-services \
> +RDEPENDS_${PN} =3D "\
> +    ${PN}-libs \
> +    ${PN}-utils \
> +    ${PN}-extended \
> +    ${PN}-dev-utils \
> +    ${PN}-multiuser \
> +    ${PN}-initscripts \
> +    ${PN}-sys-services \
>      "
>=20
> -RDEPENDS_packagegroup-core-full-cmdline-libs =3D "\
> +RDEPENDS_${PN}-libs =3D "\
>      glib-2.0 \
>      "
>=20
> -RDEPENDS_packagegroup-core-full-cmdline-utils =3D "\
> +RDEPENDS_${PN}-utils =3D "\
>      bash \
>      acl \
>      attr \
> @@ -102,7 +102,7 @@ RDEPENDS_packagegroup-core-full-cmdline-utils =3D "\
>      zlib \
>      "
>=20
> -RDEPENDS_packagegroup-core-full-cmdline-extended =3D "\
> +RDEPENDS_${PN}-extended =3D "\
>      iproute2 \
>      iputils \
>      iptables \
> @@ -110,7 +110,7 @@ RDEPENDS_packagegroup-core-full-cmdline-extended =3D =
"\
>      openssl \
>      "
>=20
> -RDEPENDS_packagegroup-core-full-cmdline-dev-utils =3D "\
> +RDEPENDS_${PN}-dev-utils =3D "\
>      byacc \
>      diffutils \
>      m4 \
> @@ -122,7 +122,7 @@ VIRTUAL-RUNTIME_initscripts ?=3D "initscripts"
>  VIRTUAL-RUNTIME_init_manager ?=3D "sysvinit"
>  VIRTUAL-RUNTIME_login_manager ?=3D "busybox"
>  VIRTUAL-RUNTIME_syslog ?=3D "sysklogd"
> -RDEPENDS_packagegroup-core-full-cmdline-initscripts =3D "\
> +RDEPENDS_${PN}-initscripts =3D "\
>      ${VIRTUAL-RUNTIME_initscripts} \
>      ${VIRTUAL-RUNTIME_init_manager} \
>      ethtool \
> @@ -130,7 +130,7 @@ RDEPENDS_packagegroup-core-full-cmdline-initscripts =
=3D "\
>      ${VIRTUAL-RUNTIME_syslog} \
>      "
>=20
> -RDEPENDS_packagegroup-core-full-cmdline-multiuser =3D "\
> +RDEPENDS_${PN}-multiuser =3D "\
>      cracklib \
>      gzip \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libuser', '', d)} \
> @@ -138,7 +138,7 @@ RDEPENDS_packagegroup-core-full-cmdline-multiuser =3D=
 "\
>      sudo \
>      "
>=20
> -RDEPENDS_packagegroup-core-full-cmdline-sys-services =3D "\
> +RDEPENDS_${PN}-sys-services =3D "\
>      at \
>      bzip2 \
>      cronie \
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb=
 b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> index dd96fbe..dc7498f 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> @@ -167,7 +167,7 @@ RDEPENDS_packagegroup-core-lsb-core =3D "\
>      nspr \
>      libpng12 \
>      nss \
> -"
> +    "
>=20
>  SUMMARY_packagegroup-core-lsb-perl =3D "LSB Runtime Languages (Perl)"
>  DESCRIPTION_packagegroup-core-lsb-perl =3D "Packages required to support=
 libraries \
> @@ -179,7 +179,7 @@ RDEPENDS_packagegroup-core-lsb-perl =3D "\
>      perl-pod \
>      perl-dev \
>      perl-doc \
> -"
> +    "
>=20
>  SUMMARY_packagegroup-core-lsb-python =3D "LSB Runtime Languages (Python)"
>  DESCRIPTION_packagegroup-core-lsb-python =3D "Packages required to suppo=
rt libraries \
> @@ -188,7 +188,7 @@ RDEPENDS_packagegroup-core-lsb-python =3D "\
>      python \
>      python-modules \
>      python-misc \
> -"
> +    "
>=20
>  def get_libqt3(d):
>      if 'linuxstdbase' in d.getVar('DISTROOVERRIDES') or "":
> @@ -234,7 +234,7 @@ RDEPENDS_packagegroup-core-lsb-desktop =3D "\
>      libasound \
>      ${QT4PKGS} \
>      ${@get_libqt3(d)} \
> -"
> +    "
>=20
>  RDEPENDS_packagegroup-core-lsb-runtime-add =3D "\
>      ldd \
> @@ -258,7 +258,7 @@ RDEPENDS_packagegroup-core-lsb-runtime-add =3D "\
>      libfile-checktree-perl \
>      libi18n-collate-perl \
>      libpod-plainer-perl \
> -"
> +    "
>=20
>  PTH =3D "pth"
>  PTH_libc-uclibc =3D ""
> diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-direct=
fb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
> index 53dc0ae..d46a4b1 100644
> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
> @@ -8,10 +8,10 @@ inherit packagegroup
>  TOUCH =3D ' ${@bb.utils.contains("MACHINE_FEATURES", "touchscreen", "tsl=
ib tslib-calibrate tslib-tests", "",d)}'
>=20
>  RDEPENDS_${PN} =3D " \
> -		directfb \
> -		directfb-examples \
> -		pango \
> -		pango-modules \
> -		fontconfig \
> -		${TOUCH} \
> -"
> +    directfb \
> +    directfb-examples \
> +    pango \
> +    pango-modules \
> +    fontconfig \
> +    ${TOUCH} \
> +    "
> diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb b/me=
ta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
> index d7a457c..7325456 100644
> --- a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
> +++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
> @@ -10,43 +10,43 @@ inherit packagegroup
>  TOUCH =3D ' ${@bb.utils.contains("MACHINE_FEATURES", "touchscreen", "tsl=
ib tslib-calibrate tslib-tests", "",d)}'
>=20
>  RDEPENDS_${PN} =3D " \
> -	qt4-embedded \
> -	libqt-embedded3support4 \
> -	libqt-embeddedclucene4 \
> -	libqt-embeddedcore4 \
> -	libqt-embeddeddbus4 \
> -	libqt-embeddedgui4 \
> -	libqt-embeddedhelp4 \
> -	libqt-embeddedmultimedia4 \
> -	libqt-embeddednetwork4 \
> -	libqt-embeddedscript4 \
> -	libqt-embeddedscripttools4 \
> -	libqt-embeddedsql4 \
> -	libqt-embeddedsvg4 \
> -	libqt-embeddedtest4 \
> -	libqt-embeddedwebkit4 \
> -	libqt-embeddedxml4 \
> -	qt4-embedded-fonts-ttf-dejavu \
> -	qt4-embedded-fonts-ttf-vera \
> -	qt4-embedded-plugin-iconengine-svgicon \
> -	qt4-embedded-plugin-imageformat-gif \
> -	qt4-embedded-plugin-imageformat-ico \
> -	qt4-embedded-plugin-imageformat-jpeg \
> -	qt4-embedded-plugin-imageformat-mng \
> -	qt4-embedded-plugin-imageformat-svg \
> -	qt4-embedded-plugin-imageformat-tiff \
> -	qt4-embedded-plugin-mousedriver-tslib \
> -	qt4-embedded-plugin-phonon-backend-gstreamer \
> -	qt4-embedded-plugin-script-dbus \
> -	qt4-embedded-plugin-sqldriver-sqlite \
> -	${TOUCH} \
> -        qt4-embedded-demos \
> -        qt4-embedded-examples \
> -        qt-demo-init \
> -        qt4-embedded-assistant \
> -"
> +    qt4-embedded \
> +    libqt-embedded3support4 \
> +    libqt-embeddedclucene4 \
> +    libqt-embeddedcore4 \
> +    libqt-embeddeddbus4 \
> +    libqt-embeddedgui4 \
> +    libqt-embeddedhelp4 \
> +    libqt-embeddedmultimedia4 \
> +    libqt-embeddednetwork4 \
> +    libqt-embeddedscript4 \
> +    libqt-embeddedscripttools4 \
> +    libqt-embeddedsql4 \
> +    libqt-embeddedsvg4 \
> +    libqt-embeddedtest4 \
> +    libqt-embeddedwebkit4 \
> +    libqt-embeddedxml4 \
> +    qt4-embedded-fonts-ttf-dejavu \
> +    qt4-embedded-fonts-ttf-vera \
> +    qt4-embedded-plugin-iconengine-svgicon \
> +    qt4-embedded-plugin-imageformat-gif \
> +    qt4-embedded-plugin-imageformat-ico \
> +    qt4-embedded-plugin-imageformat-jpeg \
> +    qt4-embedded-plugin-imageformat-mng \
> +    qt4-embedded-plugin-imageformat-svg \
> +    qt4-embedded-plugin-imageformat-tiff \
> +    qt4-embedded-plugin-mousedriver-tslib \
> +    qt4-embedded-plugin-phonon-backend-gstreamer \
> +    qt4-embedded-plugin-script-dbus \
> +    qt4-embedded-plugin-sqldriver-sqlite \
> +    ${TOUCH} \
> +    qt4-embedded-demos \
> +    qt4-embedded-examples \
> +    qt-demo-init \
> +    qt4-embedded-assistant \
> +    "
>=20
>  RRECOMMENDS_${PN} =3D " \
> -	libqt-embeddedxmlpatterns4 \
> -"
> +    libqt-embeddedxmlpatterns4 \
> +    "
>=20
> diff --git a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-targ=
et.bb b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
> index 0e7c800..53b7af4 100644
> --- a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
> +++ b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
> @@ -5,7 +5,7 @@ QTLIBPREFIX =3D ""
>  require packagegroup-qt-toolchain-target.inc
>=20
>  RDEPENDS_${PN} +=3D " \
> -        qt4-x11-free-dev \
> -        ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'libqtopengl4-=
dev', '', d)} \
> -        ${@bb.utils.contains('DISTRO_FEATURES', 'openvg', 'libqtopenvg4-=
dev', '', d)} \
> -        "
> +    qt4-x11-free-dev \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'libqtopengl4-dev'=
, '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'openvg', 'libqtopenvg4-dev'=
, '', d)} \
> +    "
>=20
> rday
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mvpLiMfbWzRoNl4x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSsKEUACgkQN1Ujt2V2gBxMuwCffHVm6ZkNNGHU+FHhRb44VPIq
eG0AniLiBNs5MYD3urkRt6I+kWKaiwcl
=gCWk
-----END PGP SIGNATURE-----

--mvpLiMfbWzRoNl4x--
