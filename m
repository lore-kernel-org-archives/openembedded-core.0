Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id F18F471DDA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 09:49:46 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id k74so3510144qke.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 02:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qVVMM0SRqoOB1Xnzi07Q3sA2+A1bFdS1+NdzIHYTLWQ=;
	b=gl+4GZLLPkTdKauPi3R5ws2Rn+2c8IjmyFwBgLu3r95vMbMClH9515B5xLi5BN2cXV
	bow+cs1YKfSCG8+TehFmtvBC2/JWaIUyGY2CifYsaCvxxwkWdcHXKmrACHnxn4fl7WZs
	RR2K5b5S+bN/XSn6hOYS+wom8BxZtwAlwxkeXiz1SGrjYvPaOtF/aS40xBX1l0ErqJx2
	ilLHTo63GytrM1Uku2t1E20FXuXl8i2E8uRXM0lmC3Es0t9Q4jPnkgpeHcahHd04WX5S
	ci9RQY9Ao3RGH2Clubm0ORsjRST9BPsl4QUUYd4wTAiV3QXxt/FF1KDBZUOVpWrYtzwB
	T5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qVVMM0SRqoOB1Xnzi07Q3sA2+A1bFdS1+NdzIHYTLWQ=;
	b=jTI41dxySNhZ3bNJ7tPWVKOSnOcMkBURhMLUI3OEjAw20UQnIyO3trz9SfU4G2EWub
	jWbyfdqBuO3BI+odj5lUivUzhIVe+YR8zhnAqJAKsyGnVLw+Q7Pxh4Fkf35+EEj6BYTS
	SoExZ2Soenzq6wM/XxmXJaa/h/73p72uVje61Jp60rJkCDMuMiQ/64Bt2OsEQnehWnqt
	C/asb0qDHeh95rWnAoVEnw06Pw/SHGYxoxYwIGnTRrRfpkSNu9vebFlGpQwFfs6n1UGG
	oD9ACP8z5nPJLzQz1lpyRLJY/2IPLaIYEHpYxH9cRDEMF57Fn2Zso2ErCXVEnVgKyrE7
	89cQ==
X-Gm-Message-State: AODbwcC40e7xgcxOLHGFSEnPRxuO0xQR7DKcS1hV+TUMl9taApsr4Hv5
	GJgGoegsbHUKpJjsPfjkAY8AerkOxQyC
X-Received: by 10.55.146.199 with SMTP id u190mr883595qkd.109.1495792187607;
	Fri, 26 May 2017 02:49:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Fri, 26 May 2017 02:49:27 -0700 (PDT)
In-Reply-To: <AM5PR0401MB2674C8508629E9A0834B5D8BE9FC0@AM5PR0401MB2674.eurprd04.prod.outlook.com>
References: <1495548488-12280-1-git-send-email-carol.zhu@nxp.com>
	<CAJTo0LYms47eMVfYR8cfFn0+j6UhV_ODNdjzb-HqJ6gC=MNY2w@mail.gmail.com>
	<AM5PR0401MB2674C8508629E9A0834B5D8BE9FC0@AM5PR0401MB2674.eurprd04.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 May 2017 10:49:27 +0100
Message-ID: <CAJTo0Lb+gfjt3Pw2NWw2f37bf8YOw8KXaR=aK+qjthw7a5BD6g@mail.gmail.com>
To: Carol Zhu <carol.zhu@nxp.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH 0/6] Add some gstreamer1.0-plugins-bad patches for pyro
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
X-List-Received-Date: Fri, 26 May 2017 09:49:47 -0000
Content-Type: multipart/alternative; boundary="94eb2c08bd7000203b05506a4285"

--94eb2c08bd7000203b05506a4285
Content-Type: text/plain; charset="UTF-8"

On 26 May 2017 at 02:56, Carol Zhu <carol.zhu@nxp.com> wrote:

> These are backports from 1.11 or earlier.
>
> And I was told that Maxin is currently working on upgrading the GStreamer
> stack to 1.12.
>
> So I am trying to upstream them for pyro as these probably do not make
> sense for master.
>
>
Ok, thanks.

Ross

--94eb2c08bd7000203b05506a4285
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 May 2017 at 02:56, Carol Zhu <span dir=3D"ltr">&lt;<a href=3D"mailto:=
carol.zhu@nxp.com" target=3D"_blank">carol.zhu@nxp.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><p class=3D"MsoNormal">These are backpo=
rts from 1.11 or earlier. <u></u><u></u></p>
<p class=3D"MsoNormal">And I was told that Maxin is currently working on up=
grading the GStreamer stack to 1.12.<u></u><u></u></p>
<p class=3D"MsoNormal">So I am trying to upstream them for pyro as these pr=
obably do not make sense for master.<u></u><u></u></p>
<p class=3D"MsoNormal"></p></blockquote></div><br>Ok, thanks.</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c08bd7000203b05506a4285--
