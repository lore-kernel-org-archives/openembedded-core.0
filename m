Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 87FDE7851A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 13:33:11 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id b34so3218029ioj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 05:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xcV0SCEpw2UCcW/vh6cIlDvgmIhSuTGO4XownkkvroQ=;
	b=uv9nPZr+4u5QcpU3EaqzlCWcf1sLf0uy20kWnMU0lQJC4E9xm1N1ND4XD7aKq9RRT5
	yQsQM47jWIiyAHyM5m4caslSyq4nSJAD6lauOerB39DpCY3Mv4LMS2288pWJK9GA65E7
	95hY+DS5hmve+reh5pdFbadI12Z1ok6aHqVvb0LSyGIuRcMGYV3NnWdl3oXTzzbRAHbQ
	plmYLdDMN/YzatvSorvj/5yjtYT/ESoekcYYG1F231sVc/LF8Ob+qRKo2e4oROe5fF3X
	7T0FTn9FzVMm6E3pubNZVQpNacd6Zd5KvwVU+mGEXyO3IackUPOZVSTPPfvKgV1phRyd
	X/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xcV0SCEpw2UCcW/vh6cIlDvgmIhSuTGO4XownkkvroQ=;
	b=jvtQYzMq7Vr8EuiC3UyoWvhbfffBO5xkV2YD27osVhHTs42tD9LFm8DI5Y2iDBXcjz
	72RF6Knlx/6zUtnmejxIX2JqfwgWXwjI81crVs//CasmKEGa87QcWJmLV+6YneACUZW7
	3ioJbJ5MMqHTTwG5lN1UjMzeXS1KQGZwnK+8Zo1TdwgVk33rsxq6YRxKmquFFg15upGE
	N+PYqyVX2XDXoOgSmrIXmOaj8Gs3CLFB3CGH7s7rE/aNR8FSAy2tx5NidOA3fWI5rLmK
	E/NxJR8gUNP9B4K5jgDmW1NbUFSvqD28qKVToEDGVAxGtuJFKKdqikxKss6abdw5wlsU
	nCVw==
X-Gm-Message-State: APf1xPDEEYa4oypeTYy4lT9REUriTWQ8leDvERt+R7h/OZnmbnmt+av4
	grKVXPM8kBaPAjpNkjU8M3Xq83DMRLX/oRNryT/nrA==
X-Google-Smtp-Source: AG47ELtp7KOoXkTEsj2extakHwlpinaFffwFaX5h/BfpDX449Xr34yTANIG5pJGsNBFkwC7SGvdkU/+YK+rxRq/6ssM=
X-Received: by 10.107.6.139 with SMTP id f11mr21095553ioi.23.1519824792417;
	Wed, 28 Feb 2018 05:33:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Wed, 28 Feb 2018 05:32:51 -0800 (PST)
In-Reply-To: <CAJTo0LZnOWoY4o_EiwkauLTYxTTa2UJa+2=Kzkm6cK1dv1ViYw@mail.gmail.com>
References: <cover.1519797175.git.Qi.Chen@windriver.com>
	<cc7b5c36944049bc5c69151a2d3c7adf242b04f5.1519797175.git.Qi.Chen@windriver.com>
	<CAJTo0LZnOWoY4o_EiwkauLTYxTTa2UJa+2=Kzkm6cK1dv1ViYw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Feb 2018 13:32:51 +0000
Message-ID: <CAJTo0Lb4n1KggfayXTWsuEp2inRBksC29UCOxKXjKimbiTX4PA@mail.gmail.com>
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
X-List-Received-Date: Wed, 28 Feb 2018 13:33:11 -0000
Content-Type: multipart/alternative; boundary="001a113eeaeadf9c36056645c8e9"

--001a113eeaeadf9c36056645c8e9
Content-Type: text/plain; charset="UTF-8"

No, still broken:

