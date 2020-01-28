Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6E7819203B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 20:07:09 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id o200so818059vke.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 12:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kTNBsrjlCHauibjkm54JFg8ezZfSinuuqGD+zzJREkE=;
	b=nOac4nc8by4xfV+g+oYAPXoQnPaYjSgRv/oQdFDYIWcxKoJmjKLc3cGKnMte1B0uvU
	NJM7A0mVJkEfkq4ql0JeRk8rMULRBLhK+szwqIJd835ZiIYtHOxFod258Kd8lLshYv8p
	AMOkk86343OA42BEe/GNERkfaQ1kVOYpB04cOWQ3uIhIIKb3ovh8QhdadHqU9HVlVFqf
	m8dls7aqynQj9RdkY8l8DbTWVhEh6njJKBul+EL8uFVcgx3Yq4xaIUjJwLfvnsDnQG55
	lZK9SFcEBh34XdWu1aBy6IqdfPVCtNOPh1rv/X3jp/vyukRIuRzfFTQycsDTJGpftzqA
	f71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kTNBsrjlCHauibjkm54JFg8ezZfSinuuqGD+zzJREkE=;
	b=qYswgk3kNG/3uqZaHynVh1HIpbQT+VJ9Q3+l8XRJupXDdjxeDvRPFhV6rIdnY81a76
	dolv6TVEZocb//zAVZV35XUcEOs2GbcgY5jYb0nqLEBuY2hjVVkgstw0rtM6TYW2b4Du
	wbTFoCANP1+0S34w1sUyuC1t070K57h1NpR+LQdBBfUNQa/mI6PGFdO+Eyfoo8OE6Qrl
	gIppSMlGrB59goAVJC57MkZJHb8CJsIfsN8uBRvj8Lj0v8PLOfb5TLhv1XW6aDxejGXD
	grvC2qyJO5syFEbGmMX72Be3ve+ICtKkgAZ9WN/T8F+mgBTRXNckINMyFkmbZaGVF/j5
	HrSg==
X-Gm-Message-State: APjAAAWA7Qm8l/invJb55X3Cif4J2DrCsCttj8BlnIxQPTcgOjwB2FFA
	9WJIEP4N9h7PzK/am0U1ZBE5s6NymqcnRLLGUB0=
X-Google-Smtp-Source: APXvYqyJ+PCX3KwQCstFS++hg+HtP5rTN6DmMquKjTaZ4tocKi5A/kAkuxXbm89VdEOTjAhdEbezJ9cyZRcT9I4fZHs=
X-Received: by 2002:a1f:3a8a:: with SMTP id h132mr14584207vka.95.1580242030094;
	Tue, 28 Jan 2020 12:07:10 -0800 (PST)
MIME-Version: 1.0
References: <20200122071934.60789-1-alex.kiernan@gmail.com>
	<15178a56a7fff6877d13b52312ffc8b898a60f3f.camel@linuxfoundation.org>
	<CAO5Uq5RVPgtaxUzny-iPCA5L5mBPUW6dmxb0xWRA_c0HSqZF9w@mail.gmail.com>
In-Reply-To: <CAO5Uq5RVPgtaxUzny-iPCA5L5mBPUW6dmxb0xWRA_c0HSqZF9w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 28 Jan 2020 12:06:58 -0800
Message-ID: <CAJ86T=U8DeE1FeOu5X5y--GEGOANVrs7feHGha_kf_TaUdSKnw@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxcrypt: Enable static builds
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
X-List-Received-Date: Tue, 28 Jan 2020 20:07:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 28, 2020 at 4:48 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Let me have a look at that - what got me here was trying to get a
> static busybox so I could OSTree's tests to pass, which all turned out
> to be way harder than I expected; this was just one of the things I
> tripped over.

Busybox shouldn't need to link with libxcrypt if USE_BB_CRYPT is
enabled (which it is in OE's default Busybox defconfig).

There's a long standing bug in Busybox whereby crypt.h gets included
unconditionally (instead of being guarded by #if ENABLE_USE_BB_CRYPT
etc) so the Busybox recipe still needs to depend on virtual/crypt but
it's only a compile time dependency.

