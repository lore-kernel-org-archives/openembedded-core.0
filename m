Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE826C0218C
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 08:16:28 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.47294.1737965784436708486
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jan 2025 00:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UYzr2Anu;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6dd43aa1558so38890616d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 00:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737965783; x=1738570583; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rUOYVZIffDzxE/x66HUB7es9A8pEW+WeXnLVAGOpBJA=;
        b=UYzr2AnuaEsFy0YaW2YZqXgQzloGsr4aA/gpZDR9/Wri/fCy0oq6KhllgOjoNy9bDJ
         XyQLW5NnZE8xxc513ipVKEeL7oxew88txkQvQuodPacaK9ATn9s23dKtstXm/Jxug/kM
         xhBCUfY2GPOZkGI+B7jHMBj7BGkiaY9HW1P/6q4WQQOGetisfGZDkryMTbh3e5NecY5y
         AEJ+Pj3IXAxtzdBxNs2pBPHB9exqTZtLgSFqf2YFHw0w8pwGLOcEJy1PDQxGL6OFNiHw
         87+NrgoLV5qn1mwAFbIAIdxX2RdVuIOoqHedU81DR4xd6KRyYDOtrquVvtfkEZTjaN59
         D1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737965783; x=1738570583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUOYVZIffDzxE/x66HUB7es9A8pEW+WeXnLVAGOpBJA=;
        b=Tzow1jFfqRYz1H3/ecuHYg9QLvNV8hPS/RaXJSud/pLvbzusRhV5iEyC/gkfnrdBMU
         lqTG7dX9AilxEeT/Q+DRFwPW1Vr6htgKDKcWR5JWbPqZxlaP596J8yXgN26eY5o9a3dO
         11Z1o9CMKmTIMUHTv4700OE1nBZRNTRYwyH4d+X+QTPO7aarJR85SitB9JozFouobhSy
         rqsmMBzrG7QYvP/uqmKYvPEeykD3wi4DZX01EnOV3kuqHUMhWvImMl8HKFUPVB8mKhKM
         HMhOLZbgP/0srumhsfbhU0UyDsJEC8uq2sSv7l/O8CaHUn1jZrfoLdu/pUtCrBqiJSm0
         XPiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMZ8OaRaKfyj/p4Bl3WkKHC2PR/8TY24tanRLzyM3/aJtg5Azh+PowOB6i6+LzZIalEhAvAEnEFThigr0GMaLNhA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyZQbBwB6/g1izHdZS+njzUt2xz545IjG18jNV5KWoS3yCoNSws
	WwBO3zfb5SgVBM/dtkMPBpHsVkAb1MCNrZOL2riz4Pt1QTi5GkxCufWY18zx2rQbU59ajenEwel
	FjUJuiDfYuW8b90esd7gGFwvvAy4=
X-Gm-Gg: ASbGncuNMdwFPeK8Ld7C0SmWifqyRYXES6W9FmRTxgZAw6d8uUw6EakURMGH3t6BXGi
	MRudzR8JiFb4YTkhnhEMB3boMD8gTOWTuytiMpYXldvXvB0hOjRKDJdiXpba5Du5HlVg1BRBtUl
	Hckp+yu7aL4GVNaBiwJyth
X-Google-Smtp-Source: AGHT+IHj8WSARNrqvSf/cnD0DYUgHrDZ7CBtcuSHe9qmLUmpZz+KuDDH5QNcijE6SV1OIz481/y+EqZ+4diWO63jVCI=
X-Received: by 2002:a05:6214:1305:b0:6d3:fa03:23f1 with SMTP id
 6a1803df08f44-6e1b2186a41mr648178266d6.13.1737965783461; Mon, 27 Jan 2025
 00:16:23 -0800 (PST)
MIME-Version: 1.0
References: <1736986779-18213-1-git-send-email-wangmy@fujitsu.com>
 <B0D54F55-821C-42B5-8EF6-285E7055A9D8@arm.com> <CANNYZj8Lbz7s6JeQzrXu=MCbyQ5bC6RZcyLYLMc6MyHvcXLc6g@mail.gmail.com>
 <TYWPR01MB118610AE7185CEB27A28AFD98DCE12@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <CANNYZj_zmLZnyPPKoRs5GdUe4sS_Uw7dtgET39=r7g12-3UF8A@mail.gmail.com>
 <TYWPR01MB11861F43C751CA906A41A7AA5DCE32@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <CANNYZj-jKtRBwEiRK=d=jprA6A=gHJELEeT4NbQsPfHqkCOM9w@mail.gmail.com> <TYWPR01MB11861A1294C76DA1211C6CE94DCE22@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB11861A1294C76DA1211C6CE94DCE22@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Jan 2025 09:16:12 +0100
X-Gm-Features: AWEUYZnKj5AE4j5bxWg80_7a9LVpPRb5Gy_NMN5IkGH1IPkN2oGaiW5uzN195Ak
Message-ID: <CANNYZj97YumYu3MuPQUH3Uf8rsG_icyaiObXBBjgnm1nahhgRA@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [PATCH v3] ncurses: Fix install conflict when
 enable multilib.
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: "ross.burton@arm.com" <ross.burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jan 2025 08:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210297

On Sun, 26 Jan 2025 at 00:57, Mingyu Wang (Fujitsu) <wangmy@fujitsu.com> wrote:
>
> > why). Can you point to the upstream fix that they added to their repo?
>
> The upstream modify the file configure to fix this bug:
>
> @@ -659,7 +659,7 @@ WHICH_XTERM=$with_xterm_new
> AC_SUBST(WHICH_XTERM)
>
>  case $host_os in
> - (*linux-gnu|*cygwin|*mingw32|*msys)
> +(linux*gnu|linux*gnuabi64|linux*gnuabin32|linux*gnueabi|linux*gnueabihf|linux*gnux32|uclinux*|gnu*|mint*|k*bsd*-gnu|cygwin|msys|mingw*|linux*uclibc|linux*musl)
>          want_xterm_kbs=DEL
>          ;;
>  (*)

The problem is that upstream doesn't publish individual commits, they
just roll everything into 'snapshots', so you need to extract that one
change, and make a commit with it. I'd say let's leave the
--with-xterm-kbs=del, and wait for the next major release, 6.6 or so
when we can drop the setting perhaps.

Alex

