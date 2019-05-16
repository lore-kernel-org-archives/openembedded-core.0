Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id EB11E7DE7C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 10:55:00 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id f8so1457168wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 03:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=4k5m5H4RbD+kMSlNvNd5jP7Jld3ZUr1nG5ustJtkrrg=;
	b=DtHZPuTjFaClWX8taN051NM+4YyEqqF/JOecV/Yu7HZbVkqTkK4rvo0ZqywQ/gTeti
	6sCICPp2cgvL2XmF0J2YFePAxn52+95vG+jpY6OecRQ9wPw3xN57Kmw/Zhg02JON745s
	MYo7JNXFsrIFd6I+BReywOEtI1dcE6R7SlsT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4k5m5H4RbD+kMSlNvNd5jP7Jld3ZUr1nG5ustJtkrrg=;
	b=uBp/A75C/BRrW21fbRoeJ5ZGWDfuKwLJlq6J6VkC3H9oPtdu0YodON7m1KPwZNSKz4
	H4/f+nyto4KeIaDAPhVzetjcEDa7214vN2mN9rPEObcidxEhFqVz4XXY4vZ5Q5EoSL17
	PCRdg+pIJm162kIZfL7R+5Jd7dZcthm60TWcnfIa8GTX3SldbWPoCQPOJRd+qJRE5B2Z
	oePlE3mf/8Q26JfUI22i2gGT7Mm1dmCKWir/dbvHkKEephuIRl2sgGJRzOq1rV1vCw5u
	/B8nuIxFfIGhMxx9jh2Bemy1/sO7c5Bfq7PC0meqXDf618H8J5iVshDz9N254Bi4+kA0
	2kyg==
X-Gm-Message-State: APjAAAVhwdyh9/2CTqVDZWr98xnDarfb9FqmJwzh4Njg5Z2IUmLFX5Dw
	tWK2Nudf6TQGa63X0C2EoeYsqw==
X-Google-Smtp-Source: APXvYqy4tfEECclF6Dc3Uc4RjzmK0C0FLa358loED1s0GIkDUcd0WTp25b9fx2KPLrZnXyxOyDhd3g==
X-Received: by 2002:adf:dd09:: with SMTP id a9mr28154247wrm.228.1558004101689; 
	Thu, 16 May 2019 03:55:01 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w185sm7319860wma.39.2019.05.16.03.54.58
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 16 May 2019 03:55:01 -0700 (PDT)
Message-ID: <46f68dd583b461731b675936391cd031d8331cf3.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Ming Liu <liu.ming50@gmail.com>
Date: Thu, 16 May 2019 11:54:55 +0100
In-Reply-To: <CALatG=6FxLPZi00XyRWrbrcsZcnYxjqCJ_ogJK_7q9BwLBWLtg@mail.gmail.com>
References: <1557948156-10879-1-git-send-email-liu.ming50@gmail.com>
	<9c2a9bbda97c6540061fd7a945f9d3eba0f1453c.camel@linuxfoundation.org>
	<CALatG=6FxLPZi00XyRWrbrcsZcnYxjqCJ_ogJK_7q9BwLBWLtg@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>, Luka Pivk <luka.pivk@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: handle UBOOT_CONFIG in image.bbclass
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
X-List-Received-Date: Thu, 16 May 2019 10:55:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-16 at 10:56 +0200, Ming Liu wrote:
> Hi, Richard:
> 
> > I'd imagine the code is designed so you'd inherit uboot-config in
> the machine and this therefore could be made to work as is.
> 
> Yes, that probably is how the author intended it to be used, but
> unfortunately, that's not how it's being used in BSP layers, that
> fact is, in most BSP meta layers, they do not put it into INHERIT,
> only u-boot recipes are inheriting uboot-config.
> 
> I am on board there is no need to set IMAGE_FSTYPES in uboot-
> config.bbclass, maybe we should drop it from UBOOT_CONFIG and it
> would be like: 'UBOOT_CONFIG = "config,,binary"', there will be a
> empty item in the middle, so the BSP meta layers would work as usual.
> 
> Will send a V2 if you agree with this.

I agree, I wonder if we need to make it warn about missing
functionality if someone is using the old option though?

Cheers,

Richard


