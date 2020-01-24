Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id DD3107FDDD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 22:16:19 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c84so944036wme.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 14:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=WzsPXmSKeiFIDoqPJSaR2D68Fr/3xaPd/H5DiThRpYI=;
	b=LsOC+YFOPJQ6lkN5gFeosNIJdUMG8C8E9XZOwSHy6xUelHHEaJNUgOz0gRzY26sP8t
	kb8yzlciJ2vlE2PnKkAbGo2LO/j7R8XS5/lgLVU7A28qX7Mc2HjKYpuS/Ky5YUA9JVyb
	04hThnSGqLc32poR25O75PD1jn2q027n2CgLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=WzsPXmSKeiFIDoqPJSaR2D68Fr/3xaPd/H5DiThRpYI=;
	b=fnLFXuF9KE/Ib8dyok3UErwA17XZOyVHZ+g9dkivo5ZaXhqx7/2120Ake/WCRcqlcn
	Ngb1eh9QrExf2ja3NUKdm6Apd/fXW3vYZKesp04+2TF9W2xLvDKugdc+kswwIry2yMQN
	pTlY1Z8Q32xya9xyDm4m55wmOT5nnwwRgG45h/P/7GTY9cWhm8/k8Ijr0+I3QX+FHDMn
	h65h3b+uqucDOKcd/pXmJhPmuFtwlJH1Jo+/dninrDIbU9CX12qA0OCGl8Lc7BonmLNC
	MU1Qbw+oRUk0ab9kYREpEU6aPiCy/aTRcYFJfHEhY+2eAsW9vIMGQEMLxiQ7Bc6dMbHt
	rznw==
X-Gm-Message-State: APjAAAXMNHzpTz7syR6N435fcKi3gPRe/+BgaiK6ox7dcoBkcveK2Vp4
	3EaU2e+pI79R9OOCY+A7gLLcGg==
X-Google-Smtp-Source: APXvYqyeGWHbPwTedHZaJpTaTGPKfF5Z8WDa3r4GcoVaRzX309km7oRnAaz/x6nKEOQW3JsRgDd+4w==
X-Received: by 2002:a05:600c:145:: with SMTP id
	w5mr1098026wmm.157.1579904180441; 
	Fri, 24 Jan 2020 14:16:20 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n189sm8822731wme.33.2020.01.24.14.16.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 24 Jan 2020 14:16:19 -0800 (PST)
Message-ID: <fee8cb209e7b2e2ce10442e6f6fc518adf67c156.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2020 22:16:16 +0000
In-Reply-To: <20200124110728.3728-1-ross.burton@intel.com>
References: <20200124110728.3728-1-ross.burton@intel.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v2] packagegroup-base: only pull in dosfstools if licensing allows
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
X-List-Received-Date: Fri, 24 Jan 2020 22:16:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-01-24 at 11:07 +0000, Ross Burton wrote:
> packagegroup-base-vfat RRECOMMENDS on dosfstools, but this is GPLv3
> so
> may be blacklisted.  Respect INCOMPATIBLE_LICENSE and don't recommend
> if
> GPL-3.0 has been blacklisted.
> 
> (From OE-Core rev: de780ebf76893db43e1a55c54b0c5fbb7537880c)
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/packagegroups/packagegroup-base.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb
> b/meta/recipes-core/packagegroups/packagegroup-base.bb
> index 1f802da09b7..3910500325d 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -168,7 +168,7 @@ RRECOMMENDS_packagegroup-base-vfat = "\
>      kernel-module-vfat \
>      kernel-module-nls-iso8859-1 \
>      kernel-module-nls-cp437 \
> -    dosfstools"
> +    ${@incompatible_license_contains("GPL-3.0", "", "dosfstools",
> d)}"
>  
>  SUMMARY_packagegroup-base-alsa = "ALSA sound support"
>  RDEPENDS_packagegroup-base-alsa = "\

Not sure quite what happened but:

https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/1494/steps/8/logs/step4d

Cheers,

Richard


