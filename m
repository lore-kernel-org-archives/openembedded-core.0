Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4F7C77D715
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 19:58:32 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id n25so21999756wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 12:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=LI2honrxhBMMJqi90g/taFYeIzOG8fnVU6EijWhtZZw=;
	b=fxURrYigGJVrd8gqxi5NSsn+oIfLtZbTJmxuuSa/Ud8JnTioyF9/fDGsbB7riIyvUW
	wdlRlvC7Hir8NCZjYaz0X8cjNFjWaLZJQOnvSNc9Yvnss1GbInLHr9kRklZFo4//m0mH
	o74hPMVEvE7/0qaD9CeavLjI0dCMOYe/kY27s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=LI2honrxhBMMJqi90g/taFYeIzOG8fnVU6EijWhtZZw=;
	b=dN5POyUz8q1QwBixMpS29tQnGkpnXFh2NsaGFeQRgvV84oCfXYFdwuGAj7hTzOXCRK
	LqosEY5uFViO6HBPFw0gNA3dTYexcbZ+vApscNStW/9kGl3+n/wwolWU5rhN4kWMmBs8
	PPplGthp4oSdVLJhU5LN76nKXS651glFaHKeeILA+dLB41QICfUiTwsV/+05xADVYuV1
	3L+NwbXud0zx5hK3n/bnKzsE2MY8IwpPlFe3zs9PXDkaXw5zy3UIzLTAOUGoPFcSfTAU
	9+6lEjoD8w5P/S+PkSh1y8GONf7dB+CooaVyiQY4QWWBjmEqCkIPs++WR9whCGbvoiZl
	3ylw==
X-Gm-Message-State: APjAAAXJZNaw+fBY0X+vLJfdgdtXb6sA+JC+ZlIzS9jAPwdPlBP3x0nf
	ezajwOUY4oGLdxe4aZ34uxwp4g==
X-Google-Smtp-Source: APXvYqz93LjWkhE1Gcch1q6T7lqjSb6MxH+tqZG7Yxhnds3x/ejwzSnb9U0ZwLgNo04aMAChbR7RcA==
X-Received: by 2002:a1c:f413:: with SMTP id z19mr24016959wma.71.1555358313083; 
	Mon, 15 Apr 2019 12:58:33 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h18sm61237615wrt.97.2019.04.15.12.58.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Apr 2019 12:58:32 -0700 (PDT)
Message-ID: <4f5fbd22080cd09dbed560f250dbfa359b1c0e0a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 20:58:31 +0100
In-Reply-To: <20190415105457.57067-15-alex.kanavin@gmail.com>
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
	<20190415105457.57067-15-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 15/19] icu: update to 64.1
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
X-List-Received-Date: Mon, 15 Apr 2019 19:58:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-04-15 at 12:54 +0200, Alexander Kanavin wrote:
> License-update: copyright years changed.
> 
> Drop upstreamed/backported patches.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../icu/icu/0002-Add-ARC-support.patch        | 27 --------
>  .../icu/icu/CVE-2018-18928.patch              | 63 ---------------
> ----
>  .../icu/{icu_63.1.bb => icu_64.1.bb}          |  8 +--
>  3 files changed, 3 insertions(+), 95 deletions(-)
>  delete mode 100644 meta/recipes-support/icu/icu/0002-Add-ARC-
> support.patch
>  delete mode 100644 meta/recipes-support/icu/icu/CVE-2018-18928.patch
>  rename meta/recipes-support/icu/{icu_63.1.bb => icu_64.1.bb} (70%)

Fails on ppc:

https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/505
https://autobuilder.yoctoproject.org/typhoon/#/builders/70/builds/510

and mips:

https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/510

Cheers,

Richard


