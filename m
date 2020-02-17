Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 41C1161472
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 14:35:51 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w12so20014232wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 06:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=S47Jg2Ruq7YHML/ZtQqoNWkxbEMMPAl7zKAg8ILBO9s=;
	b=G4CTlIXu/6rPHReNrl+n0XUT/gBVjpVl43p51sUbS9cmAsJ06QKgwSpfTGggCIefT+
	v2k88qr99aw7BCklkOgN/OyXcAUKCLYHAnXK0lM7m5W58ZJ3zNg7rfHxmnh9aEzRGTbm
	uQFegNgATT289g1yOZOByA5S1ZFjO7UCAQtDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=S47Jg2Ruq7YHML/ZtQqoNWkxbEMMPAl7zKAg8ILBO9s=;
	b=kh8Sx7rQVMEbTT2El94MVCB+0giTd9se7aesH2oh8aIE1ATT6fMUFiR1+sqaFkLupw
	W07ebQLitpA45oUkmZdWtslNvsErNAy5mjEGH+NOmROENzFg2KCNn3+VuiamWnMek0j/
	V4yaIePmPnc/rJZL+v/8f/qOosBE+G4wDscGPVlg7Q9s+e4Bg5zJ1ryZpBMaVmCV7Kow
	FwXaOUKODtZE8p+Tgz+ujAdeaIZr8R3LhjpcoacVwG+A8tY+4pdHH5BCqD657clSeggk
	075NfC7JljUo/4rO/l4i+kE4qK5DsvqRAJb8VsaCoCNF+fdDlsw9WIThbf4XqBYmGeGY
	NRnw==
X-Gm-Message-State: APjAAAXF5DmYK2w2kouz9I9vmUtYwJ7kIinUX3rtzouaezdGuI85f4uC
	wrOG5nSxbrXiv+TM5ulKOoKrLQ==
X-Google-Smtp-Source: APXvYqysXC43RVv2/peWKH8BEbBC21nLn0wyPeBnb950+SUUngN/2jZwgTvWNqsSOHcH+JT4joJjGA==
X-Received: by 2002:a05:6000:10d1:: with SMTP id
	b17mr22349489wrx.298.1581950152809; 
	Mon, 17 Feb 2020 06:35:52 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t187sm903610wmt.25.2020.02.17.06.35.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 06:35:51 -0800 (PST)
Message-ID: <aceb5729c55050e1b1c9c62a316e500e621e33df.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2020 14:35:50 +0000
In-Reply-To: <20200216155015.21738-9-alex.kanavin@gmail.com>
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-9-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH 09/10] wayland: convert to meson build
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
X-List-Received-Date: Mon, 17 Feb 2020 14:35:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-02-16 at 16:50 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...-the-native-wayland-scanner-directly.patch | 27
> +++++++++++++++++++
>  .../wayland/wayland_1.18.0.bb                 |  9 ++++---
>  2 files changed, 32 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-graphics/wayland/wayland/0002-
> meson.build-find-the-native-wayland-scanner-directly.patch

I pulled some of your patches into -next:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/718

I think the failures are related to this patch?

Cheers,

Richard


