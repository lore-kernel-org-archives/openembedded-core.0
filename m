Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6529860112
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:48:17 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id mv3so192560189igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jan 2016 02:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HSKjqjEFd4UZejLa2e+QTgOp9XnyXvgM6eYu9OhD5qU=;
	b=yyjXvLuHglykc/w+RfZp6ftkfau1iBPx1AolkRlBiAsiBs2wxRzFfiZf2ukxpL1yec
	ckS7w0zyrSm8DGiT6qTBOeAIzDLP3+dehB6ySlkcmhbtfyej10v0Uk+UW27uvUyJzVWi
	ikuYeQ44PcmS6sh58PprPtrmGTNLrsEpFANsZEcnN79cclSs8N9fiSl2UYob229zXIZd
	5SF+muUKwfzZetk46oAkzp1i0qwJsLyGQlxZAzivwYuRA/xveqySMmPg9xXDlxMaFaAb
	OmazftAdxr1MG2t4xru9qPiyctMvjK9XA0r6L60FlLslIw0k5R7l1mnx9WZd1IT0Tdkw
	KUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HSKjqjEFd4UZejLa2e+QTgOp9XnyXvgM6eYu9OhD5qU=;
	b=PycK/98i6WW5HOviyU71kOLvUB1GP3hvtfb8QG7bJmyiXOP1px7aSBAiI6nqP/nscl
	Zf4i4LNKsckmpU6mKsBI+XsZh48KtO0CsVLjhPn03MaSuyclsqAtkfckpmHz+au7RIYL
	KrhmAYlXVkjOm6QtB+EPSmLnETqLkZsVFPb1CMKg6hjAeX+iZSuvimPGrThNM+CP5V55
	dXuS//5AWc7N3LJW9+OEDNUekrnOg5cSjV72Vd6hKy4iC1aHBYyn7cE8mKSUtCqnhAPz
	4oKybPpxjlldC3649bRUnVrYTyfewIz0DIL6UOxtg/7/cRBrftrtf/99Z7GUHJyXq4Rz
	IbGg==
X-Gm-Message-State: ALoCoQle5Oncnjad40GyuWlH5iig2olrwKV+7UnpUoZN0q2rfXxMlOK5zhYZj1Eru49x+c7CGjEHHuq/9hQyItXuacPYe1/AfHd/k7J2FthHcXD3hIzwLNE=
X-Received: by 10.50.22.33 with SMTP id a1mr76311125igf.52.1451904498761; Mon,
	04 Jan 2016 02:48:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 4 Jan 2016 02:47:59 -0800 (PST)
In-Reply-To: <c46aeee4002b37e3f84433f78cbb82278e5d066e.1451382094.git.kai.kang@windriver.com>
References: <cover.1451382094.git.kai.kang@windriver.com>
	<c46aeee4002b37e3f84433f78cbb82278e5d066e.1451382094.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Jan 2016 10:47:59 +0000
Message-ID: <CAJTo0LYN-Lpq=y3fcyYCAFPCZVuRrbTv+ALL2ytT_tQsmoa8Mw@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "glib-2.0: build dependency cleanup"
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
X-List-Received-Date: Mon, 04 Jan 2016 10:48:20 -0000
Content-Type: multipart/alternative; boundary=047d7b10ca19e598d805287fdb40

--047d7b10ca19e598d805287fdb40
Content-Type: text/plain; charset=UTF-8

On 29 December 2015 at 09:43, <kai.kang@windriver.com> wrote:

> This reverts commit fcd7494b347423185c883b2897c4908929843a71.
>

Why revert?  Just adding glib-2.0-native to DEPENDS is sufficient, no need
to revert the other improvements in that commit.

Ross

--047d7b10ca19e598d805287fdb40
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 December 2015 at 09:43,  <span dir=3D"ltr">&lt;<a href=3D"mailto:kai.=
kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":1dg" class=3D"a3s" st=
yle=3D"overflow:hidden">This reverts commit fcd7494b347423185c883b2897c4908=
929843a71.<br></div></blockquote></div><br>Why revert?=C2=A0 Just adding gl=
ib-2.0-native to DEPENDS is sufficient, no need to revert the other improve=
ments in that commit.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--047d7b10ca19e598d805287fdb40--
