Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id B3C6278898
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 13:30:59 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id n7so3446625ita.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 05:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jw8sIV4NJKiZ8bwxS3CXHfgYi691kmJjuRbLiutO5DE=;
	b=EFgbT2g1svuxgrvqWAVZLojlhRT1nsKpYj5dnTG96O7KXnqGBD03f5SZn8fIwpYyLw
	gAHkiX6iZRQ15EFuO8s02AjyzYHdUNygIBS443XkuqcGgAAhdmqEee7QIpzjtUUaE0Mf
	vP+BSTJeZ/D5dAer4HH7JA54XkqnUdjDOUTK/6VyWwQBO1K3HJjauvXyf8hf+mHpI7zT
	9zoWd8eo9QyTbr0MFXXyGSx8tTycmSwcIKXPBlB+9i7vwpR8qNlMYGkjHb+gklOYLS19
	ZcNaEKV9CSglpPVlLkmu9GLb2GDb9lUmvDjWur21f80RT6osbfkDYjwuE7oRMt5+Y2Xb
	3unQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jw8sIV4NJKiZ8bwxS3CXHfgYi691kmJjuRbLiutO5DE=;
	b=mTWgwXI4OCuuDtdPm7/e4wVuGrpLvfQfFh67j6Uuvo/tXn05wb9VVnWa3sAnpKnNso
	zeWTt568UX1ez6xv7guYD5jvnfc0IUovqFaeczj+OEcbO5/Rl9p+tHVjfk6HCGw6jRJg
	MXiq0TOO/+en3J69lZf3jR+caZjCf6TDcFc8z1rTddc8tJDf5uBKhM3yFfKr6a9xbDja
	Yf7/afvtGPzk3ue/BDNs7sDAqPCqUifEEOjPqi6UnT3mIVrBv05kz7apLragtWVWPZB/
	pnBBe6uTW4ztUChQrR+U4iXbs8LWDBo1de8evWavOUmophetauAO1lIRn69Pq8CqtSk+
	OSKw==
X-Gm-Message-State: APf1xPA2ZpgPQKemxxt4DPxBegKfkeMmfcdWHMI2nxt8NK+aJM185Xr5
	LQJ2AcOmj/XRu+iUlWVGc2EgXvLeRQq6HeY5yJSDdA==
X-Google-Smtp-Source: AH8x226qOOb2UsjCXXCYa8MFSTEzN+JlrPZqKO+w5LOLIKgAlL4FbCQarNZoB5zCDSNS2ibAfvno6XK042BB19PWCMI=
X-Received: by 10.36.185.24 with SMTP id w24mr20606216ite.127.1519824660575;
	Wed, 28 Feb 2018 05:31:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Wed, 28 Feb 2018 05:30:39 -0800 (PST)
In-Reply-To: <cc7b5c36944049bc5c69151a2d3c7adf242b04f5.1519797175.git.Qi.Chen@windriver.com>
References: <cover.1519797175.git.Qi.Chen@windriver.com>
	<cc7b5c36944049bc5c69151a2d3c7adf242b04f5.1519797175.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Feb 2018 13:30:39 +0000
Message-ID: <CAJTo0LZnOWoY4o_EiwkauLTYxTTa2UJa+2=Kzkm6cK1dv1ViYw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] systemd-boot: upgrade to 236
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
X-List-Received-Date: Wed, 28 Feb 2018 13:31:00 -0000
Content-Type: multipart/alternative; boundary="f403045d9a5003ceeb056645c18b"

--f403045d9a5003ceeb056645c18b
Content-Type: text/plain; charset="UTF-8"

