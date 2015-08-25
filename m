Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id C645F65CCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 20:34:51 +0000 (UTC)
Received: by pabzx8 with SMTP id zx8so44199704pab.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 13:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=3MVvyZlcAQff7yoJB/ujfCt0NMWqwI/n+MVt48+0fgw=;
	b=xWUis4/JXH8Y0JMCtoe78Y+/kH7jLvRNpIB2mcB0tPOM1lCq65StbLD2zYuuejw+Ye
	pYW/xJcLhjGXgulPBQOquc1EG+vtX3nC7fBaKdVxvyQoNhVgf/H/BXHrXX+kBhqjlO+n
	O9amVLm+0y2QAblUnjn5bMRhfD2GJ2tmscnWdfMnnyX1FRM/X1DnkoHLkB6PwZb/zNIY
	LBwy14kH6RX4MoJ9RgZrBQ8hxMGZIeHakr4UWy8OtwLORv5G4WYy62MGA70usCUGju/0
	Pmco6EpCwPNw7nT2Y3SdZgH5SxRm7zSrCVSs888860NmtTZ1zA1PqFwpfR8VP15gP3ic
	tD1g==
X-Received: by 10.68.112.227 with SMTP id it3mr61050423pbb.132.1440534892216; 
	Tue, 25 Aug 2015 13:34:52 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:316a:3272:24e7:4679?
	([2601:646:8601:4580:316a:3272:24e7:4679])
	by smtp.gmail.com with ESMTPSA id
	la4sm22022752pbc.76.2015.08.25.13.34.51
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Aug 2015 13:34:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZLhzWSo-vN79hKbOdZ-N7U+zD_wECtXCAGgN5y56=Y2A@mail.gmail.com>
Date: Tue, 25 Aug 2015 13:34:44 -0700
Message-Id: <F48F6534-0553-41E1-84C9-45181AA4FCDC@gmail.com>
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
X-List-Received-Date: Tue, 25 Aug 2015 20:34:53 -0000
X-Groupsio-MsgNum: 70033
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8C2C60AA-C3B0-4209-B60E-E885105BC54C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8C2C60AA-C3B0-4209-B60E-E885105BC54C
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_5AA1BE88-B86D-42C8-A2BE-A2F1AFAD8576"

--Apple-Mail=_5AA1BE88-B86D-42C8-A2BE-A2F1AFAD8576
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

I can not reproduce it. I did bitbake nativesdk-python-git
from scratch and all worked fine. I used qemux86 but I guess its target =
independent problem. How do you reproduce it.



--Apple-Mail=_5AA1BE88-B86D-42C8-A2BE-A2F1AFAD8576
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
 can not reproduce it. I did&nbsp;bitbake =
nativesdk-python-git</div><div>from scratch and all worked fine. I used =
qemux86 but I guess its target independent problem. How do you reproduce =
it.</div><br class=3D""></div><br class=3D""></body></html>=

--Apple-Mail=_5AA1BE88-B86D-42C8-A2BE-A2F1AFAD8576--

--Apple-Mail=_8C2C60AA-C3B0-4209-B60E-E885105BC54C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXc0WkACgkQuwUzVZGdMxSolACgkBHMjVJH0qYbkTVR8x4jaLEh
2HMAn18/mPzFWcA0ncF0RVJ0mDF+jOVt
=ey4U
-----END PGP SIGNATURE-----

--Apple-Mail=_8C2C60AA-C3B0-4209-B60E-E885105BC54C--
