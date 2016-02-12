Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7E523731E5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 10:55:46 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id 5so7819615igt.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 02:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bcT0o6QuJ2fUbCyuDauVLzpZ/Mi1NNmilqyS0lYkqdc=;
	b=wgeYFuaVVVIJE0emJAaEMGhZ21nIOowDHj9W64P1nEfJHUljSaKZVXnuf/ushNe9JP
	oPFhHeucVEYmSi+Ug2/D3qZVbyVEpHwbstm5WZpGiviAEYRUKnmAST69V+7Tartxf3GD
	ytxLNIlEBaYmIatRH3eBmQS4Ug4XR6zTPHlbdbmiFbfHy8Cg/ClUGQMtIMoIRYOAl4Tf
	A+ZfQ8mhwgKAiGOX9A0o1uDi1a/MsBpVlZOOX1Af1yomuWoFz0UaGCD/DtQlmiukcp5T
	uSSC5u2f/eMc83xe6ne6xJf8kuIKQUL1rcEAt+p0KNtAMRauduz6vimElP8ykT+WX/zx
	C3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bcT0o6QuJ2fUbCyuDauVLzpZ/Mi1NNmilqyS0lYkqdc=;
	b=QFaf2E0gNfkTt5vfXXHCKBywprYgyndJpWHqQ7T6f3nLgWP0wxRBzyFtGZS1FPCa/X
	2dIW3FvZcvP5jXBZJoTrbI52Xn1qYWRHvP61JFU6LwC/l0S8G5zMtt97cZ31FrWqfMEo
	HbjVQjfAZMu7XEYRGodoeDySw5x8sxjgYdmVAVWJfCt6biK2OaxPnL5Oj6lfvFKGEAa+
	0hYIo+FQV8ZFw/J1NZcxGUgScyvQiK/p+nCgQNMVJ9uaVuOqZXSOB69/i9AK9e6FPdGe
	5kDeWSgPfMmlkp/1NFkB7H0gr6aKH2/NWEM8dNOdz7chcicvFygLZEI6tPS9KUhM8j8p
	nb0A==
X-Gm-Message-State: AG10YOSJQUM9BnPQAKCq5fnbpFvb3aP+3IDGW1U7WTvuDEyok3dyrErr1JGvW7T33f32M/dI/L+aEafJM8YEXlpF
X-Received: by 10.50.23.108 with SMTP id l12mr2321861igf.78.1455274547365;
	Fri, 12 Feb 2016 02:55:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 12 Feb 2016 02:55:27 -0800 (PST)
In-Reply-To: <56BDB6B8.3000803@mlbassoc.com>
References: <1455249507-30989-1-git-send-email-gary@mlbassoc.com>
	<1455265043.16142.267.camel@linuxfoundation.org>
	<56BD97ED.1040802@mlbassoc.com>
	<1455265928.16142.269.camel@linuxfoundation.org>
	<56BD99B2.2010004@mlbassoc.com> <56BDB6B8.3000803@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Feb 2016 10:55:27 +0000
Message-ID: <CAJTo0LY5nBUAqRmSj88mUA88sGXwDdFZvUD4_F8yH4ny97ranw@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ffmpeg: Add -dbg packages for all libraries
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
X-List-Received-Date: Fri, 12 Feb 2016 10:55:47 -0000
Content-Type: multipart/alternative; boundary=089e0149cbe8729e78052b908221

--089e0149cbe8729e78052b908221
Content-Type: text/plain; charset=UTF-8

On 12 February 2016 at 10:40, Gary Thomas <gary@mlbassoc.com> wrote:

> Policy notwithstanding, there are a lot of lib*-dbg* packages generated
> by non-lib* recipes, so my solution doesn't seem so out of place to me.
>

Since da5ec06814e105451cca11cce76b5c5231110524 debug packages are populated
automagically into a single PN-dbg unless there's a good rationale (Qt has
a good rationale in that one of the libraries embeds WebKit, which makes
its debug symbols quite large).

This has been general policy for some time now and whilst other layers may
not do this, oe-core doesn't have any recipes that split into multiple dbg
packages anymore (afaict).

Ross

--089e0149cbe8729e78052b908221
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 February 2016 at 10:40, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"=
mailto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-s=
tyle:solid;padding-left:1ex"><div id=3D":dt" class=3D"" style=3D"overflow:h=
idden">Policy notwithstanding, there are a lot of lib*-dbg* packages genera=
ted<br>
by non-lib* recipes, so my solution doesn&#39;t seem so out of place to me.=
<br></div></blockquote><div><br></div><div>Since da5ec06814e105451cca11cce7=
6b5c5231110524 debug packages are populated automagically into a single PN-=
dbg unless there&#39;s a good rationale (Qt has a good rationale in that on=
e of the libraries embeds WebKit, which makes its debug symbols quite large=
).</div></div><br></div><div class=3D"gmail_extra">This has been general po=
licy for some time now and whilst other layers may not do this, oe-core doe=
sn&#39;t have any recipes that split into multiple dbg packages anymore (af=
aict).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--089e0149cbe8729e78052b908221--
