Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id E798E700F3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 01:04:44 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id x190so237374792qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 17:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cPfg1NmyY7QeadzzT0ec6pG+d8Exop0w3VL45EqZnR0=;
	b=fuBG4G0m2s+KYh5faktzghhP7n2V/aTHIdk59emWsIoXAhtzDdj5Zw+Kk0WR8PCtPh
	j2kIVyA1AKpgvMggt4II2vxhb1o1ZnRS8jRXEGofbkZsievUYQPjdBsAnFP+QPzAmEhx
	c7X8W8HuxtkYcxCrkBqmu2Bc9rAJLmqvba5IGtWIKFg3bLwKR5GC6hWo+JQ4SQXXwshA
	cErRQc0nwIhDN4C4BHsjoEsVMZVhsh15GbQSsX1qBdXYi1DOXNcGW8lwSt9hntDZ8IYZ
	6WPQlrOaulYfG/1QHVOAjVpv+EfBx9YTUBgQgrOqigkQGiJ6SSCFKKJnDYoCZoUxlZED
	WtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cPfg1NmyY7QeadzzT0ec6pG+d8Exop0w3VL45EqZnR0=;
	b=VZgfM9aJ2sC2wdDlprOOyRvJ6VQXPWkkiFoE9yHMI0QOtkfqyClZNlW0725kBtTx5x
	bgu662yteSvAl7ULiPfBt/p1PlAlOhSgjLp7XgC1pn+VZu3hq+SC+QYPh6sWG+ws22w1
	odw0uEtjsKyOPplkwjrC3aryJZu+Su/mUCVDLSJuoYrhPKOO02zHGIKy9HYv/B5aefv9
	9hsu12XYu7LnGvM90EkFAY1A/0XiwbuOiozFEM6PZALTuZi/Ed4GUfOqG3JmwdVTAJRl
	JHJdcA9Sfn9Kv647mX0/t8b0t/3h5P9coFeAAM4Jq3/cesq+6sXFN0lfcn3YSsXTYt13
	EvnQ==
X-Gm-Message-State: ABUngvc2ydSlbPTgUHNAWsLc4nsEzmcrJtucRBoQweTrHBBvPuTsbtf38iemxCg+jTJS1QLl7VihxSu7R9sWP4l7
X-Received: by 10.55.75.17 with SMTP id y17mr15984475qka.26.1478653485726;
	Tue, 08 Nov 2016 17:04:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 8 Nov 2016 17:04:25 -0800 (PST)
In-Reply-To: <20161105101438.1ef1f627@nuc.betafive.co.uk>
References: <1477161480-20271-1-git-send-email-paul@paulbarker.me.uk>
	<20161105101438.1ef1f627@nuc.betafive.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Nov 2016 01:04:25 +0000
Message-ID: <CAJTo0LbB0eGStoFbyinDYP0zzEJ27BL0eDyGKFkjdh=AaWBPVA@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: OpenEmbedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Allow ${S} to be overridden
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
X-List-Received-Date: Wed, 09 Nov 2016 01:04:45 -0000
Content-Type: multipart/alternative; boundary=001a114a88c8c361b50540d3d7a2

--001a114a88c8c361b50540d3d7a2
Content-Type: text/plain; charset=UTF-8

On 5 November 2016 at 10:14, Paul Barker <paul@paulbarker.me.uk> wrote:

> Ping on this. Anyone had a chance to look at it?
>

I tend to want to let Bruce have a look at kernel patches, but this does
seem sufficiently obvious that I've just merge it to my staging branch.

Ross

--001a114a88c8c361b50540d3d7a2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 November 2016 at 10:14, Paul Barker <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:paul@paulbarker.me.uk" target=3D"_blank">paul@paulbarker.me.uk</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":37a" class=3D=
"a3s aXjCH m1583412f2cc867b2">Ping on this. Anyone had a chance to look at =
it?<br></div></blockquote><div><br></div><div>I tend to want to let Bruce h=
ave a look at kernel patches, but this does seem sufficiently obvious that =
I&#39;ve just merge it to my staging branch.</div><div><br></div><div>Ross=
=C2=A0</div></div><br></div></div>

--001a114a88c8c361b50540d3d7a2--
