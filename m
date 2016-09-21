Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 71C0560778
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 09:02:05 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id o3so121780945ita.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 02:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/AdISqmiz6Rni8wqZ3L8SCdALuMk5EcVXWTFT5XWRR0=;
	b=eiXIH+BjDr//SZl2jZADqfJYf+sx8HgqjnWsdqGNwnOZZ1KiWAgFXrEtl5CDAjBbgO
	E3azrKj9uEZBtbVbhRpWUr1kzitcJynxaA2RtW+PT5ySETNKzrhYEejBCeP6eOxLR3Y2
	QlzaY8IEKTm5vba2vGP+NNbA9G0+wVEnPYdsXaA26NUiM1+27FLyXd1QSTS/bIxO4T+F
	/KCNSvUiXgU9VzD4K6nYuXziZ3NZAyv2uDmFSZ6voOm41MBikDE/U3s1szw/E9zyhu1x
	a8yj8Y1L1Rvo4JDsRV+idYQCCAfHge+zsl1/f4NlcCdeRT/PWlSYp+2knZ4DnvkQg31/
	LFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/AdISqmiz6Rni8wqZ3L8SCdALuMk5EcVXWTFT5XWRR0=;
	b=PIE0rYUpGjuOPMrukOkVgGIqBQIiskgN4Q5jQLCfGIk91kFhcBI8pzaEggUtR102N+
	hPVttDCRnSlwp6ZLbBeLgicuKD2rBX8DhXx0TFZ2etymjfaZwgyCayg8fc0krdtfF4C9
	5LE8pEWACZbHT1sCAlA07SQ99MRp5lPkuXJkyLlcPmvMcZA3fiiZZ4nb8aasbaLlBco2
	8117ZpH13r7s9F+35elFQVI9XDmrDdXbbtaH1hVTsP8mvrZ2gztcnYkA1XR1v9GLjsj6
	8OHgYEjKQ9M0Wfl695G2HZ3TwLqstXXb9X4+XNucX9Iyk42ybGlmAMUTLwflxsYYoQCW
	UMJA==
X-Gm-Message-State: AE9vXwOInbqPFAZAoFXoVILO3ZjOHDnghl7rKKaauo/AYrte8Dx6I0pwnQhCqVERJIPS5t+wEok4WqlVqNzsrKPr
X-Received: by 10.36.189.194 with SMTP id x185mr1099938ite.74.1474448527264;
	Wed, 21 Sep 2016 02:02:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Wed, 21 Sep 2016 02:01:46 -0700 (PDT)
In-Reply-To: <e72d26a5-046a-6c89-009c-7cbaf8aaab3c@windriver.com>
References: <20160920091958.23448-1-Yuanjie.Huang@windriver.com>
	<CAMKF1sooPU-oSmeGuNQXjEUvgWfAXubQuKc6bk=L45WtRD4xjQ@mail.gmail.com>
	<e72d26a5-046a-6c89-009c-7cbaf8aaab3c@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Sep 2016 10:01:46 +0100
Message-ID: <CAJTo0LZv9h-BrVNypGiZEQqoGps09kioNwBfMtUncA8rUk7vvQ@mail.gmail.com>
To: Yuanjie Huang <yuanjie.huang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gcc-sanitizers: Fix libtool library files
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
X-List-Received-Date: Wed, 21 Sep 2016 09:02:08 -0000
Content-Type: multipart/alternative; boundary=94eb2c196dd2b56e1a053d00cc02

--94eb2c196dd2b56e1a053d00cc02
Content-Type: text/plain; charset=UTF-8

On 21 September 2016 at 02:46, Yuanjie Huang <yuanjie.huang@windriver.com>
wrote:

> We have some user making use of these libraries directly, otherwise, cross
> gcc can link these sanitizer libraries with just -fsantizer flag without
> problem. Without .la files, his flow can not be libtoolized.
>

libtool works fine without .la files on linux, which is why the
remove-libtool class works (which can be a distro-level inherit and deletes
every .la before it reaches the sysroot).

Ross

--94eb2c196dd2b56e1a053d00cc02
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 September 2016 at 02:46, Yuanjie Huang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:yuanjie.huang@windriver.com" target=3D"_blank">yuanjie.huang@win=
driver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":15q" class=3D"a3s aXjCH m1574a6cecf964841">We have some user making us=
e of these libraries directly, otherwise, cross gcc can link these sanitize=
r libraries with just -fsantizer flag without problem. Without .la files, h=
is flow can not be libtoolized.<br></div></blockquote></div><br>libtool wor=
ks fine without .la files on linux, which is why the remove-libtool class w=
orks (which can be a distro-level inherit and deletes every .la before it r=
eaches the sysroot).</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--94eb2c196dd2b56e1a053d00cc02--
