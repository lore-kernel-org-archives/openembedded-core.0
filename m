Return-Path: <twoerner@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8D99777FA0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 19:46:42 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id x47so1862156uab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 12:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eCJXejvhnYzrzeuUq63tuF/fflWWl958oGTnHhVyldE=;
	b=I79pQsU5UX1/AQgFfnNuvi7HvW4i7lYUiZlXg9h3N/alKwGGpD3utKAzS5DMqZZk9G
	v/7De/TJeyxDc/txq0sFFYKAWnNwu2C9KxWP9quX3ZyBAGutaBnuKReuGfQmCUmFOwTQ
	ozUq9yBrkIUnUAvCR/5ZAbo+XcrNEoDTit42CvL9NUxWF1INTMcM7ewGRZ8PVFtIPR0e
	3+ZizGcR0pTBiyLKEf5JePLfhl9EhIV4u3ZXLME8X964jYUBm60gEwTZEZ3+rRTWcaPd
	yZpRDHi4GxCUFqJ08nDJ2NySOJvORMtzDjxoW/xsnP54/vxlB3UzvfwPbRIElyntLvdK
	AWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eCJXejvhnYzrzeuUq63tuF/fflWWl958oGTnHhVyldE=;
	b=CtvIFDQBvBUrtOoC5gKJsi0aOFB8cTxbPsFwJ35vbyzD3sIxc0P4KuYk1sCLaTfjjK
	/2b7iaDF03Lx6nm3J9kgJ5PT4M/kNHjC80u76C/3TTzufnfjx8xIaYq0QJojoDGRWTlR
	bCq/gDc1cBjdli9XZEOkZeQJIHDkM2ybNVhOuq0VpF+w2jKVM+6D3QsEDxabDPHqYjjR
	fdWQ2G4YuXvYaU77tBnspXVMbeCS6G2Av9g1LUAGG6AC/5RUCAp+EsrwW6m5j30KDeTr
	OyiZlrPmRguzEtuZ+BkTOQPB7pYWaZOyg5RWQtPPmosS34olIohpaB6uCDY7U0o5OU7z
	HwrA==
X-Gm-Message-State: AODbwcC0ddWiUm+rEPfSPbEnooL8H3BNszb+WOHKDSvhjofHhIWPjRsj
	n4koXc1nJqXIsjvzABNzJtEpzLHW/hSQ
X-Received: by 10.159.57.73 with SMTP id i9mr2946720uag.17.1495136803552; Thu,
	18 May 2017 12:46:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.199 with HTTP; Thu, 18 May 2017 12:46:43 -0700 (PDT)
In-Reply-To: <1495093256-84820-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1495093256-84820-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 18 May 2017 15:46:43 -0400
Message-ID: <CAHUNapSCAbM38tha7b=twmqOqfJ22Cdw5tH1yzrR74O-uCDhpQ@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] libx11: 1.6.4 -> 1.6.5
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
X-List-Received-Date: Thu, 18 May 2017 19:46:44 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Zheng,

On Thu, May 18, 2017 at 3:40 AM, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:
>  meta/recipes-graphics/xorg-lib/{libx11_1.6.4.bb => libx11_1.6.5.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/xorg-lib/{libx11_1.6.4.bb => libx11_1.6.5.bb} (47%)
>
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
> similarity index 47%
> rename from meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb
> rename to meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb

This is much better; thank you!

