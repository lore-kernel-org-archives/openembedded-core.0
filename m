Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0D847782CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 16:37:20 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f3so1996522wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 08:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rabQNtTRdIS/WW89MhC1Kg607im0kuvat0vuzFjcIq0=;
	b=R2X0tue33Cc1DwdA+ulZh47DKzZ4OEkf7uUNQdYeax2IJ811x5Cc46L7R2MUhPZNYV
	sQluaQQml0wUKE6mebpd88gIHEX5XozcPx88yTLqMqQHUqaK8eERjPzkeMiWXMCdmyrF
	O6Jp5ylmPfJQ+0oulRiceMTKqH16AFpOqOsGTKTC0aULP4xQZPwzt7yzKelMbqRupEXv
	mnG9ihVqcuXQN6uer2A1gCrLTdhMdcWoEO/LKTwgosJ8RK9R7Oavv0mtnHW9jCXtmDGU
	TaYXTsFW2Vm8M3yG9Z7jVFQTEWuifFEC0m99Te4Ie1IR7JjkWU/+GP8R2dLIcPjL8cEY
	IhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rabQNtTRdIS/WW89MhC1Kg607im0kuvat0vuzFjcIq0=;
	b=NOJjnOmoI4QJHaGaVwrynZSNqjCY9DylXTNqGuP/9Pg/+HXrNhDC6B8iNIOkTQJw82
	n9iQX3FF2WZl0IaBc322lBYrvtV/UU+ll4FSLUTd5/NOBhjtZHcXoxY6tQaix8BlpitD
	t/xCb22xYN9rrkCmTT98XOxdIR6njmJWdbXmiBexPv/rLe69nPFrDsJB8uGYSfR75VA9
	kTlz+FmDgxfiNFJtvUCDOsOpssA822hOErZ2lsxx7AwssmSaQs8IZeiFaObqflVzaCOT
	TdMLOIDKmTHOhIiRn3WtCY1cUW+iZla3ngQBM5l3D2Yso02UBBVZ2C/In3aILz/B0b02
	I+Ng==
X-Gm-Message-State: APf1xPBs7XXw+CT01GQ0A9uioptPrcNZ+Z4d/79O4W0Aok+h1m7bjlaq
	ede8WNYFumnAd8xgRc8bv1XrYDRXYuuEJwNLoVI=
X-Google-Smtp-Source: AH8x226PD9ozVg5RYyrjcqUbHIFuPkCKJ3lmsxRYCOGWFHX6o7zseVGF/joqaHUa4ngT6OLvvXyrnuvWZUWAj6WQ7Ys=
X-Received: by 10.28.192.24 with SMTP id q24mr2774626wmf.96.1518712641659;
	Thu, 15 Feb 2018 08:37:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Thu, 15 Feb 2018 08:37:21 -0800 (PST)
In-Reply-To: <acbb4efc-2b0c-4089-4b5c-4e2ce0c915f8@windriver.com>
References: <cover.1517931042.git.bruce.ashfield@windriver.com>
	<9c618956cda395a9c8fd101fba7f87af8dbd2304.1517931042.git.bruce.ashfield@windriver.com>
	<CA+chaQcYM+edq-FkhAU4h=kV3fKAtoC=rVNFf5B3QRBVSzn8sg@mail.gmail.com>
	<acbb4efc-2b0c-4089-4b5c-4e2ce0c915f8@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Feb 2018 17:37:21 +0100
Message-ID: <CA+chaQdev33bwfdCoKHw6jP6N2yJ-1y_s9MLxcqh7nxjnN8uTQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 15 Feb 2018 16:37:21 -0000
Content-Type: multipart/alternative; boundary="089e0831478485a796056542d755"

--089e0831478485a796056542d755
Content-Type: text/plain; charset="UTF-8"

After applying
https://patchwork.openembedded.org/patch/147586/
and the do_configure[depends] change I got the same error, but this time in:
make-mod-scripts/1.0-r0/temp/log.do_configure.20429

Regards,

On Thu, Feb 15, 2018 at 5:23 PM, Bruce Ashfield <
bruce.ashfield@windriver.com> wrote:

