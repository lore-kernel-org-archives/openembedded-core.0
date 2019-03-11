Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 710C47CE4E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 12:40:47 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id z25so3890812ljk.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 05:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sYNDH5oETONa/16ACPkHfRnFNRP6nIRokZ6zSPK44Is=;
	b=ECNO6TOBCI2bnjPJMEIM0Tg9Frf7AczDoWZFgTsjNSIA+BQvhydEuDcpGREFkOfttJ
	6c9ABE3g2HYRIdopRYuNxJwZ9uWyryOA/jowbIpP7dx2N9Ch1dhJBWk3ALQ2PARA1zWA
	5xVnKaXkKSaCxOWno8eoKPy+x/zF3Fl0jOMDLIjUZto41Jwr3QmvH2L9dtuzscuZSdeQ
	rtxsIlmmTJDKS9WSOvIEndGZf2AN/4c1q34+bEpeTwQeX7uJU0UhorIuiWzamYSoy8/o
	ctzs9+tDy3kuMa5L78WYIvp6urfGV3XH9w0bnlD4C+z42JEIDJpySeMrZ1G92z9S+A5C
	WXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sYNDH5oETONa/16ACPkHfRnFNRP6nIRokZ6zSPK44Is=;
	b=NwvqXnu3a5TZCwFjVNm7TiXMUzJsDhZ4zMLLOtpUGHu8jbyo56UmBHlwSHpTNlQjii
	BpjeeGe8azkhrojP/G/xlhqm1Xm8yHXOc/mlJm/nYlmHPjui1Zaw8t/Yqz/5CWzfPlNV
	SxO7RVFyUSG78u8CLGlWJzn5EDoki5TKuOYD05f68mq+I7Cg0Ed0i5+6dUGDhYiSOTwZ
	1DpA48Ze2z3DRoxe9+kPDQcTfuF1nJk6SpJGdors1PrNUMpBrabLjkL9oAwldMfCLvFo
	bp31QCSPXkb+8A0zUgOdQuk7i4jdqeVmoP6fIAp2sWaWg9H56i+7K0xMz2n6hgPbiW0b
	lJvA==
X-Gm-Message-State: APjAAAUdWWngB7l+SI6jU/zZVyqndvE8fMHcb7IpFWG4bMH3WGQxnRyC
	U83Uiur7HrwoqVrz5AZqWaL4SXKKo6vNhDOFXy0=
X-Google-Smtp-Source: APXvYqxLgc3WW2WpqH279iuhl6kV53YEdNN8DJP2bOSppHnW+ZfOVH6ZSgDNHauLKRpFO1+Ti+J9OhLXUANLc+CMoA4=
X-Received: by 2002:a2e:6309:: with SMTP id x9mr16083001ljb.75.1552308047715; 
	Mon, 11 Mar 2019 05:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
	<20190311031230.21497-4-richard.purdie@linuxfoundation.org>
	<CAMKF1sp9pjSGOgdv_+k-sqA-sghbxyixK3rb513aRCa5GEtiXA@mail.gmail.com>
	<4dacf2835bc4af256257c7b9455b15bc1e2b6f15.camel@linuxfoundation.org>
In-Reply-To: <4dacf2835bc4af256257c7b9455b15bc1e2b6f15.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Mar 2019 08:40:38 -0400
Message-ID: <CADkTA4OeWzsbVZMES-pWiY=EXL9saqqrtYuF1vC16NCcREtcKQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] linux-yocto: Fix systemtap issue on armv7
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
X-List-Received-Date: Mon, 11 Mar 2019 12:40:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 11, 2019 at 8:13 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2019-03-10 at 21:27 -0700, Khem Raj wrote:
> > On Sun, Mar 10, 2019 at 8:13 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > Testing stap on armv7 machines was failing due to intermixing of
> > > thumb/arm
> > > instructions. Patch the kernel to always use the v7 march options
> > > since
> > > we know our gcc versions support it to avoid the failure and allow
> > > systemtap to work.
> > >
> > > [YOCTO #13153]
> > >
> >
> > please use the fix that Victor submitted upstream, that way we dont
> > need workaround.
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2019-March/637809.html
>
> I have a feeling that patch may get some discussion upstream. I was
> going to say that the version we're working with is simpler and easier
> to work with until upstream decide what the right approach is. Victor
> as already pointed out that even then I messed it up slightly!
>
> I certainly appreciate getting something upstream and that is the right
> thing to do, I think a simpler workaround for us is fine until that
> gets sorted out though.
>
> I'm particularly conscious that we've not built M3 yet and that Bruce
> has limited availability due to travel so we have a few constraints
> here.

I'm of the same mind. Until the upstream patch is actually queued,
we can easily just stick with the current patch.  That way I can log
the permanent upstream git hash in a revert and update ..  which
is no different than I'd do if I merged the posted patch and then it
eventually merges (or if it needs changes, etc).

So as long as what we merged doesn't break anything, there's no
need to change anything (it isn't a mystery that there's an
upstream fix, even I noticed it last night when scanning my upstream
lists and I'm on vacation :D.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

