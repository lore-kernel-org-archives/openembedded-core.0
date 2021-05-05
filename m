Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.3002.1620247932754782987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 13:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=rpCWibYA;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.176, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f176.google.com with SMTP id 76so2943885qkn.13
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 13:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=k6QBArhXrWsJYvoLT74c0uAdYUWIhchF1gOk/iuH3fM=;
        b=rpCWibYAtSQxOBW3urO0Pn9X/rahWDAdVdOSf3VdPkhhYFd63YyAyc3ohRsDIf6HBK
         1zqJcyTnucDp5Olug/U6J5gRNc+ry41NXZBF4CLCga+kJXj9lgHjqLtrxPBwpAmTJDHF
         BQedhRq7IqO/IxxHPflZVfK9lCM3uk/pej85AGi0Bq2bHJp+vB/NitYUXIWd9kHNnosk
         aA/LIDOhFvGs1rqN60BX6ngnb4xvhICKMM+rb7vaL7BlOG9hI29pQUhXunj1IixiM1j+
         5vfPiyPny07A/kc7c7cdzrSAaX05o7rBSv/gjZ5oJ2HgEvOFjiwHkNrfUugUqtQ8x9kk
         np2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=k6QBArhXrWsJYvoLT74c0uAdYUWIhchF1gOk/iuH3fM=;
        b=hH5/BTgBNkreGRKlQLF+UjSXwLXAdNNp2YbcwHBWZL9940H2GVUWrJbzv66Nhs6ZvK
         ZZmu0PLHgTGTbxK+FNsgjDEUSpvBf4qLC/pNQT5lVVT9WkxO6urDUswMd+vAf6p325px
         XQFezfGf38gSsRwlF/sUhUhhlcG+9ndvQwHq28IyPWy5EJHLRs3XlDgd908JSFQzA30D
         dLhbALsCxd7sKu2by7C96P9k03eq42kN9Reis+RQNoharx0eFA9D3/APXX5NGThuGKfV
         RSRbrjLlJfi5wzr+S3ExiaL163a6XY1GZta1VD05q611m7Cw+NLnjamKvxAoRxaUB8Z8
         Vb2w==
X-Gm-Message-State: AOAM5336Uf9oCYOSX8IdW7FulOfWUfbRNOOlpNiF3YuD9m7LNj3kCfDD
	XpZ8FysLcCe9kczWgeAcQIIVhItblmz5CKxt
X-Google-Smtp-Source: ABdhPJwOgjjJ97YrdK8Vjj38uaJNAVjL8Q64FTwqQ/GlBtlDEgTjvIh9jBJTUc+m2iHPyAFrJ9OPFg==
X-Received: by 2002:a05:620a:8c8:: with SMTP id z8mr701977qkz.32.1620247931805;
        Wed, 05 May 2021 13:52:11 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id i15sm318100qtq.83.2021.05.05.13.52.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 13:52:11 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f42.google.com with SMTP id q5so2001800qvv.6
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 13:52:11 -0700 (PDT)
X-Received: by 2002:a05:6214:51:: with SMTP id c17mr774844qvr.20.1620247931310;
 Wed, 05 May 2021 13:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-10-alex.kanavin@gmail.com> <CAMKF1sr=EyGjLS3U0VfujRXsmOGQzuLC56foz-TpFnWnRD5WVg@mail.gmail.com>
In-Reply-To: <CAMKF1sr=EyGjLS3U0VfujRXsmOGQzuLC56foz-TpFnWnRD5WVg@mail.gmail.com>
Date: Wed, 5 May 2021 17:51:58 -0300
X-Gmail-Original-Message-ID: <CAP9ODKon3P5TQn7rKC4ifXePWpE5Rie4z+pO4pxdWPruUn71zQ@mail.gmail.com>
Message-ID: <CAP9ODKon3P5TQn7rKC4ifXePWpE5Rie4z+pO4pxdWPruUn71zQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/61] cmake: update 3.19.5 -> 3.20.1
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Em qua., 5 de mai. de 2021 =C3=A0s 15:35, Khem Raj <raj.khem@gmail.com> esc=
reveu:
>
> before we remove it, lets hear a Review from Otavio and perhaps he has
> better history with this patch
>
> On Wed, May 5, 2021 at 8:19 AM Alexander Kanavin <alex.kanavin@gmail.com>=
 wrote:
> >
> > Remove 0002-cmake-Prevent-the-detection-of-Qt5.patch
> > (patch purpose and failing scenarios unclear; disabling
> > is better done through configuration options which
> > are available for all of these items).

Try build it on a host with Qt to see if it fails. This is what comes
to my mind. I don't recall the details as it was done in 2018 ...
gosh, I am getting old.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
