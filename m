Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id E7306731C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 09:33:08 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id u186so163696668ita.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 02:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UoOKfP4ZNtlTc0XqGhUjcZfUGtMqhnlDD5zPSEFlz1Y=;
	b=jYB9v5I6f4pvKS65tOtqfNrGOmmv2LpCV4lUSgf3f9qRgv0JolTEUb4WVMTX+mYG2f
	AjzUAoPi61p2Tye3BhVjqhQbAWuyOYMfPgqVnQ23iMElLs4sqo6Qv26sQNIoRHbd1//T
	eydwQOuwDqBqcbDoYOnLun7wZZ/Wrqbw1pis9THgdAnceuV40EbK3MZQNBAyjkR9iiSR
	/thIFgL3fe/aruu44PRrbUwF7sFaXXAcjJowvcqBCUPqgSXNeyL2lVatssMr8dcA1pOl
	deaWyNcviLyoHGl/oK1QawGGtCApcsrvWN+AXmZ2dcDYoUT6aVKDKb+NUO6n+dqnSwBI
	XaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UoOKfP4ZNtlTc0XqGhUjcZfUGtMqhnlDD5zPSEFlz1Y=;
	b=joQhhWW27h8N2GcjhX27XT1pHcTKEE9X9UOuER19rI3Iy2TiCckY6a5pFPpVT2d8st
	fesqVAGxWxh+C5dj9U4ZBvyE04RIsuWFk7OkYVN8gzNUnxdHYWgzbFppuaDg73DuDHEb
	wcrH+KNCh3kkEHlo05bVrQ5L5ztF5F2ZUBr4Uq+TDWcYnJd4lZ4feLZzGotA5POkAIvW
	Y6FS5LUTpmhWBPy/ebCfOoMchlkWbpc19/YBG4g3AcMBlcrEzfeEJh6MOCscI8ulydC3
	wex66OBSRxwJwSXk3oKIYvTw+1/76pQXzzuXRQiUdYxMQH1Da7r/TK9Ra+EzSRTZN5Xy
	jT+Q==
X-Gm-Message-State: AEkoouvPd4+4RiPImTJhdCePQwLc6zjYuZiKFxJpHTAmmgfpTZpqROGBT00uPu6HuiJ5M7dI7pClfk6SM94wTPBh
X-Received: by 10.36.87.140 with SMTP id u134mr39549783ita.38.1469698389531;
	Thu, 28 Jul 2016 02:33:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 28 Jul 2016 02:32:50 -0700 (PDT)
In-Reply-To: <1469657668-8150-1-git-send-email-alejandro.hernandez@linux.intel.com>
References: <1469657668-8150-1-git-send-email-alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Jul 2016 10:32:50 +0100
Message-ID: <CAJTo0LYAUORccSVvnfab1zpdS9HqdMenmfETq6c7SN2sqQJY-Q@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python-setuptools: Upgrade to v 25.1.0
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
X-List-Received-Date: Thu, 28 Jul 2016 09:33:12 -0000
Content-Type: multipart/alternative; boundary=001a1135018c6f99750538aed20b

--001a1135018c6f99750538aed20b
Content-Type: text/plain; charset=UTF-8

On 27 July 2016 at 23:14, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> -LIC_FILES_CHKSUM =
> "file://setup.py;beginline=134;endline=134;md5=3e8df024d6c1442d18e84acf8fbbc475"
> +LIC_FILES_CHKSUM =
> "file://setup.py;beginline=155;endline=155;md5=3e8df024d6c1442d18e84acf8fbbc475"
>

Please explain why the license checksum was changed.

Ross

--001a1135018c6f99750538aed20b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 July 2016 at 23:14, Alejandro Hernandez <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">alejandro=
.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div id=3D":22o" class=3D"a3s aXjCH m1562e6f5f5586e55">-LIC_FILES_C=
HKSUM =3D &quot;file://setup.py;beginline=3D134;endline=3D134;md5=3D3e8df02=
4d6c1442d18e84acf8fbbc475&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://setup.py;beginline=3D155;endline=3D155;m=
d5=3D3e8df024d6c1442d18e84acf8fbbc475&quot;</div></blockquote></div><br>Ple=
ase explain why the license checksum was changed.</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1135018c6f99750538aed20b--
