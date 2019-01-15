Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id A83487C0F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 15:42:34 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id b7so1479452pfi.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 07:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=U9EysF1GeLyV8M+3JYu9btJS5lwNubJXUF7gRlZmdrU=;
	b=ZEIQpXQI6on1wEGDrLPKQVjX+cXok+fx8zgvsuMhWEwxiz5jE/owDa+4xQCObPLA6t
	mV2/3wU1GEAFfWb2brth3hptth9gNp2SxjA/KYyEJU05idft6ttuYHv9K4S2AqTDL/Tp
	KFN4SjPqmUkvNmWchjFJSudMtnlr9Y+KWmM2sslhWDq5DkEVln1W5KaWvV9VH9Kx4o6D
	apt9GHBNxzgRCigwoZ/zQIjLgQRJegFJCE/EbvknDmrXjDungZgq6J8OL8+Dpq/ENxjO
	s473gE1R3q+Dmcn8FXVRzKvNGZKflfbK05TCf5/DlImAqLcvhA7W0r1kONy00VZaNHwz
	fe2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=U9EysF1GeLyV8M+3JYu9btJS5lwNubJXUF7gRlZmdrU=;
	b=RKRmhaWvplvBXBBrqm3W40FpFRBzZYx6sPCfiD3BcxP+qqC4BbK9mzkhD/K4EZwuaV
	xwgUteYVAQkXsNIg83O9tWmaAra8MNI+4lDvX7yHNOFc5KYSFKdJu6W6+TJQnnOQl4sc
	m7CgsydolVUZDZEiGJ9wl8jdW3tJLya9v4NOG0OqG051O6zvomk9g+wFahfcvwPV2MEO
	iopnMA2qySj9q+vsVjvNwgQC3t44RRb9YGGrO0NhcPAXtnYRYdd2jKK6L009SAP4zyJm
	OeiaDhHW71VMPgSzhoBgy+BMytvYMaaKzGF8Z6QpEJxqcVhGfmEALgRzsIcVjd5yhTxt
	xZFA==
X-Gm-Message-State: AJcUukdyl35M6kRfUR7qUhgkqsqnKIrO4mjAPy7ZCzTblsVzI8efKwfG
	wwwqERdNfe363ADQOWMUeY8=
X-Google-Smtp-Source: ALg8bN7ep1irzczYM/fxOfJd4vnhBH3MCUEJikn4sp87UPRv2DSJqpLUv/g22Lf2Nz8s05vpWcTU8Q==
X-Received: by 2002:a63:4342:: with SMTP id q63mr4365366pga.63.1547566955406; 
	Tue, 15 Jan 2019 07:42:35 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:7d19:dae:7651:86d3?
	([2601:202:4180:c33:7d19:dae:7651:86d3])
	by smtp.gmail.com with ESMTPSA id
	h19sm4243516pfn.114.2019.01.15.07.42.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 07:42:34 -0800 (PST)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20190115130203.1829-1-ross.burton@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <25287651-2fd2-f49b-d2f8-744c978a98c9@gmail.com>
Date: Tue, 15 Jan 2019 07:42:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190115130203.1829-1-ross.burton@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: Re: [PATCH][thud] kernel: use olddefconfig as the primary target for KERNEL_CONFIG_COMMAND
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
X-List-Received-Date: Tue, 15 Jan 2019 15:42:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/15/19 5:02 AM, Ross Burton wrote:
> From: Bruce Ashfield <bruce.ashfield@windriver.com>
>
> As was warned by commit 312ee68752fa [kconfig: announce removal of
> oldnoconfig if used], oldnoconfig has been removed from the 4.20 kernel.
>
> So we switch our default mode to olddefconfig.

This is sitting in stable/thud-next already.
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=stable/thud-next&id=3845a72fc21f206ce546d1d421a097a97d97d928

thanks,
Armin
>
> commit fb16d8912 [kconfig: replace 'oldnoconfig' with 'olddefconfig',
> and keep the old name as an alias] introduced olddefconfig in the 3.10
> kernel, we shuffle oldnoconfig to the fallback target.
>
> The fallback mode allows kernels between 3.10 and the currently listed
> oldest kernel of 3.2 to continue to configure.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index e04d2fe0043..880c5ef1728 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -492,7 +492,7 @@ sysroot_stage_all () {
>  	:
>  }
>  
> -KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} oldnoconfig"
> +KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} olddefconfig || oe_runmake -C ${S} O=${B} CC="${KERNEL_CC}" oldnoconfig"
>  
>  python check_oldest_kernel() {
>      oldest_kernel = d.getVar('OLDEST_KERNEL')


