Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id DB7147D72F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 13:04:30 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id y23so8648294vso.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 05:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HnLdkbmDOX7OYOCyaiSE3BjaWrI1/dqGMN/+jZaGE0A=;
	b=FCcDIT+MbPSCV/Z2d/60f5KUL/94+xIeA1Yb1pbrQhgXUVOBRdtgeC8//xp6V3Bz5t
	h7HwGtR3xgWKMaU76C/hBw8GX7YVdj13ZfZ5CCUCrOpmx1lkNYLelm8Gd/5Za5583fJ/
	OabzCcIdA0/oUoD6ihUVXqLvcma2LQF7BOIxhvrTrzCIH4RQBeFygd6iHJcxWpkJFKOR
	9vbWSYlrcmuIKWt/JoYrs9QcFeICmwt4BeeZ6eo0LxGJO8I/OlkE1wbxudlfbgvWcc1q
	yEZBf/dgvDOLxap2J0ENT9GnedHZ6FDc3rXaeo0EM3WEw1hatzpSuFLW/Xg3U/PHekR0
	RR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HnLdkbmDOX7OYOCyaiSE3BjaWrI1/dqGMN/+jZaGE0A=;
	b=WgEHivVnl+ousfgPxV9STHODLE9UEk2YnjYZlpL32lBZyYzAFsV8vuviCAYsphrKHW
	bP7Lq2MuEJutRb7L7g07/98iadM2IZVaj54GSKQFFKGKIcYhGb16OxDdK5Y63ZB8DAc9
	8qI6DvYG1pvQWDrKMHeqzYq3l3MvX0g+PGLOGxiSdzt1KJnGRx1iO0KOVZPHVE2v4SEO
	RhdjxGp8zQ26u19jSkd41RLkqwCI2z81DVa1r6Id+4N9NdJmvnZFRcFoFLByYpH6wJPN
	NuGChmZw8VBWQEzA5nsM6mNrEjYcoa2vnil05dy0JAhysQy2/86BGEkiD+tvqSxS4U2b
	keUg==
X-Gm-Message-State: APjAAAWfkaZM4pb/Ed4Lpe1Ca3oKQwUfpuwUgPq6j0nXmdc8zuz/Dzks
	cMFQNRw45pDfKiOK83aWHZC/gS6fPYSQW1k8xfE=
X-Google-Smtp-Source: APXvYqySVn5GukehVTcUN8pwR5nRkTNAEpWvHN2ujrM1zczsAir8XPXl+0RWRsHVUU31WLO6JVUP7hYR4mESQWWjAbc=
X-Received: by 2002:a05:6102:519:: with SMTP id
	l25mr19503216vsa.222.1573477471570; 
	Mon, 11 Nov 2019 05:04:31 -0800 (PST)
MIME-Version: 1.0
References: <20191109153559.15847-1-richard.purdie@linuxfoundation.org>
	<20191109100710.66530547@seebsdell>
	<5100e289ac8a5c4d0196e8ec77813859bb7a703d.camel@linuxfoundation.org>
	<20191109104619.209d9fcd@seebsdell>
In-Reply-To: <20191109104619.209d9fcd@seebsdell>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 11 Nov 2019 05:04:23 -0800
Message-ID: <CAJ86T=U6Rp5_nkJqHa-9e9sBpiQxn+iiD2khiZ1ZyMqq16c8GQ@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: Drop static linking to sqlite3
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
X-List-Received-Date: Mon, 11 Nov 2019 13:04:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 9, 2019 at 8:46 AM Seebs <seebs@seebs.net> wrote:
>
> On Sat, 09 Nov 2019 16:30:41 +0000
> Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>
> > I did talk briefly to Mark (also cc'd) as he wrote the original patch
> > and he thought it was possibly because the client was also linking
> > against sqlite3 and due to the other things the client does, that was
> > problematic.
>
> It *shouldn't* link against sqlite3. But! The commit in question refers
> to RHEL5 and LD_LIBRARY_PATH, and I think that shook loose a memory:
>
> I think at one point, we had a Crucial Bug Fix in sqlite3, in our build
> system, and if we didn't statically link, there was a risk of getting
> the broken version at runtime.
>
> > The client lib doesn't and the server side should behave just like any
> > other linux binary afaik so we should be ok with a dynamicly linked
> > sqlite3?
>
> Yes.
>
> The issue here was, I believe, not "dynamically-linked sqlite3 per se",
> but "dynamic linking, plus LD_LIBRARY_PATH, picking an sqlite3 which
> caused us specific problems".
>
> In the Yocto environment, I think we're reasonably sure that we always
> get a clean Yocto-built sqlite3, and that *should* be fine.
>
> So I'd say go for it, but if you see weird sqlite3 stuff that happens
> only very occasionally, look at this first. :P

With this merged, we can also drop the hack to force the sqlite static
lib to be PIC:

  https://git.openembedded.org/openembedded-core/commit/?id=6a58e12d19c539deac9e90679a68438497a42fa4

