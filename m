Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlTdU-0007VJ-DA
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 00:00:46 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 Jan 2012 12:23:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95238399"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by azsmga001.ch.intel.com with ESMTP; 12 Jan 2012 12:23:30 -0800
Message-ID: <4F0F4142.9000609@linux.intel.com>
Date: Thu, 12 Jan 2012 12:23:30 -0800
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
X-List-Received-Date: Thu, 12 Jan 2012 23:00:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/08/2012 04:03 PM, Andrei Gherzan wrote:
> From: Andrei Gherzan<andrei.gherzan@windriver.com>
>
> Enable 64-bit math support in the expr applet. This will make
> the applet slightly larger, but will allow computation with very
> large numbers.
>

Just to confirm, I have seen discussion about finer-grain control over 
bitbake configuration, but are there any direct objections to this 
change going in?

Sau!

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


