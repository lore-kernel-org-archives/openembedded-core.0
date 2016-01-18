Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 45AD76FFEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 12:22:10 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id g73so355294202ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 04:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5ZC8djKJglBlUbsnSjiwn4ZtuzfIgpBy+e+Ar68k6ec=;
	b=0CM6zuSEm0OKcPK9tZ5adT/22IuVC0pyoO6uhUybh22DAA72q7XURJb6DftKe54/7G
	hxeNcNMLDhGil510wmLzXF+u977g4KYFPp/PMv+DGMN16CY/npJJSfLZKtlowA7LFjaw
	VmoIqp6ZsSRVPF7sU8FXCJdoBYxpn/NoFGu8bkDVLZp1lnP5lxR1E1zD65r8FLlgZo23
	a/lr3JDcF7Fbl4WZAqGQA5FwC3+GVENDucD7oDNSw3aluvAbJmwSytNBElLCYJgLbGZt
	FFFvrNTSq13arBCVDxN+AX30koCR8FjDuDPQFg+zi930bmHboIVyzFr26h5Ic0pRORoB
	OItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5ZC8djKJglBlUbsnSjiwn4ZtuzfIgpBy+e+Ar68k6ec=;
	b=Q95mBTL9HM0kYpg9SpmmTUWgFdBUTlRcq4BK2qNIaY7egUoqWo6/zqg6IdqaM6tQ3u
	POknXS8do8LRcP8T3f7gqgQx9Fm/hUNgCVOICoFl2vY144AIOVET02P0AQ+DdXWpb/jg
	Vewy/1Y1NWmdZu5vvEIwX3OJupEB3mF+ZqqZmgaC+nGwnWKhrpvv2GZJ9MABSL0CT2Tw
	8WCXPw9s/qhOob2UeBp4v8w/Wr6gOE0P5jA4uB9EedE/a0RtKhDx2qp+GaL9xmF/CljY
	cwxs5OhhMeGbXrG1Ifs98FfL2W5ZnH/vZHmgiH2TphHVeJR0oTSuShOxfm8vwiiusSnU
	isWg==
X-Gm-Message-State: ALoCoQmTFimQQH0YtNlALMzSuMVklIjTUwU3CLUOWj1onIVs5d8xjPFsaS02CfhRRxcPCMdrKVUfYeUcwloRSALIs/MfVQ3KN1tKJ+dQpLnHM7RqFWZssgM=
X-Received: by 10.107.3.154 with SMTP id e26mr19996867ioi.99.1453119731516;
	Mon, 18 Jan 2016 04:22:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 18 Jan 2016 04:21:52 -0800 (PST)
In-Reply-To: <5696C52F.3070807@windriver.com>
References: <5696C52F.3070807@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jan 2016 12:21:52 +0000
Message-ID: <CAJTo0LY02nLQqngQSp0WD9k5yTQKxA_gati8FgXSr3XrsapKyA@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Add python-systemd in oe-core or meta-oe?
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
X-List-Received-Date: Mon, 18 Jan 2016 12:22:11 -0000
Content-Type: multipart/alternative; boundary=001a113ec10a69dae605299acdce

--001a113ec10a69dae605299acdce
Content-Type: text/plain; charset=UTF-8

On 13 January 2016 at 21:44, Randy MacLeod <randy.macleod@windriver.com>
wrote:

> https://github.com/systemd/python-systemd
>
> This is a python module that was present in the systemd
> v215 source but removed by v223.
>
> So does anyone think it's useful say for testing?
> If so, should it be added to oe-core or meta-oe?


I'd suggest adding it to meta-python.

Ross

--001a113ec10a69dae605299acdce
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 January 2016 at 21:44, Randy MacLeod <span dir=3D"ltr">&lt;<a href=3D=
"mailto:randy.macleod@windriver.com" target=3D"_blank">randy.macleod@windri=
ver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><a href=3D"=
https://github.com/systemd/python-systemd" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/systemd/python-systemd</a><br>
<br>
This is a python module that was present in the systemd<br>
v215 source but removed by v223.<br>
<br>
So does anyone think it&#39;s useful say for testing?<br>
If so, should it be added to oe-core or meta-oe?</blockquote></div><br>I&#3=
9;d suggest adding it to meta-python.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a113ec10a69dae605299acdce--