ERROR: systemd-boot-236-r0 do_compile: Function failed: do_compile (log
file is located at
/data/poky-tmp/master/work/corei7-64-intel-common-poky-linux/systemd-boot/236-r0/temp/log.do_compile.10165)
ERROR: Logfile of failure stored in:
/data/poky-tmp/master/work/corei7-64-intel-common-poky-linux/systemd-boot/236-r0/temp/log.do_compile.10165
Log data follows:
| DEBUG: Executing shell function do_compile
|
/data/poky-tmp/master/work/corei7-64-intel-common-poky-linux/systemd-boot/236-r0/temp/run.do_compile.10165:
109: [: x86_64: unexpected operator
| ninja: error: unknown target 'src/boot/efi/systemd-bootia32.efi'

+       if [ "${TARGET_ARCH}" == "x86_64" ]; then

Remember that == is a bashism and the correct operator for [ is =.

(fix squashed here)

Ross

On 28 February 2018 at 05:56, Chen Qi <Qi.Chen@windriver.com> wrote:

> Upgrade systemd-boot to 236.
>
> As systemd has dropped autotools support, fix configure and compile
> failures related to meson.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd-boot_234.bb      | 43 ---------------
>  meta/recipes-core/systemd/systemd-boot_236.bb      | 49 +++++++++++++++++
>  .../systemd/0001-Also-check-i586-for-ia32.patch    | 28 ++++++++++
>  ...efi_cc-and-efi_ld-correctly-when-cross-co.patch | 62
> ++++++++++++++++++++++
>  4 files changed, 139 insertions(+), 43 deletions(-)
>  delete mode 100644 meta/recipes-core/systemd/systemd-boot_234.bb
>  create mode 100644 meta/recipes-core/systemd/systemd-boot_236.bb
>  create mode 100644 meta/recipes-core/systemd/
> systemd/0001-Also-check-i586-for-ia32.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_
> cc-and-efi_ld-correctly-when-cross-co.patch
>
> diff --git a/meta/recipes-core/systemd/systemd-boot_234.bb
> b/meta/recipes-core/systemd/systemd-boot_234.bb
> deleted file mode 100644
> index 88a14ac..0000000
> --- a/meta/recipes-core/systemd/systemd-boot_234.bb
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -require systemd.inc
> -FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
> -
> -DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
> -
> -SRC_URI += "file://0007-use-lnr-wrapper-instead-of-looking-for-
> relative-opti.patch"
> -
> -inherit autotools pkgconfig gettext
> -inherit deploy
> -
> -EFI_CC ?= "${CC}"
> -# Man pages are packaged through the main systemd recipe
> -EXTRA_OECONF = " --enable-gnuefi \
> -                 --with-efi-includedir=${STAGING_INCDIR} \
> -                 --with-efi-ldsdir=${STAGING_LIBDIR} \
> -                 --with-efi-libdir=${STAGING_LIBDIR} \
> -                 --disable-manpages \
> -                 EFI_CC='${EFI_CC}' \
> -               "
> -
> -# Imported from the old gummiboot recipe
> -TUNE_CCARGS_remove = "-mfpmath=sse"
> -COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
> -COMPATIBLE_HOST_x86-x32 = "null"
> -
> -do_compile() {
> -       SYSTEMD_BOOT_EFI_ARCH="ia32"
> -       if [ "${TARGET_ARCH}" = "x86_64" ]; then
> -               SYSTEMD_BOOT_EFI_ARCH="x64"
> -       fi
> -
> -       oe_runmake systemd-boot${SYSTEMD_BOOT_EFI_ARCH}.efi
> -}
> -
> -do_install() {
> -       # Bypass systemd installation with a NOP
> -       :
> -}
> -
> -do_deploy () {
> -       install ${B}/systemd-boot*.efi ${DEPLOYDIR}
> -}
> -addtask deploy before do_build after do_compile
> diff --git a/meta/recipes-core/systemd/systemd-boot_236.bb
> b/meta/recipes-core/systemd/systemd-boot_236.bb
> new file mode 100644
> index 0000000..1a0135a
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-boot_236.bb
> @@ -0,0 +1,49 @@
> +require systemd.inc
> +FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
> +
> +DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
> +
> +SRC_URI += "file://0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
> \
> +            file://0027-remove-nobody-user-group-checking.patch \
> +            file://0001-Also-check-i586-for-ia32.patch \
> +            file://0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
> \
> +            "
> +
> +inherit meson pkgconfig gettext
> +inherit deploy
> +
> +EFI_CC ?= "${CC}"
> +
> +EXTRA_OEMESON += "-Defi=true \
> +                  -Dgnu-efi=true \
> +                  -Defi-includedir=${STAGING_INCDIR}/efi \
> +                  -Defi-ldsdir=${STAGING_LIBDIR} \
> +                  -Defi-libdir=${STAGING_LIBDIR} \
> +                  -Dman=false \
> +                  -Defi-cc='${EFI_CC}' \
> +                  -Defi-ld='${LD}' \
> +                  "
> +
> +
> +# Imported from the old gummiboot recipe
> +TUNE_CCARGS_remove = "-mfpmath=sse"
> +COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
> +COMPATIBLE_HOST_x86-x32 = "null"
> +
> +do_compile() {
> +       SYSTEMD_BOOT_EFI_ARCH="ia32"
> +       if [ "${TARGET_ARCH}" == "x86_64" ]; then
> +               SYSTEMD_BOOT_EFI_ARCH="x64"
> +       fi
> +       ninja src/boot/efi/systemd-boot${SYSTEMD_BOOT_EFI_ARCH}.efi
> +}
> +
> +do_install() {
> +       # Bypass systemd installation with a NOP
> +       :
> +}
> +
> +do_deploy () {
> +       install ${B}/src/boot/efi/systemd-boot*.efi ${DEPLOYDIR}
> +}
> +addtask deploy before do_build after do_compile
> diff --git a/meta/recipes-core/systemd/systemd/0001-Also-check-i586-for-ia32.patch
> b/meta/recipes-core/systemd/systemd/0001-Also-check-i586-for-ia32.patch
> new file mode 100644
> index 0000000..892b25e
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-Also-check-i586-
> for-ia32.patch
> @@ -0,0 +1,28 @@
> +From 4616e6f228d2678420ee7d5bb1c8a0c8ebb27be8 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Tue, 27 Feb 2018 20:42:41 -0800
> +Subject: [PATCH] Also check i586 for ia32
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index ddc061c12..abd1261d6 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -1182,7 +1182,7 @@ conf.set10('SYSTEMD_SLOW_TESTS_DEFAULT',
> get_option('slow-tests'))
> + if get_option('efi')
> +         efi_arch = host_machine.cpu_family()
> +
> +-        if efi_arch == 'x86'
> ++        if efi_arch == 'x86' or efi_arch == 'i586'
> +                 EFI_MACHINE_TYPE_NAME = 'ia32'
> +                 gnu_efi_arch = 'ia32'
> +         elif efi_arch == 'x86_64'
> +--
> +2.13.0
> +
> diff --git a/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_
> cc-and-efi_ld-correctly-when-cross-co.patch b/meta/recipes-core/systemd/
> systemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
> new file mode 100644
> index 0000000..e2e19ba
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_
> cc-and-efi_ld-correctly-when-cross-co.patch
> @@ -0,0 +1,62 @@
> +From 527413ec243564a89ffaad6368d446de44415970 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Tue, 27 Feb 2018 21:42:23 -0800
> +Subject: [PATCH] Fix to run efi_cc and efi_ld correctly when
> cross-compiling
> +
> +When cross-compiling, efi_cc and efi_ld may take the form of
> +'xxx-gcc --sysroot=xxx', and this would cause run_command and
> +the alike fail.
> +
> +Fix to split them to make commands run correctly.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/boot/efi/meson.build | 16 +++++++++++++---
> + 1 file changed, 13 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
> +index 992a3ba4c..9f9ec4911 100644
> +--- a/src/boot/efi/meson.build
> ++++ b/src/boot/efi/meson.build
> +@@ -157,7 +157,7 @@ if have_gnu_efi
> +                 o_file = custom_target(file + '.o',
> +                                        input : file,
> +                                        output : file + '.o',
> +-                                       command : [efi_cc, '-c', '@INPUT@',
> '-o', '@OUTPUT@']
> ++                                       command : efi_cc.split() + ['-c',
> '@INPUT@', '-o', '@OUTPUT@']
> +                                                  + compile_args,
> +                                        depend_files : efi_headers)
> +                 if (common_sources + systemd_boot_sources).
> contains(file)
> +@@ -168,7 +168,17 @@ if have_gnu_efi
> +                 endif
> +         endforeach
> +
> +-        libgcc_file_name = run_command(efi_cc,
> '-print-libgcc-file-name').stdout().strip()
> ++        find_libgcc_cmd_all = efi_cc + ' -print-libgcc-file-name'
> ++        find_libgcc_cmd = find_libgcc_cmd_all.split()[0]
> ++        find_libgcc_args = []
> ++        cmd_args_all = find_libgcc_cmd_all.split()
> ++        foreach arg : cmd_args_all
> ++                if arg != find_libgcc_cmd
> ++                        find_libgcc_args += arg
> ++                endif
> ++        endforeach
> ++
> ++        libgcc_file_name = run_command(find_libgcc_cmd,
> find_libgcc_args).stdout().strip()
> +         systemd_boot_efi_name = 'systemd-boot@0@.efi'.format(
> EFI_MACHINE_TYPE_NAME)
> +         stub_efi_name = 'linux@0@.efi.stub'.format(
> EFI_MACHINE_TYPE_NAME)
> +         no_undefined_symbols = find_program('no-undefined-symbols.sh')
> +@@ -179,7 +189,7 @@ if have_gnu_efi
> +                         tuple[0],
> +                         input : tuple[2],
> +                         output : tuple[0],
> +-                        command : [efi_ld, '-o', '@OUTPUT@'] +
> ++                        command : efi_ld.split() + ['-o', '@OUTPUT@'] +
> +                                   efi_ldflags + tuple[2] +
> +                                   ['-lefi', '-lgnuefi',
> libgcc_file_name])
> +
> +--
> +2.13.0
> +
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045d9a5003ceeb056645c18b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>ERROR: systemd-boot-236-r0 do_compile: Function faile=
d: do_compile (log file is located at /data/poky-tmp/master/work/corei7-64-=
intel-common-poky-linux/systemd-boot/236-r0/temp/log.do_compile.10165)</div=
><div>ERROR: Logfile of failure stored in: /data/poky-tmp/master/work/corei=
7-64-intel-common-poky-linux/systemd-boot/236-r0/temp/log.do_compile.10165<=
/div><div>Log data follows:</div><div>| DEBUG: Executing shell function do_=
compile</div><div>| /data/poky-tmp/master/work/corei7-64-intel-common-poky-=
linux/systemd-boot/236-r0/temp/run.do_compile.10165: 109: [: x86_64: unexpe=
cted operator</div><div>| ninja: error: unknown target &#39;src/boot/efi/sy=
stemd-bootia32.efi&#39;</div><div><br></div><div><span style=3D"font-size:1=
2.800000190734863px">+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${TARGET_ARCH}&=
quot; =3D=3D &quot;x86_64&quot; ]; then</span><br style=3D"font-size:12.800=
000190734863px"></div><div><span style=3D"font-size:12.800000190734863px"><=
br></span></div><div><span style=3D"font-size:12.800000190734863px">Remembe=
r that =3D=3D is a bashism and the correct operator for [ is =3D.</span></d=
iv><div><span style=3D"font-size:12.800000190734863px"><br></span></div><di=
v><span style=3D"font-size:12.800000190734863px">(fix squashed here)</span>=
</div><div><span style=3D"font-size:12.800000190734863px"><br></span></div>=
<div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 28 February 2018 at 05:56, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"=
mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">Upgrade systemd-boot to =
236.<br>
<br>
As systemd has dropped autotools support, fix configure and compile<br>
failures related to meson.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd-boot_234.bb" rel=
=3D"noreferrer" target=3D"_blank">syst<wbr>emd-boot_234.bb</a>=C2=A0 =C2=A0=
 =C2=A0 | 43 ---------------<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd-boot_236.bb" rel=
=3D"noreferrer" target=3D"_blank">syst<wbr>emd-boot_236.bb</a>=C2=A0 =C2=A0=
 =C2=A0 | 49 +++++++++++++++++<br>
=C2=A0.../systemd/0001-Also-check-<wbr>i586-for-ia32.patch=C2=A0 =C2=A0 | 2=
8 ++++++++++<br>
=C2=A0...efi_cc-and-efi_ld-<wbr>correctly-when-cross-co.patch | 62 ++++++++=
++++++++++++++<br>
=C2=A04 files changed, 139 insertions(+), 43 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/<a href=3D"http://system=
d-boot_234.bb" rel=3D"noreferrer" target=3D"_blank">syst<wbr>emd-boot_234.b=
b</a><br>
=C2=A0create mode 100644 meta/recipes-core/systemd/<a href=3D"http://system=
d-boot_236.bb" rel=3D"noreferrer" target=3D"_blank">syst<wbr>emd-boot_236.b=
b</a><br>
=C2=A0create mode 100644 meta/recipes-core/systemd/<wbr>systemd/0001-Also-c=
heck-i586-<wbr>for-ia32.patch<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/<wbr>systemd/0001-Fix-to=
-run-efi_<wbr>cc-and-efi_ld-correctly-when-<wbr>cross-co.patch<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_234.b=
b" rel=3D"noreferrer" target=3D"_blank">sy<wbr>stemd-boot_234.bb</a> b/meta=
/recipes-core/systemd/<a href=3D"http://systemd-boot_234.bb" rel=3D"norefer=
rer" target=3D"_blank">sy<wbr>stemd-boot_234.bb</a><br>
deleted file mode 100644<br>
index 88a14ac..0000000<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_234.bb" rel=
=3D"noreferrer" target=3D"_blank">sy<wbr>stemd-boot_234.bb</a><br>
+++ /dev/null<br>
@@ -1,43 +0,0 @@<br>
-require systemd.inc<br>
-FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/systemd:&quot;<br>
-<br>
-DEPENDS =3D &quot;intltool-native libcap util-linux gnu-efi gperf-native&q=
uot;<br>
-<br>
-SRC_URI +=3D &quot;file://0007-use-lnr-wrapper-<wbr>instead-of-looking-for=
-<wbr>relative-opti.patch&quot;<br>
-<br>
-inherit autotools pkgconfig gettext<br>
-inherit deploy<br>
-<br>
-EFI_CC ?=3D &quot;${CC}&quot;<br>
-# Man pages are packaged through the main systemd recipe<br>
-EXTRA_OECONF =3D &quot; --enable-gnuefi \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-efi-i=
ncludedir=3D${<wbr>STAGING_INCDIR} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-efi-l=
dsdir=3D${STAGING_<wbr>LIBDIR} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-efi-l=
ibdir=3D${STAGING_<wbr>LIBDIR} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-ma=
npages \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EFI_CC=3D&#3=
9;${EFI_CC}&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-<br>
-# Imported from the old gummiboot recipe<br>
-TUNE_CCARGS_remove =3D &quot;-mfpmath=3Dsse&quot;<br>
-COMPATIBLE_HOST =3D &quot;(x86_64.*|i.86.*)-linux&quot;<br>
-COMPATIBLE_HOST_x86-x32 =3D &quot;null&quot;<br>
-<br>
-do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0SYSTEMD_BOOT_EFI_ARCH=3D&quot;ia32&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${TARGET_ARCH}&quot; =3D &quot;x86_6=
4&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SYSTEMD_BOOT_EFI_AR=
CH=3D&quot;x64&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake systemd-boot${SYSTEMD_BOOT_<wbr>EFI_=
ARCH}.efi<br>
-}<br>
-<br>
-do_install() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Bypass systemd installation with a NOP<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0:<br>
-}<br>
-<br>
-do_deploy () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/systemd-boot*.efi ${DEPLOYDIR}<br>
-}<br>
-addtask deploy before do_build after do_compile<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_236.b=
b" rel=3D"noreferrer" target=3D"_blank">sy<wbr>stemd-boot_236.bb</a> b/meta=
/recipes-core/systemd/<a href=3D"http://systemd-boot_236.bb" rel=3D"norefer=
rer" target=3D"_blank">sy<wbr>stemd-boot_236.bb</a><br>
new file mode 100644<br>
index 0000000..1a0135a<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_236.bb" rel=
=3D"noreferrer" target=3D"_blank">sy<wbr>stemd-boot_236.bb</a><br>
@@ -0,0 +1,49 @@<br>
+require systemd.inc<br>
+FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/systemd:&quot;<br>
+<br>
+DEPENDS =3D &quot;intltool-native libcap util-linux gnu-efi gperf-native&q=
uot;<br>
+<br>
+SRC_URI +=3D &quot;file://0003-use-lnr-wrapper-<wbr>instead-of-looking-for=
-<wbr>relative-opti.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0027-remove-nobody-<wbr>u=
ser-group-checking.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Also-check-i586-<wbr=
>for-ia32.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-to-run-efi_cc-<w=
br>and-efi_ld-correctly-when-<wbr>cross-co.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+inherit meson pkgconfig gettext<br>
+inherit deploy<br>
+<br>
+EFI_CC ?=3D &quot;${CC}&quot;<br>
+<br>
+EXTRA_OEMESON +=3D &quot;-Defi=3Dtrue \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dgnu-efi=
=3Dtrue \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Defi-inclu=
dedir=3D${STAGING_<wbr>INCDIR}/efi \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Defi-ldsdi=
r=3D${STAGING_LIBDIR} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Defi-libdi=
r=3D${STAGING_LIBDIR} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dman=3Dfal=
se \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Defi-cc=3D=
&#39;${EFI_CC}&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Defi-ld=3D=
&#39;${LD}&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+<br>
+# Imported from the old gummiboot recipe<br>
+TUNE_CCARGS_remove =3D &quot;-mfpmath=3Dsse&quot;<br>
+COMPATIBLE_HOST =3D &quot;(x86_64.*|i.86.*)-linux&quot;<br>
+COMPATIBLE_HOST_x86-x32 =3D &quot;null&quot;<br>
+<br>
+do_compile() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SYSTEMD_BOOT_EFI_ARCH=3D&quot;ia32&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${TARGET_ARCH}&quot; =3D=3D &quot;x8=
6_64&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SYSTEMD_BOOT_EFI_AR=
CH=3D&quot;x64&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ninja src/boot/efi/systemd-boot${<wbr>SYSTEMD_B=
OOT_EFI_ARCH}.efi<br>
+}<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Bypass systemd installation with a NOP<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0:<br>
+}<br>
+<br>
+do_deploy () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/src/boot/efi/systemd-<wbr>boot*.ef=
i ${DEPLOYDIR}<br>
+}<br>
+addtask deploy before do_build after do_compile<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0001-Also-check-i586-<w=
br>for-ia32.patch b/meta/recipes-core/systemd/<wbr>systemd/0001-Also-check-=
i586-<wbr>for-ia32.patch<br>
new file mode 100644<br>
index 0000000..892b25e<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0001-Also-check-i586-<wbr>for-=
ia32.patch<br>
@@ -0,0 +1,28 @@<br>
+From 4616e6f228d2678420ee7d5bb1c8a0<wbr>c8ebb27be8 Mon Sep 17 00:00:00 200=
1<br>
+From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriv=
er.com</a>&gt;<br>
+Date: Tue, 27 Feb 2018 20:42:41 -0800<br>
+Subject: [PATCH] Also check i586 for ia32<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Che=
n@windriver.com</a>&gt;<br>
+---<br>
+ meson.build | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/meson.build b/meson.build<br>
+index ddc061c12..abd1261d6 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -1182,7 +1182,7 @@ conf.set10(&#39;SYSTEMD_SLOW_<wbr>TESTS_DEFAULT&#39;=
, get_option(&#39;slow-tests&#39;))<br>
+ if get_option(&#39;efi&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0efi_arch =3D host_machine.cpu_family()<b=
r>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if efi_arch =3D=3D &#39;x86&#39;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if efi_arch =3D=3D &#39;x86&#39; or efi_arch =
=3D=3D &#39;i586&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EFI_MACHINE_=
TYPE_NAME =3D &#39;ia32&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gnu_efi_arch=
 =3D &#39;ia32&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif efi_arch =3D=3D &#39;x86_64&#39;<br=
>
+--<br>
+2.13.0<br>
+<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0001-Fix-to-run-efi_<wb=
r>cc-and-efi_ld-correctly-when-<wbr>cross-co.patch b/meta/recipes-core/syst=
emd/<wbr>systemd/0001-Fix-to-run-efi_<wbr>cc-and-efi_ld-correctly-when-<wbr=
>cross-co.patch<br>
new file mode 100644<br>
index 0000000..e2e19ba<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0001-Fix-to-run-efi_<wbr>cc-an=
d-efi_ld-correctly-when-<wbr>cross-co.patch<br>
@@ -0,0 +1,62 @@<br>
+From 527413ec243564a89ffaad6368d446<wbr>de44415970 Mon Sep 17 00:00:00 200=
1<br>
+From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriv=
er.com</a>&gt;<br>
+Date: Tue, 27 Feb 2018 21:42:23 -0800<br>
+Subject: [PATCH] Fix to run efi_cc and efi_ld correctly when cross-compili=
ng<br>
+<br>
+When cross-compiling, efi_cc and efi_ld may take the form of<br>
+&#39;xxx-gcc --sysroot=3Dxxx&#39;, and this would cause run_command and<br=
>
+the alike fail.<br>
+<br>
+Fix to split them to make commands run correctly.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Che=
n@windriver.com</a>&gt;<br>
+---<br>
+ src/boot/efi/meson.build | 16 +++++++++++++---<br>
+ 1 file changed, 13 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build<br>
+index 992a3ba4c..9f9ec4911 100644<br>
+--- a/src/boot/efi/meson.build<br>
++++ b/src/boot/efi/meson.build<br>
+@@ -157,7 +157,7 @@ if have_gnu_efi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0o_file =3D c=
ustom_target(file + &#39;.o&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input : =
file,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output :=
 file + &#39;.o&#39;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command :=
 [efi_cc, &#39;-c&#39;, &#39;@INPUT@&#39;, &#39;-o&#39;, &#39;@OUTPUT@&#39;=
]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command :=
 efi_cc.split() + [&#39;-c&#39;, &#39;@INPUT@&#39;, &#39;-o&#39;, &#39;@OUT=
PUT@&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + compile_args,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depend_f=
iles : efi_headers)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (common_s=
ources + systemd_boot_sources).<wbr>contains(file)<br>
+@@ -168,7 +168,17 @@ if have_gnu_efi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endforeach<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 libgcc_file_name =3D run_command(efi_cc, &#39=
;-print-libgcc-file-name&#39;).<wbr>stdout().strip()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 find_libgcc_cmd_all =3D efi_cc + &#39; -print=
-libgcc-file-name&#39;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 find_libgcc_cmd =3D find_libgcc_cmd_all.split=
()[0]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 find_libgcc_args =3D []<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd_args_all =3D find_libgcc_cmd_all.split()<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 foreach arg : cmd_args_all<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if arg !=3D find_=
libgcc_cmd<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 find_libgcc_args +=3D arg<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endif<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 endforeach<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 libgcc_file_name =3D run_command(find_libgcc_=
cmd, find_libgcc_args).stdout().<wbr>strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemd_boot_efi_name =3D &#39;systemd-b=
oot@0@.efi&#39;.format(<wbr>EFI_MACHINE_TYPE_NAME)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stub_efi_name =3D &#39;linux@0@.efi.stub=
&#39;.format(<wbr>EFI_MACHINE_TYPE_NAME)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no_undefined_symbols =3D find_program(&#=
39;no-undefined-<wbr>symbols.sh&#39;)<br>
+@@ -179,7 +189,7 @@ if have_gnu_efi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0tuple[0],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0input : tuple[2],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0output : tuple[0],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 command : [efi_ld, &#39;-o&#39;, &#39;@OUTPUT@&#39;] +<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 command : efi_ld.split() + [&#39;-o&#39;, &#39;@OUTPUT@&#39;] +<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0efi_ldflags + tuple[2] =
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;-lefi&#39;, &#39;=
-lgnuefi&#39;, libgcc_file_name])<br>
+<br>
+--<br>
+2.13.0<br>
+<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--f403045d9a5003ceeb056645c18b--
