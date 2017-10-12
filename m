Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6FB6577E9C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 12:11:03 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id n195so15836906itg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 05:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ol4tV7u077zRrU0iP/+/B6Dvt+aQ+r3ddYfd6Phknwc=;
	b=P5OwyN44Ab2XPrZzXNacmp8zSsrCRmEvWzf9wpmyuxnh8iMUKLg+WpFPnFbmMf5l6B
	3zJ7F78bUR03gnlEz+lhhYrehZNZitcGGbyc33SxiQeHsQcpa9Lqjxb8hh8KuFsq1jD5
	sONgB+d/S2hKeMxzt/PSkvGWzqDEWC4t8OmmT5bVgSxDdVsxiWcEuFI2d6ZuTA9D9Kph
	VYo38XYrQkIZ3H9pJzVwhyAUJNnXtjo/1IMJpDBYFM/xNRiIjMWZbh1c72F7u6gpK3uY
	rrdKMgwepFCr0Bwt0ccdKhdRRovvUcipEX4JNQX1MVdzANuJ6f2z+egA9ntWJYWEwPrk
	3ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ol4tV7u077zRrU0iP/+/B6Dvt+aQ+r3ddYfd6Phknwc=;
	b=iwUtYzRqyCy5kFjR5cIvnNScJxg2MFCJw6w64+js+PxmfXu57HP7Yxaql3zgRnhEll
	qa6TMVB70fy0XftGpmyULEOXhbvtaSQrpbk99hN0lxF9+2Bqk+5l6AnTJBTOJNkxW4GW
	HiwXtekBH9mv5u8nPPufv2B/gI1MQ8ZvBY50gl/OFxt1nf+OMxjDM9RLGbbVMJ5RuISV
	QVRpcfTXs9MD97/lXtpt8deiGqTvxYLTsZndquCYARBNME06aKoe48y9xfS4yHH50VSB
	IS1L9uIfCSzrNsNOZTbXXtdNLyQSoj+/gI7jrIjeEgN7uzAM3n1ClaJ8pCaeQxq9c/2G
	4fOA==
X-Gm-Message-State: AMCzsaWNFFIniG4P5VMPqB/91n0h5+TrW4cQqROzO65xCM54mxdkGxIA
	LDD1XkjeuXdTpzyFKyROs6Dr9MO1XutlLx2+iHu58g==
X-Google-Smtp-Source: AOwi7QDeNm6V+ejotZmbrVfQN5D2OcpNBDE6vKkXpVDWaVH9GBnSTlrfJB+kgAHSVt8ss+tQGpdWTz+2Zd7yC3i0U+g=
X-Received: by 10.36.197.129 with SMTP id f123mr3196608itg.27.1507810264521;
	Thu, 12 Oct 2017 05:11:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.205 with HTTP; Thu, 12 Oct 2017 05:10:43 -0700 (PDT)
In-Reply-To: <CAPyrkgwDWH4Rk2T3V31Jyt0RjU4wCEd5sfPnm8Qevn3PWkbk6w@mail.gmail.com>
References: <CAPyrkgxRNsTbD=o7op_xi7T+f85rT3-4XF9d0bvkqVpvphiKaQ@mail.gmail.com>
	<CAJTo0LY8Z+qqGHXuBNAD1_4eS-fXjhL3VcofkbeHfp6aaBGhaQ@mail.gmail.com>
	<CAPyrkgxRjHRF9ALg9QwdUPdXAsetFNb9iUCQZNw+GtJsz+hM5g@mail.gmail.com>
	<CAPyrkgxV9aQvx3frYAJFKuK3jBY7Cv+V8=zFjvvLM-jbK5PH8g@mail.gmail.com>
	<CAMKF1sqQF01x8WOWQRt=jnfBCAsP8_5OSLZnJtPo9QWBu9RGCA@mail.gmail.com>
	<CAPyrkgwgE2SKjh8ODxVRku2E3VmHKJLF8sBUL7Mzd4gAWnJ0jg@mail.gmail.com>
	<CAMKF1somGhHGW_0i=2eBB9xkB+6Fkcv5PUK8Yp2evtvWzHbB6Q@mail.gmail.com>
	<CAPyrkgwhNAh+q1cPayXa=DV7x3K_T8T2YL4h=kfOiiz4CimJdQ@mail.gmail.com>
	<CAJ86T=UCwz44_twkQR-y=MR8TQVeTo2+RdXzOWc5Eyvv8dV5jg@mail.gmail.com>
	<0c97da3b-489d-eba0-8106-7b00d142746b@windriver.com>
	<CAPyrkgwDWH4Rk2T3V31Jyt0RjU4wCEd5sfPnm8Qevn3PWkbk6w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Oct 2017 13:10:43 +0100
Message-ID: <CAJTo0LZfw2bWmOuS9i-AoHG7EepuCiOyEboobXtm1LMLgpmfpQ@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Illegal instruction when running go binaries in qemux86
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
X-List-Received-Date: Thu, 12 Oct 2017 12:11:03 -0000
Content-Type: multipart/alternative; boundary="94eb2c07aab034bb46055b586f14"

--94eb2c07aab034bb46055b586f14
Content-Type: text/plain; charset="UTF-8"

On 12 October 2017 at 13:07, Paul Barker <pbarker@toganlabs.com> wrote:

> Is it too late in the cycle for rocko to start adding "sse2" to
> TUNE_FEATURES for relevant machine configurations and include files?
> If it's still ok to make this change for rocko then this might be the
> best path forward.
>

As per the weekly status mail from Stephen, we've been frozen for weeks and
on Monday the 2.4RC2 build was done.  Unless QA finds something serious to
fix, I suspect that will be the 2.4 release.

Ross

--94eb2c07aab034bb46055b586f14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 12 October 2017 at 13:07, Paul Barker <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:pbarker@toganlabs.com" target=3D"_blank">pbarker@tog=
anlabs.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Is it too late in the cycle=
 for rocko to start adding &quot;sse2&quot; to<br>
TUNE_FEATURES for relevant machine configurations and include files?<br>
If it&#39;s still ok to make this change for rocko then this might be the<b=
r>
best path forward.<br></blockquote><div><br></div><div>As per the weekly st=
atus mail from Stephen, we&#39;ve been frozen for weeks and on Monday the 2=
.4RC2 build was done.=C2=A0 Unless QA finds something serious to fix, I sus=
pect that will be the 2.4 release.</div><div><br></div><div>Ross=C2=A0</div=
></div></div></div>

--94eb2c07aab034bb46055b586f14--
