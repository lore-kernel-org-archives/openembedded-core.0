Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id A5D837EE0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 14:12:41 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id q203so1901661qke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 07:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LJ8MVDDeXsZhF3wWL8duwWTFRe4VrTZPCr4clJzh6XM=;
	b=uhY5QQ/FrUZtUqEKmwYjoEbXRbG6Bg/Z1aKz83cas6atQnpK8sKt64Bf0Kmqmd4SWB
	HSxdqq9HokbKplBrT2+HEX9Oi/6yb3y5f9YH+kj9xEz9d4l8tnC3WKL6PR/UM16QIvPi
	y2la7EsdLWuzJyNY1hQUfShv4t9mrJd1YDWo4EH0aUfTGtCUCodjKw/rQMtFgoWoIyv5
	sEGkoSGgfXdMymfMEqgjnAvNEhrP+2Fyk3h9ah2DL0mTwSei1LJu97XLBUVSGG0+IcYo
	U0JOfY7+IJd6jWbLvWbxHUKrnpPrRyD4Uy1ecI6kHc2l0BAHXdpkx3l5JdWAGXb9KZfm
	aCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LJ8MVDDeXsZhF3wWL8duwWTFRe4VrTZPCr4clJzh6XM=;
	b=ot7MoD+Gqjr6DucOfLvar3+tiSn33Qfc9JnfYT44IMAGW0K+drZDdb9GkBUkkBbOYa
	iyR3hXXJPT4z3VgC5/EhYP4r0SD1iczjv6KFxmUvILryVqWKRSs7brtqLhohgSjYoHTT
	yMcbOapSL6dzGNNxJRNukiX5pgKhyIvq8bOf0waDJJuTTiQrfBNglaxaoytqMoMU6XPd
	JOTJUnYQsSdIk7URmzzn41PyhVYbpKkwvFmGDHd6dMsOXTSknM2nkvsZ+1TZl4glsmm9
	bQz86ph0oFXXNJovgIDNjwRgrILIYdkpxIR3mRb6p50tqX4QhFHbt/lCN/ZPVCzZIhko
	xiFw==
X-Gm-Message-State: APjAAAWMiNO+IbLBUQ7r1mgcR7akWKhD3LC71u7dKrZ/AIbQpcLDcye3
	QHvutYuMBKj1dRPSrFhRgpaaOMwLDqFJVOGqmYU=
X-Google-Smtp-Source: APXvYqxIvQhXnKMm0xqiQa8fegyPgIgO4Hbk834wiVY0bVq7kHkMxXoQ65Vgd+NbWFrIZACo2BhkPRHp6+47TFr53sc=
X-Received: by 2002:a05:620a:13d1:: with SMTP id
	g17mr3580747qkl.9.1569507162039; 
	Thu, 26 Sep 2019 07:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569466181.git.liezhi.yang@windriver.com>
	<e32ddb5983f3ac13e58fb60425bafbb711721151.1569466181.git.liezhi.yang@windriver.com>
	<CAMKF1sq9Yc4=_R2EkvUw4+m--YxgGViStkg9RU_mXXqH7SwBYA@mail.gmail.com>
	<7624506c-1cc4-347c-feb2-faa5f2538e21@windriver.com>
In-Reply-To: <7624506c-1cc4-347c-feb2-faa5f2538e21@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Sep 2019 07:12:14 -0700
Message-ID: <CAMKF1spvH2aVzi2vBMZta3Ee1Hn2zfecxt=3OLTVSDteZebxdg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/3] apr: Fix configure error for nativesdk
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
X-List-Received-Date: Thu, 26 Sep 2019 14:12:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 25, 2019 at 10:51 PM Robert Yang <liezhi.yang@windriver.com> wrote:
>
> Hi Khem,
>
> On 9/26/19 10:57 AM, Khem Raj wrote:
> > On Wed, Sep 25, 2019 at 7:52 PM Robert Yang <liezhi.yang@windriver.com> wrote:
> >>
> >> Fixed:
> >> $ bitbake nativesdk-apr
> >> buildconf: libtool not found.
> >>             You need libtool version 1.4 or newer installed
> >>
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> ---
> >>   meta/recipes-support/apr/apr_1.7.0.bb | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.0.bb
> >> index 09a65bf..a9d98be 100644
> >> --- a/meta/recipes-support/apr/apr_1.7.0.bb
> >> +++ b/meta/recipes-support/apr/apr_1.7.0.bb
> >> @@ -1,7 +1,7 @@
> >>   SUMMARY = "Apache Portable Runtime (APR) library"
> >>   HOMEPAGE = "http://apr.apache.org/"
> >>   SECTION = "libs"
> >> -DEPENDS = "util-linux"
> >> +DEPENDS = "util-linux libtool"
> >
> > hmmm packages usually need libtoolize so please check if thats the
> > case or maybe patch apr to
> > do so., thereafter you can just DEPEND on libtool-cross
>
> In do_configure:
>
> libtool='${HOST_SYS}-libtool' ./buildconf
>
> So it requires libtool which is x86_64-pokysdk-linux-libtool when build
> nativesdk-apr. The libtool-cross is already in default depends, and it
> doesn't work when build nativesdk-apr, so I added libtool to the DEPENDS.
>

perhaps something like this might be interesting
https://sources.debian.org/src/apr/1.6.5-1/debian/patches/fix_apr-config.patch/
https://sources.debian.org/src/apr/1.6.5-1/debian/patches/libtoolize_check.patch/

> // Robert
>
> >
> >>
> >>   LICENSE = "Apache-2.0"
> >>   LIC_FILES_CHKSUM = "file://LICENSE;md5=4dfd4cd216828c8cae5de5a12f3844c8 \
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

