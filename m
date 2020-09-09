Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web11.8707.1599691168695902792
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 15:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 089MdNqX021600
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Wed, 9 Sep 2020 17:39:24 -0500
Subject: Re: [OE-core] [meta-oe][PATCH 3/4] tune-cortexa57-cortexa53.inc: add CRC and set march
To: Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org
References: <20200909221652.6750-1-jon.mason@arm.com>
 <20200909221652.6750-4-jon.mason@arm.com>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <993ae490-f9a4-e16c-fdf4-34c0ae4944f4@kernel.crashing.org>
Date: Wed, 9 Sep 2020 17:39:22 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909221652.6750-4-jon.mason@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/9/20 5:16 PM, Jon Mason wrote:
> Add CRC to the default tuning of big.LITTLE Cortex-A57-A53.  This puts
> it inline with all other ARMv8a tunings.  Also, reference
> PACKAGE_EXTRA_ARCHS_tune-armv8a-crc instead of
> PACKAGE_EXTRA_ARCHS_tune-aarch64, which sets the -march to armv8 and
> enables the CRC.
> 
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  meta/conf/machine/include/tune-cortexa57-cortexa53.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
> index ba4b0738529c..5880bf203231 100644
> --- a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
> +++ b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
> @@ -10,6 +10,6 @@ require conf/machine/include/arm/arch-armv8a.inc
>  # Little Endian base configs
>  AVAILTUNES += "cortexa57-cortexa53"
>  ARMPKGARCH_tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
> -TUNE_FEATURES_tune-cortexa57-cortexa53 = "aarch64 cortexa57-cortexa53"
> -PACKAGE_EXTRA_ARCHS_tune-cortexa57-cortexa53 = "${PACKAGE_EXTRA_ARCHS_tune-aarch64} cortexa57-cortexa53"
> +TUNE_FEATURES_tune-cortexa57-cortexa53 = "aarch64 crc cortexa57-cortexa53"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa57-cortexa53 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57-cortexa53"

So all a57 and a53 (as well as big.LITTLE) contain the CRC unit?

I use the a72/a53, but I use it as a common intersection for software for
multiple products.  One has an a72 and one has an a53, so it's not a true
bigLittle configuration.  I could see someone try this using this tune as well.

--Mark

>  BASE_LIB_tune-cortexa57-cortexa53 = "lib64"
> 
> 
> 
> 
