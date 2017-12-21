Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 32FE0787F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 14:18:08 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id 87so17036377ior.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 06:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wF32/LnFvVa8jLr3SA66dkrT4NfvyUkOQAFccvxsoxs=;
	b=xgK1QN9PWYk6Z7Y7ctaezrhqWXB+aQGbxEwnUkE2g0XJNbI9oz1iMNzZANylM4zgL8
	8XbWRqJCi0BS6pJMvoembPrzQButlg3TkPDyBDwD9ROnLSXY6jG30hI297sR6NpurXkV
	55EmVb3g10awRosPiyfuil9/cHA+H9TMDQXfriF27dPm5Wm6CvJn+lLiKbGMhNjfOHiD
	Q82elgyMBEDwFX0ZjCPPQZb/SBWqOepbp9LrqHGly3gSK5zW1z54vviROePu5aXTXmlL
	OvaWJ2VHbu4kcLPzuludO+F5ToUqVVvMaDQr0teJefBckJQYSYeS+AOVkYyjp7A68fPB
	ZrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wF32/LnFvVa8jLr3SA66dkrT4NfvyUkOQAFccvxsoxs=;
	b=sAK/dCENkfOe+IID6mNWmtcszD1WtcaHAq9vyTjOFVnfx7V/seIJ+wQXTYL0s1tosf
	6Ogl7efwtwOoxMSA1KfCrn4Cp0CvvErhsURb4Wbwme2cyIsNaIaT8RDnfROUmZvGFs+V
	xoe+ateFCusL8mMbkXcacQtytZTBc2GAj9MfgYUFjM2YYIcoPAdjk3ah1Bdr9OPoKwR4
	eHnGrApjzIM/GaNJ3O9fHGv+VOWUEujFz9bAW6Hj6B3HAd6wjU42UZGzcDk+0UAGZ2xl
	S1hqxQ7XxTK0/U2b695TV8vAvpUIDYVeSnI7ODQDb4loglIYYiSlVwLOS96TPQf8xZXU
	oRmQ==
X-Gm-Message-State: AKGB3mKZZJTnoO354/rRRKY1LE5lU8jwUv2AsHIb3tFFaRYmQQ9vZORg
	Hjyl26wq7wgO6ISmAHEkbyVQNhFfKMLCnwj41Gc8dA==
X-Google-Smtp-Source: ACJfBovLz3dCujtMmhGW3XxzFcWunYC059NHIQsNIZV1XlvRpPF28+QQmjM8kr3bPm4Zkom31wvdd9IqdmkmVrPG1t4=
X-Received: by 10.107.7.152 with SMTP id g24mr9046582ioi.227.1513865890458;
	Thu, 21 Dec 2017 06:18:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.34.140 with HTTP; Thu, 21 Dec 2017 06:17:49 -0800 (PST)
In-Reply-To: <2c33a5f2-26ae-3050-86f8-62a41d5ec593@windriver.com>
References: <cover.1513831180.git.liezhi.yang@windriver.com>
	<65382db74f44d0296de2ccc3e5f67bef740e8422.1513831180.git.liezhi.yang@windriver.com>
	<2c33a5f2-26ae-3050-86f8-62a41d5ec593@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Dec 2017 14:17:49 +0000
Message-ID: <CAJTo0LY0Vtu7phJ_pxZc-cOH8ozbkerRuVWG_TW3KQse_gUVWg@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: fix PACKAGECONFIG for lz4
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
X-List-Received-Date: Thu, 21 Dec 2017 14:18:10 -0000
Content-Type: multipart/alternative; boundary="001a113f3cfea397ed0560da5e6f"

--001a113f3cfea397ed0560da5e6f
Content-Type: text/plain; charset="UTF-8"

On 21 December 2017 at 05:55, ChenQi <Qi.Chen@windriver.com> wrote:

> The problem seems to be that the lz4 packaging problem.
> lz4-ptest is packages as liblz4 and is installed instead of the lz4
> package.
>

So that's because lz4-ptest ships a copy of the build tree (so has a
liblz5.so.*) and is before lz4 in PACKAGES.

I've got a patch here to remove the ptest bits from lz4 as shipping an
entire build tree isn't a good idea, and will look at fixing debian.bbclass
so it doesn't consider libraries outside of $libdir et al.

Ross

--001a113f3cfea397ed0560da5e6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 21 December 2017 at 05:55, ChenQi <span dir=3D"ltr">&lt=
;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriv=
er.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">The problem seems to be that the =
lz4 packaging problem.<br>
lz4-ptest is packages as liblz4 and is installed instead of the lz4 package=
.<br></blockquote><div><br></div><div>So that&#39;s because lz4-ptest ships=
 a copy of the build tree (so has a liblz5.so.*) and is before lz4 in PACKA=
GES.</div><div><br></div><div>I&#39;ve got a patch here to remove the ptest=
 bits from lz4 as shipping an entire build tree isn&#39;t a good idea, and =
will look at fixing debian.bbclass so it doesn&#39;t consider libraries out=
side of $libdir et al.</div><div><br></div><div>Ross=C2=A0</div></div></div=
></div>

--001a113f3cfea397ed0560da5e6f--
