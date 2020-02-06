Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id A219760B1F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 16:54:13 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id n184so1413531qkn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 08:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MUylGOxF8noWKR4pX3nwFL+gxJUZJRCBY/0wbjpd3U8=;
	b=Tvp5jWZG29Zaj5wTjOUzSDVylBwwHP4N8E8ql+/vSsZqi33ojWpgN404kBRuOeLyyt
	wP5+7l+d9b4JC2Ndih6QBlBbaXSTcmDmnfSzubjA4KfsPY0y4wKs7ImsJfSWkLgTr/A/
	lRfUJuBqAAQpRZEpL6oR/oo39qcBkq+UKxwyQaWZY8+1iKh+im++fTFMcuox6mMxRWI9
	r+fa5g7uLS9uM6ty0reRzkHeGXdP+TjKy6zrk+9OkR7/WfAuwO4oxxDdT3+ORQqH8Rxu
	f6IxvcWZrq84Lyb7LK1BVXILnnkWgnapoh6mxdtgPY24WP8Qtg5s1WKL3Mc+T9WRuStr
	z4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MUylGOxF8noWKR4pX3nwFL+gxJUZJRCBY/0wbjpd3U8=;
	b=o+v+GYFS7hK2gU4TL3uLcSON8SkpyIQhLZhiEZcN+mXJ/1nKh6UCPicJOBIiaJWsSY
	tmf39MX/sN/3Lv9MaMHFnsuCWvvGUwIrBhPLzEMjmMSpuBMAxK63IvtXYH6+fEhzPAi1
	LHQGgcrdEznwz8vAGGVjkfCEqVlNHPU78vLp2JOC8JS59U0UVuxFdZ2K8N8Y4Tro4JN2
	iZHqw957Y+uMnsN1Pfkk8JGPkxaqlgwsyRVYSDhahiZf6ltvx4qIuaDnE42k284D+Ix6
	efIWBW/eJMfpQZsp6+7Vq71M5K6rbAssp9H52VE2Ce1y5R4vUDbEa3FO5fWtJk6tVQEq
	zKpA==
X-Gm-Message-State: APjAAAVBdtMgL2OO+YRdz4NYMChHVR8uKao8t5DFuyoxPf/+s90FKzSP
	bMX568vRyYU54c9H3HJwfx2lzFRzAmayt6aNTqo=
X-Google-Smtp-Source: APXvYqzWCGxlilket4bTe/thzTJP8c6VGaVIr7ToR19Mdv5F7z/+WorfWQDT31aJhqocTRt3+mC8aJaGWCob7GoM/IU=
X-Received: by 2002:a37:bf82:: with SMTP id p124mr3413282qkf.337.1581008054147;
	Thu, 06 Feb 2020 08:54:14 -0800 (PST)
MIME-Version: 1.0
References: <20200205010819.4172914-1-raj.khem@gmail.com>
	<20200206093723.6hq2anenujgnqiq5@jama>
In-Reply-To: <20200206093723.6hq2anenujgnqiq5@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Feb 2020 08:53:48 -0800
Message-ID: <CAMKF1sqVSNvfG0C8CUOB-10A0wxgu+--Y_=KDbzaM-z+dApjZA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bison: Upgrade to 3.5.1
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
X-List-Received-Date: Thu, 06 Feb 2020 16:54:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 6, 2020 at 1:37 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Tue, Feb 04, 2020 at 05:08:19PM -0800, Khem Raj wrote:
> > Minor upgrade on 3.5 release series
>
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> Minor upgrade with added benefits that bison-native doesn't fail to
> build for me when using yoe-distro. Strangely I haven't seen this error
> in any other build yet.
>
> 86_64-linux/bison-native/3.5-r0/recipe-sysroot-native/usr/include -O2 -pipe -c -o lib/libbison_a-pipe2.o `test -f 'lib/pipe2.c' || echo '../bison-3.5/'`lib/pipe2.c
> In file included from ../bison-3.5/lib/pipe2.c:25:
> ../bison-3.5/lib/binary-io.h: In function '__gl_setmode':
> ../bison-3.5/lib/binary-io.h:52:10: error: 'O_BINARY' undeclared (first use in this function)
>    52 |   return O_BINARY;
>       |          ^~~~~~~~
> ../bison-3.5/lib/binary-io.h:52:10: note: each undeclared identifier is reported only once for each function it appears in
> ../bison-3.5/lib/pipe2.c: In function 'rpl_pipe2':
> ../bison-3.5/lib/pipe2.c:70:43: error: 'O_BINARY' undeclared (first use in this function); did you mean 'SET_BINARY'?
>    70 |   if ((flags & ~(O_CLOEXEC | O_NONBLOCK | O_BINARY | O_TEXT)) != 0)
>       |                                           ^~~~~~~~
>       |                                           SET_BINARY
> ../bison-3.5/lib/pipe2.c:70:54: error: 'O_TEXT' undeclared (first use in this function); did you mean 'F_TEST'?
>    70 |   if ((flags & ~(O_CLOEXEC | O_NONBLOCK | O_BINARY | O_TEXT)) != 0)
>       |                                                      ^~~~~~
>       |                                                      F_TEST
> make: *** [Makefile:4827: lib/libbison_a-pipe2.o] Error 1
> WARNING: exit code 1 from a shell command.
>

I have seen this error too,  I think BUILT_SOURCES keyword is not being
handled rightly, I don't see this error when I don't use make -l
option, Perhaps its a bug in make, I don't know.

> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/bison/{bison_3.5.bb => bison_3.5.1.bb} | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-devtools/bison/{bison_3.5.bb => bison_3.5.1.bb} (90%)
> >
> > diff --git a/meta/recipes-devtools/bison/bison_3.5.bb b/meta/recipes-devtools/bison/bison_3.5.1.bb
> > similarity index 90%
> > rename from meta/recipes-devtools/bison/bison_3.5.bb
> > rename to meta/recipes-devtools/bison/bison_3.5.1.bb
> > index 3d8f6579b9..e70252d974 100644
> > --- a/meta/recipes-devtools/bison/bison_3.5.bb
> > +++ b/meta/recipes-devtools/bison/bison_3.5.1.bb
> > @@ -17,8 +17,8 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
> >  # No point in hardcoding path to m4, just use PATH
> >  EXTRA_OECONF += "M4=m4"
> >
> > -SRC_URI[md5sum] = "c0230be066069f33c8445766833f3205"
> > -SRC_URI[sha256sum] = "55e4a023b1b4ad19095a5f8279f0dc048fa29f970759cea83224a6d5e7a3a641"
> > +SRC_URI[md5sum] = "6fc5fa4488832a65db934b9e93bd5d4c"
> > +SRC_URI[sha256sum] = "3e7e097bd9709a2d5e40e69446b74b149733b3de864fadb7a9b54eca7b2a4dd0"
> >
> >  inherit autotools gettext texinfo
> >
> > --
> > 2.25.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