> On 02/15/2018 11:18 AM, Martin Jansa wrote:
>
>> I'm not sure if this is caused by linux-yocto upgrade or lttng upgrade,
>> but without openssl-dev installed on the host I'm seeing following failures
>> on ubuntu builders:
>>
>
> It's lttng and the new dependencies of the kernel.
>
> I have a two patch series that moves the make-mod-scripts into a recipe
> for better synchronization and fewer races, and on top of that, I have
> this change:
>
> -------
>
> index 6645c873f015..c1b80bf8b148 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -5,15 +5,17 @@ inherit kernel-arch
>
>  S = "${WORKDIR}"
>
> -do_configure[depends] += "virtual/kernel:do_shared_workdir"
> +do_configure[depends] += "virtual/kernel:do_shared_workdir
> openssl-native:do_populate_sysroot"
>
> ----
>
> That makes the header available before lttng actually goes looking for
> it (but it isn't limited to lttng, it is just the expanding kernel
> requirements).
>
> Would you be willing to try those two patches in your usecase ? I sent
> the make-mod-scripts one in the past, but didn't hear anything on it, so
> I'm carrying it locally.
>
> Bruce
>
>
>> oe-core/meta/recipes-kernel/lttng/lttng-modules_2.10.5.bb:do_make_scripts)
>> failed with exit code '1'
>>
>> work-shared/qemux86/kernel-source/scripts/extract-cert.c:21:25: fatal
>> error: openssl/bio.h: No such file or directory
>> |  #include <openssl/bio.h>
>> |                          ^
>> | compilation terminated.
>> | make[2]: *** [scripts/extract-cert] Error 1
>> | make[1]: *** [scripts] Error 2
>>
>> On Tue, Feb 6, 2018 at 5:21 PM, Bruce Ashfield <
>> bruce.ashfield@windriver.com <mailto:bruce.ashfield@windriver.com>>
>> wrote:
>>
>>     This commit makes the 4.15 kernel available for use with the
>>     Yocto configuration fragments and qemu* BSPs.
>>
>>     It has been tested for x86,arm,mips and powerpc against the lsb, core*
>>     and glibc/mulsc test matrix.
>>
>>     This will serve as the "latest" kernel in master, with others being
>>     removed in subsequent commits.
>>
>>     Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com
>>     <mailto:bruce.ashfield@windriver.com>>
>>     ---
>>       meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
>>     <http://linux-yocto-rt_4.15.bb>   | 38 +++++++++++++++++
>>       meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b  | 25
>> ++++++++++++
>>       meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
>>     <http://linux-yocto-tiny_4.15.bb> | 47 ++++++++++++++++++++++
>>       meta/recipes-kernel/linux/linux-yocto_4.15.bb
>>     <http://linux-yocto_4.15.bb>      | 47 ++++++++++++++++++++++
>>       4 files changed, 157 insertions(+)
>>       create mode 100644
>>     meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
>>     <http://linux-yocto-rt_4.15.bb>
>>       create mode 100644 meta/recipes-kernel/linux/linu
>> x-yocto-tiny_4.15.b
>>       create mode 100644
>>     meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
>>     <http://linux-yocto-tiny_4.15.bb>
>>       create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.15.bb
>>     <http://linux-yocto_4.15.bb>
>>
>>     diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
>>     <http://linux-yocto-rt_4.15.bb>
>>     b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
>>     <http://linux-yocto-rt_4.15.bb>
>>     new file mode 100644
>>     index 000000000000..31f8c23cef52
>>     --- /dev/null
>>     +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
>>     <http://linux-yocto-rt_4.15.bb>
>>     @@ -0,0 +1,38 @@
>>     +KBRANCH ?= "v4.15/standard/preempt-rt/base"
>>     +
>>     +require recipes-kernel/linux/linux-yocto.inc
>>     +
>>     +# Skip processing of this recipe if it is not explicitly specified
>>     as the
>>     +# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when
>> trying
>>     +# to build multiple virtual/kernel providers, e.g. as dependency of
>>     +# core-image-rt-sdk, core-image-rt.
>>     +python () {
>>     +    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and
>>     d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
>>     +        raise bb.parse.SkipRecipe("Set
>>     PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>>     +}
>>     +
>>     +SRCREV_machine ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>>     +SRCREV_meta ?= "64ad69e5b4a38e678500d7a70791ac5154c6c154"
>>     +
>>     +SRC_URI =
>>     "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH
>> };name=machine
>> <http://git.yoctoproject.org/linux-yocto.git;branch=$%7BKBRANCH%7D;name=machine>
>>     <http://git.yoctoproject.org/linux-yocto.git;branch=${KBRANC
>> H};name=machine>
>>     \
>>     +               git://git.yoctoproject.org/yo
>> cto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;dest
>> suffix=${KMETA}
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D>
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;n
>> ame=meta;branch=yocto-4.15;destsuffix=${KMETA}>"
>>
>>     +
>>     +LINUX_VERSION ?= "4.15"
>>     +
>>     +PV = "${LINUX_VERSION}+git${SRCPV}"
>>     +
>>     +KMETA = "kernel-meta"
>>     +KCONF_BSP_AUDIT_LEVEL = "2"
>>     +
>>     +LINUX_KERNEL_TYPE = "preempt-rt"
>>     +
>>     +COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
>>     +
>>     +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>>     +
>>     +# Functionality flags
>>     +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc
>>     features/taskstats/taskstats.scc"
>>     +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>>     +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>     +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>     +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>>     diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b
>>     b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b
>>     new file mode 100644
>>     index 000000000000..7a6696c71a68
>>     --- /dev/null
>>     +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b
>>     @@ -0,0 +1,25 @@
>>     +KBRANCH ?= "v4.15/standard/tiny/common-pc"
>>     +LINUX_KERNEL_TYPE = "tiny"
>>     +KCONFIG_MODE = "--allnoconfig"
>>     +
>>     +require recipes-kernel/linux/linux-yocto.inc
>>     +
>>     +LINUX_VERSION ?= "4.15"
>>     +
>>     +KMETA = "kernel-meta"
>>     +KCONF_BSP_AUDIT_LEVEL = "2"
>>     +
>>     +SRCREV_machine ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
>>     +SRCREV_meta ?= "ef2f5d9a0ac1c5ac60e76b18b0bb3393be450336"
>>     +
>>     +PV = "${LINUX_VERSION}+git${SRCPV}"
>>     +
>>     +SRC_URI =
>>     "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH
>> };name=machine
>> <http://git.yoctoproject.org/linux-yocto.git;branch=$%7BKBRANCH%7D;name=machine>
>>     <http://git.yoctoproject.org/linux-yocto.git;branch=${KBRANC
>> H};name=machine>
>>     \
>>     +               git://git.yoctoproject.org/yo
>> cto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;dest
>> suffix=${KMETA}
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D>
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;n
>> ame=meta;branch=yocto-4.15;destsuffix=${KMETA}>"
>>     +
>>     +COMPATIBLE_MACHINE = "qemux86|qemux86-64"
>>     +
>>     +# Functionality flags
>>     +KERNEL_FEATURES = ""
>>     +
>>     +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>>     diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
>>     <http://linux-yocto-tiny_4.15.bb>
>>     b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
>>     <http://linux-yocto-tiny_4.15.bb>
>>     new file mode 100644
>>     index 000000000000..60b7e600d24d
>>     --- /dev/null
>>     +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
>>     <http://linux-yocto-tiny_4.15.bb>
>>
>>     @@ -0,0 +1,47 @@
>>     +KBRANCH ?= "v4.15/standard/base"
>>     +
>>     +require recipes-kernel/linux/linux-yocto.inc
>>     +
>>     +# board specific branches
>>     +KBRANCH_qemuarm  ?= "v4.15/standard/arm-versatile-926ejs"
>>     +KBRANCH_qemuarm64 ?= "v4.15/standard/qemuarm64"
>>     +KBRANCH_qemumips ?= "v4.15/standard/mti-malta32"
>>     +KBRANCH_qemuppc  ?= "v4.15/standard/qemuppc"
>>     +KBRANCH_qemux86  ?= "v4.15/standard/base"
>>     +KBRANCH_qemux86-64 ?= "v4.15/standard/base"
>>     +KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
>>     +
>>     +SRCREV_machine_qemuarm ?= "5fdc3d579c5f50fbaaa5faecae79e20b73810346"
>>     +SRCREV_machine_qemuarm64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e
>> 2e2f27e3da0"
>>     +SRCREV_machine_qemumips ?= "5afbe5a7e271f1c115a7c77bea4a7
>> 1356c6f2792"
>>     +SRCREV_machine_qemuppc ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>>     +SRCREV_machine_qemux86 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>>     +SRCREV_machine_qemux86-64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e
>> 2e2f27e3da0"
>>     +SRCREV_machine_qemumips64 ?= "f9a3a72209bde080e4ecb4fbe7a0f
>> 99954643131"
>>     +SRCREV_machine ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>>     +SRCREV_meta ?= "64ad69e5b4a38e678500d7a70791ac5154c6c154"
>>     +
>>     +SRC_URI =
>>     "git://git.yoctoproject.org/linux-yocto.git;name=machine;bra
>> nch=${KBRANCH}
>> <http://git.yoctoproject.org/linux-yocto.git;name=machine;branch=$%7BKBRANCH%7D>
>>     <http://git.yoctoproject.org/linux-yocto.git;name=machine;br
>> anch=${KBRANCH}>;
>>     \
>>     +               git://git.yoctoproject.org/yo
>> cto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;dest
>> suffix=${KMETA}
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D>
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;n
>> ame=meta;branch=yocto-4.15;destsuffix=${KMETA}>"
>>
>>     +
>>     +LINUX_VERSION ?= "4.15"
>>     +
>>     +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native',
>>     '', d)}"
>>     +DEPENDS += "openssl-native util-linux-native"
>>     +
>>     +PV = "${LINUX_VERSION}+git${SRCPV}"
>>     +
>>     +KMETA = "kernel-meta"
>>     +KCONF_BSP_AUDIT_LEVEL = "2"
>>     +
>>     +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>>     +
>>     +COMPATIBLE_MACHINE =
>>     "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
>>     +
>>     +# Functionality flags
>>     +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>>     +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>>     +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>     +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>     +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc
>> cfg/paravirt_kvm.scc"
>>     +KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES",
>>     "mx32", " cfg/x32.scc", "" ,d)}"
>>     diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
>>     <http://linux-yocto_4.15.bb>
>>     b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
>>     <http://linux-yocto_4.15.bb>
>>     new file mode 100644
>>     index 000000000000..60b7e600d24d
>>     --- /dev/null
>>     +++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
>>     <http://linux-yocto_4.15.bb>
>>
>>     @@ -0,0 +1,47 @@
>>     +KBRANCH ?= "v4.15/standard/base"
>>     +
>>     +require recipes-kernel/linux/linux-yocto.inc
>>     +
>>     +# board specific branches
>>     +KBRANCH_qemuarm  ?= "v4.15/standard/arm-versatile-926ejs"
>>     +KBRANCH_qemuarm64 ?= "v4.15/standard/qemuarm64"
>>     +KBRANCH_qemumips ?= "v4.15/standard/mti-malta32"
>>     +KBRANCH_qemuppc  ?= "v4.15/standard/qemuppc"
>>     +KBRANCH_qemux86  ?= "v4.15/standard/base"
>>     +KBRANCH_qemux86-64 ?= "v4.15/standard/base"
>>     +KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
>>     +
>>     +SRCREV_machine_qemuarm ?= "5fdc3d579c5f50fbaaa5faecae79e20b73810346"
>>     +SRCREV_machine_qemuarm64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e
>> 2e2f27e3da0"
>>     +SRCREV_machine_qemumips ?= "5afbe5a7e271f1c115a7c77bea4a7
>> 1356c6f2792"
>>     +SRCREV_machine_qemuppc ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>>     +SRCREV_machine_qemux86 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>>     +SRCREV_machine_qemux86-64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e
>> 2e2f27e3da0"
>>     +SRCREV_machine_qemumips64 ?= "f9a3a72209bde080e4ecb4fbe7a0f
>> 99954643131"
>>     +SRCREV_machine ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>>     +SRCREV_meta ?= "64ad69e5b4a38e678500d7a70791ac5154c6c154"
>>     +
>>     +SRC_URI =
>>     "git://git.yoctoproject.org/linux-yocto.git;name=machine;bra
>> nch=${KBRANCH}
>> <http://git.yoctoproject.org/linux-yocto.git;name=machine;branch=$%7BKBRANCH%7D>
>>     <http://git.yoctoproject.org/linux-yocto.git;name=machine;br
>> anch=${KBRANCH}>;
>>     \
>>     +               git://git.yoctoproject.org/yo
>> cto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;dest
>> suffix=${KMETA}
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D>
>> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;n
>> ame=meta;branch=yocto-4.15;destsuffix=${KMETA}>"
>>
>>     +
>>     +LINUX_VERSION ?= "4.15"
>>     +
>>     +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native',
>>     '', d)}"
>>     +DEPENDS += "openssl-native util-linux-native"
>>     +
>>     +PV = "${LINUX_VERSION}+git${SRCPV}"
>>     +
>>     +KMETA = "kernel-meta"
>>     +KCONF_BSP_AUDIT_LEVEL = "2"
>>     +
>>     +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>>     +
>>     +COMPATIBLE_MACHINE =
>>     "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
>>     +
>>     +# Functionality flags
>>     +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>>     +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>>     +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>     +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>     +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc
>> cfg/paravirt_kvm.scc"
>>     +KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES",
>>     "mx32", " cfg/x32.scc", "" ,d)}"
>>     --
>>     2.5.0
>>
>>     --
>>     _______________________________________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.openembedded.org
>>     <mailto:Openembedded-core@lists.openembedded.org>
>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>>
>>
>>
>

