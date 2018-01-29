Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF7278830
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 19:44:54 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id t79so11755281lfe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 11:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9tity/yAp0EIZEpDxl9g0GW2U8Vk2iQiRjJPfVvWioE=;
	b=J/UF4XiEt0eqxIujG6l4/sS9xYVvZDtHwTmxbmUz1CoXXqY+CAG3tDkifP7brOUTPv
	BYe6ytNsr1JxteUUpE1jh8BsOg8duJwXY4CtB+to4hI9vgKl7mH/vR/1PrTKG4tibLK5
	8TAhEdrCSqiFw9weAr1bq/Pg6XQhD+ZPUVscW6knjR0zb+BCo2OOhmX21ym+NKhgLRDp
	xF89TH7hW8PQXH0CPGAU/A3KWGGtie7NVEvTmAWd9Ylji5VUH8QFzbXciacYl+bXYx05
	Yx5my5QLr0w81amaP+vfwqoNmDA5sVJDNjGWGONoFwGgp0zCciX8FtCjnVdJSHyFn529
	EBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9tity/yAp0EIZEpDxl9g0GW2U8Vk2iQiRjJPfVvWioE=;
	b=OLuZNT4unXn8EVx7osqv1TrAEV3rHViXJ4Nnrs8GiXpT8APIIgyE6Dv2obuORbHcRe
	ZtlBN7xpjZN8+HWFY95eGfuYeeDLaQIJQzG28D/QO2rIjLZrLnhDzIGy1lHe5yaUFPim
	7nP0ggEVJoZ/e5gSGJhMQm+bvtQSFseD7eQIyYTwvLhKLDrnJfzMEFIi0O+8Ewzuus3M
	3T3d1799C0xJ4EVDNEljZ74/ElCibCGBX5UMgFvhrLxFwpDT4twmEw/g52HYNQkHp4LR
	FE7zEjhEtITGsWkALKsTibYbyT6fsn1XYqeSczudHI8nWQ1TQ0ALiMkrdx/hUfWZWlA9
	XYQA==
X-Gm-Message-State: AKwxytfnLAyQznCZ9NErVECBAEAMiwIpYp8GClLG9BnQDOhBOcW1RI4V
	KKDmvB+b7N9p5UzE8QYsINbijs4SFIoYUkhgLBI=
X-Google-Smtp-Source: AH8x226UPMAAylJkfaVqIKNajREpdpRojCjw+3PuvZcgemEdGjrrd4g5r5LJvqybvkoIPYtoHrUOwibPEHd9phgkN4A=
X-Received: by 10.46.29.76 with SMTP id d73mr3692806ljd.70.1517255094961; Mon,
	29 Jan 2018 11:44:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.18.151 with HTTP; Mon, 29 Jan 2018 11:44:54 -0800 (PST)
In-Reply-To: <CAMKF1sqSv0n2D4AFyxmfd860Hni_L2V0=KPBvqYYifu0ymV4zQ@mail.gmail.com>
References: <1517238375-21831-1-git-send-email-rbilovol@cisco.com>
	<CAMKF1sqSv0n2D4AFyxmfd860Hni_L2V0=KPBvqYYifu0ymV4zQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 29 Jan 2018 14:44:54 -0500
Message-ID: <CADkTA4OUvjq-s_GFGbePT8+B015x+yNKEodxdfdNfExZYNNYaw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-kernel: add kpatch dynamic kernel patching infrastructure
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
X-List-Received-Date: Mon, 29 Jan 2018 19:44:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 29, 2018 at 1:35 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Jan 29, 2018 at 7:06 AM, Ruslan Bilovol <rbilovol@cisco.com> wrote:
>> kpatch is a Linux dynamic kernel patching infrastructure
>> which allows you to patch a running kernel without
>> rebooting or restarting any processes
>>
>> Currently it is enabled and tested on x86-64 systems,
>> although can be extended to PPC64 as well.
>>
>
> perhaps not ready for oe-core yet doesnt seem to support all core
> arches, may be meta-oe is a better place for it for now
>


agreed.

Bruce

>> Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
>> ---
>>  meta/recipes-kernel/kpatch/kpatch.inc              |  49 ++++++++++
>>  ...patch-build-add-cross-compilation-support.patch | 103 +++++++++++++++++++++
>>  ...tch-build-allow-overriding-of-distro-name.patch |  62 +++++++++++++
>>  meta/recipes-kernel/kpatch/kpatch_git.bb           |  11 +++
>>  4 files changed, 225 insertions(+)
>>  create mode 100644 meta/recipes-kernel/kpatch/kpatch.inc
>>  create mode 100644 meta/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch
>>  create mode 100644 meta/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
>>  create mode 100644 meta/recipes-kernel/kpatch/kpatch_git.bb
>>
>> diff --git a/meta/recipes-kernel/kpatch/kpatch.inc b/meta/recipes-kernel/kpatch/kpatch.inc
>> new file mode 100644
>> index 0000000..b1e73e9
>> --- /dev/null
>> +++ b/meta/recipes-kernel/kpatch/kpatch.inc
>> @@ -0,0 +1,49 @@
>> +SUMMARY = "Linux dynamic kernel patching infrastructure"
>> +DESCRIPTION = "kpatch is a Linux dynamic kernel patching infrastructure which allows you to patch a running kernel without rebooting or restarting any processes."
>> +LICENSE = "GPLv2 & LGPLv2"
>> +DEPENDS = "elfutils bash"
>> +
>> +SRC_URI = "git://github.com/dynup/kpatch.git;protocol=https \
>> +       file://0001-kpatch-build-add-cross-compilation-support.patch \
>> +       file://0002-kpatch-build-allow-overriding-of-distro-name.patch \
>> +       "
>> +
>> +EXTRA_OEMAKE = " \
>> +       PREFIX=${prefix} \
>> +       BINDIR=${D}${bindir} \
>> +       SBINDIR=${D}${sbindir} \
>> +       LIBDIR=${D}${libdir} \
>> +       MANDIR=${D}${mandir}/man1 \
>> +       SYSTEMDDIR=${D}${systemd_system_unitdir} \
>> +       DESTDIR=${D} \
>> +       BUILDMOD=no \
>> +       CC='${CC}' \
>> +       "
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +do_install () {
>> +       oe_runmake install
>> +}
>> +
>> +PACKAGES =+ "kpatch-build"
>> +PROVIDES += "kpatch-build"
>> +
>> +COMPATIBLE_HOST = "(x86_64).*-linux"
>> +
>> +RDEPENDS_${PN} = "bash binutils"
>> +RDEPENDS_kpatch-build = "bash glibc-utils"
>> +
>> +FILES_${PN} = " \
>> +       ${sbindir}/kpatch \
>> +       ${systemd_system_unitdir}/kpatch.service \
>> +       ${mandir}/man1/kpatch.1.gz \
>> +       "
>> +FILES_kpatch-build = " \
>> +       ${bindir}/kpatch-build \
>> +       ${libexecdir}/* \
>> +       ${datadir}/kpatch \
>> +       ${mandir}/man1/kpatch-build.1.gz \
>> +       "
>> +
>> +SYSTEMD_SERVICE_${PN} = "kpatch.service"
>> diff --git a/meta/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch b/meta/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch
>> new file mode 100644
>> index 0000000..459fb21
>> --- /dev/null
>> +++ b/meta/recipes-kernel/kpatch/kpatch/0001-kpatch-build-add-cross-compilation-support.patch
>> @@ -0,0 +1,103 @@
>> +From a9a80a1f4df65892a0269295ce8a64b06f2ff61d Mon Sep 17 00:00:00 2001
>> +From: Ruslan Bilovol <rbilovol@cisco.com>
>> +Date: Tue, 19 Dec 2017 15:59:04 +0200
>> +Subject: [PATCH] kpatch-build: add cross-compilation support
>> +
>> +This patch introduces new option for kpatch-build
>> +script "--cross-compile" which can be used for
>> +specifying cross-complier prefix.
>> +It allows to build live patches not only on
>> +target system, but also on hosts for a target other
>> +than the one on which the compiler is running
>> +
>> +Also removed quotes in exec lines, so it is
>> +possible to pass multy-component strings like
>> +"ccache x86_64-xelinux-linux-" as cross-compiler
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
>> +---
>> + kpatch-build/kpatch-build | 13 +++++++++++--
>> + kpatch-build/kpatch-gcc   |  4 ++--
>> + 2 files changed, 13 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/kpatch-build/kpatch-build b/kpatch-build/kpatch-build
>> +index 166ecbd..af24cc4 100755
>> +--- a/kpatch-build/kpatch-build
>> ++++ b/kpatch-build/kpatch-build
>> +@@ -195,7 +195,7 @@ gcc_version_check() {
>> +       # gcc --version varies between distributions therefore extract version
>> +       # by compiling a test file and compare it to vmlinux's version.
>> +       echo 'void main(void) {}' > "$c"
>> +-      out="$(gcc -c -pg -ffunction-sections -o "$o" "$c" 2>&1)"
>> ++      out="$(${KPATCH_CROSS_COMPILE}gcc -c -pg -ffunction-sections -o "$o" "$c" 2>&1)"
>> +       gccver="$(gcc_version_from_file "$o")"
>> +       kgccver="$(gcc_version_from_file "$VMLINUX")"
>> +       rm -f "$c" "$o"
>> +@@ -381,12 +381,14 @@ usage() {
>> +       echo "          -d, --debug        Enable 'xtrace' and keep scratch files" >&2
>> +       echo "                             in <CACHEDIR>/tmp" >&2
>> +       echo "                             (can be specified multiple times)" >&2
>> ++      echo "          --cross-compile    Specify the prefix used for all executables" >&2
>> ++      echo "                             used during compilation" >&2
>> +       echo "          --skip-cleanup     Skip post-build cleanup" >&2
>> +       echo "          --skip-gcc-check   Skip gcc version matching check" >&2
>> +       echo "                             (not recommended)" >&2
>> + }
>> +
>> +-options="$(getopt -o ha:r:s:c:v:j:t:n:o:d -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,debug,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
>> ++options="$(getopt -o ha:r:s:c:v:j:t:n:o:d -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,debug,cross-compile:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
>> +
>> + eval set -- "$options"
>> +
>> +@@ -444,6 +446,10 @@ while [[ $# -gt 0 ]]; do
>> +                       echo "DEBUG mode enabled"
>> +               fi
>> +               ;;
>> ++      --cross-compile)
>> ++              KPATCH_CROSS_COMPILE="$2"
>> ++              shift
>> ++              ;;
>> +       --skip-cleanup)
>> +               echo "Skipping cleanup"
>> +               SKIPCLEANUP=1
>> +@@ -691,6 +697,8 @@ if [[ $DEBUG -ge 4 ]]; then
>> +       export KPATCH_GCC_DEBUG=1
>> + fi
>> +
>> ++export KPATCH_CROSS_COMPILE
>> ++
>> + echo "Building original kernel"
>> + ./scripts/setlocalversion --save-scmversion || die
>> + make mrproper 2>&1 | logger || die
>> +@@ -840,6 +848,7 @@ cd "$TEMPDIR/patch" || die
>> + KPATCH_BUILD="$SRCDIR" KPATCH_NAME="$MODNAME" \
>> + KBUILD_EXTRA_SYMBOLS="$KBUILD_EXTRA_SYMBOLS" \
>> + KPATCH_LDFLAGS="$KPATCH_LDFLAGS" \
>> ++CROSS_COMPILE="$KPATCH_CROSS_COMPILE" \
>> +       make 2>&1 | logger || die
>> +
>> + if ! "$KPATCH_MODULE"; then
>> +diff --git a/kpatch-build/kpatch-gcc b/kpatch-build/kpatch-gcc
>> +index 6ba133c..3937948 100755
>> +--- a/kpatch-build/kpatch-gcc
>> ++++ b/kpatch-build/kpatch-gcc
>> +@@ -8,7 +8,7 @@ TOOLCHAINCMD="$1"
>> + shift
>> +
>> + if [[ -z "$KPATCH_GCC_TEMPDIR" ]]; then
>> +-      exec "$TOOLCHAINCMD" "$@"
>> ++      exec ${KPATCH_CROSS_COMPILE}${TOOLCHAINCMD} "$@"
>> + fi
>> +
>> + declare -a args=("$@")
>> +@@ -80,4 +80,4 @@ elif [[ "$TOOLCHAINCMD" = "ld" ]] ; then
>> +       done
>> + fi
>> +
>> +-exec "$TOOLCHAINCMD" "${args[@]}"
>> ++exec ${KPATCH_CROSS_COMPILE}${TOOLCHAINCMD} "${args[@]}"
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch b/meta/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
>> new file mode 100644
>> index 0000000..a9d8a7f
>> --- /dev/null
>> +++ b/meta/recipes-kernel/kpatch/kpatch/0002-kpatch-build-allow-overriding-of-distro-name.patch
>> @@ -0,0 +1,62 @@
>> +From d418d716dae1e2a05131dfb42a19a4da2fc8a85d Mon Sep 17 00:00:00 2001
>> +From: Ruslan Bilovol <rbilovol@cisco.com>
>> +Date: Tue, 2 Jan 2018 14:50:03 +0200
>> +Subject: [PATCH] kpatch-build: allow overriding of distro name
>> +
>> +It is sometimes useful to have ability to override
>> +distro name, for example during cross-compilation
>> +build when livepatch modules will be ran on the
>> +target which differs from host.
>> +
>> +This patch adds a new --distro option which
>> +implements all needed functionality
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
>> +---
>> + kpatch-build/kpatch-build | 9 +++++++--
>> + 1 file changed, 7 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/kpatch-build/kpatch-build b/kpatch-build/kpatch-build
>> +index af24cc4..4f9f78d 100755
>> +--- a/kpatch-build/kpatch-build
>> ++++ b/kpatch-build/kpatch-build
>> +@@ -383,12 +383,13 @@ usage() {
>> +       echo "                             (can be specified multiple times)" >&2
>> +       echo "          --cross-compile    Specify the prefix used for all executables" >&2
>> +       echo "                             used during compilation" >&2
>> ++      echo "          --distro           Override distro name" >&2
>> +       echo "          --skip-cleanup     Skip post-build cleanup" >&2
>> +       echo "          --skip-gcc-check   Skip gcc version matching check" >&2
>> +       echo "                             (not recommended)" >&2
>> + }
>> +
>> +-options="$(getopt -o ha:r:s:c:v:j:t:n:o:d -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,debug,cross-compile:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
>> ++options="$(getopt -o ha:r:s:c:v:j:t:n:o:d -l "help,archversion:,sourcerpm:,sourcedir:,config:,vmlinux:,jobs:,target:,name:,output:,debug,cross-compile:,distro:,skip-gcc-check,skip-cleanup" -- "$@")" || die "getopt failed"
>> +
>> + eval set -- "$options"
>> +
>> +@@ -450,6 +451,10 @@ while [[ $# -gt 0 ]]; do
>> +               KPATCH_CROSS_COMPILE="$2"
>> +               shift
>> +               ;;
>> ++      --distro)
>> ++              DISTRO="$2"
>> ++              shift
>> ++              ;;
>> +       --skip-cleanup)
>> +               echo "Skipping cleanup"
>> +               SKIPCLEANUP=1
>> +@@ -526,7 +531,7 @@ fi
>> + # Don't check external file.
>> + # shellcheck disable=SC1091
>> + source /etc/os-release
>> +-DISTRO="$ID"
>> ++DISTRO="${DISTRO:-${ID}}"
>> + if [[ "$DISTRO" = fedora ]] || [[ "$DISTRO" = rhel ]] || [[ "$DISTRO" = ol ]] || [[ "$DISTRO" = centos ]]; then
>> +       [[ -z "$VMLINUX" ]] && VMLINUX="/usr/lib/debug/lib/modules/$ARCHVERSION/vmlinux"
>> +       [[ -e "$VMLINUX" ]] || die "kernel-debuginfo-$ARCHVERSION not installed"
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-kernel/kpatch/kpatch_git.bb b/meta/recipes-kernel/kpatch/kpatch_git.bb
>> new file mode 100644
>> index 0000000..e495e28
>> --- /dev/null
>> +++ b/meta/recipes-kernel/kpatch/kpatch_git.bb
>> @@ -0,0 +1,11 @@
>> +require kpatch.inc
>> +
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> +
>> +SRCREV = "db6efbb8c7e90d2b761272cf563047119072768f"
>> +
>> +PV = "0.5.0+git${SRCPV}"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

