Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE807D256
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 14:29:38 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id x7so1907058ioh.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 07:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2ZajZdXmLvo7fb2wv+pkwnaRh01aM+Lb+YRWCl39Sbw=;
	b=ndo/9M3AmTfPMrm0mOhvuPZilJ26hoEe/FYCmNn5pEtI7PwSJMaLoGABX+nJasphaR
	ufgstUx1J40+13GuNbwX66MvcNJ4OQer0BzEHE/omn1knY1a2kJ0hS24W3FfO4vjH5Ah
	7U73Y5OytOJI6BNwagAEUEyFHVsye5h1kxOgxspbyyjOSjkjOE+piGf6S9YbYOJxGmVE
	0rtuCFTN3rotKflvmeZBqCRPPmocV0DR3cSv02tGjsAhikoNBpWrt0p4Xr2ozeO7ZzWF
	bLpv0IHUshXwMNE7gNOai7/0LtOI9Lo5b6AnitMNc+VqDjWxw3ikQ6XkGtGiWNE4h2XN
	z1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2ZajZdXmLvo7fb2wv+pkwnaRh01aM+Lb+YRWCl39Sbw=;
	b=JhkW52NpKcDHqpeky+LhwxuWNJQtSr8QFzSfDiKsh5G7rpYzswb28Y41QaVhNcEUFu
	TglOwgbiCT018Po7IqL9TwV8fpUelvRyytSlEEkDOWzY3nIauVAxLNKL68qWQYVzFxhZ
	NFHX3uL8JlQlQB+ek0F1sCVlr3knsJu45AKUmIwwgdbR37emRAw67dar92CDmgxjqLit
	Iqslp7/2sT8ti83zUBtIhUOjQVa2gpKeXvD9raN2/jEj4hcly26YwSeRY0cmhPSPs9iF
	yzA+RiYzFvwn4WhwXgWt0BvKfEWKRjW9PELT5uLiMAdl4bsdjukIXrJGUr9Vd8t0YeDB
	jbLA==
X-Gm-Message-State: APjAAAXajKM3h8fwkMBrteus35J5Pls9BrF9c6qHaJnJyGTW/aHmyuLF
	ZItKnpLVZs/r3sclSVx9ZC7L6JN/9KTSBf9d65c=
X-Google-Smtp-Source: APXvYqyAQ5HAZP8rrO6hRPxzsyQdQc44znq9NRnszMbPdvR/dvKch0p6wKZKLTDA1V7y78WPwVgbivLsjsWSKRbHbqg=
X-Received: by 2002:a6b:f909:: with SMTP id j9mr9629664iog.272.1553869779508; 
	Fri, 29 Mar 2019 07:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190326102919.7348-1-schnitzeltony@gmail.com>
	<CAJTo0La2G+3qUPzXOC6B0Mjwr70ygPuttHuNzfV85GRy3pZYpQ@mail.gmail.com>
	<CANNYZj8Ds1A5o-C7tQspQgWc=7rT1FaMD1ALpPMKmi51pMn5ag@mail.gmail.com>
	<CAJTo0Laq_H-C+-S5zNU+4c5urQ5Y2Hy4oSe63EoQZotnLkFsDw@mail.gmail.com>
In-Reply-To: <CAJTo0Laq_H-C+-S5zNU+4c5urQ5Y2Hy4oSe63EoQZotnLkFsDw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 29 Mar 2019 15:29:26 +0100
Message-ID: <CALbNGRTJYpi90K4VYtSfTq7kJj1Fukvu_iGGx=D-n6hDrNH7Pg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk+3: add librsvg to DEPENDS
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
X-List-Received-Date: Fri, 29 Mar 2019 14:29:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 29, 2019 at 2:31 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Fri, 29 Mar 2019 at 12:11, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > On Fri, 29 Mar 2019 at 13:04, Burton, Ross <ross.burton@intel.com> wrote:
> > >
> > > But GTK+ doesn't depend on librsvg at all, and this is a failure in
> > > adwaita-icon-theme.  Why doesn't the dependency belong on
> > > adwaita-icon-theme?
> >
> > I believe adwaita runs some utility that gtk provides?
>
> Sure, but gtk+ doesn't link to librsvg, so a DEPENDS isn't the correct fix.
>
> Patch incoming.
>
Thought same. Are you sure that does not link - or can you explain how
DEPENDs fixed adwaita: If it does not link: How comes that librsvg
makes it into adwaita's native sysroot?

Andreas

