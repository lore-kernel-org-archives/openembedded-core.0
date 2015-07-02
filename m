Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7326C65CBF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 01:38:30 +0000 (UTC)
Received: by pactm7 with SMTP id tm7so31473516pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 18:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=KxU34RSwHynMmWbtLBMyCKupfJtyrFd93gTD+yKos4s=;
	b=mKWFjArhh97XzYfsQpUD/1/WtmpCG00r6k8vgvL9bYbQOWv4feSpIVJDNj2hlbPeIL
	lT/owwELOl3X/k0Bzs1N0supZCAuCnwGEWYgIQDMf1EyjSuPHJYDe5SqQe9JrT6Jm180
	+9sjPUIMyElcmjWibYJsx5u/3XpyTi3uhB5Cx5C3aYveMbpORFJq9LCKGRbr8voo+OHw
	UvuXFz412gCuUJ2jn/U9ml2ZID8nDTRSTWFT/Ll8LqaUKcdFleWPyJxjnFHdbVB98wYH
	r2vda4VjEEmMyCgmGQSkNBTVK7YYFqxcL7ghnW/FEzmGUJji+z93vNPhMkDrcfdppBLc
	pLwQ==
X-Received: by 10.68.130.226 with SMTP id oh2mr59632402pbb.156.1435801111249; 
	Wed, 01 Jul 2015 18:38:31 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4166:d3:8246:e1a0?
	([2601:646:8601:4580:4166:d3:8246:e1a0])
	by mx.google.com with ESMTPSA id dd3sm3619744pad.45.2015.07.01.18.38.30
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 01 Jul 2015 18:38:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZdPcAh-bQCkO=WN49b_SAa3Gj8yPLTPPpKD+jVn_mG7Q@mail.gmail.com>
Date: Wed, 1 Jul 2015 18:38:26 -0700
Message-Id: <EA10218E-4D41-4B06-8479-9D06D6F588AB@gmail.com>
References: <cover.1435774899.git.raj.khem@gmail.com>
	<efc583454a3f6cce0b15d122320258aa8636b92c.1435774899.git.raj.khem@gmail.com>
	<CAJTo0LZdPcAh-bQCkO=WN49b_SAa3Gj8yPLTPPpKD+jVn_mG7Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2102)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] weston: Upgrade weston_1.6.0.bb -> weston_1.8.0.bb
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
X-List-Received-Date: Thu, 02 Jul 2015 01:38:31 -0000
X-Groupsio-MsgNum: 67444
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A0CCD00A-6806-4098-9401-2B33C06ECC7F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A0CCD00A-6806-4098-9401-2B33C06ECC7F
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_DBCE4056-C511-4A36-936D-FA2244410253"

--Apple-Mail=_DBCE4056-C511-4A36-936D-FA2244410253
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 1, 2015, at 3:07 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 1 July 2015 at 19:24, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> Make error() portable, Fix build on musl
>=20
> Upstream points out that theres lots of other GNU-specific bits in =
Weston (such as gnu-specific printf formats).  Does musl support those =
or is this a token step towards being musl-friendly?
>=20

No, certain construct like %m which are used in weston are already part =
of musl. As of now it builds and boots fine with latest musl release and =
we will address any future issues
if they arise. moreover upstream wayland/weston is very receptive for =
musl changes. Now regarding this patch, I will redo it and submit it =
upstream to incorporate the feedback,
however the patch itself is ok its just the mechanics of it which needs =
to be changed.

> Ross


--Apple-Mail=_DBCE4056-C511-4A36-936D-FA2244410253
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jul 1, 2015, at 3:07 PM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 1 July 2015 at 19:24, Khem Raj <span dir=3D"ltr" =
class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" =
class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":19g" =
class=3D"a3s" style=3D"overflow:hidden">Make error() portable, Fix build =
on musl<br class=3D""></div></blockquote></div><br class=3D"">Upstream =
points out that theres lots of other GNU-specific bits in Weston (such =
as gnu-specific printf formats).&nbsp; Does musl support those or is =
this a token step towards being musl-friendly?</div><div =
class=3D"gmail_extra"><br =
class=3D""></div></div></div></blockquote><div><br =
class=3D""></div><div>No, certain construct like %m which are used in =
weston are already part of musl. As of now it builds and boots fine with =
latest musl release and we will address any future issues</div><div>if =
they arise. moreover upstream wayland/weston is very receptive for musl =
changes. Now regarding this patch, I will redo it and submit it upstream =
to incorporate the feedback,</div><div>however the patch itself is ok =
its just the mechanics of it which needs to be changed.</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"gmail_extra">Ross</div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_DBCE4056-C511-4A36-936D-FA2244410253--

--Apple-Mail=_A0CCD00A-6806-4098-9401-2B33C06ECC7F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlWUlhUACgkQuwUzVZGdMxS9VACfS/7rRm5n4eV8fxTPwzF4tTgq
RLwAn3FBzV2xskBRqsF3souJuEQ/tLN8
=phHg
-----END PGP SIGNATURE-----

--Apple-Mail=_A0CCD00A-6806-4098-9401-2B33C06ECC7F--
