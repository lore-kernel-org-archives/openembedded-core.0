Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id BDB4F6FFA1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 12:52:34 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 191so538918wmm.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 04:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3jJkIJRZHUKlIa42+axZFyBkp6ay6x4nOQnzK0DZvPg=;
	b=Rjc+Ak/A2X+9QiEqHTTO15HECPe30AlS2PdLgOJ8sp6Xx/RRm8qj8Spic3pCRhoz6d
	vsZsSDOcGc9Cv3z0IBPvkjfNLAuW34kg4L8fVtDxL12m8hgZvtrOvWnT0PIWOQh3WxQK
	t6ennYbxFbAcp8dpaUug57MBHtDYZ+B+7qfUGJpUpg3P+q4xRZ7oxoKtWnfUu6bFFdBX
	TywilgYtcM9AJkwbN6lsxeJ9iL8RdZoXYDd82ebbyUm1HRn2ydt9Q65Jit18XY4PYFns
	nwC0JcV6Gv+cHLII3dNzYwW0nDnIUN8W3NJAD1633+QJIegKCRNLOVB+UBFUJP7P5Wiz
	ec7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3jJkIJRZHUKlIa42+axZFyBkp6ay6x4nOQnzK0DZvPg=;
	b=p5tcsLetp3Btg+24pHsnq23t4mBUcTgd0VynlsZKS1daxIEjbFDJVBvf1TButrL42U
	yytzfAYl9zTZF2dIMtud8fI1xm6Fxwm+XByGDceZ/fTpxNVgPS8aHLeyEAl5E/b79m+m
	wkPGhqq1ImmKkuZn9omghOls8NF5wS/ifrpwjczCzXD1wbbI31Cg3WJK+VTOYdsAeFaz
	egbF4uvqUfDGiHDbLtE/hQa9aBtgnnEP/eZgEMJ5YyVs9o1ShXuMbQSi4KI4p3jPp1op
	wX5SFoikODo851GF3V7hNHksViXiAzNM979RutA9ygtwbt95ZZ1f1xGjPmOEZ8mV2uz0
	y7iw==
X-Gm-Message-State: APf1xPBT7LiynD1IbsveBa8FuAMFbp1vJXdc1wg9K0QrX/xQI+dwUl4z
	AMdJFjlqcbAqlf+LGeYxPNv2kHBILwM7LyWLU6o=
X-Google-Smtp-Source: AH8x22452qRfafvpifOCMdQ92b5bWBQuhqjgeqUpIAN+ESlVwpxSDM8Xnt1iwIL/TMMv0w75uaDr7sy9fqx4kC7cgFg=
X-Received: by 10.28.196.200 with SMTP id u191mr7091262wmf.17.1518871955113;
	Sat, 17 Feb 2018 04:52:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sat, 17 Feb 2018 04:52:34 -0800 (PST)
In-Reply-To: <a5aad303-6536-bdc2-1ef6-7e85daf20c2c@windriver.com>
References: <cover.1517931042.git.bruce.ashfield@windriver.com>
	<9c618956cda395a9c8fd101fba7f87af8dbd2304.1517931042.git.bruce.ashfield@windriver.com>
	<CA+chaQcYM+edq-FkhAU4h=kV3fKAtoC=rVNFf5B3QRBVSzn8sg@mail.gmail.com>
	<acbb4efc-2b0c-4089-4b5c-4e2ce0c915f8@windriver.com>
	<CA+chaQdev33bwfdCoKHw6jP6N2yJ-1y_s9MLxcqh7nxjnN8uTQ@mail.gmail.com>
	<a5aad303-6536-bdc2-1ef6-7e85daf20c2c@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 17 Feb 2018 13:52:34 +0100
Message-ID: <CA+chaQcJRs8dJri3STCa9ejZ=juqe=1WwTMkR89o2Vt0n8ciSA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] linux-yocto: introduce 4.15 recipes
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
X-List-Received-Date: Sat, 17 Feb 2018 12:52:35 -0000
Content-Type: multipart/alternative; boundary="94eb2c1935a6580e86056567ef6c"

--94eb2c1935a6580e86056567ef6c
Content-Type: text/plain; charset="UTF-8"

This last version seems to build fine for me (I haven't tried more than
building lttng-modules which were failing before, because of some other
issues elsewhere).

On Thu, Feb 15, 2018 at 6:59 PM, Bruce Ashfield <
bruce.ashfield@windriver.com> wrote:

