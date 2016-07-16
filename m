Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id E2F346067C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jul 2016 14:30:46 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id b62so127208817iod.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jul 2016 07:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r3ctNLxvgnQXwnRq7kBvEeymiEcBoSCPDu+pgZWT2x8=;
	b=c2ogG00X8H1afn1Zn0nfxNkJbNS0VREnF4fu2Q1myV2dRCPiaxKdxcxcVH9TFoJHrn
	AkA7sFQ70rqYhfuw/AJBuJMz+2U2KkHTdmMoFFZjV/uIuS3vjfOyuDW/7aZw0FrFOYrP
	EiVkgLeZ9COtBpN44CVSBvfn624+bLByr3NIVdQ5ZeNUdtj1UX1xqOfLS4x+ndn+K2Dq
	jZQThnawaXB4+0csuT+Vn+3TMVmgf7N/U/POx6L1FRRW6bPkd4Okbew2DEYJMfKT7gvQ
	3ibNpty8DkYdMs10CdPtszxLHM80hqWbax/Ea0BoJ8MaTt5uAMKcC/n3vi4Cps9HSQkD
	jsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r3ctNLxvgnQXwnRq7kBvEeymiEcBoSCPDu+pgZWT2x8=;
	b=RRPApvfUG2hiXPe+usPweb8xy6wMcVl0Q6gW+NnU9gZaotmtsWUdeMx4yruIwOE31/
	mpbvf/rBETIyFFt07z8kcWtRLpKb7sp8USULmG4Avx8F5m9Skdhrix+1fAR1S7jzHpr7
	48RLgYpsU6PibIxeAgyZlVocH2RWLrQMa2CS++H0X5Hg6Dggtl8KYCN3N0N0JbPKlvOr
	0yHDhcaGAKIWQuBcYljT9gnnQrt7vYTy70Q37Mq34noUh3XkoyLXZ9wgzyloD8asAarW
	xOnlZsm5Ia1UVbiOJRAb1cstJqbtFfFjeoal0YgYus7zIu94SqLuhluyYwF6Ymkkc+jA
	yX2Q==
X-Gm-Message-State: ALyK8tJrwwFy6MSYYXH26wyPr3ce47rXbAerfjaeXaJPak7cZqo0BYxZDfhVhRJquQo9ag+IVDFcq3ifSvKZDYsJ
X-Received: by 10.107.138.212 with SMTP id c81mr25303340ioj.148.1468679447198; 
	Sat, 16 Jul 2016 07:30:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Sat, 16 Jul 2016 07:30:27 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1607160640010.4510@localhost.localdomain>
References: <alpine.LFD.2.20.1607160640010.4510@localhost.localdomain>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 16 Jul 2016 15:30:27 +0100
Message-ID: <CAJTo0LZu3+eT5e9C_ydi9LfeJGwEwmQpgE=Swv_Y3ou+Yb6a0A@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: is there any reason *not* to use musl C lib for current builds?
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
X-List-Received-Date: Sat, 16 Jul 2016 14:30:47 -0000
Content-Type: multipart/alternative; boundary=001a113ed932bd61cc0537c1949d

--001a113ed932bd61cc0537c1949d
Content-Type: text/plain; charset=UTF-8

On 16 July 2016 at 11:41, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   as the subject asks, are there any compelling reasons to not use
> musl as the C library of choice for OE/YP builds? just wondering about
> any potential downsides.
>

The musl web site lists the areas where it's missing features or has
different behaviour to glibc. Suffice to say it's not a no-brainer and
there are some features which are critical to some use cases.

Ross

--001a113ed932bd61cc0537c1949d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 July 2016 at 11:41, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=3D=
"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3tl" class=
=3D"a3s aXjCH m155f34da29b295b1">=C2=A0 as the subject asks, are there any =
compelling reasons to not use<br>
musl as the C library of choice for OE/YP builds? just wondering about<br>
any potential downsides.<br></div></blockquote></div><br>The musl web site =
lists the areas where it&#39;s missing features or has different behaviour =
to glibc. Suffice to say it&#39;s not a no-brainer and there are some featu=
res which are critical to some use cases.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ed932bd61cc0537c1949d--
