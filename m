Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id C8D66719C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 17:33:39 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y68so16686467pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 09:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=77MUCwFRSuCSeg3E3UY+/AjCptuGzLs0HdDJU7E89k4=;
	b=p6PE7umcSD7z9A+rAZQptWm2o53ymVDDotixQf1Vb8WCWWwUpPZxR4I+OrhIaZF9pW
	TCBtFgdsugWEOlMzplQ+mN8PLxB/j4IXO21O3yTzRwNT5z1zSxJy99EwqYzz6ahuMIEN
	S9cQKUoRtZFhYI43yFrcbHSu0VKkO2APD9K/CXUcLMEIrb22iPB4n4PbQN0tif9Znhb6
	QofwTtKNH2M0NJSVEBft2G8qMH+kcmFXd/rwQgdxhPM1qCymVMtZfVxqQuXWh/Bs/42b
	FGjzaKR9ABwh8IndI8creJmmRC5aeaWA7wPxSmgQN6NLjHYGE7OUKmjVvQ2AnAMQQ3QC
	t+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=77MUCwFRSuCSeg3E3UY+/AjCptuGzLs0HdDJU7E89k4=;
	b=O4nIuBaY1Fci7IR2NsKA6Lr5mahvky0VchWi5K9sAbd4odmg+xdmRnFacJ7FE8j5Lc
	pSATG33Oi7cXfkdt2bpSMxItQ4e4LvekF5nZbn6ziQNgg7bWjj0RP0eLoUlhRtnaA8br
	Owz3BvFiM57XbcOuIhNDsM8Ng3bbF2rdG5miL7UFmwcoxXvvp9iBQe+ekIbpWMre1Htm
	n+t94dvYVXq/uZhDaDEpsb32/l2Wt56ZD7qffEEEp1kNeiwXtz8SsTAZ/uaacxiDj2Ub
	H17vQk/Q3ycLjfPTu+di86jlAN9KHJSBfDsdLZ2RnRXprIE3moEFYSWZJ1ugyAuFgDNk
	gL8w==
X-Gm-Message-State: ABUngvdGFlpOrndmEDJ6yKDpT08G+JkfwbehENEysWTJ+mu/4rdWb07t8DYSKFkN83CXQQ==
X-Received: by 10.99.36.65 with SMTP id k62mr343016pgk.88.1478540021024;
	Mon, 07 Nov 2016 09:33:41 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:d844:e9e6:5f6d:525])
	by smtp.gmail.com with ESMTPSA id
	v66sm41956853pfa.33.2016.11.07.09.33.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Nov 2016 09:33:40 -0800 (PST)
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
	openembedded-core@lists.openembedded.org
References: <20161107150135.40266-1-Zubair.Kakakhel@imgtec.com>
	<20161107150135.40266-11-Zubair.Kakakhel@imgtec.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <0a4d6196-ee91-0631-7939-256f3757277a@gmail.com>
Date: Mon, 7 Nov 2016 09:33:39 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161107150135.40266-11-Zubair.Kakakhel@imgtec.com>
Subject: Re: [Patch 10/13] ghostscript: Reduce duplication in MIPS variants.
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
X-List-Received-Date: Mon, 07 Nov 2016 17:33:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 11/7/16 7:01 AM, Zubair Lutfullah Kakakhel wrote:
> Reduce duplication in MIPS variants now that the MACHINEOVERRIDES
> variable is defined
> 
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> ---
>  meta/recipes-extended/ghostscript/ghostscript_9.19.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.19.bb b/meta/recipes-extended/ghostscript/ghostscript_9.19.bb
> index fe2016b..52f6fe3 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_9.19.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.19.bb
> @@ -46,8 +46,8 @@ EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec \
>                  --with-cups-datadir=${datadir}/cups \
>                  "
>  
> -EXTRA_OECONF_append_mips = " --with-large_color_index=0"
> -EXTRA_OECONF_append_mipsel = " --with-large_color_index=0"
> +EXTRA_OECONF_append_mipsarcho32 = " --with-large_color_index=0"
> +EXTRA_OECONF_append_mipsarcho32el = " --with-large_color_index=0"

Now that you have opened the pandora box
Can there be something like

mipsarch = "common for LE and BE"
mipsarcheb = "BE"
mipsarchel = "LE"

most of the times options are endian independent but LE suffers because its
not default and we assume without qualifying endianness its BE

>  
>  # Explicity disable libtiff, fontconfig,
>  # freetype, cups for ghostscript-native
> 

