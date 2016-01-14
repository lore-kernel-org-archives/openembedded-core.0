Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id A4C64731B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:06:19 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id q21so451924452iod.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 05:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=O5BqZovU7GyTOneVrmFLCGrmKToF+SYvklzDY1C8t18=;
	b=uv4uzD6OH0CF6Q7ZG382zcWXgPejyaQ+8I53XB27a0OsLp1M43/RkxYLXY8nvU70rw
	ja8E+Z620JkrEfqqPXz+UI1E9+AOHf5JjYpnsa1Fka+XGmUAM8Giy+5bKGGojuMcSPGx
	9CT2JWmUy723XGpue07xjZoXKr6R3qUYodeJXekv4zdOchgLbhbqITVfE9v23mk3vMd7
	7wHtJwqab0xKyUFd4GKMCQWAfZyilupXn6JDnrnZN0YEbvUrvdF2M3RYsDULFaJ7Qjm/
	07Ylv1nqxo90McSQjnLTJA3+WXmPQ76mz+A+q97y0iQnclSc4ienHpv4rcrSSkLvZqgl
	IP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=O5BqZovU7GyTOneVrmFLCGrmKToF+SYvklzDY1C8t18=;
	b=Z1HH1F4qDwAEtnePBPVTwbDBNo6GALQuYkv0UGWNVayuaDb+BK7o1Q32+BBSR2ACHA
	NMdTDarhMiZpOKGPEY80HcF+di4TaaVo+buC2aeF1AThaJYVLaO5fhrtTWLj7CvLBX5T
	7qazZhRj15dI+3U2/ck6Z+i3QQY77CLSPgNvVXeftOGvA4YNJUXN+z1e1D6M/aVdWJ6k
	tk6/Mpw0KtwiFWVvx8P64ic1WaHMBwuvJdTARDwW6qFjHuJIlBmBI7SrDbhUzukS7IoN
	yCQi3vkB2SIfXvB1oCTdLgFw1/GMoBI6pWOi+YkWMF8bGqPpALKcW3IYj+9ZV/9CNyMg
	GBKQ==
X-Gm-Message-State: ALoCoQm1c/rbBoQHPlSGUScFflRmNj5qy9Va5X6Bkeg6fQ0zdxy2ud9MsTd/Uez18GYYDfV3Re++70B6pP0ZzH+8ptPfQa2N76Udl/RC+21PB17J9n6v+Wk=
X-Received: by 10.107.3.154 with SMTP id e26mr4251469ioi.99.1452776780143;
	Thu, 14 Jan 2016 05:06:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 14 Jan 2016 05:06:00 -0800 (PST)
In-Reply-To: <5697986A.7010603@linux.intel.com>
References: <1452754378-2096-1-git-send-email-tanuk@iki.fi>
	<5697824A.8040503@linux.intel.com> <1452774089.11077.100.camel@iki.fi>
	<5697986A.7010603@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Jan 2016 13:06:00 +0000
Message-ID: <CAJTo0LY2baHW6_8wNSSut14Jx2tg5K=L5OmYzybPS7GXF-v5tA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-lib: 1.0.29 -> 1.1.0
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
X-List-Received-Date: Thu, 14 Jan 2016 13:06:23 -0000
Content-Type: multipart/alternative; boundary=001a113ec10aeb321f05294af3b1

--001a113ec10aeb321f05294af3b1
Content-Type: text/plain; charset=UTF-8

On 14 January 2016 at 12:45, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> It's more convenient if you send them in a single batch, with a branch to
> pull from (using scripts/(create|send)-pull-request). Less manual
> cherry-picking in the email client for Ross.
>

FWIW I threw some effort into automating tooling last week and can now go
from patches in gmail to commits in my repo with just "ss" in gmail (tag
message with a specific star) and then running "applyotron -m".
 (github:rossburton/ross-tools if anyone else is curious).  For something
like alsa having all the updates happen at once is neater and easier, and
branches mean I can never accidentally pull the wrong patch from mail.

Ross

--001a113ec10aeb321f05294af3b1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 January 2016 at 12:45, Alexander Kanavin <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.=
kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div id=3D":2om" class=3D"a3s" style=3D"overflow:hidden">It&#39;s more=
 convenient if you send them in a single batch, with a branch to pull from =
(using scripts/(create|send)-pull-request). Less manual cherry-picking in t=
he email client for Ross.<br></div></blockquote></div><br>FWIW I threw some=
 effort into automating tooling last week and can now go from patches in gm=
ail to commits in my repo with just &quot;ss&quot; in gmail (tag message wi=
th a specific star) and then running &quot;applyotron -m&quot;. =C2=A0(gith=
ub:rossburton/ross-tools if anyone else is curious).=C2=A0 For something li=
ke alsa having all the updates happen at once is neater and easier, and bra=
nches mean I can never accidentally pull the wrong patch from mail.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a113ec10aeb321f05294af3b1--