--089e0831478485a796056542d755
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">After applying<div><a href=3D"https://patchwork.openembedd=
ed.org/patch/147586/">https://patchwork.openembedded.org/patch/147586/</a><=
br></div><div>and the do_configure[depends] change I got the same error, bu=
t this time in:</div><div>make-mod-scripts/1.0-r0/temp/log.do_configure.204=
29<br></div><div><br></div><div>Regards,</div></div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">On Thu, Feb 15, 2018 at 5:23 PM, Bruce A=
shfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@windriver.co=
m" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span class=3D"">On 02/15/2018 11:18 AM, Mar=
tin Jansa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I&#39;m not sure if this is caused by linux-yocto upgrade or lttng upgrade,=
 but without openssl-dev installed on the host I&#39;m seeing following fai=
lures on ubuntu builders:<br>
</blockquote>
<br></span>
It&#39;s lttng and the new dependencies of the kernel.<br>
<br>
I have a two patch series that moves the make-mod-scripts into a recipe<br>
for better synchronization and fewer races, and on top of that, I have<br>
this change:<br>
<br>
-------<br>
<br>
index 6645c873f015..c1b80bf8b148 100644<br>
--- a/meta/recipes-kernel/make-mod<wbr>-scripts/<a href=3D"http://make-mod-=
scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.<=
wbr>bb</a><br>
+++ b/meta/recipes-kernel/make-mod<wbr>-scripts/<a href=3D"http://make-mod-=
scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.<=
wbr>bb</a><br>
@@ -5,15 +5,17 @@ inherit kernel-arch<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}&quot;<br>
<br>
-do_configure[depends] +=3D &quot;virtual/kernel:do_shared_work<wbr>dir&quo=
t;<br>
+do_configure[depends] +=3D &quot;virtual/kernel:do_shared_work<wbr>dir ope=
nssl-native:do_populate_sys<wbr>root&quot;<br>
<br>
----<br>
<br>
That makes the header available before lttng actually goes looking for<br>
it (but it isn&#39;t limited to lttng, it is just the expanding kernel<br>
requirements).<br>
<br>
Would you be willing to try those two patches in your usecase ? I sent<br>
the make-mod-scripts one in the past, but didn&#39;t hear anything on it, s=
o<br>
I&#39;m carrying it locally.<br>
<br>
Bruce<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span class=3D"">
<br>
oe-core/meta/recipes-kernel/lt<wbr>tng/<a href=3D"http://lttng-modules_2.10=
.5.bb" target=3D"_blank">lttng-modules_2.10.5.bb</a>:do<wbr>_make_scripts) =
failed with exit code &#39;1&#39;<br>
<br>
work-shared/qemux86/kernel-sou<wbr>rce/scripts/extract-cert.c:21:<wbr>25: f=
atal error: openssl/bio.h: No such file or directory<br>
|=C2=A0 #include &lt;openssl/bio.h&gt;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^<br>
| compilation terminated.<br>
| make[2]: *** [scripts/extract-cert] Error 1<br>
| make[1]: *** [scripts] Error 2<br>
<br></span><span class=3D"">
On Tue, Feb 6, 2018 at 5:21 PM, Bruce Ashfield &lt;<a href=3D"mailto:bruce.=
ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windriver.com</a> =
&lt;mailto:<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank=
">bruce.ashfield@windriv<wbr>er.com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 This commit makes the 4.15 kernel available for use with the<=
br>
=C2=A0 =C2=A0 Yocto configuration fragments and qemu* BSPs.<br>
<br>
=C2=A0 =C2=A0 It has been tested for x86,arm,mips and powerpc against the l=
sb, core*<br>
=C2=A0 =C2=A0 and glibc/mulsc test matrix.<br>
<br>
=C2=A0 =C2=A0 This will serve as the &quot;latest&quot; kernel in master, w=
ith others being<br>
=C2=A0 =C2=A0 removed in subsequent commits.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ash=
field@windriver.com" target=3D"_blank">bruce.ashfield@windriver.com</a><br>=
</span>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:bruce.ashfield@windriver.com" ta=
rget=3D"_blank">bruce.ashfield@windriv<wbr>er.com</a>&gt;&gt;<br>
=C2=A0 =C2=A0 ---<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux=
-yocto-rt_4.15.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt=
_4.15.bb</a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-rt_4.15.bb" rel=3D"noreferr=
er" target=3D"_blank">http://linux-yocto-rt_4.15.bb</a><wbr>&gt;=C2=A0 =C2=
=A0| 38 +++++++++++++++++<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0meta/recipes-kernel/linux/li<wbr>nux-yocto-tiny_4=
.15.b=C2=A0 | 25 ++++++++++++<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux=
-yocto-tiny_4.15.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-=
tiny_4.15.bb</a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-tiny_4.15.bb" rel=3D"norefe=
rrer" target=3D"_blank">http://linux-yocto-tiny_4.15.<wbr>bb</a>&gt; | 47 +=
+++++++++++++++++++++<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux=
-yocto_4.15.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.15.=
bb</a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto_4.15.bb" rel=3D"noreferrer"=
 target=3D"_blank">http://linux-yocto_4.15.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 |=
 47 ++++++++++++++++++++++<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0=C2=A04 files changed, 157 insertions(+)<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
