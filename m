Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D235C77B61
	for <webhook@archiver.kernel.org>; Sun,  9 Apr 2023 08:43:22 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.15640.1681029798573678040
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Apr 2023 01:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bgxwjfTH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id j1so6157268wrb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Apr 2023 01:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1681029797;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kn32yhXnJX3wj/Z+775ZCWlYq6HvHOBn1AjxKcmt764=;
        b=bgxwjfTH4kX6uYYk29eGQqBFUgxZWRnhEKlOQ6OG9pRu8iYZhMocs10DMw9acntF7J
         0fYnjQLUkf4CsgZCtBBY4tdUUFJWgU4Ns57N0sAl57ZaUqM0VX1KypZNPKhVExrlWTqU
         +gqnyJ5Q3Uu84xE8dx3yL7as+2Kl58XjnOTYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681029797;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kn32yhXnJX3wj/Z+775ZCWlYq6HvHOBn1AjxKcmt764=;
        b=xaXc1khryHFPjfBnQf3VYrivMAFVZS6U2XkeWxjeXDH0Aqrn6B/X9W8GGF+6Q8IujF
         xDnVioY9faEpTifTa70A+CaxwA7Fca9d7YRAiKF0+Vm6A54UrxVV47JKwv0misiFaYWI
         ERD1U9R3XshXByzYjoa3MHC4N8vENARVQie7wXKLwrBkvvvHMv+e+3bmQ/pRg75EI4mD
         4ZS7nlmF5bRL9hPrV8z0ZqK2jTgSN24jJ7K525cKVSfTDlxDSE/Q3i7fE5GwP8YAVl9Z
         cLS2VDmf5PQi3wqj+mOiK3AspIinHTfyaC9Q1EGzKDwgWJ5/uytud05zSF+iBXlEX7o2
         v+Jg==
X-Gm-Message-State: AAQBX9ePrrW+TT8lS3kLWR5lN+CzAEAsMTrvSligYHRkH07sYg9NPnXz
	bIX6pbTDeCdLMWCA8kSVvyAKOw==
X-Google-Smtp-Source: AKy350aRh/V3atNrqxwCSDeHMN9LYYlHEjCCyPcXGKIoWTkS6xwJvq4ghDAF19+jNqvDBt4Je0LScQ==
X-Received: by 2002:adf:f4c4:0:b0:2c7:adb:db9 with SMTP id h4-20020adff4c4000000b002c70adb0db9mr2618395wrp.63.1681029796797;
        Sun, 09 Apr 2023 01:43:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:44f1:76c5:692d:9225? ([2001:8b0:aba:5f3c:44f1:76c5:692d:9225])
        by smtp.gmail.com with ESMTPSA id m5-20020adfe945000000b002f006acacc1sm1403121wrn.97.2023.04.09.01.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 01:43:16 -0700 (PDT)
Message-ID: <6381549a7f058cb233c656dca9324ae4d7a435c2.camel@linuxfoundation.org>
Subject: Re: [OE-core] Reproducible build
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Frederic Martinsons <frederic.martinsons@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 09 Apr 2023 09:43:15 +0100
In-Reply-To: <CA+cAkerWUvabx_kzN2s6S64454t88ifOR+nqtaLwk0wHfw3n2Q@mail.gmail.com>
References: <1753B0402875C548.11304@lists.openembedded.org>
	 <CA+cAkerWUvabx_kzN2s6S64454t88ifOR+nqtaLwk0wHfw3n2Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Apr 2023 08:43:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179835

On Sat, 2023-04-08 at 09:56 +0200, Frederic Martinsons wrote:
> Forget my previous question,=C2=A0
>=20
> I simply
> edit=C2=A0https://git.openembedded.org/openembedded-core/tree/meta/lib/oe=
q
> a/selftest/cases/reproducible.py#n137
> to replace by zavariant, and with=C2=A0OEQA_DEBUGGING_SAVED_OUTPUT set , =
I
> managed to see the html diff
>=20
> Nevertheless, It took one hour, but it seems that it cannot be
> avoided since there are two builds and one
> without any shared state.

Unfortunately that is the nature of the test, one side has to be built
from scratch. Tweaking the test as you'd done to target a specific
component is what I'd have done too to speed things up for a specific
recipe.

To get a further speedup, you could probably keep the sstate for each
of the two builds separate but retain both, then in theory on the
pieces you change would rebuild. Again, it would mean tweaking the test
but for debugging, I think that is fine. Rust can be a pain if you just
rebuild those as it still takes a while. Thanks for taking a look!

Cheers,

Richard



