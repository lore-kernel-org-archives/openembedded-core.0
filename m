Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4422460043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 23:01:24 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so50704644igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 15:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=PqYrM7nvpOzoWk2kbghVNk5aHIHvmWrNpXmiRPRE3S0=;
	b=rqPgBK2jg7G6ziglK71SQvWZhwO/pqpdTaPVZ4QpyPeiY2xaSShsyU6Kqmt2QDk0Ar
	O5KAaa45ce6DBkX8BO5MqP1Y+1k/2QhF20/n5J+vHCItdNDTo2eTd/q8f4FMsjZrimrG
	5vdLOIIWv+RXKS6NLNrvRQfIH/yOl2qoQLDjJSPRuXLtfBPnXBYdWYVytTbAvTTTzSVF
	5315ew66OwoEenT1kU55yKoMBT8EfYQTVY2+7LkBH8a359lBlHdRKwDqVRAf92WFYHRs
	DRELs2sbPl6f1cHcj1II7g/9KDPVnpRVPjvBCyr3jX7A7s9/CB2EBnX5CwLrZrLJ/PXf
	Bc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PqYrM7nvpOzoWk2kbghVNk5aHIHvmWrNpXmiRPRE3S0=;
	b=X5WbiiqwjNBTJ9dT+RQRcBN5OgigpKGbPTODsy+yk/61rdDXRRVMky7xB3422O1fiN
	PzFpln5+Gk/DRMegnBKjjlckFUOTxKbQrDBGVMfcOKsGbaF15lVBctGgssqjUXEc1yTy
	AmNA3QpmuqvuX2Z1AcKZLuc0r7EjGKD41bqLyA+6bdbRw49TeKJAohguPimxv2KClJlf
	goJKMdukrdIfpLf0zpVrrCpgeSaq78suTfPnJnNt9bzfotByBWnKwbGHUNVsrjeBDmsu
	Dw3eb+Q8Dlg1sQ3ZUCcKvyvltLoGFrSvxObQNTvz6jmOAiQ7kHD5yEDqJkeYqPWmq3Fs
	UckA==
X-Gm-Message-State: ALoCoQn0syVjuCN3Pio8mzw+yppHWaQwjjUlqLnCf6UaHX+qeJh2ovCMGgd4S1/Pmv2muaGXXJ0L
X-Received: by 10.50.43.161 with SMTP id x1mr9729387igl.64.1447887684564; Wed,
	18 Nov 2015 15:01:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 18 Nov 2015 15:01:05 -0800 (PST)
In-Reply-To: <56457B13.3080402@windriver.com>
References: <cover.1447318250.git.liezhi.yang@windriver.com>
	<8d5508408ad7f619d8981aaf098592e2fa2244a8.1447318250.git.liezhi.yang@windriver.com>
	<CALbNGRQSo-T+OJp4aS4PaJhVRo918ECObe0yOS+jgKH5mXG+5w@mail.gmail.com>
	<564456AE.6020909@windriver.com>
	<CALbNGRSVOnr5+rScvstYDou7u-ngdx=9mGgwa9cdtBWVvus2Fg@mail.gmail.com>
	<56457B13.3080402@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Nov 2015 23:01:05 +0000
Message-ID: <CAJTo0LaErhtww_c=4+zKaeydkFYkfq+B58gkAiAz5iMYtydipQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] clutter-gst-3.0: add --enable/disable-gudev
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
X-List-Received-Date: Wed, 18 Nov 2015 23:01:24 -0000
Content-Type: multipart/alternative; boundary=089e0111bffe1d074c0524d89f3d

--089e0111bffe1d074c0524d89f3d
Content-Type: text/plain; charset=UTF-8

On 13 November 2015 at 05:54, Robert Yang <liezhi.yang@windriver.com> wrote:

> Sorry, what did you mean, please ? Are fine with this patch ?
>

No.  The code checks for libgudev but your adding a build dependency of
udev, which only provides gudev when systemd isn't enabled.

Ross

--089e0111bffe1d074c0524d89f3d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 November 2015 at 05:54, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"=
mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":18e"=
 class=3D"a3s" style=3D"overflow:hidden">Sorry, what did you mean, please ?=
 Are fine with this patch ?<div class=3D"yj6qo ajU"><div id=3D":17i" class=
=3D"ajR" tabindex=3D"0"></div></div></div></blockquote></div><br>No.=C2=A0 =
The code checks for libgudev but your adding a build dependency of udev, wh=
ich only provides gudev when systemd isn&#39;t enabled.</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e0111bffe1d074c0524d89f3d--
