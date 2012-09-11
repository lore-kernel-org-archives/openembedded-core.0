Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1TBSej-0000sa-Uy
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 17:45:42 +0200
Received: from mail-pb0-f69.google.com ([209.85.160.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 08:33:01 -0700
Received: by pbbrp2 with SMTP id rp2so1459290pbb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 08:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=OBnsvzeiKOYM0QoPM7mCOoKv3+NWRXwtCdeJH5nhUpM=;
	b=Jlv4/c6S7xYNtkh5Ljzy5d8duD5p4NYjZ/AXyG4144FrrAqWJNQNuzj4Fc+OLRLwWS
	EcpVnoeLCKEqMMNvfOyBX6RHyn9R+bMOn1OPrND2x4VKec1B+BDFZYjDG/nKltiyJVSD
	45y1Ah8CKKlyZTHVbqqDj7M8NYJIYKMb+YAQRq6WGO8xf7APfjrKkW9rYfEosN9nal33
	BuZtxmOG8ui6T5K8SBHjuq0DRVqFlR1z/dDIADiJKJPMrhx+Jrtn4rSiSLuyMPDYMDkc
	JQkHfrf4k8BvyoaEhJ/J9sz3mUV/5/Pxjxm+73cjLf4h/l+t5paldvLSC4esI6OWr+d7
	M8fA==
Received: by 10.68.222.40 with SMTP id qj8mr11641175pbc.139.1347377589328;
	Tue, 11 Sep 2012 08:33:09 -0700 (PDT)
Received: by 10.68.222.40 with SMTP id qj8mr11641167pbc.139.1347377589240;
	Tue, 11 Sep 2012 08:33:09 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id ps2sm3743473pbb.0.2012.09.11.08.33.06
	(version=SSLv3 cipher=OTHER); Tue, 11 Sep 2012 08:33:08 -0700 (PDT)
Message-ID: <504F59B1.60308@intel.com>
Date: Tue, 11 Sep 2012 08:33:05 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1347376358.git.bruce.ashfield@windriver.com>
	<ea700a4897d82d27177a0583f01b6432ac7ec379.1347376358.git.bruce.ashfield@windriver.com>
In-Reply-To: <ea700a4897d82d27177a0583f01b6432ac7ec379.1347376358.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQkQgeWySHfDJVpKwKOxqJMmDhC/9fFFYqibDeCgKlXN9bMMXGWow7e9d2TuphUGdhZ/33wumPpKuJkVnE5I0xfmSf1oS1Qq4SyFXA78+mg9ImikQudIizJOABuK+mZQ+BH5iu3GbKZDfFz+SxrtqliwcurYO9DsxBoLGxC+rgq9anUgV9GjQPya4zaQjQkd3bBBcVd6
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] linux-yocto/3.4: add x32 configuration fragment and tuning hook
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 15:45:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2012 08:17 AM, Bruce Ashfield wrote:
> When x32 is the tuning for a x86 MACHINE, the kernel should also have
> CONFIG_X86_X32=y.
>
> This can be accomplished by adding the x32 configuraion fragment to the
> KERNEL_FEATURES when x32 is the tuning for a given machine.
>
> cc: Saul Wold <sgw@linux.intel.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    3 ++-
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> index 4fd3845..156fb93 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> @@ -10,7 +10,7 @@ KMETA = "meta"
>
>   SRCREV_machine ?= "a35693b1287c0e50cdca33a1b95af0ff48b43cd0"
>   SRCREV_machine_qemuppc ?= "85a1190530cb5749f5f831670976b163438dc301"
> -SRCREV_meta ?= "d9d5fc63d8b38705036e946ea77d971d95de11ad"
> +SRCREV_meta ?= "e0374ce012e7e6fc8e5bb8b957addb0478950898"
>
>   PR = "${INC_PR}.0"
>   PV = "${LINUX_VERSION}+git${SRCPV}"
> @@ -27,3 +27,4 @@ KERNEL_FEATURES_append = " features/netfilter"
>   KERNEL_FEATURES_append = " features/taskstats"
>   KERNEL_FEATURES_append_qemux86 = " cfg/sound"
>   KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
> +KERNEL_FEATURES_append_x32 = " cfg/x32"

Scratch this bit and below, as I think I will use the other mechanism 
you talked about to go from a .conf file.

Sau!

> \ No newline at end of file
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> index 59ad4b2..bcd1292 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> @@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?= "b9a720ca38d298ed457f37d099c85771f9164b19"
>   SRCREV_machine_qemux86 ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
>   SRCREV_machine_qemux86-64 ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
>   SRCREV_machine ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
> -SRCREV_meta ?= "a82db2f0fc3ceebf3cb47e9dd05e4856ff9966ab"
> +SRCREV_meta ?= "e0374ce012e7e6fc8e5bb8b957addb0478950898"
>
>   SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
>
> @@ -27,3 +27,4 @@ KERNEL_REVISION_CHECKING=""
>   KERNEL_FEATURES_append = " features/netfilter"
>   KERNEL_FEATURES_append_qemux86=" cfg/sound"
>   KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
> +KERNEL_FEATURES_append_x32 = " cfg/x32"
>



