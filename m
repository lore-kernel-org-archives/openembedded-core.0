Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615D0ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 02:20:00 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web09.1704.1663121991494537938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zuFWAB8I;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.44,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f44.google.com with SMTP id m1so20104890edb.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=sPhQy9bzPvZCbKJn3X4c0DmF84w2iAYTOBUZIauNbVI=;
        b=zuFWAB8I0CbU+nHi76l6q4iuSxS6gZAD0YjGpWlfOati0bIhY3QMaxI7dEHJjr0mh7
         +Bkk8+Lhykm13wK6HRvjnp43boppyrZ0DvWycg5Tz05X95xb6BPHCssZDSTv5NDKrq8z
         8ol5K2JGL/pK2rz8T8wZQeCOtl7WdbZ5vh8tk2R5jG4o56Bc34k/K1P1KMtVlws50oFh
         A9lismC6KifftiCRJ+QXuiXn+uW/bYCK6CGj/96EV6lFEdKHzar1vSLpYSRplQ06E6XL
         /E3hKoOlQpaQ2X6OQ2Ro2tHXws+NdmVRC3pxUQdvYwpEEsa/mkyAW6zSj3xxtpWI8hFq
         dshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=sPhQy9bzPvZCbKJn3X4c0DmF84w2iAYTOBUZIauNbVI=;
        b=mVw0I7xBVvjinkYxiwPpuBSEtysTA0joF4PScsVVX3vgSEFic1LlgOgyvEleDlZ0ZV
         hP4rdf8Tcu7nDHiDp+UF7nZjeoSA+mwvRsqYturQl1dEqSQzrglc7Zp917iflbpia3iy
         CqFGMW07+BJ7kWHkTH8kGzuNPfP56urqUjkITTsfTXgxK0ahgfjG0+sLNCGReVdQeFzu
         qiAMf9KWx8iuwdGAToWE9fChX5PlMagteSzSDjKvTz6Im42tjdtYQvvwRlnfockM/yjh
         jiYumyFs1M1CkTTTyfASIt0Y519aBSzx5B+tVjqo1mOpiYd2nncY3yeHK8PxpdHfCXdB
         pVlw==
X-Gm-Message-State: ACgBeo3ToCov7/3g882CrKi/HdIl5DsAB3R4mWDmREAB3zVxr77xc/yo
	Y2b8vr3mYipcxblveeKjGJWi16W/qmL3t6srOum2vdmbuKEmIg==
X-Google-Smtp-Source: 
 AA6agR47v6UUns6OYAl9/4nTj5VtxjqXskzoXDbybDSqHSahL1AvZV5JqB2wRqDUDuekYqR2eNM2x2+l0nroaBbdSL4=
X-Received: by 2002:aa7:d98c:0:b0:44e:affc:7000 with SMTP id
 u12-20020aa7d98c000000b0044eaffc7000mr29107522eds.269.1663121989065; Tue, 13
 Sep 2022 19:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1662559557.git.steve@sakoman.com>
 <005bfa0639724248f2a257cae0108ecd16e7314b.1662559557.git.steve@sakoman.com>
 <6ce4bb69-f2fe-c6f3-86d7-ee220f30009d@windriver.com>
In-Reply-To: <6ce4bb69-f2fe-c6f3-86d7-ee220f30009d@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 13 Sep 2022 16:19:37 -1000
Message-ID: 
 <CAOSpxdb6xaKFw3rxRPuUqzrM+jvFnGLm089nFq918nXf3LqSmA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 07/24] libtasn1: upgrade 4.18.0 -> 4.19.0
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 02:20:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170616

