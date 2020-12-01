Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web09.8561.1606822194188703052
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 03:29:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=Ymb7gVsg;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.169, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f169.google.com with SMTP id x25so876989qkj.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 03:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JlPypjK1IqIh4Xt0XHg0sBuQUu6snGJdDJ/9UJM40u4=;
        b=Ymb7gVsgcmOI1qoTOpmJ24wMW1zSioWf67fThJbrrjVD71jikG/Fr6pKIMO6BHc0mL
         LlBlmH7s+2p8kuK6Rqhzyii8q0y5RUujv/SnVORFJFP2B79uP7Y8D8ACxXMrjVofkwIu
         KVWlncxp4wAoE3Yg15qjqHhm3WoBORFV7c7QJzlrWUeAnbuIke3Xr8WXU0e8koN7398R
         rMegb/OMjctKJB/Ag7EseVO/5EHxl9xwsKkQ5hytlgMb+rfAOOrCAclBanMFAVLizXy6
         rmPI3zkuj1efUs4ByyB+jRNfF8nH1IQL1fkngQISX+Jj14gTm6te+ZbeRC3vDx+TzH9C
         Q75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JlPypjK1IqIh4Xt0XHg0sBuQUu6snGJdDJ/9UJM40u4=;
        b=TgqFsxvT+HUvPSPV3S5O2PV7qPCGVHjEplspuZg/AkXKqc6banmaqIZ4dpEbZSJ2fW
         Nqigcx2RjfwIBnrc9j5L9xAivNh8P8O09XTS6SpRohpTzA8YZoZ4RiTXhBQihJQhM4oa
         IJ+9zQD/buajifKhChR1KRE9qXV714/9PLvfNZilgYJ8g9KtOHcNRybeirDanUJ+mj3S
         4cRQDFTGtchwlVRTKwOLuZ2Tmr8obeN7adA/Qo404MPJO2flrweKXIgJjXYq9xVLIUqJ
         UmcekhHwp7l7gniAhbzMikeHb1IsPVAwW5/qhm+McprLghI6Yg7Nv9hC8A0qbw9/h5DS
         2X5A==
X-Gm-Message-State: AOAM531Iy373gVyvuBQbX0Foi0TXB+HvcNidtsl3Ip5x3PaSJcvSQbIY
	Ls3HnKB1qv2/HtXm5YXPNMGzt3DoezX3NyWm
X-Google-Smtp-Source: ABdhPJwI9/BC5d+q/UEQ2hAzBC2G5fx0o5Qi5xsAt9KB5pBMc4g0owfBz08AWm8EhRmJ3VBqDRRrTg==
X-Received: by 2002:a37:6310:: with SMTP id x16mr2299000qkb.90.1606822193035;
        Tue, 01 Dec 2020 03:29:53 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id w21sm1323270qki.6.2020.12.01.03.29.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 03:29:51 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f169.google.com with SMTP id z3so791466qtw.9
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 03:29:51 -0800 (PST)
X-Received: by 2002:ac8:a01:: with SMTP id b1mr2238846qti.217.1606822190880;
 Tue, 01 Dec 2020 03:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20201201034326.11447-1-okaya@kernel.org> <2d6b4cd69ed05454b7936f0a3a1c320db1c56558.camel@linuxfoundation.org>
In-Reply-To: <2d6b4cd69ed05454b7936f0a3a1c320db1c56558.camel@linuxfoundation.org>
Date: Tue, 1 Dec 2020 08:29:38 -0300
X-Gmail-Original-Message-ID: <CAP9ODKokNQw_HmiX6MC2wbB47tapHXC-9Za5tKzkbbtYsFHr6A@mail.gmail.com>
Message-ID: <CAP9ODKokNQw_HmiX6MC2wbB47tapHXC-9Za5tKzkbbtYsFHr6A@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2] procps: split into binary subpackages
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Sinan Kaya <okaya@kernel.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

Em ter., 1 de dez. de 2020 =C3=A0s 07:37, Richard Purdie
<richard.purdie@linuxfoundation.org> escreveu:
> On Tue, 2020-12-01 at 03:43 +0000, Sinan Kaya wrote:
...
> I am starting to get a little worried about the direction these patches
> are heading in. How much of the system are we going to split into
> individual package per binaries?

I am wondering why this is a concern for you? If we keep the old
package rdepends on the new ones I see no problem in allowing this
granular packaging.



--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
