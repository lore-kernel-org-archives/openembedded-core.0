Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 90D3F77FE8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 13:44:37 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id n136so828104itg.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Mar 2018 05:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/A6qkkMdYVuZt81Vy1CeeMULztIuK/X4FSWxvL5qdEE=;
	b=EsGUe68cgbOXxRy/sdfh2fptPcL9djOn2adNTzS011/pCzlwTKQQD0Zdso/OuBDIKZ
	OicdP0s3T3kHIwlkdlrjuFjXg27CAIAHL7MZBJ+Vvft+Eacx0QJ/My7MSMaNm2ooni7U
	2tV38xyqfKbt04rTisxdlpFBTyP+9xk1xg4fKcjF2FMvaEb0VKYcr4FTp661RhBSm68J
	O1vwBf8Nhs0ZR0jrp4RmJcl8HfkT+b+neNf8fmJYTHmO4IkWj2sS2CVB70G/4JoqR9a6
	/OsL5jVXBTR4igQvDfCh/huobw7iPGSIihqRU8VMG8SCK6oEnkSz1ImS1iCpzcF68new
	W27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/A6qkkMdYVuZt81Vy1CeeMULztIuK/X4FSWxvL5qdEE=;
	b=SGIJzsQBH7v3UPATu6WW4A8ESK3amku5p7iiJZTBSo0fd0CbS7nGXYUMZ3YtG1J9tQ
	p2ROwk10aspPvtLHRXC5h1zJQp0S9ADsxZ6p1zjuZBdtfqmpL/MK6j+/ooEjj1htom7v
	vrL+i8sZArSTfMG5TbqnBMMVnf/lzCTDdlyokOfN4EHZ8qptCW8nlERPf4351ic7UNmD
	u/q9Og1NZNsiG0UyGhiGeMT/KYdpHmcoL5jhSqmZcyeA1wdNvGNzg4Om9Fv6ndIY1D44
	YuBrShqD7lhpTv9Vmw++6YyY9rHRZmfl2gLLDWoZUj2+jFysLahz63r560RlG6IKZdiQ
	LRlQ==
X-Gm-Message-State: AElRT7Eugh5aUMBDnfkgZkoJOnNVQKCOVQJljtg1dQG8zqlbnYFt2Dns
	auT1o9X0aDA3hGMLubtySe5EuSMXPdPb8U4qmhyqjw==
X-Google-Smtp-Source: AG47ELvpxQfyVgxVfYua5XiMOyYih2FT7bHI1szpB+dYqrDyC5dwnj9tXjSdV6cL0qphWOQk1NCyXlciAHoDM9673vo=
X-Received: by 10.36.36.144 with SMTP id f138mr22160473ita.131.1520430278816; 
	Wed, 07 Mar 2018 05:44:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 7 Mar 2018 05:44:18 -0800 (PST)
In-Reply-To: <3caecc99c62194c9d0419c248947fba03e013940.1520213817.git.Qi.Chen@windriver.com>
References: <cover.1520213817.git.Qi.Chen@windriver.com>
	<3caecc99c62194c9d0419c248947fba03e013940.1520213817.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Mar 2018 13:44:18 +0000
Message-ID: <CAJTo0LY0adVVH9aP_fgimcXSzR8dDfGuZWF4mpyBX-4AnbZ4tA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] systemd-boot: upgrade to 237
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
X-List-Received-Date: Wed, 07 Mar 2018 13:44:37 -0000
Content-Type: multipart/alternative; boundary="001a1147cd30acd1f70566d2c297"

--001a1147cd30acd1f70566d2c297
Content-Type: text/plain; charset="UTF-8"

Can you rebase this to master as there's been changes to booting made.

Ross

On 5 March 2018 at 02:02, Chen Qi <Qi.Chen@windriver.com> wrote:

