Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1FE0D78694
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 02:05:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2525b5G021765
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 4 Mar 2018 18:05:37 -0800
Received: from [128.224.162.197] (128.224.162.197) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Sun, 4 Mar 2018 18:05:04 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1519797175.git.Qi.Chen@windriver.com>
	<cc7b5c36944049bc5c69151a2d3c7adf242b04f5.1519797175.git.Qi.Chen@windriver.com>
	<CAJTo0LZnOWoY4o_EiwkauLTYxTTa2UJa+2=Kzkm6cK1dv1ViYw@mail.gmail.com>
	<CAJTo0Lb4n1KggfayXTWsuEp2inRBksC29UCOxKXjKimbiTX4PA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <033b68f8-c6bf-18a8-480f-5b91373ccea7@windriver.com>
Date: Mon, 5 Mar 2018 10:05:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb4n1KggfayXTWsuEp2inRBksC29UCOxKXjKimbiTX4PA@mail.gmail.com>
X-Originating-IP: [128.224.162.197]
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
X-List-Received-Date: Mon, 05 Mar 2018 02:05:37 -0000
Content-Type: multipart/alternative;
	boundary="------------A49FB6D7D2B59DEDD4E67C68"

--------------A49FB6D7D2B59DEDD4E67C68
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ross,

I've fixed this problem and send patch to meta-intel. The problem is 
bout systemd-boot's bbappend file.

I've also sent out a new patchset, upgrading systemd to 237, which keeps 
the 'manpages' PACKAGECONFIG item for compatibility.

Best Regards,
Chen Qi

