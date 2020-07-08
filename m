Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.5054.1594243260978398643
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 14:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=GmirNJmI;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.194, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f194.google.com with SMTP id c30so39182805qka.10
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2020 14:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=o08dHTGYmMe2W115T5SSUJNgHjXoq8dNq9+FYU2Ppss=;
        b=GmirNJmIMTu7jJ3wb0k9YkjEEAXPMX92KOYTRY/1/muSL7ippfWVIcFdiUAYP+IKZH
         /LnIA4QHNp5LV6Ol6rWHKnsN0/Sgg7UoLkxUSMJ43iHQgQJBzXFBnBKNfonaPVKLiEkU
         ZES2/p5paKpv2lUjrOcxGkYn2oGFo5n9GY8pu9k5OzumY3cWvWP89VauNqfDc2Hyx2aM
         4IdRaZo3FtF8Vmq3PdU3L7WvDXFsKOWvuUqv3X7p/0oDiikBshN8cBijDjaui3dsxXCm
         RE4hqkfrnvCvr0e0U8nenUDkabZ17rSVJs9HJDY6UJoWQkDkqyS4/iYc3YEChsnUmiON
         adfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=o08dHTGYmMe2W115T5SSUJNgHjXoq8dNq9+FYU2Ppss=;
        b=pBQzSP3/QziKbof9CPhLGmm4xHb+I5ulp+prGuN4oncsSuWAWEyf9z/uzo9aAAcN3A
         OJAmVeqdfyfWeY5duYN+0Rk1CvuzF/aX6tHMurtIXX7aVKfiLSSjQcizIltdVRYpaStJ
         4LhdQF6FkDZODaYttZxRzR9fuccw+xS7Jb7iOMEJizmcSJiYUgJe9t4B0kowh3ZXUp5B
         NCZcMpWWqPYv0Bmpxs1AFMJS9t47gNvzyztZx62ffsz2W64E+/B6JLxRAVzyczLFJkWx
         979hoMJ8BLRuuq8ZBmO49kBnMaoHEfckAz++sOS0MsZcbY0SJToIDrUWoboRQvWuonCe
         qGpQ==
X-Gm-Message-State: AOAM532jFII9ad05rlxjqL8fAGXXXCest+wkXoB+nQhfm4Sv5IJfAZhV
	RQ3UjRKtigo3HO2v2R57QS+DW0paokgQSw==
X-Google-Smtp-Source: ABdhPJxLslGMHi2wppNSI4PLXjLT40F/lvYocuKYfMUuew+TyYZSvjm1dJn+Jdt57Q6DGcCuSaTmPQ==
X-Received: by 2002:a37:9b01:: with SMTP id d1mr62213367qke.65.1594243259833;
        Wed, 08 Jul 2020 14:20:59 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id g22sm1085645qkm.97.2020.07.08.14.20.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 14:20:58 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f169.google.com with SMTP id l6so43070065qkc.6
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2020 14:20:58 -0700 (PDT)
X-Received: by 2002:a37:9e92:: with SMTP id h140mr56343002qke.46.1594243258100;
 Wed, 08 Jul 2020 14:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200708195756.760-1-sno@netbsd.org>
In-Reply-To: <20200708195756.760-1-sno@netbsd.org>
Date: Wed, 8 Jul 2020 18:20:46 -0300
X-Gmail-Original-Message-ID: <CAP9ODKosgPup-Y3Ee-of+N9d9t+3GPHfZ4ZkfpE8PhJoxAkjTg@mail.gmail.com>
Message-ID: <CAP9ODKosgPup-Y3Ee-of+N9d9t+3GPHfZ4ZkfpE8PhJoxAkjTg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] toolchain-scripts.bbclass: also recognize ${SDK_SYS} env setups
To: Jens Rehsack <rehsack@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Jens Rehsack <sno@netbsd.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 8 de jul. de 2020 =C3=A0s 16:58, Jens Rehsack <rehsack@gmail.com> =
escreveu:
>
> Instead of recognizing only environment-setup scripts in
> ${STAGING_DIR_TARGET} or ${STAGING_DIR_NATIVE}, respectively - lurk also =
into
> ${SDKPATH}/buildtools/sysroots/${SDK_SYS} where nativesdk-openssl install=
s
> setup files.
>
> Remove overwriting of OPENSSL_CONF from buildtools-tarball.bb to clarify
> whether nativesdk-openssl installs wrong content or buildtools-tarball:
>     (nativesdk-openssl) tmp/sysroots/x86_64/usr/lib/ssl-1.1/openssl.cnf
>     (buildtools-tarball) buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl=
/openssl.cnf
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>

I did not understand the openssl related change. Is it possible to
rework the commit log so it is more detailed?


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
