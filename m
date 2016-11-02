Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E70CA60796
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 17:22:06 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y68so2286814pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 10:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=AIpnPygPeoj+wnHHAYXvVzHfFWOIe54U2qZnjFcioVU=;
	b=bG9XE7alok+bkowB8y9BezdOKlLb619ymk5iRLCYYkXzZCWDrfZAqahRW6XfK9ihLE
	IZDKvUlIDKrf/xIH4apH6Aw08Abxfhkgp4YmaeE9TywUhve6H6Wai04r/v2J+QhU3LG9
	gQcbi0qOTUWqXEpe/1Ea835fXtkytINIrAEzu6OCXhbRM/yYQb/iFYialAZIgQ7kSKm9
	HStdJ9/AnKKX8NPZTVv8+FdxaKl76423SIUj/tAOuM+Z2q2qQG9Dqr9HSq0WuEX4Uq+K
	PyGkh/7vfwoxOTa9tzc3yoPIpsAN1o2QL95onAVDmiXoiuguR72FyoWUquer0z16uGrd
	jUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=AIpnPygPeoj+wnHHAYXvVzHfFWOIe54U2qZnjFcioVU=;
	b=KLBGReYG/LIUgA/XODb9PbQPbaKf8vGNdUVtO9jShv40+MAoOYukTeaucrrBheOibL
	x/VfCUnE6oCSl7ob16BaAA16MQfULDsXI3CJIlUsQZE8ysEhc/87+LHcJVCnvHvGFkFR
	I6ZuF/uKRnLc8iNPsjmbuSGYLUF0mpKv2/Wx88m0kG6d6wEWwHvxHrBpyuK4l02lyZou
	G/uneZaSWZDCyKPLcZmgDQtzIigguNrccSv5vMWxxD5OF9QOvC7+tK2HWRYOCThTa28N
	QI/p+1q2mbxBkpyFWfdXcuHQT/lGP6Rxsf/9GP/ydiM8aBiXScFshyRWIMfECspsxu4A
	h7ZA==
X-Gm-Message-State: ABUngvevpmtjMkgLfXt4ZeH4UibPGWhlfrlwVbqteu7DAa452j996mH8UCpUlwpQLCtgUg==
X-Received: by 10.98.70.150 with SMTP id o22mr8851332pfi.134.1478107327950;
	Wed, 02 Nov 2016 10:22:07 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:9d22:31df:3be1:5792?
	([2601:646:8882:b8c:9d22:31df:3be1:5792])
	by smtp.gmail.com with ESMTPSA id
	ak3sm6187028pad.19.2016.11.02.10.22.07
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Nov 2016 10:22:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0Laf3ZkyWqz2qY8Evj2R3OB1swBzfWeAZ9D+y3hFXjSecg@mail.gmail.com>
Date: Wed, 2 Nov 2016 10:22:01 -0700
Message-Id: <CD9B1D56-5BF3-4334-B0E7-B07BA2F4061F@gmail.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
	<fced9d20130046ffaf6daa1fe7d619098fdf91c6.1478013702.git.alexander.kanavin@linux.intel.com>
	<CAJTo0Laf3ZkyWqz2qY8Evj2R3OB1swBzfWeAZ9D+y3hFXjSecg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/13] icu: update to 58.1
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
X-List-Received-Date: Wed, 02 Nov 2016 17:22:09 -0000
X-Groupsio-MsgNum: 88927
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E81784C3-DE56-48C5-B209-A8B1E39E1ED6";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E81784C3-DE56-48C5-B209-A8B1E39E1ED6
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_FC447465-8396-477D-A727-D047D56F8FFA"

