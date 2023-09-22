Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB52E7D0CB
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 05:18:26 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.14927.1695359901291614103
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 22:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kDwAYDZP;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c008042211so29133301fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 22:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695359899; x=1695964699; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zLdPx2tOY2wsrxOwPSrRrbSkAqc+v+JNUU6wmoFr9BY=;
        b=kDwAYDZPXTFogIVg0scxqYo/sk4LwtgBNAyKrvinXfoIoJsV0o1FxdzcjtFbyedrgz
         O1aST2mSLHz9+kejGNATPL65pa7heSoi30JlEmEngX9Y6HvhRRtQAm9+ixjuo+6FAsvB
         Xs9Vn0IFOwY+i/YfCiXylfdD9tem9GEnWTSLGQH6v3Qu1PWyj2DIo96I+zCkOwu81GXh
         apb8vxdUBCXXVo3cCirvAu2aIRFpW1/nTTd7d/VELdQrvcbzKhNGrFTyZ5awe7cSU+2f
         J7xUhtp0a0hZ1kkYzbuzSBJG4dWRbwl8yKCsQl//G3kZ7bQxczCE5+EROEuazqzXjCe9
         rafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695359899; x=1695964699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLdPx2tOY2wsrxOwPSrRrbSkAqc+v+JNUU6wmoFr9BY=;
        b=T8S/3J27uzQmLPantXI8ZrygN9vwNDiBfGpKNu544AgJCN0eJNypa/q/Yvw7nP9rk5
         7L5wPmVZ0YhdJwK2M3WDQozQ3bBD13PHTe6bE7++P2XdPOs6qjsTDD8+9aF10jYZtimv
         87wnnAOcGhmm4Oez7uLiQa2rD2zucZjPRSPS6aJjxVLipZvIVp3Zcoafd4YGxoggJHTl
         +i7cWMQ2MZdTS/ALeI/pRGoFO/Uvzg5lGGpjo0rXmMARpcmAKGgqiI80zdsFDEjMBPMk
         dzXfqZImbKhYTDfqG0iuotjt4WsHnTfp5qiB4QAfcjGVqi53KVCCb3q82B+umlLas4OY
         C5xQ==
X-Gm-Message-State: AOJu0YxQHrgkToIaL9k4+tP1aj2NYGXgNC9WiWLgBSzmF7Mj3Am6KQKx
	IoGrv7vRJQanp4iOWtBnp/a9phz7ZZDDJliCiQU=
X-Google-Smtp-Source: AGHT+IG60t0R0JvZwQVy3ap2J12SiH3JMBNdhQkJ+fSjkGotA+N8phxfu8DJhVd7TR7cfvzfLcKo6TYYVSBZnrxoieQ=
X-Received: by 2002:a2e:854c:0:b0:2bc:e51d:d09c with SMTP id
 u12-20020a2e854c000000b002bce51dd09cmr6359148ljj.36.1695359899115; Thu, 21
 Sep 2023 22:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230920181526.386874-1-f_l_k@t-online.de> <2023092114422322cfc0b0@mail.local>
 <20230921205944c6389866@mail.local>
In-Reply-To: <20230921205944c6389866@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 22 Sep 2023 07:18:07 +0200
Message-ID: <CANNYZj9JH-gcfAQad2y7SQuq2aMQ--=8J65xe--fW2gG3j4=TQ@mail.gmail.com>
Subject: Re: [oe-core][PATCHv6] vte: upgrade 2.72.2 -> 2.74.0
To: alexandre.belloni@bootlin.com
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 05:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188037

On Thu, 21 Sept 2023 at 22:59, Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
>
> BTW, I'd like you to test patches before sending because you claimed
> this was tested with oe-core but this was definitively not. The fact
> that we are at v6 and this still breaks builds so early is very
> annoying.

Was this claimed somewhere? I am not seeing it. The latest breakage is
on an esoteric configuration (oecore without poky, which has a
different set of default distro features), so I do not think it is
fair to expect submissions would be tested there upfront.

Testing on poky for a basic target is expected, and was done, but
things like 32 bit, musl, retro computing platforms like ppc or mips
are on the AB to run through. Otherwise submitters will just decide
it's not worth the trouble to contribute, and we're back to me doing
the bulk of the updates, which is the outcome I am not going to
appreciate.

Alex