On 02/28/2018 09:32 PM, Burton, Ross wrote:
> No, still broken:
>
> ERROR: systemd-boot-236-r0 do_compile: oe_runmake failed
> ERROR: systemd-boot-236-r0 do_compile: Function failed: do_compile 
> (log file is located at 
> /data/poky-tmp/master/work/corei7-64-intel-common-poky-linux/systemd-boot/236-r0/temp/log.do_compile.31074)
> ERROR: Logfile of failure stored in: 
> /data/poky-tmp/master/work/corei7-64-intel-common-poky-linux/systemd-boot/236-r0/temp/log.do_compile.31074
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | [1/10] Generating console.c.o with a custom command.
> | [2/10] Generating graphics.c.o with a custom command.
> | [3/10] Generating pe.c.o with a custom command.
> | [4/10] Generating measure.c.o with a custom command.
> | [5/10] Generating disk.c.o with a custom command.
> | [6/10] Generating util.c.o with a custom command.
> | [7/10] Generating shim.c.o with a custom command.
> | [8/10] Generating boot.c.o with a custom command.
> | [9/10] Generating systemd_boot.so with a custom command.
> | [10/10] Generating systemd-bootx64.efi with a custom command.
> | NOTE: make -j 20 linuxx64.efi.stub
> | make: *** No rule to make target 'linuxx64.efi.stub'. Stop.
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at 
> /data/poky-tmp/master/work/corei7-64-intel-common-poky-linux/systemd-boot/236-r0/temp/log.do_compile.31074)
> ERROR: Task 
> (/home/ross/Yocto/poky/meta/recipes-core/systemd/systemd-boot_236.bb:do_compile) 
> failed with exit code '1'
>
> Ross
>
> On 28 February 2018 at 13:30, Burton, Ross <ross.burton@intel.com 
> <mailto:ross.burton@intel.com>> wrote:
>
>     ERROR: systemd-boot-236-r0 do_compile: Function failed: do_compile
>     (log file is located at
>     /data/poky-tmp/master/work/corei7-64-intel-common-poky-linux/systemd-boot/236-r0/temp/log.do_compile.10165)
>     ERROR: Logfile of failure stored in:
>     /data/poky-tmp/master/work/corei7-64-intel-common-poky-linux/systemd-boot/236-r0/temp/log.do_compile.10165
>     Log data follows:
>     | DEBUG: Executing shell function do_compile
>     |
>     /data/poky-tmp/master/work/corei7-64-intel-common-poky-linux/systemd-boot/236-r0/temp/run.do_compile.10165:
>     109: [: x86_64: unexpected operator
>     | ninja: error: unknown target 'src/boot/efi/systemd-bootia32.efi'
>
>     +  if [ "${TARGET_ARCH}" == "x86_64" ]; then
>
>     Remember that == is a bashism and the correct operator for [ is =.
>
>     (fix squashed here)
>
>     Ross
>
>     On 28 February 2018 at 05:56, Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>> wrote:
>
>         Upgrade systemd-boot to 236.
>
>         As systemd has dropped autotools support, fix configure and
>         compile
>         failures related to meson.
>
>         Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>         <mailto:Qi.Chen@windriver.com>>
>         ---
>          meta/recipes-core/systemd/systemd-boot_234.bb
>         <http://systemd-boot_234.bb>     | 43 ---------------
>          meta/recipes-core/systemd/systemd-boot_236.bb
>         <http://systemd-boot_236.bb>     | 49 +++++++++++++++++
>          .../systemd/0001-Also-check-i586-for-ia32.patch   | 28 ++++++++++
>          ...efi_cc-and-efi_ld-correctly-when-cross-co.patch | 62
>         ++++++++++++++++++++++
>          4 files changed, 139 insertions(+), 43 deletions(-)
>          delete mode 100644
>         meta/recipes-core/systemd/systemd-boot_234.bb
>         <http://systemd-boot_234.bb>
>          create mode 100644
>         meta/recipes-core/systemd/systemd-boot_236.bb
>         <http://systemd-boot_236.bb>
>          create mode 100644
>         meta/recipes-core/systemd/systemd/0001-Also-check-i586-for-ia32.patch
>          create mode 100644
>         meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
>
>         diff --git a/meta/recipes-core/systemd/systemd-boot_234.bb
>         <http://systemd-boot_234.bb>
>         b/meta/recipes-core/systemd/systemd-boot_234.bb
>         <http://systemd-boot_234.bb>
>         deleted file mode 100644
>         index 88a14ac..0000000
>         --- a/meta/recipes-core/systemd/systemd-boot_234.bb
>         <http://systemd-boot_234.bb>
>         +++ /dev/null
>         @@ -1,43 +0,0 @@
>         -require systemd.inc
>         -FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
>         -
>         -DEPENDS = "intltool-native libcap util-linux gnu-efi
>         gperf-native"
>         -
>         -SRC_URI +=
>         "file://0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch"
>         -
>         -inherit autotools pkgconfig gettext
>         -inherit deploy
>         -
>         -EFI_CC ?= "${CC}"
>         -# Man pages are packaged through the main systemd recipe
>         -EXTRA_OECONF = " --enable-gnuefi \
>         -                 --with-efi-includedir=${STAGING_INCDIR} \
>         -                 --with-efi-ldsdir=${STAGING_LIBDIR} \
>         -                 --with-efi-libdir=${STAGING_LIBDIR} \
>         -                 --disable-manpages \
>         -                 EFI_CC='${EFI_CC}' \
>         -               "
>         -
>         -# Imported from the old gummiboot recipe
>         -TUNE_CCARGS_remove = "-mfpmath=sse"
>         -COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
>         -COMPATIBLE_HOST_x86-x32 = "null"
>         -
>         -do_compile() {
>         -       SYSTEMD_BOOT_EFI_ARCH="ia32"
>         -       if [ "${TARGET_ARCH}" = "x86_64" ]; then
>         -               SYSTEMD_BOOT_EFI_ARCH="x64"
>         -       fi
>         -
>         -       oe_runmake systemd-boot${SYSTEMD_BOOT_EFI_ARCH}.efi
>         -}
>         -
>         -do_install() {
>         -       # Bypass systemd installation with a NOP
>         -       :
>         -}
>         -
>         -do_deploy () {
>         -       install ${B}/systemd-boot*.efi ${DEPLOYDIR}
>         -}
>         -addtask deploy before do_build after do_compile
>         diff --git a/meta/recipes-core/systemd/systemd-boot_236.bb
>         <http://systemd-boot_236.bb>
>         b/meta/recipes-core/systemd/systemd-boot_236.bb
>         <http://systemd-boot_236.bb>
>         new file mode 100644
>         index 0000000..1a0135a
>         --- /dev/null
>         +++ b/meta/recipes-core/systemd/systemd-boot_236.bb
>         <http://systemd-boot_236.bb>
>         @@ -0,0 +1,49 @@
>         +require systemd.inc
>         +FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
>         +
>         +DEPENDS = "intltool-native libcap util-linux gnu-efi
>         gperf-native"
>         +
>         +SRC_URI +=
>         "file://0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>         \
>         +            file://0027-remove-nobody-user-group-checking.patch \
>         +            file://0001-Also-check-i586-for-ia32.patch \
>         +           
>         file://0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
>         \
>         +            "
>         +
>         +inherit meson pkgconfig gettext
>         +inherit deploy
>         +
>         +EFI_CC ?= "${CC}"
>         +
>         +EXTRA_OEMESON += "-Defi=true \
>         +                  -Dgnu-efi=true \
>         +                  -Defi-includedir=${STAGING_INCDIR}/efi \
>         +                  -Defi-ldsdir=${STAGING_LIBDIR} \
>         +                  -Defi-libdir=${STAGING_LIBDIR} \
>         +                  -Dman=false \
>         +                  -Defi-cc='${EFI_CC}' \
>         +                  -Defi-ld='${LD}' \
>         +                  "
>         +
>         +
>         +# Imported from the old gummiboot recipe
>         +TUNE_CCARGS_remove = "-mfpmath=sse"
>         +COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
>         +COMPATIBLE_HOST_x86-x32 = "null"
>         +
>         +do_compile() {
>         +       SYSTEMD_BOOT_EFI_ARCH="ia32"
>         +       if [ "${TARGET_ARCH}" == "x86_64" ]; then
>         +               SYSTEMD_BOOT_EFI_ARCH="x64"
>         +       fi
>         +       ninja
>         src/boot/efi/systemd-boot${SYSTEMD_BOOT_EFI_ARCH}.efi
>         +}
>         +
>         +do_install() {
>         +       # Bypass systemd installation with a NOP
>         +       :
>         +}
>         +
>         +do_deploy () {
>         +       install ${B}/src/boot/efi/systemd-boot*.efi ${DEPLOYDIR}
>         +}
>         +addtask deploy before do_build after do_compile
>         diff --git
>         a/meta/recipes-core/systemd/systemd/0001-Also-check-i586-for-ia32.patch
>         b/meta/recipes-core/systemd/systemd/0001-Also-check-i586-for-ia32.patch
>         new file mode 100644
>         index 0000000..892b25e
>         --- /dev/null
>         +++
>         b/meta/recipes-core/systemd/systemd/0001-Also-check-i586-for-ia32.patch
>         @@ -0,0 +1,28 @@
>         +From 4616e6f228d2678420ee7d5bb1c8a0c8ebb27be8 Mon Sep 17
>         00:00:00 2001
>         +From: Chen Qi <Qi.Chen@windriver.com
>         <mailto:Qi.Chen@windriver.com>>
>         +Date: Tue, 27 Feb 2018 20:42:41 -0800
>         +Subject: [PATCH] Also check i586 for ia32
>         +
>         +Upstream-Status: Pending
>         +
>         +Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>         <mailto:Qi.Chen@windriver.com>>
>         +---
>         + meson.build | 2 +-
>         + 1 file changed, 1 insertion(+), 1 deletion(-)
>         +
>         +diff --git a/meson.build b/meson.build
>         +index ddc061c12..abd1261d6 100644
>         +--- a/meson.build
>         ++++ b/meson.build
>         +@@ -1182,7 +1182,7 @@
>         conf.set10('SYSTEMD_SLOW_TESTS_DEFAULT', get_option('slow-tests'))
>         + if get_option('efi')
>         +         efi_arch = host_machine.cpu_family()
>         +
>         +-        if efi_arch == 'x86'
>         ++        if efi_arch == 'x86' or efi_arch == 'i586'
>         +                 EFI_MACHINE_TYPE_NAME = 'ia32'
>         +                 gnu_efi_arch = 'ia32'
>         +         elif efi_arch == 'x86_64'
>         +--
>         +2.13.0
>         +
>         diff --git
>         a/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
>         b/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
>         new file mode 100644
>         index 0000000..e2e19ba
>         --- /dev/null
>         +++
>         b/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
>         @@ -0,0 +1,62 @@
>         +From 527413ec243564a89ffaad6368d446de44415970 Mon Sep 17
>         00:00:00 2001
>         +From: Chen Qi <Qi.Chen@windriver.com
>         <mailto:Qi.Chen@windriver.com>>
>         +Date: Tue, 27 Feb 2018 21:42:23 -0800
>         +Subject: [PATCH] Fix to run efi_cc and efi_ld correctly when
>         cross-compiling
>         +
>         +When cross-compiling, efi_cc and efi_ld may take the form of
>         +'xxx-gcc --sysroot=xxx', and this would cause run_command and
>         +the alike fail.
>         +
>         +Fix to split them to make commands run correctly.
>         +
>         +Upstream-Status: Pending
>         +
>         +Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>         <mailto:Qi.Chen@windriver.com>>
>         +---
>         + src/boot/efi/meson.build | 16 +++++++++++++---
>         + 1 file changed, 13 insertions(+), 3 deletions(-)
>         +
>         +diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
>         +index 992a3ba4c..9f9ec4911 100644
>         +--- a/src/boot/efi/meson.build
>         ++++ b/src/boot/efi/meson.build
>         +@@ -157,7 +157,7 @@ if have_gnu_efi
>         +                 o_file = custom_target(file + '.o',
>         +                                        input : file,
>         +                                        output : file + '.o',
>         +-                                       command : [efi_cc,
>         '-c', '@INPUT@', '-o', '@OUTPUT@']
>         ++                                       command :
>         efi_cc.split() + ['-c', '@INPUT@', '-o', '@OUTPUT@']
>         + + compile_args,
>         + depend_files : efi_headers)
>         +                 if (common_sources +
>         systemd_boot_sources).contains(file)
>         +@@ -168,7 +168,17 @@ if have_gnu_efi
>         +                 endif
>         +         endforeach
>         +
>         +-        libgcc_file_name = run_command(efi_cc,
>         '-print-libgcc-file-name').stdout().strip()
>         ++        find_libgcc_cmd_all = efi_cc + '
>         -print-libgcc-file-name'
>         ++        find_libgcc_cmd = find_libgcc_cmd_all.split()[0]
>         ++        find_libgcc_args = []
>         ++        cmd_args_all = find_libgcc_cmd_all.split()
>         ++        foreach arg : cmd_args_all
>         ++                if arg != find_libgcc_cmd
>         ++                        find_libgcc_args += arg
>         ++                endif
>         ++        endforeach
>         ++
>         ++        libgcc_file_name = run_command(find_libgcc_cmd,
>         find_libgcc_args).stdout().strip()
>         +         systemd_boot_efi_name =
>         'systemd-boot@0@.efi'.format(EFI_MACHINE_TYPE_NAME)
>         +         stub_efi_name =
>         'linux@0@.efi.stub'.format(EFI_MACHINE_TYPE_NAME)
>         +         no_undefined_symbols =
>         find_program('no-undefined-symbols.sh')
>         +@@ -179,7 +189,7 @@ if have_gnu_efi
>         +                         tuple[0],
>         +                         input : tuple[2],
>         +                         output : tuple[0],
>         +-                        command : [efi_ld, '-o', '@OUTPUT@'] +
>         ++                        command : efi_ld.split() + ['-o',
>         '@OUTPUT@'] +
>         +                                   efi_ldflags + tuple[2] +
>         +                                   ['-lefi', '-lgnuefi',
>         libgcc_file_name])
>         +
>         +--
>         +2.13.0
>         +
>         --
>         1.9.1
>
>         --
>         _______________________________________________
>         Openembedded-core mailing list
>         Openembedded-core@lists.openembedded.org
>         <mailto:Openembedded-core@lists.openembedded.org>
>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
>         <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>
>


--------------A49FB6D7D2B59DEDD4E67C68
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Ross,<br>
      <br>
      I've fixed this problem and send patch to meta-intel. The problem
      is bout systemd-boot's bbappend file.<br>
      <br>
      I've also sent out a new patchset, upgrading systemd to 237, which
      keeps the 'manpages' PACKAGECONFIG item for compatibility.<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      On 02/28/2018 09:32 PM, Burton, Ross wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0Lb4n1KggfayXTWsuEp2inRBksC29UCOxKXjKimbiTX4PA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">No, still broken:
        <div><br>
        </div>
        <div>
          <div>ERROR: systemd-boot-236-r0 do_compile: oe_runmake failed</div>
          <div>ERROR: systemd-boot-236-r0 do_compile: Function failed:
            do_compile (log file is located at
/data/poky-tmp/master/work/corei7-64-intel-common-poky-linux/systemd-boot/236-r0/temp/log.do_compile.31074)</div>
          <div>ERROR: Logfile of failure stored in:
/data/poky-tmp/master/work/corei7-64-intel-common-poky-linux/systemd-boot/236-r0/temp/log.do_compile.31074</div>
          <div>Log data follows:</div>
          <div>| DEBUG: Executing shell function do_compile</div>
          <div>| [1/10] Generating console.c.o with a custom command.</div>
          <div>| [2/10] Generating graphics.c.o with a custom command.</div>
          <div>| [3/10] Generating pe.c.o with a custom command.</div>
          <div>| [4/10] Generating measure.c.o with a custom command.</div>
          <div>| [5/10] Generating disk.c.o with a custom command.</div>
          <div>| [6/10] Generating util.c.o with a custom command.</div>
          <div>| [7/10] Generating shim.c.o with a custom command.</div>
          <div>| [8/10] Generating boot.c.o with a custom command.</div>
          <div>| [9/10] Generating systemd_boot.so with a custom
            command.</div>
          <div>| [10/10] Generating systemd-bootx64.efi with a custom
            command.</div>
          <div>| NOTE: make -j 20 linuxx64.efi.stub</div>
          <div>| make: *** No rule to make target 'linuxx64.efi.stub'. 
            Stop.</div>
          <div>| ERROR: oe_runmake failed</div>
          <div>| WARNING: exit code 1 from a shell command.</div>
          <div>| ERROR: Function failed: do_compile (log file is located
            at
/data/poky-tmp/master/work/corei7-64-intel-common-poky-linux/systemd-boot/236-r0/temp/log.do_compile.31074)</div>
          <div>ERROR: Task
(/home/ross/Yocto/poky/meta/recipes-core/systemd/systemd-boot_236.bb:do_compile)
            failed with exit code '1'</div>
        </div>
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 28 February 2018 at 13:30, Burton,
          Ross <span dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:ross.burton@intel.com" target="_blank">ross.burton@intel.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div dir="ltr">
              <div>ERROR: systemd-boot-236-r0 do_compile: Function
                failed: do_compile (log file is located at
                /data/poky-tmp/master/work/<wbr>corei7-64-intel-common-poky-<wbr>linux/systemd-boot/236-r0/<wbr>temp/log.do_compile.10165)</div>
              <div>ERROR: Logfile of failure stored in:
                /data/poky-tmp/master/work/<wbr>corei7-64-intel-common-poky-<wbr>linux/systemd-boot/236-r0/<wbr>temp/log.do_compile.10165</div>
              <div>Log data follows:</div>
              <div>| DEBUG: Executing shell function do_compile</div>
              <div>| /data/poky-tmp/master/work/<wbr>corei7-64-intel-common-poky-<wbr>linux/systemd-boot/236-r0/<wbr>temp/run.do_compile.10165:
                109: [: x86_64: unexpected operator</div>
              <div>| ninja: error: unknown target 'src/boot/efi/systemd-<wbr>bootia32.efi'</div>
              <span class="">
                <div><br>
                </div>
                <div><span style="font-size:12.800000190734863px">+     
                     if [ "${TARGET_ARCH}" == "x86_64" ]; then</span><br
                    style="font-size:12.800000190734863px">
                </div>
                <div><span style="font-size:12.800000190734863px"><br>
                  </span></div>
              </span>
              <div><span style="font-size:12.800000190734863px">Remember
                  that == is a bashism and the correct operator for [ is
                  =.</span></div>
              <div><span style="font-size:12.800000190734863px"><br>
                </span></div>
              <div><span style="font-size:12.800000190734863px">(fix
                  squashed here)</span></div>
              <span class="HOEnZb"><font color="#888888">
                  <div><span style="font-size:12.800000190734863px"><br>
                    </span></div>
                  <div>Ross</div>
                </font></span></div>
            <div class="HOEnZb">
              <div class="h5">
                <div class="gmail_extra"><br>
                  <div class="gmail_quote">On 28 February 2018 at 05:56,
                    Chen Qi <span dir="ltr">&lt;<a
                        moz-do-not-send="true"
                        href="mailto:Qi.Chen@windriver.com"
                        target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
                    wrote:<br>
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">Upgrade
                      systemd-boot to 236.<br>
                      <br>
                      As systemd has dropped autotools support, fix
                      configure and compile<br>
                      failures related to meson.<br>
                      <br>
                      Signed-off-by: Chen Qi &lt;<a
                        moz-do-not-send="true"
                        href="mailto:Qi.Chen@windriver.com"
                        target="_blank">Qi.Chen@windriver.com</a>&gt;<br>
                      ---<br>
                       meta/recipes-core/systemd/<a
                        moz-do-not-send="true"
                        href="http://systemd-boot_234.bb"
                        rel="noreferrer" target="_blank">sys<wbr>temd-boot_234.bb</a> 
                          | 43 ---------------<br>
                       meta/recipes-core/systemd/<a
                        moz-do-not-send="true"
                        href="http://systemd-boot_236.bb"
                        rel="noreferrer" target="_blank">sys<wbr>temd-boot_236.bb</a> 
                          | 49 +++++++++++++++++<br>
                       .../systemd/0001-Also-check-i<wbr>586-for-ia32.patch 
                        | 28 ++++++++++<br>
                       ...efi_cc-and-efi_ld-correctl<wbr>y-when-cross-co.patch
                      | 62 ++++++++++++++++++++++<br>
                       4 files changed, 139 insertions(+), 43
                      deletions(-)<br>
                       delete mode 100644 meta/recipes-core/systemd/<a
                        moz-do-not-send="true"
                        href="http://systemd-boot_234.bb"
                        rel="noreferrer" target="_blank">syst<wbr>emd-boot_234.bb</a><br>
                       create mode 100644 meta/recipes-core/systemd/<a
                        moz-do-not-send="true"
                        href="http://systemd-boot_236.bb"
                        rel="noreferrer" target="_blank">syst<wbr>emd-boot_236.bb</a><br>
                       create mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0001-Also-check-i586-for-<wbr>ia32.patch<br>
                       create mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0001-Fix-to-run-efi_cc-<wbr>and-efi_ld-correctly-when-cros<wbr>s-co.patch<br>
                      <br>
                      diff --git a/meta/recipes-core/systemd/<a
                        moz-do-not-send="true"
                        href="http://systemd-boot_234.bb"
                        rel="noreferrer" target="_blank">sy<wbr>stemd-boot_234.bb</a>
                      b/meta/recipes-core/systemd/<a
                        moz-do-not-send="true"
                        href="http://systemd-boot_234.bb"
                        rel="noreferrer" target="_blank">sy<wbr>stemd-boot_234.bb</a><br>
                      deleted file mode 100644<br>
                      index 88a14ac..0000000<br>
                      --- a/meta/recipes-core/systemd/<a
                        moz-do-not-send="true"
                        href="http://systemd-boot_234.bb"
                        rel="noreferrer" target="_blank">sy<wbr>stemd-boot_234.bb</a><br>
                      +++ /dev/null<br>
                      @@ -1,43 +0,0 @@<br>
                      -require systemd.inc<br>
                      -FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"<br>
                      -<br>
                      -DEPENDS = "intltool-native libcap util-linux
                      gnu-efi gperf-native"<br>
                      -<br>
                      -SRC_URI += "<a class="moz-txt-link-freetext" href="file://0007-use-lnr-wrapper-i">file://0007-use-lnr-wrapper-i</a><wbr>nstead-of-looking-for-relative<wbr>-opti.patch"<br>
                      -<br>
                      -inherit autotools pkgconfig gettext<br>
                      -inherit deploy<br>
                      -<br>
                      -EFI_CC ?= "${CC}"<br>
                      -# Man pages are packaged through the main systemd
                      recipe<br>
                      -EXTRA_OECONF = " --enable-gnuefi \<br>
                      -                 --with-efi-includedir=${STAGI<wbr>NG_INCDIR}
                      \<br>
                      -                 --with-efi-ldsdir=${STAGING_L<wbr>IBDIR}
                      \<br>
                      -                 --with-efi-libdir=${STAGING_L<wbr>IBDIR}
                      \<br>
                      -                 --disable-manpages \<br>
                      -                 EFI_CC='${EFI_CC}' \<br>
                      -               "<br>
                      -<br>
                      -# Imported from the old gummiboot recipe<br>
                      -TUNE_CCARGS_remove = "-mfpmath=sse"<br>
                      -COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"<br>
                      -COMPATIBLE_HOST_x86-x32 = "null"<br>
                      -<br>
                      -do_compile() {<br>
                      -       SYSTEMD_BOOT_EFI_ARCH="ia32"<br>
                      -       if [ "${TARGET_ARCH}" = "x86_64" ]; then<br>
                      -               SYSTEMD_BOOT_EFI_ARCH="x64"<br>
                      -       fi<br>
                      -<br>
                      -       oe_runmake systemd-boot${SYSTEMD_BOOT_EFI<wbr>_ARCH}.efi<br>
                      -}<br>
                      -<br>
                      -do_install() {<br>
                      -       # Bypass systemd installation with a NOP<br>
                      -       :<br>
                      -}<br>
                      -<br>
                      -do_deploy () {<br>
                      -       install ${B}/systemd-boot*.efi
                      ${DEPLOYDIR}<br>
                      -}<br>
                      -addtask deploy before do_build after do_compile<br>
                      diff --git a/meta/recipes-core/systemd/<a
                        moz-do-not-send="true"
                        href="http://systemd-boot_236.bb"
                        rel="noreferrer" target="_blank">sy<wbr>stemd-boot_236.bb</a>
                      b/meta/recipes-core/systemd/<a
                        moz-do-not-send="true"
                        href="http://systemd-boot_236.bb"
                        rel="noreferrer" target="_blank">sy<wbr>stemd-boot_236.bb</a><br>
                      new file mode 100644<br>
                      index 0000000..1a0135a<br>
                      --- /dev/null<br>
                      +++ b/meta/recipes-core/systemd/<a
                        moz-do-not-send="true"
                        href="http://systemd-boot_236.bb"
                        rel="noreferrer" target="_blank">sy<wbr>stemd-boot_236.bb</a><br>
                      @@ -0,0 +1,49 @@<br>
                      +require systemd.inc<br>
                      +FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"<br>
                      +<br>
                      +DEPENDS = "intltool-native libcap util-linux
                      gnu-efi gperf-native"<br>
                      +<br>
                      +SRC_URI += "<a class="moz-txt-link-freetext" href="file://0003-use-lnr-wrapper-i">file://0003-use-lnr-wrapper-i</a><wbr>nstead-of-looking-for-relative<wbr>-opti.patch
                      \<br>
                      +            <a class="moz-txt-link-freetext" href="file://0027-remove-nobody-user">file://0027-remove-nobody-user</a><wbr>-group-checking.patch
                      \<br>
                      +            <a class="moz-txt-link-freetext" href="file://0001-Also-check-i586-fo">file://0001-Also-check-i586-fo</a><wbr>r-ia32.patch
                      \<br>
                      +            <a class="moz-txt-link-freetext" href="file://0001-Fix-to-run-efi_cc">file://0001-Fix-to-run-efi_cc</a>-<wbr>and-efi_ld-correctly-when-cros<wbr>s-co.patch
                      \<br>
                      +            "<br>
                      +<br>
                      +inherit meson pkgconfig gettext<br>
                      +inherit deploy<br>
                      +<br>
                      +EFI_CC ?= "${CC}"<br>
                      +<br>
                      +EXTRA_OEMESON += "-Defi=true \<br>
                      +                  -Dgnu-efi=true \<br>
                      +                  -Defi-includedir=${STAGING_INC<wbr>DIR}/efi
                      \<br>
                      +                  -Defi-ldsdir=${STAGING_LIBDIR}
                      \<br>
                      +                  -Defi-libdir=${STAGING_LIBDIR}
                      \<br>
                      +                  -Dman=false \<br>
                      +                  -Defi-cc='${EFI_CC}' \<br>
                      +                  -Defi-ld='${LD}' \<br>
                      +                  "<br>
                      +<br>
                      +<br>
                      +# Imported from the old gummiboot recipe<br>
                      +TUNE_CCARGS_remove = "-mfpmath=sse"<br>
                      +COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"<br>
                      +COMPATIBLE_HOST_x86-x32 = "null"<br>
                      +<br>
                      +do_compile() {<br>
                      +       SYSTEMD_BOOT_EFI_ARCH="ia32"<br>
                      +       if [ "${TARGET_ARCH}" == "x86_64" ]; then<br>
                      +               SYSTEMD_BOOT_EFI_ARCH="x64"<br>
                      +       fi<br>
                      +       ninja src/boot/efi/systemd-boot${SYS<wbr>TEMD_BOOT_EFI_ARCH}.efi<br>
                      +}<br>
                      +<br>
                      +do_install() {<br>
                      +       # Bypass systemd installation with a NOP<br>
                      +       :<br>
                      +}<br>
                      +<br>
                      +do_deploy () {<br>
                      +       install ${B}/src/boot/efi/systemd-boot<wbr>*.efi
                      ${DEPLOYDIR}<br>
                      +}<br>
                      +addtask deploy before do_build after do_compile<br>
                      diff --git a/meta/recipes-core/systemd/sy<wbr>stemd/0001-Also-check-i586-for<wbr>-ia32.patch
                      b/meta/recipes-core/systemd/sy<wbr>stemd/0001-Also-check-i586-for<wbr>-ia32.patch<br>
                      new file mode 100644<br>
                      index 0000000..892b25e<br>
                      --- /dev/null<br>
                      +++ b/meta/recipes-core/systemd/sy<wbr>stemd/0001-Also-check-i586-for<wbr>-ia32.patch<br>
                      @@ -0,0 +1,28 @@<br>
                      +From 4616e6f228d2678420ee7d5bb1c8a0<wbr>c8ebb27be8
                      Mon Sep 17 00:00:00 2001<br>
                      +From: Chen Qi &lt;<a moz-do-not-send="true"
                        href="mailto:Qi.Chen@windriver.com"
                        target="_blank">Qi.Chen@windriver.com</a>&gt;<br>
                      +Date: Tue, 27 Feb 2018 20:42:41 -0800<br>
                      +Subject: [PATCH] Also check i586 for ia32<br>
                      +<br>
                      +Upstream-Status: Pending<br>
                      +<br>
                      +Signed-off-by: Chen Qi &lt;<a
                        moz-do-not-send="true"
                        href="mailto:Qi.Chen@windriver.com"
                        target="_blank">Qi.Chen@windriver.com</a>&gt;<br>
                      +---<br>
                      + meson.build | 2 +-<br>
                      + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
                      +<br>
                      +diff --git a/meson.build b/meson.build<br>
                      +index ddc061c12..abd1261d6 100644<br>
                      +--- a/meson.build<br>
                      ++++ b/meson.build<br>
                      +@@ -1182,7 +1182,7 @@
                      conf.set10('SYSTEMD_SLOW_TESTS<wbr>_DEFAULT',
                      get_option('slow-tests'))<br>
                      + if get_option('efi')<br>
                      +         efi_arch = host_machine.cpu_family()<br>
                      +<br>
                      +-        if efi_arch == 'x86'<br>
                      ++        if efi_arch == 'x86' or efi_arch ==
                      'i586'<br>
                      +                 EFI_MACHINE_TYPE_NAME = 'ia32'<br>
                      +                 gnu_efi_arch = 'ia32'<br>
                      +         elif efi_arch == 'x86_64'<br>
                      +--<br>
                      +2.13.0<br>
                      +<br>
                      diff --git a/meta/recipes-core/systemd/sy<wbr>stemd/0001-Fix-to-run-efi_cc-<wbr>and-efi_ld-correctly-when-cros<wbr>s-co.patch
                      b/meta/recipes-core/systemd/sy<wbr>stemd/0001-Fix-to-run-efi_cc-<wbr>and-efi_ld-correctly-when-cros<wbr>s-co.patch<br>
                      new file mode 100644<br>
                      index 0000000..e2e19ba<br>
                      --- /dev/null<br>
                      +++ b/meta/recipes-core/systemd/sy<wbr>stemd/0001-Fix-to-run-efi_cc-<wbr>and-efi_ld-correctly-when-cros<wbr>s-co.patch<br>
                      @@ -0,0 +1,62 @@<br>
                      +From 527413ec243564a89ffaad6368d446<wbr>de44415970
                      Mon Sep 17 00:00:00 2001<br>
                      +From: Chen Qi &lt;<a moz-do-not-send="true"
                        href="mailto:Qi.Chen@windriver.com"
                        target="_blank">Qi.Chen@windriver.com</a>&gt;<br>
                      +Date: Tue, 27 Feb 2018 21:42:23 -0800<br>
                      +Subject: [PATCH] Fix to run efi_cc and efi_ld
                      correctly when cross-compiling<br>
                      +<br>
                      +When cross-compiling, efi_cc and efi_ld may take
                      the form of<br>
                      +'xxx-gcc --sysroot=xxx', and this would cause
                      run_command and<br>
                      +the alike fail.<br>
                      +<br>
                      +Fix to split them to make commands run correctly.<br>
                      +<br>
                      +Upstream-Status: Pending<br>
                      +<br>
                      +Signed-off-by: Chen Qi &lt;<a
                        moz-do-not-send="true"
                        href="mailto:Qi.Chen@windriver.com"
                        target="_blank">Qi.Chen@windriver.com</a>&gt;<br>
                      +---<br>
                      + src/boot/efi/meson.build | 16 +++++++++++++---<br>
                      + 1 file changed, 13 insertions(+), 3 deletions(-)<br>
                      +<br>
                      +diff --git a/src/boot/efi/meson.build
                      b/src/boot/efi/meson.build<br>
                      +index 992a3ba4c..9f9ec4911 100644<br>
                      +--- a/src/boot/efi/meson.build<br>
                      ++++ b/src/boot/efi/meson.build<br>
                      +@@ -157,7 +157,7 @@ if have_gnu_efi<br>
                      +                 o_file = custom_target(file +
                      '.o',<br>
                      +                                        input :
                      file,<br>
                      +                                        output :
                      file + '.o',<br>
                      +-                                       command :
                      [efi_cc, '-c', '@INPUT@', '-o', '@OUTPUT@']<br>
                      ++                                       command :
                      efi_cc.split() + ['-c', '@INPUT@', '-o',
                      '@OUTPUT@']<br>
                      +                                                 
                      + compile_args,<br>
                      +                                       
                      depend_files : efi_headers)<br>
                      +                 if (common_sources +
                      systemd_boot_sources).contains<wbr>(file)<br>
                      +@@ -168,7 +168,17 @@ if have_gnu_efi<br>
                      +                 endif<br>
                      +         endforeach<br>
                      +<br>
                      +-        libgcc_file_name = run_command(efi_cc,
                      '-print-libgcc-file-name').std<wbr>out().strip()<br>
                      ++        find_libgcc_cmd_all = efi_cc + '
                      -print-libgcc-file-name'<br>
                      ++        find_libgcc_cmd =
                      find_libgcc_cmd_all.split()[0]<br>
                      ++        find_libgcc_args = []<br>
                      ++        cmd_args_all =
                      find_libgcc_cmd_all.split()<br>
                      ++        foreach arg : cmd_args_all<br>
                      ++                if arg != find_libgcc_cmd<br>
                      ++                        find_libgcc_args += arg<br>
                      ++                endif<br>
                      ++        endforeach<br>
                      ++<br>
                      ++        libgcc_file_name =
                      run_command(find_libgcc_cmd,
                      find_libgcc_args).stdout().str<wbr>ip()<br>
                      +         systemd_boot_efi_name =
                      '<a class="moz-txt-link-abbreviated" href="mailto:systemd-boot@0@.efi">systemd-boot@0@.efi</a>'.format(E<wbr>FI_MACHINE_TYPE_NAME)<br>
                      +         stub_efi_name =
                      '<a class="moz-txt-link-abbreviated" href="mailto:linux@0@.efi.stub">linux@0@.efi.stub</a>'.format(EFI<wbr>_MACHINE_TYPE_NAME)<br>
                      +         no_undefined_symbols =
                      find_program('no-undefined-sym<wbr>bols.sh')<br>
                      +@@ -179,7 +189,7 @@ if have_gnu_efi<br>
                      +                         tuple[0],<br>
                      +                         input : tuple[2],<br>
                      +                         output : tuple[0],<br>
                      +-                        command : [efi_ld, '-o',
                      '@OUTPUT@'] +<br>
                      ++                        command : efi_ld.split()
                      + ['-o', '@OUTPUT@'] +<br>
                      +                                   efi_ldflags +
                      tuple[2] +<br>
                      +                                   ['-lefi',
                      '-lgnuefi', libgcc_file_name])<br>
                      +<br>
                      +--<br>
                      +2.13.0<br>
                      +<br>
                      <span class="m_569630576848120261HOEnZb"><font
                          color="#888888">--<br>
                          1.9.1<br>
                          <br>
                          --<br>
                          ______________________________<wbr>_________________<br>
                          Openembedded-core mailing list<br>
                          <a moz-do-not-send="true"
                            href="mailto:Openembedded-core@lists.openembedded.org"
                            target="_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
                          <a moz-do-not-send="true"
                            href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                            rel="noreferrer" target="_blank">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                        </font></span></blockquote>
                  </div>
                  <br>
                </div>
              </div>
            </div>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------A49FB6D7D2B59DEDD4E67C68--
