Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69989EB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 11:33:35 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.9369.1686742410802935088
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 04:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=EWqu+/5U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f8cc042ea9so4570145e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 04:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686742409; x=1689334409;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yr8EnWLjMt9wjFXegYUDG+e+leQtLfgsxJ++s8qqujM=;
        b=EWqu+/5Ug5/nlTDzFvDWBdBJNbWdIbQmJrTcngvVjfMBrMfqmRBEFJcPcfJBoFdnuy
         bqAsOkLS2W1q6dzyxgi+gPla7kB46w+iEGYftuICkvroQXvS8tIh/w7Ximp8Fm2wGJ4t
         TsFDpP5zB+Jh8G77Xy/p1hvr7eyIosW8rzzvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686742409; x=1689334409;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yr8EnWLjMt9wjFXegYUDG+e+leQtLfgsxJ++s8qqujM=;
        b=Brqax7wQyWrLqRyWoqdNFMwQ3wC9EUoAmz4o/7/TexmbFB39rZLORVXX51VSF7hS+O
         VOnkC45gH9kXWpRJ+xCJDgB2J7XLhdHtRKqCv1SXz3hv091+z11il48ZFXHDWPuLU93e
         BAinlBJZ3i/1R+paXqPGD4lxRcloNU/Ya7/XZoTHARsC6BRJMNDUmu+z5Ug7EeN0F9uz
         L09K/Uv3UTZPRkgXVgJohFAdmvDg5EkEDx1j7VUspLOf98Lv8TAvsBULiSa3GIrYxay1
         jyI2VkKqhyZLtHgbSDt9zAB08uFQZ4q0cyb6WDlnRdEN4jyyrKO8gqsUCWwkPFuEE+vF
         GXHQ==
X-Gm-Message-State: AC+VfDwqlNqFkYDJ2Q+GPOc8qxb/DDBKyWAcrQtN3jdRMzmO5/+tC2u+
	cUPPHmB6+4EboXlDCbyIMufiyQ==
X-Google-Smtp-Source: ACHHUZ4xApkdbYsYVXYb/Uq8Cpq/EBdbXztO1oN2EL0mmk61To4wKu9h5BJClzBFk4Pu/VbOX+gcCw==
X-Received: by 2002:a05:600c:2204:b0:3f6:91c:4e86 with SMTP id z4-20020a05600c220400b003f6091c4e86mr9559522wml.3.1686742409082;
        Wed, 14 Jun 2023 04:33:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5d56:2e19:9720:bd3b? ([2001:8b0:aba:5f3c:5d56:2e19:9720:bd3b])
        by smtp.gmail.com with ESMTPSA id c21-20020a05600c0ad500b003f7310a3ffasm17198412wmr.2.2023.06.14.04.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 04:33:28 -0700 (PDT)
Message-ID: <e11a1b213cb0a90b5d4cba87c7214369be182bae.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/55] insane.bbclass: add a SUMMARY/HOMEPAGE
 check (oe-core recipes only)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Wed, 14 Jun 2023 12:33:27 +0100
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 11:33:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182803

On Wed, 2023-06-14 at 11:28 +0200, Alexander Kanavin wrote:
> This was done in a selftest, but that is too late and creates
> friction in integration as errors are not seen until autobuilder fails.
>=20
> Bonus fix: SUMMARY check wasn't even working, as in the absence
> of one set in the recipe there is a default value set from bitbake.conf.
>=20
> I left DESCRIPTION check out for now, as many recipes don't actually
> have it, and it's set from SUMMARY (plus a dot) if absent.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes-global/insane.bbclass         | 26 ++++++++++++++++
>  meta/lib/oeqa/selftest/cases/distrodata.py | 36 ----------------------
>  2 files changed, 26 insertions(+), 36 deletions(-)

I think this change is in the right direction but there are a few
things I think we need to tweak here.

a) I don't like the " if not '/meta/recipes-'" check at all. We now
have the groundwork for layer overrides in bitbake so I'd like to
complete that, then we can make some of these WARN_QA entries as layer
specific. This has the added bounus that other layers and more easily
adopt the tests and raise the bar on quality.

b) I really really don't want a do_fetch postfunc doing something that
isn't fetching. I know why you've done this, so it appears early in the
build and so on but it doesn't belong there.

There are other sanity tests at parse time in anonymous python which
also bother me since the increase parsing time and also shouldn't be
there. Those often aren't gated on ERROR_QA/WARN_QA options either so
can't be configured.

Given all this, do we want to consider a new task which covers these
kinds of tests? A new task does have certain overhead but I'm starting
to think we might need to do that. Of course there is then a dillema
about which task it would need to run before.

c) There is an issue that warnings are not restored from sstate. If you
rerun this build after seeing the warnings, the warnings will not show
again. This is going to confuse users and cause issues to get missed on
the autobuilder. There is an open bug for this one, it isn't an easy
fix unfortunately.

Cheers,

Richard

