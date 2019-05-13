Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 204E56C149
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 18:00:33 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d10so2529519qko.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 11:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rx4yUjAjrsmJS1MGqNmRFvm+W5V6GX2z9atCe+1hEMw=;
	b=ZNmOhpD6my9TynpyDcdsgtY7J42ftmo5K7hCFtKWnifv+5snK5JF5Ukabu5FX+OamE
	PGNFDjOpElFLMUtkfGMkAZhA3LseCR2soqUvU2puOysac/c5SFkswCEgBakb0WePi5I2
	/9kYadBTvZBmQAGGQkUBwjLI1egLOLqdfUCBQgKdJyuU/6Dyqr0RY2wTzSs7BRWreEPC
	NJsX0VDrb2SKMHB1/+y3wzzxbKeyQgFvt4TYjPu/JT4tWA7gIq/W2o89lm3XmlRdAiY5
	QhHR9Szrz3oo0FGfgTMHz9YHNkgTgP53/SH/MnHJDNLGQwq5sEL4gLU2yVubA+wjVweU
	rDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rx4yUjAjrsmJS1MGqNmRFvm+W5V6GX2z9atCe+1hEMw=;
	b=puo64wWIjS+naAXeJWHDiJwmFE6NH9ScYVzCfnGzqeBM5tPMxbLpTTioNHqUQM1do0
	w6oiPjX++ctO5XL9EyK882XFdyvozSulMV7p+7W3jTKfOXFv1Y8vRWIIwP9nmyVqICtE
	ZgJ1NtjFcflCQK2/zZo1U/kctJhkDHwUK7AT5mNXKB6pr456LUfC/5ob1dCji1bJLnSz
	lRpeYQ5RV4ZVO5I3X7bxTGBlFRs/+Gef1S6Xe3U0cNhZ8DMW5wBMh+vwvyxsGOpw0gPf
	7vMfG2CR9zBzYNn1EcT83ZxHetn7UUxbx1qoIWa4JtFDTinLg0IBb+vQbnR3krBsiezi
	Z5EQ==
X-Gm-Message-State: APjAAAXTLgYjRgeJeW9H6xeOsfdUku2rBcMAeq4+5MTBMo1FLKjjIhTh
	4aXzYO8UNfYaG6m+bqxEbdOA2i9vuaDAWOObCf4=
X-Google-Smtp-Source: APXvYqzDMWse+qKAaRvq7UJ/ptv+N6kLtiF/AnQbm7z130ADmZ9MyPE7C7zd1YRrFg62CI5YUddN/qRf3Tptca5mClU=
X-Received: by 2002:a37:6445:: with SMTP id y66mr24528474qkb.102.1557770434644;
	Mon, 13 May 2019 11:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190513153303.50095-1-alex.kanavin@gmail.com>
	<CAMKF1srh_U0ge_1VkPJ0TAS6hKPkybyADUXaTp7SqRnFCmPm=Q@mail.gmail.com>
	<20190513174546.GA19390@localhost>
In-Reply-To: <20190513174546.GA19390@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 May 2019 11:00:08 -0700
Message-ID: <CAMKF1so2E1ky78YqY5gnO4LHynNLsoYLopox5jnBn3_Yk6RXMw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] qemux86: use a Core 2 Duo CPU instead of the original circa-1993 Pentium
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
X-List-Received-Date: Mon, 13 May 2019 18:00:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 13, 2019 at 10:45 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Mon, May 13, 2019 at 08:54:50AM -0700, Khem Raj wrote:
> > On Mon, May 13, 2019 at 8:33 AM Alexander Kanavin <alex.kanavin@gmail.com>
> > wrote:
> >
> > > This matches what the qemux86_64 is currently using, and
> > > will allow testing the instructions added in the meantime;
> > > particularly various SSE extensions are now enabled.
> >
> > While I like this change I also worry if we are leaving out any significant
> > x86 implementation out there in embedded space x86-64 is relatively newer
> > compared to 32 bit which was long stable
>
> Intel Quark and AMD Geode LX are still available to buy today
> (Geode for at least 2 more years).

I think they have their own BSP layers, so they lose out on least
common denominator here. I don't have strong objection to that, given
that using core2 is going to enhance our testing coverage quite a bit.

>
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

