Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id D136474863
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 00:25:05 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id v18-v6so14612082ply.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2018 17:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=av/dN1/kyPE6fzRWr+77Cf3YbOkAenNdEL1KjXznzu0=;
	b=n0nwceacHjRz0YEiuKVndbLv5oy1K1g6Rt2G3/M2VjPkGcXY2zwCNrcgISRupi05wV
	kF1vBU5g2D5VX613wWQhAQy0KFtRQtUTgo9A9jGfMuJbHuDsk9graJfXeZwY8dfJG5LR
	xShQ1RuovZXyur2uoWIlUo9mPicIpJsgyAXV+7Vcy88dBibPoQrzSl3xYVjY6MKANuoG
	FLIlSrRAJ/C3YLHDioLuMNPcIMvCUGxQRdhkgbGKBnmDpLIrxSD8jpi1pS4uTngDoLTY
	AF2yQ4YeSZtZtLrEn2UW4DFyegHzdFUNoD/FZWkGqVUO53+uAvjtiIrYzcdBQ9CnGQxu
	sxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=av/dN1/kyPE6fzRWr+77Cf3YbOkAenNdEL1KjXznzu0=;
	b=iGFzn+HfcPtsR3x2JCNl8PqVztdKrfe/Mk8G6z3MMlmG5Lw+C8uJBoIPJENeEjrE3V
	EY5JD4O1h+9Q1+XgwT9nQS4zWcUKoZLpuSrryJDPh2U5HyOgVv1GExcWo9RRJZRLr0DM
	jhl6qKC+kR7+DJRxcSo8ErfA+Tjd2U9ojRVHA3sLBEcf2h/tAR/hnMyx/Po532apbd9f
	JXbUO+ItIFj6oPe0D2sdvQAUIxZzdqfGvUueuNg6Tm4q6uNH1KM7rgcHTJmRQ0esA1Dp
	JWAQb14ri6O2q8JJooEEBBI8B+aHo95zPWTYu16w20huZRKk1ZpsOfIRk/KJzDG73oBJ
	caJg==
X-Gm-Message-State: ALQs6tCetHpNV7epcgu8VjZiTemN3k30+jGOtKshiNxDH54f5vbdQtWF
	2D2KWG6FnogMXR9iJDdroLemT49k
X-Google-Smtp-Source: AIpwx49aTBy0E6JRoe3qk6RLzsOR/eMBHptTDRKnXHNLFwI1viPJvsT8/RoFlm+4MI/SHc25vY5lTw==
X-Received: by 10.98.102.65 with SMTP id a62mr6114705pfc.68.1522887906425;
	Wed, 04 Apr 2018 17:25:06 -0700 (PDT)
Received: from ?IPv6:2601:646:8880:466c:fde8:8784:7436:3e7a?
	([2601:646:8880:466c:fde8:8784:7436:3e7a])
	by smtp.gmail.com with ESMTPSA id
	p13sm10801909pff.116.2018.04.04.17.25.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Apr 2018 17:25:05 -0700 (PDT)
To: Dan McGregor <danismostlikely@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20180404160849.21578-1-danismostlikely@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <82745bc4-8d16-8691-2d32-b89f16f9e214@gmail.com>
Date: Wed, 4 Apr 2018 17:25:04 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20180404160849.21578-1-danismostlikely@gmail.com>
Subject: Re: [PATCH] gcc-sanitizers: Update supported architectures
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
X-List-Received-Date: Thu, 05 Apr 2018 00:25:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/4/18 9:08 AM, Dan McGregor wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
> 
> aarch64 has been supported since GCC 5.1, sparc has been supported
> since 4.9, and S390 since 7.1.
> 
> Also mark as broken entirely with musl.
> 

this change is ok to apply.

> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  meta/recipes-devtools/gcc/gcc-sanitizers.inc | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> index 3183b29dec9..3b7e0028f2b 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> @@ -61,15 +61,19 @@ RDEPENDS_libubsan-dev += "${PN}"
>  RDEPENDS_liblsan-dev += "${PN}"
>  RDEPENDS_libtsan-dev += "${PN}"
>  RRECOMMENDS_${PN} += "libasan libubsan"
> -RRECOMMENDS_${PN}_append_x86-64 = " liblsan libtsan"
>  RRECOMMENDS_${PN}_append_x86 = " liblsan"
> +RRECOMMENDS_${PN}_append_x86-64 = " liblsan libtsan"
> +RRECOMMENDS_${PN}_append_powerpc64 = " liblsan libtsan"
> +RRECOMMENDS_${PN}_append_aarch64 = " liblsan libtsan"
>  
>  do_package_write_ipk[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
>  do_package_write_deb[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
>  do_package_write_rpm[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
>  
> -# MIPS, aarch64, and SPARC are broken.
> -COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm).*-linux'
> +# Only x86, powerpc, sparc, s390, arm, and aarch64 are supported
> +COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64).*-linux'
> +# musl is currently broken entirely
> +COMPATIBLE_HOST_libc-musl = 'null'
>  
>  FILES_libasan += "${libdir}/libasan.so.*"
>  FILES_libasan-dev += "\
> 