=C2=A0 =C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.=
15.bb" rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-rt_4.15.bb</a>=
<br></span>
=C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-rt_4.15.bb" rel=3D"noreferr=
er" target=3D"_blank">http://linux-yocto-rt_4.15.bb</a><wbr>&gt;<span class=
=3D""><br>
=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta/recipes-kernel/linux/linu=
<wbr>x-yocto-tiny_4.15.b<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
=C2=A0 =C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_=
4.15.bb" rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-tiny_4.15.bb=
</a><br></span>
=C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-tiny_4.15.bb" rel=3D"norefe=
rrer" target=3D"_blank">http://linux-yocto-tiny_4.15.<wbr>bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta/recipes-kernel/linux/<a h=
ref=3D"http://linux-yocto_4.15.bb" rel=3D"noreferrer" target=3D"_blank">lin=
u<wbr>x-yocto_4.15.bb</a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto_4.15.bb" rel=3D"noreferrer"=
 target=3D"_blank">http://linux-yocto_4.15.bb</a>&gt;<br>
<br>
=C2=A0 =C2=A0 diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linu=
x-yocto-rt_4.15.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-r=
t_4.15.bb</a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-rt_4.15.bb" rel=3D"noreferr=
er" target=3D"_blank">http://linux-yocto-rt_4.15.bb</a><wbr>&gt;<br>
=C2=A0 =C2=A0 b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_=
4.15.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.15.bb</=
a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-rt_4.15.bb" rel=3D"noreferr=
er" target=3D"_blank">http://linux-yocto-rt_4.15.bb</a><wbr>&gt;<span class=
=3D""><br>
=C2=A0 =C2=A0 new file mode 100644<br>
=C2=A0 =C2=A0 index 000000000000..31f8c23cef52<br>
=C2=A0 =C2=A0 --- /dev/null<br>
=C2=A0 =C2=A0 +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto=
-rt_4.15.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.15.=
bb</a><br></span>
=C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-rt_4.15.bb" rel=3D"noreferr=
er" target=3D"_blank">http://linux-yocto-rt_4.15.bb</a><wbr>&gt;<span class=
=3D""><br>
=C2=A0 =C2=A0 @@ -0,0 +1,38 @@<br>
=C2=A0 =C2=A0 +KBRANCH ?=3D &quot;v4.15/standard/preempt-rt/bas<wbr>e&quot;=
<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +require recipes-kernel/linux/linux-yoc<wbr>to.inc<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +# Skip processing of this recipe if it is not explicitly spe=
cified<br>
=C2=A0 =C2=A0 as the<br>
=C2=A0 =C2=A0 +# PREFERRED_PROVIDER for virtual/kernel. This avoids errors =
when trying<br>
=C2=A0 =C2=A0 +# to build multiple virtual/kernel providers, e.g. as depend=
ency of<br>
=C2=A0 =C2=A0 +# core-image-rt-sdk, core-image-rt.<br>
=C2=A0 =C2=A0 +python () {<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 if d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;<wb=
r>) =3D=3D &quot;kernel&quot; and<br>
=C2=A0 =C2=A0 d.getVar(&quot;PREFERRED_PROVIDER_v<wbr>irtual/kernel&quot;) =
!=3D &quot;linux-yocto-rt&quot;:<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot;=
Set<br>
=C2=A0 =C2=A0 PREFERRED_PROVIDER_virtual/ker<wbr>nel to linux-yocto-rt to e=
nable it&quot;)<br>
=C2=A0 =C2=A0 +}<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +SRCREV_machine ?=3D &quot;9c2e6c0fc71526c45fc7ddf3ec91e<wbr>=
2e2f27e3da0&quot;<br>
=C2=A0 =C2=A0 +SRCREV_meta ?=3D &quot;64ad69e5b4a38e678500d7a70791a<wbr>c51=
54c6c154&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +SRC_URI =3D<br>
=C2=A0 =C2=A0 &quot;git://<a href=3D"http://git.yoctoproject.org/linux-yoct=
o.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine" rel=3D"noreferrer" target=3D"=
_blank">git.yoctoproject.org/li<wbr>nux-yocto.git;branch=3D${KBRANCH<wbr>};=
name=3Dmachine</a><br></span>
=C2=A0 =C2=A0 &lt;<a href=3D"http://git.yoctoproject.org/linux-yocto.git;br=
anch=3D$%7BKBRANCH%7D;name=3Dmachine" rel=3D"noreferrer" target=3D"_blank">=
http://git.yoctoproject.org/l<wbr>inux-yocto.git;branch=3D${KBRANC<wbr>H};n=
ame=3Dmachine</a>&gt;<br>
=C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git:/=
/<a href=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;nam=
e=3Dmeta;branch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" =
target=3D"_blank">git.yoctoproject.org/yo<wbr>cto-kernel-cache;type=3Dkmeta=
;na<wbr>me=3Dmeta;branch=3Dyocto-4.15;dest<wbr>suffix=3D${KMETA}</a> &lt;<a=
 href=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=
