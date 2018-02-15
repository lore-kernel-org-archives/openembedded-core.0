Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id BF09271D97
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 16:18:16 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id j21so1838525wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 08:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ynWAUwkMMMjMlHcvBcfGGw96/Lb59YKIKlifFYd9y2M=;
	b=SyA0b4NBNz9oRqgvNDY7IddWeq+tqAfx8jztTcIVDkJkEQslkaM/drThrUtTHWYyuR
	PQS4nXzN9uSSpfygHo8/K9WZGY82Dn5wNUKD1SimMwoFUWEK+88h/Y9IgRSDObodLNrM
	kEwA/B9xDlq4ma74TUKYY1BPMUcn5No25rJjwGwFR9U16BU7DSQesDW/I8Hp2WFjiBOr
	6o3taQe9phN0p1uNSItNY7zmwIAOCQn9o8qQcD2hZ9mGVEXfCYa6cWNYpOs7CyeTjJEk
	B7ypl2aZQK5W/lVa8nr76auv9kDWjY+Jz6x+OwVgQmrf5hiAzJpzKKHDVM8+LJFU5JeH
	aMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ynWAUwkMMMjMlHcvBcfGGw96/Lb59YKIKlifFYd9y2M=;
	b=EEMF3FQqI/b4PAK2rxt7zFv3ubpaT/z2SGFLLKam5qa3qlmNRDJ8yQGyTL25k9GnMr
	heW49Sstig/ypp7Gx9BH/BXfDYwN4dr166gfB7pQoZkeSr3Um3xdFaE2PnSkcgfgn+Gm
	+yIHROdtNLPWRXrLi6yO8BMLpgNeA6NNCotVDwMkkCTHS8bg6GWizmYoDG8mtlgoZLw0
	gA+jjEPsDR8TfaRbw8ttiBa836SecHEoeZNsU2McioK2CwLXjudyq+RQGsaY7zfRadCw
	WBIbSwKS10+Apxcz3fuccrwp9/gaZwCsslxSeQqaMfq5bIO/o0gAlCZEekmbqO9CBI5W
	VDnA==
X-Gm-Message-State: APf1xPAe0EqoLWmYrrL4zbv1sGFAyJEuxnKer0b1UJSA52xOyLV7s457
	ukGVFoKfhB9Kyn4knw8nDrbfC7T/ygbc4K/wDUc=
X-Google-Smtp-Source: AH8x226Qi1okFozuQ0VS+TTUu2ObJbBtinhvJ7ddIQz+fh7bdxAhPztoOe1QARaU1cvt1vTT93zkINuPlnnfviN3RX8=
X-Received: by 10.28.131.210 with SMTP id f201mr2665753wmd.117.1518711496591; 
	Thu, 15 Feb 2018 08:18:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Thu, 15 Feb 2018 08:18:16 -0800 (PST)
In-Reply-To: <9c618956cda395a9c8fd101fba7f87af8dbd2304.1517931042.git.bruce.ashfield@windriver.com>
References: <cover.1517931042.git.bruce.ashfield@windriver.com>
	<9c618956cda395a9c8fd101fba7f87af8dbd2304.1517931042.git.bruce.ashfield@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Feb 2018 17:18:16 +0100
Message-ID: <CA+chaQcYM+edq-FkhAU4h=kV3fKAtoC=rVNFf5B3QRBVSzn8sg@mail.gmail.com>
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
X-List-Received-Date: Thu, 15 Feb 2018 16:18:17 -0000
Content-Type: multipart/alternative; boundary="001a114437ca454eda05654293ed"

--001a114437ca454eda05654293ed
Content-Type: text/plain; charset="UTF-8"

I'm not sure if this is caused by linux-yocto upgrade or lttng upgrade, but
without openssl-dev installed on the host I'm seeing following failures on
ubuntu builders:

oe-core/meta/recipes-kernel/lttng/lttng-modules_2.10.5.bb:do_make_scripts)
failed with exit code '1'

work-shared/qemux86/kernel-source/scripts/extract-cert.c:21:25: fatal
error: openssl/bio.h: No such file or directory
|  #include <openssl/bio.h>
|                          ^
| compilation terminated.
| make[2]: *** [scripts/extract-cert] Error 1
| make[1]: *** [scripts] Error 2

On Tue, Feb 6, 2018 at 5:21 PM, Bruce Ashfield <bruce.ashfield@windriver.com
> wrote:

