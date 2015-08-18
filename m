Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0A7627646E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 16:03:13 +0000 (UTC)
Received: by paccq16 with SMTP id cq16so92013557pac.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 09:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=DXn8FtKeLXwHHS15uxXL6CnQMg/lvkeg+qm1njGMYGY=;
	b=d4js0rnELkaBQNGqbY+2MJA9IFJlgjOqYrcG0UW0vzbOU7j2FkrnQtFhsTqejNvjAg
	C6sQ6iVa/jHX1wA7ed+lfPGQgZqdRBUnDsUvPBcZQzOqe6ibjdSzc4oVlO915GPDtDpS
	H0p/0ihNv6U/W47CdxHAc00tma30peMf82FkoWjXraiHZbihhP9QTBx9lycLGSSJY+sL
	tFCy6i/jW87WjwkwIAT/jk4/u3VocizDs2ec36kUl913J1bhORXl5PQxop0LSlfaH1sf
	8ZnkP6PRnxfQ0UrTlzi+VsTsCvwYV/PrqTkrsHQa87TesenQxKHF4+QFBWbqLT+9ZuRD
	sDEQ==
X-Received: by 10.68.134.169 with SMTP id pl9mr14900416pbb.164.1439913793379; 
	Tue, 18 Aug 2015 09:03:13 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:e99e:512b:4006:2df1?
	([2601:646:8601:4580:e99e:512b:4006:2df1])
	by smtp.gmail.com with ESMTPSA id
	kw3sm2109991pbc.30.2015.08.18.09.03.11
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Aug 2015 09:03:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CABcZAN==rSZ2M4f_2-eZ5yvAaHV+k=rC8pgRju425151ijWMZw@mail.gmail.com>
Date: Tue, 18 Aug 2015 09:03:06 -0700
Message-Id: <746523C2-BA3E-44F1-AAC6-4E14E1736693@gmail.com>
References: <365E1805BC95084CBE82381A0B869994E73E4FE9@EU-MBX-03.mgc.mentorg.com>
	<969F26A8BAB325438E7EB80D3C3134FB16CFA7F5@IRSMSX105.ger.corp.intel.com>
	<CAP71WjyESzCxJrJsxgSk0ZxnM8q0tQYU+CFmm-QVQGVouYWB+A@mail.gmail.com>
	<CABcZANkgxRSRA9afEaOD0cpeNzzSAti_Ef9D4V4ThoJkQzwmgg@mail.gmail.com>
	<CABcZANmjXndEm+OF8aKvSgHwkiOMuFgHrrJy97CYLpDNtZxCmg@mail.gmail.com>
	<CABcZAN==rSZ2M4f_2-eZ5yvAaHV+k=rC8pgRju425151ijWMZw@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
X-Mailer: Apple Mail (2.2104)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: iw in place of wireless-tools
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
X-List-Received-Date: Tue, 18 Aug 2015 16:03:14 -0000
X-Groupsio-MsgNum: 69576
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C750CE99-8213-4DEA-8C50-B99733CB8CDB";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C750CE99-8213-4DEA-8C50-B99733CB8CDB
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_9CC4E9C8-3BB1-4962-AA8B-4480463C3941"

--Apple-Mail=_9CC4E9C8-3BB1-4962-AA8B-4480463C3941
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 18, 2015, at 9:00 AM, Christopher Larson <clarson@kergoth.com> =
wrote:
>=20
> On Tue, Aug 18, 2015 at 8:53 AM, Christopher Larson =
<clarson@kergoth.com <mailto:clarson@kergoth.com>> wrote:
> Bringing this back up again, as I think we really need to at the =
*very* least pull in iw from meta-oe into oe-core, and adjust =
packagegroup-base (worst case, with a VIRTUAL-RUNTIME), and better yet =
also drop wireless-tools / move it to meta-networking.
>=20
> Worst case, we could keep both in VIRTUAL-RUNTIME for compatibility, =
as a temporary measure, but I think we need to get iw into oe-core and =
into the base images for sure.

yes I think its a good idea

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_9CC4E9C8-3BB1-4962-AA8B-4480463C3941
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Aug 18, 2015, at 9:00 AM, Christopher Larson &lt;<a =
href=3D"mailto:clarson@kergoth.com" class=3D"">clarson@kergoth.com</a>&gt;=
 wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><div =
class=3D"gmail_quote">On Tue, Aug 18, 2015 at 8:53 AM, Christopher =
Larson <span dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:clarson@kergoth.com" target=3D"_blank" =
class=3D"">clarson@kergoth.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Bringing this back up =
again, as I think we really need to at the *very* least pull in iw from =
meta-oe into oe-core, and adjust packagegroup-base (worst case, with a =
VIRTUAL-RUNTIME), and better yet also drop wireless-tools / move it to =
meta-networking.</blockquote></div><br class=3D"">Worst case, we could =
keep both in VIRTUAL-RUNTIME for compatibility, as a temporary measure, =
but I think we need to get iw into oe-core and into the base images for =
sure.<br class=3D""></div></div></div></blockquote><div><br =
class=3D""></div><div>yes I think its a good idea</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"gmail_extra">-- <br class=3D""><div =
class=3D"gmail_signature">Christopher Larson<br class=3D"">clarson at =
kergoth dot com<br class=3D"">Founder - BitBake, OpenEmbedded, =
OpenZaurus<br class=3D"">Maintainer - Tslib<br class=3D"">Senior =
Software Engineer, Mentor Graphics</div>
</div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_9CC4E9C8-3BB1-4962-AA8B-4480463C3941--

--Apple-Mail=_C750CE99-8213-4DEA-8C50-B99733CB8CDB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXTVz4ACgkQuwUzVZGdMxSAoACeJ6IsmAoXtfqchLre8QFoTCKu
crgAn04B4Z6kdXf4Us1SCpDlS6jD/sKq
=p+Cd
-----END PGP SIGNATURE-----

--Apple-Mail=_C750CE99-8213-4DEA-8C50-B99733CB8CDB--