--Apple-Mail=_FC447465-8396-477D-A727-D047D56F8FFA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Nov 2, 2016, at 5:16 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 1 November 2016 at 15:25, Alexander Kanavin =
<alexander.kanavin@linux.intel.com =
<mailto:alexander.kanavin@linux.intel.com>> wrote:
> The copyright for the software has been transferred to Unicode Inc =
from IBM,
> but the terms are same.
>=20
> libiculx and libicule are no longer produced as they depend on an =
external
> package icu-le-hb (previous versions had an option of using an =
internal
> implementation which now has been dropped). I have verified that icu
> dependencies in oe-core and meta-oe still build.
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com =
<mailto:alexander.kanavin@linux.intel.com>>
>=20
> This breaks under musl:
>=20
> ../../icu/source/i18n/digitlst.cpp:67:24: fatal error: xlocale.h: No =
such file or directory
>  #   include <xlocale.h>
>=20
> musl doesn't have xlocale.h but does have a crippled strtod_l (doesn't =
actually support a passed in locale, which is the entire point of the _l =
functions).
>=20
> Upstreams such as pulseaudio have done =
https://bugs.freedesktop.org/attachment.cgi?id=3D118644 =
<https://bugs.freedesktop.org/attachment.cgi?id=3D118644> to guard the =
include, but I see that digitlist.cpp has an alternative branch where =
strtod_l isn't supported: as that function on musl is crippled maybe ICU =
should be told not to use it?

the _l functions were added as aliases for ABI compatibility reasons, =
however, it should work well and is compatible with glibc versions. =
however its not defined that
it should only come from xlocale.h so we should check for xlocale.h to =
be present on rootfs before using it.

>=20
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_FC447465-8396-477D-A727-D047D56F8FFA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Nov 2, 2016, at 5:16 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 1 November 2016 at 15:25, Alexander Kanavin =
<span dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank" =
class=3D"">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div id=3D"gmail-:2cf" class=3D"gmail-a3s =
gmail-aXjCH gmail-m1582082e4cb03abb">The copyright for the software has =
been transferred to Unicode Inc from IBM,<br class=3D"">
but the terms are same.<br class=3D"">
<br class=3D"">
libiculx and libicule are no longer produced as they depend on an =
external<br class=3D"">
package <span class=3D"gmail-il">icu</span>-le-hb (previous versions had =
an option of using an internal<br class=3D"">
implementation which now has been dropped). I have verified that <span =
class=3D"gmail-il">icu</span><br class=3D"">
dependencies in oe-core and meta-oe still build.<br class=3D"">
<br class=3D"">
Signed-off-by: Alexander Kanavin &lt;<a =
href=3D"mailto:alexander.kanavin@linux.intel.com" =
class=3D"">alexander.kanavin@linux.<wbr =
class=3D"">intel.com</a>&gt;</div></blockquote></div><br class=3D"">This =
breaks under musl:</div><br =
class=3D"">../../icu/source/i18n/digitlst.cpp:67:24: fatal error: =
xlocale.h: No such file or directory<br class=3D"">&nbsp;# &nbsp; =
include &lt;xlocale.h&gt;<br class=3D""><br class=3D""><div =
class=3D"">musl doesn't have xlocale.h but does have a crippled strtod_l =
(doesn't actually support a passed in locale, which is the entire point =
of the _l functions).</div><div class=3D""><br class=3D""></div><div =
class=3D"">Upstreams such as pulseaudio have done&nbsp;<a =
href=3D"https://bugs.freedesktop.org/attachment.cgi?id=3D118644" =
class=3D"">https://bugs.freedesktop.org/attachment.cgi?id=3D118644</a> =
to guard the include, but I see that digitlist.cpp has an alternative =
branch where strtod_l isn't supported: as that function on musl is =
crippled maybe ICU should be told not to use =
it?</div></div></div></blockquote><div><br class=3D""></div><div>the _l =
functions were added as aliases for ABI compatibility reasons, however, =
it should work well and is compatible with glibc versions. however its =
not defined that</div><div>it should only come from xlocale.h so we =
should check for xlocale.h to be present on rootfs before using =
it.</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div dir=3D"ltr" class=3D""><div class=3D""><br =
class=3D""></div><div class=3D"">Ross</div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_FC447465-8396-477D-A727-D047D56F8FFA--

--Apple-Mail=_E81784C3-DE56-48C5-B209-A8B1E39E1ED6
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgaIL4ACgkQuwUzVZGdMxSixACfTxLjjIrJvTehzAI6a07RlKfA
AfwAoIqLLPiSXBVTtPIasMCO3EoBnk0M
=7tb9
-----END PGP SIGNATURE-----

--Apple-Mail=_E81784C3-DE56-48C5-B209-A8B1E39E1ED6--