=3Dmeta;branch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" t=
arget=3D"_blank">http://git.yoctoproject.org/y<wbr>octo-kernel-cache;type=
=3Dkmeta;n<wbr>ame=3Dmeta;branch=3Dyocto-4.15;des<wbr>tsuffix=3D${KMETA}</a=
>&gt;&quot;<div><div class=3D"h5"><br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +LINUX_VERSION ?=3D &quot;4.15&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0 =C2=A0 +KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +LINUX_KERNEL_TYPE =3D &quot;preempt-rt&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +COMPATIBLE_MACHINE =3D &quot;(qemux86|qemux86-64|qemuarm|q<w=
br>emuppc|qemumips)&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +KERNEL_DEVICETREE_qemuarm =3D &quot;versatile-pb.dtb&quot;<b=
r>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +# Functionality flags<br>
=C2=A0 =C2=A0 +KERNEL_EXTRA_FEATURES ?=3D &quot;features/netfilter/netfilte=
r.<wbr>scc<br>
=C2=A0 =C2=A0 features/taskstats/taskstats.s<wbr>cc&quot;<br>
=C2=A0 =C2=A0 +KERNEL_FEATURES_append =3D &quot; ${KERNEL_EXTRA_FEATURES}&q=
uot;<br>
=C2=A0 =C2=A0 +KERNEL_FEATURES_append_qemual<wbr>l=3D&quot; cfg/virtio.scc&=
quot;<br>
=C2=A0 =C2=A0 +KERNEL_FEATURES_append_qemux8<wbr>6=3D&quot; cfg/sound.scc c=
fg/paravirt_kvm.scc&quot;<br>
=C2=A0 =C2=A0 +KERNEL_FEATURES_append_qemux8<wbr>6-64=3D&quot; cfg/sound.sc=
c&quot;<br>
=C2=A0 =C2=A0 diff --git a/meta/recipes-kernel/linux/li<wbr>nux-yocto-tiny_=
4.15.b<br>
=C2=A0 =C2=A0 b/meta/recipes-kernel/linux/li<wbr>nux-yocto-tiny_4.15.b<br>
=C2=A0 =C2=A0 new file mode 100644<br>
=C2=A0 =C2=A0 index 000000000000..7a6696c71a68<br>
=C2=A0 =C2=A0 --- /dev/null<br>
=C2=A0 =C2=A0 +++ b/meta/recipes-kernel/linux/li<wbr>nux-yocto-tiny_4.15.b<=
br>
=C2=A0 =C2=A0 @@ -0,0 +1,25 @@<br>
=C2=A0 =C2=A0 +KBRANCH ?=3D &quot;v4.15/standard/tiny/common-pc<wbr>&quot;<=
br>
=C2=A0 =C2=A0 +LINUX_KERNEL_TYPE =3D &quot;tiny&quot;<br>
=C2=A0 =C2=A0 +KCONFIG_MODE =3D &quot;--allnoconfig&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +require recipes-kernel/linux/linux-yoc<wbr>to.inc<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +LINUX_VERSION ?=3D &quot;4.15&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0 =C2=A0 +KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +SRCREV_machine ?=3D &quot;f7a6d45fff853173bfbf61706aeff<wbr>=
cd1d1e99467&quot;<br>
=C2=A0 =C2=A0 +SRCREV_meta ?=3D &quot;ef2f5d9a0ac1c5ac60e76b18b0bb3<wbr>393=
be450336&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +SRC_URI =3D<br>
=C2=A0 =C2=A0 &quot;git://<a href=3D"http://git.yoctoproject.org/linux-yoct=
o.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine" rel=3D"noreferrer" target=3D"=
_blank">git.yoctoproject.org/li<wbr>nux-yocto.git;branch=3D${KBRANCH<wbr>};=
name=3Dmachine</a><br></div></div>
=C2=A0 =C2=A0 &lt;<a href=3D"http://git.yoctoproject.org/linux-yocto.git;br=
anch=3D$%7BKBRANCH%7D;name=3Dmachine" rel=3D"noreferrer" target=3D"_blank">=
http://git.yoctoproject.org/l<wbr>inux-yocto.git;branch=3D${KBRANC<wbr>H};n=
ame=3Dmachine</a>&gt;<br>
=C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git:/=
/<a href=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;nam=
e=3Dmeta;branch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" =
target=3D"_blank">git.yoctoproject.org/yo<wbr>cto-kernel-cache;type=3Dkmeta=
;na<wbr>me=3Dmeta;branch=3Dyocto-4.15;dest<wbr>suffix=3D${KMETA}</a> &lt;<a=
 href=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=
