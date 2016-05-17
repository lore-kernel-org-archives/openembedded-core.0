Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id E1755700FD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 13:49:48 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id d62so23742780iof.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 06:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sznvFZdNudx5n499TzeIhzI7hhGBJ3outMCSXTorg9Q=;
	b=C1fnZemMkOnPvIF90OhI6ZNSsRd4NY/RQGOGEHBcbseiZ2YgmMY9rxBE6oSgHyzv0S
	Jt4zDBl/KrvUiAYz6BM5T4NQY467rNIvUd8EYQndvKHv4lTMagrn69nnL6NHcoyibpcL
	2GygPpKn+Lc+/0ss+PW9QCEopbs33WjpbDo45xQ0GziBeLgZ1NMN5Itt3JECgw0bW20S
	QB9RrurRpgr6lIC+QTIlL2XXReBUCHSf24Sx9sMlYvJSwUM5D+ozJhYWxx1SKC/rkiXJ
	LJAzrwh5I74KDRx+7UV4GCE7dw1/483Af9ECsbJnLHwH7NKeBexwjSqFdAY+pL2C+B6S
	QSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sznvFZdNudx5n499TzeIhzI7hhGBJ3outMCSXTorg9Q=;
	b=Z0PdHFzAaWWGOMcv/vdtWmxQwjAmETfX51s5u2UqyA165ijed9Z/h+pzDHluvSeXAv
	WGhWu+D49AUujdN5/DggbWd/V0AAn0s47NWn/H9rBOQmR4lqxajt+VEfXxUP25sDxX5k
	tinEZ/RQbFH/zJY24y/hvdqFXwfoqbzK+FX2LH7sw5NN0yqLU2F/RXucB2z80uD2c9nn
	UR8oFL3cEvFpDpTNt/FBA4LI/MkVeBPsFCsahTw+ThSHi45fGfvL0ORC8K4Jns8KOOp+
	LLgtGboxzIexApebR7l195XYSMSNnbDaFcQPRukG+j0xF00NuFBk/Plaal0vF+QQz6Ke
	qxhQ==
X-Gm-Message-State: AOPr4FU08K8Zg27wfKP0rj0IvxgbSfhzmDhxGqiN5uzTBT/Bo6S+z3YC4upu+8Kfoktklm9NYLN61pA2Ns+ds4Gg
X-Received: by 10.107.51.213 with SMTP id z204mr1051153ioz.148.1463492989137; 
	Tue, 17 May 2016 06:49:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Tue, 17 May 2016 06:49:29 -0700 (PDT)
In-Reply-To: <73863eef-56c3-9085-7aa2-7408d52a5355@gmail.com>
References: <1463415451-21779-1-git-send-email-akuster808@gmail.com>
	<C6187355-EA77-4B31-8638-C5D64613DE0E@gmail.com>
	<573A8171.50002@gmail.com>
	<9A2A2982-674F-4453-935D-DFA3FDD3DB4B@gmail.com>
	<73863eef-56c3-9085-7aa2-7408d52a5355@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 May 2016 14:49:29 +0100
Message-ID: <CAJTo0LYU-WEcVpy_S4vG9XF4WqjMhF1CT0efjUi7e5eLVRGbng@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][krogoth][PATCH] python-numpy: fix build failure with python-matplotlib
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
X-List-Received-Date: Tue, 17 May 2016 13:49:49 -0000
Content-Type: multipart/alternative; boundary=001a11440cd0bfd60c05330a037e

--001a11440cd0bfd60c05330a037e
Content-Type: text/plain; charset=UTF-8

On 17 May 2016 at 04:34, akuster808 <akuster808@gmail.com> wrote:

> There is no configure for this python package. It uses hardcoded values
> in config.h or _numpyconfig.h per arch. X86-64 has the NPY_SIZEOF_OFF_T
> defined in _numpyconfig.h. To keep it consistent, I put the Aarch64
> changes in the same place.
>

I hate numpy.

There's also a largefile DISTRO_FEATURE that the recipe should be
respecting...

Ross

--001a11440cd0bfd60c05330a037e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 May 2016 at 04:34, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailto=
:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":24z" class=3D"a3s aX=
jCH">There is no configure for this python package. It uses hardcoded value=
s<br>
in config.h or _numpyconfig.h per arch. X86-64 has the NPY_SIZEOF_OFF_T<br>
defined in _numpyconfig.h. To keep it consistent, I put the Aarch64<br>
changes in the same place.</div></blockquote></div><br>I hate numpy.</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">There&#39;s =
also a largefile DISTRO_FEATURE that the recipe should be respecting...</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a11440cd0bfd60c05330a037e--
