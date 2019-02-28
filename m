Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4EEAB7CCB5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 00:31:57 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id d18so21527681qtg.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 16:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kudncyMZxvA1CiTP7XPDhdizX8NpnjVA2pmBfp6+kvY=;
	b=Wsh7dyKJK8Fkc3qy2OupRaCFrLRVJgLZCXmwz4aEag+zBTG/86uPmyj6L22lO8IPaw
	4q74bGzJiZCdztAFbXdpPcoggWUVGKxO+i7CXF02Q2rflbZ7YaBa6NESfM1ld/GsK9dw
	HOs3IYZnagLNCffufcyP8Rnx/JOLSTKmJC0yY2MVrSzkZ4R4lkhhk2/o3RAWLHDhsWZR
	b3Wqo2zsnJbAO2X5aYPKQ7Qq/FHpK1q3A175TrDMguADfAMFbOGhQvidVAunqK3Z3u33
	OUu99YFfBjDe9sjfKkuko0yl0ffLSjChyR6zRSlQibmHPCUijsAW0/izmiNspcskn7O+
	h7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kudncyMZxvA1CiTP7XPDhdizX8NpnjVA2pmBfp6+kvY=;
	b=YEC+qujtjGnQ0U1RhaNF7QTVOc6gPw5ns4cq9/0Ij3NkJ4mq+veFNINuHtKqA0Kcng
	ss4XTqa/akRSS8bnSXsCyfZ2nnM+cEM60gjI4aQOMlj5y+RM8SeH0YTJziQ9KwLeVB8D
	TbrHrCIA6LkuLZIRg34rVuwVND48RtS3msFS3Af71plONVpD9kNAoUM36E2MOWH7TsNF
	m7JiGEC1H6rA58EN1bEBzmi7VjPCS4+SeH2yiPP942M1XhWCiwQLfA30OPsp+XQ4Kko6
	pun+S7kjDS5UlBuFk5bpngdgo7gvjRrj7Cr9AgK/N/zFAVva0x0fZv5t0SjNg03kgp9v
	oMwQ==
X-Gm-Message-State: APjAAAVcoww34L/oOzO2Asfouw4YBgTFo/HieGENvohPvKagJGYXqy3n
	33ArFUqySvXUzNpaD1/OOVZZceKlJVDdMvTv6IU=
X-Google-Smtp-Source: APXvYqwdPMx9vFNtYTGwB6awyzkHul46eBB4UDJHJ+i5OGHhsLPGn0EzfXKEOcvOjZqZPq/xCKGNOMB5EpRWcc0HL3I=
X-Received: by 2002:a0c:b645:: with SMTP id q5mr4282744qvf.194.1551313917821; 
	Wed, 27 Feb 2019 16:31:57 -0800 (PST)
MIME-Version: 1.0
References: <20190227205042.44813-1-raj.khem@gmail.com>
	<20190227205042.44813-2-raj.khem@gmail.com>
	<CAJ86T=WH03EBVFh-OU=pKDcsKL-YK3efEzHXDmwouGjvp7z9GQ@mail.gmail.com>
	<20190227223229.GA1503@jama>
In-Reply-To: <20190227223229.GA1503@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Feb 2019 16:31:32 -0800
Message-ID: <CAMKF1srcmWG6m+78ZBX-hv=1ZqHPA__RtMWwr-9HLp2mvDtFww@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: Disable Werror when building with debug options
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
X-List-Received-Date: Thu, 28 Feb 2019 00:31:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 27, 2019 at 2:32 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Wed, Feb 27, 2019 at 02:01:06PM -0800, Andre McCurdy wrote:
> > On Wed, Feb 27, 2019 at 12:51 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Since compiler does not optimize away a lot of stuff we end up with
> > > Werrors e.g.
> > >
> > > ./sysdeps/ieee754/flt-32/s_log1pf.c: In function '__log1pf':
> > > ../sysdeps/ieee754/flt-32/s_log1pf.c:114:22: error: 'c' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> > >   114 |        + (k * ln2_lo + c))) - f);
> > >       |          ~~~~~~~~~~~~^~~~
> > >
> > > which otherwise wont happen, so lets build with warnings-as-errors
> > > disabled in debug mode
> > >
> > > given we disable werror, now we don't have to restrict user to compile
> > > without -O0
> >
> > Did you actually test with -O0? Even if it builds, there may be issues
> > at runtime:
> >
> >   https://sourceware.org/glibc/wiki/FAQ#Why_do_I_get:.60.23error_.22glibc_cannot_be_compiled_without_optimization.22.27.2C_when_trying_to_compile_GNU_libc_with_GNU_CC.3F
>
> Agreed, last time I've tried it still didn't work in runtime with -O0.
>

intention is not to state that it should be working with -O0, but let
glibc complain that it can not be compiled with out optimization which
it does nicely.

> If this is the only place where it now fails, can we please work around

No, this is just a representative, there are several such warnings in
tests especially, so disabling werror is only sane here.

> it like in:
> https://sourceware.org/git/?p=glibc.git;a=commit;h=27c5e756a2a8495d77480a103081a86c1ca9a1e8
> https://sourceware.org/git/?p=glibc.git;a=commit;h=4a06ceea33ecc220bbfe264d8f1e74de2f04e90d
> and pending:
> https://patches-gcc.linaro.org/patch/13529/
>
> > >  meta/recipes-core/glibc/glibc.inc     | 9 ---------
> > >  meta/recipes-core/glibc/glibc_2.29.bb | 1 +
> > >  2 files changed, 1 insertion(+), 9 deletions(-)
> > >
> > > diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> > > index 67af396133..a382a22b73 100644
> > > --- a/meta/recipes-core/glibc/glibc.inc
> > > +++ b/meta/recipes-core/glibc/glibc.inc
> > > @@ -2,15 +2,6 @@ require glibc-common.inc
> > >  require glibc-ld.inc
> > >  require glibc-testing.inc
> > >
> > > -python () {
> > > -    opt_effective = "-O"
> > > -    for opt in d.getVar('SELECTED_OPTIMIZATION').split():
> > > -        if opt in ("-O0", "-O", "-O1", "-O2", "-O3", "-Os"):
> > > -            opt_effective = opt
> > > -    if opt_effective == "-O0":
> > > -        bb.fatal("%s can't be built with %s, try -O1 instead" % (d.getVar('PN'), opt_effective))
> > > -}
> > > -
> > >  DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-headers"
> > >
> > >  PROVIDES = "virtual/libc"
> > > diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
> > > index bd8aa6d503..9b6fab066b 100644
> > > --- a/meta/recipes-core/glibc/glibc_2.29.bb
> > > +++ b/meta/recipes-core/glibc/glibc_2.29.bb
> > > @@ -90,6 +90,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
> > >                  --disable-crypt \
> > >                  --with-default-link \
> > >                  --enable-nscd \
> > > +                ${@bb.utils.contains_any('SELECTED_OPTIMIZATION', '-O0 -Og', '--disable-werror', '', d)} \
> > >                  ${GLIBCPIE} \
> > >                  ${GLIBC_EXTRA_OECONF}"
> > >
> > > --
> > > 2.21.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

