Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5597C781F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 14:16:42 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id m68so22295333ith.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 07:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w4tCvpgX4hkPkeQqbh+7cQ/FSqKoRMtlz+StB7YzfDM=;
	b=dlgwV4OKSD/tmImagEzkD1H3I9SsrqSpyMCzAKftJmVmETAFYAHEyS2fxMmEOXPFeH
	RsOZCDkPGdaTPuuKKdD7N9jdO4AuOX3HP1gFrcxViqhPJ2lEPjCWXCgdNz5umDF8IDgn
	QqPsiV+ck6u9yu9aydPTKVD6PrqetWyAPU77I3cKZaRVD9aGqno5WdS+Pw0t3LyZs9uG
	4iLXpadzlAh2yixtx5ko93AZF0KzuK3XAAWPie8WcdLTnYWAsR7KSA3Gis+HyuyjqIG3
	KbJPgJhOlgmVqBlzS3i57b3HoAnpXbvoPtBwO/PE2g4q6zt0m24EotvMTf6vaFhC1VG6
	6gMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w4tCvpgX4hkPkeQqbh+7cQ/FSqKoRMtlz+StB7YzfDM=;
	b=DYIevOkOLbimAi/MMEKSCWnQJkQmlT5tRUlvPIh53xZ5Zx3ptqHRlvqTI6/34VHOC3
	nuDQE2r3tucuoMj8P8qZH7yUAtx3q5BQZ1FG2Xs+9wLwkgD/Zf5uV458KF2THOFbdxnH
	e983DfWjCptWQDlhXFsp+DAYamhPFxW6pLneKLDK0AwYEGTeQ1aFHtT0/FYlKIcRJeW2
	63w2EMvTCkp2xckBfXcEg7Rp0hR2+KwpgoA8vW/nm3bxUmBOuEBeh7yAzYi4tWaigT0s
	4dW4sP8q3uPAyUdLbc4MN36MrJsELqchmAFHngDtu9htvNft9S+emmSr+6BCHM4A+bYM
	h5nw==
X-Gm-Message-State: AIVw111uZ9mDNpImi2woRM50PkGsKb/BOe9huhXQ1f6bHzUP6R0E+AlM
	/NRypSmPLRAJvrFlnsEoijCOQMDIqlNX
X-Received: by 10.36.58.6 with SMTP id m6mr3701806itm.43.1500041803542; Fri,
	14 Jul 2017 07:16:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.161 with HTTP; Fri, 14 Jul 2017 07:16:22 -0700 (PDT)
In-Reply-To: <CAMKF1soBnvJf=aB3TN28_Mrh1+jeBF9BO0+xUfv2UAjgeuXVpQ@mail.gmail.com>
References: <1500008435-6588-1-git-send-email-changhyeok.bae@gmail.com>
	<CAMKF1soBnvJf=aB3TN28_Mrh1+jeBF9BO0+xUfv2UAjgeuXVpQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Jul 2017 15:16:22 +0100
Message-ID: <CAJTo0LaCKdRVNvM05SfTimEYLspPsTdVam2-P9jPRc98M22+tA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: namhyung@gmail.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uftrace: Add recipe
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
X-List-Received-Date: Fri, 14 Jul 2017 14:16:42 -0000
Content-Type: multipart/alternative; boundary="001a114419cad9548c055447b22e"

--001a114419cad9548c055447b22e
Content-Type: text/plain; charset="UTF-8"

On 14 July 2017 at 14:35, Khem Raj <raj.khem@gmail.com> wrote:

> perhaps meta-oe is better place fot now. Will it support mips/ppc in future
>

Agreed.

Ross

--001a114419cad9548c055447b22e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 July 2017 at 14:35, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":1f1" class=3D"a3s aXjCH m=
15d4150a38d6470e">perhaps meta-oe is better place fot now. Will it support =
mips/ppc in future<br></div></blockquote><div><br></div><div>Agreed.</div><=
div><br></div><div>Ross=C2=A0</div></div><br></div></div>

--001a114419cad9548c055447b22e--
