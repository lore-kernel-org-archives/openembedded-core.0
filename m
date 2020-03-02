Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id A87AE6191A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2020 18:29:37 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t24so217602pgj.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Mar 2020 10:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=I8+AhuERLAlgYkV4G9wdUG3yOFm5vXSObFxzy50SvoQ=;
	b=AAH1RG+fyeR/YmUhV599zmrT+q0BHgj8z3Jz5rz9JhapG5BzHSbbC0WjvZ/+Jxl4ln
	M4NwVSlpcxfhyDFwtyyq6hSiqwOc+pS8XqhUZFtXJzL3CqzeILv4rziC95kS1LEWoUvR
	oW5GaT062Kerrg+MAXYe31lO39+OizMYeoC/9Xe0I4LRdlnDHsSKV8wmxQl+Zv+I90Co
	0bOWYaWLUp9GCNv2iOKiHDI6hJDRBVGwrmOYhigSgXUXhjO1BKD3FuVc2a+7Ez3MD8nk
	Eo2KGMnOWekNzxxBN8kE9tuiIONhLTJN5SYWrZ0GDnMSFhHo2rA83+n0W4OsrKqfkmo4
	Mw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=I8+AhuERLAlgYkV4G9wdUG3yOFm5vXSObFxzy50SvoQ=;
	b=l46ELsrdSktXc5T5XdEbQbNgLNqVhXNsq9DQ86nnA1j3jvXFVAZsTsptlz7Lv07CK1
	FvoW6tpmPDcsMsvAnqT2EU6dUkDcNHfRzT5o0iuJruapBLkOCFG5goP4D8YnV0lewz+y
	qYTdmt/LI/HX//EPWlyonfXQ+fRj7f4Mb8hA1VG6aYQBIWbWR8PgdX9cHhGDJX21pQNL
	AnnsstZZ/B9T38NfKMeLsSxq4+QljdbSHudw4w2HySzGcG5f/PICBa+3/A6UTxH694xU
	4aPJz163MjAd3FQQ4LV3j4n+zv6PJXGyhhm1GBeBCntJ50Y8RIxNwKuZiZP8Cr5trij5
	EQvw==
X-Gm-Message-State: ANhLgQ1LLqlqf4Xt2AX+Puc5/VU9pGyED12GDChMj4oScNQI6v/efQBU
	jng/n81TukjIIP2I8ciuO8g=
X-Google-Smtp-Source: ADFU+vvqm17opwXnbDQk1qwvFowobHLIB6n1gGXW/uqpD4X9sHYkgYUDtbJJ3NMhCAVdhEsfBB2mmg==
X-Received: by 2002:a63:cb11:: with SMTP id p17mr249968pgg.42.1583173778357;
	Mon, 02 Mar 2020 10:29:38 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:8446:2edf:6d4c:9a00?
	([2601:646:9200:4e0:8446:2edf:6d4c:9a00])
	by smtp.gmail.com with ESMTPSA id
	z17sm9883376pfk.110.2020.03.02.10.29.37
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 02 Mar 2020 10:29:37 -0800 (PST)
To: Junling Zheng <zhengjunling@huawei.com>,
	openembedded-core@lists.openembedded.org
References: <20200302171153.28030-1-zhengjunling@huawei.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <666b3145-0e57-cf3c-f1f4-22d6fd0521e5@gmail.com>
Date: Mon, 2 Mar 2020 10:29:37 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302171153.28030-1-zhengjunling@huawei.com>
Cc: wangnan0@huawei.com
Subject: Re: [PATCH] arch-arm64.inc: Do not append aarch64 in MACHINEOVERRIDES
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
X-List-Received-Date: Mon, 02 Mar 2020 18:29:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/2/20 9:11 AM, Junling Zheng wrote:
> Currently, for arch-arm64, poky will append the MACHINEOVERRIDES with
> "aarch64:", which has the higher priority than TRANSLATED_TARGET_ARCH.
> So, for aarch64 big endian, the variable '<foo>_aarch64' will override
> not only '<foo>', but also '<foo>_aarch64-be', thus we will get an
> incorrect variable.
> 
> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
> ---
>   meta/conf/machine/include/arm/arch-arm64.inc | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
> index 53f4566815..32294bd218 100644
> --- a/meta/conf/machine/include/arm/arch-arm64.inc
> +++ b/meta/conf/machine/include/arm/arch-arm64.inc
> @@ -4,8 +4,6 @@ require conf/machine/include/arm/arch-armv7ve.inc
>   
>   TUNEVALID[aarch64] = "Enable instructions for aarch64"
>   
> -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'aarch64:', '' ,d)}"
> -

if its removed here, where is it being added for other machines, 
question is, should we treat aarch64 as LE equivalent of aarch64_be
or should be treated as common aarch64 and a new define like aarch64_le 
defined.

>   # Little Endian base configs
>   AVAILTUNES += "aarch64 aarch64_be"
>   ARMPKGARCH_tune-aarch64 ?= "aarch64"
> 

