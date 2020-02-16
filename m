Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id A8C506108B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 09:21:58 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id g12so11735190ild.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 01:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=oXYcVU9haViuQEACtCr3IA0wRy0qkrVNe4km2yoUUZ4=;
	b=PULrgYVIZlHlQ4+RBXOVbMwf8e/cOVCel/UZJvdRvMOOTbmJbQSh4CEw3pnArIae5r
	YIonkOU9wNRH/aX95dSQtwuXODmRTugosoReLlFad4KP6bzyGfGJq1tJYdO7ou5/6kCc
	TEgPDSeBUTsvJvkJXgsR1smX8uhd7rC6zUVWRpz7sBaDTaZuPAO+60+J2pHGEzYr7kPH
	ad/8e0fJmL4pHE81YNc7uLgOq3aAw69tivJkguBpDMCD/lNK1f/+F5BjR2j9KYeI5gkj
	4IfCdGW+YIN23zgbYGMrFq+1mUj3NJElgRBO3h8clKiIkBH7P85qv8GNq+jSRd7wFdxw
	Akng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=oXYcVU9haViuQEACtCr3IA0wRy0qkrVNe4km2yoUUZ4=;
	b=oel38jcRKUocFOki5IDNE178jnJp4VpWbxCDFcd3IjkSAUV3PVkjzZg9OcGgxOCXt4
	pik7vohv0vy36/aCJaK6v/sDRlzh+LjbKdYUtWF7OdoNXm5EXqrx+4xq/CQ8njfRbis+
	Jkw00aL/lVjCqAjNEtttf59yxJvmxomFe2QkUPzt1FNyHOaNU28f3eUanxyIw/0qGFC9
	L5+zJcryY1tQabSnTOSqx0oGVZE4kaNHjsvG7aIvgoPCZJEaPa8lSNxLQ8R989ghv15V
	ZFkCxln0bkqjElOYCEevYYXywpUlUfG0CxbY0duWB0DhJz1LlyH2gRUJbGwM5KsBj1yA
	5Hww==
X-Gm-Message-State: APjAAAVfKKl5ScgfGsyogRmZRnz9GUOkwcpiKEo3LmyEuktU0OlRcTEi
	OdM8fvSqVOsOMFMr711roJNoqD5m0CSQLFc02y62/w==
X-Google-Smtp-Source: APXvYqwPhBx2XEHupGh/YqJTAychqgutyphBMHvBzKC3M/H4x7bh2j1+DaVWInrNb1w9qiAT6mNrqfAdqlpkuiUCFe8=
X-Received: by 2002:a92:1a0a:: with SMTP id a10mr10291131ila.295.1581844918934;
	Sun, 16 Feb 2020 01:21:58 -0800 (PST)
MIME-Version: 1.0
References: <20200216090720.48895-1-alex.kiernan@gmail.com>
In-Reply-To: <20200216090720.48895-1-alex.kiernan@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 16 Feb 2020 09:21:49 +0000
Message-ID: <CAO5Uq5Rn4YyWjp9Bx=JCd+mn4r+fbOV_fLPM20-xE=43maT0aA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5] systemd: upgrade v244.1 -> v244.3
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
X-List-Received-Date: Sun, 16 Feb 2020 09:21:58 -0000
Content-Type: multipart/alternative; boundary="0000000000007ba0ee059eadf830"

--0000000000007ba0ee059eadf830
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please ignore. I need to fix the commit message

On Sun, 16 Feb 2020, 09:07 Alex Kiernan, <alex.kiernan@gmail.com> wrote:

