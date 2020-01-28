Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5CDE87FDB7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 12:48:15 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id p8so10478768iln.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 04:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CJINyKDR+kwpq028JmAX/fgiG5VrfXvJqrXPSk9gaWk=;
	b=ECQMvTLzMxj0L5VObxeYLYfE9Y/rLj5+xms7yeEFRxJwJriD7GvoEO1cf7q4Dzz+WF
	H45GqVp/4O9IbyvqpBbBoqIsDWxWCuOk+3J+D/R25TBSAZf5T+O9s2aFB/f3TiDQtcQb
	+aQUWbcGy26pZ6zdKhMWLmPzGypBVdxN/RHDHbBZQg8FYQLU6zFwwJWDqKcMqecOXRHB
	Lgr3uFVMPOnGgfvpX7vbkmsdPYIQpYhZZ2Xwylkb+8UF3xZSV/Zo6I8n902+HNbFDy4w
	X6Df16j8jAHbseiSIS6XPHjWz2Iva7setNm0Ow7dQCCoIX5L3myJSrA+QxZD5Tp/L34E
	b67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CJINyKDR+kwpq028JmAX/fgiG5VrfXvJqrXPSk9gaWk=;
	b=lICiFlPlBAvde3amd6a96vQD/30EcgcjKnmAcoJVwIQjsNZ8VyGtr/nN2qtF1nXxsL
	gf1LeINRZMEresQZqATPxPiJZclTM0Bi9VgPB/fNfiKX/yhfhGFLDBlcEcra6+jgFwgH
	pChI/wPBM0EEwMIe+5vETsTH7Xn718hTCI1yWvo1+XYvSDddam3QJF2/Q85aJTfv6XMf
	92SmH6ysfvIAtpOWJPW8ZtWEroUP8R9gdltKw1XNDI+ChRJaT24rc85mlWpUMoSIxhgW
	lstctyTrUgHA1Q+GhTwjfgC5JEaJ9MimNhyoksFJZe+LCXtIqwFUvdNFg8dX317tPLKf
	UlhQ==
X-Gm-Message-State: APjAAAV6ghQKTjdvo7nAJLD0ymgPhTKFGjpNrOGAaM9qR+HoyXUbd/FV
	eq/y2APl0w/uX46qvn3t0Z677QpWGsB0WFBFn3I=
X-Google-Smtp-Source: APXvYqw2VLOGUZDqbDrdUjye32kB8WzDprOPS624arKXjnGOl9f3N18ecTY58G5wq85sG96mXP7bNp7aD6rG/Jd552w=
X-Received: by 2002:a92:1a0a:: with SMTP id a10mr19974009ila.295.1580215696561;
	Tue, 28 Jan 2020 04:48:16 -0800 (PST)
MIME-Version: 1.0
References: <20200122071934.60789-1-alex.kiernan@gmail.com>
	<15178a56a7fff6877d13b52312ffc8b898a60f3f.camel@linuxfoundation.org>
In-Reply-To: <15178a56a7fff6877d13b52312ffc8b898a60f3f.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 28 Jan 2020 12:48:05 +0000
Message-ID: <CAO5Uq5RVPgtaxUzny-iPCA5L5mBPUW6dmxb0xWRA_c0HSqZF9w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Tue, 28 Jan 2020 12:48:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 28, 2020 at 12:02 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2020-01-22 at 07:19 +0000, Alex Kiernan wrote:
> > Whilst glibc builds static binaries libxcrypt doesn't, without which
> > we
> > can't build, for example, a static busybox. Enable static libraries
> > here
> > so that anyone who needs a static binary using just basic libraries
> > has
> > one fewer dependencies to track down post libxcrypt being split out
> > of
> > glibc.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >  meta/recipes-core/libxcrypt/libxcrypt.inc | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc
> > b/meta/recipes-core/libxcrypt/libxcrypt.inc
> > index accbdd636152..e98d8084470c 100644
> > --- a/meta/recipes-core/libxcrypt/libxcrypt.inc
> > +++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
> > @@ -32,4 +32,6 @@ CFLAGS += "-fcommon"
> >  API = "--disable-obsolete-api"
> >  EXTRA_OECONF += "${API}"
> >
> > +DISABLE_STATIC = ""
> > +
>
> My worry with this is where the line is drawn.

I ummed and ahhed before sending it for precisely that reason...

> We let glibc generate
> its static libs since turning them off turned out to be a nightmare, we
> disabled everything else we could, assuming the user would turn on what
> they need if they need it.
>
> In some ways I'd much prefer this was in some example config rather
> than building things piecemeal that most people don't use?
>

Let me have a look at that - what got me here was trying to get a
static busybox so I could OSTree's tests to pass, which all turned out
to be way harder than I expected; this was just one of the things I
tripped over.

-- 
Alex Kiernan

