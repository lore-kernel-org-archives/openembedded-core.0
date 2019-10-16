Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id F09D27E265
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:49:53 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id w144so20960048oia.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 11:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=IH25eFipIhLyfghKxaqxVPIZokdSLLThB5a+yadGfNo=;
	b=FS7Ncdro3crOcwy3SALdX+JOp70ykXjOz3R7gXt+fZLYOyP65UoZ0zI97MuPKiAOXk
	PY2Q2ZuNRQoZcSR6x2RTkEcJP0Ew6y+WG8+DCG2rZ0cFHHSD0wN10eP9onnepjZWdBju
	t5UrPJm8a5fzGfPMeLlRPF67L3PKUBJq9ZmJDUZfJ0WwZtXngFQk8pmSsZ/HUpvDd9sR
	gVtdvidRNzv6NhqeJW68F926Nf+28OfEVoPWN1OZa1lVdp5lzVo0gwQyuQsWQRaEFgh/
	flY1S5vN/pqO2EehioHIAASOrNuNk+68SUZUf2tZNh0ceJI3Hd1Czm/UmDVuFOSDGIoL
	Fs2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=IH25eFipIhLyfghKxaqxVPIZokdSLLThB5a+yadGfNo=;
	b=bKtVu76LKlQbZvDJSNgV6M5eM9+it57jL+SeurxJaJLwn5VKq7PuAjFIk5yg2lYDKz
	ksdYYp/gZIIFTTAQlypQDkkf59GVrhQ69W7YvL8DjM3HNZzcDmtZmMCldn1dUA5pBHRr
	W7S+PNvHx+dJDjf/4HxwMzk8O/3G8PHRvLsTCeiq7JgA0mHkkHYDX+6wchsYpURLOL0X
	YqEHtMdCiJgJ4MRWD599Azydz/+H6l7KKFBowzNzLs75zlyvZ6DpWnwJJJ1iGKXABJD3
	OAKIZ9zLz5zQ/4Vu9BZpaJoDqwyaUlmdk5grmevb75BmoyMM4TWDNQCyRyeTpTvLlqYf
	FkAQ==
X-Gm-Message-State: APjAAAWHLD3rIreZF5YgyIJNmOjqt3s3P32Uc8/YtWp+ECuYR/2MTnuf
	5/4IqV3e7QpSlN9Rn8KbWP/pIjtbsFyX7Q==
X-Google-Smtp-Source: APXvYqyr9Bmyw/F2ggpDq169OFj6rCvQ/Sxnczxc0av2Lln3zgRmft2ZHGkF5P1nJVeoxdgTbUwxMQ==
X-Received: by 2002:aca:c788:: with SMTP id x130mr4794945oif.91.1571251794589; 
	Wed, 16 Oct 2019 11:49:54 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com.
	[209.85.210.49]) by smtp.gmail.com with ESMTPSA id
	n186sm7795827oih.58.2019.10.16.11.49.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 16 Oct 2019 11:49:53 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f49.google.com with SMTP id e11so21076084otl.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 11:49:53 -0700 (PDT)
X-Received: by 2002:a9d:7454:: with SMTP id p20mr32535521otk.265.1571251793238;
	Wed, 16 Oct 2019 11:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191012165433.24511-1-alistair@alistair23.me>
	<CAP9ODKpmB_kkXtd0LZEK-KWaK2VFM_T7yGjdwkyABR0d-Lgsew@mail.gmail.com>
	<CAKmqyKMp6y8hbCaC1rgvHezzHAWTmX6xXtRhXFSSEaNMyoEOXw@mail.gmail.com>
In-Reply-To: <CAKmqyKMp6y8hbCaC1rgvHezzHAWTmX6xXtRhXFSSEaNMyoEOXw@mail.gmail.com>
Date: Wed, 16 Oct 2019 15:49:40 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqN4LQb31QPn5xKzKLacy675H5D9Mqyi_rASRb-sK_-QQ@mail.gmail.com>
Message-ID: <CAP9ODKqN4LQb31QPn5xKzKLacy675H5D9Mqyi_rASRb-sK_-QQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade to 19.2.1
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
X-List-Received-Date: Wed, 16 Oct 2019 18:49:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 16, 2019 at 3:35 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Oct 16, 2019 at 11:21 AM Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> >
> > On Sat, Oct 12, 2019 at 2:01 PM Alistair Francis <alistair@alistair23.me> wrote:
> > > The glx-tls option was removed as it isn't included in the meson.build
> > > file.
> >
> > Why drop it? Update the patch, please.
>
> It doesn't exist any more. It has been removed from mesa.
>
> It does look like it has been somewhat replaced with USE_ELF_TLS
> though. So if musl builds break I can re-add USE_ELF_TLS. I'll see if
> musl works with it enabled.

Got it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

