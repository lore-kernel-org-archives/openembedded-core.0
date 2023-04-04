Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D287CC6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 19:48:33 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.112433.1680637710316693744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 12:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=qNFur0IV;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id d11-20020a05600c3acb00b003ef6e6754c5so17052239wms.5
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 12:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1680637707;
        h=content-transfer-encoding:in-reply-to:cc:organization:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lsYhjb9SSK6cP0dQ88O3j8mwD02L2PyVRZq5lHRuoTo=;
        b=qNFur0IVCE8XLtSC0z0lqJ73GnTlv5MZbxzjiI9xcqO9L5OWbzmMUXMZ5XSlxqtzft
         6O2YLqMKt3ZaYYqI8T8B68Ofm13mCFcu2udBtPn4HzbLa5piBYNlh0t5aSuwf2J3mfrz
         6qRmMKbKG7D7FsK3RVjWclwdQ79os6zI+Fcex53K+gt+ur4febLLSSYdNltqnw4k7c3c
         tMQP3+XCxVPk3tRk/vFGz1qE7y2a+6bLgPI+Q8tz1Xyw/VQ48A6Pae8+ygXjfkrOm733
         IunfjHmCB2XN3i5kQboajqz+cHlbYAUqTFLlvaTJ3u1h3w71muc8DpH70PxabSmPi07Q
         yr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680637707;
        h=content-transfer-encoding:in-reply-to:cc:organization:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsYhjb9SSK6cP0dQ88O3j8mwD02L2PyVRZq5lHRuoTo=;
        b=nQbLDnqLaj+Wg5hfAC8tDSMNms52DlQzWCFJqSkYIBQ/6QKbdnvAaTIM5NsgegA4Rj
         lu3mz/6TiCdEZc2wIgcHWMY/pLv9REMODb/7Jc8Eir0/g2voI3kZJcXnu3j1JVg1kBsd
         eYrQTRX3n9m369xElU8enlHOBLaj3DxJQhGttKGekrricBZA7Xo5uOEmCBgTgMGmnxjp
         TYD814vXIjXPfhylmounisvqLx+ALtfdyiHsUQrt/xmROYqAmX6jNX6ueZtx33t6umPn
         G7sNNPC9pCjfM+w9MqQbChGJf3FxhBsXPxNOrVukajHM6Wt9C4Jvc0o9/eoK1ytF1oxc
         BD0Q==
X-Gm-Message-State: AAQBX9dM9YeFD6dVavRazbcEHED6pG0CzvsjdfGNBdNuVhSnGbdck+x7
	HO/yUf2iVYuJJcvk+e2P41Qm6IsB7zDLMTi2NJ0=
X-Google-Smtp-Source: AKy350bxLrb2jyhRGExRwiziaaOTdodmkcWUoemrdbV0viscsJgE+79WXKSRgFivv7mZNeLZfj8UUw==
X-Received: by 2002:a1c:7501:0:b0:3ef:3ce6:7c54 with SMTP id o1-20020a1c7501000000b003ef3ce67c54mr2869736wmc.35.1680637707099;
        Tue, 04 Apr 2023 12:48:27 -0700 (PDT)