> This commit makes the 4.15 kernel available for use with the
> Yocto configuration fragments and qemu* BSPs.
>
> It has been tested for x86,arm,mips and powerpc against the lsb, core*
> and glibc/mulsc test matrix.
>
> This will serve as the "latest" kernel in master, with others being
> removed in subsequent commits.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   | 38 +++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b  | 25 ++++++++++++
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb | 47
> ++++++++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 47
> ++++++++++++++++++++++
>  4 files changed, 157 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.15.bb
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
> new file mode 100644
> index 000000000000..31f8c23cef52
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
> @@ -0,0 +1,38 @@
> +KBRANCH ?= "v4.15/standard/preempt-rt/base"
> +
> +require recipes-kernel/linux/linux-yocto.inc
> +
> +# Skip processing of this recipe if it is not explicitly specified as the
> +# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
> +# to build multiple virtual/kernel providers, e.g. as dependency of
> +# core-image-rt-sdk, core-image-rt.
> +python () {
> +    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and
> d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
> +        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel
> to linux-yocto-rt to enable it")
> +}
> +
> +SRCREV_machine ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
> +SRCREV_meta ?= "64ad69e5b4a38e678500d7a70791ac5154c6c154"
> +
> +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${
> KBRANCH};name=machine \
> +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;
> name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
> +
> +LINUX_VERSION ?= "4.15"
> +
> +PV = "${LINUX_VERSION}+git${SRCPV}"
> +
> +KMETA = "kernel-meta"
> +KCONF_BSP_AUDIT_LEVEL = "2"
> +
> +LINUX_KERNEL_TYPE = "preempt-rt"
> +
> +COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
> +
> +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> +
> +# Functionality flags
> +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc
> features/taskstats/taskstats.scc"
> +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b
> b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b
> new file mode 100644
> index 000000000000..7a6696c71a68
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b
> @@ -0,0 +1,25 @@
> +KBRANCH ?= "v4.15/standard/tiny/common-pc"
> +LINUX_KERNEL_TYPE = "tiny"
> +KCONFIG_MODE = "--allnoconfig"
> +
> +require recipes-kernel/linux/linux-yocto.inc
> +
> +LINUX_VERSION ?= "4.15"
> +
> +KMETA = "kernel-meta"
> +KCONF_BSP_AUDIT_LEVEL = "2"
> +
> +SRCREV_machine ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
> +SRCREV_meta ?= "ef2f5d9a0ac1c5ac60e76b18b0bb3393be450336"
> +
> +PV = "${LINUX_VERSION}+git${SRCPV}"
> +
> +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${
> KBRANCH};name=machine \
> +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;
> name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
> +
> +COMPATIBLE_MACHINE = "qemux86|qemux86-64"
> +
> +# Functionality flags
> +KERNEL_FEATURES = ""
> +
> +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
> new file mode 100644
> index 000000000000..60b7e600d24d
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
> @@ -0,0 +1,47 @@
> +KBRANCH ?= "v4.15/standard/base"
> +
> +require recipes-kernel/linux/linux-yocto.inc
> +
> +# board specific branches
> +KBRANCH_qemuarm  ?= "v4.15/standard/arm-versatile-926ejs"
> +KBRANCH_qemuarm64 ?= "v4.15/standard/qemuarm64"
> +KBRANCH_qemumips ?= "v4.15/standard/mti-malta32"
> +KBRANCH_qemuppc  ?= "v4.15/standard/qemuppc"
> +KBRANCH_qemux86  ?= "v4.15/standard/base"
> +KBRANCH_qemux86-64 ?= "v4.15/standard/base"
> +KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
> +
> +SRCREV_machine_qemuarm ?= "5fdc3d579c5f50fbaaa5faecae79e20b73810346"
> +SRCREV_machine_qemuarm64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
> +SRCREV_machine_qemumips ?= "5afbe5a7e271f1c115a7c77bea4a71356c6f2792"
> +SRCREV_machine_qemuppc ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
> +SRCREV_machine_qemux86 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
> +SRCREV_machine_qemux86-64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
> +SRCREV_machine_qemumips64 ?= "f9a3a72209bde080e4ecb4fbe7a0f99954643131"
> +SRCREV_machine ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
> +SRCREV_meta ?= "64ad69e5b4a38e678500d7a70791ac5154c6c154"
> +
> +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;
> branch=${KBRANCH}; \
> +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;
> name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
> +
> +LINUX_VERSION ?= "4.15"
> +
> +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',
> d)}"
> +DEPENDS += "openssl-native util-linux-native"
> +
> +PV = "${LINUX_VERSION}+git${SRCPV}"
> +
> +KMETA = "kernel-meta"
> +KCONF_BSP_AUDIT_LEVEL = "2"
> +
> +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> +
> +COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|
> qemuppc|qemumips|qemumips64|qemux86-64"
> +
> +# Functionality flags
> +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> +KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32",
> " cfg/x32.scc", "" ,d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
> new file mode 100644
> index 000000000000..60b7e600d24d
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
> @@ -0,0 +1,47 @@
> +KBRANCH ?= "v4.15/standard/base"
> +
> +require recipes-kernel/linux/linux-yocto.inc
> +
> +# board specific branches
> +KBRANCH_qemuarm  ?= "v4.15/standard/arm-versatile-926ejs"
> +KBRANCH_qemuarm64 ?= "v4.15/standard/qemuarm64"
> +KBRANCH_qemumips ?= "v4.15/standard/mti-malta32"
> +KBRANCH_qemuppc  ?= "v4.15/standard/qemuppc"
> +KBRANCH_qemux86  ?= "v4.15/standard/base"
> +KBRANCH_qemux86-64 ?= "v4.15/standard/base"
> +KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
> +
> +SRCREV_machine_qemuarm ?= "5fdc3d579c5f50fbaaa5faecae79e20b73810346"
> +SRCREV_machine_qemuarm64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
> +SRCREV_machine_qemumips ?= "5afbe5a7e271f1c115a7c77bea4a71356c6f2792"
> +SRCREV_machine_qemuppc ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
> +SRCREV_machine_qemux86 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
> +SRCREV_machine_qemux86-64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
> +SRCREV_machine_qemumips64 ?= "f9a3a72209bde080e4ecb4fbe7a0f99954643131"
> +SRCREV_machine ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
> +SRCREV_meta ?= "64ad69e5b4a38e678500d7a70791ac5154c6c154"
> +
> +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;
> branch=${KBRANCH}; \
> +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;
> name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
> +
> +LINUX_VERSION ?= "4.15"
> +
> +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',
> d)}"
> +DEPENDS += "openssl-native util-linux-native"
> +
> +PV = "${LINUX_VERSION}+git${SRCPV}"
> +
> +KMETA = "kernel-meta"
> +KCONF_BSP_AUDIT_LEVEL = "2"
> +
> +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> +
> +COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|
> qemuppc|qemumips|qemumips64|qemux86-64"
> +
> +# Functionality flags
> +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> +KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32",
> " cfg/x32.scc", "" ,d)}"
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114437ca454eda05654293ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m not sure if this is caused by linux-yocto upgrade =
or lttng upgrade, but without openssl-dev installed on the host I&#39;m see=
ing following failures on ubuntu builders:<div><br></div><div>oe-core/meta/=
recipes-kernel/lttng/lttng-modules_2.10.5.bb:do_make_scripts) failed with e=
xit code &#39;1&#39;<br></div><div><br></div><div><div>work-shared/qemux86/=
kernel-source/scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No =
such file or directory</div><div>|=C2=A0 #include &lt;openssl/bio.h&gt;</di=
v><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div>| compilation terminated.</div><div>| =
make[2]: *** [scripts/extract-cert] Error 1</div><div>| make[1]: *** [scrip=
ts] Error 2</div></div></div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Tue, Feb 6, 2018 at 5:21 PM, Bruce Ashfield <span dir=3D"ltr=
">&lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bru=
ce.ashfield@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">This commit makes the 4.15 kernel available for use with the<br>
Yocto configuration fragments and qemu* BSPs.<br>
<br>
It has been tested for x86,arm,mips and powerpc against the lsb, core*<br>
and glibc/mulsc test matrix.<br>
<br>
This will serve as the &quot;latest&quot; kernel in master, with others bei=
ng<br>
removed in subsequent commits.<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windrive=
r.com">bruce.ashfield@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.15.bb" r=
el=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-rt_4.15.bb</a>=C2=A0 =
=C2=A0| 38 +++++++++++++++++<br>
=C2=A0meta/recipes-kernel/linux/<wbr>linux-yocto-tiny_4.15.b=C2=A0 | 25 +++=
+++++++++<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-tiny_4.15.bb</a> | 4=
7 ++++++++++++++++++++++<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.15.bb" rel=
=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4.15.bb</a>=C2=A0 =C2=A0=
 =C2=A0 | 47 ++++++++++++++++++++++<br>
