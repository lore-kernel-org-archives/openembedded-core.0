Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B304F30932
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 10:30:41 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40967.1772706639265544572
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 02:30:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1kfCerrp;
 spf=pass (domain: smile.fr, ip: 209.85.208.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-660a58841d4so3404873a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 02:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772706637; x=1773311437; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6UP5hrzVR8BJSHqjkdJndhUbqbBc5yWtwLoNb1a5yI=;
        b=1kfCerrpy3jpLRCdOgULWcXMPcF+zHOcz8vxbB38lN8ODfesRwA5D4pAN+6UzCG9eQ
         ptMkdfzCUmIIE4h02aYuHHg2Gm5ZBRhfsILHacKRS6R21C7mwTnKr0Z3vqF97dmWTFun
         moSUAN9QyzvWGHbh5/iXBb8vn+jo6ywwFopi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772706637; x=1773311437;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c6UP5hrzVR8BJSHqjkdJndhUbqbBc5yWtwLoNb1a5yI=;
        b=ji91cM0PKUli2eqHpbVmv2APrvO6e5uFk/nhcj4VS9HFsLgWGWHspr+qZyO9EIk4zd
         sSgkT2LArWoLw866vW/Nd+4SSTl0abLEh0RO/sB1jf15QoEXm0DyQkO9vTUPOKXbI+CM
         lo+uRlzViq7p/E4C1guDL5NKhXXmpe50xpuHmW5HZ7lFH2xt+zNmLEVM2jE+4nuJ/VyM
         2O8pvoMPV7N61RhxtPxP1C+hI9wqrUXffxs8ClA64FyAwhqtXJwc/RZv3Lp2v5lpiRcN
         xnFmwJ0jKaABKCL9Tus65tcEBJ/2Dmxm/Lm8K9cT9hyoV9n4TlApehg3VJM+P3ixeUFJ
         axBA==
X-Gm-Message-State: AOJu0Yxdsd9USRDI82ETgiJoWmElr5w49uW//CRnJxbUJP2G5u2r/Ua4
	rkMIozg/0bdMsE3pIzAwtS8eu19s9dQr/9AAxmnaOEAENfhWvOl0qRnwnd4rPb1fOFo=
X-Gm-Gg: ATEYQzylePSuYCHzr4QGXOgVDhP3Uhxu7BgVoEoXUDW5diFDE0feuT+Dm0Y7iaIMg1k
	qOnvof4k2dL1Om9KXY4qB90ORqywt98thCU4jMxA7Rcl4I3ylhiFAoDGObV8K0yscvin0Xlnb8B
	DnDH+lMW0P13h7m0LRJTox4JanzbT+sK4LVNu3UcmNTsW37Ce5ntCZ728H3Y6qn3AQyePYSaD+S
	iluzjUjo3nSIvXWImZptxFFNt/LI5FkrLvf0nLhLNVJZWvi6l7sxVFw+InnhbzZqQnNAG5Zu5Xh
	XtUcCqLA0b8FBOqX8yJk7lz9JLjaUJ/TXGUbcM7UICAoGdOTsjjI7TLjyHdLJ/s6LkOs9sB8WfZ
	6f5/KR9ZrCOPU8EVQUq3aW6mzKiAXvVomKZKAiSE1y2CalL6O2wQpnrVzlphzf+aB+YkjH5HF+Z
	4PvMgIDyj4U0yWVFyrXeNnLjdEEI7APOd/WQtKi5tArmnvgNPffh3ZpKJr71RAz/sj8UIZCIiCR
	kdy3eoza6FAgp+t
X-Received: by 2002:a17:906:f597:b0:b93:c5a9:a5e5 with SMTP id a640c23a62f3a-b93f115f76emr339739766b.12.1772706637351;
        Thu, 05 Mar 2026 02:30:37 -0800 (PST)
Received: from localhost (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab135bfsm902834866b.1.2026.03.05.02.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:30:36 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 11:30:36 +0100
Message-Id: <DGUS224KXN5T.2NL0KDXHDAWNT@smile.fr>
Subject: Re: [OE-core][whinlatter 04/11] python3-urllib3: patch
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "Jiaying Song"
 <jiaying.song.cn@windriver.com>
To: "Paul Barker" <paul@pbarker.dev>, "Marko, Peter"
 <Peter.Marko@siemens.com>
X-Mailer: aerc 0.20.0
References: <cover.1767772757.git.yoann.congal@smile.fr>
 <34083b26ca1e5a52c627e41a1adbeaacf79dfa6d.1767772757.git.yoann.congal@smile.fr> <c19daed92270797942ebbb4b51c6f6b03fec16b3.camel@pbarker.dev> <AS1PR10MB5697BF5D70C1BCB02E7F1129FD84A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM> <5549493a25264654b39a48522691b15feece176c.camel@pbarker.dev> <04c34334-5342-4711-bcdf-177da37b6fdc@smile.fr> <6164cc2da28a6a9e637b47bde280254af4ed6384.camel@pbarker.dev> <CAMSfU+4xvshEKX3ze=w10+iwFsNm7sr8Mz5svaRQ_tuZ2Z-1xA@mail.gmail.com> <AS1PR10MB5697D5349A3C15D8B6E731EFFD7CA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM> <DGU3HPLPGFES.23M3LOS6Y7S4H@smile.fr> <954e724ca535ea207772cc8aaa8ea88ef724945c.camel@pbarker.dev>
In-Reply-To: <954e724ca535ea207772cc8aaa8ea88ef724945c.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 10:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232476

On Thu Mar 5, 2026 at 10:39 AM CET, Paul Barker wrote:
> On Wed, 2026-03-04 at 16:15 +0100, Yoann Congal via
> lists.openembedded.org wrote:
>> On Wed Mar 4, 2026 at 12:10 PM CET, Peter Marko wrote:
>> > Hello Yoann, Paul,
>> >=20
>> > What shall we do with this patch?
>> > Drop or take?
>> >=20
>> > I also think that it=E2=80=99s intrusive, however having this fixed on=
 older Yocto release and not fixed in newer is weird.
>> > https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&i=
d=3Dd9f52c5f86bcc4716e384fe5c01c03d386d60446
>>=20
>> Hello,
>>=20
>> For context, here an update on status in other distros:
>> Debian did not fix it:=20
>> https://security-tracker.debian.org/tracker/CVE-2025-66471
>>=20
>> Ubuntu has not fixed for most releases:
>> https://ubuntu.com/security/CVE-2025-66471
>>=20
>> Redhat did take the patch:
>> https://access.redhat.com/errata/RHSA-2026:1254
>>=20
>> So the situation in other distros has not changed much.
>>=20
>> I looked closer at the patch:
>> * There is indeed an API change:
>>     ContentDecoder.decompress(..., max_length: int =3D -1)
>>     BaseHTTPResponse._decode(..., max_length: int | None =3D None)
>>   But this has a default value so existing code will use that and
>>   preserve current behavior (uncompress without limit).
>>   That could be a problem for users that subclassed those but, a
>>   decompress() without max_length would have the CVE so better fix it
>>   and _decode() is not intended to be subclassed (as private?)
>> * The upgraded dependency to brotli >=3D 1.2.0:
>>   * is optional
>>   * existing brotli 1.1.0 (in meta-openembedded/scarthgap) will still
>>     work but generate a valid warning (the 1.1.0 version of brotli can't
>>     support fixes for this CVE)
>> * For what it's worth (not much), this patch was in released scarthgap
>>   5.0.15 for 1.5 months and yet we had no user reports.
>>=20
>> I don't see how you could fix this CVE without changing the API you have
>> to limit the size of the decompressed data, but you also have to pass
>> the maximum size to the underlying decompressor somehow...
>>=20
>> Interestingly, urllib3 has paid support available:
>> https://urllib3.readthedocs.io/en/latest/index.html#for-enterprise
>> Maybe an interested party can ask through that for a smaller fix?
>>=20
>> In conclusion, I'm leaning toward taking the patch : while it is
>> definitely intrusive, some care was taken in it to ensure
>> compatibility and the breakages are inherent to the CVE.
>>=20
>> Paul, would you agree?
>
> Agreed - this has stewed for a while in our scarthgap branch and in
> RHEL. I don't see any urgent follow up fixes from RHEL (see [1]). So, I
> think it's ok to take.
>
> [1]: https://gitlab.com/redhat/centos-stream/rpms/python-urllib3/-/commit=
s/c8s?ref_type=3Dheads
>
> Best regards,

Peter, can you send a updated version of the patch for the latest
whinlatter? (my trivial merge resulted in an unapplicable patch)

Thanks!
--=20
Yoann Congal
Smile ECS


