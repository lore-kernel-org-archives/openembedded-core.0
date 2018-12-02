Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 111A36D546
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Dec 2018 00:09:46 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id d72so4088954pga.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Dec 2018 16:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=zfJtseuK3zlQ5fmwb6NoXEfjXQ23wZYDCzi+XGkzw4M=;
	b=el0olijQnqcCNZaapbsOZDRS9AFlQnPrA0gxQl8UP2fDs3BWRnKfUevS4hAiy7Zmdb
	R7GV+Pk12FfVznMPH54P+Y7wOCt2Cyd60C8zpMe5WC6jTKEuUO7K206Ug90Ltbq/CP/a
	n4SS2MHuaH0P+aFLEo3HAxVQJjCpWJikAq5y6co8f4Th+Xz8xbMmiRVL4oBsSeMaG7ml
	dFVxaFW4AnZni+W8PoF+JV8STcRiMPi4GXqy60Lxye0tl3cGr5/lDD/WVmZ4zl63KACQ
	7kYy8fa+kkFTu1JJYU2YmkMQiTUEzkXI0xJgHe9SV7ukU6PZ2e9cu4JAxm+8AEKXZ7FO
	SA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=zfJtseuK3zlQ5fmwb6NoXEfjXQ23wZYDCzi+XGkzw4M=;
	b=l408tgFqFv2aBHhJy/5lHkfeQbsDVsUl+AtiGiUZ+fe812UWy58uPoeyE0/gz0BgNs
	EwE4dznUVoupzjiQ2d0WaRa0abJopRrpOh3RdEg2JsBWvbTu1zfD4i2WUp0YGRDBUvr/
	3/GhDC4BHZAQHZeCcdL1kbKWXePMnmJhw9mtFZXQfxTHjiQDy0Nmz6EuTf3FUnvAponE
	dy8qfsU544WOGeY5TY46U6mw2zO8yHsqXNRHWL8FKFngF6Ffxxz6O+pp7K85QFSJKzlq
	lg73oMRDbAdX4S91+3DPdcGULIu2Iv+3D2iDZlsiaHC3LPLy0ZBVUtlbnrM1r53Xdrh5
	CvxQ==
X-Gm-Message-State: AA+aEWbGECQYnJbbPXl3/O5l057XfBDBxX65dawK2CAn+d02GLJtVQjU
	Q8cfLp42RHGihtVryyYSv5+Tg4JeHUU=
X-Google-Smtp-Source: AFSGD/XsEU4GGwL2m0KtRu7AvKRXgm47HbPYkBaoHI2atyWHWPXfp+tohCYtX6qQFWRlhTf/njiZ8g==
X-Received: by 2002:a62:13c3:: with SMTP id 64mr10718509pft.93.1543709387625; 
	Sat, 01 Dec 2018 16:09:47 -0800 (PST)
Received: from hermes.local ([2601:646:877f:9499:a567:a959:454c:eca5])
	by smtp.gmail.com with ESMTPSA id
	73-v6sm13033596pfl.142.2018.12.01.16.09.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Dec 2018 16:09:47 -0800 (PST)
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20181130215537.29981-1-JPEWhacker@gmail.com>
	<20181201030142.9385-1-JPEWhacker@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <c492b503-696b-9cad-0f69-9bd9129a6e14@gmail.com>
Date: Sat, 1 Dec 2018 16:09:44 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:64.0)
	Gecko/20100101 Thunderbird/64.0
MIME-Version: 1.0
In-Reply-To: <20181201030142.9385-1-JPEWhacker@gmail.com>
Subject: Re: [PATCH v2] classes/waf: Fix builds when B != S
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
X-List-Received-Date: Sun, 02 Dec 2018 00:09:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Joshua

There is a build failure for a2jmidid see

http://errors.yoctoproject.org/Errors/Details/202833/

Seem to be related can you validate

On 11/30/18 7:01 PM, Joshua Watt wrote:
> Waf requires that the current working directory be ${S} (the location of
> the wscript) when building. Most of the time, this was true only because
> B defaults to S. However, anything that changed that behavior (notably,
> using externalsrc) would break the recipe. Remedy this by explicitly
> changing cwd to ${S} when running waf commands. As a happy side effect,
> B can be set up for "out of tree" builds to keep the source directory
> clean.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   meta/classes/waf.bbclass | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> index 19e93761b39..8e6d754c299 100644
> --- a/meta/classes/waf.bbclass
> +++ b/meta/classes/waf.bbclass
> @@ -1,6 +1,8 @@
>   # avoids build breaks when using no-static-libs.inc
>   DISABLE_STATIC = ""
>   
> +B = "${WORKDIR}/build"
> +
>   EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
>   
>   python waf_preconfigure() {
> @@ -22,16 +24,16 @@ python waf_preconfigure() {
>   do_configure[prefuncs] += "waf_preconfigure"
>   
>   waf_do_configure() {
> -	${S}/waf configure --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF}
> +	(cd ${S} && ./waf configure -o ${B} --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF})
>   }
>   
>   do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
>   waf_do_compile()  {
> -	${S}/waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
> +	(cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)})
>   }
>   
>   waf_do_install() {
> -	${S}/waf install --destdir=${D}
> +	(cd ${S} && ./waf install --destdir=${D})
>   }
>   
>   EXPORT_FUNCTIONS do_configure do_compile do_install
> 

