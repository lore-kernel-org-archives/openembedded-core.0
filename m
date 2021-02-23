Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.110.1614100474354708721
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 09:14:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nXsLRLjZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id e15so12406441qte.9
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Feb 2021 09:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6CbpZUGPd2ZPGpT1C5fLk13YEgB/3TXDCchCq2XHjuo=;
        b=nXsLRLjZIqU6ID07xQgJonkIbC3/51jZNLRbmxPgwRWJeXYQ7mY/xA3+hj98lOultX
         D0AyNs0s6MEHLDTxuT48hDKvhegJT+Pic/tkddzDouRwlI9hmrZ74w/fGGpig77HlV3C
         Qy8vnU4Uci2feY3NYWoMYI1efjuAENnp8xh3wJdC+nD77g8mPCS7q5Sw/Lml+HF6jPsv
         kyEHnYl91xPs/ObCc3i0piODUojkyCXdgfWJi0hq+YLkPxDS2zrtGqvkBy1oxt0jJHKK
         rXp5LnI+sFRtH7R+s6wWw51j1HsfJD9KInXCHKO8PJx3sKNwfwIVGvo13o8Fc4ekHSme
         7NzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6CbpZUGPd2ZPGpT1C5fLk13YEgB/3TXDCchCq2XHjuo=;
        b=pbPYp3tH7TnB1Nd9DV0vQWWYDSsj8FUsd4m28YuVOFg2TnV6YALZ8F2WFmAay3z+PF
         bgoDEFAZYDTpcQHOOems6K97GqYw/8HiA5ZFbD9WLdNaL076P/kco14qTi7AncxYo0u/
         l/okEoLgqFYsEv8XPzbNLIbyQpS5J15yCE/TgOPsPlSWS4z3R+nJ+RN514dI7ZxBPZUd
         CSTh+DVQUyl0pUD4N9cC7b75Fw3zsLi5txz6BuSBURqX9xXdAnCJ1JgU98s7p3fjOEA9
         Ea22S3isI/ik/+KdB+DRX/HC02ejpDidlVsmjm3ekqogcwStOYFzbAUDnn17keoT8YTr
         to6Q==
X-Gm-Message-State: AOAM533vG6aMAgPscexpoEo7rhl4pCBQdSUVZvYCEYYwqTdAlmTVf6wz
	A2rYdQtmem+Z+tBnTtBRfE7u+tBE+vLQXrHuVI0=
X-Google-Smtp-Source: ABdhPJzGqfZWG+J3Mvqtlk8ba6t4flcYuw5fnQGVwjoJ/C/todoYiomsXTxfz4kAen9qL8E66JqBGSTyUq1m5ogLXu4=
X-Received: by 2002:ac8:74c9:: with SMTP id j9mr17473744qtr.369.1614100473306;
 Tue, 23 Feb 2021 09:14:33 -0800 (PST)
MIME-Version: 1.0
References: <20210214084905.3353606-1-raj.khem@gmail.com> <54bd9d57-d197-7a67-6793-8b0800715362@windriver.com>
In-Reply-To: <54bd9d57-d197-7a67-6793-8b0800715362@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 23 Feb 2021 09:14:06 -0800
Message-ID: <CAMKF1squXGEN8FoqH0TreOt=iJk1c70pkaKKCFA5e3g0ug_LpQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go: Update to 1.15.8
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 22, 2021 at 12:18 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2021-02-14 3:49 a.m., Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   meta/recipes-devtools/go/go-1.15.inc                          | 4 ++--
> >   ...{go-binary-native_1.15.6.bb => go-binary-native_1.15.8.bb} | 4 ++--
> >   2 files changed, 4 insertions(+), 4 deletions(-)
> >   rename meta/recipes-devtools/go/{go-binary-native_1.15.6.bb => go-binary-native_1.15.8.bb} (83%)
> >
> > diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devtools/go/go-1.15.inc
> > index abe74e5eb7..7c8190f68c 100644
> > --- a/meta/recipes-devtools/go/go-1.15.inc
> > +++ b/meta/recipes-devtools/go/go-1.15.inc
> > @@ -1,7 +1,7 @@
> >   require go-common.inc
> >
> >   GO_BASEVERSION = "1.15"
>
> Khem,
>
> go-1.16 was released on: 2021/02/16
>    https://golang.org/doc/devel/release.html#go1.16
>
> Should we update for oe-core-3.3?
>

I have sent patches I had, but we have some overhaul in defaults so
helloworld app does not build since its detecting that we are in
a git tree which is the meta-data tree. once you go into module source
code then it works. module builds are default now and I dont
want to revert to old ways of turning it off since its going to go away in 1.17

> ../Randy
>
> > -PV = "1.15.6"
> > +PV = "1.15.8"
> >   FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> >
> >   LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> > @@ -16,4 +16,4 @@ SRC_URI += "\
> >       file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
> >       file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
> >   "
> > -SRC_URI[main.sha256sum] = "890bba73c5e2b19ffb1180e385ea225059eb008eb91b694875dd86ea48675817"
> > +SRC_URI[main.sha256sum] = "540c0ab7781084d124991321ed1458e479982de94454a98afab6acadf38497c2"
> > diff --git a/meta/recipes-devtools/go/go-binary-native_1.15.6.bb b/meta/recipes-devtools/go/go-binary-native_1.15.8.bb
> > similarity index 83%
> > rename from meta/recipes-devtools/go/go-binary-native_1.15.6.bb
> > rename to meta/recipes-devtools/go/go-binary-native_1.15.8.bb
> > index 622557ad2b..df697e2781 100644
> > --- a/meta/recipes-devtools/go/go-binary-native_1.15.6.bb
> > +++ b/meta/recipes-devtools/go/go-binary-native_1.15.8.bb
> > @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> >   PROVIDES = "go-native"
> >
> >   SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
> > -SRC_URI[go_linux_amd64.sha256sum] = "3918e6cc85e7eaaa6f859f1bdbaac772e7a825b0eb423c63d3ae68b21f84b844"
> > -SRC_URI[go_linux_arm64.sha256sum] = "f87515b9744154ffe31182da9341d0a61eb0795551173d242c8cad209239e492"
> > +SRC_URI[go_linux_amd64.sha256sum] = "d3379c32a90fdf9382166f8f48034c459a8cc433730bc9476d39d9082c94583b"
> > +SRC_URI[go_linux_arm64.sha256sum] = "0e31ea4bf53496b0f0809730520dee98c0ae5c530f3701a19df0ba0a327bf3d2"
> >
> >   UPSTREAM_CHECK_URI = "https://golang.org/dl/"
> >   UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> >
> >
> >
> > 
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
