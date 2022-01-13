Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E05C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 19:12:38 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.1591.1642101158058999696
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 11:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RFZnqiHg;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id x8so2366005qta.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 11:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gO0Is2WUkrzPH1HdigHncPy1jly/vEe+qVESScOtjcQ=;
        b=RFZnqiHgOrCmHDn2r6cnvbmhOmfxfBCdLYShjrSDWyvsN3xvUV66k4UPnJP2nJUVZO
         PWJVMtZJMxK4mWbPjNrDu4WttXvqNw4ZnsEBRZbRXg/1PAVM4pKf7FztJ9WJbRkWaFW2
         4ZDXg43JVccNJID06PXxXxaskv3O29ievym3Zq8emwR0XzEdglbs7cV+K4rL6nO7I2fq
         1d3e5Wi2983+oI691N115+RQH0Sob+L+c6J7+R0nl4I9QE3UaRFK7mRZpwDUYrnHGMJo
         mx/aaC3QvXO/XfXujtDjhUTDsrFeN2RSPK58yA1xjVfNlCkRd5cy6pz0YUpiNkwc3ah8
         5qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gO0Is2WUkrzPH1HdigHncPy1jly/vEe+qVESScOtjcQ=;
        b=RPRh2qSH2YkuQfL2PmuI9HWckgi+gQ9E79Yefu92/zwecthqPMJnIl+87ws8CAUEsn
         vRmc3sQnFTZuxULsaNoVAAkrLhclZ2VQGgBAJIlLys5nVUqFjChqkJ8r+m/7ovT5cGva
         ruGWgrS2s/LnA/GL00QUfv7oaNdsWv6yRTBI42GvknbKBIMfT97MUWQEgeKsIcWiP2Qr
         /2h0KUAI7yx6624jcgDLPG4TbshfhqA5jjskorN8tLQRswhorZP4kaSR0eD3ddVdB2HD
         E5nIvpYT0+JYkrYawfN0lqp/U2SV1NRTxEqgxpBHVyJ4t2UTjMvUUY+9bUHT4Kr1jDbs
         wCNA==
X-Gm-Message-State: AOAM530N5BwmWEb3QY82qE+Mbj4qkI6n/5c6875ZAGsvjCSbtPXeUnKY
	1UvcACiYts7qVLvXYzQyNwGb0sTyXEZrWXKbKz0=
X-Google-Smtp-Source: 
 ABdhPJz4t3JmhdkBBXlhbJHrDInmAHYK7N4kWOt8YC8Y3G0YCjUgktjlfkt0T2K+KXP7rDJ7+nUpdQ7dLSeqxWCIWPw=
X-Received: by 2002:ac8:134c:: with SMTP id f12mr4772994qtj.229.1642101157121;
 Thu, 13 Jan 2022 11:12:37 -0800 (PST)
MIME-Version: 1.0
References: <20220113173555.1925441-1-raj.khem@gmail.com>
 <CANNYZj85JnxcETSQFWqBZWLwjrOnuq6rpS=CZ9Okr66TwtiZWw@mail.gmail.com>
 <AM9PR09MB4642C9029183D8A03387674BA8539@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB4642C9029183D8A03387674BA8539@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Jan 2022 11:12:11 -0800
Message-ID: 
 <CAMKF1srXrw_80NNT6zaQsh8aR7gkw8YqDp=x+OjyHNnduFcO9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] valgrind: Enable network for ptest builds
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 19:12:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160529

On Thu, Jan 13, 2022 at 9:46 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
>
> My understanding is to add
>
> --nonet
>
> to XMLLINT_FLAGS = --noblanks --noout --xinclude --postvalid --noent
>
> in docs/Makefile.in
>
> and we should be good - haven't tried it yet but it should do the trick

right, good suggestion but it did not work originally thats why this patch.

>
> On 13.01.22 18:39, Alexander Kanavin wrote:
> > Why wasn't this exposed by AB testing? And can there be a better
> > solution (e.g. skip the validation step), since this would still break
> > on hosts without internet.
> >
> > Alex
> >
> > On Thu, 13 Jan 2022 at 18:36, Khem Raj <raj.khem@gmail.com
> > <mailto:raj.khem@gmail.com>> wrote:
> >
> >     do_compile_ptest_base uses xmllint which accesses internet for
> >     validating DTD
> >
> >     Signed-off-by: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> >     ---
> >       meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
> >     <http://valgrind_3.18.1.bb> | 5 +++++
> >       1 file changed, 5 insertions(+)
> >
> >     diff --git a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
> >     <http://valgrind_3.18.1.bb>
> >     b/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
> >     <http://valgrind_3.18.1.bb>
> >     index 7837034f92e..5ebcae467fa 100644
> >     --- a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
> >     <http://valgrind_3.18.1.bb>
> >     +++ b/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
> >     <http://valgrind_3.18.1.bb>
> >     @@ -98,6 +98,11 @@ CACHED_CONFIGUREVARS +=
> >     "ac_cv_path_PERL='/usr/bin/env perl'"
> >       # which fixes build path issue in DWARF.
> >       SELECTED_OPTIMIZATION = "${DEBUG_FLAGS}"
> >
> >     +# This is needed because xmllint needs access to network to
> >     +# validate DTD 4.3 onwards it uses --dtdvalid
> >     http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd
> >     <http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd>
> >     +# to xmllint, allow it to access internet
> >     +do_compile_ptest_base[network] = "1"
> >     +
> >       do_configure:prepend () {
> >           rm -rf ${S}/config.h
> >           sed -i -e 's:$(abs_top_builddir):$(pkglibdir)/ptest:g'
> >     ${S}/none/tests/Makefile.am
> >     --
> >     2.34.1
> >
> >
> >
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#160527): https://lists.openembedded.org/g/openembedded-core/message/160527
> > Mute This Topic: https://lists.openembedded.org/mt/88401996/3647476
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

