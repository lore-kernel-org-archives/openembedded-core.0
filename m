Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0933560069
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 11:59:41 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id v23so200823177qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 03:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oDQrOET7Su3GU5wiICY3Ivymt2xJAzCroQEMpjPGaN0=;
	b=qLEcQMBlL25r5sPS0DAou6t7eI0ItQrLbh7es68chqIMt9rFzGROtUcOdn/OXGhwfC
	pBbdXMoZ166wWuiG8v7etMr5Kprpr8MbKa1Jtw4FraJC9+5z0yKeYKsCgMArhJiJBQGz
	zsPzQ0xIcW4qHGomWoWnQAMJOiVMftf+iRQvhd9wrECsWRMerlpSeSNmc8IXfIUBG/HO
	HttwS9UYezilC0/QuG/nIs55TXBhkAj98YPS/AlC8Pz6M9hb4ah/yHLC3tFs5xBbnU4I
	o1Oalj1x+X7aVRQ6BbcWQCklFlcb/HWhCqGZpUfRsrDCTVnr9RjWUZUy7h13jg2UGRLR
	aBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oDQrOET7Su3GU5wiICY3Ivymt2xJAzCroQEMpjPGaN0=;
	b=i/j2/8BOngG9VuY18PHcU/c2cEGAR8Nw2TG+UZJo69esAvhd+n5bwRRp6VmO8LXa5k
	YHG0j4diMjxDYkGh/fk3zC1A4R2oP+UTidM41kT3/YjZMfmbC5QrapNHPnGnUFPlFXMT
	UwX+ctrzAsBYYvkwsPMlOFsv2B5n40zXfhpXO8lyYBNokR21vp8Q0VAvu0vvdfzBRCRo
	nSrPZccKqvP4BAcpvn/bwz9KPCkEjLbKk7ywdwXumZGNVYBxHSKmqpuDSAssPwUtm33U
	sGGjytk5fhcBhWQZvgmwLw5hpAKLfPW6N0fnYzhgxX0zCCbtVtp0/uxhhOrCZ+aRitCs
	BLhA==
X-Gm-Message-State: AIkVDXL+m/Ip7n2bg/XR5AxapS1/YfOqVsHfvA3t116bWi/tSgS6vDIUbbEjBuhR+IUQuKsF+ewGj0q1oK7OruE9
X-Received: by 10.200.45.247 with SMTP id q52mr21180847qta.197.1485777582148; 
	Mon, 30 Jan 2017 03:59:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 30 Jan 2017 03:59:21 -0800 (PST)
In-Reply-To: <1485777358-32699-1-git-send-email-maxin.john@intel.com>
References: <1485777358-32699-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 30 Jan 2017 11:59:21 +0000
Message-ID: <CAJTo0LYc-pMThs+DwPqGFnLZdJcdTzj_do=+gBav+x_aOsrHEw@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libtasn1: Upgrade 4.9 -> 4.10
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
X-List-Received-Date: Mon, 30 Jan 2017 11:59:43 -0000
Content-Type: multipart/alternative; boundary=001a1139cdf0ffeb8505474e8cae

--001a1139cdf0ffeb8505474e8cae
Content-Type: text/plain; charset=UTF-8

On 30 January 2017 at 11:55, Maxin B. John <maxin.john@intel.com> wrote:

> +From b17dbb8d3c5605db3a1d82861fcaeef4636d1117 Mon Sep 17 00:00:00 2001
> +From: "Maxin B. John" <maxin.john@intel.com>
> +Date: Thu, 26 Jan 2017 18:54:48 +0200
> +Subject: [PATCH] stdint.m4: reintroduce GNULIB_OVERRIDES_WINT_T check
> +
> +Partially revert the gnulib commit: 5a400b3f5a1f5483dbfd75d38bdb70
> 80218a063b
> +to fix the build error with musl library.
> +
> +Upstream-Status: Inappropriate
>

This appears to be a genuine problem with gnulib and musl, have you spoken
to upstream about this?

Ross

--001a1139cdf0ffeb8505474e8cae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 January 2017 at 11:55, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D=
"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1dn" class=3D=
"a3s aXjCH m159ef3b34e9aacfb">+From b17dbb8d3c5605db3a1d82861fcaee<wbr>f463=
6d1117 Mon Sep 17 00:00:00 2001<br>
+From: &quot;Maxin B. John&quot; &lt;<a href=3D"mailto:maxin.john@intel.com=
">maxin.john@intel.com</a>&gt;<br>
+Date: Thu, 26 Jan 2017 18:54:48 +0200<br>
+Subject: [PATCH] stdint.m4: reintroduce GNULIB_OVERRIDES_WINT_T check<br>
+<br>
+Partially revert the gnulib commit: 5a400b3f5a1f5483dbfd75d38bdb70<wbr>802=
18a063b<br>
+to fix the build error with musl library.<br>
+<br>
+Upstream-Status: Inappropriate<br></div></blockquote></div><br></div><div =
class=3D"gmail_extra">This appears to be a genuine problem with gnulib and =
musl, have you spoken to upstream about this?</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1139cdf0ffeb8505474e8cae--
