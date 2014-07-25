Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0471265CE7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 03:35:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Jul 2014 20:35:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,727,1400050800"; d="scan'208";a="575197284"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO [10.255.13.3])
	([10.255.13.3])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jul 2014 20:35:21 -0700
Message-ID: <53D1D077.5020009@linux.intel.com>
Date: Thu, 24 Jul 2014 20:35:19 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>, 
	richard.purdie@linuxfoundation.org
References: <cover.1406234258.git.bruce.ashfield@windriver.com>
	<a2203c27a84c25e8e62fde8b24e5c829ca212fe2.1406234258.git.bruce.ashfield@windriver.com>
In-Reply-To: <a2203c27a84c25e8e62fde8b24e5c829ca212fe2.1406234258.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] linux-yocto-dev: bump to v3.16+
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
X-List-Received-Date: Fri, 25 Jul 2014 03:35:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/24/2014 01:41 PM, Bruce Ashfield wrote:
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index 9b49eee87651..10f3d234ed25 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -36,7 +36,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;bareclone=1;branch=${K
>   SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>   SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>
> -LINUX_VERSION ?= "3.14+"
> +LINUX_VERSION ?= "3.16+"
>   LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
>   PV = "${LINUX_VERSION}+git${SRCPV}"
>
>

So far the Autobuilder has found 1 issue with this and the x32 build

https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/182/steps/BuildImages/logs/stdio

I will send more failures as I see them.

Sau!


