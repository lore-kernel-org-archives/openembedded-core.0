Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7245B7CBE3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 21:19:42 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id v7so2788980lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 13:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kPH8HOEM6DRxhCZSxVwvnFj9BvaOykQVaH4MNpktGSk=;
	b=dq9zxsqV8iJhElv9IyD6b+Dcpi9I65ux1noNyrGmvPymNf4JstG5/CcPnLkRPrOVIx
	URKKq8Ry2AQbfcNO+rMQBXsia200ektaxRGFU7KiF77o5zbCo7OR5dPR09QFMUwFMy3v
	WDydBX7UdgRHMFx3wFybZmaWmDUZ8LOSlhDwBBiJPPJVRz1KfYemiTfQc2P1FoWQoUAL
	hZszaYyjNWLCgrDgqlDmrNyOpYFkgtHtjO4CB/fym3zawKKQTMk49xDFqroABmlxbjVl
	Zgyx1SLCmY14NJRAWZPKD2u+spTJi1M5tzCe104RVy73Vvcsi+SvS5e3zh2R5eWzpVRi
	5bXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kPH8HOEM6DRxhCZSxVwvnFj9BvaOykQVaH4MNpktGSk=;
	b=Pk7GSOGnYl0AZQRThHnrO3msG1zg9egXU12HjwDE0EEsSf5D1gkibNcU7EZHzGi7Ls
	gh3Aip9yGiH99cbW3exOrZaR6ZIqnGjN+lvawz7Bozf2M9axwXPKBYNM5otTYr/m1Lg+
	EBew2WoWPW2cWHmwyA5pRWnkBB1rebRZ6Si+A/hlbmHk/7x0Xuu6LoawdftC9IfOt2bH
	h6o2n3/nV3sP/v0BQEdRrU17kNyxq1wpD6mCDYNIbbFWxmiPT8hHEi4YJupR8Afa7C7Q
	zC0Fr5rPZ446uxlB6zxaW6WLM+7UXg0+SAEdkLpbg7l/UxZbzRXFMa+PNAnkBL+tpDNl
	N5Zw==
X-Gm-Message-State: AHQUAuaxxszojn76bINBcKkPqAO0u897HSfmvdbKDlrcMZkC+A1S5bHf
	5JRG2K8EJ6FCTYd+mfNEESYa0Z+CC/0zQW9h1tg=
X-Google-Smtp-Source: AHgI3IYV7YlHvRWYVeWUYaiMvP+MPoR1DHoonIhFyBMHNJdy9N8zQ69tVQGUjodLNpuLzGLNDuU4nimEwvp9n0Ih/a4=
X-Received: by 2002:a19:8c56:: with SMTP id i22mr2753199lfj.79.1550870381221; 
	Fri, 22 Feb 2019 13:19:41 -0800 (PST)
MIME-Version: 1.0
References: <20190221235618.29059-1-marex@denx.de>
	<20190222010654.GN12379@bill-the-cat>
In-Reply-To: <20190222010654.GN12379@bill-the-cat>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Feb 2019 13:18:48 -0800
Message-ID: <CAKmqyKPtjA1fhAst0HaMfNrVEE_8Btq13XNqbU8JGu4EgzoM_A@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2019.01 release
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
X-List-Received-Date: Fri, 22 Feb 2019 21:19:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 21, 2019 at 5:07 PM Tom Rini <trini@konsulko.com> wrote:
>
> On Fri, Feb 22, 2019 at 12:56:18AM +0100, Marek Vasut wrote:
>
> > This upgrades the U-Boot to latest 2019.01 release.
> >
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Otavio Salvador <otavio@ossystems.com.br>
> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Cc: Ross Burton <ross.burton@intel.com>
>
> Reviewed-by: Tom Rini <trini@konsulko.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

I was just about to send out the same patch :)

Alistair

>
> --
> Tom
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

