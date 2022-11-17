Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1AAC433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 15:17:54 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.18438.1668698268487876290
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 07:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bSR05COB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id w14so4385140wru.8
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 07:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FReh/Bu1T+xQkE0DW9yFBayyO8PAAMhEr0L2vSxYjTY=;
        b=bSR05COB5htrZjq+ZIrrfzSuGwcCS2V3jqNlKcCs+F9ODCjnqZnswub7xkfl8YuEJK
         6ZfmTaj021HfDQjXroTV1SrtVxAbYGGHePEnI/O0ZnYRtEDd2kTNEkScb+swnrgEYqJn
         jJHZPPNw2pc8TGxdEjIXVZ4hCMs4AjV7xKDzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FReh/Bu1T+xQkE0DW9yFBayyO8PAAMhEr0L2vSxYjTY=;
        b=cBC1UcIm9SMjrYImsDAJpAXwPcMhYY9A0Ga+mikWJqFcHKFaVVtJWmUpov+9RhYtFO
         PZBPefyWl0lRi8KRJdDtUyGUaOYnTQoFH7kqsWCcU0IROwjE8f5wuSlQsBIwZ3ZwdkTL
         l6wZ/QvemSUosc2+KpxNnL2B26q2ObNKN0UmlLJ/Ut8XduQ/F8TRSPTCQwPNEuy5lU2z
         Ui0gjmKRQv+afgU8W9JGLD7su6FewDZRhqdgF5xsLEP3hIg21+Sk4Faa21IZWsxsMYXX
         D2v7TfeCUuTV0Cc+AQi1RGoFNJt5ArnWbW6cJLt/gHMpdqp4xbK6hX6Ty2hjUlPcVXjB
         W6bw==
X-Gm-Message-State: ANoB5pmUrNr+AeSb2yUY5IwkPVSHXeWnH8mLKoSmikDE3qgCYhE532cs
	0dDlf8fnhD/udpGw81Cyd810SQ==
X-Google-Smtp-Source: AA0mqf7BAHWVHubp9aTfjTik0EHCEIVXTlWtAy+K9bUpUhrjrx/ZTOWb1DmyFsSKdxjCzqCM2MQPNQ==
X-Received: by 2002:a05:6000:8f:b0:22e:35e3:4427 with SMTP id m15-20020a056000008f00b0022e35e34427mr1756100wrx.44.1668698266819;
        Thu, 17 Nov 2022 07:17:46 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:76d7:bdc9:5165:906c? ([2001:8b0:aba:5f3c:76d7:bdc9:5165:906c])
        by smtp.gmail.com with ESMTPSA id l8-20020a5d5608000000b002345cb2723esm1216376wrv.17.2022.11.17.07.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 07:17:45 -0800 (PST)
Message-ID: <5b79cba0817750882a0ef1f1dd9b9581abc9db28.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/2] image specific configuration with oeqa
 runtime tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2022 15:17:43 +0000
In-Reply-To: <20221117071223.107064-1-mikko.rapeli@linaro.org>
References: <20221117071223.107064-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 15:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173429

On Thu, 2022-11-17 at 09:12 +0200, Mikko Rapeli wrote:
> Many runtime tests would need customization for different
> machines and images. Currently some tests like parselogs.py are hard
> coding machine specific exceptions into the test itself. I think these
> machine specific exceptions fit better as image specific ones, since a
> single machine config can generate multiple images which behave
> differently. Thus create a "testimage_data.json" file format which image
> recipes can deploy. This is then used by tests like parselogs.py to find
> the image specific exception list.
>=20
> Same approach would fit other runtime tests too. For example systemd
> tests could include a test case which checks that an image specific list =
of
> services are running.
>=20
> I don't know how this data storage would be used with SDK or selftests,
> but maybe it could work there too with some small tweaks.
>=20
> Mikko Rapeli (2):
>   oeqa: add utils/data.py with get_data() function
>   oeqa parselogs.py: use get_data() to fetch image specific error list
>=20
>  meta/lib/oeqa/runtime/cases/parselogs.py | 17 +++++++---
>  meta/lib/oeqa/utils/data.py              | 41 ++++++++++++++++++++++++
>  2 files changed, 54 insertions(+), 4 deletions(-)
>  create mode 100644 meta/lib/oeqa/utils/data.py

This patch looks like it is one side of the equation, i.e. importing
the data into the tests. How does the data get into the deploy
directory in the first place? I assume there are other patches which do
that?

We have a bit of contention with two approaches to data management in
OEQA. One is where the runtime tests are directly run against an image,
in which case the datastore is available. You could therefore have
markup in the recipe as normal variables and access them directly in
the tests.

The second is the "testexport" approach where the tests are run without
the main metadata. I know Ross and I would like to see testexport
dropped as it complicates things and is a pain.

This new file "feels" a lot like more extensions in the testexport
direction and I'm not sure we need to do that. Could we handle this
with more markup in the image recipe?

Cheers,

Richard





