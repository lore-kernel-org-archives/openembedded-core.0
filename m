Return-Path: <seth.boll@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id A0A6B6F9E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 13:26:08 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id h16so2489739oag.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 06:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=a7Bx5Pvd3UdQSzOUyP2nTsGMHTPYsjQoNrbbKYvQQW4=;
	b=sZTmEqMtgErMn/lUi+WCYdXAXx2T8aj+41m3L1jYywOv/abnNRYW6sLXgl8Rpw5x+W
	glgSrB3Q+jJsa/L1Q+C11qBlFOO+/rLGn6r/BcFWjKdsEaWixn2hfv6STedOcDEqiDJX
	NqnWnRJ7DWzZk/MQCHo+/ueVFYDt8ceSukXFOR97/9iYeK7ahwRt9tAK5pa0SbsVBzM0
	F6quTwF554dmIjrcRT2JD1RXNl8Ei8p/MjSyjzXL7mLLAncF4SFnkSNOT5ZzJjLCqHO5
	mG4oDSy7gYaEDGb5JN8vlaI7n9Ra3p3iLuAILai7uXGJshMEceIsEJfhyPzXe6yn0VqP
	wVXw==
MIME-Version: 1.0
X-Received: by 10.182.33.6 with SMTP id n6mr12128857obi.48.1395408368744; Fri,
	21 Mar 2014 06:26:08 -0700 (PDT)
Received: by 10.60.0.112 with HTTP; Fri, 21 Mar 2014 06:26:08 -0700 (PDT)
In-Reply-To: <CAJTo0Las0o_JcsvW-X+L=EQAvUf3yVVQBunoCi=cAzR=3y2DrA@mail.gmail.com>
References: <CANyK_8e6dfzu64SRLzZdXFE3obT6Td-8UUDqfcoSAqWTjoOq3g@mail.gmail.com>
	<CAJTo0Las0o_JcsvW-X+L=EQAvUf3yVVQBunoCi=cAzR=3y2DrA@mail.gmail.com>
Date: Fri, 21 Mar 2014 08:26:08 -0500
Message-ID: <CA+JN8xOH+=oJe3w_e06q3VJqZ9T_mQdmbUK8CBL3RE9+h=BiUQ@mail.gmail.com>
From: Seth Bollinger <seth.boll@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] OpenEmbedded and musl-libc
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
X-List-Received-Date: Fri, 21 Mar 2014 13:26:08 -0000
Content-Type: multipart/alternative; boundary=089e0158a83622bf4e04f51dd4e8

--089e0158a83622bf4e04f51dd4e8
Content-Type: text/plain; charset=ISO-8859-1

>
>
> I saw that yesterday too and thought it could be interesting for
> Yocto.  I'm curious as to why it's better than uclibc though
> (genuinely curious, I know little about uclibc beyond "it's smaller").
>

It been a while since I've reviewed uclibc, but doesn't it break a lot of
software with its vfork only paradigm?

Seth

--089e0158a83622bf4e04f51dd4e8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><br>
I saw that yesterday too and thought it could be interesting for<br>
Yocto. =A0I&#39;m curious as to why it&#39;s better than uclibc though<br>
(genuinely curious, I know little about uclibc beyond &quot;it&#39;s smalle=
r&quot;).<br></blockquote><div><br></div><div>It been a while since I&#39;v=
e reviewed uclibc, but doesn&#39;t it break a lot of software with its vfor=
k only paradigm?</div>
<div><br></div><div>Seth</div></div><br></div></div>

--089e0158a83622bf4e04f51dd4e8--