=3Dmeta;branch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" t=
arget=3D"_blank">http://git.yoctoproject.org/y<wbr>octo-kernel-cache;type=
=3Dkmeta;n<wbr>ame=3Dmeta;branch=3Dyocto-4.15;des<wbr>tsuffix=3D${KMETA}</a=
>&gt;&quot;<span class=3D""><br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +COMPATIBLE_MACHINE =3D &quot;qemux86|qemux86-64&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +# Functionality flags<br>
=C2=A0 =C2=A0 +KERNEL_FEATURES =3D &quot;&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +KERNEL_DEVICETREE_qemuarm =3D &quot;versatile-pb.dtb&quot;<b=
r>
=C2=A0 =C2=A0 diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linu=
x-yocto-tiny_4.15.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto=
-tiny_4.15.bb</a><br></span>
=C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-tiny_4.15.bb" rel=3D"norefe=
rrer" target=3D"_blank">http://linux-yocto-tiny_4.15.<wbr>bb</a>&gt;<br>
=C2=A0 =C2=A0 b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tin=
y_4.15.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.15.=
bb</a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-tiny_4.15.bb" rel=3D"norefe=
rrer" target=3D"_blank">http://linux-yocto-tiny_4.15.<wbr>bb</a>&gt;<span c=
lass=3D""><br>
=C2=A0 =C2=A0 new file mode 100644<br>
=C2=A0 =C2=A0 index 000000000000..60b7e600d24d<br>
=C2=A0 =C2=A0 --- /dev/null<br>
=C2=A0 =C2=A0 +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto=
-tiny_4.15.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4=
.15.bb</a><br></span>
=C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-tiny_4.15.bb" rel=3D"norefe=
rrer" target=3D"_blank">http://linux-yocto-tiny_4.15.<wbr>bb</a>&gt;<div><d=
iv class=3D"h5"><br>
=C2=A0 =C2=A0 @@ -0,0 +1,47 @@<br>
=C2=A0 =C2=A0 +KBRANCH ?=3D &quot;v4.15/standard/base&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +require recipes-kernel/linux/linux-yoc<wbr>to.inc<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +# board specific branches<br>
=C2=A0 =C2=A0 +KBRANCH_qemuarm=C2=A0 ?=3D &quot;v4.15/standard/arm-versatil=
e-<wbr>926ejs&quot;<br>
=C2=A0 =C2=A0 +KBRANCH_qemuarm64 ?=3D &quot;v4.15/standard/qemuarm64&quot;<=
br>
=C2=A0 =C2=A0 +KBRANCH_qemumips ?=3D &quot;v4.15/standard/mti-malta32&quot;=
<br>
=C2=A0 =C2=A0 +KBRANCH_qemuppc=C2=A0 ?=3D &quot;v4.15/standard/qemuppc&quot=
;<br>
=C2=A0 =C2=A0 +KBRANCH_qemux86=C2=A0 ?=3D &quot;v4.15/standard/base&quot;<b=
r>
=C2=A0 =C2=A0 +KBRANCH_qemux86-64 ?=3D &quot;v4.15/standard/base&quot;<br>
=C2=A0 =C2=A0 +KBRANCH_qemumips64 ?=3D &quot;v4.15/standard/mti-malta64&quo=
t;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +SRCREV_machine_qemuarm ?=3D &quot;5fdc3d579c5f50fbaaa5faecae=
79e<wbr>20b73810346&quot;<br>
=C2=A0 =C2=A0 +SRCREV_machine_qemuarm64 ?=3D &quot;9c2e6c0fc71526c45fc7ddf3=
ec91e<wbr>2e2f27e3da0&quot;<br>
=C2=A0 =C2=A0 +SRCREV_machine_qemumips ?=3D &quot;5afbe5a7e271f1c115a7c77be=
a4a7<wbr>1356c6f2792&quot;<br>
=C2=A0 =C2=A0 +SRCREV_machine_qemuppc ?=3D &quot;9c2e6c0fc71526c45fc7ddf3ec=
91e<wbr>2e2f27e3da0&quot;<br>
=C2=A0 =C2=A0 +SRCREV_machine_qemux86 ?=3D &quot;9c2e6c0fc71526c45fc7ddf3ec=
91e<wbr>2e2f27e3da0&quot;<br>
=C2=A0 =C2=A0 +SRCREV_machine_qemux86-64 ?=3D &quot;9c2e6c0fc71526c45fc7ddf=
3ec91e<wbr>2e2f27e3da0&quot;<br>
=C2=A0 =C2=A0 +SRCREV_machine_qemumips64 ?=3D &quot;f9a3a72209bde080e4ecb4f=
be7a0f<wbr>99954643131&quot;<br>
=C2=A0 =C2=A0 +SRCREV_machine ?=3D &quot;9c2e6c0fc71526c45fc7ddf3ec91e<wbr>=
2e2f27e3da0&quot;<br>
=C2=A0 =C2=A0 +SRCREV_meta ?=3D &quot;64ad69e5b4a38e678500d7a70791a<wbr>c51=
54c6c154&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +SRC_URI =3D<br>
=C2=A0 =C2=A0 &quot;git://<a href=3D"http://git.yoctoproject.org/linux-yoct=
o.git;name=3Dmachine;branch=3D$%7BKBRANCH%7D" rel=3D"noreferrer" target=3D"=
_blank">git.yoctoproject.org/li<wbr>nux-yocto.git;name=3Dmachine;bra<wbr>nc=
h=3D${KBRANCH}</a><br></div></div>
=C2=A0 =C2=A0 &lt;<a href=3D"http://git.yoctoproject.org/linux-yocto.git;na=
me=3Dmachine;branch=3D$%7BKBRANCH%7D" rel=3D"noreferrer" target=3D"_blank">=
http://git.yoctoproject.org/l<wbr>inux-yocto.git;name=3Dmachine;br<wbr>anch=
=3D${KBRANCH}</a>&gt;;<br>
=C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git:/=
/<a href=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;nam=
e=3Dmeta;branch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" =
target=3D"_blank">git.yoctoproject.org/yo<wbr>cto-kernel-cache;type=3Dkmeta=
;na<wbr>me=3Dmeta;branch=3Dyocto-4.15;dest<wbr>suffix=3D${KMETA}</a> &lt;<a=
 href=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=
