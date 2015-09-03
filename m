Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6887A76FB8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 15:22:33 +0000 (UTC)
Received: by qgx61 with SMTP id 61so31135145qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 08:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7E97AokkxvLBhI2QCDirYXr6q6ELa7FuVz8MO7L8sx0=;
	b=AP+qonnoXvJGgncEyfazNRSj5xTheXK0XFeeX62tOtSzJpXNrEslit8mVzKu+bZbFV
	QRIbPpny5e8IM7IOh3fTByvqGcNqgRjg9nFvPpDQ3ohdV3vtPouwDq9/HxHaySWfdnMB
	j4vyRWdQvnkZzgv9eIbB5tQ8ZpTTBRlpfXNGiW/cNVw/A6uUDodGgzhgNRLmYPsLgShU
	OF7yN4Q9QAoq1uG4Odd6HooRNLs5jKk8GiOx0W3FmUJO3IP68E2cv/28v67LNPWbu/tp
	mxYe6tlA2EjFmxgYMUAIa9baC98Vp/vuguugY4oy0nHF95fF7JyGlS7oNbMsmjhqxyfj
	XEsA==
X-Gm-Message-State: ALoCoQnh43o+y/k4hyH5SWf1QCaW/CaRf9GDRfxEutsTckMOHPQIkT5G5HBSRBxOIhUf//o82Z1/
X-Received: by 10.140.237.204 with SMTP id i195mr72132203qhc.93.1441293753855; 
	Thu, 03 Sep 2015 08:22:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Thu, 3 Sep 2015 08:22:14 -0700 (PDT)
In-Reply-To: <1441293176.24871.118.camel@linuxfoundation.org>
References: <cover.1441291646.git.joshua.lock@collabora.co.uk>
	<9f749745e56f33bc00d0e08dd4951840b29a557d.1441291646.git.joshua.lock@collabora.co.uk>
	<1441293176.24871.118.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Sep 2015 16:22:14 +0100
Message-ID: <CAJTo0LYnmyRGKb0Tjunn8__GYB5mRPkm_dUyrb8678EC2YPhyA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/9] systemd: remove hard-coded paths in FILES entries
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
X-List-Received-Date: Thu, 03 Sep 2015 15:22:36 -0000
Content-Type: multipart/alternative; boundary=001a1135a030377ae1051ed95a68

--001a1135a030377ae1051ed95a68
Content-Type: text/plain; charset=UTF-8

On 3 September 2015 at 16:12, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> From what I remember, this is intentional and this change likely breaks
> multilib. You don't want two sets of rules on a multilib system.
>

Indeed - you need nonarch_base_libdir or whatever it's called here I think,
as that doesn't get renamed by multilib.

Ross

--001a1135a030377ae1051ed95a68
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 September 2015 at 16:12, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":371" class=3D"a3s" style=3D"overflow:hidden">From what I =
remember, this is intentional and this change likely breaks<br>
multilib. You don&#39;t want two sets of rules on a multilib system.<br></d=
iv></blockquote></div><br>Indeed - you need nonarch_base_libdir or whatever=
 it&#39;s called here I think, as that doesn&#39;t get renamed by multilib.=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--001a1135a030377ae1051ed95a68--
