Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1E491771BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 13:13:24 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id g73so54506094ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 05:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=DglRcwGjUtd4VbQCEanGw+7F076+G4PqpwkGQOQQsww=;
	b=lnddtGI/iJY2eJmE8ViIuk2nzgdUChptqlTpjjJ7SDG/AgNy6bNHLjVWUjfDGiW7JO
	WKXfnbk2T85DmYY1ltNp2KBmNrPxJqXm69RW83H0fiv3pjxakbK4C5LpgPcz+sQR/3B0
	z1ysPrrpJygmEzD7Uxb4LBrmR3OTvFANkIkMtd++MveLEJ/yQC9SS3kYYkd2H+As+eGt
	arehoRTMItoGd0WDVtTetOUCZtTfcYnw7ORHny0Pw+n3M0uUGZdtc2JK4GfaBhsxEiPS
	iQz8YX2TxHuWU0imn8CFmNJ69FPPEgLyX246QOHH8XbCoLF2ADcshWp8+ZG9kHy7DVlZ
	vPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DglRcwGjUtd4VbQCEanGw+7F076+G4PqpwkGQOQQsww=;
	b=Mvi1M4IfgS/n0HEIB2YjXAysbQ9sH4eatUUjstoNvg2TACEOqq/K/7/Zroq9UChysu
	zj0UEbR3OL7/Rt1bcCJokFyEgNpZ59ibECS3BST5ktork4MJYEXSfE4T1Zm4fF3emGam
	ksac4/xDcMd6Pt1VF96S/aluCzSvVZVeRuv9UOgNR1abxkCS90CNMjSCRRI6TpM4Wjg+
	hS+dTNbWCs8L48bPipVD09xSoIxizUmNRcZiSRQ5VtNjr+/JMBBYi4Gf68n4bKDszCOs
	r/yeh74OOpDi0YNYfKm7qZvifNAxgsF/NtIZASvC+5/QgfOCG5dfoHFie9xeC/Js8Hkn
	lQpw==
X-Gm-Message-State: AG10YOQB+sMUyb6nirWpUeHFmgLxQ7hFtaRY2dlxr3v5kVrJ+6SwS3HSCqK+wZu83pySYvDi9hO6sjMYJsLw+ree
X-Received: by 10.107.135.104 with SMTP id j101mr4274214iod.133.1453986805121; 
	Thu, 28 Jan 2016 05:13:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 28 Jan 2016 05:13:05 -0800 (PST)
In-Reply-To: <20160128131355.GB1902@mbabyjoh-mobl.fi.intel.com>
References: <1453984641-1849-1-git-send-email-maxin.john@intel.com>
	<CAJTo0La7EzDZ5ocG+++=7gp0PqNNquVv6a4H66p3orL3+c+GLA@mail.gmail.com>
	<20160128131355.GB1902@mbabyjoh-mobl.fi.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Jan 2016 13:13:05 +0000
Message-ID: <CAJTo0LYFHTzv3vF0fz3VQ2sLFgBVfqKw4HO15cUJanCt76REbw@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libical: update to 2.0.0
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
X-List-Received-Date: Thu, 28 Jan 2016 13:13:28 -0000
Content-Type: multipart/alternative; boundary=001a113ebe92071946052a64af08

--001a113ebe92071946052a64af08
Content-Type: text/plain; charset=UTF-8

On 28 January 2016 at 13:13, Maxin B. John <maxin.john@intel.com> wrote:

> These library dependencies do get detected automatically. This line can be
> removed
> if we don't want to explicitly mention the dependencies.
>

We only need to mention library dependencies explicitly if they're opened
at runtime and the dependency magic can't see them.  Please send a v2 for
this patch.

Presumably although the ABI changed, the API is the same so bluez5 and so
on still builds against libical 2?

Ross

--001a113ebe92071946052a64af08
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 January 2016 at 13:13, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D=
"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":18b" class=3D=
"a3s" style=3D"overflow:hidden">These library dependencies do get detected =
automatically. This line can be removed<br>
if we don&#39;t want to explicitly mention the dependencies.<br></div></blo=
ckquote></div><br>We only need to mention library dependencies explicitly i=
f they&#39;re opened at runtime and the dependency magic can&#39;t see them=
.=C2=A0 Please send a v2 for this patch.</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Presumably although the ABI changed, the=
 API is the same so bluez5 and so on still builds against libical 2?</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a113ebe92071946052a64af08--
