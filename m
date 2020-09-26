Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.11819.1601128064432266271
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2020 06:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=qsOn3ROQ;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.193, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f193.google.com with SMTP id 16so5941461qkf.4
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2020 06:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zrl3gszFSBdgcnah4V1olAXenEyfJ51qR5/c9sI2qDE=;
        b=qsOn3ROQ9kh6Qx1jPJFgSOPJUJuOQoixMlJbkbY/zzgV6HzmPAgad73C9cGjgmu+Iy
         crMDAqTb7MZIl/d+h8BoPUcJ7jtAEtiVC9CZgrtv5zIm7i5TAlLoxyG4PjjdIg8V9Yqx
         8X0ZG9JI5LlPnOkoSM/XURJzpXYlsOvcC8+0RmZMmZX4oBvt9HTapVQ4ac+2Iw/U3ga/
         arFiBQ0OyYWg29pAvsZCJG2ag+eQ4st4EKJTUzWU1SPQ9ZjpQP6t01MYHIk/bqvK5miU
         jqyClUoQA33GFGRCo2Dnu1p/t+T0tYKUmiRjkVA3xIDO5GpmcSyMh6a8aTwY2v6eaNm3
         S72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zrl3gszFSBdgcnah4V1olAXenEyfJ51qR5/c9sI2qDE=;
        b=ewBpF7Oq9+57nRbgZTZcNxJmaan7/g9dWMAn62sjPEHAAbVDXbs27kjykabL+J+oGu
         11I/RP+McZAu1d72H6DvauyfLu03QNGw090ehPbw9XgYN7ep8EKGVtpExjWYx2TXe4ql
         vsxQ30LGcYHC91VrgPiZSw8+Yv2x/UzebCKbcGKZm23NA9LMw4Amuf8jKAzvy16vUAEr
         Lz9BxWWllxDNKfev5CoYc1lInadsv3CON8vRLsb43kEIFFi538JPMLLdjTAfq6KiFqW+
         jJzwtYxKV009muwd7VIKFk93MQQk7YAUZIb5LEATQexHVt6c3Qm7T51936yo5cGqFcWA
         nfVA==
X-Gm-Message-State: AOAM531ruCf2yyeV/wolScjWa9QCNlyAorCE5rkb6+LOrBL4N0p+HYVn
	HKt7ygxUi3/mMSb9y9dn/AxvLcN3VfUXyAsg
X-Google-Smtp-Source: ABdhPJzENTDWnpVs2w0d0lUsV4uW1mqurdEZST6K4uM7AkEBwBGOfFMRkEoy9Yyma9VlsJP+4hsmuQ==
X-Received: by 2002:a05:620a:5b8:: with SMTP id q24mr4586468qkq.492.1601128063362;
        Sat, 26 Sep 2020 06:47:43 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id f127sm4038911qke.133.2020.09.26.06.47.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2020 06:47:42 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f177.google.com with SMTP id q5so5965515qkc.2
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2020 06:47:42 -0700 (PDT)
X-Received: by 2002:a37:5008:: with SMTP id e8mr4672647qkb.247.1601128061821;
 Sat, 26 Sep 2020 06:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200926105309.2288615-1-pab@pabigot.com>
In-Reply-To: <20200926105309.2288615-1-pab@pabigot.com>
Date: Sat, 26 Sep 2020 10:47:30 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrJ8TRuTUXqJw9hNGwVrLMeVJfFKiA0CkkNMyePE9NfFA@mail.gmail.com>
Message-ID: <CAP9ODKrJ8TRuTUXqJw9hNGwVrLMeVJfFKiA0CkkNMyePE9NfFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go-mod.bbclass: use append to add `modcacherw`
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em s=C3=A1b., 26 de set. de 2020 =C3=A0s 07:53, Peter A. Bigot <pab@pabigot=
.com> escreveu:
>
> This class provided default build flags but includes the base go class
> which also provides default flags.  Use a different mechanism to
> extend the default flags without discarding `-trimpath` from the base
> class.
>
> Signed-off-by: Peter A. Bigot <pab@pabigot.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
