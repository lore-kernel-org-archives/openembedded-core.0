Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.1592.1605928083052091515
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 19:08:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=F/QxG4m2;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.175, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f175.google.com with SMTP id e10so1282642qte.4
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 19:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wWLfOqHx8UN51pZ/Q8tblf3TyNf6pppgL9lv1um28ww=;
        b=F/QxG4m211IN9Keu14MrNZ2pUjQSe2crkJggIzNDUsjc6tD2tDt1BFzXYuMUydVIGy
         LAMOgjlUPyZDOxcMOuOJqAMyJhN8hkZzYxDwYUxpDCROKO9wrj3KFm+476Mz1ie0LUJN
         7u9UocRcfRpJTQXmmuB9afx9H514LdGfknxbZZWiHGON3iy59pXxIOk1XqtFL93eZSdc
         l7U7aCIhsS2Il939/Ilq5/p0Nk30HotQVWBIJSVli7++VGwKrAkmLreHzdA117z7TnJR
         jBcQooh6S2z7RK2RaY7i2YWYBTyRIYFaSzFslajntoNp2WBiF/Z7UwW8jNw4Uo5H2oKX
         L/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wWLfOqHx8UN51pZ/Q8tblf3TyNf6pppgL9lv1um28ww=;
        b=CQnnKG9Wih0luqeu4qM55Laew+5NddLol11Ch93LED7K1AqlLk1oIbwuTyEkI+mwDe
         +qGtxpaVBQHuGZXP9MLJCK42UGAuL2jLm0mQj3nJ15l7Z7Ls10w/d09PAHM2XNW5C0uQ
         5aJKCUoAwn0IXWjUQOM+YO8kBl2F9BXqplfNsc08F8CdMGZyQfRP5yV1IRZs8Eb8mhwl
         h6hyNwvAnKxkqoOS8MCHiBmR+TAoUDa/jIds03ERzM5nFUMazBw8AB8LAb8oQnHqCr9S
         1SF6Wnsb+xe3UQQGOa4/kTxCkWl4hoxfZbBUJr9ZJj85AeJKGJunSFrrzb8v24zmWhdn
         2RIA==
X-Gm-Message-State: AOAM531cEEU5acX5luGWL1fIwJ2PpvdQFntb/G3Z4ha+bp/H3pYgsnZT
	jsuFnbw5rzL6aEDkwV8IdCVMpekPxJgVotVX
X-Google-Smtp-Source: ABdhPJxFylooq0BSliK5yD+CfIHs+NxZAIlhMg6IQ6AjkVrRDTTpD8I5pGsOlpxfNj69BQi5Zz9ddA==
X-Received: by 2002:ac8:7494:: with SMTP id v20mr19078535qtq.12.1605928081852;
        Fri, 20 Nov 2020 19:08:01 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id f189sm3326548qkb.84.2020.11.20.19.08.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2020 19:08:01 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f178.google.com with SMTP id u4so11009326qkk.10
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 19:08:00 -0800 (PST)
X-Received: by 2002:a37:7c81:: with SMTP id x123mr18518324qkc.383.1605928080473;
 Fri, 20 Nov 2020 19:08:00 -0800 (PST)
MIME-Version: 1.0
References: <20201121030253.20884-1-okaya@kernel.org>
In-Reply-To: <20201121030253.20884-1-okaya@kernel.org>
Date: Sat, 21 Nov 2020 00:07:47 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqLZ4-Lchwephgik88HY4T1JFPwFKKCz3_ciCZ4YdkrOA@mail.gmail.com>
Message-ID: <CAP9ODKqLZ4-Lchwephgik88HY4T1JFPwFKKCz3_ciCZ4YdkrOA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] heaptrack: add bitbake recipe
To: Sinan Kaya <okaya@kernel.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em s=C3=A1b., 21 de nov. de 2020 =C3=A0s 00:03, Sinan Kaya <okaya@kernel.or=
g> escreveu:
>
> Add this useful tool to the devtools list.
>
> Signed-off-by: Sinan Kaya <okaya@kernel.org>

Why split the recipe; please unify it on the _git.bb file as it is a
single version and there is no gain on this indirection.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
