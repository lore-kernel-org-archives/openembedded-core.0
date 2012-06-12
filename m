Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1SeZcf-0005WH-Rm
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 00:31:38 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga01.intel.com with ESMTP/TLS/RC4-MD5; 12 Jun 2012 15:19:56 -0700
Received: by pbbro8 with SMTP id ro8so1388122pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 15:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=9uOM1kLziJ46Kue4HTkPf9Qvf4DznoCItgf3Ai6ALT0=;
	b=FzfHCIbnJSWnbAUJvPT7adROlKM0816YWGEdmhyFsRr6/9lMBiFV/lWInnTzTSvvif
	Xxa9rbMzQ2VSGG7q6gDWIFZf2l8Jm1GoSmoPbhLrIHChBT6M7TKeC1vatXqQc6xHBuWt
	VCy3+BTY+Y0iiRXpsp12wcmXLk+JJ0qXh2ooJIZvTAh0nRoWJrcNjDQV080yh9rGy1Cf
	KfbOqVdu98AAiG54onYlAM/w8/p0UQpbZ1yGTmo2ZD5FiutMkz1M13s4tmpYkpaois5d
	+SMDnq72y34rH+sFVd3rEas2E2sqPnP97qYKMWVITQMH3JyAyUthW853DR/ZgJyp4gxt
	qXrw==
Received: by 10.68.237.166 with SMTP id vd6mr42970339pbc.139.1339539596208;
	Tue, 12 Jun 2012 15:19:56 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id u5sm3354785pbu.76.2012.06.12.15.19.53
	(version=SSLv3 cipher=OTHER); Tue, 12 Jun 2012 15:19:54 -0700 (PDT)
Message-ID: <4FD7C088.1030600@intel.com>
Date: Tue, 12 Jun 2012 15:19:52 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1339521554.git.bruce.ashfield@windriver.com>
	<2b7bc8dbfeae528417e737ca139b749f24c11351.1339521554.git.bruce.ashfield@windriver.com>
In-Reply-To: <2b7bc8dbfeae528417e737ca139b749f24c11351.1339521554.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQnddHSs/L3sggNpWJy5/GWveTe10hHgsXwleZfvzd0b8Ntrof2ancRq6QWQF/lmlH02KUut
Cc: dvhart@linux.intel.com
Subject: Re: [PATCH 1/2] linux-yocto/3.4: create linux-yocto-rt recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jun 2012 22:31:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2012 10:22 AM, Bruce Ashfield wrote:
> Adding the 3.4 variant of the linux-yocto-rt recipe. This updates
> to 3.4.1-rt9, and builds and boots on the supported targets.
>
> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |   32 +++++++++++++++++++++++
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 +-
>   2 files changed, 33 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> new file mode 100644
> index 0000000..d7de4b6
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> @@ -0,0 +1,32 @@
> +inherit kernel
> +require recipes-kernel/linux/linux-yocto.inc
> +
> +KBRANCH = "standard/preempt-rt/base"
> +KBRANCH_qemuppc = "standard/preempt-rt/qemu-ppc32"
> +
> +LINUX_VERSION ?= "3.4.1"
> +LINUX_KERNEL_TYPE = "preempt-rt"
> +
> +KMETA = "meta"
> +
> +SRCREV_machine_machine ?= "9dc5e97d144abb03deec411acb9c64883602cff9"

Is this correct? ^^^^^^^^


Sau!

> +SRCREV_machine_qemuppc ?= "241a41d6104df6916280f1273894bbd7fa7cdd71"
> +SRCREV_meta ?= "aa226dcc5a1351fae49da40d77b718c4c3a76e7c"
> +
> +PR = "r0"
> +PV = "${LINUX_VERSION}+git${SRCPV}"
> +
> +SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
> +
> +# Omit broken machines from COMPATIBLE_MACHINE
> +#   qemuppc hangs at boot
> +#   qemumips panics at boot
> +COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
> +
> +# Functionality flags
> +KERNEL_FEATURES = "features/netfilter"
> +KERNEL_FEATURES_append = " features/taskstats"
> +KERNEL_FEATURES_append_qemux86 = " cfg/sound"
> +KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
> +
> +require recipes-kernel/linux/linux-tools.inc
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> index 9205901..af6130d 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> @@ -16,7 +16,7 @@ SRCREV_machine_qemuppc ?= "4988a7e34bccd531b511c57f93358de9fcc672a0"
>   SRCREV_machine_qemux86 ?= "a8291fa6f723b0182d2b7033b5d59f412ba7cf72"
>   SRCREV_machine_qemux86-64 ?= "a8291fa6f723b0182d2b7033b5d59f412ba7cf72"
>   SRCREV_machine ?= "a8291fa6f723b0182d2b7033b5d59f412ba7cf72"
> -SRCREV_meta ?= "978f876e4368cdd0ef781e74ea28a6771bf69b79"
> +SRCREV_meta ?= "aa226dcc5a1351fae49da40d77b718c4c3a76e7c"
>
>   SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
>



