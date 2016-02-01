Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5E4F2771AC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 20:54:45 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id 5so21145409igt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 12:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=RFlscvXFrEQivApQVhuM3BMKONfweo5FUayzoqYVlOE=;
	b=Q4Boqg/DIwdf+6YZ8Dv5NrvH1G79Gy126OLJp33XSFBDGMDyUNVe7TZ21dZH2KCfpX
	jSH1x0K6U6BVHa1gw0sFSAuUej7S1y6sV5zPoMr1Cyhuoo74B3CylI7VArUn07qNl1bs
	K9dGINIkYK6aFA3iHTNy3CXKtNsDQyAQa4ZHb5Rh+dDFfYNhVVOE7Pli/UJwmFRY3nzC
	D7uNAKiroR39Ts8XwtVYO38nZsPia0mxAV0CxcqsS3R1rsXN40R/cxIA5k0s9kBWKwZC
	PEyMZYyfbIrE0A2BZn8q6AjEgiMo+ep8y6AINC1grzoUaCzblC4LrjOZEyAZaF+n6N+i
	oOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RFlscvXFrEQivApQVhuM3BMKONfweo5FUayzoqYVlOE=;
	b=TNXsebcpOY291zeG9TeapzGwkA+2ntNwLlJoApU4GAMjue9T7g/5O49aUifRsuGEwo
	vV4gzqENPL8VEvgLIqU1CMehDddTtzaOsZr7JXUNkAa9/0TDyeeodR4LRFZMSxL56HVc
	tL8VSZQX29lKeQZQGiG225KzkbJZ8KPhh5li+uTqxYC7blmtfhhvyqmqlhrlTINmWibo
	mqYjs0ywf1FxB/si6T5xkhnUzDqnVaP1Qt/zwbg3oL+IoC58knNV0EnAakNsGtYQS7cl
	k2b/JVKo+dKKPXrodhK3//ZiB1uvk6F8P+87z8AK3m+1mpfnUB/lSttGtRX9VNMc/vqI
	bq5Q==
X-Gm-Message-State: AG10YOSUQf48dj9m2bcDhys0AV7RaibU+oqn2CNY09bBSKLEElN0bjYQE1IonDPeXnPB6x+VvY8ll7d5J4EekIv5
X-Received: by 10.50.27.37 with SMTP id q5mr9675206igg.64.1454360086670; Mon,
	01 Feb 2016 12:54:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 1 Feb 2016 12:54:27 -0800 (PST)
In-Reply-To: <CAJ86T=WmEHWzm4FTYCtv3d_FK80G02ikx70T5Od4jovjg12=UQ@mail.gmail.com>
References: <56A22767.7050000@linux.intel.com>
	<56A24CE8.8010501@opendreambox.org>
	<CAJTo0LaAY=Bru-JzaNMQe5KNuAH3+A0VW_mQ6sNy4GvDU7nk6w@mail.gmail.com>
	<56A26F89.8080505@opendreambox.org>
	<61461.10.252.10.201.1453489831.squirrel@linux.intel.com>
	<855A5CD7-3AD7-45F7-972F-E25D5F23EEA0@gmail.com>
	<CAJTo0Lb=CFOCeSkS9DUv-RhYeYHHXFa=CDe5uP2t46pUHH-K6Q@mail.gmail.com>
	<CAJ86T=WmEHWzm4FTYCtv3d_FK80G02ikx70T5Od4jovjg12=UQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Feb 2016 20:54:27 +0000
Message-ID: <CAJTo0LYphBVE=N6sZeakgMTa+Z0B8fXd9rNt=KkJbpdcNKzGTA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: proposal: remove DirectFB from oe-core in the next release cycle
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
X-List-Received-Date: Mon, 01 Feb 2016 20:54:46 -0000
Content-Type: multipart/alternative; boundary=047d7b10c837578cfa052abb98d2

--047d7b10c837578cfa052abb98d2
Content-Type: text/plain; charset=UTF-8

On 1 February 2016 at 19:13, Andre McCurdy <armccurdy@gmail.com> wrote:

> Note that building DirectFB directly from git sources adds an extra
> dependency on the 'flux' tool, for which there's no recipe in oe-core
> right now.
>

Urgh.  I was hoping that if/when the "maintainer" pushes the git repos and
tags, that he could also upload the tarballs.

For now, I've sent a patch to change the directfb recipes to download
directly from the source mirror, so that 1) even without our source mirror
it downloads fine and 2) the automated checkuri can be two recipes closer
to parsing.

Ross

--047d7b10c837578cfa052abb98d2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 February 2016 at 19:13, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D=
"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":8x" class=3D"a3=
s" style=3D"overflow:hidden">Note that building DirectFB directly from git =
sources adds an extra<br>
dependency on the &#39;flux&#39; tool, for which there&#39;s no recipe in o=
e-core<br>
right now.<br></div></blockquote></div><br>Urgh.=C2=A0 I was hoping that if=
/when the &quot;maintainer&quot; pushes the git repos and tags, that he cou=
ld also upload the tarballs.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">For now, I&#39;ve sent a patch to change the directf=
b recipes to download directly from the source mirror, so that 1) even with=
out our source mirror it downloads fine and 2) the automated checkuri can b=
e two recipes closer to parsing.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--047d7b10c837578cfa052abb98d2--
