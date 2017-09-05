Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 502AF71BEE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 10:01:37 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id q64so13523945iod.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 03:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=A5FQKe3IZ03EmvXszr41qR53HzDcjFpN8I2gmUJ5G+I=;
	b=P9a/tqakgLBImQHdcWSvVSYLIBkWBiVkOJwMpfxDUCY/xxRdgE2OGJ+VEBVNPNEaX0
	VxDbYB35B9rayUdQoL6As3fqxZboHoWyvAkV+e5D9yeYwAQ5237c5RWOipEI/mYraQ1n
	SpcJepP9b1e62WwAcadk1pgh/OiB/Er1TETb7E9pS78nVFh2Kr4iSwsWuYHZyz0aY2ND
	MIN6CN0tNnXbdM7p2UzOSKLAaaL158DlikSeFNb6Ketd2oCUs718nLJJSOcAKyIlc3ca
	jjZkOkJENF7V+BwAigxgS12euTRIfQv9G2SU6t4aTyuHdsicUMRR2L7LcUuo1SZG1B6R
	RMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=A5FQKe3IZ03EmvXszr41qR53HzDcjFpN8I2gmUJ5G+I=;
	b=TVOV8pHvZ8sN1Bvhh5snRSCgRMefh0Rez6mIrfoRR0TFg5EzsOlo4zIdPtlEI6+Kq7
	CmJObNR6SnVGMF8CxD0XH9uiwzKg43JKhcwua+odf1p6aHlJVL64j2Sq7NTzfTd0Hv4n
	Tshrs00Rp4XacgJlW6Niq+MciDgsPmwIGSjcysR5tuxzFg4XUE/l3khKJzVwPwtLk5f+
	gqgA6faMuE4AbtERh8qWvaaPWiBtExCCrYNIz7ZoZfc0G8r2wJg/VY73YAc884wrMRoS
	m/o+mg3xrH1jXslv9cRwB28XQvnEnX8spPSsEptSkzqcX27MNr44/m5YJAjX779WleDl
	LVQA==
X-Gm-Message-State: AHPjjUi2i1ovwBG6IRNwwVa7Bt1ZbAUfS+16JR74AnOFQ3pWyjet8aCy
	BG2P8eQI9+OI2ScFiEJxncYJ1wf9MciY
X-Google-Smtp-Source: ADKCNb6Vb4uxWIrl2sUVUpPMiA7HyVbaUV9wBWzAexfRJtXlxRTtUdOJ+Jz+PhBMipbQ0r9sPZ/CrKZPaWCZDzA8rfY=
X-Received: by 10.36.108.137 with SMTP id w131mr3378947itb.42.1504605699315;
	Tue, 05 Sep 2017 03:01:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Tue, 5 Sep 2017 03:01:18 -0700 (PDT)
In-Reply-To: <04226f9cba6136805e2bbe98f1c8a91aa55acf08.1504580538.git.kai.kang@windriver.com>
References: <cover.1504580538.git.kai.kang@windriver.com>
	<04226f9cba6136805e2bbe98f1c8a91aa55acf08.1504580538.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Sep 2017 11:01:18 +0100
Message-ID: <CAJTo0LZusqVPy54BozHYPw45Wng4fFn4UORVRFqMCSH9rDfS7g@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] dbus: fix ptest runtime failures
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
X-List-Received-Date: Tue, 05 Sep 2017 10:01:38 -0000
Content-Type: multipart/alternative; boundary="001a113f651e3c27ac05586e503a"

--001a113f651e3c27ac05586e503a
Content-Type: text/plain; charset="UTF-8"

On 5 September 2017 at 04:13, <kai.kang@windriver.com> wrote:

> +PACKAGECONFIG[ptest] = "--enable-embedded-tests --enable-asserts
> --enable-verbose-mode,--disable-embedded-tests --disable-asserts
> --disable-verbose-mode"
>

Same question with V2: does enabling ptest change the dbus daemon in ways
that make it slower/less secure/etc.

Ross

--001a113f651e3c27ac05586e503a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 5 September 2017 at 04:13,  <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.c=
om</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">+PACKAGECONFIG[ptest] =3D &quot;--ena=
ble-embedded-tests --enable-asserts --enable-verbose-mode,--<wbr>disable-em=
bedded-tests --disable-asserts --disable-verbose-mode&quot;<br></blockquote=
><div><br></div><div>Same question with V2: does enabling ptest change the =
dbus daemon in ways that make it slower/less secure/etc.</div><div><br></di=
v><div>Ross</div></div></div></div>

--001a113f651e3c27ac05586e503a--