ERROR: systemd-boot-236-r0 do_compile: oe_runmake failed
ERROR: systemd-boot-236-r0 do_compile: Function failed: do_compile (log
file is located at
/data/poky-tmp/master/work/corei7-64-intel-common-poky-linux/systemd-boot/236-r0/temp/log.do_compile.31074)
ERROR: Logfile of failure stored in:
/data/poky-tmp/master/work/corei7-64-intel-common-poky-linux/systemd-boot/236-r0/temp/log.do_compile.31074
Log data follows:
| DEBUG: Executing shell function do_compile
| [1/10] Generating console.c.o with a custom command.
| [2/10] Generating graphics.c.o with a custom command.
| [3/10] Generating pe.c.o with a custom command.
| [4/10] Generating measure.c.o with a custom command.
| [5/10] Generating disk.c.o with a custom command.
| [6/10] Generating util.c.o with a custom command.
| [7/10] Generating shim.c.o with a custom command.
| [8/10] Generating boot.c.o with a custom command.
| [9/10] Generating systemd_boot.so with a custom command.
| [10/10] Generating systemd-bootx64.efi with a custom command.
| NOTE: make -j 20 linuxx64.efi.stub
| make: *** No rule to make target 'linuxx64.efi.stub'.  Stop.
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/data/poky-tmp/master/work/corei7-64-intel-common-poky-linux/systemd-boot/236-r0/temp/log.do_compile.31074)
ERROR: Task
(/home/ross/Yocto/poky/meta/recipes-core/systemd/systemd-boot_236.bb:do_compile)
failed with exit code '1'

Ross

On 28 February 2018 at 13:30, Burton, Ross <ross.burton@intel.com> wrote:

