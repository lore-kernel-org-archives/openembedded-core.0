Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1002671A21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 12:54:09 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id c45so17863001qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 05:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fe9QORUKRzve5CoV1pMV+ejqTvBssjttWZyvuGBxJ2I=;
	b=SgHYvUK6742Q5YZvs+P8SLd6QqA5WOE16T/25k5Lvo8d4+ELRE7Xnmm058Ngr3Qrmh
	m/M7bNatCB/ff+dy5qI0Im68qjJDzvw4WfTH9buyZ+on2h6RGz8u3rTEg6jY53biVR/d
	aAxMGa5TxSD9qE/Mllwx9KoF3l8AYwykXj+zrKJ32VF0pSkGY9dnd9V1f9tI7uBasNfM
	9sJWLg/7IOg50zq3QFiINEqIMRvaPLZqtPdfiIPVSYhCnbU5eITzqYtQ58GT5W/frnth
	YbvzUfIr2iSDZnBCU3xhQvtiejunTKV7Pu4J0AU0kd5H2VycuVSXm71UdZrhXfbV6wO5
	VC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fe9QORUKRzve5CoV1pMV+ejqTvBssjttWZyvuGBxJ2I=;
	b=AsyPhsDwgvgxYOK2x1UVVjDF+NAdzXTFoIGxAJ2C7Hupu8WTdE2Fn5drfSTZyco0XQ
	PewbyKOuPzY/1Zbd16p7R6ulEkdvULlggc53qpiDQhFWcPzq4+g4eRFZhNTk1XhEnmfl
	ILOwkt/1xVHFhqGwD6KCIULexw2GCJc4OOzFUlDzKM0sJS7oSy4xzicL6uUm53Ym19fi
	DirNUFa0J+9U1E5MiIM+gIRXdG+nUEMi6es27qlrw6dTM/HzU1iNObN14vdB+UlhEjYe
	sdk8nStyHWEBQ+psEqFOOoJGNjco2FpCuYw+0SeIgQ0vSvU5H3YG3mnOD6fIZaGj8e9B
	cAqQ==
X-Gm-Message-State: AN3rC/6Mdtuw7x/r8kSgTx6JFh0KammxBl+/OWlRbPsWjlnpAJX5WKOw
	kcCkXx6QJLoYS6hEAsVejPmaycBvJcBW
X-Received: by 10.200.46.26 with SMTP id r26mr2526807qta.197.1492606450735;
	Wed, 19 Apr 2017 05:54:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 19 Apr 2017 05:53:50 -0700 (PDT)
In-Reply-To: <1492592243.15070.1.camel@andred.net>
References: <20170419015839.1294-1-raj.khem@gmail.com>
	<20170419015839.1294-3-raj.khem@gmail.com>
	<1492592243.15070.1.camel@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Apr 2017 13:53:50 +0100
Message-ID: <CAJTo0LYTyUeF_1-eAU_LaC5X8mtaU7dbGDeB7bCief4JbS3-5Q@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] libtirpc: Enable des APIs for musl
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
X-List-Received-Date: Wed, 19 Apr 2017 12:54:10 -0000
Content-Type: multipart/alternative; boundary=001a114708cc493d7a054d848584

--001a114708cc493d7a054d848584
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 19 April 2017 at 09:57, Andr=C3=A9 Draszik <git@andred.net> wrote:

> This patch is being removed with this change, and so uclibc builds will
> fail. Is it time to remove all remaining references to uclibc?
>

Yes!

Ross

--001a114708cc493d7a054d848584
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 April 2017 at 09:57, Andr=C3=A9 Draszik <span dir=3D"ltr">&lt;<a href=
=3D"mailto:git@andred.net" target=3D"_blank">git@andred.net</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":5bd" class=3D"a3s aXjC=
H m15b856e9bc741164">This patch is being removed with this change, and so u=
clibc builds will<br>
fail. Is it time to remove all remaining references to uclibc?<br></div></b=
lockquote></div><br>Yes!</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--001a114708cc493d7a054d848584--
