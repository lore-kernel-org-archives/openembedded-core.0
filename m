Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id AA6D57E947
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 16:00:28 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id d17so10993534qtj.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 09:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WeZZeDKkktUpB9wZXy/jYRfJjdITk2fQtoN9mCiQUQ0=;
	b=Jzf9AX1kfODtIsUjW2xzjpL1MW8WVyOaMI0FlKUCSa6jqk3GXkPKZI5jhQBKF8s+8n
	pO4YBqab2CK2SFKNH3IgW9NnLb8/AaDTDWScfM4aTkxGlAcKtoPB8/MgZzcd8LYjKNCD
	/IOoEpMyzeWy6KC4eRhrQzAL29je6tx20ehRY/b+mkfuPY0V0clLf8DAFfz4faFLqbIe
	m/wdJoKE0UDThHacjokehXePApXyddFoqPQYfknNWcEE3KnFgIiuKrC+Pg3X/+VFUJ/a
	zQ6leo92ozd0hMoCHC6S94Tfue1NJ62Uz5kbmYs/ERBDtp9KRJyi0zDyVu5xZf6ktgsN
	kPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WeZZeDKkktUpB9wZXy/jYRfJjdITk2fQtoN9mCiQUQ0=;
	b=b2u3CjiNcg35qFbqtDyD2ouZtNiDjkGuciVZ9KhScRHnwAq3bTx6Fj2TBy4UqFe1FE
	nSWgn7CwV7EY6kt/QJa2Bw//F1kCinUydGK0WtJNGr/394IdWcM4JzrFRGDGdWPPO21J
	VHvYk75j4UqwWRiWr26oGCagfpb/6eRWarq6HXjlIvOEYm4H0xJXf42CPcFSUofAsQHS
	JIqqdC58aa85Ox9ZjeJsvJCDPv4oEkn80cCzdVn/DMVALikHC05mcS4Z9tklIkrn2yVk
	yiO/cJ3lwm/6+FXWBO3ge8LLRt9VO68L7ivYg7YcweLq4Aqfl89Rsv2q0BkaKdzOazJk
	+QKg==
X-Gm-Message-State: APjAAAVVsJNoR4FhVrUKvxEKk9t8mpYbyp5cT+NgML8O9VENyTc0VuuQ
	ieIepdunN+W7wE3YOhyoSmA7zC5mVa9gzU9UccgkGabj
X-Google-Smtp-Source: APXvYqzxBNdSPmjqXJS9HxI+wpwIKwnUu50B/ccMDFe0LAm77vAbJ8gTqo1CzOWQIn0B1eUckhv345+kMvKrPwhYbVk=
X-Received: by 2002:ac8:e05:: with SMTP id a5mr66191862qti.53.1560873629409;
	Tue, 18 Jun 2019 09:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190618104735.25849-1-ross.burton@intel.com>
	<CAMKF1spb0ouiuW+44jvXqbBYOa5TAw2cbabmQmuTo0z4n9BLZQ@mail.gmail.com>
	<CAJTo0Lbd2r1enJ63_ubhXp6Ny77dgvrUqhiCPSfeqNYV-pL3zA@mail.gmail.com>
In-Reply-To: <CAJTo0Lbd2r1enJ63_ubhXp6Ny77dgvrUqhiCPSfeqNYV-pL3zA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jun 2019 09:00:02 -0700
Message-ID: <CAMKF1sor0rn1XTyqZ8FvJDzzbc3dBMP2wCjOhGXC7Eo4NGuzNg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binconfig: don't try to fix up .la files
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
X-List-Received-Date: Tue, 18 Jun 2019 16:00:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 18, 2019 at 8:55 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Tue, 18 Jun 2019 at 16:51, Khem Raj <raj.khem@gmail.com> wrote:
> > while I agree, are there assumptions in the recipes using binconfig on this ?
> > especially packages outside oe-core ?
>
> I suspect that everyone is using remove-libtool, because that's one of
> the default inherits.
>

I see, that makes sense. So it was just redundant then

> Ross

