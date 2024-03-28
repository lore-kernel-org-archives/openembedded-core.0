Return-Path: <persaur@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2217CD11DD
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 16:58:35 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.1838.1711645112451948261
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 09:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c+Utgkf5;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: persaur@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-789e209544eso59584285a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 09:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711645111; x=1712249911; darn=lists.openembedded.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3RNwhBS3SBbNKEqf5JEPEEQkLGPwewQThWNemj3K9NI=;
        b=c+Utgkf5lNgmKy8Lze7N6Nt7C+yqLsQG256HNq8DfLfSyT2yrq7z7MvdyeY1gUB+th
         GphFK5qUPhkNBvAIh/lY078bN0f4pPvDeqDihDiBLeewwqk3xO/N1vblI2qn3O9+akTm
         OEKh4lhKTIfL9hxQ4gFOVmYJvXFtowyx2i4lr6tDO1K0a7dhZchrzvnUqp83YiQ/wm92
         FQGwjtC0Gl7fMHbu7JCK0P4+HkvcZlo0V+XDw/lFJsxZIyRNLfh2Mp2Munp7ay8MZp4o
         h83YyuKcLVc/WhkZpgyl0SMdhxKOghADuWHiEzTQ8HjsdObNyaN7ceFM5bscAyMbyv0t
         UelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711645111; x=1712249911;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3RNwhBS3SBbNKEqf5JEPEEQkLGPwewQThWNemj3K9NI=;
        b=Vf4XX+rHVTdTdWyCNKZd39VurnqAyUVNRIkKPfvtEu/Qbl7wYw+0K3SLAeN5t7AIwl
         ph0Uue61Z4OxqH1lYPyPfS6AoYlpdpgFygUUp8WBsAfgaxdyOhWGNnaFs/bQG9RoJLXP
         zZp1+nd9XjLbj7m9l8e7N5eJk76sEpjeZ1VD2MAKABb7ioJ1X6ahsCKm4eETOkafpowm
         ql/G1Xjpc4mrSsoO+4kqqqnHE8xU7ZN/zrBT6odXL2sReikihw71SrCODHsjr76giM5n
         ihHkGgwiGq6xEVAJug9/dUZa/178649243kPFLJl6YdvoCk/pdmuRuMqNPh/0qsUMqhX
         ZdCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXv30ZLnNGgPoniCSCIbXW9Pex30OVdKJ7GMLDgcSobdSwQqvTGre6Dss3NXqnJxo+aj/xJcz1rxwDlLWdxgUp086zk7QE0X9jnuz8eTWanuQmHBlVKtw0
X-Gm-Message-State: AOJu0Yyha8qGvg/HlcfQMBsAmv3ECK1gePfumODAnitKkLBywUY+ZHte
	dig49Vcxxw5CjSa9P6c/LSGM6/O4JK7a1edhGIPHL5R3nxp47wGh
X-Google-Smtp-Source: AGHT+IFuowpd2UZmFzlmSo2tNeHSijJ5cILI/FjddHZ4/88KJfhLQr+p2VHjWkAl/sGrCmEcMKMzGQ==
X-Received: by 2002:a05:6214:16d2:b0:696:a4e4:907b with SMTP id d18-20020a05621416d200b00696a4e4907bmr2905665qvz.6.1711645111397;
        Thu, 28 Mar 2024 09:58:31 -0700 (PDT)
Received: from smtpclient.apple ([207.204.229.121])
        by smtp.gmail.com with ESMTPSA id lz9-20020a0562145c4900b006967ed9f1c4sm792001qvb.24.2024.03.28.09.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 09:58:30 -0700 (PDT)
Content-Type: multipart/alternative; boundary=Apple-Mail-6F3A80B2-6E10-4ED8-9609-B8A17087BAE9
Content-Transfer-Encoding: 7bit
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 24 Mar 2024 01:00:01 AM HST
Date: Thu, 28 Mar 2024 12:58:19 -0400
Message-Id: <C58D6EAB-C160-41F3-BD60-B6CB3FD261FA@gmail.com>
References: <CANNYZj8sReO2GF_sG42c7SmjK0o8RrZ=BDsTcrfguBZf=6JgyQ@mail.gmail.com>
Cc: Marta Rybczynska <rybczynska@gmail.com>,
 Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org,
 yocto-security@lists.yoctoproject.org
