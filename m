Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id BC40179FE1
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 03:29:01 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id u19so288334uae.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Nov 2018 20:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=S308giIQ4Kt5uh3nDbJOuaxEuPN3spVpFsz/8roXn7s=;
	b=cKU4hE+vAbjZUtsP/x6Ly7Dk5e6jvwCGkQPiO3mCZObwJL/n4J9MFFAqgbW4t6HOkz
	o2Nn/Hd9Yuk62PfS/wdikHn0cKhay9I17kgcO+nhaQUxtimqyiCNpS1I+34rD53eX9Hs
	3WVWfIGFIgTkkyux2lBWted9N51kjOudyEYKJGoEI1ZZcEkRNPgkprEJa11dDKP4f4A6
	MVzRIGIv8f6XLGPeKXCkMWHRS8qUwW5LyKZhUyYZ8sMThdv7aXTz4w2mIuBORZKiEH/d
	rJdq4K7R89rS/rFvnRM8lbzbNBY8aIt+mUJ/J2+dUVAw/ICjWyX9/FUQZofUi3V4IsAB
	jSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=S308giIQ4Kt5uh3nDbJOuaxEuPN3spVpFsz/8roXn7s=;
	b=jw0U8lYx/RugLGG3sUks/1wqf0xagqmYlPb9vVmY165qbEJ/c/XqZD5wLtPucwWYNx
	r4JGyFnG0/OlsoeUFT6doBO0SntvhFcu+HOWYhyPo/p0BoNhvbqoIbx1oEF8Dk18Db+Y
	lZSSYMFJVvPnx7A5LnSYYqvaFyP6Ql5AV5v7kWC4cdqUAo3bY/sjdwiDiPF8lpH9qD8F
	2fWWSv9muHpo+/AhnINxGdaUHmsY0pVXN9YDyJZmWLHcDc96y1NaYO+gRQElZGNkS97W
	/bhMOU/aLJdg+oURnU1zc5oaIw1ySBOzERc3C823lFBV0Kn/erVqu5+7xeCVRXVqQbp5
	ZHVw==
X-Gm-Message-State: AGRZ1gKloV8oG91MQTgr3Ve2fiiI1jwT9M557d8r6dJJ+7A6zJFzGO81
	4WQDPHkjyN/qAk0TOZW9Zmw/Fr1qt+HrMtvf+LA=
X-Google-Smtp-Source: AJdET5evY33MGsRLbBH2wP3d+VAGguHHqC6PFFfwmdSnkidXpD3EODNqOVhDcVRj3fB+IxhaBAx1S4UNCrm/WcQKXfg=
X-Received: by 2002:a9f:3743:: with SMTP id a3mr6616268uae.86.1541215742586;
	Fri, 02 Nov 2018 20:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20181102143927.15387-1-matthias.schiffer@ew.tq-group.com>
	<8ba204af82c54d23805deefb5197dd6f@XBOX04.axis.com>
	<8897ab754bea0fda7195a851b2d19695dd7553e9.camel@linuxfoundation.org>
In-Reply-To: <8897ab754bea0fda7195a851b2d19695dd7553e9.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 2 Nov 2018 20:28:50 -0700
Message-ID: <CAJ86T=WHs0P3+o8_k=FJvM4PTkQT9ggWZfc0Hejieg+zzBH+Tg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: avoid 'find -ignore_readdir_race -delete'
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
X-List-Received-Date: Sat, 03 Nov 2018 03:29:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 2, 2018 at 8:43 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2018-11-02 at 15:19 +0000, Peter Kjellerstedt wrote:
> > > -----Original Message-----
> > > From: openembedded-core-bounces@lists.openembedded.org
> > > <openembedded-
> > > core-bounces@lists.openembedded.org> On Behalf Of
> > > matthias.schiffer@ew.tq-group.com
> > > Sent: den 2 november 2018 15:39
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: [OE-core] [PATCH] base.bbclass: avoid 'find -
> > > ignore_readdir_race -delete'
> > >
> > > From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > >
> > > Until recent versions of findutils, -ignore_readdir_race did not
> > > work
> > > correctly with -delete. This led to spurious build failures when
> > > files
> > > disappeared; specifically this was seen due to do_configure and
> > > do_populate_lic running concurrently for packages with ${B} ==
> > > ${WORKDIR}:
> > >
> > >    find: '.../sstate-build-populate_lic': No such file or directory
> > >
> > > As the find command of the host system is used here, we can't
> > > ensure that
> > > the used version contains the fix. Work around the issue by passing
> > > the
> > > output of find to 'rm -f' instead of using -delete.
> > >
> > > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com
> > > >
> > > ---
> > >
> > > It would be great if this patch could be backported to all versions
> > > back to Rocko, as our current setup is still based on Rocko.
> > >
> > >  meta/classes/base.bbclass | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> > > index df11c8b270..5ffd8396e3 100644
> > > --- a/meta/classes/base.bbclass
> > > +++ b/meta/classes/base.bbclass
> > > @@ -303,7 +303,7 @@ base_do_configure() {
> > >                     if [ "${CLEANBROKEN}" != "1" -a \( -e Makefile
> > > -o -e makefile -o -e GNUmakefile \) ]; then
> > >                             oe_runmake clean
> > >                     fi
> >
> > You might want to include a comment here explaining why rm -f is
> > used instead of -delete, or someone might come along and optimize the
> > code...
>
> We should detail which versions of findutils have the issue as
> ultimately it would be nice to use the simpler command. I'm curious how
> many of the distros we support have the problem.

There's a test case in the patch proposed to fix the issue:

  https://savannah.gnu.org/bugs/?52981
  https://savannah.gnu.org/bugs/download.php?file_id=43119

Regarding the proposed patch for base.bbclass, xargs should generally
always be called with --no-run-if-empty, unless there's a clear reason
not to.

