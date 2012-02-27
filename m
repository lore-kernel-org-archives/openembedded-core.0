Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1S2A36-00080P-5l
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 00:32:08 +0100
Received: from mail-tul01m020-f180.google.com ([209.85.214.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 27 Feb 2012 15:23:39 -0800
Received: by obbwd18 with SMTP id wd18so1894954obb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 15:23:39 -0800 (PST)
Received-SPF: pass (google.com: domain of saul.wold@intel.com designates
	10.60.14.34 as permitted sender) client-ip=10.60.14.34; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of saul.wold@intel.com
	designates 10.60.14.34 as permitted sender)
	smtp.mail=saul.wold@intel.com
Received: from mr.google.com ([10.60.14.34])
	by 10.60.14.34 with SMTP id m2mr5499588oec.65.1330385019264 (num_hops =
	1); Mon, 27 Feb 2012 15:23:39 -0800 (PST)
Received: by 10.60.14.34 with SMTP id m2mr4870237oec.65.1330385019166;
	Mon, 27 Feb 2012 15:23:39 -0800 (PST)
Received: from [10.6.18.245] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id f2sm95221oef.6.2012.02.27.15.23.36
	(version=SSLv3 cipher=OTHER); Mon, 27 Feb 2012 15:23:38 -0800 (PST)
Message-ID: <4F4C1077.3030106@intel.com>
Date: Mon, 27 Feb 2012 15:23:35 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1330371008.git.bruce.ashfield@windriver.com>
	<a2440ad66968c13a0db6f97f69b04b8670ac9ffd.1330371008.git.bruce.ashfield@windriver.com>
In-Reply-To: <a2440ad66968c13a0db6f97f69b04b8670ac9ffd.1330371008.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQktiPqfgnJk/pFgN1XNHqVo10Aik4VVZGd+AupS26a0YpA4BbCf5uAjhviGNc8h7pfjeOHh
Cc: dvhart@linux.intel.com
Subject: Re: [PATCH 2/3] linux-yocto: update 3.2 kernel to v3.2.7
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
X-List-Received-Date: Mon, 27 Feb 2012 23:32:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/27/2012 11:34 AM, Bruce Ashfield wrote:
> Updating the 3.2 kernel recipe to the latest -stable release.
>
> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    9 +++++----
>   meta/recipes-kernel/linux/linux-yocto_3.2.bb    |   19 ++++++++++---------
>   2 files changed, 15 insertions(+), 13 deletions(-)
>

I noticed that there are 3 Packaging WARNINGS in this build, we are 
trying to improve the overall Quality by reducing the warnings. These 
are probably general to all linux-yocto recipes.

Can you address these:

WARNING: For recipe linux-yocto, the following files/directories were 
installed but not shipped in any package:
WARNING:   /lib/modules/3.2.2-yocto-standard+/build
WARNING:   /lib/modules/3.2.2-yocto-standard+/source
WARNING:   /etc/modprobe.d


Thanks
	Sau!

> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
> index 329527f..3370729 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
> @@ -11,12 +11,13 @@ KMACHINE_qemumips = "mti-malta32-be"
>   KBRANCH = "standard/preempt-rt/base"
>   KBRANCH_qemuppc = "standard/preempt-rt/qemu-ppc32"
>
> -LINUX_VERSION ?= "3.2.2"
> +LINUX_VERSION ?= "3.2.7"
>   LINUX_KERNEL_TYPE = "preempt-rt"
>
> -SRCREV_machine ?= "415af017cf163c63d7b1e6e929e4a9c9baf5ba6d"
> -SRCREV_machine_qemuppc ?= "38345c1e41b15c49308a9adbdde95167eeaa05fa"
> -SRCREV_meta ?= "138bf5b502607fe40315c0d76822318d77d97e01"
> +SRCREV_machine ?= "2043e8b786dfd06a41a66780141f731d2d788696"
> +SRCREV_machine_qemuppc ?= "ec400326633f011c3b7d390beb765ad955145a29"
> +SRCREV_meta ?= "5db8963f9aefc70b4483ca4ccce8f2ef6964e2c3"
> +
>
>   PR = "r0"
>   PV = "${LINUX_VERSION}+git${SRCPV}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
> index a80924d..9be1bd9 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
> @@ -15,15 +15,16 @@ KBRANCH_qemuppc  = "standard/default/qemu-ppc32"
>   KBRANCH_qemumips = "standard/default/mti-malta32-be"
>   KBRANCH_qemuarm  = "standard/default/arm-versatile-926ejs"
>
> -LINUX_VERSION ?= "3.2.2"
> -
> -SRCREV_machine_qemuarm ?= "8d79190c307c7d41580beb77f83526ae3defcacc"
> -SRCREV_machine_qemumips ?= "c88f8c4f3be717be33a8ad89a14731eb94932336"
> -SRCREV_machine_qemuppc ?= "b8228f337002ad88f1e152d0c0c46c6035cd0428"
> -SRCREV_machine_qemux86 ?= "417fc778a86e81303bab5883b919ee422ec51c04"
> -SRCREV_machine_qemux86-64 ?= "417fc778a86e81303bab5883b919ee422ec51c04"
> -SRCREV_machine ?= "417fc778a86e81303bab5883b919ee422ec51c04"
> -SRCREV_meta ?= "138bf5b502607fe40315c0d76822318d77d97e01"
> +LINUX_VERSION ?= "3.2.7"
> +
> +
> +SRCREV_machine_qemuarm ?= "c2028a144fe035719af7c5e9989fedc62ccf3c2c"
> +SRCREV_machine_qemumips ?= "7dfffd937d4755cba0fcf3f2b9b69a1c62262084"
> +SRCREV_machine_qemuppc ?= "8fc0489fffe4c626f9a8053ad86014e75073a3d0"
> +SRCREV_machine_qemux86 ?= "0fae9c2722039df3e93398d314ee10e3f4330b86"
> +SRCREV_machine_qemux86-64 ?= "0fae9c2722039df3e93398d314ee10e3f4330b86"
> +SRCREV_machine ?= "0fae9c2722039df3e93398d314ee10e3f4330b86"
> +SRCREV_meta ?= "5db8963f9aefc70b4483ca4ccce8f2ef6964e2c3"
>
>   PR = "r0"
>   PV = "${LINUX_VERSION}+git${SRCPV}"



