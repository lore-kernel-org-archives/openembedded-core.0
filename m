Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 788316BE0C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 11:49:32 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id k98so11294627otk.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 03:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=89yKzIS7oNxRLcsyB3qE/jBLWdavvafQOWm4bfwMiVQ=;
	b=qiqqmUEeqQ6c4nijSzbJMj9l/i8K7Eqoq+kql9U+QRMjEzZv6yJ1pvig5gzJEmWp29
	pXmto7pgVo0khwMF8r7udAxbMrGziZF5vyTVJxhbUrjFGOjk9uLSA1C7kuutTP8WK8TC
	tSyt6u3Rh2ynFPr4grkNpKxkjA4aiOOO+5fK+FZwVtAywHLpIvBJY3+VTDCzcFGH4ZaQ
	j5XP3h7gxmuifP0jgwQkt/V6NAH6M2pGedDCdkdn9N+u06Uqv0ffQKgJkxEj2bg5liAC
	5Fe7nex9j6LensfFYOxFS8XIPTHkEBZZ/wSeRluzKWAJBAqFwrDEktOuasc3Ng1+ieSx
	5hbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=89yKzIS7oNxRLcsyB3qE/jBLWdavvafQOWm4bfwMiVQ=;
	b=G6TL7JhZsToPQ6BnhZJwho4rbrKCv2m+7TVeIR97X3B7mh9Spy4ec8gCB0ZgwUPZ+w
	r44VLcdtGRVVs1hmVkTF6vF/bZmbm1KI0I1I/JMKWUfER6MaiaMcTuerf2L1Ffhi9ZLl
	bEyCLWDxlG2hs9j0WQAzEp1WDDaCymp8Fk1Kr0W812uDnOKezvpGQd260wKFGPHIZx/3
	AQsD53afv2XLCLrsSUVGNshEhor5FrvBIXjM/cIXWxC3dwebt4hDkIzMmStGIJdus0uA
	NsXnjS0ipNzrV/Bv9yAtEUv8wZ8rB1moBwhrYNWgjKtVMCEeRQfGDdhuD4hn/rDuqzFI
	Bm8g==
X-Gm-Message-State: AA+aEWZrJy4eiJXgN6YM8lUFzatHi05WVrlcR8RK1BZm0IaPe+505/7T
	n4t1GU/+9DjU2LqhZbig251/u9/Auy4ZU4uHlTc=
X-Google-Smtp-Source: AFSGD/XSWgU1NK+al5TXMygXDwTZZ/dZAYU7/9DVKgyjYSghOvHFXVjatHck/HelkiNdlz7PBrfOPzmuzQ0rr2sqAaI=
X-Received: by 2002:a9d:2289:: with SMTP id y9mr10457708ota.326.1543837773303; 
	Mon, 03 Dec 2018 03:49:33 -0800 (PST)
MIME-Version: 1.0
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
	<CAMKF1sqst3bNey6Gwf2bTa_oKOVrFjKsWcPcM4sbAYTp3SxA3g@mail.gmail.com>
	<CANNYZj_H=i+Oa9JKaXaAVW6_vy-9o5YgDOHE76g1Q9L5=K5Jog@mail.gmail.com>
	<CAMKF1sr7mXJzgwbzer0=UUbUoEYgXM7x=0ZUjTQn6_c-3ZC3Vw@mail.gmail.com>
	<CANNYZj9ug7+q0v-kVVio7_a61BRo1JEBNxFmJ33XgB=CQGd7ow@mail.gmail.com>
	<CAMKF1srRWqu-BwcvPNSvrQD5sRkXBF57Jxm1_Dg=ZBn1icUM0A@mail.gmail.com>
	<42f7604d9ffbd8b1347c6dd09839b349d297fc41.camel@linuxfoundation.org>
In-Reply-To: <42f7604d9ffbd8b1347c6dd09839b349d297fc41.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Dec 2018 12:49:21 +0100
Message-ID: <CANNYZj_GcqDgrVmOXbJ5=m0rQQ4A8Vfg6yJKV5_ymgVDq9e5tg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/16] gobject-introspection: update to 1.58.1
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
X-List-Received-Date: Mon, 03 Dec 2018 11:49:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, 2 Dec 2018 at 23:22, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> > > I just sent a patch for this to oe-core list - thanks for
> > > reporting.
> > >
> >
> > thanks I can confirm this is fixed with this patch which is in
> > master-next
> >
> > > libdazzle crash is a separate issue, I will look into it.
>
> Oddly enough, master-next resulted in:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/48/steps/7/logs/step1b
> https://autobuilder.yoctoproject.org/typhoon/#/builders/68/builds/33/steps/7/logs/step1b
>
> so I've removed the gobject-introspection patch which I'd included to
> try and isolate the cause...

This was a multilib issue where gir files are installed in libdir (and
not datadir like in non-multilib).  I'll send an updated patch in a
moment.

Alex

