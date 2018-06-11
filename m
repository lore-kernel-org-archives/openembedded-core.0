Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0393F78AAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 09:56:39 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id w9-v6so17555875otj.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 02:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XsMtFHygmrjrTBq7g9suz9FtrRRe480Ek66Hf8pVSD4=;
	b=uiVhf1hFpvCvUIwHxcAiaExOu1Blw6yshz4Vq8daB1o22t6hysn89xKGBHP2CLPLWF
	2XJekyoiWCo4AAEN3fz8HyL7nKM2h8M6495+gy+KxVwp08WX64i9eeidoTeqUlEEz4Oy
	PlvuTbuJjpPoBJSRKCCvb+fWH0Rm8lKORN0e3Hm5qznoBnxmAVUgMMtkCCLjWKZrBF3c
	v2KUHSpFwlvwZzdhbUDU/PQ4u0c+SFPhqGvtCyOW1V1Glwxa4Z/vr8+pgQIz4D+tgmD2
	PLfLTvBch0mu85HuIhOf85eV03PlT+NyGnoCA4WjdREK0L5gyQhEpnMWZVsNY6mjXfmR
	zVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XsMtFHygmrjrTBq7g9suz9FtrRRe480Ek66Hf8pVSD4=;
	b=eJWlC5fUjmRgTt0MLkwq4+d/P7qwtCXaOkEOpN8iJh01ViVfhdign+vd8wHL516Br4
	DwNnfOxFHRM3hsWAa1auBEPpWvuOhdCB0RvLDYVOwhV/9u/U8O3nG5jmhs3JEtktog61
	V8eapxemmqUReI+qIhbq3XUe9IspvEAnkd7cAuD9PV+DTImtmbmIBiMWxkCAjGt+oRh1
	I2tXZ8bGjlUEN9Qhm+FHFA1aRHgGEN3fGER/uQtJdAFzaLgf99z3hAGMXnBo8zuh+d8S
	bjEFY7MYcFhOvACpvL9kQRqPHO+YxbK4LcvfIb58TjF/jGVLJtgTIbwXnKu9nqzcWtFC
	fkUw==
X-Gm-Message-State: APt69E2MBdquh1MXdtSVTtSMjDTvzTKiEoatoFMjLrUJzOj2yHuIsJnG
	NDu0RHajL2B+R1D2cLkHzpT2evqFyLvVirT0LcHfTw==
X-Google-Smtp-Source: ADUXVKLLnMGpnYOyaJRQbzRZm7GO1vUY+8ewxKP2GQvca6wV0eylPPawsuztMbgOlzlmyZhVvXP1DlHWSK0t9JOLqYc=
X-Received: by 2002:a9d:1553:: with SMTP id
	z19-v6mr8779943otz.135.1528711000852; 
	Mon, 11 Jun 2018 02:56:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 02:56:20
	-0700 (PDT)
In-Reply-To: <1527502858-81691-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1527502858-81691-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Jun 2018 10:56:20 +0100
Message-ID: <CAJTo0LZVcc+_ocfuYEUBKK0Hbr0SaZEH7CUYKK17gMk+CXwxwg@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta-toolchain: Added dnf-nativesdk into cross-development toolchain.
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
X-List-Received-Date: Mon, 11 Jun 2018 09:56:40 -0000
Content-Type: text/plain; charset="UTF-8"

Please split this up into multiple patches: slang, libnewt, etc.  Also
what's the use-case for using a nativesdk-dnf?  How is that useful?

Ross

