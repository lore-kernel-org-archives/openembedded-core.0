Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0200777038
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 16:00:04 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so25858942pad.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 09:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=qWvxF2ozxWPWEVeRgRLCdPwofYmD24pznZa8CIVCSs0=;
	b=a6R7eNteokWR4/3kCuvAjVb92uytuY+7lkvCbg8cJxJbiwnmWSVH/fWfgCFFG6/iUU
	4+ddBeo0G7VGLIVhaUTH3A8/LOnagPkNCOJ2hAfXcMZylHE3DHISen8ffPxhu0t3/UBl
	/dz1O1dXtAMSEiNC9kvvr6+0Yp+Dt7zw4YIkSAqkaHN9ww2RKAOuD+SHbxdW80DY2AAS
	CgyNgqfWjs57aZ+EhRiq2yDtp5pIHV0KERrSb2CkTc3SecmYwGpv1xkDXW9ssGqIvXwQ
	x5fgzYrGhPVRbihn63mlnWqtPn5r9UrmAMLXfeHwlALsOElA7qMEX3d3qdz4BJ6tKg2K
	3hXw==
X-Received: by 10.66.250.226 with SMTP id zf2mr9698267pac.20.1441382403679;
	Fri, 04 Sep 2015 09:00:03 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:9840:3a97:97d7:650a?
	([2601:646:8601:4580:9840:3a97:97d7:650a])
	by smtp.gmail.com with ESMTPSA id
	cs6sm2974687pdb.40.2015.09.04.09.00.02
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Sep 2015 09:00:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZDX+hQiAw4cw6Xt6B6YOHPjznO_dSPCSzbQgbz6SVR9Q@mail.gmail.com>
Date: Fri, 4 Sep 2015 08:59:57 -0700
Message-Id: <731F6820-34E6-492D-81B4-8393583D7AD3@gmail.com>
References: <1441380461.24871.171.camel@linuxfoundation.org>
	<2CF81DE4-D260-4561-AE95-F321C093AE13@gmail.com>
	<CAJTo0LZDX+hQiAw4cw6Xt6B6YOHPjznO_dSPCSzbQgbz6SVR9Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcmode-default: Set gcc 5.2 as the default
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
X-List-Received-Date: Fri, 04 Sep 2015 16:00:09 -0000
X-Groupsio-MsgNum: 70687
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1492A6B9-0BCB-4C23-9155-979623B6B9F9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1492A6B9-0BCB-4C23-9155-979623B6B9F9
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_BE6ABE0A-6F7D-4EFA-8F9B-604648DC2422"

--Apple-Mail=_BE6ABE0A-6F7D-4EFA-8F9B-604648DC2422
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 4, 2015, at 8:32 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 4 September 2015 at 16:29, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> a small nit. Make it 5.% to logically indicate that 5.x is a bug fix =
release and next big upgrade will be
> 6.x
>=20
> To be honest I'd prefer *any* change to the compiler beyond eg 5.2.0 =
-> 5.2.1 to be explicit.  I think we've all seen enough breakage from a =
"bug fix" release to know that it needs a proper test.
>=20

well to put it in simple way gcc has changes its release numbers so

4.9.x  is same as 5.x now ( bug fix release) . Does that help

> Ross


--Apple-Mail=_BE6ABE0A-6F7D-4EFA-8F9B-604648DC2422
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Sep 4, 2015, at 8:32 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 4 September 2015 at 16:29, Khem Raj <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":34o" =
class=3D"a3s" style=3D"overflow:hidden">a small nit. Make it 5.% to =
logically indicate that 5.x is a bug fix release and next big upgrade =
will be<br class=3D"">
6.x<br class=3D""></div></blockquote></div><br class=3D"">To be honest =
I'd prefer *any* change to the compiler beyond eg 5.2.0 -&gt; 5.2.1 to =
be explicit.&nbsp; I think we've all seen enough breakage from a "bug =
fix" release to know that it needs a proper test.</div><div =
class=3D"gmail_extra"><br =
class=3D""></div></div></div></blockquote><div><br =
class=3D""></div><div>well to put it in simple way gcc has changes its =
release numbers so&nbsp;</div><div><br class=3D""></div><div>4.9.x =
&nbsp;is same as 5.x now ( bug fix release) . Does that help</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"gmail_extra">Ross</div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_BE6ABE0A-6F7D-4EFA-8F9B-604648DC2422--

--Apple-Mail=_1492A6B9-0BCB-4C23-9155-979623B6B9F9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXpwAEACgkQuwUzVZGdMxTb7ACfdR3I1QELhVBFolAH5c8LrF3Q
F4kAn3ae7FViiS10csaAS4mcYUOAc4p4
=f3sw
-----END PGP SIGNATURE-----

--Apple-Mail=_1492A6B9-0BCB-4C23-9155-979623B6B9F9--
