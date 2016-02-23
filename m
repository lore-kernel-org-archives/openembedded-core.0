Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5001277309
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 09:25:20 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id z8so3707150ige.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 01:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KTC/i/UhZErLHUd4WJZ5Ad09tFuwRt1ZjajBzt564bU=;
	b=MXQOR/GR8/9n+6/EjF4DTx0l5XMN65OcMqSJRAT/OaNfBJa2bP9ByjINLQDXP0D4Eb
	YL8dF8mnWjBl+Z9/GjL/7cX8EwEjxU7eHtbfIhlGCUhqVyrfp2Jw1Z02hjcoGS9j+3NZ
	l9vFDjyOrGD7FPvhDJiH+wdWT1/xyZw4ItYdpeaC8iRxmX9syJjfWZi1Cb/51XCXQain
	o/GzwixKXvhhTbauYnC/r4RSTBy4uPfwJCwjFkXzYy1wa2nBjlrY7CiUdR3mx+/n9TaH
	tsYTaFwLMhOAweTVW/G4853yr0u+eVMAZc7dq4uAbVue2v/KpYt6zMdWjpyJtCUaSSP1
	2bhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KTC/i/UhZErLHUd4WJZ5Ad09tFuwRt1ZjajBzt564bU=;
	b=Is1WUKchFfPxqN0A/J+dqJiC4IRWWiH1KXfoRcP7Jltl6N5qQH2wxKWFpNAZKL5vpV
	wwYUekF2vyS5ImaO/wikK0R/qztDlW810bOI01jFWdiq7Io9pViItcR05GQBJ+qaH6g3
	hGlaB9eHPm9r2DCrvyAhvhRb8QFmco06+F6pxvQFNKN2X1nXpoXXWXy5/6/d8otUDUov
	+66+2fF5Ym/nhQwOsG4Ewkj7q13Lm0S+9CiGk11E7aeOMi2GBLTLItMV+Vs1V64DXplk
	G4NUhzbGfLSQNEsGSy3cmNmO3OUZ0nMfq8//fdtoNZVQ3Gg8m/QvHGIeiB1NweqZ2sS+
	W0kw==
X-Gm-Message-State: AG10YOQcBiHJf2uU1DP+AkFT1P3m3my/B1v4xzAv7l7RbeyxcidM+oZmyosZM8hIDHCLie3JmCBosZIbqq1wU9LT
X-Received: by 10.50.43.226 with SMTP id z2mr16671267igl.78.1456219520558;
	Tue, 23 Feb 2016 01:25:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 23 Feb 2016 01:25:01 -0800 (PST)
In-Reply-To: <1456218756-22996-1-git-send-email-maxin.john@intel.com>
References: <1456218756-22996-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Feb 2016 09:25:01 +0000
Message-ID: <CAJTo0LYRNsnVUr39sLGto5FCoS79b99FEY-H0mh5R8H-+gRzjQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: fix build with uclibc
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
X-List-Received-Date: Tue, 23 Feb 2016 09:25:21 -0000
Content-Type: multipart/alternative; boundary=047d7bfea0f43d1adb052c6c877d

--047d7bfea0f43d1adb052c6c877d
Content-Type: text/plain; charset=UTF-8

On 23 February 2016 at 09:12, Maxin B. John <maxin.john@intel.com> wrote:

> ++#ifndef _GNU_SOURCE
> ++#define _GNU_SOURCE
> ++#endif
>

#including config.h is probably a better fix, as that already defines
GNU_SOURCE.

Ross

--047d7bfea0f43d1adb052c6c877d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 February 2016 at 09:12, Maxin B. John <span dir=3D"ltr">&lt;<a href=
=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":vk" class=
=3D"a3s" style=3D"overflow:hidden">++#ifndef _GNU_SOURCE<br>
++#define _GNU_SOURCE<br>
++#endif</div></blockquote></div><br>#including config.h is probably a bett=
er fix, as that already defines GNU_SOURCE.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bfea0f43d1adb052c6c877d--
