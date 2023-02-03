Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854ACC61DA4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 14:40:10 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.12012.1675435201044913755
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 06:40:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=atQihwC1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso4010051wms.4
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 06:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhmH4xOABldztrDs1aoEwiaxm64K4kpRygOqG0JMwfo=;
        b=atQihwC1yszdwQN8TnZThpzcMHWo6b2tyBf5K1p76ouqeb6wDkbpzZQtdHMDR6hbTN
         mWVKkgdyUBtx8xRyUeqyeii9kSJV+pGteZb1wJm2q9G2DKCEAG/fuL0JkHgCZ+slTica
         VTKpQDUSb1GtOKSbrjQgQBa2ZEi8JSWycpo50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OhmH4xOABldztrDs1aoEwiaxm64K4kpRygOqG0JMwfo=;
        b=LfNtRg72L0R57nO7z+aNx7YAGVWlPLjKScISRqpeRQsgt/gu90oZGG0jGFCm9eyJFp
         AbGNaCJdGtYmwxQB2v/XlaEHZs6K4GNhZHSDhuhhcyvWtQRwNvf5i77g/x+m6Woq3qVN
         oMmjxAa/mY3y17q7T+KExVJoI+gz8EJfcQvAPMu/cDdRi6TflEUkKCrN/Ei2mCRcT3Ye
         K7MBBcx7mL4Kvip5cJpbnq3NfBEisVz4Zz1yLGn6jZtWccKkD+iPlIK6o4r+Jomn/902
         Trendd5TPVxszrh2kazO/3i1rNuuvdd+wty/l6gSmjVV50muu3GZ4PaIYpYIZKs6A6ew
         QN1g==
X-Gm-Message-State: AO0yUKXr1vIIRCj4egzbnpXgmTTgA80iylIxjtU2tqTvP0W5FcJ5QfjZ
	MNxsBYjQvpkf0Y0AhSy2Yf8LNw==
X-Google-Smtp-Source: AK7set9aQgtPCbmjuoWI58jwcrJhP+54oKcHrsgeuAZyl2pqFNXG+cGDoyfJFUwXYsKvlkZeZ+6xMQ==
X-Received: by 2002:a05:600c:4f07:b0:3da:fd06:a6f1 with SMTP id l7-20020a05600c4f0700b003dafd06a6f1mr9401509wmq.31.1675435199293;
        Fri, 03 Feb 2023 06:39:59 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a52f:3f73:91fb:2c5a? ([2001:8b0:aba:5f3c:a52f:3f73:91fb:2c5a])
        by smtp.gmail.com with ESMTPSA id x33-20020a05600c18a100b003dd7edcc960sm2656751wmp.45.2023.02.03.06.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 06:39:58 -0800 (PST)
Message-ID: <cb79281484491357d3b1cf826e56a2cb373cadf4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-pytest: Remove dependency on
 python3-toml
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Arnout Vandecappelle <arnout@mind.be>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 03 Feb 2023 14:39:58 +0000
In-Reply-To: <23e3e195-ab2f-563b-e918-7156a9d28978@mind.be>
References: <174002D603CDFD91.3213@lists.openembedded.org>
	 <23e3e195-ab2f-563b-e918-7156a9d28978@mind.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 14:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176718

On Thu, 2023-02-02 at 13:52 +0100, Arnout Vandecappelle wrote:
>=20
> On 02/02/2023 13:49, Arnout Vandecappelle via lists.openembedded.org wrot=
e:
> > Since version 7.2.0 [1], pytest uses the "batteries included" tomllib
> > module for parsing pyproject.toml configuration files [2]. It is
> > therefore no longer necessary to have python3-toml in RDEPENDS.
> >=20
> > [1] https://docs.pytest.org/en/latest/changelog.html#pytest-7-2-0-2022-=
10-23
> > [2] https://github.com/pytest-dev/pytest/pull/9741
> >=20
> > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
> > ---
> > This patch only applies to kirkstone and langdale branches. On master,
> > Python 3.11 is used which no longer needs tomli at all. On dunfell,
> > pytest is still on 5.3.5.
>=20
>   Meh, I copy-pasted the commit message from the kirkstone/langdale patch=
 and=20
> forgot to remove this bit. I assume I don't need to resend for that?

Correct, that won't make it into the applied commit.

Cheers,

Richard