On 28 May 2018 at 11:20, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:
> To make dnf work on cross-development environment.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta/classes/toolchain-scripts.bbclass             |  1 +
>  .../nativesdk-packagegroup-sdk-host.bb             |  4 +++
>  meta/recipes-core/update-rc.d/update-rc.d_0.7.bb   |  2 +-
>  .../createrepo-c/createrepo-c_git.bb               |  7 ++++-
>  meta/recipes-devtools/file/file_5.32.bb            |  2 ++
>  meta/recipes-devtools/rpm/rpm_4.14.1.bb            | 34 ++++++++++++++++++----
>  .../newt/libnewt-python_0.52.20.bb                 |  2 +-
>  meta/recipes-extended/newt/libnewt_0.52.20.bb      |  2 +-
>  meta/recipes-extended/slang/slang_2.3.2.bb         |  2 +-
>  9 files changed, 46 insertions(+), 10 deletions(-)
>
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index 71da5e5..58dd00e 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -97,6 +97,7 @@ toolchain_shared_env_script () {
>         echo 'export CPPFLAGS="${TARGET_CPPFLAGS}"' >> $script
>         echo 'export KCFLAGS="--sysroot=$SDKTARGETSYSROOT"' >> $script
>         echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
> +        echo 'export MACHINE_ARCH=${MACHINE_ARCH}' >> $script
>         echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
>         echo 'export ARCH=${ARCH}' >> $script
>         echo 'export CROSS_COMPILE=${TARGET_PREFIX}' >> $script
> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> index e2f6169..1370a82 100644
> --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> @@ -25,6 +25,10 @@ RDEPENDS_${PN} = "\
>      nativesdk-cmake \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland', '', d)} \
>      nativesdk-sdk-provides-dummy \
> +    nativesdk-libnewt-python \
> +    nativesdk-createrepo-c \
> +    nativesdk-gpgme \
> +    nativesdk-update-rc.d \
>      "
>
>  RDEPENDS_${PN}_darwin = "\
> diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
> index 76d4312..d3d3e2f 100644
> --- a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
> +++ b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
> @@ -30,4 +30,4 @@ do_install() {
>         install -m 0755 ${S}/update-rc.d ${D}${sbindir}/update-rc.d
>  }
>
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
> index 3176136..9be9f9e 100644
> --- a/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
> +++ b/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
> @@ -21,7 +21,7 @@ inherit cmake pkgconfig bash-completion distutils3-base
>
>  EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
>
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"
>
>  # Direct createrepo to read rpm configuration from our sysroot, not the one it was compiled in
>  do_install_append_class-native() {
> @@ -29,3 +29,8 @@ do_install_append_class-native() {
>                  RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm
>  }
>
> +do_install_append_class-nativesdk() {
> +        create_wrapper ${D}/${bindir}/createrepo_c \
> +                RPM_CONFIGDIR=${SDKPATHNATIVE}${libdir_nativesdk}/rpm
> +        rm -rf ${D}/etc
> +}
> diff --git a/meta/recipes-devtools/file/file_5.32.bb b/meta/recipes-devtools/file/file_5.32.bb
> index 5e15925..9b13261 100644
> --- a/meta/recipes-devtools/file/file_5.32.bb
> +++ b/meta/recipes-devtools/file/file_5.32.bb
> @@ -43,6 +43,8 @@ do_install_append_class-nativesdk() {
>
>  BBCLASSEXTEND = "native nativesdk"
>  PROVIDES_append_class-native = " file-replacement-native"
> +PROVIDES_append_class-nativesdk = " file-replacement-nativesdk"
> +
>  # Don't use NATIVE_PACKAGE_PATH_SUFFIX as that hides libmagic from anyone who
>  # depends on file-replacement-native.
>  bindir_append_class-native = "/file-native"
> diff --git a/meta/recipes-devtools/rpm/rpm_4.14.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
> index d49530e..abcad9f 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.14.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
> @@ -50,6 +50,7 @@ S = "${WORKDIR}/git"
>
>  DEPENDS = "nss libarchive db file popt xz bzip2 dbus elfutils python3"
>  DEPENDS_append_class-native = " file-replacement-native bzip2-replacement-native"
> +DEPENDS_append_class-nativesdk = " file-replacement-nativesdk"
>
>  inherit autotools gettext pkgconfig python3native
>  export PYTHON_ABI
> @@ -67,6 +68,7 @@ EXTRA_OECONF_append_libc-musl = " --disable-nls"
>  # Disable dbus for native, so that rpm doesn't attempt to inhibit shutdown via session dbus even when plugins support is enabled.
>  # Also disable plugins by default for native.
>  EXTRA_OECONF_append_class-native = " --sysconfdir=/etc --localstatedir=/var --without-dbus --disable-plugins"
> +EXTRA_OECONF_append_class-nativesdk = " --sysconfdir=/etc --localstatedir=/var --without-dbus --disable-plugins"
>
>  BBCLASSEXTEND = "native nativesdk"
>
> @@ -77,7 +79,18 @@ ASNEEDED = ""
>
>  # Direct rpm-native to read configuration from our sysroot, not the one it was compiled in
>  # libmagic also has sysroot path contamination, so override it
> -do_install_append_class-native() {
> +add_native_or_sdk_wrapper(){
> +        if [ "$1" = "nativesdk" ]; then
> +                RPM_CONFIGDIR=${SDKPATHNATIVE}${libdir_nativesdk}/rpm
> +                RPM_ETCCONFIGDIR=${SDKPATHNATIVE}
> +                MAGIC=${SDKPATHNATIVE}${datadir_native}/misc/magic.mgc
> +
> +        else
> +                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm
> +                RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE}
> +                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc
> +        fi
> +
>          tools="\
>                  ${bindir}/rpm \
>                  ${bindir}/rpm2archive \
> @@ -93,16 +106,27 @@ do_install_append_class-native() {
>
>          for tool in $tools; do
>                  create_wrapper ${D}$tool \
> -                        RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
> -                        RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
> -                        MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
> +                        RPM_CONFIGDIR=${RPM_CONFIGDIR} \
> +                        RPM_ETCCONFIGDIR=${RPM_ETCCONFIGDIR} \
> +                        MAGIC=${MAGIC} \
>                          RPM_NO_CHROOT_FOR_SCRIPTS=1
>          done
>  }
>
> +do_install_append_class-native() {
> +       add_native_or_sdk_wrapper "native"
> +}
> +do_install_append_class-nativesdk() {
> +       add_native_or_sdk_wrapper "nativesdk"
> +}
> +
>  # Rpm's make install creates var/tmp which clashes with base-files packaging
>  do_install_append_class-target() {
> -    rm -rf ${D}/var
> +       rm -rf ${D}/var
> +}
> +
> +do_install_append_class-nativesdk() {
> +       rm -rf ${D}/var
>  }
>
>  do_install_append () {
> diff --git a/meta/recipes-extended/newt/libnewt-python_0.52.20.bb b/meta/recipes-extended/newt/libnewt-python_0.52.20.bb
> index 20369ef..433d184 100644
> --- a/meta/recipes-extended/newt/libnewt-python_0.52.20.bb
> +++ b/meta/recipes-extended/newt/libnewt-python_0.52.20.bb
> @@ -25,4 +25,4 @@ PACKAGES_remove = "whiptail"
>
>  FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/*"
>
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-extended/newt/libnewt_0.52.20.bb b/meta/recipes-extended/newt/libnewt_0.52.20.bb
> index 65ce70c..264ef3b 100644
> --- a/meta/recipes-extended/newt/libnewt_0.52.20.bb
> +++ b/meta/recipes-extended/newt/libnewt_0.52.20.bb
> @@ -51,4 +51,4 @@ do_compile_prepend() {
>
>  FILES_whiptail = "${bindir}/whiptail"
>
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-extended/slang/slang_2.3.2.bb b/meta/recipes-extended/slang/slang_2.3.2.bb
> index 87fd41a..e53c432 100644
> --- a/meta/recipes-extended/slang/slang_2.3.2.bb
> +++ b/meta/recipes-extended/slang/slang_2.3.2.bb
> @@ -78,4 +78,4 @@ FILES_${PN} += "${libdir}/${BPN}/v2/modules/ ${datadir}/slsh/"
>  PARALLEL_MAKE = ""
>  PARALLEL_MAKEINST = ""
>
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

