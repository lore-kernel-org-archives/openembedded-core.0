Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4A8D673243
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 21:33:58 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id 1so166028453ion.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 13:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=7ij4qDFhOuXVtim1D68/0AJ2r7VymvqyfV3cV4XZrSg=;
	b=p2mnRGXBEbNzq2OjGX/gDAonpNynWzmJU2dwzk0XY0JV7MpMIpqslRA8F8vMfG3vXZ
	nFJa1W0cJB5G0GnYs52ruXG5s26NikbGNwg74H8y8Q2oT8Z8ozTFK+5STYGH/qqAUOQY
	JjIA8oP6QYsZkA/GzZ0Di7Tq2AEI3R/ImPurF27ebK+Jt+pt0I6hW+QPDKGVOJWlxOju
	Rjtp7kjoyDpKE34wUDWeyx4bPIpvHFNMcCBxpwZx1iTi1SWMi4S88jjESJovW1x+Ejmp
	MbEdmEiSS7sTfAa3BLN9JWsLlhCmfLI3pdh8PcGRhbIn3gXUTKOXKY+H3M1UaRuAxXwe
	TBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=7ij4qDFhOuXVtim1D68/0AJ2r7VymvqyfV3cV4XZrSg=;
	b=XQd5VkpVeT+v9nv8vMZO3c1I5sFIQ/QCnckAu36uput6Lz7t8rlp41VQzjqx0kBRFA
	/q3PlRWnsq/nBuAygPVK/Zu/opSz0zqYTlPus2Cj+CJ2/h99pXOeEHQl5wRxxkD7IyOV
	dUptURMmoQr29ZlZPNWTL5JyS5N+xRw7CiQzvNw+IpX2SQ9/u5wEUAVkboKqzs5Hi4nB
	b50maYbJBhkbzVmL/AhiQ9nttNizJRa/1uXMB8cVpt+D3ChLbP52V1l0YRrUcoWbqlN6
	07LJaATPyjV+FyS2n8JsQXN+6cvVxQPfM7hhSbpPc0G8GV/3tEgZ4CoWKQpqEu9iF3Hn
	olKA==
X-Gm-Message-State: AG10YORAa7o+Ud0qLIzoeEi8zru3WIN9m/8C0zVXgHZi8BuvKDOGg102SeNHCVU9aA2U0A==
X-Received: by 10.107.10.225 with SMTP id 94mr19442564iok.132.1453757639502;
	Mon, 25 Jan 2016 13:33:59 -0800 (PST)
Received: from [172.19.131.113] ([12.130.117.66])
	by smtp.gmail.com with ESMTPSA id 84sm8761126ioh.3.2016.01.25.13.33.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jan 2016 13:33:58 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZwr6drjDYg=DcPaR8iVhoP8uwuQ6=6v0ftc5xd5kKj1g@mail.gmail.com>
Date: Mon, 25 Jan 2016 13:33:53 -0800
Message-Id: <2F7C10D7-0CBB-45F3-B1E1-C9170BD7845E@gmail.com>
References: <cover.1453746280.git.raj.khem@gmail.com>
	<c8b6c58c6a42381f980b7f5eb388323ffd83836b.1453746280.git.raj.khem@gmail.com>
	<CAJTo0LZwr6drjDYg=DcPaR8iVhoP8uwuQ6=6v0ftc5xd5kKj1g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/11] grub: Backport fix for largefile detection/use
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
X-List-Received-Date: Mon, 25 Jan 2016 21:34:00 -0000
X-Groupsio-MsgNum: 76872
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C15F5893-4C5A-4E11-9107-4EB8EFB50207";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C15F5893-4C5A-4E11-9107-4EB8EFB50207
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_7AE65CDD-64E2-4C5C-98E1-CA46394C77B6"

--Apple-Mail=_7AE65CDD-64E2-4C5C-98E1-CA46394C77B6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 25, 2016, at 1:14 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 25 January 2016 at 18:32, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> +EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'largefile', '--enable-largefile ac_cv_sizeof_off_t=3D8', =
'--disable-largefile', d)}"
>=20
> Why do you need to pass ac_cv_sizeof_off_t?  Surely that's what =
AC_CHECK_SIZEOF is for?

Remember my other email about how we cache sizeof_off_t to =
openemebedded-architecture  ?
this to insulate against that change. Because by caching that variable =
in our site files we defeat AC_CHECK_SIZEOF macro.

>=20
> Ross


--Apple-Mail=_7AE65CDD-64E2-4C5C-98E1-CA46394C77B6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jan 25, 2016, at 1:14 PM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 25 January 2016 at 18:32, Khem Raj <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":141h" =
class=3D"a3s" style=3D"overflow:hidden">+EXTRA_OECONF +=3D =
"${@bb.utils.contains('DISTRO_FEATURES', 'largefile', =
'--enable-largefile ac_cv_sizeof_off_t=3D8', '--disable-largefile', =
d)}"<br class=3D""></div></blockquote></div><br class=3D"">Why do you =
need to pass ac_cv_sizeof_off_t?&nbsp; Surely that's what =
AC_CHECK_SIZEOF is for?</div></div></div></blockquote><div><br =
class=3D""></div><div>Remember my other email about how we cache =
sizeof_off_t to openemebedded-architecture &nbsp;?</div><div>this to =
insulate against that change. Because by caching that variable in our =
site files we defeat AC_CHECK_SIZEOF macro.</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><br =
class=3D""></div><div class=3D"gmail_extra">Ross</div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_7AE65CDD-64E2-4C5C-98E1-CA46394C77B6--

--Apple-Mail=_C15F5893-4C5A-4E11-9107-4EB8EFB50207
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlamlMEACgkQuwUzVZGdMxSk4QCePt1U1gOYiVDw/ubZN10ibvv2
BGQAn25NGwn+/deLe4KR4W6h1f18dBV4
=8jjF
-----END PGP SIGNATURE-----

--Apple-Mail=_C15F5893-4C5A-4E11-9107-4EB8EFB50207--
