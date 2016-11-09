Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id EB3F471989
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 12:15:47 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id n204so242738937qke.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2016 04:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pNvwDfKrGnQk9P1GHGHtdsp7divCeMvzSvLlcLG+2os=;
	b=zcBaAezCdAfriNHP5Om1o5ze20wPwIriKZnNwZdwKQL+883CO3P+babS3ohM4xMOGK
	O4aDS+IEWlBdIJw9rH6DNKva0L0LO8GHHa+NL8pwF3/bm+Xj8+7hZWTTOX4sH2cGUtj8
	Azw+SGn+89p8OqrJXKirvDp2+wotEoLbq0Xi0tIpOOJYETDjDNxinT9RUt4Hxo7+PKjm
	C5QmvwbYFHYvISNBJXQuBgSN92mV5vDjxzrNEQRuPnfUL7/cch0wXkvr5q3DVUXAwVgi
	J70jmfd5dZeMbVqoS5dEIwxl4exkqQXAM/F3Z7XcJqO7NnliaZxOrARZZWJQvmZehbwc
	my6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pNvwDfKrGnQk9P1GHGHtdsp7divCeMvzSvLlcLG+2os=;
	b=Ven+8CFCat0xga5Y4t5GlJQh+cnkxtwltLqw2ghk2v4U/dCHEz2tvK9hV5EMtaljB7
	v2e93lZ9qAC8HFP+DAovuTTY6+J1Xl8KxcGxMms+QMfJp8zm1F2ZZBHWmRktLcVN1rMX
	q5yaVx6ATyOlFIIdEGpElvT547FrECvckr35PfhhCx0T5ZHzJOfmZpkgVBaHzpgBnLhS
	jkgLaIEZbcNWIp8FLroQ3BZX+Z3GRfbWB9KAyPR7PLg/QSind7xDYyv4Ji1dO2hr8Zdo
	at4RwFmz6SQaJG/43gfXnkb6gQQYHjlUWaqW+SoMHP+Yeh+O+5hNkUOHC2jfikJVpdDj
	EYiQ==
X-Gm-Message-State: ABUngveF2D4Ozvuk1hSTO/IAzsYC/h7cqAHE8csdmV9nxQZN/+MjPte80QowGmfOEgdKdng9nU5HIv5NHxjNA/G7
X-Received: by 10.55.75.17 with SMTP id y17mr18214088qka.26.1478693749363;
	Wed, 09 Nov 2016 04:15:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Wed, 9 Nov 2016 04:15:29 -0800 (PST)
In-Reply-To: <20161108135457.13249-1-fathi.boudra@linaro.org>
References: <20161108135457.13249-1-fathi.boudra@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Nov 2016 12:15:29 +0000
Message-ID: <CAJTo0LZhZi+hgbUvd87E413nEOKP3g5uGY2eqZB5yX2ydHZKGA@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: upgrade from 1.11.1 to 1.12.0
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
X-List-Received-Date: Wed, 09 Nov 2016 12:15:49 -0000
Content-Type: multipart/alternative; boundary=001a114a88c8a9cbeb0540dd37ab

--001a114a88c8a9cbeb0540dd37ab
Content-Type: text/plain; charset=UTF-8

On 8 November 2016 at 13:54, Fathi Boudra <fathi.boudra@linaro.org> wrote:

>  FILES_${PN}-xwayland = "${libdir}/${BPN}/xwayland.so"
>

Because you didn't fix this patch the weston-xwayland package is never
built, buildhistory is huge and core-image-weston with X11 enabled doesn't
build.

Ross

--001a114a88c8a9cbeb0540dd37ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 November 2016 at 13:54, Fathi Boudra <span dir=3D"ltr">&lt;<a href=3D"=
mailto:fathi.boudra@linaro.org" target=3D"_blank">fathi.boudra@linaro.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2qb" cla=
ss=3D"a3s aXjCH m1584438eba688b94">=C2=A0FILES_${PN}-xwayland =3D &quot;${l=
ibdir}/${BPN}/xwayland.so&quot;<br></div></blockquote><div><br></div><div>B=
ecause you didn&#39;t fix this patch the weston-xwayland package is never b=
uilt, buildhistory is huge and core-image-weston with X11 enabled doesn&#39=
;t build.</div><div><br></div><div>Ross</div></div></div></div>

--001a114a88c8a9cbeb0540dd37ab--
