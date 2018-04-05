Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id C1C5C74E46
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 00:25:48 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id v5-v6so14616820plo.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2018 17:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=Stcf2NBBwOI++T3dcapPMsmS6B2dwCpni79G/tcp+QU=;
	b=bFcaXaQJWFLK3wN+C5K5Px/pdoKtZYmJhZ6v0+/deVRFxmLfFM3xi2KeC5g+JcC3OZ
	e6HEmdstS3YyZ4y9bAWrpi+CKj66eRtdRVvC7fAtkA/AI0888cVLTzMlR9FzRm0FxHZO
	zn9b+2Li4MrmKPPqGwbrtr1TxZ33ugZ2A8VFv78k9SkuzRBq1Iou9OuJzm31hzWtdBYO
	c6YqgPdEU6sCv/ZmTEw6g2he/FlcasRYannQpglYLtUhSf9E26cxWYuGmxrVp8MnZ/9a
	PMzG8iz+xdYWqwwIndtrCcOpTwBjCVQmqy5K/2ELOEnECx/nJ0qRFD1VDuPyg9hw79Zq
	+8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Stcf2NBBwOI++T3dcapPMsmS6B2dwCpni79G/tcp+QU=;
	b=fe7K/jueLLwPE4Xyl1F1SheTHdlfedFWgFkbDWT4mLp3B1xVWRkC2cEE6/mAYrnMm1
	4b7Fzj7ph5WKJkMc4RnT8WEC/j4sebOs9PHa32c/izjp9ERBzlKX/VnUyvnhisyET8zK
	0CHQVB6jdbGJJq8e2OL+iQMhltPI9NSo4sdSh1aDIQULOZRZR/b6p9n4SMXXb5desrbp
	ygJeIliN3LLuV4PtW514dWuR9bP3pixwUEjDo5cgMtzx4jTlEmHcaPfOZsPeVjwwYIim
	lbWe1RCMzBsVMCeEv6JYDp0kMfExn4RN93YjecxvdgKIjuG+58VgsA9yRkcFpOo1hQiv
	pbBQ==
X-Gm-Message-State: AElRT7HtdE12/b3zW0gUUDvVZfbECQr0FevA8KO7JWutTNcC3mi6UA80
	EijlPcmZvjObGZisSiQx3rYb87n+
X-Google-Smtp-Source: AIpwx484rHIxi31YM3l+1WyY3/UUWuc5qeL0LURH2PueS9pAmcVy5HZrTZZQypUOrjdYGmr0pfUfkA==
X-Received: by 10.101.100.4 with SMTP id a4mr7727785pgv.316.1522887949864;
	Wed, 04 Apr 2018 17:25:49 -0700 (PDT)
Received: from ?IPv6:2601:646:8880:466c:fde8:8784:7436:3e7a?
	([2601:646:8880:466c:fde8:8784:7436:3e7a])
	by smtp.gmail.com with ESMTPSA id
	s63sm13255453pfe.6.2018.04.04.17.25.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Apr 2018 17:25:49 -0700 (PDT)
To: Dan McGregor <danismostlikely@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20180404161630.22122-1-danismostlikely@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <3a852d87-16d1-304b-bbd6-80f39cfbc4b1@gmail.com>
Date: Wed, 4 Apr 2018 17:25:48 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20180404161630.22122-1-danismostlikely@gmail.com>
Subject: Re: [PATCH] packagegroup-core-sdk: update sanitizer lists
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
X-List-Received-Date: Thu, 05 Apr 2018 00:25:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/4/18 9:16 AM, Dan McGregor wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
> 
> aarch64 has been supported since GCC 5.1, sparc has been supported
> since 4.9, and S390 since 7.1.
> 

this is ok

> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> index a137e7748fd..45e8c135850 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> @@ -27,12 +27,9 @@ RDEPENDS_packagegroup-core-sdk = "\
>      tcl"
>  
>  SANITIZERS = "libasan-dev libubsan-dev"
> -SANITIZERS_aarch64 = ""
>  SANITIZERS_microblaze = ""
>  SANITIZERS_mipsarch = ""
>  SANITIZERS_nios2 = ""
> -SANITIZERS_powerpc64 = ""
> -SANITIZERS_sparc = ""
>  SANITIZERS_riscv64 = ""
>  SANITIZERS_libc-musl = ""
>  
> 


