Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id EFA5E76420
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 15:04:11 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id n128so9417996ith.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 08:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gdGSzAnmBwCEIg0Ikq00Z+5LbKo42GS6gKOovS4gS1E=;
	b=nhdRzj1mKhQpfyfhuNs1HcIkFG+GgMJ0rpWmgBKznsDiTIEkhXXcppHM7M3PJDx1Ad
	Q8LD24JDpgRZNhG5ttkGMp1yX4DEIiieJ9nK4xdjZqL8oJtldN54OSUnRl00E3Bio+nA
	kwAeICB5uCzTx+68bi0eqOKIGAFITmkmNKEjdtk89GFiZ0OY82cStLK5dISPikRLLX/t
	a6CCzSo8n7NrwkhOaXEGh9LWCjpxv+c45FvF2STwgBa/xUHkSuNchiyVkQb/s8s1jJKp
	waNQU3b9kGWjbms7nh2uK9mKtSmd4vqkJ4jlkOHljYd8d16UI2De+QcWJxDOlrpdh4Lp
	ximw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gdGSzAnmBwCEIg0Ikq00Z+5LbKo42GS6gKOovS4gS1E=;
	b=e1INNIPHUH1ZtnbtiynpiLcWJL6K3EBJjhik074rcJPGImYFoijdqu5ZxYpqrY+F9P
	JMsBPcaq7T5EpcIRkUQ/MC1Bt5WDCSNczXhwnZDKaAyvS7fIHksOOd46/e3/uUHxDM9e
	M0XATrZ19kwiAfinQQKs4Gb8Fdf4E1zo45VPWMkYzBpIf7HRVDcOrMadapI7DY6FL1dy
	DFcoLxT6TY61IxXQgG9s6//LHMweL2WpNZ9yT9cwBfBPdHf/MPTi3tbTZdeMTKyQUoXc
	f83ldeoXb+Ht/bHSnhTQPjyww6EHmZjrLctCPTD8tw9kTaXbGp/X8JO4MzSsiDO5Rfe8
	NBvA==
X-Gm-Message-State: AEkoouv/TNInnqxqSoMCegItsJlO0x8K7iPrNJi2cjeVuw8SpurDyNQ3d92O31yZxAutSXlZX3AN/IRpj4EWxZpZ
X-Received: by 10.36.121.206 with SMTP id z197mr4028924itc.22.1471273452049;
	Mon, 15 Aug 2016 08:04:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 15 Aug 2016 08:03:51 -0700 (PDT)
In-Reply-To: <18de1b4818af9e90e4578af9335497c5edd7ae9f.1470967099.git.dengke.du@windriver.com>
References: <cover.1470967099.git.dengke.du@windriver.com>
	<18de1b4818af9e90e4578af9335497c5edd7ae9f.1470967099.git.dengke.du@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Aug 2016 16:03:51 +0100
Message-ID: <CAJTo0Lamk-EkyDpjsWw0DxKooqTd1=+0+f7kZD8Aa1yXCXQ5og@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] bash: fix run-intl ptest failed
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
X-List-Received-Date: Mon, 15 Aug 2016 15:04:14 -0000
Content-Type: multipart/alternative; boundary=001a114aa8207a3bfc053a1d8b37

--001a114aa8207a3bfc053a1d8b37
Content-Type: text/plain; charset=UTF-8

On 12 August 2016 at 03:08, Dengke Du <dengke.du@windriver.com> wrote:

> NOTE:
>    Ensure the system contain fr-fr & de-de locales
>
>    Some tests of intl.tests need to change locales to accomplish. So you
> need add
>    the following to a conf file:
>
>                 IMAGE_LINGUAS = "en-us fr-fr de-de"
>

Would it be possible to sanity check this in the run-ptest, so if the
required locales are not present it emits a warning?

Ross

--001a114aa8207a3bfc053a1d8b37
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 August 2016 at 03:08, Dengke Du <span dir=3D"ltr">&lt;<a href=3D"mail=
to:dengke.du@windriver.com" target=3D"_blank">dengke.du@windriver.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":mb" class=3D=
"a3s aXjCH m1567c82dfd21aa19">NOTE:<br>
=C2=A0 =C2=A0Ensure the system contain fr-fr &amp; de-de locales<br>
<br>
=C2=A0 =C2=A0Some tests of intl.tests need to change locales to accomplish.=
 So you need add<br>
=C2=A0 =C2=A0the following to a conf file:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_LINGUAS =3D &=
quot;en-us fr-fr de-de&quot;</div></blockquote></div><br>Would it be possib=
le to sanity check this in the run-ptest, so if the required locales are no=
t present it emits a warning?</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--001a114aa8207a3bfc053a1d8b37--