=3Dmeta;branch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" t=
arget=3D"_blank">http://git.yoctoproject.org/y<wbr>octo-kernel-cache;type=
=3Dkmeta;n<wbr>ame=3Dmeta;branch=3Dyocto-4.15;des<wbr>tsuffix=3D${KMETA}</a=
>&gt;&quot;<div><div class=3D"h5"><br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +LINUX_VERSION ?=3D &quot;4.15&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39=
;x86&#39;, &#39;elfutils-native&#39;,<br>
=C2=A0 =C2=A0 &#39;&#39;, d)}&quot;<br>
=C2=A0 =C2=A0 +DEPENDS +=3D &quot;openssl-native util-linux-native&quot;<br=
>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0 =C2=A0 +KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +KERNEL_DEVICETREE_qemuarm =3D &quot;versatile-pb.dtb&quot;<b=
r>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +COMPATIBLE_MACHINE =3D<br>
=C2=A0 =C2=A0 &quot;qemuarm|qemuarm64|qemux86|qem<wbr>uppc|qemumips|qemumip=
s64|qemux<wbr>86-64&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +# Functionality flags<br>
=C2=A0 =C2=A0 +KERNEL_EXTRA_FEATURES ?=3D &quot;features/netfilter/netfilte=
r.<wbr>scc&quot;<br>
=C2=A0 =C2=A0 +KERNEL_FEATURES_append =3D &quot; ${KERNEL_EXTRA_FEATURES}&q=
uot;<br>
=C2=A0 =C2=A0 +KERNEL_FEATURES_append_qemual<wbr>l=3D&quot; cfg/virtio.scc&=
quot;<br>
=C2=A0 =C2=A0 +KERNEL_FEATURES_append_qemux8<wbr>6=3D&quot; cfg/sound.scc c=
fg/paravirt_kvm.scc&quot;<br>
=C2=A0 =C2=A0 +KERNEL_FEATURES_append_qemux8<wbr>6-64=3D&quot; cfg/sound.sc=
c cfg/paravirt_kvm.scc&quot;<br>
=C2=A0 =C2=A0 +KERNEL_FEATURES_append =3D &quot; ${@bb.utils.contains(&quot=
;TUNE_FEA<wbr>TURES&quot;,<br>
=C2=A0 =C2=A0 &quot;mx32&quot;, &quot; cfg/x32.scc&quot;, &quot;&quot; ,d)}=
&quot;<br>
=C2=A0 =C2=A0 diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linu=
x-yocto_4.15.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.15=
.bb</a><br></div></div>
=C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto_4.15.bb" rel=3D"noreferrer"=
 target=3D"_blank">http://linux-yocto_4.15.bb</a>&gt;<br>
=C2=A0 =C2=A0 b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.1=
5.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.15.bb</a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto_4.15.bb" rel=3D"noreferrer"=
 target=3D"_blank">http://linux-yocto_4.15.bb</a>&gt;<span class=3D""><br>
=C2=A0 =C2=A0 new file mode 100644<br>
=C2=A0 =C2=A0 index 000000000000..60b7e600d24d<br>
=C2=A0 =C2=A0 --- /dev/null<br>
=C2=A0 =C2=A0 +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto=
_4.15.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.15.bb</a>=
<br></span>
=C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto_4.15.bb" rel=3D"noreferrer"=
 target=3D"_blank">http://linux-yocto_4.15.bb</a>&gt;<div><div class=3D"h5"=
