Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id DF8C8734B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 15:55:58 +0000 (UTC)
Received: by iouu10 with SMTP id u10so157611669iou.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 07:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Mj8FdYkuLka0jbY6B+ott3LYLJa7rlUYGWhxb6wBc44=;
	b=aK1LCOs4ig89kF48gdyKH9tz19vLuvT98VsmQ/33D7XOdRCqe3EYBz8OM5DlRx0QEy
	38kismKGDd3Ahd/IjJw+pmk+vcZQAvG+WfSDSqj27T+MnI5YbYpmIEXBz0a+meYwKboQ
	Pa39xZinXuSHNbrYPTxDr3p8JgF2smlQgcjqxS6PMgRi8zg3XzPjarTDsv6Nq115uHeu
	e5hPuvriMoeApQ8tD2nIU/V4/fTeS2B/y4rg46ULywW3wgCkzqVBZZa64G6JaPjX1so0
	a5gPUmQwz/9mHYFKV+J0FuYGPUYu7tAcMxBz7MZjkKDLVvJoxV7S+ZLkoRG/0SIgaJny
	li+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Mj8FdYkuLka0jbY6B+ott3LYLJa7rlUYGWhxb6wBc44=;
	b=K2p/0ExalnwHLfDjkmgPSuYeYuEwqJ1tWsWTfweqpd8mFWIm086X2sEaqwxEMhewiw
	yOgd9nVsQ6CZsdLa7QUGBzV9W89GSt/ZIohSzeayD9siNOK50fhxyom1fcH6fvfaDYRG
	fX523yv/CPE/6YKqn94RPlMZANQm0g2MTyMwkpk03slh1AKkwLcYD1wYqxudnSZGA7Fq
	4N8f7P5+2sxMDhFWBOFS5XL8i+29M5TZq/mkc+YlDg2gXn8iNGgnM4mkYvXuDCaod4iB
	3KCRqkgwKncmbx4CH26tR7oA0h9A7t0bx45fQoqTDJafpa+/C2eGzpcB/UORxkKwg3s4
	ozOQ==
X-Gm-Message-State: ALoCoQk1Z6UKNVO/fFRiv83Hzw/KBWcGleuQGqNB1lDLXoX1rc4Nu5WCZzJePeuEDuu8uMuVjTcK
X-Received: by 10.107.3.144 with SMTP id e16mr28631166ioi.99.1447689359257;
	Mon, 16 Nov 2015 07:55:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 16 Nov 2015 07:55:39 -0800 (PST)
In-Reply-To: <CABcZANnm-hty1_MznJDsLLGWrSA2T+bpMxVG2mgEegeZJtbahg@mail.gmail.com>
References: <cover.1447371033.git.chris_larson@mentor.com>
	<7dfc5c44d99054fd0f087bd1b4102aef0511029e.1447371033.git.chris_larson@mentor.com>
	<CAJTo0LZbY3d718R8WL4mLuS-hxKiWTgHYBNf51VPwUfbbNSeAw@mail.gmail.com>
	<CABcZANnm-hty1_MznJDsLLGWrSA2T+bpMxVG2mgEegeZJtbahg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Nov 2015 15:55:39 +0000
Message-ID: <CAJTo0LZQgEWa0ZT1uoFmBd7C6aXJzqAeofdwN7TgSCbUUAzpww@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] systemd: drop unneeded $D check in prerm
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
X-List-Received-Date: Mon, 16 Nov 2015 15:55:59 -0000
Content-Type: multipart/alternative; boundary=001a113ecf40010e320524aa7258

--001a113ecf40010e320524aa7258
Content-Type: text/plain; charset=UTF-8

On 16 November 2015 at 15:54, Christopher Larson <kergoth@gmail.com> wrote:

> Er, yes, no idea how I missed that when reviewing the diffs. That was
> meant to stay local. Sorry about that.
>

Don't bother with a v2 by the way, I dropped that chunk when merging to mut.

Ross

--001a113ecf40010e320524aa7258
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 November 2015 at 15:54, Christopher Larson <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra=
">Er, yes, no idea how I missed that when reviewing the diffs. That was mea=
nt to stay local. Sorry about that.</div></blockquote><div><br></div><div>D=
on&#39;t bother with a v2 by the way, I dropped that chunk when merging to =
mut.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a113ecf40010e320524aa7258--
