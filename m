Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id A4EEC601D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 20:39:20 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id mv3so20761135igc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 12:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+aXt7lRg6gybumvLsGRp3Mj95xdBNxGPW/ugrXA9qaI=;
	b=ejBvEs/CvEslVgYYlYOQCL08zIs3YKkBxIHnCQP0QpnsCrqAhbEiyDX1gPM+ALvy60
	ozFenJ/s17RrlNIMIBxJwG2hm8uDRXvgCWV/8LWsKiDbPcqaodflrQrS6keTJKclF77r
	Jvtkocn5PORLlIju9KXEQYGiFsYijFoiDjoi9+fJq9ClpFWe8UZO93Cl1X0uyTbrbrl8
	bCLe8yHFHnZvNf8Gq+UaPHEaIbg0jbWN6jfMcUnebpl+ytu0cmLWJKqvLflJ8JvEzf6C
	TpT2B2nZmEocDnVTYU5EsT2fmSpIi50oBAR/KP4QgwEy2BVGXazsfyh+J0AvLMBu1++p
	wg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+aXt7lRg6gybumvLsGRp3Mj95xdBNxGPW/ugrXA9qaI=;
	b=BRdjLfXVuPr6k4yAUxe3DlWuju1a+E0YKS+KDG5FHefQmKIelbITdRxaq+Zr+bb9HT
	sMVXHVkReNq1pb4QLzSkZgpWqcrvolORx+hLf7DYVPOxfFFQQt8V6QrDtoxau1ty9lJN
	18R8LB5I/rRAE7jItJ9QaVdDKHLV664R3sSZkzYT3oCruVBgS/tOuqKgN2qlIT5BUZeW
	omWZpFFcgfmbf0DA1V4RW1aeQ1sWtxTBx4a29bb0axRG9HpiZBMGZBthUCGc8z+B+n4B
	2cRkr4YGSCP7lI4K/m+CBTuAzCH6wHE5B5ft1FFsDLFZV8BgC8PyI5mSOTIzHcHxlLIO
	z3iw==
X-Gm-Message-State: ALoCoQkex1yT8AuRiSsJaS2iZNvm5dHXrYxETBTCD6tAfTD1ZFbMaR2bTM88w/UC1xgxuukNCI3DIXC57vctSTwjeloVwib4pVOU8MhjZbTT/j0F77z8FyQ=
X-Received: by 10.50.7.102 with SMTP id i6mr438716iga.64.1450384760828; Thu,
	17 Dec 2015 12:39:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 17 Dec 2015 12:39:01 -0800 (PST)
In-Reply-To: <CAJ86T=VFUeJ6=BXkOz++xG-n7L5Gjtip8RN9r_x+pjPsb=FE=Q@mail.gmail.com>
References: <1449623398-29127-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=VFUeJ6=BXkOz++xG-n7L5Gjtip8RN9r_x+pjPsb=FE=Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Dec 2015 20:39:01 +0000
Message-ID: <CAJTo0LbB83EZVqbbgqMfB5jmVsiAcT64Cby5EvnW0SP5v+GfzA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] feature-arm-thumb.inc cleanups
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
X-List-Received-Date: Thu, 17 Dec 2015 20:39:23 -0000
Content-Type: multipart/alternative; boundary=089e0111b170750dd205271e049c

--089e0111b170750dd205271e049c
Content-Type: text/plain; charset=UTF-8

On 17 December 2015 at 20:18, Andre McCurdy <armccurdy@gmail.com> wrote:

> Ping. Does anyone see any issues with these changes?
>

Manage to mix those up with your more recent ARM fixes, both merged to my
staging branch now.

Thanks,
Ross

--089e0111b170750dd205271e049c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 December 2015 at 20:18, Andre McCurdy <span dir=3D"ltr">&lt;<a href=
=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2xl" class=
=3D"a3s" style=3D"overflow:hidden">Ping. Does anyone see any issues with th=
ese changes?<div class=3D"yj6qo ajU"><div id=3D":2vq" class=3D"ajR" tabinde=
x=3D"0"></div></div></div></blockquote></div><br>Manage to mix those up wit=
h your more recent ARM fixes, both merged to my staging branch now.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Thanks,</div>=
<div class=3D"gmail_extra">Ross</div></div>

--089e0111b170750dd205271e049c--
