Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web09.4156.1619650963446956301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 16:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tV9Z3JZk;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: devendra.tewari@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id a18so24167113qtj.10
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 16:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ownv1VkX65tR/IaYNqBNp6OhNjaYbeFN30E/IKbcpkU=;
        b=tV9Z3JZkHVhwRN9Iz832OY+FWbc7t5C18ArW6gVUMUfUZG4guV3pirBB4VT9WDAyY8
         EDVKTJsji1i/N7YYG93jk6QhNHbfGT7LD6AZzUHSgfRmYzppE14+xN3xq5TBKjuAwRB+
         9uHwh4F1hC5DwhlKZcCUtMIklLiiaPoLpg1CuwSikghdD1Zh5iRTRl18CTsUvcoYzeWE
         NtsUgoXnEjmEYfE/iPhHd5vaZXcqWn+diMiBSWWU4uwLh1KMEfKw9AwDSI9kjLJnZ78n
         ahhCix0WonxXPtNbiD2O1Ryog0DxKoC4oLVMtVue/U8gFCmR0XuhEFCNG96/N2WWUzPq
         vknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ownv1VkX65tR/IaYNqBNp6OhNjaYbeFN30E/IKbcpkU=;
        b=jke3UaqKm7+CEYDWZkfP2nJnkNvzuu/Zl2ZJHNW8HAfhuKsAmpLz0t/4Pd+RsTxtBa
         gLu3vyAwa3fOGiG6UA57BeOYuy/0cciQJnLKlLMZ8NqXO+F4tXRLYkQOIj74cCTs52a7
         LFY9RCTqpXGjeFnmVfjSYZLx4TaK7eAzqitVIVTlajV/OdiZWLgccEchpLoZxxrJiSC9
         HlghRBM8/22tC37End98NcaMVLA3uW0q/JCzYRgcSeJuXCTBLhvWVAWdSpRmTHZ/rfye
         0za6HOGcJuB5ptDAShPBvhxUq1KJrPNZP4CCaKt2x+WDT28Fb3Mws5/xS5YblrU9Dwit
         +lsg==
X-Gm-Message-State: AOAM530jT9DT9QxlPT2t+0iIX85JAFwSzAyUSYUOw/UtEtQjJ1MIup39
	vyGote0WAOJWVO/G0Kw2ZqI=
X-Google-Smtp-Source: ABdhPJzh58JHwZrjh6YTMr8AmSG8mOVkzUM8DJsdBQEy3paWLt7ndBEj0yj8Twg415Yl9q3As7pY0g==
X-Received: by 2002:a05:622a:1716:: with SMTP id h22mr28052088qtk.273.1619650962579;
        Wed, 28 Apr 2021 16:02:42 -0700 (PDT)
Return-Path: <devendra.tewari@gmail.com>
Received: from ?IPv6:2804:14d:5487:a7d6:c454:5164:6917:2f76? ([2804:14d:5487:a7d6:c454:5164:6917:2f76])
        by smtp.gmail.com with ESMTPSA id o2sm863915qki.73.2021.04.28.16.02.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Apr 2021 16:02:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
From: "Devendra Tewari" <devendra.tewari@gmail.com>
In-Reply-To: <162f49616d345a02d2633ae51e2e09b3f08de158.camel@linuxfoundation.org>
Date: Wed, 28 Apr 2021 20:02:32 -0300
Cc: Khem Raj <raj.khem@gmail.com>,
 Andre McCurdy <armccurdy@gmail.com>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-Id: <74CCF8C8-CE6E-43AA-95F8-F38FB64B656B@gmail.com>
References: <d59ab2e71f0115018fb1c957276ce71e3292cd95.camel@linuxfoundation.org>
 <F32A7470-A864-41C0-BA9C-FB611421DC0F@gmail.com>
 <aebbbcf8d29afec37b4a9c459eca8ab24112137f.camel@linuxfoundation.org>
 <4538E61E-9CE7-4346-877F-FA6CEAEB5074@gmail.com>
 <61C98407-3B1A-4C8D-9969-7D3EEAE3B75A@gmail.com>
 <3F33A9E1-ED6B-4728-A0CE-49EAAB2CFAC1@gmail.com>
 <a825b895707921ccfb5a2d20a0def7982963de21.camel@linuxfoundation.org>
 <7C3B49FD-7C8F-4C64-B847-F84BEA35ED94@gmail.com>
 <5CA188E2-24EB-4FE9-8F31-84DD73F92C1E@gmail.com>
 <42E76009-F583-4E55-BA29-1C989B25BD73@gmail.com>
 <162f49616d345a02d2633ae51e2e09b3f08de158.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Understood - carrying patches is a burden for sure. I=E2=80=99ll =
maintain patches for my own narrow use cases at my end, and perhaps =
submit them upstream.

Thanks,
Devendra

> On 28 Apr 2021, at 18:42, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Wed, 2021-04-28 at 07:00 -0300, Devendra Tewari wrote:
>> The gist of it is that Docker uses the overlay2 storage driver by =
default,=20
>> previously it used aufs. Both drivers have the same limitation in =
rename,=20
>> where file rename across layers is handled by moving, but directory =
rename
>> across layers results in error EXDEV. It is up to user space to =
handle the error.
>=20
> I'm still struggling to see how you're going to patch all the various =
pieces of
> software out there used during a build to handle EXDEV correctly.
>=20
> We have handled some cases of this for a long time where we're moving =
files
> over to different parts of a filesystem, e.g. /tmp/ to WORKDIR or vice =
versa.
>=20
> This new docker case triggers for renames even within a directory, =
e.g.=20
> /some/path/a -> /some/path/b which is not something that would often =
trigger
> this.
>=20
> I need to say clearly now that we are not carrying/taking patches to =
patch
> every bit of other software to try and avoid this.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20

