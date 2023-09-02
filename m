Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC7DCA0FF6
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 06:54:12 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.4084.1693637641751742369
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 23:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KywB8c71;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4ff9b389677so4408093e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 23:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693637640; x=1694242440; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trEQQau6fgMy0JSUNnumq1VM4hO5Di5cdxFV3smZ+rE=;
        b=KywB8c717qiFqaoZsiTs1dmciasnwWmSjBV1Wf7/6f7uYMDins5evnmbNxMJ6cqUvo
         K+NcA6IIxrn7KFbajiGZnIHriuzi0YrTPeAM6ixPUo2+2gnq3aqgmetrZjQWlmqYj9Vz
         1keWhzVZEach5dd4HyN9AYEzFr/L4YEt8UfMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693637640; x=1694242440;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=trEQQau6fgMy0JSUNnumq1VM4hO5Di5cdxFV3smZ+rE=;
        b=eA6cDhBzO4l7+6HcsY+et/UsYncyIcs6pkuoDPX3Bto6+G78Iew773z5n7XWzCluN7
         gILWOYpsmR0/e+WhbBs3aUyPYVYYueTInwJik0l+UKKIasUoUrNhcbfNZtPTZ0x5e0MK
         EC5+uPN5ROOpQyt1YRpU/Gmm45abLomuWOkUlSZUwC6a2ksKRuRfaj8GvNdTGNr0rb7Q
         i/nWwt+juBihDBDTwpTUgerJL6gN/W3dlzdjkh3w2K/7EoAxP9dWg1Uu1zvfPqaMAKgf
         zTGXGW0RAXPqp+noiAp1e7AXDO31DHo0+SyRmvJCF1YWOm22f/DTLNw9JJBo85PsChOc
         3Hzg==
X-Gm-Message-State: AOJu0YxHSCo4mIttba+nFSgMjjWRUGacy3PeHmb+BZIX/Ke9IGme7kqd
	4ZbaDLv9dprZAI/P9hb/CSyOAQ==
X-Google-Smtp-Source: AGHT+IEk8ycgTl/9D7rbGazQ/eWVDB3Npq7liQF1FO7Lku/xwqkN342UGjGC2a0TE8VeaZyIF2XBzA==
X-Received: by 2002:a05:6512:1092:b0:4fb:745e:dd01 with SMTP id j18-20020a056512109200b004fb745edd01mr3831977lfg.45.1693637639349;
        Fri, 01 Sep 2023 23:53:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bb30:48fe:2031:d024? ([2001:8b0:aba:5f3c:bb30:48fe:2031:d024])
        by smtp.gmail.com with ESMTPSA id z8-20020a05600c220800b003ff3b964a9asm10235269wml.39.2023.09.01.23.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 23:53:58 -0700 (PDT)
Message-ID: <141c44bea4477d552aa4fc0371094b8ad4dc65b5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] uki: Add support for building Unified Kernel
 Images
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michelle Lin <michelle.linto91@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 02 Sep 2023 07:53:57 +0100
In-Reply-To: <20230901233231.1109712-1-michelle.linto91@gmail.com>
References: <20230901233231.1109712-1-michelle.linto91@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 06:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187021

