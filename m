Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7B79560761
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 15:47:16 +0000 (UTC)
Received: by ioir85 with SMTP id r85so13420116ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Dec 2015 07:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=CY4E+KL1hPU/CWZN4xIX36CNeML9nW5yLpMo6d8S7Lg=;
	b=ksj24Qv6a0cAkHmxRhQIj39KzYDTj6Fu7+fApTLznHs50BmSGAQHF4ljNrzPVQg8fd
	EuQgJv/JvK+r2SZumI5iLkbNnpkWTLFQe0fEb6ju2rzvMxPb7ia8eWcDfdRNcli5CQPF
	FcJHMW0iRsfkpmlSvkLVEE11VA3HgSRALXud8xZ+Xl6GMcr0D/BhYixq6l5dOwjvnSWb
	UduptEDkoqsp8r45unRhQil0oR8lyZVqAVy0AwIesvuKuoSipEQVjiicZesgR06LBJW3
	273dEUSKDLmsCTfDkSpPELH/zRJ1r3+cVq7+HphE51lVNjQNPHmVj53LTJJB+QHpgTLg
	AA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CY4E+KL1hPU/CWZN4xIX36CNeML9nW5yLpMo6d8S7Lg=;
	b=HfXljG0Dfw2bTNR0LZMJU94UFaqtTSoiHEvV9Q/ZKbwYcSMdPuBMbf5jBCe5uI9WQy
	lORGIChRNP2Mk+QnIrhvdrqLlUNd2omTz7kg2YGLpzw4E5Kh8KSWyalzjHXBDKylpPwe
	f8jIi6rLcjsng40vzP6xF3a97xI5rR20mXf88sv+b113bEeSTV7D5jnzOu+3d2J8SlV/
	iGG52ZBc/AUuvRjONyiABUFPecWNLhNM+emi3LM5R3AUvMbbhLc1uyyMUlULvhlzwQ2Z
	PFVymU2ULW5Ly/7EV3xEVccA1jWZi5G+iZ/erOskoftNqf1A8k01CMxW06+v+1fOVN+Y
	T2JQ==
X-Gm-Message-State: ALoCoQkdFXACyXvdvSShL/v6oB9pjFJQG3PKkhTbBV95UDKLq2hvr/GT0qPycn+1qJhEX2DBGVYD
X-Received: by 10.107.135.30 with SMTP id j30mr58313994iod.148.1448984837301; 
	Tue, 01 Dec 2015 07:47:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Tue, 1 Dec 2015 07:46:57 -0800 (PST)
In-Reply-To: <201512011642.38085.marex@denx.de>
References: <1448983859-6096-1-git-send-email-marex@denx.de>
	<CAJTo0LZR6VgXVi848c=RZVw=+u1GyetHWkwTXuwEyxTocsa2sA@mail.gmail.com>
	<201512011642.38085.marex@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Dec 2015 15:46:57 +0000
Message-ID: <CAJTo0LZYZ4GYKdMK7SGQxtd1o3PyO1zberj6nn0QXmAfhr8fDw@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libbsd: Upgrade to 0.8.0
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
X-List-Received-Date: Tue, 01 Dec 2015 15:47:17 -0000
Content-Type: multipart/alternative; boundary=001a113ec64a836fae0525d812c8

--001a113ec64a836fae0525d812c8
Content-Type: text/plain; charset=UTF-8

On 1 December 2015 at 15:42, Marek Vasut <marex@denx.de> wrote:

> Looks like it depends on OpenSSL, so adding "DEPENDS = "openssl"" to the
> recipe would be the solution, right ?
>

Assuming it's a hard dependency, yes.

Ross

--001a113ec64a836fae0525d812c8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 December 2015 at 15:42, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div id=3D":3xx" class=3D"a3s" style=3D"o=
verflow:hidden">Looks like it depends on OpenSSL, so adding &quot;DEPENDS =
=3D &quot;openssl&quot;&quot; to the<br>
recipe would be the solution, right ?<br></div></blockquote></div><br>Assum=
ing it&#39;s a hard dependency, yes.</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Ross</div></div>

--001a113ec64a836fae0525d812c8--
