Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9C59F606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 16:40:01 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id f6so110016854ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 09:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E86MOnbQrbruvWvLjA1zMkuRayO5mJdKkxFpfpxNv10=;
	b=umf2LLUuLFyGPT56JCBViaqQIi1r6VPdjHHBuyHbGcWTDDFgQi/yLkayC3A8mELrJk
	cGBNdbrIlMTaXaUNIh17/AT4a52NdCIJEZJDC8ED+fC2nOGk8UXybifx2ELqif3ZVVTX
	FKv8Jy01UxVqJFZpzdETMKIJhDJOylCFGZ1Qf2n4frptU7MtwOPDs/RKi7v33jtSJA6F
	foKdCrl1y5YfTwVx3E34Srg4BDv0Ys1AFvMZ1SSOIK+iHxppP1rkmNlcguE3rEmMaZwn
	pl+DnHGhw+UVjRH0WR30o/jZDGB7PRsoxfi5jowV1V1pXXqGhr2hGWdSFlNmremYslRT
	hhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E86MOnbQrbruvWvLjA1zMkuRayO5mJdKkxFpfpxNv10=;
	b=NDMUJeIXvU0Nm++Zsu6oGvSjKk8EdRNdmK0RZDsNcZ7FhoV+n9gZX++QlLPzp+aaQi
	9o5igZURSX+EBWdthU33NQi31VJeaESaDpQxaaV5mHg7yY7Cv6pMeOkGso+bP7f2EKAD
	kzQpfJyH+nCgba5aCi0x/CAKenKlU6XkhkmNLiATwH5/u8WhPYpkyLYcUcy3PhCsC2EU
	LPqFDZR1HB0cHx1jiJ/zT+AIrog+w1ATXX3SwBKAjM0Vp3XoiW301B/JCOkG7OkaZ5O0
	LKe0CZ9gLFAJDGicLd4tdEa9AEjGp/hQPQ7SBbs7d34UDtelvYT5hVhEEUxruMfS4Hp3
	80Ig==
X-Gm-Message-State: AEkoouu24/+uI0XVAYsvn4DJJF1FF+MIYsE7PULyNuDVBiGcrC/Uh+K7D2tqYGtSQ9KvZoAOEJzysfZRUFFXxQ1Z
X-Received: by 10.36.19.75 with SMTP id 72mr20697035itz.83.1469464801704; Mon,
	25 Jul 2016 09:40:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 25 Jul 2016 09:39:42 -0700 (PDT)
In-Reply-To: <1789904.LeABdRZOVU@peggleto-mobl.ger.corp.intel.com>
References: <cover.1469190931.git.paul.eggleton@linux.intel.com>
	<CAJTo0LZZD0poopBgYb9BbeJ_UUaJc5KZxTXSV5jndnLJC8EiCQ@mail.gmail.com>
	<1493839.LtSXxTmLfS@peggleto-mobl.ger.corp.intel.com>
	<1789904.LeABdRZOVU@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Jul 2016 17:39:42 +0100
Message-ID: <CAJTo0LY0eNa94dkMuLow_hSh2_V=thCxGAVexfEf3v4fpXrgDA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] Extensible SDK improvements
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
X-List-Received-Date: Mon, 25 Jul 2016 16:40:02 -0000
Content-Type: multipart/alternative; boundary=001a1145180a841f0a0538786ffd

--001a1145180a841f0a0538786ffd
Content-Type: text/plain; charset=UTF-8

On 24 July 2016 at 22:42, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> Just noticed something that looks odd - why do all these paths have a
> literal
> TOPDIR at the start? Is that normal?
>

The error reporting tool use to replace TOPDIR with " " but that got
confusing as it looked like either whitespace was being added, or the
sysroot was missing in various places.  It now replaces the paths with
TOPDIR or WORKDIR to hide these personal paths in the logs for both privacy
and to let errors.yp have a better chance of finding matching logs.

Ross

--001a1145180a841f0a0538786ffd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 July 2016 at 22:42, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":8k7" class=3D"a3s aXjCH m1561edc9ea235fcd">Just noticed something that=
 looks odd - why do all these paths have a literal<br>
TOPDIR at the start? Is that normal?<br></div></blockquote><div><br></div><=
div>The error reporting tool use to replace TOPDIR with &quot; &quot; but t=
hat got confusing as it looked like either whitespace was being added, or t=
he sysroot was missing in various places.=C2=A0 It now replaces the paths w=
ith TOPDIR or WORKDIR to hide these personal paths in the logs for both pri=
vacy and to let errors.yp have a better chance of finding matching logs.</d=
iv><div><br></div><div>Ross</div></div></div></div>

--001a1145180a841f0a0538786ffd--