In-Reply-To: <CANNYZj8sReO2GF_sG42c7SmjK0o8RrZ=BDsTcrfguBZf=6JgyQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPad Mail (21E236)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 16:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197595


--Apple-Mail-6F3A80B2-6E10-4ED8-9609-B8A17087BAE9
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mar 28, 2024, at 12:37, Alexander Kanavin <alex.kanavin@gmail.com> wrote:=

>=20
> =EF=BB=BFOn Thu, 28 Mar 2024 at 17:28, Marta Rybczynska <rybczynska@gmail.=
com> wrote:
>> I think you weren't there at the weekly meeting when we discussed
>> that: it started around Feb 14th and I see that in my data
>> (I have a daily report).
>>=20
>> To make the story short: NVD is close to 0 activity since mid-February
>> and there is no communication for now on why, what are the reasons
>> etc.
>> The security community is concerned and there are multiple ideas:
>> amending/replacing the database, there is an open letter in the works
>> etc.
>> =46rom our practical view there's no automated solutions we can
>> implement right now. I have some ideas and it would be good to discuss
>> them,
>> the next weekly meeting might be a good occasion.
>=20
> Probably alternatives to NVD will get increased attention too, which
> is not a bad thing. This exposes NVD as the single point of failure,
> and I can't see how they're going to restore trust.

Funding has been an issue for years, e.g. many thousands of bug reports neve=
r processed into CVEs, https://www.platformsecuritysummit.com/2019/speaker/s=
herman/=

--Apple-Mail-6F3A80B2-6E10-4ED8-9609-B8A17087BAE9
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"></div><div dir=3D"ltr">On M=
ar 28, 2024, at 12:37, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrot=
e:</div><div dir=3D"ltr"><blockquote type=3D"cite"><br></blockquote></div><b=
lockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>On Thu, 28 Mar 2024 a=
t 17:28, Marta Rybczynska &lt;rybczynska@gmail.com&gt; wrote:</span><br><blo=
ckquote type=3D"cite"><span>I think you weren't there at the weekly meeting w=
hen we discussed</span><br></blockquote><blockquote type=3D"cite"><span>that=
: it started around Feb 14th and I see that in my data</span><br></blockquot=
e><blockquote type=3D"cite"><span>(I have a daily report).</span><br></block=
quote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote ty=
pe=3D"cite"><span>To make the story short: NVD is close to 0 activity since m=
id-February</span><br></blockquote><blockquote type=3D"cite"><span>and there=
 is no communication for now on why, what are the reasons</span><br></blockq=
uote><blockquote type=3D"cite"><span>etc.</span><br></blockquote><blockquote=
 type=3D"cite"><span>The security community is concerned and there are multi=
ple ideas:</span><br></blockquote><blockquote type=3D"cite"><span>amending/r=
eplacing the database, there is an open letter in the works</span><br></bloc=
kquote><blockquote type=3D"cite"><span>etc.</span><br></blockquote><blockquo=
te type=3D"cite"><span>=46rom our practical view there's no automated soluti=
ons we can</span><br></blockquote><blockquote type=3D"cite"><span>implement r=
ight now. I have some ideas and it would be good to discuss</span><br></bloc=
kquote><blockquote type=3D"cite"><span>them,</span><br></blockquote><blockqu=
ote type=3D"cite"><span>the next weekly meeting might be a good occasion.</s=
pan><br></blockquote><span></span><br><span>Probably alternatives to NVD wil=
l get increased attention too, which</span><br><span>is not a bad thing. Thi=
s exposes NVD as the single point of failure,</span><br><span>and I can't se=
e how they're going to restore trust.</span><br></div></blockquote><br><div>=
Funding has been an issue for years, e.g. many thousands of bug reports neve=
r processed into CVEs,&nbsp;<a href=3D"https://www.platformsecuritysummit.co=
m/2019/speaker/sherman/">https://www.platformsecuritysummit.com/2019/speaker=
/sherman/</a></div></body></html>=

--Apple-Mail-6F3A80B2-6E10-4ED8-9609-B8A17087BAE9--

