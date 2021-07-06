Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.12810.1625606577289649892
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 14:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=uPujAVe+;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.172, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f172.google.com with SMTP id q190so21694581qkd.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 14:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=9I3wk5gQMINsxANoRx3aG2xeembN/9KAWMhpMCXEosw=;
        b=uPujAVe+fLYQjIC3Rnt8Pi1fBW3OWn+BS5E+bke0EcgX0wqYnuAxf1JR8vT1FENVuA
         h6zzcyHiLVUFYprsh5gTXNCCmZHzQJSCUmili8r5+whMorLPBtxkjlRQuL3fl4CC02LK
         RjEPreoS8vcWExQpmdQaL0VJSpsBHELwmCbOJjty5FrE9dqaXKI221wg+1MbeDmRzHBK
         BReBOAL0lzd+SAb/khrP+idNFLdvMysqV3T1kn8VF515CNTmAXBpiuxFcBbF6/lFIH4d
         ywRLMOeb14kJmPLUAlmeDzuPhqNy94wbYqEThMxlIuu0U/CEsmNWvWFffNfnr1dnktF7
         ksag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=9I3wk5gQMINsxANoRx3aG2xeembN/9KAWMhpMCXEosw=;
        b=fKAT4/zloq1ZqFwPbgv8XMubviQiDTYHU3JMaGJFfvPUyzgSOajOjtY4Cc8z+m2hwu
         GeppH40IfW5e6h/3FCZEs33JW+c7rVSSi4VXCsSjTR0YK2f+pSlai1wxHCFeHUbNCl1d
         ya8hTSENx9q8AcMbqwrbuAVBghp5WQufsWiGMalSpqZkkZ2o8/HqjwfMIe/pD9piRDDr
         q7onqH4DFf2zzvOnFF+c5h/qT2nrId1YCRnGb8M8IUqU0FmOZGl90t3ek9f+QVbylk4Q
         cKwonn5h7+lBd+A0Ya/hHJP2xSbU6xDpiE/Mp43TM93LyeZ0xrYf8cdpUxKe6OwGcx+V
         IFWA==
X-Gm-Message-State: AOAM532bD/+PQPpygeGgqnCYHTHxsxXUg1MMe7SMoHDJv0x8dWYvEetS
	UCaexQ7XewJvjuSDfECxtnrfpiccN7Duqve1
X-Google-Smtp-Source: ABdhPJzShgPZIUWESw4wpmPb5Ux8DJstqB0yw2FVKQQhk5U6eklluOML20Oy/xP1bqA0Vjqyt+wJ+g==
X-Received: by 2002:ae9:e911:: with SMTP id x17mr21699062qkf.371.1625606576219;
        Tue, 06 Jul 2021 14:22:56 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id m3sm7475071qkh.135.2021.07.06.14.22.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 14:22:55 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f177.google.com with SMTP id n9so488871qtk.7
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 14:22:55 -0700 (PDT)
X-Received: by 2002:a05:622a:11cd:: with SMTP id n13mr19354655qtk.233.1625606575492;
 Tue, 06 Jul 2021 14:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210702115900.19417-1-peter@berginkonsult.se>
 <bc5cdd46cfb003f45c1ed7762ee140c0f4f5cca5.camel@intel.com>
 <775af313-1b19-146e-b0f3-113d5af0a992@berginkonsult.se> <a3f45eab0d82dea6f34936d821d902b79c43abbd.camel@linuxfoundation.org>
 <0e446811e98bcb4833cdc0c7f5dd40fcd8f07a43.camel@intel.com>
 <d83ff556-cab9-3616-f4ad-506e8675eda5@berginkonsult.se> <db03a0b4-d292-4db8-694e-56b3fa1c99cc@berginkonsult.se>
 <CAP9ODKrSEHz26EPkkOvPqpd37x3fzmTTJ9vuPxByFMnraJVmvg@mail.gmail.com> <a2041c84-be88-e981-1f7f-3c40da3ca60c@berginkonsult.se>