> On 02/15/2018 11:37 AM, Martin Jansa wrote:
>
>> After applying
>> https://patchwork.openembedded.org/patch/147586/
>> and the do_configure[depends] change I got the same error, but this time
>> in:
>> make-mod-scripts/1.0-r0/temp/log.do_configure.20429
>>
>
> Yep. you'd also need this attached patch.
>
> Bruce
>
>
>> Regards,
>>
>> On Thu, Feb 15, 2018 at 5:23 PM, Bruce Ashfield <
>> bruce.ashfield@windriver.com <mailto:bruce.ashfield@windriver.com>>
>> wrote:
>>
>>     On 02/15/2018 11:18 AM, Martin Jansa wrote:
>>
>>         I'm not sure if this is caused by linux-yocto upgrade or lttng
>>         upgrade, but without openssl-dev installed on the host I'm
>>         seeing following failures on ubuntu builders:
>>
>>
>>     It's lttng and the new dependencies of the kernel.
>>
>>     I have a two patch series that moves the make-mod-scripts into a
>> recipe
>>     for better synchronization and fewer races, and on top of that, I have
>>     this change:
>>
>>     -------
>>
>>     index 6645c873f015..c1b80bf8b148 100644
>>     --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>>     <http://make-mod-scripts_1.0.bb>
>>     +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>>     <http://make-mod-scripts_1.0.bb>
>>     @@ -5,15 +5,17 @@ inherit kernel-arch
>>
>>       S = "${WORKDIR}"
>>
>>     -do_configure[depends] += "virtual/kernel:do_shared_workdir"
>>     +do_configure[depends] += "virtual/kernel:do_shared_workdir
>>     openssl-native:do_populate_sysroot"
>>
>>     ----
>>
>>     That makes the header available before lttng actually goes looking for
>>     it (but it isn't limited to lttng, it is just the expanding kernel
>>     requirements).
>>
>>     Would you be willing to try those two patches in your usecase ? I sent
>>     the make-mod-scripts one in the past, but didn't hear anything on it,
>> so
>>     I'm carrying it locally.
>>
>>     Bruce
>>
>>
>>         oe-core/meta/recipes-kernel/lttng/lttng-modules_2.10.5.bb
>>         <http://lttng-modules_2.10.5.bb>:do_make_scripts) failed with
>>         exit code '1'
>>
>>         work-shared/qemux86/kernel-source/scripts/extract-cert.c:21:25:
>>         fatal error: openssl/bio.h: No such file or directory
>>         |  #include <openssl/bio.h>
>>         |                          ^
>>         | compilation terminated.
>>         | make[2]: *** [scripts/extract-cert] Error 1
>>         | make[1]: *** [scripts] Error 2
>>
>>         On Tue, Feb 6, 2018 at 5:21 PM, Bruce Ashfield
>>         <bruce.ashfield@windriver.com
>>         <mailto:bruce.ashfield@windriver.com>
>>         <mailto:bruce.ashfield@windriver.com
>>         <mailto:bruce.ashfield@windriver.com>>> wrote:
>>
>>              This commit makes the 4.15 kernel available for use with the
>>              Yocto configuration fragments and qemu* BSPs.
>>
>>              It has been tested for x86,arm,mips and powerpc against the
>>         lsb, core*
>>              and glibc/mulsc test matrix.
>>
>>              This will serve as the "latest" kernel in master, with
>>         others being
>>              removed in subsequent commits.
>>
>>              Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com
>>         <mailto:bruce.ashfield@windriver.com>
>>              <mailto:bruce.ashfield@windriver.com
>>         <mailto:bruce.ashfield@windriver.com>>>
>>              ---
>>                meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
>>         <http://linux-yocto-rt_4.15.bb>
>>              <http://linux-yocto-rt_4.15.bb>   | 38 +++++++++++++++++
>>                meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b  | 25
>>         ++++++++++++
>>                meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
>>         <http://linux-yocto-tiny_4.15.bb>
>>              <http://linux-yocto-tiny_4.15.bb
>>         <http://linux-yocto-tiny_4.15.bb>> | 47 ++++++++++++++++++++++
>>                meta/recipes-kernel/linux/linux-yocto_4.15.bb
>>         <http://linux-yocto_4.15.bb>
>>              <http://linux-yocto_4.15.bb>      | 47
>> ++++++++++++++++++++++
>>                4 files changed, 157 insertions(+)
>>                create mode 100644
>>              meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
>>         <http://linux-yocto-rt_4.15.bb>
>>              <http://linux-yocto-rt_4.15.bb>
>>                create mode 100644
>>         meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b
>>                create mode 100644
>>              meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
>>         <http://linux-yocto-tiny_4.15.bb>
>>              <http://linux-yocto-tiny_4.15.bb
>>
>>         <http://linux-yocto-tiny_4.15.bb>>
>>                create mode 100644
>>         meta/recipes-kernel/linux/linux-yocto_4.15.bb
>>         <http://linux-yocto_4.15.bb>
>>              <http://linux-yocto_4.15.bb>
>>
>>              diff --git
>>         a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
>>         <http://linux-yocto-rt_4.15.bb>
>>              <http://linux-yocto-rt_4.15.bb>
>>              b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
>>         <http://linux-yocto-rt_4.15.bb>
>>              <http://linux-yocto-rt_4.15.bb>
>>              new file mode 100644
>>              index 000000000000..31f8c23cef52
>>              --- /dev/null
>>              +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
>>         <http://linux-yocto-rt_4.15.bb>
>>              <http://linux-yocto-rt_4.15.bb>
>>              @@ -0,0 +1,38 @@
>>              +KBRANCH ?= "v4.15/standard/preempt-rt/base"
>>              +
>>              +require recipes-kernel/linux/linux-yocto.inc
>>              +
>>              +# Skip processing of this recipe if it is not explicitly
>>         specified
>>              as the
>>              +# PREFERRED_PROVIDER for virtual/kernel. This avoids
>>         errors when trying
>>              +# to build multiple virtual/kernel providers, e.g. as
>>         dependency of
>>              +# core-image-rt-sdk, core-image-rt.
>>              +python () {
>>              +    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and
>>              d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=
>>         "linux-yocto-rt":
>>              +        raise bb.parse.SkipRecipe("Set
>>              PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to
>>         enable it")
>>              +}
>>              +
>>              +SRCREV_machine ?= "9c2e6c0fc71526c45fc7ddf3ec91e
>> 2e2f27e3da0"
>>              +SRCREV_meta ?= "64ad69e5b4a38e678500d7a70791ac5154c6c154"
>>              +
>>              +SRC_URI =
>>                     "git://git.yoctoproject.org/li
>> nux-yocto.git;branch=${KBRANCH};name=machine
>> <http://git.yoctoproject.org/linux-yocto.git;branch=$%7BKBRANCH%7D;name=machine>
>>         <http://git.yoctoproject.org/linux-yocto.git;branch=$%7BKBRA
>> NCH%7D;name=machine>
>>                     <http://git.yoctoproject.org/l
>> inux-yocto.git;branch=${KBRANCH};name=machine
>>         <http://git.yoctoproject.org/linux-yocto.git;branch=$%7BKBRA
>> NCH%7D;name=machine>>
>>              \
>>              +                       git://git.yoctoproject.org/yo
>> cto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;dest
>> suffix=${KMETA}
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D>
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;n
>> ame=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D> <
>> http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;n
>> ame=meta;branch=yocto-4.15;destsuffix=${KMETA} <
>> http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;n
>> ame=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D>>"
>>
>>
>>              +
>>              +LINUX_VERSION ?= "4.15"
>>              +
>>              +PV = "${LINUX_VERSION}+git${SRCPV}"
>>              +
>>              +KMETA = "kernel-meta"
>>              +KCONF_BSP_AUDIT_LEVEL = "2"
>>              +
>>              +LINUX_KERNEL_TYPE = "preempt-rt"
>>              +
>>              +COMPATIBLE_MACHINE =
>>         "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
>>              +
>>              +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>>              +
>>              +# Functionality flags
>>              +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc
>>              features/taskstats/taskstats.scc"
>>              +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>>              +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>              +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc
>>         cfg/paravirt_kvm.scc"
>>              +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>>              diff --git a/meta/recipes-kernel/linux/li
>> nux-yocto-tiny_4.15.b
>>              b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b
>>              new file mode 100644
>>              index 000000000000..7a6696c71a68
>>              --- /dev/null
>>              +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b
>>              @@ -0,0 +1,25 @@
>>              +KBRANCH ?= "v4.15/standard/tiny/common-pc"
>>              +LINUX_KERNEL_TYPE = "tiny"
>>              +KCONFIG_MODE = "--allnoconfig"
>>              +
>>              +require recipes-kernel/linux/linux-yocto.inc
>>              +
>>              +LINUX_VERSION ?= "4.15"
>>              +
>>              +KMETA = "kernel-meta"
>>              +KCONF_BSP_AUDIT_LEVEL = "2"
>>              +
>>              +SRCREV_machine ?= "f7a6d45fff853173bfbf61706aeff
>> cd1d1e99467"
>>              +SRCREV_meta ?= "ef2f5d9a0ac1c5ac60e76b18b0bb3393be450336"
>>              +
>>              +PV = "${LINUX_VERSION}+git${SRCPV}"
>>              +
>>              +SRC_URI =
>>                     "git://git.yoctoproject.org/li
>> nux-yocto.git;branch=${KBRANCH};name=machine
>> <http://git.yoctoproject.org/linux-yocto.git;branch=$%7BKBRANCH%7D;name=machine>
>>         <http://git.yoctoproject.org/linux-yocto.git;branch=$%7BKBRA
>> NCH%7D;name=machine>
>>                     <http://git.yoctoproject.org/l
>> inux-yocto.git;branch=${KBRANCH};name=machine
>>         <http://git.yoctoproject.org/linux-yocto.git;branch=$%7BKBRA
>> NCH%7D;name=machine>>
>>              \
>>              +                       git://git.yoctoproject.org/yo
>> cto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;dest
>> suffix=${KMETA}
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D>
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;n
>> ame=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D> <
>> http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;n
>> ame=meta;branch=yocto-4.15;destsuffix=${KMETA} <
>> http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;n
>> ame=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D>>"
>>              +
>>              +COMPATIBLE_MACHINE = "qemux86|qemux86-64"
>>              +
>>              +# Functionality flags
>>              +KERNEL_FEATURES = ""
>>              +
>>              +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>>              diff --git
>>         a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
>>         <http://linux-yocto-tiny_4.15.bb>
>>              <http://linux-yocto-tiny_4.15.bb
>>         <http://linux-yocto-tiny_4.15.bb>>
>>              b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
>>         <http://linux-yocto-tiny_4.15.bb>
>>              <http://linux-yocto-tiny_4.15.bb
>>         <http://linux-yocto-tiny_4.15.bb>>
>>              new file mode 100644
>>              index 000000000000..60b7e600d24d
>>              --- /dev/null
>>              +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
>>         <http://linux-yocto-tiny_4.15.bb>
>>              <http://linux-yocto-tiny_4.15.bb
>>
>>         <http://linux-yocto-tiny_4.15.bb>>
>>
>>              @@ -0,0 +1,47 @@
>>              +KBRANCH ?= "v4.15/standard/base"
>>              +
>>              +require recipes-kernel/linux/linux-yocto.inc
>>              +
>>              +# board specific branches
>>              +KBRANCH_qemuarm  ?= "v4.15/standard/arm-versatile-926ejs"
>>              +KBRANCH_qemuarm64 ?= "v4.15/standard/qemuarm64"
>>              +KBRANCH_qemumips ?= "v4.15/standard/mti-malta32"
>>              +KBRANCH_qemuppc  ?= "v4.15/standard/qemuppc"
>>              +KBRANCH_qemux86  ?= "v4.15/standard/base"
>>              +KBRANCH_qemux86-64 ?= "v4.15/standard/base"
>>              +KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
>>              +
>>              +SRCREV_machine_qemuarm ?=
>>         "5fdc3d579c5f50fbaaa5faecae79e20b73810346"
>>              +SRCREV_machine_qemuarm64 ?=
>>         "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>>              +SRCREV_machine_qemumips ?=
>>         "5afbe5a7e271f1c115a7c77bea4a71356c6f2792"
>>              +SRCREV_machine_qemuppc ?=
>>         "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>>              +SRCREV_machine_qemux86 ?=
>>         "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>>              +SRCREV_machine_qemux86-64 ?=
>>         "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>>              +SRCREV_machine_qemumips64 ?=
>>         "f9a3a72209bde080e4ecb4fbe7a0f99954643131"
>>              +SRCREV_machine ?= "9c2e6c0fc71526c45fc7ddf3ec91e
>> 2e2f27e3da0"
>>              +SRCREV_meta ?= "64ad69e5b4a38e678500d7a70791ac5154c6c154"
>>              +
>>              +SRC_URI =
>>                     "git://git.yoctoproject.org/li
>> nux-yocto.git;name=machine;branch=${KBRANCH}
>> <http://git.yoctoproject.org/linux-yocto.git;name=machine;branch=$%7BKBRANCH%7D>
>>         <http://git.yoctoproject.org/linux-yocto.git;name=machine;br
>> anch=$%7BKBRANCH%7D>
>>                     <http://git.yoctoproject.org/l
>> inux-yocto.git;name=machine;branch=${KBRANCH}
>>         <http://git.yoctoproject.org/linux-yocto.git;name=machine;br
>> anch=$%7BKBRANCH%7D>>;
>>              \
>>              +                       git://git.yoctoproject.org/yo
>> cto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;dest
>> suffix=${KMETA}
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D>
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;n
>> ame=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D> <
>> http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;n
>> ame=meta;branch=yocto-4.15;destsuffix=${KMETA} <
>> http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;n
>> ame=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D>>"
>>
>>
>>              +
>>              +LINUX_VERSION ?= "4.15"
>>              +
>>              +DEPENDS += "${@bb.utils.contains('ARCH', 'x86',
>>         'elfutils-native',
>>              '', d)}"
>>              +DEPENDS += "openssl-native util-linux-native"
>>              +
>>              +PV = "${LINUX_VERSION}+git${SRCPV}"
>>              +
>>              +KMETA = "kernel-meta"
>>              +KCONF_BSP_AUDIT_LEVEL = "2"
>>              +
>>              +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>>              +
>>              +COMPATIBLE_MACHINE =
>>                     "qemuarm|qemuarm64|qemux86|qem
>> uppc|qemumips|qemumips64|qemux86-64"
>>              +
>>              +# Functionality flags
>>              +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>>              +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>>              +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>              +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc
>>         cfg/paravirt_kvm.scc"
>>              +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc
>>         cfg/paravirt_kvm.scc"
>>              +KERNEL_FEATURES_append = "
>>         ${@bb.utils.contains("TUNE_FEATURES",
>>              "mx32", " cfg/x32.scc", "" ,d)}"
>>              diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
>>         <http://linux-yocto_4.15.bb>
>>              <http://linux-yocto_4.15.bb>
>>              b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
>>         <http://linux-yocto_4.15.bb>
>>              <http://linux-yocto_4.15.bb>
>>              new file mode 100644
>>              index 000000000000..60b7e600d24d
>>              --- /dev/null
>>              +++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
>>         <http://linux-yocto_4.15.bb>
>>              <http://linux-yocto_4.15.bb>
>>
>>              @@ -0,0 +1,47 @@
>>              +KBRANCH ?= "v4.15/standard/base"
>>              +
>>              +require recipes-kernel/linux/linux-yocto.inc
>>              +
>>              +# board specific branches
>>              +KBRANCH_qemuarm  ?= "v4.15/standard/arm-versatile-926ejs"
>>              +KBRANCH_qemuarm64 ?= "v4.15/standard/qemuarm64"
>>              +KBRANCH_qemumips ?= "v4.15/standard/mti-malta32"
>>              +KBRANCH_qemuppc  ?= "v4.15/standard/qemuppc"
>>              +KBRANCH_qemux86  ?= "v4.15/standard/base"
>>              +KBRANCH_qemux86-64 ?= "v4.15/standard/base"
>>              +KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
>>              +
>>              +SRCREV_machine_qemuarm ?=
>>         "5fdc3d579c5f50fbaaa5faecae79e20b73810346"
>>              +SRCREV_machine_qemuarm64 ?=
>>         "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>>              +SRCREV_machine_qemumips ?=
>>         "5afbe5a7e271f1c115a7c77bea4a71356c6f2792"
>>              +SRCREV_machine_qemuppc ?=
>>         "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>>              +SRCREV_machine_qemux86 ?=
>>         "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>>              +SRCREV_machine_qemux86-64 ?=
>>         "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>>              +SRCREV_machine_qemumips64 ?=
>>         "f9a3a72209bde080e4ecb4fbe7a0f99954643131"
>>              +SRCREV_machine ?= "9c2e6c0fc71526c45fc7ddf3ec91e
>> 2e2f27e3da0"
>>              +SRCREV_meta ?= "64ad69e5b4a38e678500d7a70791ac5154c6c154"
>>              +
>>              +SRC_URI =
>>                     "git://git.yoctoproject.org/li
>> nux-yocto.git;name=machine;branch=${KBRANCH}
>> <http://git.yoctoproject.org/linux-yocto.git;name=machine;branch=$%7BKBRANCH%7D>
>>         <http://git.yoctoproject.org/linux-yocto.git;name=machine;br
>> anch=$%7BKBRANCH%7D>
>>                     <http://git.yoctoproject.org/l
>> inux-yocto.git;name=machine;branch=${KBRANCH}
>>         <http://git.yoctoproject.org/linux-yocto.git;name=machine;br
>> anch=$%7BKBRANCH%7D>>;
>>              \
>>              +                       git://git.yoctoproject.org/yo
>> cto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;dest
>> suffix=${KMETA}
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D>
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;n
>> ame=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D> <
>> http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;n
>> ame=meta;branch=yocto-4.15;destsuffix=${KMETA} <
>> http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;n
>> ame=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D>>"
>>
>>
>>              +
>>              +LINUX_VERSION ?= "4.15"
>>              +
>>              +DEPENDS += "${@bb.utils.contains('ARCH', 'x86',
>>         'elfutils-native',
>>              '', d)}"
>>              +DEPENDS += "openssl-native util-linux-native"
>>              +
>>              +PV = "${LINUX_VERSION}+git${SRCPV}"
>>              +
>>              +KMETA = "kernel-meta"
>>              +KCONF_BSP_AUDIT_LEVEL = "2"
>>              +
>>              +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>>              +
>>              +COMPATIBLE_MACHINE =
>>                     "qemuarm|qemuarm64|qemux86|qem
>> uppc|qemumips|qemumips64|qemux86-64"
>>              +
>>              +# Functionality flags
>>              +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>>              +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>>              +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>              +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc
>>         cfg/paravirt_kvm.scc"
>>              +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc
>>         cfg/paravirt_kvm.scc"
>>              +KERNEL_FEATURES_append = "
>>         ${@bb.utils.contains("TUNE_FEATURES",
>>              "mx32", " cfg/x32.scc", "" ,d)}"
>>              --
>>              2.5.0
>>
>>              --
>>              _______________________________________________
>>              Openembedded-core mailing list
>>         Openembedded-core@lists.openembedded.org
>>         <mailto:Openembedded-core@lists.openembedded.org>
>>              <mailto:Openembedded-core@lists.openembedded.org
>>         <mailto:Openembedded-core@lists.openembedded.org>>
>>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>         <http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >
>>                     <http://lists.openembedded.org
>> /mailman/listinfo/openembedded-core <http://lists.openembedded.org
>> /mailman/listinfo/openembedded-core>>
>>
>>
>>
>>
>>
>