> ERROR: systemd-boot-236-r0 do_compile: Function failed: do_compile (log
> file is located at /data/poky-tmp/master/work/corei7-64-intel-common-poky-
> linux/systemd-boot/236-r0/temp/log.do_compile.10165)
> ERROR: Logfile of failure stored in: /data/poky-tmp/master/work/
> corei7-64-intel-common-poky-linux/systemd-boot/236-r0/
> temp/log.do_compile.10165
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | /data/poky-tmp/master/work/corei7-64-intel-common-poky-
> linux/systemd-boot/236-r0/temp/run.do_compile.10165: 109: [: x86_64:
> unexpected operator
> | ninja: error: unknown target 'src/boot/efi/systemd-bootia32.efi'
>
> +       if [ "${TARGET_ARCH}" == "x86_64" ]; then
>
> Remember that == is a bashism and the correct operator for [ is =.
>
> (fix squashed here)
>
> Ross
>
> On 28 February 2018 at 05:56, Chen Qi <Qi.Chen@windriver.com> wrote:
>
>> Upgrade systemd-boot to 236.
>>
>> As systemd has dropped autotools support, fix configure and compile
>> failures related to meson.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>  meta/recipes-core/systemd/systemd-boot_234.bb      | 43 ---------------
>>  meta/recipes-core/systemd/systemd-boot_236.bb      | 49
>> +++++++++++++++++
>>  .../systemd/0001-Also-check-i586-for-ia32.patch    | 28 ++++++++++
>>  ...efi_cc-and-efi_ld-correctly-when-cross-co.patch | 62
>> ++++++++++++++++++++++
>>  4 files changed, 139 insertions(+), 43 deletions(-)
>>  delete mode 100644 meta/recipes-core/systemd/systemd-boot_234.bb
>>  create mode 100644 meta/recipes-core/systemd/systemd-boot_236.bb
>>  create mode 100644 meta/recipes-core/systemd/syst
>> emd/0001-Also-check-i586-for-ia32.patch
>>  create mode 100644 meta/recipes-core/systemd/syst
>> emd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
>>
>> diff --git a/meta/recipes-core/systemd/systemd-boot_234.bb
>> b/meta/recipes-core/systemd/systemd-boot_234.bb
>> deleted file mode 100644
>> index 88a14ac..0000000
>> --- a/meta/recipes-core/systemd/systemd-boot_234.bb
>> +++ /dev/null
>> @@ -1,43 +0,0 @@
>> -require systemd.inc
>> -FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
>> -
>> -DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
>> -
>> -SRC_URI += "file://0007-use-lnr-wrapper-instead-of-looking-for-relative
>> -opti.patch"
>> -
>> -inherit autotools pkgconfig gettext
>> -inherit deploy
>> -
>> -EFI_CC ?= "${CC}"
>> -# Man pages are packaged through the main systemd recipe
>> -EXTRA_OECONF = " --enable-gnuefi \
>> -                 --with-efi-includedir=${STAGING_INCDIR} \
>> -                 --with-efi-ldsdir=${STAGING_LIBDIR} \
>> -                 --with-efi-libdir=${STAGING_LIBDIR} \
>> -                 --disable-manpages \
>> -                 EFI_CC='${EFI_CC}' \
>> -               "
>> -
>> -# Imported from the old gummiboot recipe
>> -TUNE_CCARGS_remove = "-mfpmath=sse"
>> -COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
>> -COMPATIBLE_HOST_x86-x32 = "null"
>> -
>> -do_compile() {
>> -       SYSTEMD_BOOT_EFI_ARCH="ia32"
>> -       if [ "${TARGET_ARCH}" = "x86_64" ]; then
>> -               SYSTEMD_BOOT_EFI_ARCH="x64"
>> -       fi
>> -
>> -       oe_runmake systemd-boot${SYSTEMD_BOOT_EFI_ARCH}.efi
>> -}
>> -
>> -do_install() {
>> -       # Bypass systemd installation with a NOP
>> -       :
>> -}
>> -
>> -do_deploy () {
>> -       install ${B}/systemd-boot*.efi ${DEPLOYDIR}
>> -}
>> -addtask deploy before do_build after do_compile
>> diff --git a/meta/recipes-core/systemd/systemd-boot_236.bb
>> b/meta/recipes-core/systemd/systemd-boot_236.bb
>> new file mode 100644
>> index 0000000..1a0135a
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd-boot_236.bb
>> @@ -0,0 +1,49 @@
>> +require systemd.inc
>> +FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
>> +
>> +DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
>> +
>> +SRC_URI += "file://0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>> \
>> +            file://0027-remove-nobody-user-group-checking.patch \
>> +            file://0001-Also-check-i586-for-ia32.patch \
>> +            file://0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
>> \
>> +            "
>> +
>> +inherit meson pkgconfig gettext
>> +inherit deploy
>> +
>> +EFI_CC ?= "${CC}"
>> +
>> +EXTRA_OEMESON += "-Defi=true \
>> +                  -Dgnu-efi=true \
>> +                  -Defi-includedir=${STAGING_INCDIR}/efi \
>> +                  -Defi-ldsdir=${STAGING_LIBDIR} \
>> +                  -Defi-libdir=${STAGING_LIBDIR} \
>> +                  -Dman=false \
>> +                  -Defi-cc='${EFI_CC}' \
>> +                  -Defi-ld='${LD}' \
>> +                  "
>> +
>> +
>> +# Imported from the old gummiboot recipe
>> +TUNE_CCARGS_remove = "-mfpmath=sse"
>> +COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
>> +COMPATIBLE_HOST_x86-x32 = "null"
>> +
>> +do_compile() {
>> +       SYSTEMD_BOOT_EFI_ARCH="ia32"
>> +       if [ "${TARGET_ARCH}" == "x86_64" ]; then
>> +               SYSTEMD_BOOT_EFI_ARCH="x64"
>> +       fi
>> +       ninja src/boot/efi/systemd-boot${SYSTEMD_BOOT_EFI_ARCH}.efi
>> +}
>> +
>> +do_install() {
>> +       # Bypass systemd installation with a NOP
>> +       :
>> +}
>> +
>> +do_deploy () {
>> +       install ${B}/src/boot/efi/systemd-boot*.efi ${DEPLOYDIR}
>> +}
>> +addtask deploy before do_build after do_compile
>> diff --git a/meta/recipes-core/systemd/systemd/0001-Also-check-i586-for-ia32.patch
>> b/meta/recipes-core/systemd/systemd/0001-Also-check-i586-for-ia32.patch
>> new file mode 100644
>> index 0000000..892b25e
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0001-Also-check-i586-for
>> -ia32.patch
>> @@ -0,0 +1,28 @@
>> +From 4616e6f228d2678420ee7d5bb1c8a0c8ebb27be8 Mon Sep 17 00:00:00 2001
>> +From: Chen Qi <Qi.Chen@windriver.com>
>> +Date: Tue, 27 Feb 2018 20:42:41 -0800
>> +Subject: [PATCH] Also check i586 for ia32
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> +---
>> + meson.build | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/meson.build b/meson.build
>> +index ddc061c12..abd1261d6 100644
>> +--- a/meson.build
>> ++++ b/meson.build
>> +@@ -1182,7 +1182,7 @@ conf.set10('SYSTEMD_SLOW_TESTS_DEFAULT',
>> get_option('slow-tests'))
>> + if get_option('efi')
>> +         efi_arch = host_machine.cpu_family()
>> +
>> +-        if efi_arch == 'x86'
>> ++        if efi_arch == 'x86' or efi_arch == 'i586'
>> +                 EFI_MACHINE_TYPE_NAME = 'ia32'
>> +                 gnu_efi_arch = 'ia32'
>> +         elif efi_arch == 'x86_64'
>> +--
>> +2.13.0
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-
>> and-efi_ld-correctly-when-cross-co.patch b/meta/recipes-core/systemd/sy
>> stemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
>> new file mode 100644
>> index 0000000..e2e19ba
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-
>> and-efi_ld-correctly-when-cross-co.patch
>> @@ -0,0 +1,62 @@
>> +From 527413ec243564a89ffaad6368d446de44415970 Mon Sep 17 00:00:00 2001
>> +From: Chen Qi <Qi.Chen@windriver.com>
>> +Date: Tue, 27 Feb 2018 21:42:23 -0800
>> +Subject: [PATCH] Fix to run efi_cc and efi_ld correctly when
>> cross-compiling
>> +
>> +When cross-compiling, efi_cc and efi_ld may take the form of
>> +'xxx-gcc --sysroot=xxx', and this would cause run_command and
>> +the alike fail.
>> +
>> +Fix to split them to make commands run correctly.
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> +---
>> + src/boot/efi/meson.build | 16 +++++++++++++---
>> + 1 file changed, 13 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
>> +index 992a3ba4c..9f9ec4911 100644
>> +--- a/src/boot/efi/meson.build
>> ++++ b/src/boot/efi/meson.build
>> +@@ -157,7 +157,7 @@ if have_gnu_efi
>> +                 o_file = custom_target(file + '.o',
>> +                                        input : file,
>> +                                        output : file + '.o',
>> +-                                       command : [efi_cc, '-c', '@INPUT@',
>> '-o', '@OUTPUT@']
>> ++                                       command : efi_cc.split() +
>> ['-c', '@INPUT@', '-o', '@OUTPUT@']
>> +                                                  + compile_args,
>> +                                        depend_files : efi_headers)
>> +                 if (common_sources + systemd_boot_sources).contains
>> (file)
>> +@@ -168,7 +168,17 @@ if have_gnu_efi
>> +                 endif
>> +         endforeach
>> +
>> +-        libgcc_file_name = run_command(efi_cc,
>> '-print-libgcc-file-name').stdout().strip()
>> ++        find_libgcc_cmd_all = efi_cc + ' -print-libgcc-file-name'
>> ++        find_libgcc_cmd = find_libgcc_cmd_all.split()[0]
>> ++        find_libgcc_args = []
>> ++        cmd_args_all = find_libgcc_cmd_all.split()
>> ++        foreach arg : cmd_args_all
>> ++                if arg != find_libgcc_cmd
>> ++                        find_libgcc_args += arg
>> ++                endif
>> ++        endforeach
>> ++
>> ++        libgcc_file_name = run_command(find_libgcc_cmd,
>> find_libgcc_args).stdout().strip()
>> +         systemd_boot_efi_name = 'systemd-boot@0@.efi'.format(E
>> FI_MACHINE_TYPE_NAME)
>> +         stub_efi_name = 'linux@0@.efi.stub'.format(EFI
>> _MACHINE_TYPE_NAME)
>> +         no_undefined_symbols = find_program('no-undefined-symbols.sh')
>> +@@ -179,7 +189,7 @@ if have_gnu_efi
>> +                         tuple[0],
>> +                         input : tuple[2],
>> +                         output : tuple[0],
>> +-                        command : [efi_ld, '-o', '@OUTPUT@'] +
>> ++                        command : efi_ld.split() + ['-o', '@OUTPUT@'] +
>> +                                   efi_ldflags + tuple[2] +
>> +                                   ['-lefi', '-lgnuefi',
>> libgcc_file_name])
>> +
>> +--
>> +2.13.0
>> +
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--001a113eeaeadf9c36056645c8e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">No, still broken:<div><br></div><div><div>ERROR: systemd-b=
oot-236-r0 do_compile: oe_runmake failed</div><div>ERROR: systemd-boot-236-=
r0 do_compile: Function failed: do_compile (log file is located at /data/po=
ky-tmp/master/work/corei7-64-intel-common-poky-linux/systemd-boot/236-r0/te=
mp/log.do_compile.31074)</div><div>ERROR: Logfile of failure stored in: /da=
ta/poky-tmp/master/work/corei7-64-intel-common-poky-linux/systemd-boot/236-=
r0/temp/log.do_compile.31074</div><div>Log data follows:</div><div>| DEBUG:=
 Executing shell function do_compile</div><div>| [1/10] Generating console.=
c.o with a custom command.</div><div>| [2/10] Generating graphics.c.o with =
a custom command.</div><div>| [3/10] Generating pe.c.o with a custom comman=
d.</div><div>| [4/10] Generating measure.c.o with a custom command.</div><d=
iv>| [5/10] Generating disk.c.o with a custom command.</div><div>| [6/10] G=
enerating util.c.o with a custom command.</div><div>| [7/10] Generating shi=
m.c.o with a custom command.</div><div>| [8/10] Generating boot.c.o with a =
custom command.</div><div>| [9/10] Generating systemd_boot.so with a custom=
 command.</div><div>| [10/10] Generating systemd-bootx64.efi with a custom =
command.</div><div>| NOTE: make -j 20 linuxx64.efi.stub</div><div>| make: *=
** No rule to make target &#39;linuxx64.efi.stub&#39;.=C2=A0 Stop.</div><di=
v>| ERROR: oe_runmake failed</div><div>| WARNING: exit code 1 from a shell =
command.</div><div>| ERROR: Function failed: do_compile (log file is locate=
d at /data/poky-tmp/master/work/corei7-64-intel-common-poky-linux/systemd-b=
oot/236-r0/temp/log.do_compile.31074)</div><div>ERROR: Task (/home/ross/Yoc=
to/poky/meta/recipes-core/systemd/systemd-boot_236.bb:do_compile) failed wi=
th exit code &#39;1&#39;</div></div><div><br></div><div>Ross</div></div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 28 February 2018 =
at 13:30, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@=
intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>ERROR: systemd-boot-2=
36-r0 do_compile: Function failed: do_compile (log file is located at /data=
/poky-tmp/master/work/<wbr>corei7-64-intel-common-poky-<wbr>linux/systemd-b=
oot/236-r0/<wbr>temp/log.do_compile.10165)</div><div>ERROR: Logfile of fail=
ure stored in: /data/poky-tmp/master/work/<wbr>corei7-64-intel-common-poky-=
<wbr>linux/systemd-boot/236-r0/<wbr>temp/log.do_compile.10165</div><div>Log=
 data follows:</div><div>| DEBUG: Executing shell function do_compile</div>=
<div>| /data/poky-tmp/master/work/<wbr>corei7-64-intel-common-poky-<wbr>lin=
ux/systemd-boot/236-r0/<wbr>temp/run.do_compile.10165: 109: [: x86_64: unex=
pected operator</div><div>| ninja: error: unknown target &#39;src/boot/efi/=
systemd-<wbr>bootia32.efi&#39;</div><span class=3D""><div><br></div><div><s=
pan style=3D"font-size:12.800000190734863px">+=C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 [ &quot;${TARGET_ARCH}&quot; =3D=3D &quot;x86_64&quot; ]; then</span><br s=
tyle=3D"font-size:12.800000190734863px"></div><div><span style=3D"font-size=
:12.800000190734863px"><br></span></div></span><div><span style=3D"font-siz=
e:12.800000190734863px">Remember that =3D=3D is a bashism and the correct o=
perator for [ is =3D.</span></div><div><span style=3D"font-size:12.80000019=
0734863px"><br></span></div><div><span style=3D"font-size:12.80000019073486=
3px">(fix squashed here)</span></div><span class=3D"HOEnZb"><font color=3D"=
#888888"><div><span style=3D"font-size:12.800000190734863px"><br></span></d=
iv><div>Ross</div></font></span></div><div class=3D"HOEnZb"><div class=3D"h=
5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 28 February=
 2018 at 05:56, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailto:Qi.Chen@win=
driver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Upgrade systemd-boot to 236.<br>
<br>
As systemd has dropped autotools support, fix configure and compile<br>
failures related to meson.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd-boot_234.bb" rel=
=3D"noreferrer" target=3D"_blank">sys<wbr>temd-boot_234.bb</a>=C2=A0 =C2=A0=
 =C2=A0 | 43 ---------------<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd-boot_236.bb" rel=
=3D"noreferrer" target=3D"_blank">sys<wbr>temd-boot_236.bb</a>=C2=A0 =C2=A0=
 =C2=A0 | 49 +++++++++++++++++<br>
=C2=A0.../systemd/0001-Also-check-i<wbr>586-for-ia32.patch=C2=A0 =C2=A0 | 2=
8 ++++++++++<br>
=C2=A0...efi_cc-and-efi_ld-correctl<wbr>y-when-cross-co.patch | 62 ++++++++=
++++++++++++++<br>
=C2=A04 files changed, 139 insertions(+), 43 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/<a href=3D"http://system=
d-boot_234.bb" rel=3D"noreferrer" target=3D"_blank">syst<wbr>emd-boot_234.b=
b</a><br>
=C2=A0create mode 100644 meta/recipes-core/systemd/<a href=3D"http://system=
d-boot_236.bb" rel=3D"noreferrer" target=3D"_blank">syst<wbr>emd-boot_236.b=
b</a><br>
=C2=A0create mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0001-Also-c=
heck-i586-for-<wbr>ia32.patch<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0001-Fix-to=
-run-efi_cc-<wbr>and-efi_ld-correctly-when-cros<wbr>s-co.patch<br>
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
-SRC_URI +=3D &quot;file://0007-use-lnr-wrapper-i<wbr>nstead-of-looking-for=
-relative<wbr>-opti.patch&quot;<br>
-<br>
-inherit autotools pkgconfig gettext<br>
-inherit deploy<br>
-<br>
-EFI_CC ?=3D &quot;${CC}&quot;<br>
-# Man pages are packaged through the main systemd recipe<br>
-EXTRA_OECONF =3D &quot; --enable-gnuefi \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-efi-i=
ncludedir=3D${STAGI<wbr>NG_INCDIR} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-efi-l=
dsdir=3D${STAGING_L<wbr>IBDIR} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-efi-l=
ibdir=3D${STAGING_L<wbr>IBDIR} \<br>
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
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake systemd-boot${SYSTEMD_BOOT_EFI<wbr>_=
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
+SRC_URI +=3D &quot;file://0003-use-lnr-wrapper-i<wbr>nstead-of-looking-for=
-relative<wbr>-opti.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0027-remove-nobody-user<w=
br>-group-checking.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Also-check-i586-fo<w=
br>r-ia32.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-to-run-efi_cc-<w=
br>and-efi_ld-correctly-when-cros<wbr>s-co.patch \<br>
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
dedir=3D${STAGING_INC<wbr>DIR}/efi \<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ninja src/boot/efi/systemd-boot${SYS<wbr>TEMD_B=
OOT_EFI_ARCH}.efi<br>
+}<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Bypass systemd installation with a NOP<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0:<br>
+}<br>
+<br>
+do_deploy () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/src/boot/efi/systemd-boot<wbr>*.ef=
i ${DEPLOYDIR}<br>
+}<br>
+addtask deploy before do_build after do_compile<br>
diff --git a/meta/recipes-core/systemd/sy<wbr>stemd/0001-Also-check-i586-fo=
r<wbr>-ia32.patch b/meta/recipes-core/systemd/sy<wbr>stemd/0001-Also-check-=
i586-for<wbr>-ia32.patch<br>
new file mode 100644<br>
index 0000000..892b25e<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/sy<wbr>stemd/0001-Also-check-i586-for<wbr>-=
ia32.patch<br>
@@ -0,0 +1,28 @@<br>
+From 4616e6f228d2678420ee7d5bb1c8a0<wbr>c8ebb27be8 Mon Sep 17 00:00:00 200=
1<br>
+From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blan=
k">Qi.Chen@windriver.com</a>&gt;<br>
+Date: Tue, 27 Feb 2018 20:42:41 -0800<br>
+Subject: [PATCH] Also check i586 for ia32<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
+---<br>
+ meson.build | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/meson.build b/meson.build<br>
+index ddc061c12..abd1261d6 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -1182,7 +1182,7 @@ conf.set10(&#39;SYSTEMD_SLOW_TESTS<wbr>_DEFAULT&#39;=
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
diff --git a/meta/recipes-core/systemd/sy<wbr>stemd/0001-Fix-to-run-efi_cc-=
<wbr>and-efi_ld-correctly-when-cros<wbr>s-co.patch b/meta/recipes-core/syst=
emd/sy<wbr>stemd/0001-Fix-to-run-efi_cc-<wbr>and-efi_ld-correctly-when-cros=
<wbr>s-co.patch<br>
new file mode 100644<br>
index 0000000..e2e19ba<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/sy<wbr>stemd/0001-Fix-to-run-efi_cc-<wbr>an=
d-efi_ld-correctly-when-cros<wbr>s-co.patch<br>
@@ -0,0 +1,62 @@<br>
+From 527413ec243564a89ffaad6368d446<wbr>de44415970 Mon Sep 17 00:00:00 200=
1<br>
+From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blan=
k">Qi.Chen@windriver.com</a>&gt;<br>
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
+Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
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
ources + systemd_boot_sources).contains<wbr>(file)<br>
+@@ -168,7 +168,17 @@ if have_gnu_efi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endforeach<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 libgcc_file_name =3D run_command(efi_cc, &#39=
;-print-libgcc-file-name&#39;).std<wbr>out().strip()<br>
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
cmd, find_libgcc_args).stdout().str<wbr>ip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemd_boot_efi_name =3D &#39;systemd-b=
oot@0@.efi&#39;.format(E<wbr>FI_MACHINE_TYPE_NAME)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stub_efi_name =3D &#39;linux@0@.efi.stub=
&#39;.format(EFI<wbr>_MACHINE_TYPE_NAME)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no_undefined_symbols =3D find_program(&#=
39;no-undefined-sym<wbr>bols.sh&#39;)<br>
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
<span class=3D"m_569630576848120261HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a113eeaeadf9c36056645c8e9--