=C2=A04 files changed, 157 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/<a href=3D"http://linux-=
yocto-rt_4.15.bb" rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-rt_=
4.15.bb</a><br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/<wbr>linux-yocto-tiny_4.=
15.b<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/<a href=3D"http://linux-=
yocto-tiny_4.15.bb" rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-t=
iny_4.15.bb</a><br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/<a href=3D"http://linux-=
yocto_4.15.bb" rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4.15.b=
b</a><br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.1=
5.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.15.bb</a> =
b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.15.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.15.bb</a><br>
new file mode 100644<br>
index 000000000000..31f8c23cef52<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.15.bb" r=
el=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.15.bb</a><br>
@@ -0,0 +1,38 @@<br>
+KBRANCH ?=3D &quot;v4.15/standard/preempt-rt/<wbr>base&quot;<br>
+<br>
+require recipes-kernel/linux/linux-<wbr>yocto.inc<br>
+<br>
+# Skip processing of this recipe if it is not explicitly specified as the<=
br>
+# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying<br=
>
+# to build multiple virtual/kernel providers, e.g. as dependency of<br>
+# core-image-rt-sdk, core-image-rt.<br>
+python () {<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;<wbr>) =3D=3D &qu=
ot;kernel&quot; and d.getVar(&quot;PREFERRED_PROVIDER_<wbr>virtual/kernel&q=
uot;) !=3D &quot;linux-yocto-rt&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot;Set PREFERRED_=
PROVIDER_virtual/<wbr>kernel to linux-yocto-rt to enable it&quot;)<br>
+}<br>
+<br>
+SRCREV_machine ?=3D &quot;<wbr>9c2e6c0fc71526c45fc7ddf3ec91e2<wbr>e2f27e3d=
a0&quot;<br>
+SRCREV_meta ?=3D &quot;<wbr>64ad69e5b4a38e678500d7a70791ac<wbr>5154c6c154&=
quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-yocto=
.git;branch=3D${KBRANCH};name=3Dmachine" rel=3D"noreferrer" target=3D"_blan=
k">git.yoctoproject.org/<wbr>linux-yocto.git;branch=3D${<wbr>KBRANCH};name=
=3Dmachine</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.15=
;destsuffix=3D${KMETA}" rel=3D"noreferrer" target=3D"_blank">git.yoctoproje=
ct.org/<wbr>yocto-kernel-cache;type=3Dkmeta;<wbr>name=3Dmeta;branch=3Dyocto=
-4.15;<wbr>destsuffix=3D${KMETA}</a>&quot;<br>
+<br>
+LINUX_VERSION ?=3D &quot;4.15&quot;<br>
+<br>
+PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
+<br>
+KMETA =3D &quot;kernel-meta&quot;<br>
+KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
+<br>
+LINUX_KERNEL_TYPE =3D &quot;preempt-rt&quot;<br>
+<br>
+COMPATIBLE_MACHINE =3D &quot;(qemux86|qemux86-64|qemuarm|<wbr>qemuppc|qemu=
mips)&quot;<br>
+<br>
+KERNEL_DEVICETREE_qemuarm =3D &quot;versatile-pb.dtb&quot;<br>
+<br>
+# Functionality flags<br>
+KERNEL_EXTRA_FEATURES ?=3D &quot;features/netfilter/netfilter.<wbr>scc fea=
tures/taskstats/taskstats.<wbr>scc&quot;<br>
+KERNEL_FEATURES_append =3D &quot; ${KERNEL_EXTRA_FEATURES}&quot;<br>
+KERNEL_FEATURES_append_<wbr>qemuall=3D&quot; cfg/virtio.scc&quot;<br>
+KERNEL_FEATURES_append_<wbr>qemux86=3D&quot; cfg/sound.scc cfg/paravirt_kv=
m.scc&quot;<br>
+KERNEL_FEATURES_append_<wbr>qemux86-64=3D&quot; cfg/sound.scc&quot;<br>
diff --git a/meta/recipes-kernel/linux/<wbr>linux-yocto-tiny_4.15.b b/meta/=
recipes-kernel/linux/<wbr>linux-yocto-tiny_4.15.b<br>
new file mode 100644<br>
index 000000000000..7a6696c71a68<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/<wbr>linux-yocto-tiny_4.15.b<br>
@@ -0,0 +1,25 @@<br>
+KBRANCH ?=3D &quot;v4.15/standard/tiny/common-<wbr>pc&quot;<br>
+LINUX_KERNEL_TYPE =3D &quot;tiny&quot;<br>
+KCONFIG_MODE =3D &quot;--allnoconfig&quot;<br>
+<br>
+require recipes-kernel/linux/linux-<wbr>yocto.inc<br>
+<br>
+LINUX_VERSION ?=3D &quot;4.15&quot;<br>
+<br>
+KMETA =3D &quot;kernel-meta&quot;<br>
+KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
+<br>
+SRCREV_machine ?=3D &quot;<wbr>f7a6d45fff853173bfbf61706aeffc<wbr>d1d1e994=
67&quot;<br>
+SRCREV_meta ?=3D &quot;<wbr>ef2f5d9a0ac1c5ac60e76b18b0bb33<wbr>93be450336&=
quot;<br>
+<br>
+PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-yocto=
.git;branch=3D${KBRANCH};name=3Dmachine" rel=3D"noreferrer" target=3D"_blan=
k">git.yoctoproject.org/<wbr>linux-yocto.git;branch=3D${<wbr>KBRANCH};name=
=3Dmachine</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.15=
;destsuffix=3D${KMETA}" rel=3D"noreferrer" target=3D"_blank">git.yoctoproje=
ct.org/<wbr>yocto-kernel-cache;type=3Dkmeta;<wbr>name=3Dmeta;branch=3Dyocto=
-4.15;<wbr>destsuffix=3D${KMETA}</a>&quot;<br>
+<br>
+COMPATIBLE_MACHINE =3D &quot;qemux86|qemux86-64&quot;<br>
+<br>
+# Functionality flags<br>
+KERNEL_FEATURES =3D &quot;&quot;<br>
+<br>
+KERNEL_DEVICETREE_qemuarm =3D &quot;versatile-pb.dtb&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4=
.15.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.15.bb<=
/a> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.15.bb</a><br>
new file mode 100644<br>
index 000000000000..60b7e600d24d<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.15.bb</a><br>
@@ -0,0 +1,47 @@<br>
+KBRANCH ?=3D &quot;v4.15/standard/base&quot;<br>
+<br>
+require recipes-kernel/linux/linux-<wbr>yocto.inc<br>
+<br>
+# board specific branches<br>
+KBRANCH_qemuarm=C2=A0 ?=3D &quot;v4.15/standard/arm-versatile-<wbr>926ejs&=
quot;<br>
+KBRANCH_qemuarm64 ?=3D &quot;v4.15/standard/qemuarm64&quot;<br>
+KBRANCH_qemumips ?=3D &quot;v4.15/standard/mti-malta32&quot;<br>
+KBRANCH_qemuppc=C2=A0 ?=3D &quot;v4.15/standard/qemuppc&quot;<br>
+KBRANCH_qemux86=C2=A0 ?=3D &quot;v4.15/standard/base&quot;<br>
+KBRANCH_qemux86-64 ?=3D &quot;v4.15/standard/base&quot;<br>
+KBRANCH_qemumips64 ?=3D &quot;v4.15/standard/mti-malta64&quot;<br>
+<br>
+SRCREV_machine_qemuarm ?=3D &quot;<wbr>5fdc3d579c5f50fbaaa5faecae79e2<wbr>=
0b73810346&quot;<br>
+SRCREV_machine_qemuarm64 ?=3D &quot;<wbr>9c2e6c0fc71526c45fc7ddf3ec91e2<wb=
r>e2f27e3da0&quot;<br>
+SRCREV_machine_qemumips ?=3D &quot;<wbr>5afbe5a7e271f1c115a7c77bea4a71<wbr=
>356c6f2792&quot;<br>
+SRCREV_machine_qemuppc ?=3D &quot;<wbr>9c2e6c0fc71526c45fc7ddf3ec91e2<wbr>=
e2f27e3da0&quot;<br>
+SRCREV_machine_qemux86 ?=3D &quot;<wbr>9c2e6c0fc71526c45fc7ddf3ec91e2<wbr>=
e2f27e3da0&quot;<br>
+SRCREV_machine_qemux86-64 ?=3D &quot;<wbr>9c2e6c0fc71526c45fc7ddf3ec91e2<w=
br>e2f27e3da0&quot;<br>
+SRCREV_machine_qemumips64 ?=3D &quot;<wbr>f9a3a72209bde080e4ecb4fbe7a0f9<w=
br>9954643131&quot;<br>
+SRCREV_machine ?=3D &quot;<wbr>9c2e6c0fc71526c45fc7ddf3ec91e2<wbr>e2f27e3d=
a0&quot;<br>
+SRCREV_meta ?=3D &quot;<wbr>64ad69e5b4a38e678500d7a70791ac<wbr>5154c6c154&=
quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-yocto=
.git;name=3Dmachine;branch=3D${KBRANCH}" rel=3D"noreferrer" target=3D"_blan=
k">git.yoctoproject.org/<wbr>linux-yocto.git;name=3Dmachine;<wbr>branch=3D$=
{KBRANCH}</a>; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.15=
;destsuffix=3D${KMETA}" rel=3D"noreferrer" target=3D"_blank">git.yoctoproje=
ct.org/<wbr>yocto-kernel-cache;type=3Dkmeta;<wbr>name=3Dmeta;branch=3Dyocto=
-4.15;<wbr>destsuffix=3D${KMETA}</a>&quot;<br>
+<br>
+LINUX_VERSION ?=3D &quot;4.15&quot;<br>
+<br>
+DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39;x86&#39;, &#3=
9;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
+DEPENDS +=3D &quot;openssl-native util-linux-native&quot;<br>
+<br>
+PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
+<br>
+KMETA =3D &quot;kernel-meta&quot;<br>
+KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
+<br>
+KERNEL_DEVICETREE_qemuarm =3D &quot;versatile-pb.dtb&quot;<br>
+<br>
+COMPATIBLE_MACHINE =3D &quot;qemuarm|qemuarm64|qemux86|<wbr>qemuppc|qemumi=
ps|qemumips64|<wbr>qemux86-64&quot;<br>
+<br>
+# Functionality flags<br>
+KERNEL_EXTRA_FEATURES ?=3D &quot;features/netfilter/netfilter.<wbr>scc&quo=
t;<br>
+KERNEL_FEATURES_append =3D &quot; ${KERNEL_EXTRA_FEATURES}&quot;<br>
+KERNEL_FEATURES_append_<wbr>qemuall=3D&quot; cfg/virtio.scc&quot;<br>
+KERNEL_FEATURES_append_<wbr>qemux86=3D&quot; cfg/sound.scc cfg/paravirt_kv=
m.scc&quot;<br>
+KERNEL_FEATURES_append_<wbr>qemux86-64=3D&quot; cfg/sound.scc cfg/paravirt=
_kvm.scc&quot;<br>
+KERNEL_FEATURES_append =3D &quot; ${@bb.utils.contains(&quot;TUNE_<wbr>FEA=
TURES&quot;, &quot;mx32&quot;, &quot; cfg/x32.scc&quot;, &quot;&quot; ,d)}&=
quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.15.b=
b" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.15.bb</a> b/meta=
/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.15.bb" rel=3D"norefer=
rer" target=3D"_blank">li<wbr>nux-yocto_4.15.bb</a><br>
new file mode 100644<br>
index 000000000000..60b7e600d24d<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.15.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.15.bb</a><br>
@@ -0,0 +1,47 @@<br>
+KBRANCH ?=3D &quot;v4.15/standard/base&quot;<br>
+<br>
+require recipes-kernel/linux/linux-<wbr>yocto.inc<br>
+<br>
+# board specific branches<br>
+KBRANCH_qemuarm=C2=A0 ?=3D &quot;v4.15/standard/arm-versatile-<wbr>926ejs&=
quot;<br>
+KBRANCH_qemuarm64 ?=3D &quot;v4.15/standard/qemuarm64&quot;<br>
+KBRANCH_qemumips ?=3D &quot;v4.15/standard/mti-malta32&quot;<br>
+KBRANCH_qemuppc=C2=A0 ?=3D &quot;v4.15/standard/qemuppc&quot;<br>
+KBRANCH_qemux86=C2=A0 ?=3D &quot;v4.15/standard/base&quot;<br>
+KBRANCH_qemux86-64 ?=3D &quot;v4.15/standard/base&quot;<br>
+KBRANCH_qemumips64 ?=3D &quot;v4.15/standard/mti-malta64&quot;<br>
+<br>
+SRCREV_machine_qemuarm ?=3D &quot;<wbr>5fdc3d579c5f50fbaaa5faecae79e2<wbr>=
0b73810346&quot;<br>
+SRCREV_machine_qemuarm64 ?=3D &quot;<wbr>9c2e6c0fc71526c45fc7ddf3ec91e2<wb=
r>e2f27e3da0&quot;<br>
+SRCREV_machine_qemumips ?=3D &quot;<wbr>5afbe5a7e271f1c115a7c77bea4a71<wbr=
>356c6f2792&quot;<br>
+SRCREV_machine_qemuppc ?=3D &quot;<wbr>9c2e6c0fc71526c45fc7ddf3ec91e2<wbr>=
e2f27e3da0&quot;<br>
+SRCREV_machine_qemux86 ?=3D &quot;<wbr>9c2e6c0fc71526c45fc7ddf3ec91e2<wbr>=
e2f27e3da0&quot;<br>
+SRCREV_machine_qemux86-64 ?=3D &quot;<wbr>9c2e6c0fc71526c45fc7ddf3ec91e2<w=
br>e2f27e3da0&quot;<br>
+SRCREV_machine_qemumips64 ?=3D &quot;<wbr>f9a3a72209bde080e4ecb4fbe7a0f9<w=
br>9954643131&quot;<br>
+SRCREV_machine ?=3D &quot;<wbr>9c2e6c0fc71526c45fc7ddf3ec91e2<wbr>e2f27e3d=
a0&quot;<br>
+SRCREV_meta ?=3D &quot;<wbr>64ad69e5b4a38e678500d7a70791ac<wbr>5154c6c154&=
quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-yocto=
.git;name=3Dmachine;branch=3D${KBRANCH}" rel=3D"noreferrer" target=3D"_blan=
k">git.yoctoproject.org/<wbr>linux-yocto.git;name=3Dmachine;<wbr>branch=3D$=
{KBRANCH}</a>; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.15=
;destsuffix=3D${KMETA}" rel=3D"noreferrer" target=3D"_blank">git.yoctoproje=
ct.org/<wbr>yocto-kernel-cache;type=3Dkmeta;<wbr>name=3Dmeta;branch=3Dyocto=
-4.15;<wbr>destsuffix=3D${KMETA}</a>&quot;<br>
+<br>
+LINUX_VERSION ?=3D &quot;4.15&quot;<br>
+<br>
+DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39;x86&#39;, &#3=
9;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
+DEPENDS +=3D &quot;openssl-native util-linux-native&quot;<br>
+<br>
+PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
+<br>
+KMETA =3D &quot;kernel-meta&quot;<br>
+KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
+<br>
+KERNEL_DEVICETREE_qemuarm =3D &quot;versatile-pb.dtb&quot;<br>
+<br>
+COMPATIBLE_MACHINE =3D &quot;qemuarm|qemuarm64|qemux86|<wbr>qemuppc|qemumi=
ps|qemumips64|<wbr>qemux86-64&quot;<br>
+<br>
+# Functionality flags<br>
+KERNEL_EXTRA_FEATURES ?=3D &quot;features/netfilter/netfilter.<wbr>scc&quo=
t;<br>
+KERNEL_FEATURES_append =3D &quot; ${KERNEL_EXTRA_FEATURES}&quot;<br>
+KERNEL_FEATURES_append_<wbr>qemuall=3D&quot; cfg/virtio.scc&quot;<br>
+KERNEL_FEATURES_append_<wbr>qemux86=3D&quot; cfg/sound.scc cfg/paravirt_kv=
m.scc&quot;<br>
+KERNEL_FEATURES_append_<wbr>qemux86-64=3D&quot; cfg/sound.scc cfg/paravirt=
_kvm.scc&quot;<br>
+KERNEL_FEATURES_append =3D &quot; ${@bb.utils.contains(&quot;TUNE_<wbr>FEA=
TURES&quot;, &quot;mx32&quot;, &quot; cfg/x32.scc&quot;, &quot;&quot; ,d)}&=
quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.5.0<br>
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

--001a114437ca454eda05654293ed--
