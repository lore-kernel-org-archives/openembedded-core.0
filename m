Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id BA6597C8ED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 21:19:49 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t18so27749137wrx.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 13:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=g9sruZU+D07MerBpOCMGwZHYNViF1PqL+KaG9X3W1Ok=;
	b=dJ2j0sllvjyF7IG3EdM9RgjAzI9KMNdAve2ez9lJgMiaVgpWlnarXDpFm4tA047Og0
	XVNHLVYnw97M2hmTMEXWYWmty6eWPGpB35Rhlp6FU10RiWuQu79Qe189dfGx+AhWaMiB
	z4+H/D0mmseYUxAEJJN/MPcfwKWSzW+hKBD2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=g9sruZU+D07MerBpOCMGwZHYNViF1PqL+KaG9X3W1Ok=;
	b=UFtok+DaEAgzUrcnPD2XT2jrjki+IYegHpKHCD7tvA0ltURruYumLeOgxGnbctRYhF
	a7xm2jcyB/kuYhydVexwhgbfJVig4hv4PoemyxiK0IhisM9x6NjDUr/HuD35a3HOTUzl
	20NMBsUkYpX2kyI8KW2Fupifmq9567ItDfTohlqiw26tB+pw4bg4MlBtWW6FdVYRUgsP
	uz6s+Wj0DqWZY44+Y5bs5+AEIFlck4pGahZlZVWNUFttazTvCah2D9TwDJpSKHQV1gXr
	zOkDnxpHOWMdv+TsyZ+WI9IUScNxLSIQbmdIEUML17NAUB0Y1TJvTA1knowO5+SRngfR
	iLbQ==
X-Gm-Message-State: AHQUAuZkwcKmM5Tr7gejIBnmiKmWtgIaO7gfvx0elq951oJkXxMRK4+X
	HDTa+J0fjg7FtWo5bkbom9C2rg==
X-Google-Smtp-Source: AHgI3Ib1WVAlfJKcMG5/EWz4D5g9RWnB3OXWhe4MfpTRn/BDcQ6rnK2UGcHNalJCLZFDAb7nPJbPOw==
X-Received: by 2002:adf:e785:: with SMTP id n5mr14854211wrm.96.1550697590511; 
	Wed, 20 Feb 2019 13:19:50 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v196sm7127686wmf.15.2019.02.20.13.19.49
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 20 Feb 2019 13:19:49 -0800 (PST)
Message-ID: <0c2edcb16a71826e1ab7486d76c8a6c35fbd66d1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Feb 2019 21:19:48 +0000
In-Reply-To: <CANNYZj9PO4jPdkesW0t3hRUAx7Jo=m01G7a67EUChRjLfUS5sA@mail.gmail.com>
References: <20190220135043.25837-1-alex.kanavin@gmail.com>
	<7e7bf60a91548dc0373fd53b32baa28f163cb86a.camel@linuxfoundation.org>
	<CANNYZj9PO4jPdkesW0t3hRUAx7Jo=m01G7a67EUChRjLfUS5sA@mail.gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] pango: convert from autotools to meson
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
X-List-Received-Date: Wed, 20 Feb 2019 21:19:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-02-20 at 19:15 +0100, Alexander Kanavin wrote:
> On Wed, 20 Feb 2019 at 17:43, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > and I think we have a race:
> > 
> > http://errors.yoctoproject.org/Errors/Details/229403/
> 
> Somehow this link won't open here, but I think the race is this one?
> https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/310/steps/7/logs/step1b

Yes, accessing the files whilst they're still being written?

Cheers,

Richard


