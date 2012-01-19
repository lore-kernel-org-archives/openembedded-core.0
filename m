Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rnwt4-0004LH-QW
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 19:39:03 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Jan 2012 10:31:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="100501072"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2012 10:31:21 -0800
Message-ID: <4F186179.3000900@linux.intel.com>
Date: Thu, 19 Jan 2012 10:31:21 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326067422-30771-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1326067422-30771-1-git-send-email-andrei@gherzan.ro>
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [PATCH] busybox: defconfig modified in order to activate CONFIG_EXPR_MATH_SUPPORT_64
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
X-List-Received-Date: Thu, 19 Jan 2012 18:39:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/08/2012 04:03 PM, Andrei Gherzan wrote:
> From: Andrei Gherzan<andrei.gherzan@windriver.com>
>
> Enable 64-bit math support in the expr applet. This will make
> the applet slightly larger, but will allow computation with very
> large numbers.
>
> [YOCTO #1767]
>
> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
> ---
>   meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/busybox/busybox-1.19.3/defconfig b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
> index 1990f28..ebd751d 100644
> --- a/meta/recipes-core/busybox/busybox-1.19.3/defconfig
> +++ b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
> @@ -214,7 +214,7 @@ CONFIG_FEATURE_ENV_LONG_OPTIONS=y
>   # CONFIG_EXPAND is not set
>   # CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
>   CONFIG_EXPR=y
> -# CONFIG_EXPR_MATH_SUPPORT_64 is not set
> +CONFIG_EXPR_MATH_SUPPORT_64=y
>   CONFIG_FALSE=y
>   # CONFIG_FOLD is not set
>   # CONFIG_FSYNC is not set

Merged into OE-Core

Thanks
	Sau!


