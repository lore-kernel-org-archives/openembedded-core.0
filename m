Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 49A906D56C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 12:04:33 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id c12so13712305wrt.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 05:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=wfrLcTF6kyE26VDwoY4X4TfX4M4WbX4qgWvXtxlIgQo=;
	b=e5/JTKJ5nC9Ntv1D61XTLmhqzK3C9K3VSn+1UAZzjUnnJKWU+QuAidrOKr6CgZYysy
	LhnPUCRu0zh9DbT2+a6HmYvjF00l+bFhl5nsFzBwFf16tjMdMezKSg51CHELAZ7TljfC
	N5pcsirOwxkBwzT2avtBn+ikt/gJHsEx0hQgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=wfrLcTF6kyE26VDwoY4X4TfX4M4WbX4qgWvXtxlIgQo=;
	b=rSGLc5gubukF9rS/CMrE4A/AYgf9pnxBciFCWI/dohp2KvtQzFmklgQkzj1i9kBREq
	tQwElsT0TmW/TXLohf+ZBtMI8EU4yzPY2MgEXS1nYbNXFXHBF33anp2T/mgW15jtz2sg
	qmiAKqU3GF1gSsLMtUQB7yM3zfXWzLXfYW1rSq2PwCYmMfgCOuauZyMQeEcTsu5iYOS4
	aEno2txlTLw/r5Xup4tS8fcQJRrs1sUPYO/lrjT4LRQhvcaFjTE38TD9N9geGqsqcqe3
	zTMsvyhYLqGIRHgWDFUtCoa/IDFvI3dPz4cY6ZkyVN0/tVvIf+pcQcA3lEkdn9LIXy+Q
	Vj7g==
X-Gm-Message-State: APjAAAWT7FNH3t9EwlH4gQzD1BA0OJx+p2XZpDcdWRSTJIUekOlMMdhV
	qhddF+Av90tE7qV1yVEneaCxzQ==
X-Google-Smtp-Source: APXvYqxGYlNjsjyIFtDIr/0EdcSvBn//SJRjGX7y23CCEu7WAY5p6l44PipgctkUieweEJeDgYNtGA==
X-Received: by 2002:a5d:4646:: with SMTP id j6mr16154854wrs.56.1556021073911; 
	Tue, 23 Apr 2019 05:04:33 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o5sm13767886wmc.16.2019.04.23.05.04.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Apr 2019 05:04:33 -0700 (PDT)
Message-ID: <ea7f48284d6a55c58ab48ae15dd3b615184d37ed.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Changhyeok Bae <changhyeok.bae@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 13:04:31 +0100
In-Reply-To: <1555797342-76992-1-git-send-email-changhyeok.bae@gmail.com>
References: <1555797342-76992-1-git-send-email-changhyeok.bae@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] iputils: update to s20190324
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
X-List-Received-Date: Tue, 23 Apr 2019 12:04:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-04-20 at 21:55 +0000, Changhyeok Bae wrote:
> build system is changed to meson.
> 
> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> ---
>  .../iputils/iputils/ai_canonidn.patch              | 58 ------------
> --------
>  .../recipes-extended/iputils/iputils/install.patch | 26 ---------
>  meta/recipes-extended/iputils/iputils_s20180629.bb | 61 ------------
> ----------
>  meta/recipes-extended/iputils/iputils_s20190324.bb | 51
> ++++++++++++++++++
>  4 files changed, 51 insertions(+), 145 deletions(-)
>  delete mode 100644 meta/recipes-
> extended/iputils/iputils/ai_canonidn.patch
>  delete mode 100644 meta/recipes-
> extended/iputils/iputils/install.patch
>  delete mode 100644 meta/recipes-
> extended/iputils/iputils_s20180629.bb
>  create mode 100644 meta/recipes-
> extended/iputils/iputils_s20190324.bb

Something changed as:

https://autobuilder.yoctoproject.org/typhoon/#/builders/41/builds/520
(with many other similar failures)

as well as:

https://autobuilder.yoctoproject.org/typhoon/#/builders/49/builds/525

Cheers,

Richard



