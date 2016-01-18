Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 97D5860112
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 15:10:26 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id z14so57229069igp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 07:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=aj2FT8+yYY0ljSeljnmjwd32HeDq9aa9je/PjBFFYkg=;
	b=zcG0YHhmyaqRpNBu1BMtPHqjCaJdcGpedgVbpimSlvnBCZdCoIyF8wtAFUWbTVvoZJ
	6wDb6MpecAeWZI/oKBJRiQf60+6OaPtsja3TPr9lb6uC1tMW5QLONpmpDjpVndXqzsa/
	JtpD1ynuUPBLOmo0qFl2ukDD/ZkP0hQXVgm8h5pfoWFbYWrZ4p1zMdA7zvHE7YZkT63w
	cyp0uwBlIVZhrlBWeRwB6tDUEwX98rQlGBqxvojIov0DKmVHBpn2GRKf7ppVRGXmmE0h
	CwGWkuaGssBeGgbEeX9ZQdOghC9QJjGSXkOj11+XuVqBuy/XtZlD4c/Eduqq3D19JdRG
	SgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=aj2FT8+yYY0ljSeljnmjwd32HeDq9aa9je/PjBFFYkg=;
	b=YzlFuEKli77SqeBfRK4+Gd/u1rpxskHVszXsVF18NusDBoc4kSkpGPSCAau7y9YbcQ
	TZ85UQ6UNv7AdvjTOvW1Jf6Fe9unEUrTtot2184pEJBoX3PBDBocX5ITcsTTZTjJZUVz
	8DCZU5zT593jpZ8g86npHR24XGTQU2QMRVphzAx9yXF5q+4x3IRgrbAi1LtuI+X4pKSs
	qOGlJVtNjk1GqPifsKidmwdfsiH5RjN1GM4ykOQju1y9bwf1T/4vzh5nqrfE4QIP0s6T
	WRhFIq1l4NQy2cDARrcLPGsT1mkv2sK6a4bKTzl+LrhW/w2cnPua7TuIvXVKMHUQiDzv
	d7Pw==
X-Gm-Message-State: AG10YOT5V2+or2QF+uewyvMxDNV0AlisTssh7QvJgzUtEYwHeXvaftDUY225Hv7NSXvf2ddINL7hvupwmGsBy4JD
X-Received: by 10.50.126.8 with SMTP id mu8mr10633325igb.52.1453129827126;
	Mon, 18 Jan 2016 07:10:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 18 Jan 2016 07:10:07 -0800 (PST)
In-Reply-To: <1453109582-25485-12-git-send-email-b54851@freescale.com>
References: <1453109582-25485-1-git-send-email-b54851@freescale.com>
	<1453109582-25485-12-git-send-email-b54851@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jan 2016 15:10:07 +0000
Message-ID: <CAJTo0LYdsdZdmAEMk9meSrTMcFhuXOzk9=5xK8tXq-x37XvK-w@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH 11/13] gstreamer1.0-plugins-bad: Add video stitching support based on Open CV
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
X-List-Received-Date: Mon, 18 Jan 2016 15:10:26 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf28ad2705299d2796

--047d7b1635bf28ad2705299d2796
Content-Type: text/plain; charset=UTF-8

On 18 January 2016 at 09:33, Yuqing Zhu <b54851@freescale.com> wrote:

> +Add video stitching element based on Open CV.
>

I'm not entirely convinced that we should be carrying patches to add
entirely new elements to GStreamer.  Why can't this be in your layer until
it's merged upstream?

Ross

--047d7b1635bf28ad2705299d2796
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 January 2016 at 09:33, Yuqing Zhu <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:b54851@freescale.com" target=3D"_blank">b54851@freescale.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2va" class=3D"a3=
s" style=3D"overflow:hidden">+Add video stitching element based on Open CV.=
<br></div></blockquote></div><br>I&#39;m not entirely convinced that we sho=
uld be carrying patches to add entirely new elements to GStreamer.=C2=A0 Wh=
y can&#39;t this be in your layer until it&#39;s merged upstream?</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--047d7b1635bf28ad2705299d2796--
