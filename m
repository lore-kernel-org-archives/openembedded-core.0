Return-Path: <net147@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC526B10F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 01:02:54 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id jt11so1277679pbb.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 18:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=9hLzP+gs0O0zY+4P6vwC1LkVh2xzFEv/3j4KDbB81xw=;
	b=H+XpCrhb2WP2luZRlT02pJSUMPTQiqo8guGL3Oo/s4P1seQW3BKXktBzYfSu2Mz4K0
	F2uIbAp45nNDsDPxv4dPc1w7J/JBqjaC4+q36jycD/bppezHw++Ytme4EY8QssUzfDaI
	S7/0P1k5WTgIcUXwQgoAEyy9hkD0K6HNvaWyK32++6+H/g8rGFkra3Nw3LkFmFHvdEhs
	IzBiMJRWzb5Gij8XvenioFE5DN21sdRbr7xxEFaKY7sTOey5acik0KgnEgzrKZwde97g
	HJTtCpFS0b8a2lY8CP7XNsY/DRxsCwaBy9Qpr/+89m7xNRPbP+ppH9qtEq2+sELV0eOx
	m47g==
X-Received: by 10.66.226.46 with SMTP id rp14mr1743224pac.133.1377306174686;
	Fri, 23 Aug 2013 18:02:54 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id lm2sm3966735pab.2.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 18:02:53 -0700 (PDT)
Message-ID: <52180512.8020603@gmail.com>
Date: Sat, 24 Aug 2013 10:57:54 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1377280429.git.bruce.ashfield@windriver.com>
	<43c76ff9d0dcee4d4caa30a4e24d7f1e4613d750.1377280429.git.bruce.ashfield@windriver.com>
In-Reply-To: <43c76ff9d0dcee4d4caa30a4e24d7f1e4613d750.1377280429.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] linux-yocto: introduce v3.10
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
X-List-Received-Date: Sat, 24 Aug 2013 01:02:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 24/08/2013 4:08 AM, Bruce Ashfield wrote:
> Introduce the 3.10 kernel. This is based on the 3.10.9 upstream kernel
> and replaces the 3.8 recipes, which will be removed once all reference
> boards have been updated.
>
> 3.10 also the latest LTSI and will be updated with that content when it
> becomes available.
>
> Other features of the 3.10 kernel include:
>
>    - refreshed -rt support
>    - refreshed yaffs2, aufs3
>    - cryptodev
>    - bfs, edf, and OCF staged features
>    - scrubbed and updated meta data for v3.10
>    - improved tools support for meta data updates and queue maintenance
>    - patch carry forward from all previous linux-yocto kernels and
>      configuration.
>
> This kernel has been built and boot tested on all qemu machines and architectures.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |   30 ++++++++++++++++++++
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |   25 ++++++++++++++++
>   meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   30 ++++++++++++++++++++
>   3 files changed, 85 insertions(+)
>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
>   create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.10.bb
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
> new file mode 100644
> index 0000000..4139be8
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
> @@ -0,0 +1,30 @@
> +require recipes-kernel/linux/linux-yocto.inc
> +
> +KBRANCH = "standard/preempt-rt/base"
> +KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
> +
> +SRCREV_machine ?= "77c5842818867366c3d08ca1dec19dc43aee0e91"
> +SRCREV_machine_qemuppc ?= "7be83bc1124d2a2c75f99df94baaf718659722ea"
> +SRCREV_meta ?= "1b9b113837f353fd94148beb6bd00a3b7b35d01d"
> +
> +SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
> +
> +LINUX_VERSION ?= "3.10.9"
> +
> +PV = "${LINUX_VERSION}+git${SRCPV}"
> +
> +KMETA = "meta"
> +
> +LINUX_KERNEL_TYPE = "preempt-rt"
> +
> +# Omit broken machines from COMPATIBLE_MACHINE
> +#   qemuppc hangs at boot
> +#   qemumips panics at boot
> +COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
I see COMPATIBLE_MACHINE has been carried over from the 3.4 and 3.8 
linux-rt recipes. Is linux-rt still broken on qemuppc and qemumips?

> +
> +# Functionality flags
> +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
> +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
> +KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
> new file mode 100644
> index 0000000..1c2ad37
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
> @@ -0,0 +1,25 @@
> +require recipes-kernel/linux/linux-yocto.inc
> +
> +# We need lzma (as CONFIG_KERNEL_LZMA=y)
> +DEPENDS += "xz-native"
> +
> +KBRANCH_DEFAULT = "standard/tiny/base"
> +KBRANCH = "${KBRANCH_DEFAULT}"
> +LINUX_KERNEL_TYPE = "tiny"
> +KCONFIG_MODE = "--allnoconfig"
> +
> +LINUX_VERSION ?= "3.10.9"
> +
> +KMETA = "meta"
> +
> +SRCREV_machine ?= "6c1528b2b78d1ec7e75bb7a9880074ec35aa1aa0"
> +SRCREV_meta ?= "1b9b113837f353fd94148beb6bd00a3b7b35d01d"
> +
> +PV = "${LINUX_VERSION}+git${SRCPV}"
> +
> +SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
> +
> +COMPATIBLE_MACHINE = "(qemux86)"
> +
> +# Functionality flags
> +KERNEL_FEATURES = ""
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
> new file mode 100644
> index 0000000..ea6ad2a
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
> @@ -0,0 +1,30 @@
> +require recipes-kernel/linux/linux-yocto.inc
> +
> +KBRANCH_DEFAULT = "standard/base"
> +KBRANCH = "${KBRANCH_DEFAULT}"
> +
> +SRCREV_machine_qemuarm ?= "8675d3d0a3c17135f70ef474d5c362397c02e62a"
> +SRCREV_machine_qemumips  ?= "992b743b905edd21d3a4a27c92b5c6a9e44d7d73"
> +SRCREV_machine_qemuppc ?= "09388c3572e26c78b34554e46e077f12be7b2401"
> +SRCREV_machine_qemux86 ?= "6c1528b2b78d1ec7e75bb7a9880074ec35aa1aa0"
> +SRCREV_machine_qemux86-64 ?= "6c1528b2b78d1ec7e75bb7a9880074ec35aa1aa0"
> +SRCREV_machine_qemumips64 ?= "203679cb23c752fdcbc0180a55a81728d7462561"
> +SRCREV_machine ?= "6c1528b2b78d1ec7e75bb7a9880074ec35aa1aa0"
> +SRCREV_meta ?= "1b9b113837f353fd94148beb6bd00a3b7b35d01d"
> +
> +SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
> +
> +LINUX_VERSION ?= "3.10.9"
> +
> +PV = "${LINUX_VERSION}+git${SRCPV}"
> +
> +KMETA = "meta"
> +
> +COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> +
> +# Functionality flags
> +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
> +KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
Regards,
Jonathan

