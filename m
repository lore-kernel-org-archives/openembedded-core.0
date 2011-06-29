Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbvVT-0006fP-6Q
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 16:12:43 +0200
Received: by wyg30 with SMTP id 30so996681wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 07:08:57 -0700 (PDT)
Received: by 10.216.81.4 with SMTP id l4mr1885445wee.15.1309356536837;
	Wed, 29 Jun 2011 07:08:56 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ge4sm938992wbb.13.2011.06.29.07.08.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Jun 2011 07:08:56 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308664747-32727-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 29 Jun 2011 16:08:55 +0200
Message-Id: <81D1B09E-289B-4D7D-A90B-AB08B101E415@dominion.thruhere.net>
References: <1308664747-32727-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] linux-libc-headers: add 2.6.39
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
X-List-Received-Date: Wed, 29 Jun 2011 14:12:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

ping=20

Op 21 jun 2011, om 15:59 heeft Koen Kooi het volgende geschreven:

> The 2.6.37.2 version is kept to allow the qemu kernels and libc =
headers version to match
> ---
> .../linux-libc-headers_2.6.39.bb                   |   49 =
++++++++++++++++++++
> 1 files changed, 49 insertions(+), 0 deletions(-)
> create mode 100644 =
meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb
>=20
> diff --git =
a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb =
b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb
> new file mode 100644
> index 0000000..65c19ec
> --- /dev/null
> +++ =
b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb
> @@ -0,0 +1,49 @@
> +require linux-libc-headers.inc
> +
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +DEPENDS +=3D "unifdef-native"
> +
> +SRC_URI +=3D " file://connector-msg-size-fix.patch"
> +SRC_URI[md5sum] =3D "1aab7a741abe08d42e8eccf20de61e05"
> +SRC_URI[sha256sum] =3D =
"584d17f2a3ee18a9501d7ff36907639e538cfdba4529978b8550c461d45c61f6"
> +
> +S =3D "${WORKDIR}/linux-${PV}"
> +
> +set_arch() {
> +	case ${TARGET_ARCH} in
> +		alpha*)   ARCH=3Dalpha ;;
> +		arm*)     ARCH=3Darm ;;
> +		cris*)    ARCH=3Dcris ;;
> +		hppa*)    ARCH=3Dparisc ;;
> +		i*86*)    ARCH=3Di386 ;;
> +		ia64*)    ARCH=3Dia64 ;;
> +		mips*)    ARCH=3Dmips ;;
> +		m68k*)    ARCH=3Dm68k ;;
> +		powerpc*) ARCH=3Dpowerpc ;;
> +		s390*)    ARCH=3Ds390 ;;
> +		sh*)      ARCH=3Dsh ;;
> +		sparc64*) ARCH=3Dsparc64 ;;
> +		sparc*)   ARCH=3Dsparc ;;
> +		x86_64*)  ARCH=3Dx86_64 ;;
> +		avr32*)   ARCH=3Davr32 ;;
> +		bfin*)    ARCH=3Dblackfin ;;
> +		microblaze*) ARCH=3Dmicroblaze ;;
> +	esac
> +}
> +
> +do_configure() {
> +	set_arch
> +	oe_runmake allnoconfig ARCH=3D$ARCH
> +}
> +
> +do_compile () {
> +}
> +
> +do_install() {
> +	set_arch
> +	oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_prefix} =
ARCH=3D$ARCH
> +	# Kernel should not be exporting this header
> +	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
> +}
> +
> +BBCLASSEXTEND =3D "nativesdk"
> --=20
> 1.6.6.1
>=20



