Return-Path: <ricardo@foundries.io>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id B60FA7C160
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 15:25:51 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id z23so2722522ote.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 08:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D+ZPF0Miy5J1C05I3th34OczdhDEQ4pEh2UqlD/+YoM=;
	b=MhSCxuxrY07KJesG0u5DsH781S1n4ko7GcPvRV0++T3b36CqR1kGHhuhsyl5qEP68S
	9EUaZ+MHt9lJxHBDAexqZ8cy4dYiV1xIeRdhLXYqVyojmKexdx+67Q9duYuL+DgzMt+E
	j+3E4K1N5Q3cdkayZ+1kM9sEzJTHwM7FYQRjCdseJu11sd0WsIgpp7zHmNSk5XOH7JVm
	WTUtDRMrLID5GX4MPzf4xzuzGrzkjTnPmB9UgqeTsjchjqyq9IsfAczT7g4FeXOXGnPu
	nYF0355Jg32b0+O0keqQAaZ5HFGz+kZXnnybycv6XX2IlRkTH7Icdnu9sfNO83rlhHaj
	MTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D+ZPF0Miy5J1C05I3th34OczdhDEQ4pEh2UqlD/+YoM=;
	b=t39yVeug2ypm8cshmeuBZhCm5zwQo1fnkBQ+jWz2XE8LwXQDZjZW1jV/EyFhbKiqca
	FDPWChTkQVO7MOLMgjVqAN7Fg3kHNt1S0eSmoF048pIxNaHR/3qQkChgNmgYMcJa8R94
	D6HHetsuO77qA+RtEJL5QSSVX3POgfLHtgJPZSnqsXVivts0xtD4AtFHoMnIyJ3wYb3K
	8Z0ktPnFE6nAbO4ALUpM8yvLp35IOCqmoW5mazVhxOQ+dAF+poeNxfXfScRP3+8y2tjv
	fDystY1w8sY28hzL8AAVq8t7n6hmxDqimPtvgRaUrna5OKhvXxswRogsac1MvOOWbzIj
	Jq/Q==
X-Gm-Message-State: APjAAAV8gB6srUeY3M3O+IG5J4JyBj6HM6Mnp1uJuUQJejyYSoAdV0Tx
	A+kCbChdYntpX9kUnrKwu+Fpe6B7KPFqh0ozZjK/
X-Google-Smtp-Source: APXvYqxdonv6lzCXEK3xRAS3TKAgWjrvZUxffnBBPSrJoU4BEcl0JNhxgh2f6H6fD6i8xFDGlvdWkrkNnJVL6UZnc+w=
X-Received: by 2002:a9d:6f84:: with SMTP id h4mr7216015otq.354.1562167552568; 
	Wed, 03 Jul 2019 08:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190326180735.26818-1-ricardo@foundries.io>
	<CAMKF1srhLjy9OTWwUtL6Df0Zo68Kq_Dd3wfAB2PDL1o8i0-H6A@mail.gmail.com>
In-Reply-To: <CAMKF1srhLjy9OTWwUtL6Df0Zo68Kq_Dd3wfAB2PDL1o8i0-H6A@mail.gmail.com>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Wed, 3 Jul 2019 12:25:16 -0300
Message-ID: <CAAaKDhGfO5Z_1cgxxg8XHYB6r-xoYoSzeDeD1tKi+CbC6OfA3g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-8.3: add back GLIBC_DYNAMIC_LINKER riscv changes
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
X-List-Received-Date: Wed, 03 Jul 2019 15:25:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 26, 2019 at 3:15 PM Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Mar 26, 2019 at 11:07 AM Ricardo Salveti <ricardo@foundries.io> wrote:
> >
> > The riscv GLIBC_DYNAMIC_LINKER changes were dropped during the gcc 8.3
> > update, breaking usrmerge support.
>
> ah thanks for noticing that, this should be fine to apply

Looks like the same change was dropped with gcc 9.1, will send it again :-)

Cheers,
-- 
Ricardo Salveti

