Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Qm2zW-0001X7-GA
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 14:13:34 +0200
Received: by yxi19 with SMTP id 19so665234yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 05:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=zPvelTXqaeB7adZwndwe616MRw2M9fsFAxQ7Tskqjt4=;
	b=fbgmKaaH7NxJ7YV7u9+nHZdxGrCHjpKsIUsw94q2Ixwk6i05mbzNn3y30ApyxsdLwu
	cnYZVXJyPFN/0LLm4mYezHG8DEgXUN0H5CkVveguudj47IcSa6B+w/xTn8+YjLMUpynO
	pguSmyf0iCLlhOfUslSbvKOJq5fV4zpvNxIlw=
MIME-Version: 1.0
Received: by 10.142.248.21 with SMTP id v21mr4372388wfh.42.1311768558869; Wed,
	27 Jul 2011 05:09:18 -0700 (PDT)
Received: by 10.142.141.2 with HTTP; Wed, 27 Jul 2011 05:09:18 -0700 (PDT)
In-Reply-To: <f37fcfa993314db58e3734ffb0de119f47e7e8a8.1311715727.git.mark.hatle@windriver.com>
References: <cover.1311715727.git.mark.hatle@windriver.com>
	<f37fcfa993314db58e3734ffb0de119f47e7e8a8.1311715727.git.mark.hatle@windriver.com>
Date: Wed, 27 Jul 2011 14:09:18 +0200
Message-ID: <CAAQYJAsq2XoXvsL9xgXM3g+gMALFxQunxfE97tm0+YsiGWhWYg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [v2 PATCH 5/8] linux-libc-headers: Fix file conflict -- ..install.cmd
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
X-List-Received-Date: Wed, 27 Jul 2011 12:13:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2011 at 11:31 PM, Mark Hatle <mark.hatle@windriver.com> wro=
te:
> The ..install.cmd conflicts between various configure runs.
>
> This isn't used anywhere, so remove it to avoid the conflict.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
> =A0.../linux-libc-headers-yocto_git.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A05 ++++-
> =A0.../linux-libc-headers_2.6.37.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A05 ++++-
> =A0.../linux-libc-headers_2.6.39.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A05 +++++
> =A03 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yo=
cto_git.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yoct=
o_git.bb
> index a9b041f..1c709cb 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git=
.bb
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git=
.bb
> @@ -10,7 +10,7 @@ RPROVIDES_${PN}-dev =3D "linux-libc-headers-dev"
> =A0RPROVIDES_${PN}-dbg =3D "linux-libc-headers-dbg"
> =A0SRCREV =3D "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
> =A0PV =3D "2.6.37+git-${SRCPV}"
> -PR =3D "r3"
> +PR =3D "r4"
>
> =A0SRCREV_FORMAT =3D "meta_machine"
> =A0SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=3D=
git;nocheckout=3D1;branch=3D${KBRANCH},meta;name=3Dmachine,meta"
> @@ -47,6 +47,9 @@ do_compile () {
> =A0do_install() {
> =A0 =A0 =A0 =A0set_arch
> =A0 =A0 =A0 =A0oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_p=
refix} ARCH=3D$ARCH
> +
> + =A0 =A0 =A0 =A0# The ..install.cmd conflicts between various configure =
runs
> + =A0 =A0 =A0 =A0find ${D}${includedir} -name ..install.cmd | xargs rm -f
> =A0}
>
> =A0BBCLASSEXTEND =3D "nativesdk"
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.=
6.37.2.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.3=
7.2.bb
> index 51c4926..55d7527 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.=
bb
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.=
bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>
> =A0INHIBIT_DEFAULT_DEPS =3D "1"
> =A0DEPENDS +=3D "unifdef-native"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI +=3D " file://connector-msg-size-fix.patch"
>
> @@ -43,6 +43,9 @@ do_install() {
> =A0 =A0 =A0 =A0oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_p=
refix} ARCH=3D$ARCH
> =A0 =A0 =A0 =A0# Kernel should not be exporting this header
> =A0 =A0 =A0 =A0rm -f ${D}${exec_prefix}/include/scsi/scsi.h
> +
> + =A0 =A0 =A0 # The ..install.cmd conflicts between various configure run=
s
> + =A0 =A0 =A0 find ${D}${includedir} -name ..install.cmd | xargs rm -f
> =A0}
>
> =A0BBCLASSEXTEND =3D "nativesdk"
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.=
6.39.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.=
bb
> index 65c19ec..14f5e8a 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb
> @@ -9,6 +9,8 @@ SRC_URI[sha256sum] =3D "584d17f2a3ee18a9501d7ff36907639e5=
38cfdba4529978b8550c461d4
>
> =A0S =3D "${WORKDIR}/linux-${PV}"
>
> +PR =3D "r2"
> +
> =A0set_arch() {
> =A0 =A0 =A0 =A0case ${TARGET_ARCH} in
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0alpha*) =A0 ARCH=3Dalpha ;;
> @@ -44,6 +46,9 @@ do_install() {
> =A0 =A0 =A0 =A0oe_runmake headers_install INSTALL_HDR_PATH=3D${D}${exec_p=
refix} ARCH=3D$ARCH
> =A0 =A0 =A0 =A0# Kernel should not be exporting this header
> =A0 =A0 =A0 =A0rm -f ${D}${exec_prefix}/include/scsi/scsi.h
> +
> + =A0 =A0 =A0 =A0# The ..install.cmd conflicts between various configure =
runs
> + =A0 =A0 =A0 =A0find ${D}${includedir} -name ..install.cmd | xargs rm -f
> =A0}
>
> =A0BBCLASSEXTEND =3D "nativesdk"
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Thanks for having fixed that.

I noticed two kinds of cruft while packaging: .install and ..install.cmd

       # remove Linux headers .install and ..install.cmd files
        find ${D}${base_libdir}/klibc/include -name '.install' -delete
        find ${D}${base_libdir}/klibc/include -name '..install.cmd' -delete

I'll check now after your patch.

Regards

Andrea


