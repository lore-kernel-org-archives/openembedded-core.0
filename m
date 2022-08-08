Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2756C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 07:43:56 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.22614.1659944631665162253
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 00:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=acuIUouL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 i128-20020a1c3b86000000b003a536d58f73so1986828wma.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 00:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=P+lgcOyrWDaYqfxFlNe2eoXkoNosbhEPu3Y/6ISHKrM=;
        b=acuIUouLhkavZ8y4EuaBqVy9l1UOluwo6TrYePhTJW6ME1DIKjbSrBmV8awUlrNr7a
         x3L1NLBkrHlPbGgKm767mvUm2X0/oWRq686/WunJrvDyCt82C+x+s2zu/KRwEBLj0M7q
         NbRXjqLZdnOf+Z5uBB6g/omPVNTEVzHTX9oFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=P+lgcOyrWDaYqfxFlNe2eoXkoNosbhEPu3Y/6ISHKrM=;
        b=OElsViX2KpvRKexHz5Gf4rAeYw4JlkhWumZgrRWPNd/W7AAdmcyOojkSmBCXV2jiyX
         6A9A9ozKmHXzyycE+4JEjmdg9oghPfxJ2WsWD7tiVnaQ27SUUeTMRA7fPA15+XDNY0VU
         GwNeqDRmK+btbxtmhmCtw8E6H9Q3pdMbewim1IsHWvWlYPjF5FFjiThflyRUPkdvQTuV
         ggU4IBi/R5Og8656Igv7h4zv/QR8orrsdFrdLUWH1fMtyKoys4BJOly2/ln8LwIV39ot
         21tP+YynjFB662zhvrEj2TZx65pEX4jbBKv98KzSAAi+6uNo22Ku/W8pDVH98xP+7Hd5
         o9VA==
X-Gm-Message-State: ACgBeo0dXZHmETwd+wid9hJSs0dY8V0TEXg/7hVeyO+64l0aziCJmUHT
	Rs0twXJiLBx6VH6NDZzf7da28g==
X-Google-Smtp-Source: 
 AA6agR6sL7tx4vddWz6sPF1XoAxW3HL6uePS8pmzy9EyA9eeLjmzsYph651asGLxzN4ZzEcOiMhbEQ==
X-Received: by 2002:a05:600c:1549:b0:3a3:2aa2:6f60 with SMTP id
 f9-20020a05600c154900b003a32aa26f60mr11872927wmg.57.1659944629853;
        Mon, 08 Aug 2022 00:43:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d3ed:8697:1d83:a16?
 ([2001:8b0:aba:5f3c:d3ed:8697:1d83:a16])
        by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b003a35ec4bf4fsm13062355wmq.20.2022.08.08.00.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 00:43:49 -0700 (PDT)
Message-ID: 
 <5b490d3995e9290f4296a120870ad04c7be9d80a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 09/45] patchelf: update 0.14.5 -> 0.15.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Mon, 08 Aug 2022 08:43:48 +0100
In-Reply-To: <20220808063843.3975130-9-alex@linutronix.de>
References: <20220808063843.3975130-1-alex@linutronix.de>
	 <20220808063843.3975130-9-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 07:43:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169072

On Mon, 2022-08-08 at 08:38 +0200, Alexander Kanavin wrote:
> Drop handle-read-only-files.patch: read only files should
> be handled by making them writeable explicitly. See
> the upstream discussion:
> https://github.com/NixOS/patchelf/pull/89
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../patchelf/handle-read-only-files.patch     | 65 -------------------
>  ...{patchelf_0.14.5.bb =3D> patchelf_0.15.0.bb} |  6 +-
>  2 files changed, 2 insertions(+), 69 deletions(-)
>  delete mode 100644 meta/recipes-devtools/patchelf/patchelf/handle-read-o=
nly-files.patch
>  rename meta/recipes-devtools/patchelf/{patchelf_0.14.5.bb =3D> patchelf_=
0.15.0.bb} (79%)

patchelf is used by uninative and you have no idea the world of pain
you're pushing onto others by dropping this one. It isn't as simple as
you think due to the places patchelf is used. I don't remember the
details, I do remember thinking along the lines of this patch and then
changing my mind though.

Cheers,

Richard



