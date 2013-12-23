Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E72DA61039
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 19:33:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Dec 2013 11:33:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,538,1384329600"; d="scan'208";a="456768797"
Received: from unknown (HELO [10.255.12.16]) ([10.255.12.16])
	by orsmga002.jf.intel.com with ESMTP; 23 Dec 2013 11:33:55 -0800
Message-ID: <52B89023.80209@linux.intel.com>
Date: Mon, 23 Dec 2013 11:33:55 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
References: <cover.1387787578.git.Qi.Chen@windriver.com>
	<2e053dfde8c5b774d5f20be0f1afd3b41200fb9e.1387787578.git.Qi.Chen@windriver.com>
In-Reply-To: <2e053dfde8c5b774d5f20be0f1afd3b41200fb9e.1387787578.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/2] busybox: enable SEAMLESS_XZ by default
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
X-List-Received-Date: Mon, 23 Dec 2013 19:33:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/2013 12:36 AM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> We have enabled SEAMLESS_GZ and SEAMLESS_BZ2 in defconfig, it's
> reasonable for us to enable SEAMLESS_XZ as well. Otherwise, we
> couldn't extract tar.xz file while we could extract tar.gz file.
> Such situation would be somewhat confusing.
>
It's also important to note how much bigger the busybox image grows when 
adding a new config options, so what's the increase in # of bytes?

Thanks
	Sau!

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-core/busybox/busybox/defconfig |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
> index f0e63c2..20cd147 100644
> --- a/meta/recipes-core/busybox/busybox/defconfig
> +++ b/meta/recipes-core/busybox/busybox/defconfig
> @@ -125,7 +125,7 @@ CONFIG_FEATURE_HWIB=y
>   #
>   # Archival Utilities
>   #
> -# CONFIG_FEATURE_SEAMLESS_XZ is not set
> +CONFIG_FEATURE_SEAMLESS_XZ=y
>   CONFIG_FEATURE_SEAMLESS_LZMA=y
>   CONFIG_FEATURE_SEAMLESS_BZ2=y
>   CONFIG_FEATURE_SEAMLESS_GZ=y
>

