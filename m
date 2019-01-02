Return-Path: <anibal.limon@linaro.org>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id 609526B899
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 16:07:21 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id w72so6664725vkd.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 08:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oiLHJgq9289nrdB5PvL8mMgC1Xwk86wnpJHsvnXs9zI=;
	b=bwNtuaeHWIULC6hMCda5lTuaaBIg1nFGjdi6/c/1URLQROYFikRn1xgTf1NG1LxwTX
	ijJFMdSpU5M6qO+F4NyZcnzYq+N0MSkEs54ytyqj4atp4e0DBZb7EAuZX63c7b8M8Ut9
	DvdHI4uSPYgewoFNA1pOhBPBDf9AmCwxrr8Cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oiLHJgq9289nrdB5PvL8mMgC1Xwk86wnpJHsvnXs9zI=;
	b=qeECKfPsFq0NG74VVrIq+fvGALgYW0YUpL4PCv+460CZ3F/fTDJWCXMJuUldsxonK7
	r6yCJCpfIdMXrbBuvoJ0xxPPgzb4wJTahjBjqX01ujfwwC+p90tYjJiuAAcapuyGaeEK
	c5npOti8I5UMdD2+pWMs2OtCVHlUzSLpxg+uU9FWqel2XhaJxXaPz739hLxJW0m3FGfV
	yuCa4tDFzL2++WHTIioUJtl2NJ3LAmR3N8qbUptVVxZ5OoFTYKURGiVOs8B0llnLw8AE
	kXmp0T5rvLPE5yvVrgaOOsRKg8C1sKj40Y+ZyTCxPWiHRua0NBUVak+AuNPI7MDymrad
	jfAw==
X-Gm-Message-State: AJcUuke44K6a7HjMt4tBPC4mu5FB5kSODGN/G2B5V9tI4Qn1cWyWaNnI
	dPrSoYHFQ/PKRr+3t2SUwxK3IDEjm5lZN3axXkB2hQ==
X-Google-Smtp-Source: ALg8bN7QyQAoxrJwReBWLK7NcQclaKQo5b6uPtOEl/BgLN6dupzMl9V4rcSob4Pk8Gh8JITDLmoTRYws8J0PB8e9UoY=
X-Received: by 2002:a1f:9604:: with SMTP id y4mr15467674vkd.28.1546445242015; 
	Wed, 02 Jan 2019 08:07:22 -0800 (PST)
MIME-Version: 1.0
References: <20181016232143.5016-1-anibal.limon@linaro.org>
	<6b883ed64458a2153437d7519adefb513556864c.camel@linuxfoundation.org>
	<CA+_AqisrOphM_bZ=jkfX1boP2aSA-8YR_bAT08EZo5RDHweLtA@mail.gmail.com>
	<CAJTo0LZENsJUFBWgE_P_Zs8GWQy-FUxyeK6u-Jutnd53xgoKnw@mail.gmail.com>
In-Reply-To: <CAJTo0LZENsJUFBWgE_P_Zs8GWQy-FUxyeK6u-Jutnd53xgoKnw@mail.gmail.com>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Wed, 2 Jan 2019 10:07:10 -0600
Message-ID: <CA+_Aqitng=1jKXLiLvu47F+dbUfSMBk8toxpSTWYt_1dq00UAQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/classes/testimage.bbclass: Only validate IMAGE_FSTYPES when is QEMU
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Jan 2019 16:07:21 -0000
Content-Type: multipart/alternative; boundary="00000000000050c347057e7bd7e2"

--00000000000050c347057e7bd7e2
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Nov 2018 at 07:08, Burton, Ross <ross.burton@intel.com> wrote:

> On Tue, 23 Oct 2018 at 01:38, Anibal Limon <anibal.limon@linaro.org>
> wrote:
> >> > -    fstypes = [fs for fs in d.getVar('IMAGE_FSTYPES').split(' ')
>
> >> > +    fstypes = d.getVar('IMAGE_FSTYPES')
> >> > +        fstypes = [fs for fs in fstypes if fs in supported_fstypes]
>
> That's the problem, the old code takes IMAGE_FSTYPES and splits it on
> whitespace, the new code iterates over each *character*
>

I sent an old version, sorry for that, sending v3...

Anibal


>
> Ross
>

--00000000000050c347057e7bd7e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr">On Thu, 15 Nov 2018 at 07:08, Burton, Ross &lt;<a href=3D"=
mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 23 Oct 2018 at 0=
1:38, Anibal Limon &lt;<a href=3D"mailto:anibal.limon@linaro.org" target=3D=
"_blank">anibal.limon@linaro.org</a>&gt; wrote:<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 fstypes =3D [fs for fs in d.getVar(&#39;IMAGE_=
FSTYPES&#39;).split(&#39; &#39;)<br>
<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 fstypes =3D d.getVar(&#39;IMAGE_FSTYPES&#39;)<=
br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fstypes =3D [fs for fs in fstype=
s if fs in supported_fstypes]<br>
<br>
That&#39;s the problem, the old code takes IMAGE_FSTYPES and splits it on<b=
r>
whitespace, the new code iterates over each *character*<br></blockquote><di=
v><br></div><div>I sent an old version, sorry for that, sending v3...</div>=
<div><br></div><div>Anibal</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
Ross<br>
</blockquote></div></div>

--00000000000050c347057e7bd7e2--
