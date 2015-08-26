Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4E76871633
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 01:45:27 +0000 (UTC)
Received: by pacgr6 with SMTP id gr6so9163357pac.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 18:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=qdm1vt8tA4lNTxmLFQA1pMNpKqHKsVT0kyN2CvTSuv0=;
	b=tG+5QfpTc+zkSzQtQyPewQJshnSYMvoGQIH6gNj8RiGsqxGHt5L+RMbgntjWqKPWzR
	dIFBUrlu9jNDgxzJ6kl5u9C/YH/eHKxKBBiNZb0U6sn0Y90/eD+WOUoMJl/blchCbv11
	W4/LHXq9bKVzlaHlTPPq1zI35n54NHGy/QpJQfxsFMinWsalOHlGpJt19psqNOVfuEev
	FfndDrT/ydX/FY+XqEOLtjZTu0lGl79IRzEmBoP7/5qBvz+LPfDhzGI87wlt7vPadQjw
	M72b18d/nPImuNrpvQL4nQOVCF5TlXOXPgycYm3WlF2hORoW8zZAsMQr6K1m1RscUqlH
	wQvQ==
X-Received: by 10.68.224.162 with SMTP id rd2mr63215656pbc.33.1440553528339;
	Tue, 25 Aug 2015 18:45:28 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:154a:7662:3b48:ac9?
	([2601:646:8601:4580:154a:7662:3b48:ac9])
	by smtp.gmail.com with ESMTPSA id
	bv4sm22495585pbb.86.2015.08.25.18.45.27
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Aug 2015 18:45:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZLhzWSo-vN79hKbOdZ-N7U+zD_wECtXCAGgN5y56=Y2A@mail.gmail.com>
Date: Tue, 25 Aug 2015 18:45:17 -0700
Message-Id: <063FD23A-8854-40BB-B5EC-2D09048DDAF9@gmail.com>
References: <cover.1440446289.git.raj.khem@gmail.com>
	<9bf77291c7084cfdef86008d204932e7adb1067a.1440446290.git.raj.khem@gmail.com>
	<CAJTo0LZLhzWSo-vN79hKbOdZ-N7U+zD_wECtXCAGgN5y56=Y2A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/17] python-distribute, python-setuptools: Migrate to good old python-setuptools
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
X-List-Received-Date: Wed, 26 Aug 2015 01:45:28 -0000
X-Groupsio-MsgNum: 70041
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2C6449F7-014C-40C1-8824-CDD6A723104D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2C6449F7-014C-40C1-8824-CDD6A723104D
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_3A04A572-3983-4755-9CC2-BBE5CDC1981A"

--Apple-Mail=_3A04A572-3983-4755-9CC2-BBE5CDC1981A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 25, 2015, at 9:26 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
> On 24 August 2015 at 21:03, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> setuptools the old king is ruling again, distribute fork has been =
merged
> into setuptools starting 0.7x, so lets move to use it as well
>=20
> This fails dramatically on the autobuilder with the core error being:
>=20
> ERROR: Nothing PROVIDES 'python-setuptools-native' (but =
virtual:nativesdk:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-a=
rm64/build/meta/recipes-devtools/python/python-git_1.0.1.bb =
<http://python-git_1.0.1.bb/> DEPENDS on or otherwise requires it). =
Close matches:
>   python3-setuptools-native
>   python3-setuptools
>   python-scons-native
>=20

I sent a V2 for this

1. Fixes licenses
2. Fixes SRC_URI checksum for python3-setuptools

Hopefully that fixes it.



--Apple-Mail=_3A04A572-3983-4755-9CC2-BBE5CDC1981A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Aug 25, 2015, at 9:26 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra">On 24 August 2015 at 21:03, Khem =
Raj <span dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br class=3D""><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><span class=3D"">setuptools</span> the =
old king is ruling again, distribute fork has been merged<br class=3D"">
into <span class=3D"">setuptools</span> starting 0.7x, so lets move to =
use it as well<br class=3D""></blockquote></div><div =
class=3D"gmail_extra"><br class=3D""></div>This fails dramatically on =
the autobuilder with the core error being:</div><div =
class=3D"gmail_extra"><br class=3D"">ERROR: Nothing PROVIDES =
'python-setuptools-native' (but =
virtual:nativesdk:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-a=
rm64/build/meta/recipes-devtools/python/<a =
href=3D"http://python-git_1.0.1.bb/" class=3D"">python-git_1.0.1.bb</a> =
DEPENDS on or otherwise requires it). Close matches:<br class=3D"">&nbsp; =
python3-setuptools-native<br class=3D"">&nbsp; python3-setuptools<br =
class=3D"">&nbsp; python-scons-native<br class=3D""></div><div =
class=3D"gmail_extra"><br =
class=3D""></div></div></div></blockquote><div><br class=3D""></div><div>I=
 sent a V2 for this</div><div><br class=3D""></div><div>1. Fixes =
licenses</div><div>2. Fixes SRC_URI checksum for =
python3-setuptools</div><div><br class=3D""></div><div>Hopefully that =
fixes it.</div></div><br class=3D""><div class=3D""><br =
class=3D""></div></body></html>=

--Apple-Mail=_3A04A572-3983-4755-9CC2-BBE5CDC1981A--

--Apple-Mail=_2C6449F7-014C-40C1-8824-CDD6A723104D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXdGjYACgkQuwUzVZGdMxSoUwCfWD9GoilfXvYbE+oxV6fjvW5f
bdYAnjBE1ECqdDXlT6tlODBAdMzQou39
=ZRC8
-----END PGP SIGNATURE-----

--Apple-Mail=_2C6449F7-014C-40C1-8824-CDD6A723104D--