--94eb2c1935a6580e86056567ef6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This last version seems to build fine for me (I haven&#39;=
t tried more than building lttng-modules which were failing before, because=
 of some other issues elsewhere).</div><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote">On Thu, Feb 15, 2018 at 6:59 PM, Bruce Ashfield <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"=
_blank">bruce.ashfield@windriver.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><span class=3D"">On 02/15/2018 11:37 AM, Martin Jansa wro=
te:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
After applying<br>
<a href=3D"https://patchwork.openembedded.org/patch/147586/" rel=3D"norefer=
rer" target=3D"_blank">https://patchwork.openembedded<wbr>.org/patch/147586=
/</a><br>
and the do_configure[depends] change I got the same error, but this time in=
:<br>
make-mod-scripts/1.0-r0/temp/l<wbr>og.do_configure.20429<br>
</blockquote>
<br></span>
Yep. you&#39;d also need this attached patch.<br>
<br>
Bruce<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Regards,<span class=3D""><br>
<br>
On Thu, Feb 15, 2018 at 5:23 PM, Bruce Ashfield &lt;<a href=3D"mailto:bruce=
.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windriver.com</a>=
 &lt;mailto:<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blan=
k">bruce.ashfield@windriv<wbr>er.com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 On 02/15/2018 11:18 AM, Martin Jansa wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 I&#39;m not sure if this is caused by linux-yoc=
to upgrade or lttng<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 upgrade, but without openssl-dev installed on t=
he host I&#39;m<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 seeing following failures on ubuntu builders:<b=
r>
<br>
<br>
=C2=A0 =C2=A0 It&#39;s lttng and the new dependencies of the kernel.<br>
<br>
=C2=A0 =C2=A0 I have a two patch series that moves the make-mod-scripts int=
o a recipe<br>
=C2=A0 =C2=A0 for better synchronization and fewer races, and on top of tha=
t, I have<br>
=C2=A0 =C2=A0 this change:<br>
<br>
=C2=A0 =C2=A0 -------<br>
<br>
=C2=A0 =C2=A0 index 6645c873f015..c1b80bf8b148 100644<br>
=C2=A0 =C2=A0 --- a/meta/recipes-kernel/make-mod<wbr>-scripts/<a href=3D"ht=
tp://make-mod-scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod=
-scripts_1.0.<wbr>bb</a><br></span>
=C2=A0 =C2=A0 &lt;<a href=3D"http://make-mod-scripts_1.0.bb" rel=3D"norefer=
rer" target=3D"_blank">http://make-mod-scripts_1.0.b<wbr>b</a>&gt;<br>
=C2=A0 =C2=A0 +++ b/meta/recipes-kernel/make-mod<wbr>-scripts/<a href=3D"ht=
tp://make-mod-scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod=
-scripts_1.0.<wbr>bb</a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"http://make-mod-scripts_1.0.bb" rel=3D"norefer=
rer" target=3D"_blank">http://make-mod-scripts_1.0.b<wbr>b</a>&gt;<span cla=
ss=3D""><br>
=C2=A0 =C2=A0 @@ -5,15 +5,17 @@ inherit kernel-arch<br>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0S =3D &quot;${WORKDIR}&quot;<br>
<br>
=C2=A0 =C2=A0 -do_configure[depends] +=3D &quot;virtual/kernel:do_shared_wo=
rk<wbr>dir&quot;<br>
=C2=A0 =C2=A0 +do_configure[depends] +=3D &quot;virtual/kernel:do_shared_wo=
rk<wbr>dir<br>
=C2=A0 =C2=A0 openssl-native:do_populate_sys<wbr>root&quot;<br>
<br>
=C2=A0 =C2=A0 ----<br>
<br>
=C2=A0 =C2=A0 That makes the header available before lttng actually goes lo=
oking for<br>
=C2=A0 =C2=A0 it (but it isn&#39;t limited to lttng, it is just the expandi=
ng kernel<br>
=C2=A0 =C2=A0 requirements).<br>
<br>
=C2=A0 =C2=A0 Would you be willing to try those two patches in your usecase=
 ? I sent<br>