On Fri, 2023-09-01 at 23:32 +0000, Michelle Lin wrote:
> Currently, there is not a class to support the building of unified kernel
> images. Adding a uki.bbclass to support the creation of UKIs. This class =
calls
> the systemd Ukify tool, which will combine the kernel/initrd/stub compone=
nts to
> build the UKI. To sign the UKI (i.e. SecureBoot, TPM PCR signing), the ke=
ys/cert
> files are to be specified in a separate configuration file, and the path =
to the
> file is passed to the Ukify tool. UKIs are supported by UEFI and can impr=
ove
> security through predicted TPM PCR states, and reduce the build burden du=
e to
> its single PE binary format.
>=20
> Signed-off-by: Michelle Lin <michelle.linto91@gmail.com>
> ---
>  meta/classes/uki.bbclass                 | 140 +++++++++++++++++++++++
>  meta/recipes-core/systemd/systemd_254.bb |  23 ++++
>  2 files changed, 163 insertions(+)
>  create mode 100644 meta/classes/uki.bbclass
>=20
> diff --git a/meta/classes/uki.bbclass b/meta/classes/uki.bbclass
> new file mode 100644
> index 0000000000..2eff387c75
> --- /dev/null
> +++ b/meta/classes/uki.bbclass
> @@ -0,0 +1,140 @@
> +#
> +# Unified kernel image (UKI) class
> +#
> +#
> +# This bbclass is designed to repack an Overlake image as a UKI, to be b=
ooted on a qemuarm64 with SecureBoot
> +# signing and embedded with TPM PCR measurements.
> +#
> +# The UKI is composed by:
> +#   - an UEFI stub
> +#     The linux kernel can generate a UEFI stub, however the one from sy=
stemd-boot can fetch
> +#     the command line from a separate section of the EFI application, a=
voiding the need to
> +#     rebuild the kernel.
> +#   - the kernel
> +#   - an initramfs
> +#   - other metadata (e.g. PCR measurements)
> +#
> +#
> +#
> +
> +# List build time dependencies
> +DEPENDS +=3D "systemd-native \
> +            sbsigntool-native \
> +            virtual/${TARGET_PREFIX}binutils \
> +            "
> +
> +REQUIRED_DISTRO_FEATURES +=3D "usrmerge systemd"
> +
> +inherit features_check
> +require ../conf/image-uefi.conf
> +
> +INITRD_IMAGE ?=3D "core-image-minimal-initramfs"
> +
> +INITRD_LIVE ?=3D "${@ ('${DEPLOY_DIR_IMAGE}/' + d.getVar('INITRD_IMAGE')=
 + '-${MACHINE}.cpio.gz') if d.getVar('INITRD_IMAGE') else ''}"
