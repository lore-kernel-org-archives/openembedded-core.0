Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 352EC6079F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 10:11:01 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id c10so4432595qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 03:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0eAM38kTWjGWKOtYVWvRt1P+JG4U+IMsyR4P6LJuZg0=;
	b=tVt5X4q0wUfA8Dw/Zlgwy7vO0glVnDJe7VolOrKLWgoorXYkO6fQzy0Ko++qX5+22G
	VIciXrPGlUym0NxTSo976ZPthD9RuBqzHq8eRJbDO19F27Q0PtDNnCA17jxpBq96Gb0R
	W3uKKRHTpNDcBRpXsY77hYOKIxGoFNI6VN0OKahctmQ/gICFFEkLsX+Wz2TpDu1SkiLK
	V+vJqI6vHUfBIV2QI/gpThImiciRNmNZXbdWTCeKHX4Qi0aZe7/YJR1u9YscOO3kK7Vc
	yW1s0clGidx2imGsPFMiOX5hHcUMKDSOS9VQQKEPwsX7hcmwqvut+Am71tZMmM77IW6/
	gVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0eAM38kTWjGWKOtYVWvRt1P+JG4U+IMsyR4P6LJuZg0=;
	b=iFcb5ZiV1t42lU9pr5oY1Dm/Se1NUX2pvViXzDxiUeIQn14HP7YjZk7QrRSdxtyjxr
	NaxI3rRkcFNXWkLz+3KMqs3hwrADNWQHw6f1uiUS5KoUcYueWKmnkrnC8btwW0bcfja8
	9LeGFlPvqk6etlWRqbgA2StDSupk/6UBd/YsmRf5oXxbykybVSm7siMlMpcLOg+d9ysI
	PGSTTd1QwS53yGACTOiemZbXAU2/5BYwPxoFwxQz+etxETJEqEVeov5499vlI4JIWgKy
	tPQ+bQXFmxFsyVprFxvaWTeaeHahyV7b/WWHKkQ9jTOW/IxBNnepcTzwbS0dfZlww9dL
	P1tQ==
X-Gm-Message-State: AKS2vOzNhJ8RsroRDMU6hO5F//IVY3vG8zkeMstbRMPdDvnjXOY0XT94
	foqewygW7iOiNNTAy9I66VkWE6bh7Gcw
X-Received: by 10.237.40.97 with SMTP id r88mr26597462qtd.27.1496830262783;
	Wed, 07 Jun 2017 03:11:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Wed, 7 Jun 2017 03:10:42 -0700 (PDT)
In-Reply-To: <7c2056f3-f791-4480-da59-3999e6b09f14@gmail.com>
References: <1496696005-28913-1-git-send-email-ross.burton@intel.com>
	<7c2056f3-f791-4480-da59-3999e6b09f14@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Jun 2017 11:10:42 +0100
Message-ID: <CAJTo0LaU98FDkb0Zz_9r5+uExJ_jDL-PQ+cry8+Uq2Rf=bHTuQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libunwind: fix build failure on MIPS
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
X-List-Received-Date: Wed, 07 Jun 2017 10:11:02 -0000
Content-Type: multipart/alternative; boundary="94eb2c068b341a46fb05515bf49f"

--94eb2c068b341a46fb05515bf49f
Content-Type: text/plain; charset="UTF-8"

On 7 June 2017 at 02:39, akuster808 <akuster808@gmail.com> wrote:

> under what conditions is this failing? or what is the build failure
> message. The subject makes it sound like your host is a Mips system.
>

Yeah good point.  I'll sent a v2.

Ross

--94eb2c068b341a46fb05515bf49f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 June 2017 at 02:39, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailto=
:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":1i0" class=3D"a3s aX=
jCH m15c80358faf2490a">under what conditions is this failing? or what is th=
e build failure message. The subject makes it sound like your host is a Mip=
s system.<br></div></blockquote></div><br>Yeah good point.=C2=A0 I&#39;ll s=
ent a v2.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--94eb2c068b341a46fb05515bf49f--