Received: from [192.168.0.10] (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id m26-20020a05600c3b1a00b003ede2c4701dsm23375701wms.14.2023.04.04.12.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 12:48:26 -0700 (PDT)
Message-ID: <9cb0aae1-c1be-ab0d-2263-1ab2f928c885@smile.fr>
Date: Tue, 4 Apr 2023 21:48:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions.inc: Exclude some issues
 not present in linux-yocto
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20230404164400.403462-1-richard.purdie@linuxfoundation.org>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <20230404164400.403462-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 19:48:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179709

Hi,

On 4/4/23 18:44, Richard Purdie wrote:
> Exclude some CVEs where the patches were backported to the stable series
> kernels we have.> 
> https://www.linuxkernelcves.com/cves/CVE-XXXX-XXXX is useful to help
> with this.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../distro/include/cve-extra-exclusions.inc   | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
> index a281a8ac65c..680f613c9f9 100644
> --- a/meta/conf/distro/include/cve-extra-exclusions.inc
> +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
> @@ -381,6 +381,46 @@ CVE_CHECK_IGNORE += "CVE-2023-0266"
>  # Backported in version v6.1.7 0afa5f0736584411771299074bbeca8c1f9706d4
>  CVE_CHECK_IGNORE += "CVE-2023-0394"
>  
> +# https://nvd.nist.gov/vuln/detail/CVE-2023-0461
> +# Introduced in version 4.13 734942cc4ea6478eed125af258da1bdbb4afe578
> +# Patched in kernel v6.2 2c02d41d71f90a5168391b6a5f2954112ba2307c
> +# Backported in version v6.1.5 7d242f4a0c8319821548c7176c09a6e0e71f223c
> +# Backported in version v5.15.88 dadd0dcaa67d27f550131de95c8e182643d2c9d6
> +CVE_CHECK_IGNORE += "CVE-2023-0461"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2023-0386
> +# Introduced in 5.11 459c7c565ac36ba09ffbf24231147f408fde4203
> +# Patched in kernel v6.2 4f11ada10d0ad3fd53e2bd67806351de63a4f9c3
> +# Backported in version 6.1.9 42fea1c35254c49cce07c600d026cbc00c6d3c81
> +# Backported in version 5.15.91 e91308e63710574c4b6a0cadda3e042a3699666e
> +CVE_CHECK_IGNORE += "CVE-2023-0386"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2023-1073
> +# Introduced in 1b15d2e5b8077670b1e6a33250a0d9577efff4a5

The earliest version containing this commit is v3.16

> +# Patched in kernel v6.2 b12fece4c64857e5fab4290bf01b2e0317a88456
> +# Backported in version 5.10.166

You are missing the SHA1 here : It is 5dc3469a1170dd1344d262a332b26994214eeb58

> +# Backported in version 5.15.91 2b49568254365c9c247beb0eabbaa15d0e279d64
> +# Backported in version 6.1.9 cdcdc0531a51659527fea4b4d064af343452062d
> +CVE_CHECK_IGNORE += "CVE-2023-1073"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2023-1074
> +# Patched in kernel v6.2 458e279f861d3f61796894cd158b780765a1569f
> +# Backported in version 5.15.91 3391bd42351be0beb14f438c7556912b9f96cb32
> +# Backported in version 6.1.9 9f08bb650078dca24a13fea1c375358ed6292df3
> +CVE_CHECK_IGNORE += "CVE-2023-1074"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2023-1077
> +# Patched in kernel 6.3rc1 7c4a5b89a0b5a57a64b601775b296abf77a9fe97
> +# Backported in version 5.15.99 2c36c390a74981d03f04f01fe7ee9c3ac3ea11f7
> +# Backported in version 6.1.16 6b4fcc4e8a3016e85766c161daf0732fca16c3a3
> +CVE_CHECK_IGNORE += "CVE-2023-1077"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2023-1078
> +# Patched in kernel 6.2 f753a68980cf4b59a80fe677619da2b1804f526d
> +# Backported in version 5.15.94 528e3f3a4b53df36dafd10cdf6b8c0fe2aa1c4ba
> +# Backported in version 6.1.12 1d52bbfd469af69fbcae88c67f160ce1b968e7f3
> +CVE_CHECK_IGNORE += "CVE-2023-1078"
> +
>  # Wrong CPE in NVD database
>  # https://nvd.nist.gov/vuln/detail/CVE-2022-3563
>  # https://nvd.nist.gov/vuln/detail/CVE-2022-3637

Apart from these two comments:
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>

Regards,

-- 
Yoann Congal
Smile ECS - Tech Expert

