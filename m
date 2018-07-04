Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id CD01978A9D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 16:29:12 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id m16-v6so13565pls.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2018 09:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=xhiNnZlb+jmNVjl/XJS50IjcFIGLbeCmxiT7vsb/Fxs=;
	b=CQh6DWowphMvmm2HhZf1ZVIwsG86MJbz9F+4fQ0N6hugDXq7PPQ5CylHuEnu15W1uK
	vFAcu3zZAzciZQJqstI2us9+Yl84c2sF/TLrMGjpIkhYIvVKtZS1WZu4mYJ7iEhdB5PW
	kETwhzU6C3yFgJxutoh/X6fEkfCtV4Suextunq7X1QNUGMMslwEJdFzW72EzG2HJsMla
	eJ781Ijgc2alhVfQNmz4j+QxVgvo+4//vTzaApf9S5urE5BySE1dH8ndskFjLOGTIzeI
	qQyAyVct2CR5tQl2NwvU/fdSgMm7dKHpoa3jHHUPCbGv5DIpaytE877matNW6BDQNvj2
	jbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=xhiNnZlb+jmNVjl/XJS50IjcFIGLbeCmxiT7vsb/Fxs=;
	b=lswyfrmPVDOzYfLP+24AYgkACetHjBiTSRXw5nAJkwnCoJ6bKx0BWruyz11gJsAcNZ
	84AiYMHkHJlwH6g89bj3bGYpiNS59r8oUEmzNulXRO+GEAyqVChr7M/mlxRZMy5jlFfI
	LP5J/BjUFSVZYdOoAnA6pn4d5zF39eGWGE6IYmfUPdDJ+R6/GAWr6jHL5g9crAT9kLcJ
	8fIMkxFse4s5eVplPJil0kbut0wcAqXxSKgSsfUGkwLNAX8IaLbAFF8oAp/z00LgRSIg
	JgCT6gieNamBMWiypS+RddpHmH47yje1sgJ+SkqQ0bw6P1sXSaA4ytxNSvoVXtyP17qL
	YUgQ==
X-Gm-Message-State: APt69E0X9KyD2lgsanZmpxPz6kjFQmahs4aJRw3y+d/KERQIMmmBufXa
	PMnk5CyVQvIzKpbx9NeAfwc9yrXo
X-Google-Smtp-Source: AAOMgpcM0RxKmpexRAD+gVSpJ9NmXybD2QE7JZNV76jt3yPQ1zXT6sU6XEv94ax1wb+De5oTnuU6AQ==
X-Received: by 2002:a17:902:2927:: with SMTP id
	g36-v6mr2712390plb.303.1530721753375; 
	Wed, 04 Jul 2018 09:29:13 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:1caa:7afc:f307:5930])
	by smtp.gmail.com with ESMTPSA id
	p26-v6sm8247763pfi.164.2018.07.04.09.29.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jul 2018 09:29:12 -0700 (PDT)
To: Paulo Neves <ptsneves@gmail.com>, openembedded-core@lists.openembedded.org
References: <20180702150344.12852-1-ptsneves@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8d369205-b33c-1aa3-df78-0d6c970793e7@gmail.com>
Date: Wed, 4 Jul 2018 09:28:30 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180702150344.12852-1-ptsneves@gmail.com>
Subject: Re: [meta-oe][PATCH] kernel-devicetree: Corrected normalize_dtb
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
X-List-Received-Date: Wed, 04 Jul 2018 16:29:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/2/18 8:03 AM, Paulo Neves wrote:
> The normalize_dtb function was buggy because
> it only converted from .dts suffix to .dtb
> suffix if the user passed a full source path to
> KERNEL_DEVICETREE containing the /dts/ path.
> The problem is that if the user did that there
> would be a warning.
> 
> On the othet hand if user just set the variable
> KERNEL_DEVICETREE="file.dts" the bbclass translation
> to the respective .dtb target did not occur and
> make would fail saying it has no rule to make target
> file.dts
> 
> This patch decouples the logic of having /dts/ in the
> path from the target translation.
> 

Looking a bit more into the problem you are trying to solve, I think 
adding another check for files ending with .dts and then applying the 
dts-2-dtb tranform is better approach. Which will let us keep building 
dtb overlays as well as fix the case you have pointed out.

> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> ---
>   meta/classes/kernel-devicetree.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
> index 4f80cc62eb..9866d844ab 100644
> --- a/meta/classes/kernel-devicetree.bbclass
> +++ b/meta/classes/kernel-devicetree.bbclass
> @@ -13,8 +13,8 @@ normalize_dtb () {
>   	DTB="$1"
>   	if echo ${DTB} | grep -q '/dts/'; then
>   		bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
> -		DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
>   	fi
> +	DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
>   	echo "${DTB}"
>   }
>   
> 

