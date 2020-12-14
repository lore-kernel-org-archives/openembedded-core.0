Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web09.35046.1607954636145979315
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:03:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=WU+EYnLP;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.41, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f41.google.com with SMTP id u16so7810729qvl.7
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mOzuI+QGTHyKOdqV4TdDyqWsiYK2zZcALlOFnM7Ujrc=;
        b=WU+EYnLPzCFrqNgIHLjzxgizuwpM4HFhJqL8lebQfQiv+vL+4KeRHGKvsGEDkk1qvP
         Ss05A/BBO0MbWl0nFMZJRDwdqtLG++3UfkwyI80K2Bm6Haf2oLKD1s7B5PZruXAcwAwl
         J5UBQtSe82+MJEsb8aTZokqmbxHtoJXFm+N1jr7uz3PftqFHnNEY3vwztvpdiV8JjD2k
         oF6un/3IaAQjqmwc/KyqARp45hh812bfppDE5aZDCe2F0HGNI3XjtvelT+eLGhwEqRMJ
         b7S0lYqY7YM2JNXJQq+hsOFPRrFu5GsDov77RF3HpoAEGklJQGzOuuNqk6RNKMRgovV/
         z8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mOzuI+QGTHyKOdqV4TdDyqWsiYK2zZcALlOFnM7Ujrc=;
        b=Uvu8/4QlNZuOlz7A8NVV5rzVrNXXn1k+D6LaH5z2vuMMtAZxqhI3fjaDHkumGSuuZX
         otZ73un+vkgv6yYgqSRkLe/eWDoZoXz5Jv09wzipjDRcR+CPvpremTcn5Unj7UCzuR3U
         WBcaPmvCyc1IJX/ZJAQk594tcMj+LkXU12xCj+8q4ydFgZn7E0tKzOkUyFhNdQhn1alc
         dqrXpBNvISt+44aT9MHr27XFD2SslP6YgitXLm2OuOn9Zxt626f59Zdxn0fCM4PfuYXI
         v8ZpB8B7MGk7Yo6AhMWk3kh8g5aR+HNELZgtUyuvICkXbOGgTFl1nNqWvkvfiGYy63HX
         T85g==
X-Gm-Message-State: AOAM5309oM0SQtZdmKKx92pO499XNQ6HI/IFeWvvdqo5oTSaTON9e1XJ
	K1/r87flP1MD2n9/PFH70MHsZ58NzzNOGe+B
X-Google-Smtp-Source: ABdhPJzmWanmaatM1WCe4WVmfDSO81bqHuWo/jl3o/0niRJSbJQV8S0DZC8H7zqlPsi02znZg8w5Ww==
X-Received: by 2002:ad4:4ea2:: with SMTP id ed2mr31926308qvb.59.1607954634832;
        Mon, 14 Dec 2020 06:03:54 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id s30sm15191387qte.44.2020.12.14.06.03.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Dec 2020 06:03:53 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f181.google.com with SMTP id i67so8045460qkf.11
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:03:53 -0800 (PST)
X-Received: by 2002:a05:620a:51:: with SMTP id t17mr3583318qkt.414.1607954633600;
 Mon, 14 Dec 2020 06:03:53 -0800 (PST)
MIME-Version: 1.0
References: <CAP9ODKpXfVcDjtMwUvSRi68+-BHnK9nF6B-5wFX7nzW2wi2adQ@mail.gmail.com>
 <CAMKF1sqj0epXj_cFBniiEvYmfTgcVuCxaAfLh7_Y7oPZ==Tq1w@mail.gmail.com>
 <CAP9ODKoxVgDoMtys=aQdhteAZQ3bV7fbtLN8ZUuHehW2caLgSg@mail.gmail.com>
 <CAMKF1spBFaSKMXU77Rmx-usTw-mJN-dhbAb-=PKiFSFJ1-5hSg@mail.gmail.com>
 <CAP9ODKoPuatKkZYK0Zy-6wfPh--G7HD3bz_QDRmqDR-gRhiLnA@mail.gmail.com> <AM9PR09MB47393922BAC96879D84F9A8DA8C70@AM9PR09MB4739.eurprd09.prod.outlook.com>
In-Reply-To: <AM9PR09MB47393922BAC96879D84F9A8DA8C70@AM9PR09MB4739.eurprd09.prod.outlook.com>
Date: Mon, 14 Dec 2020 11:03:40 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrCw15pXVTTqcZm3C12ZZR+i0bxKHC5UbdOQC8VvewNgQ@mail.gmail.com>
Message-ID: <CAP9ODKrCw15pXVTTqcZm3C12ZZR+i0bxKHC5UbdOQC8VvewNgQ@mail.gmail.com>
Subject: Re: [OE-core] Strange segfault on native Go binaries
To: Konrad Weihmann <kweihmann@outlook.com>, 
	"Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Konrad,

Em seg., 14 de dez. de 2020 =C3=A0s 09:51, Konrad Weihmann
<kweihmann@outlook.com> escreveu:
> I'm experiencing the same on plain Ubuntu 20.04 since 1.15.x update on
> master (dunfell works like a charm even without any hacks) - but also
> Ubuntu 18.04 and 16.04 based containers do show the same behavior.
> This affects only the native variants.

Indeed; reverting to 1.14 "fixes" it here as well.

> As a partial workaround I disabled GO_DYNLINK for native - so I kind of
> second the impression that relocation is buggy in here.

Where you did it? I tried in the 'glide-native' case but it did not work ou=
t.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