> Upgrade systemd-boot to 237.
>
> As systemd has dropped autotools support, fix configure and compile
> failures related to meson.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../{systemd-boot_234.bb => systemd-boot_237.bb}   | 32 ++++++-----
>  ...01-Also-check-i386-i586-and-i686-for-ia32.patch | 28 ++++++++++
>  ...efi_cc-and-efi_ld-correctly-when-cross-co.patch | 62
> ++++++++++++++++++++++
>  3 files changed, 109 insertions(+), 13 deletions(-)
>  rename meta/recipes-core/systemd/{systemd-boot_234.bb =>
> systemd-boot_237.bb} (41%)
>  create mode 100644 meta/recipes-core/systemd/
> systemd/0001-Also-check-i386-i586-and-i686-for-ia32.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_
> cc-and-efi_ld-correctly-when-cross-co.patch
>
> diff --git a/meta/recipes-core/systemd/systemd-boot_234.bb
> b/meta/recipes-core/systemd/systemd-boot_237.bb
> similarity index 41%
> rename from meta/recipes-core/systemd/systemd-boot_234.bb
> rename to meta/recipes-core/systemd/systemd-boot_237.bb
> index 88a14ac..ec87cbf 100644
> --- a/meta/recipes-core/systemd/systemd-boot_234.bb
> +++ b/meta/recipes-core/systemd/systemd-boot_237.bb
> @@ -3,20 +3,27 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
>
>  DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
>
> -SRC_URI += "file://0007-use-lnr-wrapper-instead-of-looking-for-
> relative-opti.patch"
> +SRC_URI += "file://0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
> \
> +            file://0027-remove-nobody-user-group-checking.patch \
> +            file://0001-Also-check-i386-i586-and-i686-for-ia32.patch \
> +            file://0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
> \
> +            "
>
> -inherit autotools pkgconfig gettext
> +inherit meson pkgconfig gettext
>  inherit deploy
>
>  EFI_CC ?= "${CC}"
> -# Man pages are packaged through the main systemd recipe
> -EXTRA_OECONF = " --enable-gnuefi \
> -                 --with-efi-includedir=${STAGING_INCDIR} \
> -                 --with-efi-ldsdir=${STAGING_LIBDIR} \
> -                 --with-efi-libdir=${STAGING_LIBDIR} \
> -                 --disable-manpages \
> -                 EFI_CC='${EFI_CC}' \
> -               "
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
>
>  # Imported from the old gummiboot recipe
>  TUNE_CCARGS_remove = "-mfpmath=sse"
> @@ -28,8 +35,7 @@ do_compile() {
>         if [ "${TARGET_ARCH}" = "x86_64" ]; then
>                 SYSTEMD_BOOT_EFI_ARCH="x64"
>         fi
> -
> -       oe_runmake systemd-boot${SYSTEMD_BOOT_EFI_ARCH}.efi
> +       ninja src/boot/efi/systemd-boot${SYSTEMD_BOOT_EFI_ARCH}.efi
>  }
>
>  do_install() {
> @@ -38,6 +44,6 @@ do_install() {
>  }
>
>  do_deploy () {
> -       install ${B}/systemd-boot*.efi ${DEPLOYDIR}
> +       install ${B}/src/boot/efi/systemd-boot*.efi ${DEPLOYDIR}
>  }
>  addtask deploy before do_build after do_compile
> diff --git a/meta/recipes-core/systemd/systemd/0001-Also-check-i386-i586-and-i686-for-ia32.patch
> b/meta/recipes-core/systemd/systemd/0001-Also-check-i386-
> i586-and-i686-for-ia32.patch
> new file mode 100644
> index 0000000..877bb1c
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-Also-check-i386-
> i586-and-i686-for-ia32.patch
> @@ -0,0 +1,28 @@
> +From 3e8c19bb1bbc4493c591f75c00c1fefe3b1c8a69 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Tue, 27 Feb 2018 20:42:41 -0800
> +Subject: [PATCH] Also check i386, i586 and i686 for ia32
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 28cb8b60e..489531a43 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -1217,7 +1217,7 @@ conf.set10('SYSTEMD_SLOW_TESTS_DEFAULT',
> slow_tests)
> + if get_option('efi')
> +         efi_arch = host_machine.cpu_family()
> +
> +-        if efi_arch == 'x86'
> ++        if efi_arch == 'x86' or efi_arch == 'i386' or efi_arch == 'i586'
> or efi_arch == 'i686'
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

--001a1147cd30acd1f70566d2c297
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you rebase this to master as there&#39;s been changes =
to booting made.<div><br></div><div>Ross</div></div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">On 5 March 2018 at 02:02, Chen Qi <span =
dir=3D"ltr">&lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">=
Qi.Chen@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">Upgrade systemd-boot to 237.<br>
<br>
As systemd has dropped autotools support, fix configure and compile<br>
failures related to meson.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://systemd-boot_234.bb" rel=3D"noreferrer" target=
=3D"_blank">systemd-boot_234.bb</a> =3D&gt; <a href=3D"http://systemd-boot_=
237.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_237.bb</a>}=C2=A0=
 =C2=A0| 32 ++++++-----<br>