> Drop all systemd-boot patches and use MESON_CROSS_... configuration
> instead to pick up EFI cc and objcopy. For EFI ld, we can use the
> command line efi-ld option, but have to ensure it's something which can
> be exec'd directly.
>
> Commits from v244-stable:
>
>   c4280c342bbf Revert "Support Plugable UD-PRO8 dock"
>   bb598b56eb3c hibernate-resume-generator: wait "infinitely" for the
> resume device
>   77c04ce5c270 hwdb: update to v245-rc1
>   b4eb8848240c Fix typo in function name
>   e2d4cb9843c5 polkit: when authorizing via PK let's re-resolve
> callback/userdata instead of caching it
>   83bfc0d8dd02 sd-bus: introduce API for re-enqueuing incoming messages
>   5926f9f1723f polkit: use structured initialization
>   0697d0d972c8 polkit: on async pk requests, re-validate action/details
>   2589995acdb2 polkit: reuse some common bus message appending code
>   5b2442d5c3ec bus-polkit: rename return error parameter to ret_error
>   0a19ff7004e4 shared: split out polkit stuff from bus-util.c =E2=86=92
> bus-polkit.c
>   1325dfb5778d test: adapt to the new capsh format
>   3538fafb4714 meson: update efi path detection to gnu-efi-3.0.11
>   3034855a5b62 presets: "disable" all passive targets by default
>   c2e304681929 shared/sysctl-util: normalize repeated slashes or dots to =
a
> single value
>   6f4364046f90 dhcp6: do not use T1 and T2 longer than one provided by th=
e
> lease
>   0ed6cda28dff network: fix implicit type conversion warning by GCC-10
>   f6a5c02d26b1 bootspec: parse random-seed-mode line in loader.conf
>   ddc5dca8a73b sd-boot: fix typo
>   2bbbe9ae41ab test: Synchronize journal before reading from it
>   072485d661d7 sd-bus: fix introspection bug in signal parameter names
>   80af3cf5e36b efi: fix build.
>   d7ede1ade564 generator: order growfs for the root fs after
> systemd-remount-fs
>   e9904998213d loginctl: use /org/freedesktop/login1/session/auto when
> "lock-session" is called without argument
>   82dd4caf014c Documentation update for x-systemd.{before,after}
>   a60459764d9d man: fix typo in systemd.netdev Xfrm example
>   fc053e2dfb3f timesyncd: log louder when we refuse a server due to root
> distance
>   af0e630693fa resolved: drop DNSSEC root key that is not valid anymore
>   ae59f1666ca6 journal: don't use startswith() on something that is not a
> NUL-terminated string
>   536ef6d72bc6 test: add test for
> https://github.com/systemd/systemd/issues/14560
>   b78fe3c1b1a8 core: make sure StandardInput=3Dfile: doesn't get dup'ed t=
o
> stdout/stderr by default
>   a1561a08f2d5 pkgconf: add full generator paths
>   e5f2d11489ec tree-wide: we forgot to destroy some bus errors
>   ea67fd42067b mount: make checks on perpetual mount units more lax
>   2f23c648bce4 core: never allow perpetual units to be masked
>   9ba11dffb09a typo: "May modify to" -> "May modify"
>   84c048799a78 Disable reading SystemdOptions EFI Var when in SecureBoot
> mode
>   4c2d72b53091 sysctl: downgrade message when we have no permission
>   c001a285a3a2 Clarify journald.conf MaxLevelStore documentation
>   45d52c7615fd logind: refuse overriding idle hint on tty sessions
>   b1a0be45b4ee cgroup: update only siblings that got realized once
>   e6d694254fe1 mount: mark an existing "mounting" unit from
> /proc/self/mountinfo as "just_mounted"
>   d8fd38769c36 journalctl: Correctly handle combination of --reverse and
> --lines (fixes #1596)
>   cd19bd31d808 journalctl: Correctly handle --show-cursor in combination
> with --until or --since and --reverse
>   1320aa92dc0a core: fix re-realization of cgroup siblings
>   14164ec6bc77 core: propagate service state to socket in more load state=
s
>   c22bf6b31a45 man: describe "symlink" and "systemctl link" explicitly in
> UNIT FILE LOAD PATH
>   26f3a534f1ab core: be more restrictive on the dependency types we allow
> to be created transiently
>   377cc5d91ea5 udev: don't import parent ID_FS_ data on partitions
>   7d5060d53994 man: fix option name
>   98c03090274a Support Plugable UD-PRO8 dock
>   e9687d09dccf gpt-auto: don't assume XBOOTLDR is vfat
>   7057fe863007 man: fix documentation of IBM VIO device naming
>   f8d1df1045be man: slightly extend documentation on difference between
> ID_NET_NAME_ONBOARD and ID_NET_LABEL_ONBOARD
>   1faf5dde4d4a boot: fix osrel parser
>   65d247af1786 udev: do not use exact match of file permission
>   6da978f89b48 network: lower the log-level of harmless message
>   5d8a614f926c hwdb: ignore keys added in kernel 5.5
>   8b1bd1746989 systemctl: skip non-existent units in the 'cat' verb
>   b2f342f92b54 systemd.exec: document the file system for EnvironmentFile
> paths
>   945f3a231f6f systemd-analyze: fixed typo in documentation
>   2c8ae283b0ee test-condition: fix group check condition
>   6b48479f4582 umount: show correct error message
>   faba5b2ba8c9 Revert "Drop dbus activation stub service"
>   3dd98f1998f9 man: add section about user manager units
>   1c80a8ced006 man: add remote-*.targets to the bootup sequence
>   9afd65f15e93 time-util: also use 32bit hack on EOVERFLOW
>   561923291383 [man] note which UID ranges will get user journals
>   588a23ef2684 [man] fix URL
>   0130a03179f6 analyze: badness if neither of RootImage and RootDirectory
> exists
>   93074c962e3a network: introduce AddPrefixRoute=3D and deprecate
> PrefixRoute=3D
>   a8ad020ea0ba shared/dropin: fix assert for invalid drop-in
>   946cdba156dd initrd: make udev cleanup service confict trigger and
> settle too
>   c0a8a92e6027 man: we support growing xfs too these days
>   608d88273494 time-util: deal with systems where userspace has 64bit
> time_t but kernel does not
>   cfced59a4bd8 [import] fix stdin/stdout pipe behavior in import/export
> tar/raw
>   73435b219553 systemctl: show what verbs support --dry-run in the help
> page
>   dc56b94e1308 cryptsetup-generator: unconfuse writing of the device
> timeout
>   0757ad565573 shared/install: log syntax error for invalid
> DefaultInstance=3D
>   d2471109d999 shared/install: provide a nicer error message for invalid
> WantedBy=3D/Required=3D values
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
> Changes in v5:
> - use multiple cross-file support to inject the necessary binaries into
>   meson
>
> Changes in v4:
> - add missed commit to join EFI ldflags after stripping command
>
> Changes in v3:
> - use MESON_CROSS_... for systemd-boot
>
> Changes in v2:
> - fix SRC_URI now v244.3 tag exists on v244-stable
>
>  ...md-boot_244.1.bb =3D> systemd-boot_244.3.bb} | 26 +++----
>  ...md-conf_244.1.bb =3D> systemd-conf_244.3.bb} |  0
>  meta/recipes-core/systemd/systemd.inc         |  2 +-
>  ...c-and-efi_ld-correctly-when-cross-co.patch | 62 ---------------
>  ...on-print-EFI-CC-configuration-nicely.patch | 33 --------
>  ...meson-use-an-array-option-for-efi-cc.patch | 77 -------------------
>  ...fi-objcopy-option-to-specify-objcopy.patch | 48 ------------
>  .../{systemd_244.1.bb =3D> systemd_244.3.bb}    |  0
>  8 files changed, 14 insertions(+), 234 deletions(-)
>  rename meta/recipes-core/systemd/{systemd-boot_244.1.bb =3D>
> systemd-boot_244.3.bb} (71%)
>  rename meta/recipes-core/systemd/{systemd-conf_244.1.bb =3D>
> systemd-conf_244.3.bb} (100%)
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-corre=
ctly-when-cross-co.patch
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0001-Revert-meson-print-EFI-CC-configur=
ation-nicely.patch
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0001-Revert-meson-use-an-array-option-f=
or-efi-cc.patch
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0001-meson-Add-Defi-objcopy-option-to-s=
pecify-objcopy.patch
>  rename meta/recipes-core/systemd/{systemd_244.1.bb =3D> systemd_244.3.bb=
}
> (100%)
>
> diff --git a/meta/recipes-core/systemd/systemd-boot_244.1.bb
> b/meta/recipes-core/systemd/systemd-boot_244.3.bb
> similarity index 71%
> rename from meta/recipes-core/systemd/systemd-boot_244.1.bb
> rename to meta/recipes-core/systemd/systemd-boot_244.3.bb
> index 515abc289bef..f92c63981043 100644
> --- a/meta/recipes-core/systemd/systemd-boot_244.1.bb
> +++ b/meta/recipes-core/systemd/systemd-boot_244.3.bb
> @@ -5,27 +5,27 @@ require conf/image-uefi.conf
>
>  DEPENDS =3D "intltool-native libcap util-linux gnu-efi gperf-native"
>
> -# NOTE: These three patches are in theory not needed, but we haven't
> -#       figured out how to correctly pass efi-cc parameter if it's an
> array.
> -SRC_URI +=3D "file://0001-Revert-meson-use-an-array-option-for-efi-cc.pa=
tch
> \
> -
> file://0001-Revert-meson-print-EFI-CC-configuration-nicely.patch \
> -
> file://0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch \
> -
> file://0001-meson-Add-Defi-objcopy-option-to-specify-objcopy.patch \
> -            "
> -
>  inherit meson pkgconfig gettext
>  inherit deploy
>
> -EFI_CC ?=3D "${CC}"
> +LDFLAGS_prepend =3D "${@ " ".join(d.getVar('LD').split()[1:])} "
> +
> +do_write_config[vardeps] +=3D "CC OBJCOPY"
> +do_write_config_append() {
> +    cat >${WORKDIR}/meson-${PN}.cross <<EOF
> +[binaries]
> +efi_cc =3D ${@meson_array('CC', d)}
> +objcopy =3D ${@meson_array('OBJCOPY', d)}
> +EOF
> +}
> +
>  EXTRA_OEMESON +=3D "-Defi=3Dtrue \
>                    -Dgnu-efi=3Dtrue \
>                    -Defi-includedir=3D${STAGING_INCDIR}/efi \
> -                  -Defi-ldsdir=3D${STAGING_LIBDIR} \
>                    -Defi-libdir=3D${STAGING_LIBDIR} \
> +                  -Defi-ld=3D${@ d.getVar('LD').split()[0]} \
>                    -Dman=3Dfalse \
> -                  -Defi-cc=3D'${EFI_CC}' \
> -                  -Defi-ld=3D'${LD}' \
> -                  -Defi-objcopy=3D'${OBJCOPY}' \
> +                  --cross-file ${WORKDIR}/meson-${PN}.cross \
>                    "
>
>  # install to the image as boot*.efi if its the EFI_PROVIDER,
> diff --git a/meta/recipes-core/systemd/systemd-conf_244.1.bb
> b/meta/recipes-core/systemd/systemd-conf_244.3.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-conf_244.1.bb
> rename to meta/recipes-core/systemd/systemd-conf_244.3.bb
> diff --git a/meta/recipes-core/systemd/systemd.inc
> b/meta/recipes-core/systemd/systemd.inc
> index 8c05a96ecc4f..e73b397b5d64 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -14,7 +14,7 @@ LICENSE =3D "GPLv2 & LGPLv2.1"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaabaa882bbe \
>
>  file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c"
>
> -SRCREV =3D "639dc9f4bfd2c09535bee079ae9bc7006b520a66"
> +SRCREV =3D "b7ed902b2394f94e7f1fbe6c3194b5cd9a9429e6"
>  SRCBRANCH =3D "v244-stable"
>  SRC_URI =3D "git://
> github.com/systemd/systemd-stable.git;protocol=3Dgit;branch=3D${SRCBRANCH=
}
> <http://github.com/systemd/systemd-stable.git;protocol=3Dgit;branch=3D$%7=
BSRCBRANCH%7D>
> "
>
> diff --git
> a/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-cor=
rectly-when-cross-co.patch
> b/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-cor=
rectly-when-cross-co.patch
> deleted file mode 100644
> index e2e19ba06810..000000000000
> ---
> a/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-cor=
rectly-when-cross-co.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -From 527413ec243564a89ffaad6368d446de44415970 Mon Sep 17 00:00:00 2001
> -From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Tue, 27 Feb 2018 21:42:23 -0800
> -Subject: [PATCH] Fix to run efi_cc and efi_ld correctly when
> cross-compiling
> -
> -When cross-compiling, efi_cc and efi_ld may take the form of
> -'xxx-gcc --sysroot=3Dxxx', and this would cause run_command and
> -the alike fail.
> -
> -Fix to split them to make commands run correctly.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - src/boot/efi/meson.build | 16 +++++++++++++---
> - 1 file changed, 13 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
> -index 992a3ba4c..9f9ec4911 100644
> ---- a/src/boot/efi/meson.build
> -+++ b/src/boot/efi/meson.build
> -@@ -157,7 +157,7 @@ if have_gnu_efi
> -                 o_file =3D custom_target(file + '.o',
> -                                        input : file,
> -                                        output : file + '.o',
> --                                       command : [efi_cc, '-c', '@INPUT=
@',
> '-o', '@OUTPUT@']
> -+                                       command : efi_cc.split() + ['-c'=
,
> '@INPUT@', '-o', '@OUTPUT@']
> -                                                  + compile_args,
> -                                        depend_files : efi_headers)
> -                 if (common_sources + systemd_boot_sources).contains(fil=
e)
> -@@ -168,7 +168,17 @@ if have_gnu_efi
> -                 endif
> -         endforeach
> -
> --        libgcc_file_name =3D run_command(efi_cc,
> '-print-libgcc-file-name').stdout().strip()
> -+        find_libgcc_cmd_all =3D efi_cc + ' -print-libgcc-file-name'
> -+        find_libgcc_cmd =3D find_libgcc_cmd_all.split()[0]
> -+        find_libgcc_args =3D []
> -+        cmd_args_all =3D find_libgcc_cmd_all.split()
> -+        foreach arg : cmd_args_all
> -+                if arg !=3D find_libgcc_cmd
> -+                        find_libgcc_args +=3D arg
> -+                endif
> -+        endforeach
> -+
> -+        libgcc_file_name =3D run_command(find_libgcc_cmd,
> find_libgcc_args).stdout().strip()
> -         systemd_boot_efi_name =3D 'systemd-boot@0
> @.efi'.format(EFI_MACHINE_TYPE_NAME)
> -         stub_efi_name =3D 'linux@0
> @.efi.stub'.format(EFI_MACHINE_TYPE_NAME)
> -         no_undefined_symbols =3D find_program('no-undefined-symbols.sh'=
)
> -@@ -179,7 +189,7 @@ if have_gnu_efi
> -                         tuple[0],
> -                         input : tuple[2],
> -                         output : tuple[0],
> --                        command : [efi_ld, '-o', '@OUTPUT@'] +
> -+                        command : efi_ld.split() + ['-o', '@OUTPUT@'] +
> -                                   efi_ldflags + tuple[2] +
> -                                   ['-lefi', '-lgnuefi',
> libgcc_file_name])
> -
> ---
> -2.13.0
> -
> diff --git
> a/meta/recipes-core/systemd/systemd/0001-Revert-meson-print-EFI-CC-config=
uration-nicely.patch
> b/meta/recipes-core/systemd/systemd/0001-Revert-meson-print-EFI-CC-config=
uration-nicely.patch
> deleted file mode 100644
> index ed14e25bce66..000000000000
> ---
> a/meta/recipes-core/systemd/systemd/0001-Revert-meson-print-EFI-CC-config=
uration-nicely.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 0bf530aac152630500939db31f98d933158fdabd Mon Sep 17 00:00:00 2001
> -From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Tue, 26 Feb 2019 14:27:49 +0800
> -Subject: [PATCH] Revert "meson: print EFI CC configuration nicely"
> -
> -This reverts commit c512dfb9ac948ddb1ced0dab07b9dac88b198293.
> -
> -This patch is here because we haven't figured out how to pass
> -parameter to efi-cc if it's an array in systemd-boot recipe.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 70fb218..30df834 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -3138,7 +3138,7 @@ if conf.get('ENABLE_EFI') =3D=3D 1
> -         if have_gnu_efi
> -                 status +=3D [
> -                         'EFI machine type:                  @0@
> '.format(EFI_MACHINE_TYPE_NAME),
> --                        'EFI CC                             @0@'.format=
('
> '.join(efi_cc)),
> -+                        'EFI CC                             @0@
> '.format(efi_cc),
> -                         'EFI lib directory:                 @0@
> '.format(efi_libdir),
> -                         'EFI lds directory:                 @0@
> '.format(efi_ldsdir),
> -                         'EFI include directory:             @0@
> '.format(efi_incdir)]
> ---
> -2.7.4
> -
> diff --git
> a/meta/recipes-core/systemd/systemd/0001-Revert-meson-use-an-array-option=
-for-efi-cc.patch
> b/meta/recipes-core/systemd/systemd/0001-Revert-meson-use-an-array-option=
-for-efi-cc.patch
> deleted file mode 100644
> index 0d2ebf62bd1f..000000000000
> ---
> a/meta/recipes-core/systemd/systemd/0001-Revert-meson-use-an-array-option=
-for-efi-cc.patch
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -From 0030dcbac1a9177ef7a28af209ac67149b899f5f Mon Sep 17 00:00:00 2001
> -From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Tue, 26 Feb 2019 14:17:25 +0800
> -Subject: [PATCH] Revert "meson: use an array option for efi-cc"
> -
> -This reverts commit 595343fb4c99c2679d347ef7c19debfbfed6342e.
> -
> -This patch is here because we haven't figured out how to pass
> -parameter to efi-cc if it's an array in systemd-boot recipe.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - meson_options.txt        |  2 +-
> - src/boot/efi/meson.build | 11 ++++++-----
> - 2 files changed, 7 insertions(+), 6 deletions(-)
> -
> -diff --git a/meson_options.txt b/meson_options.txt
> -index 044bb79..3d28bfd 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -292,7 +292,7 @@ option('dbus', type : 'combo', choices : ['auto',
> 'true', 'false'],
> -
> - option('gnu-efi', type : 'combo', choices : ['auto', 'true', 'false'],
> -        description : 'gnu-efi support for sd-boot')
> --option('efi-cc', type : 'array',
> -+option('efi-cc', type : 'string',
> -        description : 'the compiler to use for EFI modules')
> - option('efi-ld', type : 'string',
> -        description : 'the linker to use for EFI modules')
> -diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
> -index 2140151..d8db3a1 100644
> ---- a/src/boot/efi/meson.build
> -+++ b/src/boot/efi/meson.build
> -@@ -34,8 +34,8 @@ stub_sources =3D '''
> -
> - if conf.get('ENABLE_EFI') =3D=3D 1 and get_option('gnu-efi') !=3D 'fals=
e'
> -         efi_cc =3D get_option('efi-cc')
> --        if efi_cc.length() =3D=3D 0
> --                efi_cc =3D cc.cmd_array()
> -+        if efi_cc =3D=3D ''
> -+                efi_cc =3D ' '.join(cc.cmd_array())
> -         endif
> -         efi_ld =3D get_option('efi-ld')
> -         if efi_ld =3D=3D ''
> -@@ -57,7 +57,8 @@ if conf.get('ENABLE_EFI') =3D=3D 1 and
> get_option('gnu-efi') !=3D 'false'
> -
> -         efi_libdir =3D get_option('efi-libdir')
> -         if efi_libdir =3D=3D ''
> --                ret =3D run_command(efi_cc + ['-print-multi-os-director=
y'])
> -+                cmd =3D 'cd /usr/lib/$(@0@ -print-multi-os-directory) &=
&
> pwd'.format(efi_cc)
> -+                ret =3D run_command('sh', '-c', cmd)
> -                 if ret.returncode() =3D=3D 0
> -                         path =3D join_paths('/usr/lib',
> ret.stdout().strip())
> -                         ret =3D run_command('realpath', '-e', path)
> -@@ -152,7 +153,7 @@ if have_gnu_efi
> -                 o_file =3D custom_target(file + '.o',
> -                                        input : file,
> -                                        output : file + '.o',
> --                                       command : efi_cc + ['-c', '@INPU=
T@',
> '-o', '@OUTPUT@']
> -+                                       command : [efi_cc, '-c', '@INPUT=
@',
> '-o', '@OUTPUT@']
> -                                                  + compile_args,
> -                                        depend_files : efi_headers)
> -                 if (common_sources + systemd_boot_sources).contains(fil=
e)
> -@@ -163,7 +164,7 @@ if have_gnu_efi
> -                 endif
> -         endforeach
> -
> --        libgcc_file_name =3D run_command(efi_cc +
> ['-print-libgcc-file-name']).stdout().strip()
> -+        libgcc_file_name =3D run_command(efi_cc,
> '-print-libgcc-file-name').stdout().strip()
> -         systemd_boot_efi_name =3D 'systemd-boot@0
> @.efi'.format(EFI_MACHINE_TYPE_NAME)
> -         stub_efi_name =3D 'linux@0
> @.efi.stub'.format(EFI_MACHINE_TYPE_NAME)
> -         no_undefined_symbols =3D find_program('no-undefined-symbols.sh'=
)
> ---
> -2.7.4
> -
> diff --git
> a/meta/recipes-core/systemd/systemd/0001-meson-Add-Defi-objcopy-option-to=
-specify-objcopy.patch
> b/meta/recipes-core/systemd/systemd/0001-meson-Add-Defi-objcopy-option-to=
-specify-objcopy.patch
> deleted file mode 100644
> index 7d764b4115eb..000000000000
> ---
> a/meta/recipes-core/systemd/systemd/0001-meson-Add-Defi-objcopy-option-to=
-specify-objcopy.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 3f37ad5e083dcad51c21c1050b2829b70d240b52 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 6 Aug 2019 03:10:20 +0000
> -Subject: [PATCH] meson: Add -Defi-objcopy option to specify objcopy
> -
> -This helps in cross compiling for x86 target on a aarch64 host e.g.
> -Fixes
> -TOPDIR/build/tmp/hosttools/objcopy:src/boot/efi/systemd_boot.so: Invalid
> bfd target
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - meson_options.txt        | 2 ++
> - src/boot/efi/meson.build | 5 ++++-
> - 2 files changed, 6 insertions(+), 1 deletion(-)
> -
> -diff --git a/meson_options.txt b/meson_options.txt
> -index d4ec37dda2..dc1c96e112 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -296,6 +296,8 @@ option('efi-cc', type : 'array',
> -        description : 'the compiler to use for EFI modules')
> - option('efi-ld', type : 'string',
> -        description : 'the linker to use for EFI modules')
> -+option('efi-objcopy', type : 'string',
> -+       description : 'the objcopy to use for EFI')
> - option('efi-libdir', type : 'string',
> -        description : 'path to the EFI lib directory')
> - option('efi-ldsdir', type : 'string',
> -diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
> -index 0ae3191635..5a7137bc84 100644
> ---- a/src/boot/efi/meson.build
> -+++ b/src/boot/efi/meson.build
> -@@ -88,7 +88,10 @@ if have_gnu_efi
> -                 output : 'efi_config.h',
> -                 configuration : efi_conf)
> -
> --        objcopy =3D find_program('objcopy')
> -+        objcopy =3D get_option('efi-objcopy')
> -+        if objcopy =3D=3D ''
> -+                objcopy =3D find_program('objcopy', required: true)
> -+        endif
> -
> -         efi_ldsdir =3D get_option('efi-ldsdir')
> -         arch_lds =3D 'elf_@0@_efi.lds'.format(gnu_efi_path_arch)
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-core/systemd/systemd_244.1.bb
> b/meta/recipes-core/systemd/systemd_244.3.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd_244.1.bb
> rename to meta/recipes-core/systemd/systemd_244.3.bb
> --
> 2.17.1
>
>

--0000000000007ba0ee059eadf830
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Please ignore. I need to fix the commit message<br><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun,=
 16 Feb 2020, 09:07 Alex Kiernan, &lt;<a href=3D"mailto:alex.kiernan@gmail.=
com">alex.kiernan@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Drop all systemd-boot patches and use MESON_CROSS_... configuration=
<br>
instead to pick up EFI cc and objcopy. For EFI ld, we can use the<br>
command line efi-ld option, but have to ensure it&#39;s something which can=
<br>
be exec&#39;d directly.<br>
<br>
Commits from v244-stable:<br>
<br>
=C2=A0 c4280c342bbf Revert &quot;Support Plugable UD-PRO8 dock&quot;<br>
=C2=A0 bb598b56eb3c hibernate-resume-generator: wait &quot;infinitely&quot;=
 for the resume device<br>
=C2=A0 77c04ce5c270 hwdb: update to v245-rc1<br>
=C2=A0 b4eb8848240c Fix typo in function name<br>
=C2=A0 e2d4cb9843c5 polkit: when authorizing via PK let&#39;s re-resolve ca=
llback/userdata instead of caching it<br>
=C2=A0 83bfc0d8dd02 sd-bus: introduce API for re-enqueuing incoming message=
s<br>
=C2=A0 5926f9f1723f polkit: use structured initialization<br>
=C2=A0 0697d0d972c8 polkit: on async pk requests, re-validate action/detail=
s<br>
=C2=A0 2589995acdb2 polkit: reuse some common bus message appending code<br=
>
=C2=A0 5b2442d5c3ec bus-polkit: rename return error parameter to ret_error<=
br>
=C2=A0 0a19ff7004e4 shared: split out polkit stuff from bus-util.c =E2=86=
=92 bus-polkit.c<br>
=C2=A0 1325dfb5778d test: adapt to the new capsh format<br>
=C2=A0 3538fafb4714 meson: update efi path detection to gnu-efi-3.0.11<br>
=C2=A0 3034855a5b62 presets: &quot;disable&quot; all passive targets by def=
ault<br>
=C2=A0 c2e304681929 shared/sysctl-util: normalize repeated slashes or dots =
to a single value<br>
=C2=A0 6f4364046f90 dhcp6: do not use T1 and T2 longer than one provided by=
 the lease<br>
=C2=A0 0ed6cda28dff network: fix implicit type conversion warning by GCC-10=
<br>
=C2=A0 f6a5c02d26b1 bootspec: parse random-seed-mode line in loader.conf<br=
>
=C2=A0 ddc5dca8a73b sd-boot: fix typo<br>
=C2=A0 2bbbe9ae41ab test: Synchronize journal before reading from it<br>
=C2=A0 072485d661d7 sd-bus: fix introspection bug in signal parameter names=
<br>
=C2=A0 80af3cf5e36b efi: fix build.<br>
=C2=A0 d7ede1ade564 generator: order growfs for the root fs after systemd-r=
emount-fs<br>
=C2=A0 e9904998213d loginctl: use /org/freedesktop/login1/session/auto when=
 &quot;lock-session&quot; is called without argument<br>
=C2=A0 82dd4caf014c Documentation update for x-systemd.{before,after}<br>
=C2=A0 a60459764d9d man: fix typo in systemd.netdev Xfrm example<br>
=C2=A0 fc053e2dfb3f timesyncd: log louder when we refuse a server due to ro=
ot distance<br>
=C2=A0 af0e630693fa resolved: drop DNSSEC root key that is not valid anymor=
e<br>
=C2=A0 ae59f1666ca6 journal: don&#39;t use startswith() on something that i=
s not a NUL-terminated string<br>
=C2=A0 536ef6d72bc6 test: add test for <a href=3D"https://github.com/system=
d/systemd/issues/14560" rel=3D"noreferrer noreferrer" target=3D"_blank">htt=
ps://github.com/systemd/systemd/issues/14560</a><br>
=C2=A0 b78fe3c1b1a8 core: make sure StandardInput=3Dfile: doesn&#39;t get d=
up&#39;ed to stdout/stderr by default<br>
=C2=A0 a1561a08f2d5 pkgconf: add full generator paths<br>
=C2=A0 e5f2d11489ec tree-wide: we forgot to destroy some bus errors<br>
=C2=A0 ea67fd42067b mount: make checks on perpetual mount units more lax<br=
>
=C2=A0 2f23c648bce4 core: never allow perpetual units to be masked<br>
=C2=A0 9ba11dffb09a typo: &quot;May modify to&quot; -&gt; &quot;May modify&=
quot;<br>
=C2=A0 84c048799a78 Disable reading SystemdOptions EFI Var when in SecureBo=
ot mode<br>
=C2=A0 4c2d72b53091 sysctl: downgrade message when we have no permission<br=
>
=C2=A0 c001a285a3a2 Clarify journald.conf MaxLevelStore documentation<br>
=C2=A0 45d52c7615fd logind: refuse overriding idle hint on tty sessions<br>
=C2=A0 b1a0be45b4ee cgroup: update only siblings that got realized once<br>
=C2=A0 e6d694254fe1 mount: mark an existing &quot;mounting&quot; unit from =
/proc/self/mountinfo as &quot;just_mounted&quot;<br>
=C2=A0 d8fd38769c36 journalctl: Correctly handle combination of --reverse a=
nd --lines (fixes #1596)<br>
=C2=A0 cd19bd31d808 journalctl: Correctly handle --show-cursor in combinati=
on with --until or --since and --reverse<br>
=C2=A0 1320aa92dc0a core: fix re-realization of cgroup siblings<br>
=C2=A0 14164ec6bc77 core: propagate service state to socket in more load st=
ates<br>
=C2=A0 c22bf6b31a45 man: describe &quot;symlink&quot; and &quot;systemctl l=
ink&quot; explicitly in UNIT FILE LOAD PATH<br>
=C2=A0 26f3a534f1ab core: be more restrictive on the dependency types we al=
low to be created transiently<br>
=C2=A0 377cc5d91ea5 udev: don&#39;t import parent ID_FS_ data on partitions=
<br>
=C2=A0 7d5060d53994 man: fix option name<br>
=C2=A0 98c03090274a Support Plugable UD-PRO8 dock<br>
=C2=A0 e9687d09dccf gpt-auto: don&#39;t assume XBOOTLDR is vfat<br>
=C2=A0 7057fe863007 man: fix documentation of IBM VIO device naming<br>
=C2=A0 f8d1df1045be man: slightly extend documentation on difference betwee=
n ID_NET_NAME_ONBOARD and ID_NET_LABEL_ONBOARD<br>
=C2=A0 1faf5dde4d4a boot: fix osrel parser<br>
=C2=A0 65d247af1786 udev: do not use exact match of file permission<br>
=C2=A0 6da978f89b48 network: lower the log-level of harmless message<br>
=C2=A0 5d8a614f926c hwdb: ignore keys added in kernel 5.5<br>
=C2=A0 8b1bd1746989 systemctl: skip non-existent units in the &#39;cat&#39;=
 verb<br>
=C2=A0 b2f342f92b54 systemd.exec: document the file system for EnvironmentF=
ile paths<br>
=C2=A0 945f3a231f6f systemd-analyze: fixed typo in documentation<br>
=C2=A0 2c8ae283b0ee test-condition: fix group check condition<br>
=C2=A0 6b48479f4582 umount: show correct error message<br>
=C2=A0 faba5b2ba8c9 Revert &quot;Drop dbus activation stub service&quot;<br=
>
=C2=A0 3dd98f1998f9 man: add section about user manager units<br>
=C2=A0 1c80a8ced006 man: add remote-*.targets to the bootup sequence<br>
=C2=A0 9afd65f15e93 time-util: also use 32bit hack on EOVERFLOW<br>
=C2=A0 561923291383 [man] note which UID ranges will get user journals<br>
=C2=A0 588a23ef2684 [man] fix URL<br>
=C2=A0 0130a03179f6 analyze: badness if neither of RootImage and RootDirect=
ory exists<br>
=C2=A0 93074c962e3a network: introduce AddPrefixRoute=3D and deprecate Pref=
ixRoute=3D<br>
=C2=A0 a8ad020ea0ba shared/dropin: fix assert for invalid drop-in<br>
=C2=A0 946cdba156dd initrd: make udev cleanup service confict trigger and s=
ettle too<br>
=C2=A0 c0a8a92e6027 man: we support growing xfs too these days<br>
=C2=A0 608d88273494 time-util: deal with systems where userspace has 64bit =
time_t but kernel does not<br>
=C2=A0 cfced59a4bd8 [import] fix stdin/stdout pipe behavior in import/expor=
t tar/raw<br>
=C2=A0 73435b219553 systemctl: show what verbs support --dry-run in the hel=
p page<br>
=C2=A0 dc56b94e1308 cryptsetup-generator: unconfuse writing of the device t=
imeout<br>
=C2=A0 0757ad565573 shared/install: log syntax error for invalid DefaultIns=
tance=3D<br>
=C2=A0 d2471109d999 shared/install: provide a nicer error message for inval=
id WantedBy=3D/Required=3D values<br>
<br>
Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">alex.kiernan@gmail.com</a>&gt;<br>
---<br>
<br>
Changes in v5:<br>
- use multiple cross-file support to inject the necessary binaries into<br>
=C2=A0 meson<br>
<br>
Changes in v4:<br>
- add missed commit to join EFI ldflags after stripping command<br>
<br>
Changes in v3:<br>
- use MESON_CROSS_... for systemd-boot<br>
<br>
Changes in v2:<br>
- fix SRC_URI now v244.3 tag exists on v244-stable<br>
<br>
=C2=A0...<a href=3D"http://md-boot_244.1.bb" rel=3D"noreferrer noreferrer" =
target=3D"_blank">md-boot_244.1.bb</a> =3D&gt; <a href=3D"http://systemd-bo=
ot_244.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">systemd-boot_2=
44.3.bb</a>} | 26 +++----<br>
=C2=A0...<a href=3D"http://md-conf_244.1.bb" rel=3D"noreferrer noreferrer" =
target=3D"_blank">md-conf_244.1.bb</a> =3D&gt; <a href=3D"http://systemd-co=
nf_244.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">systemd-conf_2=
44.3.bb</a>} |=C2=A0 0<br>
=C2=A0meta/recipes-core/systemd/systemd.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
=C2=A0...c-and-efi_ld-correctly-when-cross-co.patch | 62 ---------------<br=
>
=C2=A0...on-print-EFI-CC-configuration-nicely.patch | 33 --------<br>
=C2=A0...meson-use-an-array-option-for-efi-cc.patch | 77 ------------------=
-<br>
=C2=A0...fi-objcopy-option-to-specify-objcopy.patch | 48 ------------<br>
=C2=A0.../{<a href=3D"http://systemd_244.1.bb" rel=3D"noreferrer noreferrer=
" target=3D"_blank">systemd_244.1.bb</a> =3D&gt; <a href=3D"http://systemd_=
244.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">systemd_244.3.bb<=
/a>}=C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A08 files changed, 14 insertions(+), 234 deletions(-)<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd-boot_244.=
1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">systemd-boot_244.1.bb=
</a> =3D&gt; <a href=3D"http://systemd-boot_244.3.bb" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">systemd-boot_244.3.bb</a>} (71%)<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd-conf_244.=
1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">systemd-conf_244.1.bb=
</a> =3D&gt; <a href=3D"http://systemd-conf_244.3.bb" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">systemd-conf_244.3.bb</a>} (100%)<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/systemd/0001-Fix-to-run-=
efi_cc-and-efi_ld-correctly-when-cross-co.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-meso=
n-print-EFI-CC-configuration-nicely.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-meso=
n-use-an-array-option-for-efi-cc.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/systemd/0001-meson-Add-D=
efi-objcopy-option-to-specify-objcopy.patch<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd_244.1.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">systemd_244.1.bb</a> =3D&g=
t; <a href=3D"http://systemd_244.3.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">systemd_244.3.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_244.1=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">systemd-boot_244.1.bb<=
/a> b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_244.3.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">systemd-boot_244.3.bb</a><br>
similarity index 71%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd-boot_244.1.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">systemd-boot_244.1.bb</=
a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd-boot_244.3.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">systemd-boot_244.3.bb</a>=
<br>
index 515abc289bef..f92c63981043 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_244.1.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">systemd-boot_244.1.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_244.3.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">systemd-boot_244.3.bb</a><br>
@@ -5,27 +5,27 @@ require conf/image-uefi.conf<br>
<br>
=C2=A0DEPENDS =3D &quot;intltool-native libcap util-linux gnu-efi gperf-nat=
ive&quot;<br>
<br>
-# NOTE: These three patches are in theory not needed, but we haven&#39;t<b=
r>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0figured out how to correctly pass efi-cc param=
eter if it&#39;s an array.<br>
-SRC_URI +=3D &quot;file://0001-Revert-meson-use-an-array-option-for-efi-cc=
.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Revert-meson-print-E=
FI-CC-configuration-nicely.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-to-run-efi_cc-an=
d-efi_ld-correctly-when-cross-co.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-meson-Add-Defi-objco=
py-option-to-specify-objcopy.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
=C2=A0inherit meson pkgconfig gettext<br>
=C2=A0inherit deploy<br>
<br>
-EFI_CC ?=3D &quot;${CC}&quot;<br>
+LDFLAGS_prepend =3D &quot;${@ &quot; &quot;.join(d.getVar(&#39;LD&#39;).sp=
lit()[1:])} &quot;<br>
+<br>
+do_write_config[vardeps] +=3D &quot;CC OBJCOPY&quot;<br>
+do_write_config_append() {<br>
+=C2=A0 =C2=A0 cat &gt;${WORKDIR}/meson-${PN}.cross &lt;&lt;EOF<br>
+[binaries]<br>
+efi_cc =3D ${@meson_array(&#39;CC&#39;, d)}<br>
+objcopy =3D ${@meson_array(&#39;OBJCOPY&#39;, d)}<br>
+EOF<br>
+}<br>
+<br>
=C2=A0EXTRA_OEMESON +=3D &quot;-Defi=3Dtrue \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dgnu-=
efi=3Dtrue \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Defi-=
includedir=3D${STAGING_INCDIR}/efi \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Defi-ldsdi=
r=3D${STAGING_LIBDIR} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Defi-=
libdir=3D${STAGING_LIBDIR} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Defi-ld=3D=
${@ d.getVar(&#39;LD&#39;).split()[0]} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dman=
=3Dfalse \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Defi-cc=3D=
&#39;${EFI_CC}&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Defi-ld=3D=
&#39;${LD}&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Defi-objco=
py=3D&#39;${OBJCOPY}&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --cross-fil=
e ${WORKDIR}/meson-${PN}.cross \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
<br>
<br>
=C2=A0# install to the image as boot*.efi if its the EFI_PROVIDER,<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-conf_244.1=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">systemd-conf_244.1.bb<=
/a> b/meta/recipes-core/systemd/<a href=3D"http://systemd-conf_244.3.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">systemd-conf_244.3.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd-conf_244.1.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">systemd-conf_244.1.bb</=
a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd-conf_244.3.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">systemd-conf_244.3.bb</a>=
<br>
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/syst=
emd/systemd.inc<br>
index 8c05a96ecc4f..e73b397b5d64 100644<br>
--- a/meta/recipes-core/systemd/systemd.inc<br>
+++ b/meta/recipes-core/systemd/systemd.inc<br>
@@ -14,7 +14,7 @@ LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.GPL2;md5=3D751419260aa95449=
9f7abaabaa882bbe \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c&quot;<br>
<br>
-SRCREV =3D &quot;639dc9f4bfd2c09535bee079ae9bc7006b520a66&quot;<br>
+SRCREV =3D &quot;b7ed902b2394f94e7f1fbe6c3194b5cd9a9429e6&quot;<br>
=C2=A0SRCBRANCH =3D &quot;v244-stable&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/systemd/systemd-=
stable.git;protocol=3Dgit;branch=3D$%7BSRCBRANCH%7D" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">github.com/systemd/systemd-stable.git;protocol=3D=
git;branch=3D${SRCBRANCH}</a>&quot;<br>
<br>
diff --git a/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-e=
fi_ld-correctly-when-cross-co.patch b/meta/recipes-core/systemd/systemd/000=
1-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch<br>
deleted file mode 100644<br>
index e2e19ba06810..000000000000<br>
--- a/meta/recipes-core/systemd/systemd/0001-Fix-to-run-efi_cc-and-efi_ld-c=
orrectly-when-cross-co.patch<br>
+++ /dev/null<br>
@@ -1,62 +0,0 @@<br>
-From 527413ec243564a89ffaad6368d446de44415970 Mon Sep 17 00:00:00 2001<br>
-From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blan=
k" rel=3D"noreferrer">Qi.Chen@windriver.com</a>&gt;<br>
-Date: Tue, 27 Feb 2018 21:42:23 -0800<br>
-Subject: [PATCH] Fix to run efi_cc and efi_ld correctly when cross-compili=
ng<br>
-<br>
-When cross-compiling, efi_cc and efi_ld may take the form of<br>
-&#39;xxx-gcc --sysroot=3Dxxx&#39;, and this would cause run_command and<br=
>
-the alike fail.<br>
-<br>
-Fix to split them to make commands run correctly.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank" rel=3D"noreferrer">Qi.Chen@windriver.com</a>&gt;<br>
----<br>
- src/boot/efi/meson.build | 16 +++++++++++++---<br>
- 1 file changed, 13 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build<br>
-index 992a3ba4c..9f9ec4911 100644<br>
---- a/src/boot/efi/meson.build<br>
-+++ b/src/boot/efi/meson.build<br>
-@@ -157,7 +157,7 @@ if have_gnu_efi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0o_file =3D c=
ustom_target(file + &#39;.o&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input : =
file,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output :=
 file + &#39;.o&#39;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command :=
 [efi_cc, &#39;-c&#39;, &#39;@INPUT@&#39;, &#39;-o&#39;, &#39;@OUTPUT@&#39;=
]<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command :=
 efi_cc.split() + [&#39;-c&#39;, &#39;@INPUT@&#39;, &#39;-o&#39;, &#39;@OUT=
PUT@&#39;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + compile_args,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depend_f=
iles : efi_headers)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (common_s=
ources + systemd_boot_sources).contains(file)<br>
-@@ -168,7 +168,17 @@ if have_gnu_efi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endforeach<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 libgcc_file_name =3D run_command(efi_cc, &#39=
;-print-libgcc-file-name&#39;).stdout().strip()<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 find_libgcc_cmd_all =3D efi_cc + &#39; -print=
-libgcc-file-name&#39;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 find_libgcc_cmd =3D find_libgcc_cmd_all.split=
()[0]<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 find_libgcc_args =3D []<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd_args_all =3D find_libgcc_cmd_all.split()<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 foreach arg : cmd_args_all<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if arg !=3D find_=
libgcc_cmd<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 find_libgcc_args +=3D arg<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endif<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 endforeach<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 libgcc_file_name =3D run_command(find_libgcc_=
cmd, find_libgcc_args).stdout().strip()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemd_boot_efi_name =3D &#39;systemd-b=
oot@0@.efi&#39;.format(EFI_MACHINE_TYPE_NAME)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stub_efi_name =3D &#39;linux@0@.efi.stub=
&#39;.format(EFI_MACHINE_TYPE_NAME)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no_undefined_symbols =3D find_program(&#=
39;no-undefined-symbols.sh&#39;)<br>
-@@ -179,7 +189,7 @@ if have_gnu_efi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0tuple[0],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0input : tuple[2],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0output : tuple[0],<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 command : [efi_ld, &#39;-o&#39;, &#39;@OUTPUT@&#39;] +<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 command : efi_ld.split() + [&#39;-o&#39;, &#39;@OUTPUT@&#39;] +<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0efi_ldflags + tuple[2] =
+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;-lefi&#39;, &#39;=
-lgnuefi&#39;, libgcc_file_name])<br>
- <br>
--- <br>
-2.13.0<br>
-<br>
diff --git a/meta/recipes-core/systemd/systemd/0001-Revert-meson-print-EFI-=
CC-configuration-nicely.patch b/meta/recipes-core/systemd/systemd/0001-Reve=
rt-meson-print-EFI-CC-configuration-nicely.patch<br>
deleted file mode 100644<br>
index ed14e25bce66..000000000000<br>
--- a/meta/recipes-core/systemd/systemd/0001-Revert-meson-print-EFI-CC-conf=
iguration-nicely.patch<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-From 0bf530aac152630500939db31f98d933158fdabd Mon Sep 17 00:00:00 2001<br>
-From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blan=
k" rel=3D"noreferrer">Qi.Chen@windriver.com</a>&gt;<br>
-Date: Tue, 26 Feb 2019 14:27:49 +0800<br>
-Subject: [PATCH] Revert &quot;meson: print EFI CC configuration nicely&quo=
t;<br>
-<br>
-This reverts commit c512dfb9ac948ddb1ced0dab07b9dac88b198293.<br>
-<br>
-This patch is here because we haven&#39;t figured out how to pass<br>
-parameter to efi-cc if it&#39;s an array in systemd-boot recipe.<br>
-<br>
-Upstream-Status: Inappropriate [OE specific]<br>
-<br>
-Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank" rel=3D"noreferrer">Qi.Chen@windriver.com</a>&gt;<br>
----<br>
- meson.build | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/meson.build b/meson.build<br>
-index 70fb218..30df834 100644<br>
---- a/meson.build<br>
-+++ b/meson.build<br>
-@@ -3138,7 +3138,7 @@ if conf.get(&#39;ENABLE_EFI&#39;) =3D=3D 1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if have_gnu_efi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status +=3D =
[<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;EFI machine type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @0@&#39;.format(EFI_MACHINE_TYPE_NAME),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;EFI CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@0@&#39;.format(&#39; &=
#39;.join(efi_cc)),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;EFI CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@0@&#39;.format(efi_cc)=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;EFI lib directory:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@0@&#39;.format(efi_libdir),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;EFI lds directory:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@0@&#39;.format(efi_ldsdir),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;EFI include directory:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0@0@&#39;.format(efi_incdir)]<br>
--- <br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-core/systemd/systemd/0001-Revert-meson-use-an-arr=
ay-option-for-efi-cc.patch b/meta/recipes-core/systemd/systemd/0001-Revert-=
meson-use-an-array-option-for-efi-cc.patch<br>
deleted file mode 100644<br>
index 0d2ebf62bd1f..000000000000<br>
--- a/meta/recipes-core/systemd/systemd/0001-Revert-meson-use-an-array-opti=
on-for-efi-cc.patch<br>
+++ /dev/null<br>
@@ -1,77 +0,0 @@<br>
-From 0030dcbac1a9177ef7a28af209ac67149b899f5f Mon Sep 17 00:00:00 2001<br>
-From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blan=
k" rel=3D"noreferrer">Qi.Chen@windriver.com</a>&gt;<br>
-Date: Tue, 26 Feb 2019 14:17:25 +0800<br>
-Subject: [PATCH] Revert &quot;meson: use an array option for efi-cc&quot;<=
br>
-<br>
-This reverts commit 595343fb4c99c2679d347ef7c19debfbfed6342e.<br>
-<br>
-This patch is here because we haven&#39;t figured out how to pass<br>
-parameter to efi-cc if it&#39;s an array in systemd-boot recipe.<br>
-<br>
-Upstream-Status: Inappropriate [OE specific]<br>
-<br>
-Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank" rel=3D"noreferrer">Qi.Chen@windriver.com</a>&gt;<br>
----<br>
- meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
- src/boot/efi/meson.build | 11 ++++++-----<br>
- 2 files changed, 7 insertions(+), 6 deletions(-)<br>
-<br>
-diff --git a/meson_options.txt b/meson_options.txt<br>
-index 044bb79..3d28bfd 100644<br>
---- a/meson_options.txt<br>
-+++ b/meson_options.txt<br>
-@@ -292,7 +292,7 @@ option(&#39;dbus&#39;, type : &#39;combo&#39;, choices=
 : [&#39;auto&#39;, &#39;true&#39;, &#39;false&#39;],<br>
- <br>
- option(&#39;gnu-efi&#39;, type : &#39;combo&#39;, choices : [&#39;auto&#3=
9;, &#39;true&#39;, &#39;false&#39;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 description : &#39;gnu-efi support for sd-boot=
&#39;)<br>
--option(&#39;efi-cc&#39;, type : &#39;array&#39;,<br>
-+option(&#39;efi-cc&#39;, type : &#39;string&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 description : &#39;the compiler to use for EFI=
 modules&#39;)<br>
- option(&#39;efi-ld&#39;, type : &#39;string&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 description : &#39;the linker to use for EFI m=
odules&#39;)<br>
-diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build<br>
-index 2140151..d8db3a1 100644<br>
---- a/src/boot/efi/meson.build<br>
-+++ b/src/boot/efi/meson.build<br>
-@@ -34,8 +34,8 @@ stub_sources =3D &#39;&#39;&#39;<br>
- <br>
- if conf.get(&#39;ENABLE_EFI&#39;) =3D=3D 1 and get_option(&#39;gnu-efi&#3=
9;) !=3D &#39;false&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0efi_cc =3D get_option(&#39;efi-cc&#39;)<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if efi_cc.length() =3D=3D 0<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 efi_cc =3D cc.cmd=
_array()<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if efi_cc =3D=3D &#39;&#39;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 efi_cc =3D &#39; =
&#39;.join(cc.cmd_array())<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0efi_ld =3D get_option(&#39;efi-ld&#39;)<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if efi_ld =3D=3D &#39;&#39;<br>
-@@ -57,7 +57,8 @@ if conf.get(&#39;ENABLE_EFI&#39;) =3D=3D 1 and get_optio=
n(&#39;gnu-efi&#39;) !=3D &#39;false&#39;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0efi_libdir =3D get_option(&#39;efi-libdi=
r&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if efi_libdir =3D=3D &#39;&#39;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D run_comma=
nd(efi_cc + [&#39;-print-multi-os-directory&#39;])<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &#39;cd /=
usr/lib/$(@0@ -print-multi-os-directory) &amp;&amp; pwd&#39;.format(efi_cc)=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D run_comma=
nd(&#39;sh&#39;, &#39;-c&#39;, cmd)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ret.retur=
ncode() =3D=3D 0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0path =3D join_paths(&#39;/usr/lib&#39;, ret.stdout().strip=
())<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ret =3D run_command(&#39;realpath&#39;, &#39;-e&#39;, path=
)<br>
-@@ -152,7 +153,7 @@ if have_gnu_efi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0o_file =3D c=
ustom_target(file + &#39;.o&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input : =
file,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output :=
 file + &#39;.o&#39;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command :=
 efi_cc + [&#39;-c&#39;, &#39;@INPUT@&#39;, &#39;-o&#39;, &#39;@OUTPUT@&#39=
;]<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command :=
 [efi_cc, &#39;-c&#39;, &#39;@INPUT@&#39;, &#39;-o&#39;, &#39;@OUTPUT@&#39;=
]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + compile_args,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depend_f=
iles : efi_headers)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (common_s=
ources + systemd_boot_sources).contains(file)<br>
-@@ -163,7 +164,7 @@ if have_gnu_efi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endforeach<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 libgcc_file_name =3D run_command(efi_cc + [&#=
39;-print-libgcc-file-name&#39;]).stdout().strip()<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 libgcc_file_name =3D run_command(efi_cc, &#39=
;-print-libgcc-file-name&#39;).stdout().strip()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemd_boot_efi_name =3D &#39;systemd-b=
oot@0@.efi&#39;.format(EFI_MACHINE_TYPE_NAME)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stub_efi_name =3D &#39;linux@0@.efi.stub=
&#39;.format(EFI_MACHINE_TYPE_NAME)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no_undefined_symbols =3D find_program(&#=
39;no-undefined-symbols.sh&#39;)<br>
--- <br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-core/systemd/systemd/0001-meson-Add-Defi-objcopy-=
option-to-specify-objcopy.patch b/meta/recipes-core/systemd/systemd/0001-me=
son-Add-Defi-objcopy-option-to-specify-objcopy.patch<br>
deleted file mode 100644<br>
index 7d764b4115eb..000000000000<br>
--- a/meta/recipes-core/systemd/systemd/0001-meson-Add-Defi-objcopy-option-=
to-specify-objcopy.patch<br>
+++ /dev/null<br>
@@ -1,48 +0,0 @@<br>
-From 3f37ad5e083dcad51c21c1050b2829b70d240b52 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
 rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
-Date: Tue, 6 Aug 2019 03:10:20 +0000<br>
-Subject: [PATCH] meson: Add -Defi-objcopy option to specify objcopy<br>
-<br>
-This helps in cross compiling for x86 target on a aarch64 host e.g.<br>
-Fixes<br>
-TOPDIR/build/tmp/hosttools/objcopy:src/boot/efi/systemd_boot.so: Invalid b=
fd target<br>
-<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
----<br>
- meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
- src/boot/efi/meson.build | 5 ++++-<br>
- 2 files changed, 6 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/meson_options.txt b/meson_options.txt<br>
-index d4ec37dda2..dc1c96e112 100644<br>
---- a/meson_options.txt<br>
-+++ b/meson_options.txt<br>
-@@ -296,6 +296,8 @@ option(&#39;efi-cc&#39;, type : &#39;array&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 description : &#39;the compiler to use for EFI=
 modules&#39;)<br>
- option(&#39;efi-ld&#39;, type : &#39;string&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 description : &#39;the linker to use for EFI m=
odules&#39;)<br>
-+option(&#39;efi-objcopy&#39;, type : &#39;string&#39;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0description : &#39;the objcopy to use for EFI&=
#39;)<br>
- option(&#39;efi-libdir&#39;, type : &#39;string&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 description : &#39;path to the EFI lib directo=
ry&#39;)<br>
- option(&#39;efi-ldsdir&#39;, type : &#39;string&#39;,<br>
-diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build<br>
-index 0ae3191635..5a7137bc84 100644<br>
---- a/src/boot/efi/meson.build<br>
-+++ b/src/boot/efi/meson.build<br>
-@@ -88,7 +88,10 @@ if have_gnu_efi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output : &#3=
9;efi_config.h&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configuratio=
n : efi_conf)<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 objcopy =3D find_program(&#39;objcopy&#39;)<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 objcopy =3D get_option(&#39;efi-objcopy&#39;)=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if objcopy =3D=3D &#39;&#39;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 objcopy =3D find_=
program(&#39;objcopy&#39;, required: true)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 endif<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0efi_ldsdir =3D get_option(&#39;efi-ldsdi=
r&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arch_lds =3D &#39;elf_@0@_efi.lds&#39;.f=
ormat(gnu_efi_path_arch)<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_244.1.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">systemd_244.1.bb</a> b/meta=
/recipes-core/systemd/<a href=3D"http://systemd_244.3.bb" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">systemd_244.3.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd_244.1.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">systemd_244.1.bb</a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd_244.3.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">systemd_244.3.bb</a><br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div></div>

--0000000000007ba0ee059eadf830--
