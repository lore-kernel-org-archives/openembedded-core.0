Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 091B77D251
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 21:21:21 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a15so3556186wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 14:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Ij4njA5b+pRcHUHc9vtyKLmvsXKxcsKjq+N1B/0Hd5w=;
	b=cwQqPgpFQg7GHy2ZRbtYVcse10JnQgSjbYlURfE8aOtwPBtSRzjJynexAaJvVMCVKh
	x9ChXrclc4Gb6edpeo6Yvw642RPpbFY40z0bQliiJJt56+N5OZZL/aK7R5HMeLeO0bbg
	5SDvh2CXvnXCZzU93FrMv+uvbwHuzpDY9onVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Ij4njA5b+pRcHUHc9vtyKLmvsXKxcsKjq+N1B/0Hd5w=;
	b=HK4gzrKsZ0hOLtPyWncpHJxtwkbuttWuWjcnYDJ4/aX/PgPLPKayLkk/oPhkF6Ob2g
	nNQmIAAEfRSQ5YJIJ65CU1bUcdJWzyAEMf/t7OuZr9OzJQpUSLCzauniB0+p4B9lSVUH
	cdRsYBvEMmeAepOgBChB6aIwwZBiorG6G4mBSGkKQjxp1uDLqkvHvqFvOcpbKp2OgFtw
	o5eStNqMxoFPL/Lit9wKRZ1BM2f6hEaZlEm3ENlrLLbZd6+Ge+5+E2y7yNdgd/ekY2o1
	hpeUvhBYPT0tbEhwPa7jJgLeYyfcOPMjNNSBWsJjPP8CN7sd0Fzh+jxP71np+Aip4fFh
	sIdw==
X-Gm-Message-State: APjAAAWjCpVajBSqNf6oUyGiUR5L5fe+1kHPF6U94NuXXKItFWKaVlH7
	W8dKNyd+S7R9EpwpxeZuTmaZUQ==
X-Google-Smtp-Source: APXvYqzKKQSx1gsEYHT5ZNT2cXSxXz3gBcjFwlCN/n8/lJQMoQmj9EzczNodfboWKeyeowjB/hksdg==
X-Received: by 2002:a1c:a483:: with SMTP id n125mr580421wme.172.1561584082683; 
	Wed, 26 Jun 2019 14:21:22 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id q12sm37721wrp.50.2019.06.26.14.21.21
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 26 Jun 2019 14:21:22 -0700 (PDT)
Message-ID: <5610c96f0131a38589ab36e6850dd9b7d2d78264.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sinan Kaya <Okaya@kernel.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>,  ChenQi <Qi.Chen@windriver.com>
Date: Wed, 26 Jun 2019 22:21:21 +0100
In-Reply-To: <5647f634-725a-fd9e-3b13-369095f4d415@kernel.org>
References: <20190625221319.102643-1-okaya@kernel.org>
	<4fd505d8-8616-b2e7-da92-6b2be9e3616f@windriver.com>
	<CANNYZj_r7wXtZy2he3y_n5cCXagpWsc+nyheGATHYq3k-dUYvQ@mail.gmail.com>
	<5647f634-725a-fd9e-3b13-369095f4d415@kernel.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] postinst-intercepts: check tool presence in intercept hooks
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
X-List-Received-Date: Wed, 26 Jun 2019 21:21:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-06-26 at 13:33 -0400, Sinan Kaya wrote:
> Here is my investigation:
> 
> The intercepts are executed on QEMU during cross-compilation using
> qemu-wrapper.
> 
> I see that the tools were built for the native architecture but
> of course they do not exist on the target image and I have no
> interest in pulling fonts and such into my image to make bitbake
> happy.
> 
> DEBUG: Collected intercepts:
>   poky/scripts/postinst-intercepts/update_font_cache
>   poky/scripts/postinst-intercepts/update_gio_module_cache
>   poky/scripts/postinst-intercepts/update_gtk_immodules_cache
>   poky/scripts/postinst-intercepts/update_icon_cache
>   poky/scripts/postinst-intercepts/update_pixbuf_cache
>   poky/scripts/postinst-intercepts/update_udev_hwdb
> 
> I also see that other intercepts are doing the same folder/executable
> checks.
> 
> What is so special about these?

Put another way, why aren't lots of people seeing failures due to this?

You're obviously doing something differently to everyone else but we're
having a hard time understanding what, or how we'd trigger the problem
you're seeing. 

We're nervous about fixing problems we don't understand, not least as
it potentially means we have a huge hole in our test matrix. Your
patches shouldn't be necessary as I understand the codebase either.

Cheers,

Richard