On Tue, Sep 13, 2022 at 2:37 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2022-09-07 10:20, Steve Sakoman wrote:
> > From: wangmy <wangmy@fujitsu.com>
> >
> > Changelog:
> > ===========
> > - Clarify libtasn1.map license.  Closes: #38.
> > - Fix ETYPE_OK out of bounds read.  Closes: #32.
> > - Update gnulib files and various maintenance fixes.
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > (cherry picked from commit b8f2c6ec61ffcc607a35bd5c11f5020c9b676226)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >   .../gnutls/{libtasn1_4.18.0.bb => libtasn1_4.19.0.bb}           | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >   rename meta/recipes-support/gnutls/{libtasn1_4.18.0.bb => libtasn1_4.19.0.bb} (90%)
> >
> > diff --git a/meta/recipes-support/gnutls/libtasn1_4.18.0.bb b/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
> > similarity index 90%
> > rename from meta/recipes-support/gnutls/libtasn1_4.18.0.bb
> > rename to meta/recipes-support/gnutls/libtasn1_4.19.0.bb
> > index db49adc1c2..5fb8b54c06 100644
> > --- a/meta/recipes-support/gnutls/libtasn1_4.18.0.bb
> > +++ b/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
> > @@ -16,7 +16,7 @@ SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
> >
> >   DEPENDS = "bison-native"
> >
> > -SRC_URI[sha256sum] = "4365c154953563d64c67a024b607d1ee75c6db76e0d0f65709ea80a334cd1898"
> > +SRC_URI[sha256sum] = "1613f0ac1cf484d6ec0ce3b8c06d56263cc7242f1c23b30d82d23de345a63f7a"
> >
> >   inherit autotools texinfo lib_package gtk-doc
>
> I was a little concerned about this update for kirkstone but
> after a little review, it seems fine so I thought I'd reply to show
> Steve that people do eventually read his updates and to re-assure
> any late to the party worriers like me.
>
>
> Full git log --oneline below but the source is mainly in 'src and lib':
>
> $ git log --oneline v4.18.0..v4.19.0 src
> 4e74cf2 Bump copyright years.
>
> $ git log --oneline v4.18.0..v4.19.0 lib
> 6acc6d9 Work around unfixed gtk-doc problem.
> 5ce3238 Some C89 fixes.  Closes: !70.
> 44a700d Fix ETYPE_OK off by one array size check.  Closes: #32.
> 33adcd0 Fix license header.  Closes: #38.
> 4e74cf2 Bump copyright years.
>
> so that all seems to be sensible.
>
> I may learn to trust Steve (but I'll keep verifying...)

Please do!  I'm not sure I would trust me ;-)

Steve

> $ git log --oneline v4.18.0..v4.19.0
> 2b7ee16 (tag: v4.19.0) version 4.19.0
> 6acc6d9 Work around unfixed gtk-doc problem.
> 53fe8c8 Improve CI/CD artifacts, and fail on errors.
> 06e7433 Put version checks in tests/version.c.
> 513bb42 Deduplicate.
> 51e04e5 bootstrap.conf (src_gnulib_modules): Add getopt-gnu.
> 290a4ad Build check with tcc/lld/pcc.
> 5ce3238 Some C89 fixes.  Closes: !70.
> b66b8ce Attempt to reproduce !70 build error.
> 4af0fbc Bump LT_REVISION.
> 42467ed Add sc_libtool_version_bump syntax-check.
> 74785e7 Move gnulib's dummy test directory from tests-gl to lib/gl/tests.
> 45c87b5 Add NEWS entry.
> 44a700d Fix ETYPE_OK off by one array size check.  Closes: #32.
> 1487507 Make sure syntax-check catches indent mistakes during cicd.
> 6533485 Add self-check for #32 to see if cicd catches it.
> 33adcd0 Fix license header.  Closes: #38.
> 72e30be Add NEWS entry.
> 7b58af4 Silence syntax-check.
> f1436e1 Silence sc_makefile_DISTCHECK_CONFIGURE_FLAGS until we clean up
> coverage code.
> 7c54eb1 Put gtkdocize in bootstrap_post_import_hook.
> 2a2686c Update bootstrap.
> 81b1cb0 Update gnulib.
> 4e74cf2 Bump copyright years.
> 02bf9cb Don't use -static when linking in fuzz/.  Closes: !61.
> 56d2301 Use portable way to remove carriage returns.
> 3af8286 (origin/jas/tmp-cicd) Don't use non-portable diff
> --strip-trailing-cr.
> 607e6b1 cicd: Add targets, reduce texlive.
> 581e2a3 maint: Fix builddir!=srcdir abi-check failure.
> c9c8de3 maint: Attempt to minimize texlive dependencies.
> 6182cf4 maint: Fix (and CICD-test) builddir!=srcdir bootstrap builds.
> 4332821 maint: Remove really old release announcement template.
> 5b766ad maint: Really remove texinfo.css.
> f3c679d maint: post-release administrivia
>
>
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#170402): https://lists.openembedded.org/g/openembedded-core/message/170402
> > Mute This Topic: https://lists.openembedded.org/mt/93525901/3616765
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
> --
> # Randy MacLeod
> # Wind River Linux
>