><br>
=C2=A0 =C2=A0 @@ -0,0 +1,47 @@<br>
=C2=A0 =C2=A0 +KBRANCH ?=3D &quot;v4.15/standard/base&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +require recipes-kernel/linux/linux-yoc<wbr>to.inc<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +# board specific branches<br>
=C2=A0 =C2=A0 +KBRANCH_qemuarm=C2=A0 ?=3D &quot;v4.15/standard/arm-versatil=
e-<wbr>926ejs&quot;<br>
=C2=A0 =C2=A0 +KBRANCH_qemuarm64 ?=3D &quot;v4.15/standard/qemuarm64&quot;<=
br>
=C2=A0 =C2=A0 +KBRANCH_qemumips ?=3D &quot;v4.15/standard/mti-malta32&quot;=
<br>
=C2=A0 =C2=A0 +KBRANCH_qemuppc=C2=A0 ?=3D &quot;v4.15/standard/qemuppc&quot=
;<br>
=C2=A0 =C2=A0 +KBRANCH_qemux86=C2=A0 ?=3D &quot;v4.15/standard/base&quot;<b=
r>
=C2=A0 =C2=A0 +KBRANCH_qemux86-64 ?=3D &quot;v4.15/standard/base&quot;<br>
=C2=A0 =C2=A0 +KBRANCH_qemumips64 ?=3D &quot;v4.15/standard/mti-malta64&quo=
t;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +SRCREV_machine_qemuarm ?=3D &quot;5fdc3d579c5f50fbaaa5faecae=
79e<wbr>20b73810346&quot;<br>
=C2=A0 =C2=A0 +SRCREV_machine_qemuarm64 ?=3D &quot;9c2e6c0fc71526c45fc7ddf3=
ec91e<wbr>2e2f27e3da0&quot;<br>
=C2=A0 =C2=A0 +SRCREV_machine_qemumips ?=3D &quot;5afbe5a7e271f1c115a7c77be=
a4a7<wbr>1356c6f2792&quot;<br>
=C2=A0 =C2=A0 +SRCREV_machine_qemuppc ?=3D &quot;9c2e6c0fc71526c45fc7ddf3ec=
91e<wbr>2e2f27e3da0&quot;<br>
=C2=A0 =C2=A0 +SRCREV_machine_qemux86 ?=3D &quot;9c2e6c0fc71526c45fc7ddf3ec=
91e<wbr>2e2f27e3da0&quot;<br>
=C2=A0 =C2=A0 +SRCREV_machine_qemux86-64 ?=3D &quot;9c2e6c0fc71526c45fc7ddf=
3ec91e<wbr>2e2f27e3da0&quot;<br>
=C2=A0 =C2=A0 +SRCREV_machine_qemumips64 ?=3D &quot;f9a3a72209bde080e4ecb4f=
be7a0f<wbr>99954643131&quot;<br>
=C2=A0 =C2=A0 +SRCREV_machine ?=3D &quot;9c2e6c0fc71526c45fc7ddf3ec91e<wbr>=
2e2f27e3da0&quot;<br>
=C2=A0 =C2=A0 +SRCREV_meta ?=3D &quot;64ad69e5b4a38e678500d7a70791a<wbr>c51=
54c6c154&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +SRC_URI =3D<br>
=C2=A0 =C2=A0 &quot;git://<a href=3D"http://git.yoctoproject.org/linux-yoct=
o.git;name=3Dmachine;branch=3D$%7BKBRANCH%7D" rel=3D"noreferrer" target=3D"=
_blank">git.yoctoproject.org/li<wbr>nux-yocto.git;name=3Dmachine;bra<wbr>nc=
h=3D${KBRANCH}</a><br></div></div>
=C2=A0 =C2=A0 &lt;<a href=3D"http://git.yoctoproject.org/linux-yocto.git;na=
me=3Dmachine;branch=3D$%7BKBRANCH%7D" rel=3D"noreferrer" target=3D"_blank">=
http://git.yoctoproject.org/l<wbr>inux-yocto.git;name=3Dmachine;br<wbr>anch=
=3D${KBRANCH}</a>&gt;;<br>
=C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git:/=
/<a href=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;nam=
e=3Dmeta;branch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" =
target=3D"_blank">git.yoctoproject.org/yo<wbr>cto-kernel-cache;type=3Dkmeta=
;na<wbr>me=3Dmeta;branch=3Dyocto-4.15;dest<wbr>suffix=3D${KMETA}</a> &lt;<a=
 href=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=
=3Dmeta;branch=3Dyocto-4.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" t=
arget=3D"_blank">http://git.yoctoproject.org/y<wbr>octo-kernel-cache;type=
=3Dkmeta;n<wbr>ame=3Dmeta;branch=3Dyocto-4.15;des<wbr>tsuffix=3D${KMETA}</a=
>&gt;&quot;<div><div class=3D"h5"><br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +LINUX_VERSION ?=3D &quot;4.15&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39=
;x86&#39;, &#39;elfutils-native&#39;,<br>
=C2=A0 =C2=A0 &#39;&#39;, d)}&quot;<br>
=C2=A0 =C2=A0 +DEPENDS +=3D &quot;openssl-native util-linux-native&quot;<br=
>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0 =C2=A0 +KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +KERNEL_DEVICETREE_qemuarm =3D &quot;versatile-pb.dtb&quot;<b=
r>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +COMPATIBLE_MACHINE =3D<br>
=C2=A0 =C2=A0 &quot;qemuarm|qemuarm64|qemux86|qem<wbr>uppc|qemumips|qemumip=
s64|qemux<wbr>86-64&quot;<br>
=C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 +# Functionality flags<br>
=C2=A0 =C2=A0 +KERNEL_EXTRA_FEATURES ?=3D &quot;features/netfilter/netfilte=
r.<wbr>scc&quot;<br>
=C2=A0 =C2=A0 +KERNEL_FEATURES_append =3D &quot; ${KERNEL_EXTRA_FEATURES}&q=
uot;<br>
=C2=A0 =C2=A0 +KERNEL_FEATURES_append_qemual<wbr>l=3D&quot; cfg/virtio.scc&=
quot;<br>
=C2=A0 =C2=A0 +KERNEL_FEATURES_append_qemux8<wbr>6=3D&quot; cfg/sound.scc c=
fg/paravirt_kvm.scc&quot;<br>
=C2=A0 =C2=A0 +KERNEL_FEATURES_append_qemux8<wbr>6-64=3D&quot; cfg/sound.sc=
c cfg/paravirt_kvm.scc&quot;<br>
=C2=A0 =C2=A0 +KERNEL_FEATURES_append =3D &quot; ${@bb.utils.contains(&quot=
;TUNE_FEA<wbr>TURES&quot;,<br>
=C2=A0 =C2=A0 &quot;mx32&quot;, &quot; cfg/x32.scc&quot;, &quot;&quot; ,d)}=
&quot;<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 2.5.0<br>
<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 ______________________________<wbr>_________________<br>
=C2=A0 =C2=A0 Openembedded-core mailing list<br>
=C2=A0 =C2=A0 <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br></div=
></div>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:Openembedded-core@lists.openembe=
dded.org" target=3D"_blank">Openembedded-core@list<wbr>s.openembedded.org</=
a>&gt;<br>
=C2=A0 =C2=A0 <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"http://lists.openembedded.org/mailman/listinfo=
/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.opene=
mbedded.org<wbr>/mailman/listinfo/openembedded<wbr>-core</a>&gt;<br>
<br>
<br>
</blockquote>
<br>
</blockquote></div><br></div>

--089e0831478485a796056542d755--
