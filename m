Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 74CFC6D2D6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 21:56:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 Oct 2013 14:56:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,565,1378882800"; d="scan'208";a="416749713"
Received: from unknown (HELO [10.255.15.241]) ([10.255.15.241])
	by fmsmga001.fm.intel.com with ESMTP; 24 Oct 2013 14:56:22 -0700
Message-ID: <52699785.6030504@linux.intel.com>
Date: Thu, 24 Oct 2013 14:56:21 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Konrad Scherer <konrad.scherer@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1382627820-3165-1-git-send-email-konrad.scherer@windriver.com>
	<1382627820-3165-2-git-send-email-konrad.scherer@windriver.com>
In-Reply-To: <1382627820-3165-2-git-send-email-konrad.scherer@windriver.com>
Subject: Re: [PATCH] cracklib: cracklib-native should not depend on zlib
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
X-List-Received-Date: Thu, 24 Oct 2013 21:56:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/2013 08:17 AM, Konrad Scherer wrote:
> From: Konrad Scherer <Konrad.Scherer@windriver.com>
>
> Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
> ---
>   meta/recipes-extended/cracklib/cracklib_2.9.0.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.0.bb b/meta/recipes-extended/cracklib/cracklib_2.9.0.bb
> index 34c2ff1..bbf88bb 100644
> --- a/meta/recipes-extended/cracklib/cracklib_2.9.0.bb
> +++ b/meta/recipes-extended/cracklib/cracklib_2.9.0.bb
> @@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1+"
>   LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
>
>   DEPENDS = "cracklib-native zlib"
> -DEPENDS_class-native = "zlib"
> +DEPENDS_class-native = "zlib-native"
>
This is actually needed since cracklib has a configure test for zlib.h, 
with no way to disable it. So without the zlib-native the build will be 
non-determinstic, since depending on the existance of zlib.h configure 
output will be different.

Thanks
	Sau!



>   EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
>
>

