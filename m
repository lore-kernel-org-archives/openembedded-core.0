Return-Path: <liu.ming50@gmail.com>
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 977C777E3F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 07:57:28 +0000 (UTC)
Received: by mail-ua0-f171.google.com with SMTP id j45so3147637uaf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 00:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eICgo+W+PrcmuYag7u0MV8VV56wHhw/DitRpleA+GsA=;
	b=mOAYS2lsUj9Zbxw26JBSHdCYikoUEV94gr+9KiENPpGqdIireqGfMcr+YS/WOUpeg0
	kyX1IrY9Z+U50lTGi4LQKNCeXDl/K0CHNQ6zzVO7Bt63sZ7ui4OrewWzaD0wAUrg44tZ
	YG4xJHbaXGNn8pHTqWUGcTMtZAB+T1y1FlQqJtjFBARqDdgSlMEb0K2M/fdcfuxe+pAJ
	m+riPEWrCBhb8D16qOkZBkrMc8WCx8Fe1xXt/KoxfoYkJjQbB17bJNP2x+0jRLbRu32J
	CUCxbQ3UzVQeYgNGQUve/ZSi5tsCQ7rlv8b5T9DpPHwQA/hn9DH51LNjY4+HR15uF8RM
	aKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eICgo+W+PrcmuYag7u0MV8VV56wHhw/DitRpleA+GsA=;
	b=IyuyPRi7XBKGz9jMTswLVK6Nfu5EOclql/PibjteazN1LJqr1ZmOEwQxQoifp622c1
	E2L+QUJoxKiqdlv45C3Id2pcMmUGWSy12/LKxvozADCb1oHApPm0YIyUOntsHhUD+yw3
	oag8auO1/9sk3O4xnWg1O27lZAUgDN3L5IVU+rzXdidPavvD9kDUuE+w+Msu/18GcBFh
	noJ1HdvXuATcwXkxabPphotC4DoLbl3kypdWbPFr0p7y2awis3Y3OU/EeXQ75x33ktaH
	18/cbUHU6ZeXGXQ50crHxWQfLqK034iKvHgSb+A08geELSNId7EP7wTUaDV82aRoRQwS
	h6fw==
X-Gm-Message-State: AHYfb5ilZL+yOSZReWvougtUsfDbuCoMRrgQfW0/Fd9opLRPCSs62EDh
	LACK4IoAkIgRLRGR5XqB8JPExSaVAw==
X-Received: by 10.176.8.129 with SMTP id n1mr1252373uaf.36.1503475049437; Wed,
	23 Aug 2017 00:57:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.88.220 with HTTP; Wed, 23 Aug 2017 00:57:28 -0700 (PDT)
In-Reply-To: <1503474627.32591.139.camel@linuxfoundation.org>
References: <1503315814-27663-1-git-send-email-liu.ming50@gmail.com>
	<CAJ86T=UGT-LDa_EgR_uBqA0jD8ide90ceJv+qk3Ck1v2cBjgbw@mail.gmail.com>
	<CALatG=69H3SNAyieWRDXdUxMwvGCMFtF=gjmuufsK=TZoiLk0A@mail.gmail.com>
	<1503474627.32591.139.camel@linuxfoundation.org>
From: Ming Liu <liu.ming50@gmail.com>
Date: Wed, 23 Aug 2017 09:57:28 +0200
Message-ID: <CALatG=6NOefmTqj-1OatYNH+43Bpwzo0Xz+BdrMYrYjZMkJTkw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: trim duplicated whitespaces from BUILDCFG_VARS
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
X-List-Received-Date: Wed, 23 Aug 2017 07:57:28 -0000
Content-Type: multipart/alternative; boundary="f403045db94c40200005576710ff"

--f403045db94c40200005576710ff
Content-Type: text/plain; charset="UTF-8"

Hi,

Yes, it's in master-next not in master branch, but wouldn't that mean it's
accepted as a proper fix, or?

//Ming Liu

2017-08-23 9:50 GMT+02:00 Richard Purdie <richard.purdie@linuxfoundation.org
>:

> On Wed, 2017-08-23 at 04:33 +0200, Ming Liu wrote:
> > Hi, Andre:
> >
> > Arha, I did not know that when I was submitting the patch, may I know
> > why it's rejected at that moment? Since even with the alternative
> > fixes, the developers still could introduce duplicated whitespaces in
> > their BSP layers if they do not know the rules, since it's quite
> > common in recipes to assign variables with duplicated whitespcaces.
> >
> > BTW: i just checked, it's been merged to master already.
>
> No, it hasn't.
>
> Cheers,
>
> Richard
>

--f403045db94c40200005576710ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Yes, it&#39;s in master-next not in=
 master branch, but wouldn&#39;t that mean it&#39;s accepted as a proper fi=
x, or?</div><div><br></div><div>//Ming Liu</div></div><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote">2017-08-23 9:50 GMT+02:00 Richard Purd=
ie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span>:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><span class=3D"">On Wed, 2017-08-23 at 04:3=
3 +0200, Ming Liu wrote:<br>
&gt; Hi, Andre:<br>
&gt;<br>
&gt; Arha, I did not know that when I was submitting the patch, may I know<=
br>
&gt; why it&#39;s rejected at that moment? Since even with the=C2=A0alterna=
tive<br>
&gt; fixes, the developers still could introduce duplicated whitespaces in<=
br>
&gt; their BSP layers if they do not know the rules, since it&#39;s quite<b=
r>
&gt; common in recipes to assign variables with duplicated whitespcaces.<br=
>
&gt;<br>
&gt; BTW: i just checked, it&#39;s been merged to master already.<br>
<br>
</span>No, it hasn&#39;t.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>

--f403045db94c40200005576710ff--
