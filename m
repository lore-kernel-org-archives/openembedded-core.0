Return-Path: <ross.burton@intel.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id 85EFF71DC9
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 23:43:32 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id v200so55736398ywc.3
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 15:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SwIaHYJvgQFZlBNgxoKaZibZubBfLWdJ3hsQcLPXV4g=;
	b=1k/66NkMARNSJHNgMElZ3r2RQcu8zjX8BJsa+XWyy/aucgEugNZbCWbcqBsM8f6FbX
	MJ/Wo038u0Kc5fS0u3MC7Sqs/acO+lQfx0zOKvHMQN1cAjFymGSppIP8OLG0yMCv2JZK
	LyR5rIvlPHiPag750fe9dTqTVGrDxZAzaVCK71ur4TcHltObdpjEqud8RGqPrLf33d25
	Gt+TPJQGXa+FODoVdpP8l5YlIwsFa0dPmxnpec7SDGSqz0i069hIpmrQIXxvaygnk2d9
	1J0Y42hmeaCarUUIflXp4gy3hGA6gP2DoSLV49Kd6OMka8doFsDHpHKBs0oLiSZlxVgI
	EGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SwIaHYJvgQFZlBNgxoKaZibZubBfLWdJ3hsQcLPXV4g=;
	b=mRJr+XTycwsQuiKkX/vJK9ghk+Elw45hzJIv2eLveK0hQZKxyk+/NQWuA9+Xavgjk/
	3fa14KodXJMaEoJvLtzW75rX+MU8XDNI5gp20ikhVTZ130h95JzI9g2JL1uoEvQeS/KG
	e4KDh7O4wIxdWaGW4sWBK0oXzDSyZK5UrvU/8t1DpQiHTTTqXGAyZOPvBKMbU1t971jb
	bznylev3Qa+WgmaJ7PCP+cGlbLQbP8gHMz2VFKnvsoFuXzhc2tvcb0Q7LP2CH9UhQgyN
	SI0kmQh3pQFODY1KQJI4PADd5kAgvrX5Bss20hhhSnsMU7+OLh9DcniX0NXF5FiEPa6U
	ZdZw==
X-Gm-Message-State: AIkVDXIEH2loFimmL3K2PA1EQrxHKD/d0QtdeH5pq9Y9ZB4MEbovm7hQD8rxrw2ouKOaXNV1jO5IcQs7e9WgY6JK
X-Received: by 10.237.39.148 with SMTP id a20mr10230557qtd.65.1484869413310;
	Thu, 19 Jan 2017 15:43:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 19 Jan 2017 15:43:12 -0800 (PST)
In-Reply-To: <f97e0ddf-dd9d-06d3-831c-fa47349a1e66@windriver.com>
References: <20170119211441.126457-1-jason.wessel@windriver.com>
	<20170119211441.126457-2-jason.wessel@windriver.com>
	<f97e0ddf-dd9d-06d3-831c-fa47349a1e66@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Jan 2017 23:43:12 +0000
Message-ID: <CAJTo0Lb61vPhtOQ4V5k5cdPKZfWdSyotzn_6+BXN+P0J8FCiRg@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] Revert "kernel: Modify kernel modules installation path."
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
X-List-Received-Date: Thu, 19 Jan 2017 23:43:33 -0000
Content-Type: multipart/alternative; boundary=f403045ee6d8eb259c05467b19c2

--f403045ee6d8eb259c05467b19c2
Content-Type: text/plain; charset=UTF-8

On 19 January 2017 at 21:24, Jason Wessel <jason.wessel@windriver.com>
wrote:

> It may be fixable by using, ${nonarch_base_libdir}, but it wasn't quite
> that simple because it didn't fully work for the firmware loader so for now
> it would be best to just revert the two patches and keep oe-core working.
>

I saw the first commit message, slapped my forehead and thought
nonarch_base_libdir.  What was the problem this approach had?

We obviously need to do more real hardware testing of multilib...

Ross

--f403045ee6d8eb259c05467b19c2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 January 2017 at 21:24, Jason Wessel <span dir=3D"ltr">&lt;<a href=3D"=
mailto:jason.wessel@windriver.com" target=3D"_blank">jason.wessel@windriver=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3c=
" class=3D"a3s aXjCH m159b89dbb0b5bc19">It may be fixable by using, ${nonar=
ch_base_libdir}, but it wasn&#39;t quite that simple because it didn&#39;t =
fully work for the firmware loader so for now it would be best to just reve=
rt the two patches and keep oe-core working.<br></div></blockquote></div><b=
r>I saw the first commit message, slapped my forehead and thought nonarch_b=
ase_libdir.=C2=A0 What was the problem this approach had?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">We obviously need to =
do more real hardware testing of multilib...</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--f403045ee6d8eb259c05467b19c2--
