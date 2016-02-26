Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9640B77435
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 15:46:05 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id z8so38148600ige.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 07:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iDNaWmXwfOwFlD4haM3zK9rMJj6uO9cPwbfMwB4aUFo=;
	b=Gx/JuPqXvpbA4MezItgBEaj5Id7iMQVAmUR4vxDMIAD5DG62m2TuePCFM7kufeWIPz
	VFGRK4N6GOmDvB8oFOIqX8fDRAG4JYLRrz9ze/gtrks/TlHH+vs2aPos7SO9Wd6+nHO+
	As3BLGX6JUERvl5zWGvihF3xE5PRCelmDFqcrJAzffc8wAU01/88gLPpyNT2OA0TWtUb
	loaDHFBu2snUGDnqYuiSBFQvc/zf1MsCBKHlRYTNqCqmABFKijQpv9JOUt6JwGpDAKws
	auYTSf6EI0bObtJkXzB4yP3cTDruGN8jv+2llf/BBkYObzNicl8FQZIupHOMo05/8YJA
	WBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iDNaWmXwfOwFlD4haM3zK9rMJj6uO9cPwbfMwB4aUFo=;
	b=dE48EOBvfih0drK3y7jjoOQ85wyqjRaeKpTlwtpAUSFsLRgEJX4XRhCTl3wL1S89GW
	Z80NpZegSxCYXTF+K1FGGrcGWXTQgVOQlz9868zFWXTUYrBB6G3SyW9t6jECy0pWoq1O
	rfkRQVxTxf+SjUhFnP3rbn2iDnCoFB9rWDkO+w/S1Ugvs/GWbnvQda0+5N9dhgafB2N0
	wDkNP/ME1NhLqBaQ4kOierg2zga5yPDfRoprXHaAGB47U8iURHNlXOASWVRJf5Ys19W7
	+eo5c1Ih5wR23UKnPOq+TnsqxwFFvi/aWIOHM3ZtNoYnWYt78zjIbdVHTMyx2gixnma0
	4BaQ==
X-Gm-Message-State: AD7BkJIcgSrYCaZFsaZvHegRWH6c0q9vslFmZMhbCgYgT3/1i1HKJOOs1hqLF23+LhBy8SnUpYzPUAhoX2wKA/Gm
X-Received: by 10.50.66.238 with SMTP id i14mr3277492igt.52.1456501565777;
	Fri, 26 Feb 2016 07:46:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 26 Feb 2016 07:45:46 -0800 (PST)
In-Reply-To: <56D07311.1040600@linux.intel.com>
References: <cover.1456442768.git.alejandro.hernandez@linux.intel.com>
	<CAJ86T=WM=9YKka3w9qQtRDRnJFDXc+uSS213NFN2aNUEwTdF8A@mail.gmail.com>
	<56D071D5.5030507@linux.intel.com> <56D07311.1040600@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Feb 2016 15:45:46 +0000
Message-ID: <CAJTo0LZ3b0n1KRjbvJ7ECQxWerhJGV2MvA=NnZc=P5Rk9C=dOg@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Replaces udev with eudev for compatibility when using sysvinit on newer kernels
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
X-List-Received-Date: Fri, 26 Feb 2016 15:46:05 -0000
Content-Type: multipart/alternative; boundary=047d7bdc109c71b2e9052cae3227

--047d7bdc109c71b2e9052cae3227
Content-Type: text/plain; charset=UTF-8

On 26 February 2016 at 15:45, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> Sorry, now I understand what you meant, and I see the issue, since, we
> would need to create our own naming scheme at build time, instead of runtime
>

For safety would it be best to tell eudev to use traditional names?

Ross

--047d7bdc109c71b2e9052cae3227
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 February 2016 at 15:45, Alejandro Hernandez <span dir=3D"ltr">&lt;<a =
href=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">aleja=
ndro.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div id=3D":ew1" class=3D"a3s" style=3D"overflow:hidden">Sorr=
y, now I understand what you meant, and I see the issue, since, we would ne=
ed to create our own naming scheme at build time, instead of runtime</div><=
/blockquote><div><br></div><div>For safety would it be best to tell eudev t=
o use traditional names?</div><div><br></div><div>Ross=C2=A0</div></div></d=
iv></div>

--047d7bdc109c71b2e9052cae3227--
