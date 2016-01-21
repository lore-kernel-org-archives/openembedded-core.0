Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 45C9E65CB6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 15:40:29 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id z14so128184119igp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 07:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=PxbNYRcb49quK/imVt57InGWxjNR5T2yt6QZ3JLRLDw=;
	b=Ud03wPPwd5Gc7u+NHGPh66o+T9OrEufBcuNARvsuVGd9Nduiw0sbVmYeT9k3gF3+W9
	qnzyWqHI6EJnSV4EXVQcg83t3BNkw0/pUSlDRIPsQ8Hk8dSIRvgNSqRbEC4Exqb1ivYC
	7JHqPDSFsLm8x3ipmyih+8UYr4MwPgbKvgyc80EWVwbJZmRlatyznZAOuQh4T9qRGacP
	KGz88D7mP37sYckCDLddaSd6IIE2fsmbZUuMJY8i04lAzOWQlBx/zLEeneHCcliPOAH9
	StCnLxYLs1hG1NvF1BQVer8B/SQWdrGMdIIc1I+Gua8I/b4bu+L1kzIHSECBsKzbUVIj
	xYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PxbNYRcb49quK/imVt57InGWxjNR5T2yt6QZ3JLRLDw=;
	b=cYprOyoXcTsJF0EJMaxAqIybCOHl0YoxRZEB9wN8eYBynZl1XwSCIXok55+pyWZm0l
	xgLEgCgCv4Y0+bcCqli6dPAoIsWEumTwd9DZkJGb4UIIIA/xTk7QQDmGJ5UUHqqpK94O
	sAFGolqCd3Z+VlIWGKeFjos8BPTpEaisOcBf6/SRSRSH96AaYqqs+LiTQWL0uwQ+3Jh/
	Ck6J7GOUNuXTApbdCNuMfRUvjlXad1Z9ZAluI0FLjoY334i0q+M4Nl2Dr5vYgCAwIJXH
	EALPSkZdbFSYXuXT/83n20Q+e/WSxL745h0seBzREBvka7FicJUFrs0Dlk5j4DWC2m6p
	6FrQ==
X-Gm-Message-State: AG10YOS4qWJt5NhKtXCOMrQ1Tt6d6ZnOD3+oKLXJMJ7bXdLQkT0EBgghmtozQTwfHE32Jztfyo3/m+Iu4Wk+6n0b
X-Received: by 10.50.111.111 with SMTP id ih15mr10412379igb.78.1453390829770; 
	Thu, 21 Jan 2016 07:40:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 21 Jan 2016 07:40:10 -0800 (PST)
In-Reply-To: <56A0F5D4.5090701@linux.intel.com>
References: <56A0F5D4.5090701@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jan 2016 15:40:10 +0000
Message-ID: <CAJTo0LYvEUgd0xNdu-HoVR1dW_eXYpZjy-BjzxOm0KKt0vcWcA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: proposal: let's move oe-core to ffmpeg (from libav)
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
X-List-Received-Date: Thu, 21 Jan 2016 15:40:29 -0000
Content-Type: multipart/alternative; boundary=089e0149be3420f6340529d9ec8e

--089e0149be3420f6340529d9ec8e
Content-Type: text/plain; charset=UTF-8

[CC'ing oe-devel]

On 21 January 2016 at 15:14, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> let's replace libav with ffmpeg in oe-core. The reasons are:
>
> - all of the major distributions are using ffmpeg now (the last holdout
> was Debian, and they switched to ffmpeg in summer 2015 after a long
> discussion and deliberation [1][2])
> - ffmpeg is much more responsive to security issues
> - ffmpeg does regular releases, while libav hasn't had one since spring
> 2015
> - other reasons listed in [2]
>
> [1] https://lwn.net/Articles/650816/
> [2] https://wiki.debian.org/Debate/libav-provider/ffmpeg
>
> Objections, thoughts?
>

Sounds sensible to me.  However we're a week away from M2 deadline so I'm
not sure we'll be able to have a consensus and get patches before that
unless someone is incredibly motivated.

Ross

--089e0149be3420f6340529d9ec8e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">[CC&#39;ing oe-devel]</div><div=
 class=3D"gmail_extra"><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">On 21 January 2016 at 15:14, Alexander Kanavin <span dir=3D"ltr=
">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank=
">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1e=
x"><div id=3D":pe9" class=3D"" style=3D"overflow:hidden"><span style=3D"fon=
t-size:13px">let&#39;s replace libav with ffmpeg in oe-core. The reasons ar=
e:</span><br style=3D"font-size:13px"><br style=3D"font-size:13px"><span st=
yle=3D"font-size:13px">- all of the major distributions are using ffmpeg no=
w (the last holdout was Debian, and they switched to ffmpeg in summer 2015 =
after a long discussion and deliberation [1][2])</span><br style=3D"font-si=
ze:13px"><span style=3D"font-size:13px">- ffmpeg is much more responsive to=
 security issues</span><br style=3D"font-size:13px"><span style=3D"font-siz=
e:13px">- ffmpeg does regular releases, while libav hasn&#39;t had one sinc=
e spring 2015</span><br style=3D"font-size:13px"><span style=3D"font-size:1=
3px">- other reasons listed in [2]</span><br style=3D"font-size:13px"><br s=
tyle=3D"font-size:13px"><span style=3D"font-size:13px">[1]=C2=A0</span><a h=
ref=3D"https://lwn.net/Articles/650816/" rel=3D"noreferrer" target=3D"_blan=
k" style=3D"font-size:13px">https://lwn.net/Articles/650816/</a><br style=
=3D"font-size:13px"><span style=3D"font-size:13px">[2]=C2=A0</span><a href=
=3D"https://wiki.debian.org/Debate/libav-provider/ffmpeg" rel=3D"noreferrer=
" target=3D"_blank" style=3D"font-size:13px">https://wiki.debian.org/Debate=
/libav-provider/ffmpeg</a><br style=3D"font-size:13px"><br style=3D"font-si=
ze:13px"><span style=3D"font-size:13px">Objections, thoughts?</span></div><=
/blockquote><div><br></div></div>Sounds sensible to me.=C2=A0 However we&#3=
9;re a week away from M2 deadline so I&#39;m not sure we&#39;ll be able to =
have a consensus and get patches before that unless someone is incredibly m=
otivated.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--089e0149be3420f6340529d9ec8e--
