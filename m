Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.1273.1617059627519827479
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 16:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WQGe4UlF;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: devendra.tewari@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id i19so10619772qtv.7
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Mar 2021 16:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=F391LFStcJhoWBz8bPBf301Avc02UsEGXC7rksFaNHc=;
        b=WQGe4UlF2jHxYbsW44BYl1Ci87dXmaGBNIu2mEDd1GIei8fsvIR+6XTZVnkT8qnxC2
         74I2j7qeZAFIYBLENuHvvRt9s6Qro3pCBN38kyxVJcozQ5VMgZoB0iil16hkERVY/eLJ
         A7gCHoAzxUUkTmdt+Yjb7dNugl42ESuwRqp4J2PYDRyJ+4pD0VUty5gDIghnDgcuy8vj
         nsoGn2O+HqrKN+6t7TNMlgmo+H0lP8Lz3nwf1w1HOEAN4ZADcm3mMlT5+zXPjPA92OtH
         AdwAUV6XNJ9cjdvYOswO1UVSFyCNLxAIefCknfl3m9ImMLs+GwjUWI+NQOq/0r9i2A+c
         O/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=F391LFStcJhoWBz8bPBf301Avc02UsEGXC7rksFaNHc=;
        b=P5ip8yUALlRLDURV7CO9f4a5NGW120S/EnoiAN3VtjIdoKLOwtba7aXIyrWj181MaL
         jZH+VdoBmhGweDALdK827a382GnZPND1RvHd4Z9pOZ+4YHGnoHYoDK+D7gHv9O3P1SAr
         bESqD8spmKpWvc80Ocbki5xqTH7M6vMohl8RRFM2fyoPTdchRXiCEImxKBOI49sfKNie
         sWtFi1IMN2rTxtGnVp6ZdgegDYgKMKYzFTSHKhRE/CWfwftsVNE0NCw3mA5nngjVg5/f
         nQmAJTJGdYPvwq2s/2qR4Kwk998YaATNYq5055PhjA5qyb2lerGQMxkrL6XMtkXFQbwo
         DDWQ==
X-Gm-Message-State: AOAM5317iWIXEWXLaUGIQxNx64wWDPmXbDSV9MfY4C9M+EOBcfprKDBd
	K350O9BmmSSgwATPVhIAlLw=
X-Google-Smtp-Source: ABdhPJxl2Jp5Va0KyQ34334hBtypzBmMEJwsyJFjLB0/DarO3EXyj3+ahoFJtH5MSGiZ4nWwth3pkg==
X-Received: by 2002:ac8:45c4:: with SMTP id e4mr6127289qto.267.1617059626717;
        Mon, 29 Mar 2021 16:13:46 -0700 (PDT)
Return-Path: <devendra.tewari@gmail.com>
Received: from [192.168.0.2] ([177.183.205.78])
        by smtp.gmail.com with ESMTPSA id b12sm12181193qti.43.2021.03.29.16.13.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Mar 2021 16:13:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
From: "Devendra Tewari" <devendra.tewari@gmail.com>
In-Reply-To: <CAJ86T=W52t-GtrNgPEg5AiJWYPCKFu9H9+PfxRGNUqMJCDJt=g@mail.gmail.com>
Date: Mon, 29 Mar 2021 20:13:42 -0300
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-Id: <31745632-7CE9-467F-A0AB-7C3A87ECF73D@gmail.com>
References: <20210329151442.86306-1-devendra.tewari@gmail.com>
 <9e81b71466b771c55d8859e7d156b662e1c3d4f7.camel@linuxfoundation.org>
 <CBEFAFBB-3A73-41E2-A177-BBE047E615D1@gmail.com>
 <CAJ86T=Xn9tLHWrqqr1ZV9rAwZD7sG6x0QsyVRkUSKLwiGQKL8g@mail.gmail.com>
 <D5D63158-3A18-4F86-9262-9280A587D4C2@gmail.com>
 <CAJ86T=W52t-GtrNgPEg5AiJWYPCKFu9H9+PfxRGNUqMJCDJt=g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Will do. Thanks.

> On 29 Mar 2021, at 20:10, Andre McCurdy <armccurdy@gmail.com> wrote:
>=20
> On Mon, Mar 29, 2021 at 4:07 PM Devendra Tewari
> <devendra.tewari@gmail.com> wrote:
>>=20
>> I did try that but got an error that does not happen when we try =
os.rename first. I'll try to reproduce it again.
>>=20
>> I suspect there may be subtle differences in os.rename vs shutil.move =
with respect to what happens when origin and/or destination do not exist =
or are invalid.
>=20
> If there are subtle issues which you don't yet understand then that's
> all the more reason for not hiding the new shutil.move code behind a
> test which will pass for 99.9% of users. Please figure that out before
> sending another version of the patch.
>=20
>>> On 29 Mar 2021, at 20:00, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>=20
>>> On Mon, Mar 29, 2021 at 3:45 PM Devendra Tewari
>>> <devendra.tewari@gmail.com> wrote:
>>>>=20
>>>> Thanks! My bad. The example I looked up in Python docs had a break =
and I just realized it was a looping example.
>>>>=20
>>>> Here=E2=80=99s the updated patch (or should I submit it again via =
git send-email?)
>>>=20
>>> It would be better to use shutil.move unconditionally in all cases,
>>> rather than have a separate shutil.move code path which only gets
>>> tested by people doing incremental builds in docker.
>>=20