=C2=A0...01-Also-check-i386-i586-<wbr>and-i686-for-ia32.patch | 28 ++++++++=
++<br>
=C2=A0...efi_cc-and-efi_ld-<wbr>correctly-when-cross-co.patch | 62 ++++++++=
++++++++++++++<br>
=C2=A03 files changed, 109 insertions(+), 13 deletions(-)<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd-boot_234.=
bb" rel=3D"noreferrer" target=3D"_blank">sys<wbr>temd-boot_234.bb</a> =3D&g=
t; <a href=3D"http://systemd-boot_237.bb" rel=3D"noreferrer" target=3D"_bla=
nk">systemd-boot_237.bb</a>} (41%)<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/<wbr>systemd/0001-Also-c=
heck-i386-<wbr>i586-and-i686-for-ia32.patch<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/<wbr>systemd/0001-Fix-to=
-run-efi_<wbr>cc-and-efi_ld-correctly-when-<wbr>cross-co.patch<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_234.b=
b" rel=3D"noreferrer" target=3D"_blank">sy<wbr>stemd-boot_234.bb</a> b/meta=
/recipes-core/systemd/<a href=3D"http://systemd-boot_237.bb" rel=3D"norefer=
rer" target=3D"_blank">sy<wbr>stemd-boot_237.bb</a><br>
similarity index 41%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd-boot_234.bb=
" rel=3D"noreferrer" target=3D"_blank">syst<wbr>emd-boot_234.bb</a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd-boot_237.bb" =
rel=3D"noreferrer" target=3D"_blank">syst<wbr>emd-boot_237.bb</a><br>
index 88a14ac..ec87cbf 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_234.bb" rel=
=3D"noreferrer" target=3D"_blank">sy<wbr>stemd-boot_234.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_237.bb" rel=
=3D"noreferrer" target=3D"_blank">sy<wbr>stemd-boot_237.bb</a><br>
@@ -3,20 +3,27 @@ FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/systemd:&quot;=
<br>
<br>
=C2=A0DEPENDS =3D &quot;intltool-native libcap util-linux gnu-efi gperf-nat=
ive&quot;<br>
<br>
-SRC_URI +=3D &quot;file://0007-use-lnr-wrapper-<wbr>instead-of-looking-for=
-<wbr>relative-opti.patch&quot;<br>
+SRC_URI +=3D &quot;file://0003-use-lnr-wrapper-<wbr>instead-of-looking-for=
-<wbr>relative-opti.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0027-remove-nobody-<wbr>u=
ser-group-checking.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Also-check-i386-<wbr=
>i586-and-i686-for-ia32.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-to-run-efi_cc-<w=
br>and-efi_ld-correctly-when-<wbr>cross-co.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-inherit autotools pkgconfig gettext<br>
+inherit meson pkgconfig gettext<br>
=C2=A0inherit deploy<br>
<br>
=C2=A0EFI_CC ?=3D &quot;${CC}&quot;<br>
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
<br>
=C2=A0# Imported from the old gummiboot recipe<br>
=C2=A0TUNE_CCARGS_remove =3D &quot;-mfpmath=3Dsse&quot;<br>
@@ -28,8 +35,7 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${TARGET_ARCH}&quot; =3D &quot;x86_6=
4&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSTEMD_BOOT_EFI_AR=
CH=3D&quot;x64&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake systemd-boot${SYSTEMD_BOOT_<wbr>EFI_=
ARCH}.efi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ninja src/boot/efi/systemd-boot${<wbr>SYSTEMD_B=
OOT_EFI_ARCH}.efi<br>
=C2=A0}<br>
<br>
=C2=A0do_install() {<br>
@@ -38,6 +44,6 @@ do_install() {<br>
=C2=A0}<br>
<br>
=C2=A0do_deploy () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/systemd-boot*.efi ${DEPLOYDIR}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/src/boot/efi/systemd-<wbr>boot*.ef=
i ${DEPLOYDIR}<br>
=C2=A0}<br>
=C2=A0addtask deploy before do_build after do_compile<br>
diff --git a/meta/recipes-core/systemd/<wbr>systemd/0001-Also-check-i386-<w=
br>i586-and-i686-for-ia32.patch b/meta/recipes-core/systemd/<wbr>systemd/00=
01-Also-check-i386-<wbr>i586-and-i686-for-ia32.patch<br>
new file mode 100644<br>
index 0000000..877bb1c<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/<wbr>systemd/0001-Also-check-i386-<wbr>i586=
-and-i686-for-ia32.patch<br>
@@ -0,0 +1,28 @@<br>
+From 3e8c19bb1bbc4493c591f75c00c1fe<wbr>fe3b1c8a69 Mon Sep 17 00:00:00 200=
1<br>
+From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriv=
er.com</a>&gt;<br>
+Date: Tue, 27 Feb 2018 20:42:41 -0800<br>
+Subject: [PATCH] Also check i386, i586 and i686 for ia32<br>
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
+index 28cb8b60e..489531a43 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -1217,7 +1217,7 @@ conf.set10(&#39;SYSTEMD_SLOW_<wbr>TESTS_DEFAULT&#39;=
, slow_tests)<br>
+ if get_option(&#39;efi&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0efi_arch =3D host_machine.cpu_family()<b=
r>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if efi_arch =3D=3D &#39;x86&#39;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if efi_arch =3D=3D &#39;x86&#39; or efi_arch =
=3D=3D &#39;i386&#39; or efi_arch =3D=3D &#39;i586&#39; or efi_arch =3D=3D =
&#39;i686&#39;<br>
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

--001a1147cd30acd1f70566d2c297--