> +
> +UKI_CONFIG_FILE ?=3D "${WORKDIR}/core-image-minimal-uki.conf"
> +UKI_FILENAME ?=3D "${@ 'UKI.signed.efi' if d.getVar('UKI_CONFIG_FILE') e=
lse 'UKI.unsigned.efi'}"
> +
> +do_uki[depends] +=3D " \
> +                        systemd-boot:do_deploy \
> +                        virtual/kernel:do_deploy \
> +                     "
> +
> +# INITRD_IMAGE is added to INITRD_LIVE, which we use to create our initr=
d, so depend on it if it is set
> +# So we want to generate the initrd image if INITRD_IMAGE exists
> +do_uki[depends] +=3D "${@ '${INITRD_IMAGE}:do_image_complete' if d.getVa=
r('INITRD_IMAGE') else ''}"
> +
> +# ensure that the build directory is empty everytime we generate a newly=
-created uki
> +do_uki[cleandirs] =3D "${B}"
> +# influence the build directory at the start of the builds
> +do_uki[dirs] =3D "${B}"
> +
> +# we want to allow specifying files in SRC_URI, such as for signing the =
UKI
> +python () {
> +    d.delVarFlag("do_fetch","noexec")
> +    d.delVarFlag("do_unpack","noexec")
> +}
> +
> +# main task
> +python do_uki() {
> +    import glob
> +    import subprocess
> +
> +    # Construct the ukify command
> +    ukify_cmd =3D ("ukify build")
> +
> +    # Handle the creation of an initrd image by reading and concatenatin=
g multiple cpio files.=20
> +    # If the INITRD_LIVE variable is defined and not empty, it opens the=
 necessary files, reads their contents,=20
> +    # and constructs a list.
> +    if d.getVar('INITRD_LIVE'):
> +        initrd_list =3D ""
> +        for cpio in d.getVar('INITRD_LIVE').split():
> +            # get a list of initrds
> +            initrd_list +=3D cpio + ' '
> +       =20
> +        ukify_cmd +=3D " --initrd=3D%s" % initrd_list
> +    else:
> +        bb.fatal("ERROR - Required argument: INITRD")
> +   =20
> +    deploy_dir_image =3D d.getVar('DEPLOY_DIR_IMAGE')
> +  =20
> +    # Kernel
> +    if d.getVar('KERNEL_IMAGETYPE'):
> +        kernel =3D "%s/%s" % (deploy_dir_image, d.getVar('KERNEL_IMAGETY=
PE'))
> +        kernel_version =3D d.getVar('KERNEL_VERSION')
> +        if not os.path.exists(kernel):
> +            bb.fatal(f"ERROR: cannot find {kernel}.")
> +
> +        ukify_cmd +=3D " --linux=3D%s --uname %s" % (kernel, kernel_vers=
ion)
> +    else:
> +        bb.fatal("ERROR - Required argument: KERNEL")
> +
> +    # Architecture
> +    target_arch =3D d.getVar('EFI_ARCH')
> +    ukify_cmd +=3D " --efi-arch %s" % target_arch
> +
> +    # Stub
> +    stub =3D "%s/linux%s.efi.stub" % (deploy_dir_image, target_arch)
> +    if not os.path.exists(stub):
> +        bb.fatal(f"ERROR: cannot find {stub}.")
> +    ukify_cmd +=3D " --stub %s" % stub
> +
> +    # Add option for dtb
> +    if d.getVar('KERNEL_DEVICETREE'):
> +        first_dtb =3D d.getVar('KERNEL_DEVICETREE').split()[0]
> +        dtb_path =3D "%s/%s" % (deploy_dir_image, first_dtb)
> +
> +        if not os.path.exists(dtb_path):
> +            bb.fatal(f"ERROR: cannot find {dtb_path}.")
> +
> +        ukify_cmd +=3D " --devicetree %s" % dtb_path
> +
> +    # Add option to pass a config file to sign the UKI.
> +    if os.path.exists(d.getVar('UKI_CONFIG_FILE')):
> +        ukify_cmd +=3D " --config=3D%s" % d.getVar('UKI_CONFIG_FILE')
> +        ukify_cmd +=3D " --tools=3D%s%s/lib/systemd/tools" % (d.getVar("=
RECIPE_SYSROOT_NATIVE"), d.getVar("prefix"))
> +        bb.note("Pulling keys from config file")
> +    else:=20
> +        bb.note("Generating unsigned UKI")
> +
> +    # Custom UKI name
> +    output =3D " --output=3D%s" % d.getVar('UKI_FILENAME')
> +    ukify_cmd +=3D " %s" % output
> +
> +    # Set env to determine where bitbake should look for dynamic librari=
es
> +    env =3D os.environ.copy() # get the env variables
> +    env['LD_LIBRARY_PATH'] =3D d.expand("${RECIPE_SYSROOT_NATIVE}/usr/li=
b/systemd:${LD_LIBRARY_PATH}")
> +   =20
> +    # Run the ukify command
> +    subprocess.check_call(ukify_cmd, env=3Denv, shell=3DTrue)
> +}
> +=20
> +inherit deploy
> +
> +do_deploy () {
> +    # Copy generated UKI into DEPLOYDIR
> +	install ${B}/${UKI_FILENAME} ${DEPLOYDIR}
> +}
> +
> +addtask uki before do_deploy do_image after do_rootfs
> +addtask deploy before do_build after do_compile
> \ No newline at end of file
> diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes-core=
/systemd/systemd_254.bb
> index 8d5cf13095..65f132abb8 100644
> --- a/meta/recipes-core/systemd/systemd_254.bb
> +++ b/meta/recipes-core/systemd/systemd_254.bb
> @@ -6,6 +6,9 @@ PE =3D "1"
> =20
>  DEPENDS =3D "intltool-native gperf-native libcap util-linux python3-jinj=
a2-native"
> =20
> +# The Ukify tool requires this module
> +DEPENDS:append:class-native =3D " python3-pefile-native"

Do we need to add this to OE-Core? I think this will cause current
builds to fail?

> +
>  SECTION =3D "base/shell"
> =20
>  inherit useradd pkgconfig meson perlnative update-rc.d update-alternativ=
es qemu systemd gettext bash-completion manpages features_check
> @@ -18,6 +21,8 @@ REQUIRED_DISTRO_FEATURES +=3D "usrmerge"
>  # that we don't build both udev and systemd in world builds.
>  REQUIRED_DISTRO_FEATURES +=3D "systemd"
> =20
> +REQUIRED_DISTRO_FEATURES:class-native =3D ""
> +
>  SRC_URI +=3D " \
>             file://touchscreen.rules \
>             file://00-create-volatile.conf \
> @@ -120,6 +125,8 @@ PACKAGECONFIG:remove:libc-musl =3D " \
>  # https://github.com/seccomp/libseccomp/issues/347
>  PACKAGECONFIG:remove:mipsarch =3D "seccomp"
> =20
> +PACKAGECONFIG:class-native =3D "serial-getty-generator openssl tpm2 efi"
> +
>  TARGET_CC_ARCH:append:libc-musl =3D " -D__UAPI_DEF_ETHHDR=3D0 -D_LARGEFI=
LE64_SOURCE"
> =20
>  # Some of the dependencies are weak-style recommends - if not available =
at runtime,
> @@ -260,6 +267,9 @@ EXTRA_OEMESON +=3D "-Dkexec-path=3D${sbindir}/kexec \
>                    -Dloadkeys-path=3D${bindir}/loadkeys \
>                    -Dsetfont-path=3D${bindir}/setfont"
> =20
> +EXTRA_OEMESON:append:class-native =3D " -Dbootloader=3Dtrue \
> +                                      -Dman=3Dfalse \
> +                                    "
>  # The 60 seconds is watchdog's default vaule.
>  WATCHDOG_TIMEOUT ??=3D "60"
> =20
> @@ -380,6 +390,14 @@ do_install() {
>      fi
>  }
> =20
> +do_install:class-native() {
> +	meson_do_install
> +	install -d ${D}${bindir}
> +	install -m 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
> +	install -d ${D}${prefix}/lib/systemd/tools
> +	install -m 0755 ${B}/systemd-measure ${D}${prefix}/lib/systemd/tools
> +}
> +
>  python populate_packages:prepend (){
>      systemdlibdir =3D d.getVar("rootlibdir")
>      do_split_packages(d, systemdlibdir, r'^lib(.*)\.so\.*', 'lib%s', 'Sy=
stemd %s library', extra_depends=3D'', allow_links=3DTrue)
> @@ -702,6 +720,9 @@ RRECOMMENDS:${PN} +=3D "systemd-extra-utils \
>                        ${@bb.utils.contains('PACKAGECONFIG', 'logind', 'p=
am-plugin-umask', '', d)} \
>  "
> =20
> +RRECOMMENDS:${PN}:class-native =3D ""
> +RDEPENDS:${PN}:class-native =3D ""
> +
>  INSANE_SKIP:${PN} +=3D "dev-so libdir"
>  INSANE_SKIP:${PN}-dbg +=3D "libdir"
>  INSANE_SKIP:${PN}-doc +=3D " libdir"
> @@ -852,3 +873,5 @@ pkg_postinst:udev-hwdb () {
>  pkg_prerm:udev-hwdb () {
>  	rm -f $D${sysconfdir}/udev/hwdb.bin
>  }
> +
> +BBCLASSEXTEND +=3D "native"

We've long avoided a systemd-native recipe as the meaning can be easily
confused and I'm not thrilled to be adding one now.

Perhaps this should be as a separate systemd-tools-native recipe to
make it clear this isn't full systemd?

How much of systemd does this recipe compile?

Cheers,

Richard



