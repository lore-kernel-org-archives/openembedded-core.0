Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.4758.1597299256606528055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 23:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=j8Loqvhv;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=pkdr=bx=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4BRx9J5NZ9z1n;
	Thu, 13 Aug 2020 08:14:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1597299253;
	bh=RCY+R4SjM4uIJZC2rlWvHvlUnXWhXIMPUa9DMPZNpxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j8LoqvhvO/yzIvUpBKxnfp60CI8xjGjiBx5S0WXzXbkssG63cUNMHsI6jNRDhsk3f
	 tCMPXnZow8bBkG6sMaFSpYVFN2011fBJuli/G47hYob6KPZ8IY4snHOGYZe0sNOosT
	 n+ZdSx/U3CmTD4m7N+utKiuLDv7MxumL9wUI/TyqEG3w8n2/9Zu974ndU+fJQrc5H3
	 UHnmJOaxBeyynURJYXB/jnEwtAYu8KEnkD581rS8MTJcOhLrl0lN4MICQ8iqOXIL84
	 x5O26poq5wjFDYnc0fWL/EX383qsA+hkiTY7fgwCjtkpTv7GTLxLopiLMMngL+tgCD
	 co/twMG1G1SvjZbZ4ePM4w7DRzL40aS4iQuiA6I5vkZ+kZHkuL3mEcg3B6IDWtZraM
	 5L7XTBS1L0sp30YFHzJproBtZQSpnCgQx+oLwB2aippq6BMEijmliOtK9+f67J+wwE
	 oFuCtrxjW/rLTZ6JYeigqx6l6LvoEWMqh9k/D7og6j1ErY7cxP6g7lmZ9BAye+5495
	 4ASTW8NpnVbVrVdqJfMkdA89uYbbn8FyTuFkAy1ijO7+UMNs/bTdNRKvpTsXdm0LBY
	 rDTgbWqbBzm/LxiunkEHzc1yldEKB/CyZzWVu8hlEqz4IuKfkbqDi6tiNqyFcKQvO/
	 MbL54oJlDuA341s1H7S+ZNLc=
Date: Thu, 13 Aug 2020 09:14:10 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] webkitgtk: Upgrade to 2.28.4
Message-ID: <20200813061410.GA21506@localhost>
References: <20200811225759.618503-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200811225759.618503-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Aug 11, 2020 at 03:57:59PM -0700, Khem Raj wrote:
> backport a patch from master to fix clang11 build error
>...

Is this related to the upgrade to 2.28.4 ?

The 2.28.4 upgrade should be cherry-picked into dunfell,
changes required for future LLVM versions not necessarily.

> +Upstream-Status: Backport [https://github.com/WebKit/webkit/commit/c3cf651016e4cdcb4350598d4a586821071f91bf.patch]
>...
> + Source/WebCore/style/StyleResolver.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>...

Comparing the upstream change with this, it looks incomplete.

cu
Adrian
