Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0245077AF6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 16:50:55 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id n21so7106066qta.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 09:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yJPZ0+Xuway95kqxDoZt5oeL/iWz9i/c9lzA+IKFccg=;
	b=l0CbTePmkoH1/y8le4R/d/bVxwM8yKk9iUX2HE+Fr7TMWvLz67xA35MXXpUFmKSdvF
	kRLEBJuzsqt9dN5U/C2WcASqa/cw65VOZYrCHEUkyvCaXKsPSp30oxHzlBZLBZnv2TSG
	u8kSsyr3fJslgImvVnM1UJdQrHGy205XR2EolmbZOsNGTxiMRO5PA9VKZXV0jcP4gtBh
	voyHg+GeHMx2lxxQP44hvy2MxEQV1QEnUR5W6UQSC8HwbjuxRuvm5isZ2GgfmJ/r+G6l
	RMQy3NW81jyRgR6s1syxgdKHcy81uTtIKUlyDd5Ddtcj2zbT//zTNSFQLjE3uwvpKKjU
	uUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yJPZ0+Xuway95kqxDoZt5oeL/iWz9i/c9lzA+IKFccg=;
	b=Q3LBf2iVBQI6v5csCGSR8JBERXEKyoOY4pdswajfOb5Y18gXZvYoA1K7oqquv6wPNQ
	Eppase48bl4k4Jy7E6ZDuPtmqgml6DXgsSxUIU0B0BLG6S6QFjuNRI9WE9hc8WFtrJJp
	dBYMvm9kUc++FxJc7Qha67ba8iytndc2JGXScH+f9rWNq7LzX9DerVEn1QTTvPBW7rJw
	L+h+VVf+O4ajd2LTJ8gPZ7Glt9TJJMcxr++DMN/YpiAHwS6m1tS91QtKlYymU8JD4tof
	yq/OErTc28xUQfU0EFEcSojDN9ni6T8tBBsIqdLTy6yvs/d7dCLFCmAvFvAdrvOFkQ0C
	I4uQ==
X-Gm-Message-State: AFeK/H1y5llL3DVmg1FbDIm3k2NKj/49sJ71zjWS6s39lH/G4NrLu5Kbz6UN5mDsggSYvxPFaxzjQBArflpb/78Z
X-Received: by 10.237.33.69 with SMTP id 63mr8661818qtc.109.1490374256581;
	Fri, 24 Mar 2017 09:50:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 24 Mar 2017 09:50:36 -0700 (PDT)
In-Reply-To: <20170324164038.30804-1-raj.khem@gmail.com>
References: <20170324164038.30804-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Mar 2017 16:50:36 +0000
Message-ID: <CAJTo0LZH-RV5-s7krGXNURFMOZ+9-iMCyY_O9RUJfHff8qvC2A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix build with thumb2
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
X-List-Received-Date: Fri, 24 Mar 2017 16:50:56 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c7fc825765e054b7cccbc

--94eb2c0c7fc825765e054b7cccbc
Content-Type: text/plain; charset=UTF-8

On 24 March 2017 at 16:40, Khem Raj <raj.khem@gmail.com> wrote:

>  create mode 100644 pull-30041/0000-cover-letter.patch
>  create mode 100644 pull-30041/0001-db-Fix-atomic-
> function-namespace-clash-with-clang-bu.patch
>  create mode 100644 pull-30041/0002-libvorbis-
> Contain-gcc-specific-compiler-flags-using-.patch
>  create mode 100644 scripts/lib/wic/canned-wks/sdimage-bootpart-8g.wks
>  create mode 120000 tools/python
>  create mode 120000 tools/python-config
>

This patch went crazy, I think I'll merge the other one. :)

Ross

--94eb2c0c7fc825765e054b7cccbc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 March 2017 at 16:40, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":2sh" class=3D"a3s aXjCH =
m15b01316ffaf55cd">=C2=A0create mode 100644 pull-30041/0000-cover-letter.<w=
br>patch<br>
=C2=A0create mode 100644 pull-30041/0001-db-Fix-atomic-<wbr>function-namesp=
ace-clash-with-<wbr>clang-bu.patch<br>
=C2=A0create mode 100644 pull-30041/0002-libvorbis-<wbr>Contain-gcc-specifi=
c-compiler-<wbr>flags-using-.patch<br>
=C2=A0create mode 100644 scripts/lib/wic/canned-wks/<wbr>sdimage-bootpart-8=
g.wks<br>
=C2=A0create mode 120000 tools/python<br>
=C2=A0create mode 120000 tools/python-config</div></blockquote></div><br>Th=
is patch went crazy, I think I&#39;ll merge the other one. :)</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0c7fc825765e054b7cccbc--
