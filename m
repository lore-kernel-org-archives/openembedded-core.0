Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id A213B71A84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:28:49 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id w1so111156278qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 07:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6KOSYmWxUhMvRPU4qlshdmb++Ddj3YGBxFCENfxTmEY=;
	b=aznE77DDs10LgSm7Rc+w6kRIyM5FSPgTiWYfAobQHhDe+HptdsZnxfUJ12mehySSz3
	OHK8SIMEW3S0s9Iwea96R146iLj9DKo2/Vl1mJ2pZc+Ohmk9/228ka31/JoWrm52I5OE
	umv1MITHcw4XJlvjslTUwPBlgCDXGJRzZwoeGbxWgZDYNWRgnJl/3vuCY11R/yl9NXgl
	2TzyqWAZKevGNWZmzU2GSCgrGSCi5aGIuGN6kXVmqadoRhfKh/613SLQgtDZdSRU3+tt
	2zRb9nonZyiMNyL3Yjfrf78LKiIyknbiE5oXq8416uWcqxcVSNOyiLZnm7TbUl+5ZdDy
	cQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6KOSYmWxUhMvRPU4qlshdmb++Ddj3YGBxFCENfxTmEY=;
	b=Muj3EqLx0VVADF+8PXgXrlo1HHxA+qsnN82ll5OfkLF7aGTuU754Fg6rU12GMvMuCn
	MBsxd19XcBP8sFNhJ/ZbGDGJF210zVnm4TL1IL7bpUpZ704wd+LAhwchy39taKfFIPPm
	aiOaIewDlqupeQUbz5qVaUT0Y11RyF31tem14Wh5ZfK1paSspgmTtCvdcdcdShPMpxWS
	37+mSy6DLovYNjkbVCF19QmtzBi160Ox9mF5SAUzXtE3qfXp8Vx1K3Pni8X7mVIqPRjp
	Hpk117oDeIO19GJWCnlyXt95si1U7itOFw/3pmrJAUs2mOm1YiLy1oI1V7ntJ864H+p/
	BS0A==
X-Gm-Message-State: AKS2vOx4QPvAetljsYJOuyttxkl7AN6TQ90Cjz63IpCgBdLdfJ2z2LLL
	qdsTGLcn8/NTpN/DgRxn3q0J2mA5/6vP
X-Received: by 10.200.43.105 with SMTP id 38mr29563383qtv.6.1497882530537;
	Mon, 19 Jun 2017 07:28:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Mon, 19 Jun 2017 07:28:30 -0700 (PDT)
In-Reply-To: <0b2a7586-6f12-da7f-5d29-8caecc71e5e0@linux.intel.com>
References: <1497872882-15011-1-git-send-email-gabriel.ionescu@enea.com>
	<CAJTo0LaEb+bZ5fmCqy-CjNb3GyKm_xYem3y_92ziK_N4Ya8K-A@mail.gmail.com>
	<0b2a7586-6f12-da7f-5d29-8caecc71e5e0@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Jun 2017 15:28:30 +0100
Message-ID: <CAJTo0LYAyKD973eT7AOVLLO=BqTw69S5KaS2ttF6WqxDEdb_5Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH] autogen-native: Set POSIX_SHELL to /bin/sh
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
X-List-Received-Date: Mon, 19 Jun 2017 14:28:52 -0000
Content-Type: multipart/alternative; boundary="001a113d00a625f8ba055250f4f2"

--001a113d00a625f8ba055250f4f2
Content-Type: text/plain; charset="UTF-8"

On 19 June 2017 at 15:21, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> I sent a patch to remove autogen from master the other day :)
>

Yeah that's a good reason ;)

Ross

--001a113d00a625f8ba055250f4f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 June 2017 at 15:21, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":862" class=3D"a3s aXjCH m15cc0bd08012272a">I sent a patch t=
o remove autogen from master the other day :)<br></div></blockquote></div><=
br>Yeah that&#39;s a good reason ;)</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a113d00a625f8ba055250f4f2--
