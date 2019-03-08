Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id BBB9A6D545
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 17:49:38 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id z25so22118063qti.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2019 09:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Iv+KN+9lWit/hVeoD0hUe2QG6Mrm+/mw1NyM0pGNv7c=;
	b=cH+1dXGUjyyfPmTR7SLaYEm7ZLnobX3ihEyDKcPNwb7i83bQ833gpglCmuF22PYKgY
	nRCNSox/u1v5SolGg3vpytq8h90idf4+VozgibRjQV94tbvDGn2Gfo1BaE0RRlsuUAtV
	m/jR9+LsIn0CpGoug2joAiDUbEyL2XNs+oJLvo0YbbvEfIsy43XBWytfDQD7A4V8q/Vx
	AwTNv4OY7x/nt7a7yHqrV7TwiRjSPCasNbm+zXMZa9ehq/2bGeFmvkWe3/OvYL9oi6eI
	j6oqc+8aFCAXgtHT/bI/jWVjmK3AqnbIiBIJPRX5UC/bbHwQZMyZHxOS/tzq+StinMlS
	UmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Iv+KN+9lWit/hVeoD0hUe2QG6Mrm+/mw1NyM0pGNv7c=;
	b=lEaEDVAKtvc5pRasuAjzaDle0jluoSJih5oXTXMgQrCr+KB5l1u73OAprkS2oHKISs
	uO72PUpkXtHvzlC2A6JV4AaJLTW1p3SdPeHQtdk4aZpN9VFmw2rLUu/4FblKKraCYRBP
	u2dj83bmRPnhad45ZSols+LcW6m8Ydt5sPdjmn6+2FnQWVxhAflYwCHFrEx+sV5d1nMD
	jXPwhu714gJjqZW6l/iY2okzG1JxVgPGohxuPJPByhCQM250I9LFLSuTGLod7Dybkts9
	H8r+tTVfU0/5ndQGaPpbPvt69AwaQlydsxNwwmXiR2fYIZmEpaksbUiryhhqOmJMhmPJ
	oYgg==
X-Gm-Message-State: APjAAAXTyhrZ6NZfAUcgxE1iiFYmdTqhAbobWVgMhZPwuKAuqOCJ2Ow0
	m0kV+nudQfb+HE3qZKGEIHvICRb2rKLI/nozsxw=
X-Google-Smtp-Source: APXvYqz32/NxVOyZVk4s6jkX7k1CnqAZ42rNfoX0ubRfIZNFZV/rbsBym7UuoRPihufYcOHysWjZML8t5O7b6ObgR9Q=
X-Received: by 2002:aed:3a09:: with SMTP id n9mr15365006qte.196.1552067378989; 
	Fri, 08 Mar 2019 09:49:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1551889557.git.bruce.ashfield@gmail.com>
	<ae97e09579b59253aec08f5b8118e739ec57c4de.1551889557.git.bruce.ashfield@gmail.com>
	<CAMKF1squopTO1P=cN2ky2pEeH_kGqkW-HxLj=nm4QsvBhv6Tqg@mail.gmail.com>
	<CAMKF1soy7Uh+kXRXgsya9+qwJxfjHpT0VW3+bBFCU76VoZ-YKw@mail.gmail.com>
	<20190308144808.GA22638@localhost>
In-Reply-To: <20190308144808.GA22638@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Mar 2019 09:49:13 -0800
Message-ID: <CAMKF1sqMi9DtK6-7t9cZ8PeAy3Bj+hcz-9hHFaoVSWmH9MV72g@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] linux-libc-headers: update to 5.x headers
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
X-List-Received-Date: Fri, 08 Mar 2019 17:49:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 8, 2019 at 6:48 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, Mar 07, 2019 at 07:20:15AM -0800, Khem Raj wrote:
> > another one I forgot
> > https://errors.yoctoproject.org/Errors/Details/231924/
>
> The two commits from
> https://github.com/miniupnp/miniupnp/issues/346
> should fix this (untested).
>

right, I have staged an upgrade past this fix.

> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