=C2=A0 =C2=A0 the make-mod-scripts one in the past, but didn&#39;t hear any=
thing on it, so<br>
=C2=A0 =C2=A0 I&#39;m carrying it locally.<br>
<br>
=C2=A0 =C2=A0 Bruce<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe-core/meta/recipes-kernel/lt<wbr>tng/<a href=
=3D"http://lttng-modules_2.10.5.bb" rel=3D"noreferrer" target=3D"_blank">lt=
tng-modules_2.10.5.bb</a><br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://lttng-modules_2.10.5.bb" =
rel=3D"noreferrer" target=3D"_blank">http://lttng-modules_2.10.5.b<wbr>b</a=
>&gt;:do_make_scripts) failed with<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit code &#39;1&#39;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 work-shared/qemux86/kernel-sou<wbr>rce/scripts/=
extract-cert.c:21:<wbr>25:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fatal error: openssl/bio.h: No such file or dir=
ectory<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 #include &lt;openssl/bio.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | compilation terminated.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | make[2]: *** [scripts/extract-cert] Error 1<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | make[1]: *** [scripts] Error 2<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 On Tue, Feb 6, 2018 at 5:21 PM, Bruce Ashfield<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:bruce.ashfield@windriver.=
com" target=3D"_blank">bruce.ashfield@windriver.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:bruce.ashfield@win=
driver.com" target=3D"_blank">bruce.ashfield@windriv<wbr>er.com</a>&gt;<br>=
</span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:bruce.ashfield@win=
driver.com" target=3D"_blank">bruce.ashfield@windriv<wbr>er.com</a><span cl=
ass=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:bruce.ashfield@win=
driver.com" target=3D"_blank">bruce.ashfield@windriv<wbr>er.com</a>&gt;&gt;=
&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 This commit makes the 4.15 =
kernel available for use with the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 Yocto configuration fragmen=
ts and qemu* BSPs.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 It has been tested for x86,=
arm,mips and powerpc against the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lsb, core*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 and glibc/mulsc test matrix=
.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 This will serve as the &quo=
t;latest&quot; kernel in master, with<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 others being<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 removed in subsequent commi=
ts.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 Signed-off-by: Bruce Ashfie=
ld &lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">br=
uce.ashfield@windriver.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:bruce.ashfield@win=
driver.com" target=3D"_blank">bruce.ashfield@windriv<wbr>er.com</a>&gt;<br>=
</span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailt=
o:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windriv<wb=
r>er.com</a><span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:bruce.ashfield@win=
driver.com" target=3D"_blank">bruce.ashfield@windriv<wbr>er.com</a>&gt;&gt;=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 ---<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0meta/recipes-ke=
rnel/linux/<a href=3D"http://linux-yocto-rt_4.15.bb" rel=3D"noreferrer" tar=
get=3D"_blank">li<wbr>nux-yocto-rt_4.15.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-rt_4.15.bb" r=
el=3D"noreferrer" target=3D"_blank">http://linux-yocto-rt_4.15.bb</a><wbr>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &lt;<a href=3D"http://linux=
-yocto-rt_4.15.bb" rel=3D"noreferrer" target=3D"_blank">http://linux-yocto-=
rt_4.15.bb</a><wbr>&gt;=C2=A0 =C2=A0| 38 +++++++++++++++++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0meta/recipes-ke=
rnel/linux/li<wbr>nux-yocto-tiny_4.15.b=C2=A0 | 25<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ++++++++++++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0meta/recipes-ke=
rnel/linux/<a href=3D"http://linux-yocto-tiny_4.15.bb" rel=3D"noreferrer" t=
arget=3D"_blank">li<wbr>nux-yocto-tiny_4.15.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-tiny_4.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">http://linux-yocto-tiny_4.15.<wbr>bb<=
/a>&gt;<br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &lt;<a href=3D"http://linux=
-yocto-tiny_4.15.bb" rel=3D"noreferrer" target=3D"_blank">http://linux-yoct=
o-tiny_4.15.<wbr>bb</a><span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-tiny_4.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">http://linux-yocto-tiny_4.15.<wbr>bb<=
/a>&gt;&gt; | 47 ++++++++++++++++++++++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0meta/recipes-ke=
rnel/linux/<a href=3D"http://linux-yocto_4.15.bb" rel=3D"noreferrer" target=
=3D"_blank">li<wbr>nux-yocto_4.15.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto_4.15.bb" rel=
=3D"noreferrer" target=3D"_blank">http://linux-yocto_4.15.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &lt;<a href=3D"http://linux=
-yocto_4.15.bb" rel=3D"noreferrer" target=3D"_blank">http://linux-yocto_4.1=
5.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 | 47 ++++++++++++++++++++++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A04 files changed=
, 157 insertions(+)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100=
644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 meta/recipes-kernel/linux/<=
a href=3D"http://linux-yocto-rt_4.15.bb" rel=3D"noreferrer" target=3D"_blan=
k">linu<wbr>x-yocto-rt_4.15.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-rt_4.15.bb" r=
el=3D"noreferrer" target=3D"_blank">http://linux-yocto-rt_4.15.bb</a><wbr>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &lt;<a href=3D"http://linux=
-yocto-rt_4.15.bb" rel=3D"noreferrer" target=3D"_blank">http://linux-yocto-=
rt_4.15.bb</a><wbr>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100=
644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-kernel/linux/linu<wbr>x-yocto-tiny=
_4.15.b<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100=
644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 meta/recipes-kernel/linux/<=
a href=3D"http://linux-yocto-tiny_4.15.bb" rel=3D"noreferrer" target=3D"_bl=
ank">linu<wbr>x-yocto-tiny_4.15.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-tiny_4.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">http://linux-yocto-tiny_4.15.<wbr>bb<=
/a>&gt;<br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &lt;<a href=3D"http://linux=
-yocto-tiny_4.15.bb" rel=3D"noreferrer" target=3D"_blank">http://linux-yoct=
o-tiny_4.15.<wbr>bb</a><div><div class=3D"h5"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-tiny_4.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">http://linux-yocto-tiny_4.15.<wbr>bb<=
/a>&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100=
644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-kernel/linux/<a href=3D"http://lin=
ux-yocto_4.15.bb" rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4.1=
5.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto_4.15.bb" rel=
=3D"noreferrer" target=3D"_blank">http://linux-yocto_4.15.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &lt;<a href=3D"http://linux=
-yocto_4.15.bb" rel=3D"noreferrer" target=3D"_blank">http://linux-yocto_4.1=
5.bb</a>&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 diff --git<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 a/meta/recipes-kernel/linux/<a href=3D"http://l=
inux-yocto-rt_4.15.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yoct=
o-rt_4.15.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-rt_4.15.bb" r=
el=3D"noreferrer" target=3D"_blank">http://linux-yocto-rt_4.15.bb</a><wbr>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &lt;<a href=3D"http://linux=
-yocto-rt_4.15.bb" rel=3D"noreferrer" target=3D"_blank">http://linux-yocto-=
rt_4.15.bb</a><wbr>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 b/meta/recipes-kernel/linux=
/<a href=3D"http://linux-yocto-rt_4.15.bb" rel=3D"noreferrer" target=3D"_bl=
ank">li<wbr>nux-yocto-rt_4.15.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-rt_4.15.bb" r=
el=3D"noreferrer" target=3D"_blank">http://linux-yocto-rt_4.15.bb</a><wbr>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &lt;<a href=3D"http://linux=
-yocto-rt_4.15.bb" rel=3D"noreferrer" target=3D"_blank">http://linux-yocto-=
rt_4.15.bb</a><wbr>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 new file mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 index 000000000000..31f8c23=
cef52<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 --- /dev/null<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +++ b/meta/recipes-kernel/l=
inux/<a href=3D"http://linux-yocto-rt_4.15.bb" rel=3D"noreferrer" target=3D=
"_blank">li<wbr>nux-yocto-rt_4.15.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-rt_4.15.bb" r=
el=3D"noreferrer" target=3D"_blank">http://linux-yocto-rt_4.15.bb</a><wbr>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &lt;<a href=3D"http://linux=
-yocto-rt_4.15.bb" rel=3D"noreferrer" target=3D"_blank">http://linux-yocto-=
rt_4.15.bb</a><wbr>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 @@ -0,0 +1,38 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KBRANCH ?=3D &quot;v4.15/s=
tandard/preempt-rt/bas<wbr>e&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +require recipes-kernel/lin=
ux/linux-yoc<wbr>to.inc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +# Skip processing of this =
recipe if it is not explicitly<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 specified<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 as the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +# PREFERRED_PROVIDER for v=
irtual/kernel. This avoids<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 errors when trying<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +# to build multiple virtua=
l/kernel providers, e.g. as<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dependency of<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +# core-image-rt-sdk, core-=
image-rt.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +=C2=A0 =C2=A0 if d.getVar(=
&quot;KERNEL_PACKAGE_NAME&quot;<wbr>) =3D=3D &quot;kernel&quot; and<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 d.getVar(&quot;PREFERRED_PR=
OVIDER_v<wbr>irtual/kernel&quot;) !=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;linux-yocto-rt&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 raise bb.parse.SkipRecipe(&quot;Set<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 PREFERRED_PROVIDER_virtual/=
ker<wbr>nel to linux-yocto-rt to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 enable it&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_machine ?=3D &quot;=
9c2e6c0fc71526c45fc7ddf3ec91e<wbr>2e2f27e3da0&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_meta ?=3D &quot;64a=
d69e5b4a38e678500d7a70791a<wbr>c5154c6c154&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRC_URI =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;git://<a href=3D"http://git.yoctoproject.org/linux-yocto.git;branch=3D$%7B=
KBRANCH%7D;name=3Dmachine" rel=3D"noreferrer" target=3D"_blank">git.yoctopr=
oject.org/li<wbr>nux-yocto.git;branch=3D${KBRANCH<wbr>};name=3Dmachine</a><=
br></div></div>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://git.yoctoproject.org/linu=
x-yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine" rel=3D"noreferrer" targ=
et=3D"_blank">http://git.yoctoproject.org/l<wbr>inux-yocto.git;branch=3D$%7=
BKBRA<wbr>NCH%7D;name=3Dmachine</a>&gt;<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<=
a href=3D"http://git.yoctoproject.org/linux-yocto.git;branch=3D$%7BKBRANCH%=
7D;name=3Dmachine" rel=3D"noreferrer" target=3D"_blank">http://git.yoctopro=
ject.org/l<wbr>inux-yocto.git;branch=3D${KBRANC<wbr>H};name=3Dmachine</a><b=
r></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://git.yoctoproject.org/linu=
x-yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine" rel=3D"noreferrer" targ=
et=3D"_blank">http://git.yoctoproject.org/l<wbr>inux-yocto.git;branch=3D$%7=
BKBRA<wbr>NCH%7D;name=3Dmachine</a>&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D=
"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;br=
anch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=3D"_=
blank">git.yoctoproject.org/yo<wbr>cto-kernel-cache;type=3Dkmeta;na<wbr>me=
=3Dmeta;branch=3Dyocto-4.15;dest<wbr>suffix=3D${KMETA}</a> &lt;<a href=3D"h=
ttp://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;bran=
ch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=3D"_bl=
ank">http://git.yoctoproject.org/y<wbr>octo-kernel-cache;type=3Dkmeta;n<wbr=
>ame=3Dmeta;branch=3Dyocto-4.15;des<wbr>tsuffix=3D$%7BKMETA%7D</a>&gt; &lt;=
<a href=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=
=3Dmeta;branch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" t=
arget=3D"_blank">http://git.yoctoproject.org/y<wbr>octo-kernel-cache;type=
=3Dkmeta;n<wbr>ame=3Dmeta;branch=3Dyocto-4.15;des<wbr>tsuffix=3D${KMETA}</a=
> &lt;<a href=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmet=
a;name=3Dmeta;branch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"norefer=
rer" target=3D"_blank">http://git.yoctoproject.org/y<wbr>octo-kernel-cache;=
type=3Dkmeta;n<wbr>ame=3Dmeta;branch=3Dyocto-4.15;des<wbr>tsuffix=3D$%7BKME=
TA%7D</a>&gt;&gt;&quot;<div><div class=3D"h5"><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +LINUX_VERSION ?=3D &quot;4=
.15&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +PV =3D &quot;${LINUX_VERSI=
ON}+git${SRCPV}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KMETA =3D &quot;kernel-met=
a&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KCONF_BSP_AUDIT_LEVEL =3D =
&quot;2&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +LINUX_KERNEL_TYPE =3D &quo=
t;preempt-rt&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +COMPATIBLE_MACHINE =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;(qemux86|qemux86-64|qemuarm|q<wbr>emuppc|=
qemumips)&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_DEVICETREE_qemuarm =
=3D &quot;versatile-pb.dtb&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +# Functionality flags<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_EXTRA_FEATURES ?=3D=
 &quot;features/netfilter/netfilter.<wbr>scc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 features/taskstats/taskstat=
s.s<wbr>cc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_FEATURES_append =3D=
 &quot; ${KERNEL_EXTRA_FEATURES}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_FEATURES_append_qem=
ual<wbr>l=3D&quot; cfg/virtio.scc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_FEATURES_append_qem=
ux8<wbr>6=3D&quot; cfg/sound.scc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfg/paravirt_kvm.scc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_FEATURES_append_qem=
ux8<wbr>6-64=3D&quot; cfg/sound.scc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 diff --git a/meta/recipes-k=
ernel/linux/li<wbr>nux-yocto-tiny_4.15.b<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 b/meta/recipes-kernel/linux=
/li<wbr>nux-yocto-tiny_4.15.b<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 new file mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 index 000000000000..7a6696c=
71a68<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 --- /dev/null<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +++ b/meta/recipes-kernel/l=
inux/li<wbr>nux-yocto-tiny_4.15.b<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 @@ -0,0 +1,25 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KBRANCH ?=3D &quot;v4.15/s=
tandard/tiny/common-pc<wbr>&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +LINUX_KERNEL_TYPE =3D &quo=
t;tiny&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KCONFIG_MODE =3D &quot;--a=
llnoconfig&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +require recipes-kernel/lin=
ux/linux-yoc<wbr>to.inc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +LINUX_VERSION ?=3D &quot;4=
.15&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KMETA =3D &quot;kernel-met=
a&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KCONF_BSP_AUDIT_LEVEL =3D =
&quot;2&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_machine ?=3D &quot;=
f7a6d45fff853173bfbf61706aeff<wbr>cd1d1e99467&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_meta ?=3D &quot;ef2=
f5d9a0ac1c5ac60e76b18b0bb3<wbr>393be450336&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +PV =3D &quot;${LINUX_VERSI=
ON}+git${SRCPV}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRC_URI =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;git://<a href=3D"http://git.yoctoproject.org/linux-yocto.git;branch=3D$%7B=
KBRANCH%7D;name=3Dmachine" rel=3D"noreferrer" target=3D"_blank">git.yoctopr=
oject.org/li<wbr>nux-yocto.git;branch=3D${KBRANCH<wbr>};name=3Dmachine</a><=
br></div></div>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://git.yoctoproject.org/linu=
x-yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine" rel=3D"noreferrer" targ=
et=3D"_blank">http://git.yoctoproject.org/l<wbr>inux-yocto.git;branch=3D$%7=
BKBRA<wbr>NCH%7D;name=3Dmachine</a>&gt;<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<=
a href=3D"http://git.yoctoproject.org/linux-yocto.git;branch=3D$%7BKBRANCH%=
7D;name=3Dmachine" rel=3D"noreferrer" target=3D"_blank">http://git.yoctopro=
ject.org/l<wbr>inux-yocto.git;branch=3D${KBRANC<wbr>H};name=3Dmachine</a><b=
r></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://git.yoctoproject.org/linu=
x-yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine" rel=3D"noreferrer" targ=
et=3D"_blank">http://git.yoctoproject.org/l<wbr>inux-yocto.git;branch=3D$%7=
BKBRA<wbr>NCH%7D;name=3Dmachine</a>&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D=
"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;br=
anch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=3D"_=
blank">git.yoctoproject.org/yo<wbr>cto-kernel-cache;type=3Dkmeta;na<wbr>me=
=3Dmeta;branch=3Dyocto-4.15;dest<wbr>suffix=3D${KMETA}</a> &lt;<a href=3D"h=
ttp://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;bran=
ch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=3D"_bl=
ank">http://git.yoctoproject.org/y<wbr>octo-kernel-cache;type=3Dkmeta;n<wbr=
>ame=3Dmeta;branch=3Dyocto-4.15;des<wbr>tsuffix=3D$%7BKMETA%7D</a>&gt; &lt;=
<a href=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=
=3Dmeta;branch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" t=
arget=3D"_blank">http://git.yoctoproject.org/y<wbr>octo-kernel-cache;type=
=3Dkmeta;n<wbr>ame=3Dmeta;branch=3Dyocto-4.15;des<wbr>tsuffix=3D${KMETA}</a=
> &lt;<a href=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmet=
a;name=3Dmeta;branch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"norefer=
rer" target=3D"_blank">http://git.yoctoproject.org/y<wbr>octo-kernel-cache;=
type=3Dkmeta;n<wbr>ame=3Dmeta;branch=3Dyocto-4.15;des<wbr>tsuffix=3D$%7BKME=
TA%7D</a>&gt;&gt;&quot;<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +COMPATIBLE_MACHINE =3D &qu=
ot;qemux86|qemux86-64&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +# Functionality flags<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_FEATURES =3D &quot;=
&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_DEVICETREE_qemuarm =
=3D &quot;versatile-pb.dtb&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 diff --git<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 a/meta/recipes-kernel/linux/<a href=3D"http://l=
inux-yocto-tiny_4.15.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yo=
cto-tiny_4.15.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-tiny_4.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">http://linux-yocto-tiny_4.15.<wbr>bb<=
/a>&gt;<br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &lt;<a href=3D"http://linux=
-yocto-tiny_4.15.bb" rel=3D"noreferrer" target=3D"_blank">http://linux-yoct=
o-tiny_4.15.<wbr>bb</a><span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-tiny_4.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">http://linux-yocto-tiny_4.15.<wbr>bb<=
/a>&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 b/meta/recipes-kernel/linux=
/<a href=3D"http://linux-yocto-tiny_4.15.bb" rel=3D"noreferrer" target=3D"_=
blank">li<wbr>nux-yocto-tiny_4.15.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-tiny_4.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">http://linux-yocto-tiny_4.15.<wbr>bb<=
/a>&gt;<br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &lt;<a href=3D"http://linux=
-yocto-tiny_4.15.bb" rel=3D"noreferrer" target=3D"_blank">http://linux-yoct=
o-tiny_4.15.<wbr>bb</a><span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-tiny_4.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">http://linux-yocto-tiny_4.15.<wbr>bb<=
/a>&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 new file mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 index 000000000000..60b7e60=
0d24d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 --- /dev/null<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +++ b/meta/recipes-kernel/l=
inux/<a href=3D"http://linux-yocto-tiny_4.15.bb" rel=3D"noreferrer" target=
=3D"_blank">li<wbr>nux-yocto-tiny_4.15.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-tiny_4.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">http://linux-yocto-tiny_4.15.<wbr>bb<=
/a>&gt;<br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &lt;<a href=3D"http://linux=
-yocto-tiny_4.15.bb" rel=3D"noreferrer" target=3D"_blank">http://linux-yoct=
o-tiny_4.15.<wbr>bb</a><div><div class=3D"h5"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-tiny_4.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">http://linux-yocto-tiny_4.15.<wbr>bb<=
/a>&gt;&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 @@ -0,0 +1,47 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KBRANCH ?=3D &quot;v4.15/s=
tandard/base&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +require recipes-kernel/lin=
ux/linux-yoc<wbr>to.inc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +# board specific branches<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KBRANCH_qemuarm=C2=A0 ?=3D=
 &quot;v4.15/standard/arm-versatile-<wbr>926ejs&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KBRANCH_qemuarm64 ?=3D &qu=
ot;v4.15/standard/qemuarm64&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KBRANCH_qemumips ?=3D &quo=
t;v4.15/standard/mti-malta32&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KBRANCH_qemuppc=C2=A0 ?=3D=
 &quot;v4.15/standard/qemuppc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KBRANCH_qemux86=C2=A0 ?=3D=
 &quot;v4.15/standard/base&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KBRANCH_qemux86-64 ?=3D &q=
uot;v4.15/standard/base&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KBRANCH_qemumips64 ?=3D &q=
uot;v4.15/standard/mti-malta64&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_machine_qemuarm ?=
=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;5fdc3d579c5f50fbaaa5faecae79e<wbr>20b7381=
0346&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_machine_qemuarm64 ?=
=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;9c2e6c0fc71526c45fc7ddf3ec91e<wbr>2e2f27e=
3da0&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_machine_qemumips ?=
=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;5afbe5a7e271f1c115a7c77bea4a7<wbr>1356c6f=
2792&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_machine_qemuppc ?=
=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;9c2e6c0fc71526c45fc7ddf3ec91e<wbr>2e2f27e=
3da0&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_machine_qemux86 ?=
=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;9c2e6c0fc71526c45fc7ddf3ec91e<wbr>2e2f27e=
3da0&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_machine_qemux86-64 =
?=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;9c2e6c0fc71526c45fc7ddf3ec91e<wbr>2e2f27e=
3da0&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_machine_qemumips64 =
?=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;f9a3a72209bde080e4ecb4fbe7a0f<wbr>9995464=
3131&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_machine ?=3D &quot;=
9c2e6c0fc71526c45fc7ddf3ec91e<wbr>2e2f27e3da0&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_meta ?=3D &quot;64a=
d69e5b4a38e678500d7a70791a<wbr>c5154c6c154&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRC_URI =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;git://<a href=3D"http://git.yoctoproject.org/linux-yocto.git;name=3Dmachin=
e;branch=3D$%7BKBRANCH%7D" rel=3D"noreferrer" target=3D"_blank">git.yoctopr=
oject.org/li<wbr>nux-yocto.git;name=3Dmachine;bra<wbr>nch=3D${KBRANCH}</a><=
br></div></div>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://git.yoctoproject.org/linu=
x-yocto.git;name=3Dmachine;branch=3D$%7BKBRANCH%7D" rel=3D"noreferrer" targ=
et=3D"_blank">http://git.yoctoproject.org/l<wbr>inux-yocto.git;name=3Dmachi=
ne;br<wbr>anch=3D$%7BKBRANCH%7D</a>&gt;<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<=
a href=3D"http://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=
=3D$%7BKBRANCH%7D" rel=3D"noreferrer" target=3D"_blank">http://git.yoctopro=
ject.org/l<wbr>inux-yocto.git;name=3Dmachine;br<wbr>anch=3D${KBRANCH}</a><b=
r></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://git.yoctoproject.org/linu=
x-yocto.git;name=3Dmachine;branch=3D$%7BKBRANCH%7D" rel=3D"noreferrer" targ=
et=3D"_blank">http://git.yoctoproject.org/l<wbr>inux-yocto.git;name=3Dmachi=
ne;br<wbr>anch=3D$%7BKBRANCH%7D</a>&gt;&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D=
"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;br=
anch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=3D"_=
blank">git.yoctoproject.org/yo<wbr>cto-kernel-cache;type=3Dkmeta;na<wbr>me=
=3Dmeta;branch=3Dyocto-4.15;dest<wbr>suffix=3D${KMETA}</a> &lt;<a href=3D"h=
ttp://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;bran=
ch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=3D"_bl=
ank">http://git.yoctoproject.org/y<wbr>octo-kernel-cache;type=3Dkmeta;n<wbr=
>ame=3Dmeta;branch=3Dyocto-4.15;des<wbr>tsuffix=3D$%7BKMETA%7D</a>&gt; &lt;=
<a href=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=
=3Dmeta;branch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" t=
arget=3D"_blank">http://git.yoctoproject.org/y<wbr>octo-kernel-cache;type=
=3Dkmeta;n<wbr>ame=3Dmeta;branch=3Dyocto-4.15;des<wbr>tsuffix=3D${KMETA}</a=
> &lt;<a href=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmet=
a;name=3Dmeta;branch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"norefer=
rer" target=3D"_blank">http://git.yoctoproject.org/y<wbr>octo-kernel-cache;=
type=3Dkmeta;n<wbr>ame=3Dmeta;branch=3Dyocto-4.15;des<wbr>tsuffix=3D$%7BKME=
TA%7D</a>&gt;&gt;&quot;<div><div class=3D"h5"><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +LINUX_VERSION ?=3D &quot;4=
.15&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +DEPENDS +=3D &quot;${@bb.u=
tils.contains(&#39;ARCH&#39;, &#39;x86&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;elfutils-native&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &#39;&#39;, d)}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +DEPENDS +=3D &quot;openssl=
-native util-linux-native&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +PV =3D &quot;${LINUX_VERSI=
ON}+git${SRCPV}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KMETA =3D &quot;kernel-met=
a&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KCONF_BSP_AUDIT_LEVEL =3D =
&quot;2&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_DEVICETREE_qemuarm =
=3D &quot;versatile-pb.dtb&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +COMPATIBLE_MACHINE =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;qemuarm|qemuarm64|qemux86|qem<wbr>uppc|qemumips|qemumips64|qemux<wbr>86-64=
&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +# Functionality flags<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_EXTRA_FEATURES ?=3D=
 &quot;features/netfilter/netfilter.<wbr>scc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_FEATURES_append =3D=
 &quot; ${KERNEL_EXTRA_FEATURES}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_FEATURES_append_qem=
ual<wbr>l=3D&quot; cfg/virtio.scc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_FEATURES_append_qem=
ux8<wbr>6=3D&quot; cfg/sound.scc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfg/paravirt_kvm.scc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_FEATURES_append_qem=
ux8<wbr>6-64=3D&quot; cfg/sound.scc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfg/paravirt_kvm.scc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_FEATURES_append =3D=
 &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&quot;TUNE_FEA<wbr>TURES&q=
uot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &quot;mx32&quot;, &quot; cf=
g/x32.scc&quot;, &quot;&quot; ,d)}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 diff --git a/meta/recipes-k=
ernel/linux/<a href=3D"http://linux-yocto_4.15.bb" rel=3D"noreferrer" targe=
t=3D"_blank">li<wbr>nux-yocto_4.15.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto_4.15.bb" rel=
=3D"noreferrer" target=3D"_blank">http://linux-yocto_4.15.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &lt;<a href=3D"http://linux=
-yocto_4.15.bb" rel=3D"noreferrer" target=3D"_blank">http://linux-yocto_4.1=
5.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 b/meta/recipes-kernel/linux=
/<a href=3D"http://linux-yocto_4.15.bb" rel=3D"noreferrer" target=3D"_blank=
">li<wbr>nux-yocto_4.15.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto_4.15.bb" rel=
=3D"noreferrer" target=3D"_blank">http://linux-yocto_4.15.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &lt;<a href=3D"http://linux=
-yocto_4.15.bb" rel=3D"noreferrer" target=3D"_blank">http://linux-yocto_4.1=
5.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 new file mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 index 000000000000..60b7e60=
0d24d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 --- /dev/null<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +++ b/meta/recipes-kernel/l=
inux/<a href=3D"http://linux-yocto_4.15.bb" rel=3D"noreferrer" target=3D"_b=
lank">li<wbr>nux-yocto_4.15.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto_4.15.bb" rel=
=3D"noreferrer" target=3D"_blank">http://linux-yocto_4.15.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &lt;<a href=3D"http://linux=
-yocto_4.15.bb" rel=3D"noreferrer" target=3D"_blank">http://linux-yocto_4.1=
5.bb</a>&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 @@ -0,0 +1,47 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KBRANCH ?=3D &quot;v4.15/s=
tandard/base&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +require recipes-kernel/lin=
ux/linux-yoc<wbr>to.inc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +# board specific branches<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KBRANCH_qemuarm=C2=A0 ?=3D=
 &quot;v4.15/standard/arm-versatile-<wbr>926ejs&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KBRANCH_qemuarm64 ?=3D &qu=
ot;v4.15/standard/qemuarm64&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KBRANCH_qemumips ?=3D &quo=
t;v4.15/standard/mti-malta32&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KBRANCH_qemuppc=C2=A0 ?=3D=
 &quot;v4.15/standard/qemuppc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KBRANCH_qemux86=C2=A0 ?=3D=
 &quot;v4.15/standard/base&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KBRANCH_qemux86-64 ?=3D &q=
uot;v4.15/standard/base&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KBRANCH_qemumips64 ?=3D &q=
uot;v4.15/standard/mti-malta64&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_machine_qemuarm ?=
=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;5fdc3d579c5f50fbaaa5faecae79e<wbr>20b7381=
0346&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_machine_qemuarm64 ?=
=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;9c2e6c0fc71526c45fc7ddf3ec91e<wbr>2e2f27e=
3da0&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_machine_qemumips ?=
=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;5afbe5a7e271f1c115a7c77bea4a7<wbr>1356c6f=
2792&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_machine_qemuppc ?=
=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;9c2e6c0fc71526c45fc7ddf3ec91e<wbr>2e2f27e=
3da0&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_machine_qemux86 ?=
=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;9c2e6c0fc71526c45fc7ddf3ec91e<wbr>2e2f27e=
3da0&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_machine_qemux86-64 =
?=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;9c2e6c0fc71526c45fc7ddf3ec91e<wbr>2e2f27e=
3da0&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_machine_qemumips64 =
?=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;f9a3a72209bde080e4ecb4fbe7a0f<wbr>9995464=
3131&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_machine ?=3D &quot;=
9c2e6c0fc71526c45fc7ddf3ec91e<wbr>2e2f27e3da0&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRCREV_meta ?=3D &quot;64a=
d69e5b4a38e678500d7a70791a<wbr>c5154c6c154&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +SRC_URI =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;git://<a href=3D"http://git.yoctoproject.org/linux-yocto.git;name=3Dmachin=
e;branch=3D$%7BKBRANCH%7D" rel=3D"noreferrer" target=3D"_blank">git.yoctopr=
oject.org/li<wbr>nux-yocto.git;name=3Dmachine;bra<wbr>nch=3D${KBRANCH}</a><=
br></div></div>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://git.yoctoproject.org/linu=
x-yocto.git;name=3Dmachine;branch=3D$%7BKBRANCH%7D" rel=3D"noreferrer" targ=
et=3D"_blank">http://git.yoctoproject.org/l<wbr>inux-yocto.git;name=3Dmachi=
ne;br<wbr>anch=3D$%7BKBRANCH%7D</a>&gt;<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<=
a href=3D"http://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=
=3D$%7BKBRANCH%7D" rel=3D"noreferrer" target=3D"_blank">http://git.yoctopro=
ject.org/l<wbr>inux-yocto.git;name=3Dmachine;br<wbr>anch=3D${KBRANCH}</a><b=
r></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://git.yoctoproject.org/linu=
x-yocto.git;name=3Dmachine;branch=3D$%7BKBRANCH%7D" rel=3D"noreferrer" targ=
et=3D"_blank">http://git.yoctoproject.org/l<wbr>inux-yocto.git;name=3Dmachi=
ne;br<wbr>anch=3D$%7BKBRANCH%7D</a>&gt;&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D=
"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;br=
anch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=3D"_=
blank">git.yoctoproject.org/yo<wbr>cto-kernel-cache;type=3Dkmeta;na<wbr>me=
=3Dmeta;branch=3Dyocto-4.15;dest<wbr>suffix=3D${KMETA}</a> &lt;<a href=3D"h=
ttp://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;bran=
ch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=3D"_bl=
ank">http://git.yoctoproject.org/y<wbr>octo-kernel-cache;type=3Dkmeta;n<wbr=
>ame=3Dmeta;branch=3Dyocto-4.15;des<wbr>tsuffix=3D$%7BKMETA%7D</a>&gt; &lt;=
<a href=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=
=3Dmeta;branch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" t=
arget=3D"_blank">http://git.yoctoproject.org/y<wbr>octo-kernel-cache;type=
=3Dkmeta;n<wbr>ame=3Dmeta;branch=3Dyocto-4.15;des<wbr>tsuffix=3D${KMETA}</a=
> &lt;<a href=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmet=
a;name=3Dmeta;branch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"norefer=
rer" target=3D"_blank">http://git.yoctoproject.org/y<wbr>octo-kernel-cache;=
type=3Dkmeta;n<wbr>ame=3Dmeta;branch=3Dyocto-4.15;des<wbr>tsuffix=3D$%7BKME=
TA%7D</a>&gt;&gt;&quot;<div><div class=3D"h5"><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +LINUX_VERSION ?=3D &quot;4=
.15&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +DEPENDS +=3D &quot;${@bb.u=
tils.contains(&#39;ARCH&#39;, &#39;x86&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;elfutils-native&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &#39;&#39;, d)}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +DEPENDS +=3D &quot;openssl=
-native util-linux-native&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +PV =3D &quot;${LINUX_VERSI=
ON}+git${SRCPV}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KMETA =3D &quot;kernel-met=
a&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KCONF_BSP_AUDIT_LEVEL =3D =
&quot;2&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_DEVICETREE_qemuarm =
=3D &quot;versatile-pb.dtb&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +COMPATIBLE_MACHINE =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;qemuarm|qemuarm64|qemux86|qem<wbr>uppc|qemumips|qemumips64|qemux<wbr>86-64=
&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +# Functionality flags<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_EXTRA_FEATURES ?=3D=
 &quot;features/netfilter/netfilter.<wbr>scc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_FEATURES_append =3D=
 &quot; ${KERNEL_EXTRA_FEATURES}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_FEATURES_append_qem=
ual<wbr>l=3D&quot; cfg/virtio.scc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_FEATURES_append_qem=
ux8<wbr>6=3D&quot; cfg/sound.scc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfg/paravirt_kvm.scc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_FEATURES_append_qem=
ux8<wbr>6-64=3D&quot; cfg/sound.scc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfg/paravirt_kvm.scc&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 +KERNEL_FEATURES_append =3D=
 &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&quot;TUNE_FEA<wbr>TURES&q=
uot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &quot;mx32&quot;, &quot; cf=
g/x32.scc&quot;, &quot;&quot; ,d)}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 2.5.0<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 ___________________________=
___<wbr>_________________<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 Openembedded-core mailing l=
ist<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:Openembedded-core@lists.opene=
mbedded.org" target=3D"_blank">Openembedded-core@lists.openem<wbr>bedded.or=
g</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:Openembedded-core@=
lists.openembedded.org" target=3D"_blank">Openembedded-core@list<wbr>s.open=
embedded.org</a>&gt;<br></div></div>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailt=
o:Openembedded-core@lists.openembedded.org" target=3D"_blank">Openembedded-=
core@list<wbr>s.openembedded.org</a><span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:Openembedded-core@=
lists.openembedded.org" target=3D"_blank">Openembedded-core@list<wbr>s.open=
embedded.org</a>&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://l=
ists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://lists.openembedded.org/ma=
ilman/listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http=
://lists.openembedded.org<wbr>/mailman/listinfo/openembedded<wbr>-core</a>&=
gt;<br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<=
a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core"=
 rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org<wbr>/ma=
ilman/listinfo/openembedded<wbr>-core</a> &lt;<a href=3D"http://lists.opene=
mbedded.org/mailman/listinfo/openembedded-core" rel=3D"noreferrer" target=
=3D"_blank">http://lists.openembedded.org<wbr>/mailman/listinfo/openembedde=
d<wbr>-core</a>&gt;&gt;<br>
<br>
<br>
<br>
<br>
</blockquote>
<br>
</blockquote></div><br></div>

--94eb2c1935a6580e86056567ef6c--