In-Reply-To: <a2041c84-be88-e981-1f7f-3c40da3ca60c@berginkonsult.se>
Date: Tue, 6 Jul 2021 18:22:43 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpOFb11gM6V2rqSUtfaB=MJSYiVibQLKip=xsOau9=Org@mail.gmail.com>
Message-ID: <CAP9ODKpOFb11gM6V2rqSUtfaB=MJSYiVibQLKip=xsOau9=Org@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "libubootenv: inherit uboot-config"
To: Peter Bergin <peter@berginkonsult.se>
Cc: Anuj Mittal <anuj.mittal@intel.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>, "liu.ming50@gmail.com" <liu.ming50@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000007a159605c67b0614"

--0000000000007a159605c67b0614
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 6 de jul. de 2021 =C3=A0s 15:39, Peter Bergin <peter@berginkonsult=
.se>
escreveu:

> Hi Otavio,
> On 2021-07-06 18:56, Otavio Salvador wrote:
>
>
>
> Em ter., 6 de jul. de 2021 =C3=A0s 12:12, Peter Bergin <peter@berginkonsu=
lt.se>
> escreveu:
>
>> Then I can correct my earlier statement and a new wisdom that run-time
>> dependecies are scanned already in the early phases. Apparently it is
>> not possible to build libubootenv due to RRECOMMENDS to
>> u-boot-default-env. The build for a 'non-u-boot config' will fail if we
>> add 'inherit uboot-config' and it will fail without. What is the
>> difference for a 'world' build?
>>
>
> The dependency on the default-env seems too strong. It could be relaxed a=
s
> it works without it.
>
> Do we have a run-time dependency that is 'lesser than' RRECOMMENDS? Or do
> you suggest removing the dependency?
>

There is RSUGGESTS but I am unsure package managers handle it properly.
Ideally, we'd have a dummy one which would be replaced by the machine one
if available.



--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--0000000000007a159605c67b0614
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em ter., 6 de jul. de 2021 =C3=A0s 15=
:39, Peter Bergin &lt;<a href=3D"mailto:peter@berginkonsult.se">peter@bergi=
nkonsult.se</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
 =20
   =20
 =20
  <div>
    <p>Hi Otavio,<br>
    </p>
    <div>On 2021-07-06 18:56, Otavio Salvador
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">Em ter., 6 de jul. de 2021
            =C3=A0s 12:12, Peter Bergin &lt;<a href=3D"mailto:peter@bergink=
onsult.se" target=3D"_blank">peter@berginkonsult.se</a>&gt;
            escreveu:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Then I can corr=
ect my
            earlier statement and a new wisdom that run-time <br>
            dependecies are scanned already in the early phases.
            Apparently it is <br>
            not possible to build libubootenv due to RRECOMMENDS to <br>
            u-boot-default-env. The build for a &#39;non-u-boot config&#39;=
 will
            fail if we <br>
            add &#39;inherit uboot-config&#39; and it will fail without. Wh=
at is
            the <br>
            difference for a &#39;world&#39; build?<br>
          </blockquote>
          <div><br>
          </div>
          <div>The dependency on the default-env seems too strong. It
            could be relaxed as it works without it. <br>
          </div>
        </div>
      </div>
      <br>
    </blockquote>
    <p>Do we have a run-time dependency that is &#39;lesser than&#39;
      RRECOMMENDS? Or do you suggest removing the dependency?</p></div></bl=
ockquote><div><br></div><div>There is RSUGGESTS but I am unsure package man=
agers handle it properly. Ideally, we&#39;d have a dummy one which would be=
 replaced by the machine one if available.</div><div><br></div><div><br></d=
iv><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"=
>Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http:/=
/www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" target=
=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981-785=
4 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></div>

--0000000000007a159605c67b0614--
