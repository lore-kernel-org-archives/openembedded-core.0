Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 008C1731A2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 23:25:36 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id g202so7169872pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 16:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=o0dQTCP/4M4eGlFFnPfmBNt8tKRaUX7RiFa7q3F/XXE=;
	b=suMCJc4PqdmNbg0f7ukg8VKfd71F3sJ24pyGhsMRUKjCIiBFUSMWbPHSGXGU9TlLxm
	vms2qrHDN7BXY9lMV1zqeN3uhFxy8gzh8bIWZECwCX8obZzkD6bnlUpb4fgFzfl1UTLx
	5wqs06OybTPZAqfM/Di8+XXIim6F53fZU7PMaGgTq1uRNlwEWHxhvuLeWGqHBN6+8hD7
	HtGi9BeKXPGSqPLkPBCI2DARlPgvV5gD5KhpFrT4P6rPxd6E/MZAEOFU3h/uUfEu5nSW
	0NyAUZK6aXfE4esSL7eRclGsbe8Rfl0sz2zqHRE+b4/+iDyb6WrbsIqDCxHsbsNQAIi/
	7ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=o0dQTCP/4M4eGlFFnPfmBNt8tKRaUX7RiFa7q3F/XXE=;
	b=BXt17EJXsTMPbvcc9897DqVmUHdXYh/1Qqn/IBmzsqedrpmdBlwir6/EoaHDLh9j4t
	Xwk6sXljR7s71vLnKwuu7sbPKIjJgdEdDPZCxoK9sTNWBx8cBGqexr9lyoVs4fgBxVD1
	C4cndY6lDJvswWqeHrnpQCuCBYIgeuXgb0sPj6/HMwXdVjPUr348TKu2fIONkxkjx+TK
	laqCpRMk1RuTNywZHqoilXK+fBwwa0GOGelYYp+j9XqU8WhUebPo0kqY4ElHE/0hXOdX
	fNpFcnnisw7Falw6hK1AaWlB8FX+JQIugzgkKOQ2I7xQ3my1Xb/Oul9HoWQr5HlIswo4
	8W5Q==
X-Gm-Message-State: ALyK8tKJRMwg+8+03Mz5AHEuYQdVrEaU8edlS11SW7cibeOJrAe+S7I/J11ygIoKP3BTiA==
X-Received: by 10.98.72.201 with SMTP id q70mr25742460pfi.159.1468625137310;
	Fri, 15 Jul 2016 16:25:37 -0700 (PDT)
Received: from [192.168.0.5] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id t80sm155449pfj.38.2016.07.15.16.25.33
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Jul 2016 16:25:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0La03=kJ14FYFFpNYzbpmUnC5vzy4R+XKzm3naqycAEZ7A@mail.gmail.com>
Date: Fri, 15 Jul 2016 16:25:27 -0700
Message-Id: <FC49D134-1826-4C0E-9D00-B0C63A0EFCAD@gmail.com>
References: <cover.1468578590.git.jussi.kukkonen@intel.com>
	<25b3f922c187722bc62a57610516064651cf2e1a.1468578590.git.jussi.kukkonen@intel.com>
	<CAJTo0La03=kJ14FYFFpNYzbpmUnC5vzy4R+XKzm3naqycAEZ7A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] wayland: Upgrade 1.10.0 -> 1.11.0
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
X-List-Received-Date: Fri, 15 Jul 2016 23:25:37 -0000
X-Groupsio-MsgNum: 84591
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C6D2EDB0-C65D-4046-AC4E-D45AE52ECD5D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C6D2EDB0-C65D-4046-AC4E-D45AE52ECD5D
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_03362389-F5E8-4496-9369-BA26B4552F50"

--Apple-Mail=_03362389-F5E8-4496-9369-BA26B4552F50
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 15, 2016, at 3:15 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 15 July 2016 at 11:41, Jussi Kukkonen <jussi.kukkonen@intel.com =
<mailto:jussi.kukkonen@intel.com>> wrote:
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com =
<mailto:jussi.kukkonen@intel.com>>
>=20
> This breaks with musl:
>=20
> | ../wayland-1.11.0/src/scanner.c: In function 'find_enumeration':
> | ../wayland-1.11.0/src/scanner.c:811:2: error: unknown type name =
'uint'
> |   uint idx =3D 0, j;

Fixed with
https://patchwork.freedesktop.org/patch/98992/ =
<https://patchwork.freedesktop.org/patch/98992/>

Please back port and test

>=20
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_03362389-F5E8-4496-9369-BA26B4552F50
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jul 15, 2016, at 3:15 PM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 15 July 2016 at 11:41, Jussi Kukkonen <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:jussi.kukkonen@intel.com" =
target=3D"_blank" class=3D"">jussi.kukkonen@intel.com</a>&gt;</span> =
wrote:<br class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div id=3D":3i8" class=3D"">Signed-off-by: =
Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com" =
class=3D"">jussi.kukkonen@intel.com</a>&gt;<br =
class=3D""></div></blockquote></div><br class=3D"">This breaks with =
musl:</div><div class=3D"gmail_extra"><br class=3D"">| =
../wayland-1.11.0/src/scanner.c: In function 'find_enumeration':<br =
class=3D"">| ../wayland-1.11.0/src/scanner.c:811:2: error: unknown type =
name 'uint'<br class=3D"">| &nbsp; uint idx =3D 0, =
j;</div></div></div></blockquote><div><br class=3D""></div><div>Fixed =
with</div><div><a href=3D"https://patchwork.freedesktop.org/patch/98992/" =
class=3D"">https://patchwork.freedesktop.org/patch/98992/</a></div><div><b=
r class=3D""></div><div>Please back port and test</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><br =
class=3D""></div><div class=3D"gmail_extra">Ross</div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_03362389-F5E8-4496-9369-BA26B4552F50--

--Apple-Mail=_C6D2EDB0-C65D-4046-AC4E-D45AE52ECD5D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleJcOwACgkQuwUzVZGdMxR2uACdHBhoVYbGlWmXW6H8X2HPMLZL
GeUAnioHtZM6hqOlXDGrI2d6mC0BpaBu
=gCPg
-----END PGP SIGNATURE-----

--Apple-Mail=_C6D2EDB0-C65D-4046-AC4E-D45AE52ECD5D--
