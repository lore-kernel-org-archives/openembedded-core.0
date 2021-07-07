Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.18997.1625651443419296604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 02:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZofB0SGF;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: liu.ming50@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id a8so2329769wrp.5
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 02:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3X8QZvp0CXoAsqq1aPZlOP2KLp++OwJi+qoYcObHTV4=;
        b=ZofB0SGFvw7Leot4Ebzk4W0D1cvZmU0IbYw50KjdiiFBG6t7ABSalnOpUvECn8aAK2
         BQXsiQtJrx278Yz881Zt61mXrBcw45e9e6QsTQGeGKPTrBjcxJjwY7ejvlOZpDZmhbOy
         qAWWxm24R0OTGTKfLzUW92cHbyP4pkvRoT1C7dsGXtVXfT4oKjqeZNCrnF1ay07c1RGA
         mKCZxG0N+y2NAiyMRmRqCYGP8PTmQi7nfCywSQzleQjjZgUg+Mj6C9PVlAaYyRdnj3Vi
         Z9SLKSrjdnteUe3LA2lddIaPEQcMqie5XE2bau/oKDWq1YUQF/BCoGnJwVxn3NIxS6Wm
         Z9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3X8QZvp0CXoAsqq1aPZlOP2KLp++OwJi+qoYcObHTV4=;
        b=I76WIR6MzHQRzZzfcqPkY0Gj3AHlhEJxEIujMwfAG6BqF/+rf2Xbkjx6m/oXU9wtxS
         RVsL4Y6E7SuM4bx7KLdtr3h4OjnyCy5ywDR5L2Yi7vVV6eTgYPPute+0I4hdbNklCJ16
         wO3SNcspxmLzYlcsaEk38nFPQrz7d9lzCx2DrWWwBeefNFKG073CBJb+vRw+1DtYh3xy
         xuKOS3sPUC4tyU8hEcJi+ArhxYqEhPYBMINJiOlhpBNCoXtD/iqCHu4FzgJAnWmZx8Jq
         iEywVIV/6i0D8JXwGhqNNYzl5OtlUveP/HdmjWzlDNOI17D8gEZ5UxxqYwRnRj3wVsd3
         adkA==
X-Gm-Message-State: AOAM533u0sjEYSS7jTjnJUiM0D2XrArZIGlKWgMUjHbbHVT9e18Dkebf
	SgRGXhNdw42hqRYMFHaXYL0Nm+8D4+o+G35h7YM=
X-Google-Smtp-Source: ABdhPJwna+klk7JQLDteAgKYXqAT2YDFNKlw5BjYX2dW+EvUC2pxWb/xn36lvTTPHwxyL8U9GLlrlLF2Yw+OPQmnTjA=
X-Received: by 2002:adf:b605:: with SMTP id f5mr27003677wre.419.1625651441761;
 Wed, 07 Jul 2021 02:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210702115900.19417-1-peter@berginkonsult.se>
 <bc5cdd46cfb003f45c1ed7762ee140c0f4f5cca5.camel@intel.com>
 <775af313-1b19-146e-b0f3-113d5af0a992@berginkonsult.se> <a3f45eab0d82dea6f34936d821d902b79c43abbd.camel@linuxfoundation.org>
 <0e446811e98bcb4833cdc0c7f5dd40fcd8f07a43.camel@intel.com>
 <d83ff556-cab9-3616-f4ad-506e8675eda5@berginkonsult.se> <db03a0b4-d292-4db8-694e-56b3fa1c99cc@berginkonsult.se>
 <CAP9ODKrSEHz26EPkkOvPqpd37x3fzmTTJ9vuPxByFMnraJVmvg@mail.gmail.com>
In-Reply-To: <CAP9ODKrSEHz26EPkkOvPqpd37x3fzmTTJ9vuPxByFMnraJVmvg@mail.gmail.com>
From: "Ming Liu" <liu.ming50@gmail.com>
Date: Wed, 7 Jul 2021 11:50:31 +0200
Message-ID: <CALatG=5ege67ZqNtxaKVVifg=pRnDBCKin2ZPtvejCgWDVu5QQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "libubootenv: inherit uboot-config"
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Peter Bergin <peter@berginkonsult.se>, Anuj Mittal <anuj.mittal@intel.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>
Content-Type: multipart/alternative; boundary="000000000000b7028905c68578fd"

--000000000000b7028905c68578fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

@Otavio Salvador <otavio.salvador@ossystems.com.br>

libubootenv will fall back to read environment from /etc/u-boot-initial-env
if loading /etc/fw_env.config fails, so attempt to say it's not too wrong.

To avoid world build failures, maybe set EXCLUDE_FROM_WORLD =3D "1"?

//Ming Liu

Otavio Salvador <otavio.salvador@ossystems.com.br> =E6=96=BC 2021=E5=B9=B47=
=E6=9C=886=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:56=E5=AF=AB=E9=
=81=93=EF=BC=9A

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
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>

--000000000000b7028905c68578fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=
=3D"mailto:otavio.salvador@ossystems.com.br" tabindex=3D"-1">@Otavio Salvad=
or</a>=C2=A0<div><br></div><div>libubootenv will fall back to read environm=
ent from=C2=A0/etc/u-boot-initial-env if loading /etc/fw_env.config fails, =
so attempt to say it&#39;s not too wrong.</div><div><br></div><div>To avoid=
 world build failures, maybe set=C2=A0EXCLUDE_FROM_WORLD =3D &quot;1&quot;?=
</div><div><br></div><div>//Ming Liu</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">Otavio Salvador &lt;<a href=3D"ma=
ilto:otavio.salvador@ossystems.com.br">otavio.salvador@ossystems.com.br</a>=
&gt; =E6=96=BC 2021=E5=B9=B47=E6=9C=886=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=
=8B=E5=8D=886:56=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Em ter., =
6 de jul. de 2021 =C3=A0s 12:12, Peter Bergin &lt;<a href=3D"mailto:peter@b=
erginkonsult.se" target=3D"_blank">peter@berginkonsult.se</a>&gt; escreveu:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Then I can corr=
ect my earlier statement and a new wisdom that run-time <br>
dependecies are scanned already in the early phases. Apparently it is <br>
not possible to build libubootenv due to RRECOMMENDS to <br>
u-boot-default-env. The build for a &#39;non-u-boot config&#39; will fail i=
f we <br>
add &#39;inherit uboot-config&#39; and it will fail without. What is the <b=
r>
difference for a &#39;world&#39; build?<br></blockquote><div><br></div><div=
>The dependency on the default-env seems too strong. It could be relaxed as=
 it works without it. <br></div><div> <br></div></div>-- <br><div dir=3D"lt=
r">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http:/=
/www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" target=
=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981-785=
4 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></div>
</blockquote></div>

--000000000000b7028905c68578fd--
