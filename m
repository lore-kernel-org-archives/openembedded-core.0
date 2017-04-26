Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id ED13177C90
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 09:44:46 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id f76so87246563qke.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 02:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CfMxsqaV9qEOqfZ+h5ZF8I8DruD1SPrYRcg0hHwClvc=;
	b=1C3uRmV3Q75XH6N0LafUZD1VIxRmmj+sSkbuwEusLgIkASLUWpOsDaZq6tX09KmzMa
	q/2w78/3toWpz6h+2jtTFZfL67kfef1fnfqOjy3yziLU2psB3JRRYxkbTKz94mm43z6x
	xyC0AwxMvKnVM1M4phWwFB2iOmSgb7kB3/NdslxTjcQ457IfCwKr3TX37rA+Uq2sgyOt
	SPbk6lEqAmUQ6eRffSPztuxpITnjmSkqtvkrUobgNAwRXiw143tEMiacKjb1WrwSeLMJ
	T38ZO7aCRr5Yi+bofOVk9CkZmjYQQ4M1ZqtjaDNydLms0Jw/iL9t9j8hNWOhJtBgVOeC
	S5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CfMxsqaV9qEOqfZ+h5ZF8I8DruD1SPrYRcg0hHwClvc=;
	b=n4Cnd1pMettShhHa/n1mmPXVzLMfAJ19s9EipfMTSHQRHq5mU/zq2WR1FotJEaR7na
	660goafvsGLpMRLqMWPJPgs41IQUrevm6W17KLC2UnU+xJ5GgvwItTLPKQ57DpIS9QIM
	4Rp6BlPa7j6X29ZkOH1YqPp05xQCd6f0Qr9a7jS0MPMrjtEbwlSbHVvVsDE4SOESgsUH
	6XgdJvf//Af6CRZ8mQUWW/K7P/w5i0zPAGXT6z7ZUrJMU97IAoShD4xBK+uLxj/ZY9oF
	uw7CW1gZtdknNvP8jCr/yeO8NsXbdsICOz6ESi4GZzZWQNi7L8GfW3jK7k5uZwt0MMKV
	TvSw==
X-Gm-Message-State: AN3rC/7UCbyhZDSN9A0EUgbwWKBk2CRpHI/sC35xgiaGpbWQJ/5FxGZc
	2TfF6BwzpVVvsaNdd2rHuDuIn550LO2I
X-Received: by 10.55.17.224 with SMTP id 93mr32046749qkr.244.1493199887516;
	Wed, 26 Apr 2017 02:44:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 26 Apr 2017 02:44:27 -0700 (PDT)
In-Reply-To: <87fugwyv28.fsf@largeson.i-did-not-set--mail-host-address--so-tickle-me>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
	<CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
	<CAJTo0La+bGDBuJ42yVy79hW2iN3ZhpeyjXrhUApLn-PAi6PYBw@mail.gmail.com>
	<87a875qxeg.fsf@largeson.i-did-not-set--mail-host-address--so-tickle-me>
	<CAJTo0LaLOhPcz8DYQ4wGzVXrP7Qs_Fa7jgrx76wCDAuR8eoWfQ@mail.gmail.com>
	<87fugwyv28.fsf@largeson.i-did-not-set--mail-host-address--so-tickle-me>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Apr 2017 10:44:27 +0100
Message-ID: <CAJTo0LY=s+q9oC6ep=aD8W29U6L4kdnQQchg3OKbM6EhH7tniQ@mail.gmail.com>
To: Nathan Lynch <nathan_lynch@mentor.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Wed, 26 Apr 2017 09:44:47 -0000
Content-Type: multipart/alternative; boundary=001a1135cbccdfe1f9054e0eb0f7

--001a1135cbccdfe1f9054e0eb0f7
Content-Type: text/plain; charset=UTF-8

On 25 April 2017 at 23:35, Nathan Lynch <nathan_lynch@mentor.com> wrote:

> Done:
> http://lists.openembedded.org/pipermail/openembedded-core/
> 2017-April/136086.html
>

Thanks!

Ross

--001a1135cbccdfe1f9054e0eb0f7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 April 2017 at 23:35, Nathan Lynch <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:nathan_lynch@mentor.com" target=3D"_blank">nathan_lynch@mentor.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":485" class=
=3D"a3s aXjCH m15ba741bfe161812">Done:<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2017-A=
pril/136086.html" rel=3D"noreferrer" target=3D"_blank">http://lists.openemb=
edded.org/<wbr>pipermail/openembedded-core/<wbr>2017-April/136086.html</a><=
/div></blockquote></div><br>Thanks!</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a1135cbccdfe1f9054e0eb0f7--
