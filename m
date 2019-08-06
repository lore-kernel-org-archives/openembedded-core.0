Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 71FCD7F3B2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 21:10:30 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id w17so5506980qto.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 14:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rlvgIPl3hd2ZaGAc3JUS1/uJgxhR2y2TWRkH4K1nAEA=;
	b=UFdoKxxeMVZ+z+Bh/+d3y90hNOvGNeERjGUGFjjdREbc5w087Oyhm3L6wj5KeQbGAE
	jMicVfiBe6mW37LIRhInUykQv+LPImkZD/EtIL4cAV9yiwm2i0IpM7Rp/SCsz2Lft2S3
	JFP3UGZ+RF3CFbB0hwOohZugTXhvkF54LXzKJSE77Mc1PZDHqaYM5LGQSTOnE93R2vRE
	k+EcBYwIDhRjgEjOBorM8sGuiruPDhdIgip1Lw7TTZvbYSQnaOUfb+pZ7D4waHok551Q
	V/ms4amQ9OJa5FN0rDY6XE4Vfi6Z8Df8PjATIt9C4lZUD1Wbr3NdHl9k77CSNWExftNj
	SOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rlvgIPl3hd2ZaGAc3JUS1/uJgxhR2y2TWRkH4K1nAEA=;
	b=YXzskLA50wI6TcEJZs4CePIFr3mIyDL+UemdEWwuam4n76u9Aiepv/lJCSOlM2nPn7
	TUX0inMx7316tI0BKWKHyWk/nrdUZZCdSAie1uRQ19VPkoCzCwN3qDvK2/v2jCo0gJSg
	JXaPlY7ZIHZ9TesoJIOhgAUnZnBNump9DBN5oue/VxkiMrggZjq36yT8sjJ9t5ioN6+m
	vd7uVBHjAZwdrqmmlSQocKyK6Fw9SzKK4VBYp48QxiYovnPx1JgQuAJhzeRrt5jD77k5
	uny3LppzjgDvO0AtB4SO4gmL14N7AVZTTNMkmibXBebdzYC4txExM99XVs2ScIpPsTSL
	Bang==
X-Gm-Message-State: APjAAAVVRhE9FqMEUZCx5VW5wK3s3Jsb5DavSU0DJCMspRUORBYyCiLQ
	lzuaEH83KSuYqwQUHV5pwXf9LN367u2LoX3sFao=
X-Google-Smtp-Source: APXvYqwuCIpQYoIJMgTexRRDZh2OkCE9MwJ0ncwWtB5nn6xSOL+4Kxy3H6ScW7n9COatz2k16VCtLcNDnR/tO9K82/M=
X-Received: by 2002:a0c:b115:: with SMTP id q21mr5090254qvc.68.1565125830962; 
	Tue, 06 Aug 2019 14:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190806205716.12240-1-richard.purdie@linuxfoundation.org>
	<CAMKF1sqqXUDKM6gULavO49mbQk68xboaH1AcBTc5VR7fsH0KYw@mail.gmail.com>
	<2568b4259b4f1015ed6d72dbe7333c237cad2db9.camel@linuxfoundation.org>
In-Reply-To: <2568b4259b4f1015ed6d72dbe7333c237cad2db9.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Aug 2019 14:10:05 -0700
Message-ID: <CAMKF1spX7kimNxYn+1A2wg8rin9ktXv=td=jAe4oZrQuRPNyZA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sqlite3: Fix zlib determinism problem
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
X-List-Received-Date: Tue, 06 Aug 2019 21:10:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 6, 2019 at 2:04 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2019-08-06 at 13:58 -0700, Khem Raj wrote:
> > On Tue, Aug 6, 2019 at 1:57 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > sqlite3-native in particular was finding zlib from the host if
> > > zlib-devel
> > > was installed. This could lead to races where pseudo-native may or
> > > may not
> > > fail to build.
> > >
> > > We don't need/use compressed page support with sqlite so disable
> > > the dependency
> > > (it doesn't have a configure option so use a autoconf cache
> > > variable).
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/recipes-support/sqlite/sqlite3.inc | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/meta/recipes-support/sqlite/sqlite3.inc
> > > b/meta/recipes-support/sqlite/sqlite3.inc
> > > index daf3db5e9fb..2ad621503cd 100644
> > > --- a/meta/recipes-support/sqlite/sqlite3.inc
> > > +++ b/meta/recipes-support/sqlite/sqlite3.inc
> > > @@ -21,6 +21,10 @@ CVE_PRODUCT = "sqlite"
> > >
> > >  inherit autotools pkgconfig
> > >
> > > +# disable compressed page support as we don't need it
> > > +# we can see non-deterministic floating zlib dependencies
> > > otherwise
> > > +CACHED_CONFIGUREVARS += "ac_cv_search_deflate=no"
> > > +
> >
> > should this be done for native only ?
>
> Its currently disabled on the target since the dependency isn't in the
> sysroot and nobody has asked for it...
>
> I think Jason is working on a PACKAGECONFIG controlled version but its
> going to be uglier and I'm torn...
>

yeah disabling unconditionally seems the path of least resistance meanwhile.

> Cheers,
>
> Richard
>

