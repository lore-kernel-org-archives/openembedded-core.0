Return-Path: <ross.burton@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id CD7C77D25F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 10:05:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Sep 2019 03:05:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,484,1559545200"; d="scan'208";a="359440855"
Received: from fwan32-mobl1.gar.corp.intel.com (HELO blackadder.local)
	([10.252.38.244])
	by orsmga005.jf.intel.com with ESMTP; 09 Sep 2019 03:05:02 -0700
To: openembedded-core@lists.openembedded.org
References: <20190909054153.9555-1-zangrc.fnst@cn.fujitsu.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <5bf299c9-4851-4eb5-a938-6615f4b92262@intel.com>
Date: Mon, 9 Sep 2019 11:05:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190909054153.9555-1-zangrc.fnst@cn.fujitsu.com>
Subject: Re: [PATCH] libxcrypt:upgrade 4.4.8 -> 4.4.9
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
X-List-Received-Date: Mon, 09 Sep 2019 10:05:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 09/09/2019 06:41, Zang Ruochen wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>   meta/recipes-core/libxcrypt/{libxcrypt_4.4.8.bb => libxcrypt_4.4.9.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.8.bb => libxcrypt_4.4.9.bb} (94%)
> 
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.8.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.9.bb
> similarity index 94%
> rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.8.bb
> rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.9.bb
> index 1787f69..1ffa0af 100644
> --- a/meta/recipes-core/libxcrypt/libxcrypt_4.4.8.bb
> +++ b/meta/recipes-core/libxcrypt/libxcrypt_4.4.9.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM ?= "file://LICENSING;md5=3bb6614cf5880cbf1b9dbd9e3d145e2c \
>   inherit autotools pkgconfig
>   
>   SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
> -SRCREV = "acd84997a5a8b2badd28b70a642abee11272fad2"
> +SRCREV = "b503e2fb3a0271986b6b2756404f0593467cf5d7"
>   SRCBRANCH ?= "develop"
>   
>   PROVIDES = "virtual/crypt"
> 
Do you test these upgrade?

ERROR: ParseError at 
[...]/poky/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.8.bb:5: 
Could not include required file libxcrypt_4.4.8.bb

Ross

