Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5C71960132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 15:20:02 +0000 (UTC)
Received: by pabvl15 with SMTP id vl15so70489069pab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 08:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=JvDCqBdGBCanqBz2tTBGhGBF8okk0bqA+vE9pLdd83Y=;
	b=IYRqMQSQUCMjCM3DV54E21mVafdqoB4GZ0FdKQoC9hHNZ+h++V2wyzL6s3S2rnR5GW
	HgkaD2om7KXj+CEqu5XH7d/Xj2YrA1geVqySXPewm5KNouxUPEvLf/nFcZQshUOyPOLd
	C9tDREYnMbBQ1lFJA5QXqlDo3J3yLLlfv8vqMDFY8m8IYOlXQ8zGlpYwGCqYrmogVuha
	bhdDm0Yh0mTqkCAkYKXtxjyKZSnbPrm5ygNJI2qvV95/9jek5n3r1AqTKtYqKNn3B4L6
	Ur6cqh+YQCij7okrLC+3Fp0hwVHnsJWxUROXDWCbQcZOR2SweyVRIeJj7vRjfdkWn4Mu
	zLgw==
X-Received: by 10.68.224.10 with SMTP id qy10mr4428305pbc.23.1435332004186;
	Fri, 26 Jun 2015 08:20:04 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:2066:6681:69d4:7422?
	([2601:646:8601:4580:2066:6681:69d4:7422])
	by mx.google.com with ESMTPSA id
	je4sm33658126pbb.17.2015.06.26.08.20.03
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 26 Jun 2015 08:20:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0Lb0S_b4Wnb0dWmVae9Ezmn=dB0G2=DFyEjD2nivoa6Jfw@mail.gmail.com>
Date: Fri, 26 Jun 2015 08:19:58 -0700
Message-Id: <AB12494C-E7B7-4FD0-B3E2-72E5E91F3714@gmail.com>
References: <cover.1433349512.git.raj.khem@gmail.com>
	<0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
	<CAHiDW_GjW0PSnNRGekiYkg+qdhg=xbbmiVhWY95cv6GxQPJ1Bw@mail.gmail.com>
	<5E0378F8-62E0-4A7F-AB07-0209CD229BF3@gmail.com>
	<CAJTo0Lb0S_b4Wnb0dWmVae9Ezmn=dB0G2=DFyEjD2nivoa6Jfw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2102)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] wayland/weston/libinput: Upgrade to 1.6.0 -> 1.8.0
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
X-List-Received-Date: Fri, 26 Jun 2015 15:20:04 -0000
X-Groupsio-MsgNum: 67213
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C9E7F5E7-DBB0-4DCC-BBCC-F274A9F90F21";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C9E7F5E7-DBB0-4DCC-BBCC-F274A9F90F21
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_46D5814B-9A5F-42CF-B515-C2FCCEA59F48"

--Apple-Mail=_46D5814B-9A5F-42CF-B515-C2FCCEA59F48
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 26, 2015, at 7:47 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 3 June 2015 at 22:21, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> > Can you explain why? The revision looks like 0.16.0 release.
>=20
> its easy to develop libinput and prepare/test upstream patches since =
all upstreams want the patches against their latest master and its easy =
to switch to AUTOREV locally and do it.
>=20
> That's not a great reason and I'm against using git fetches when =
there's perfectly good tarballs available.
>=20

=46rom a system integrators point of view, I agree with your sentiments. =
=46rom a developers point of view not so much. We already have many =
recipes already fetching from git and more and more switching to use it =
see qt5 lately, there are perfectly fine tarballs released for QT5 too, =
just because its simpler to developer and integrate packages.


> Ross


--Apple-Mail=_46D5814B-9A5F-42CF-B515-C2FCCEA59F48
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jun 26, 2015, at 7:47 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 3 June 2015 at 22:21, Khem Raj <span dir=3D"ltr" =
class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" =
class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; =
Can you explain why? The revision looks like 0.16.0 release.<br =
class=3D"">
<br class=3D"">
</span>its easy to develop libinput and prepare/test upstream patches =
since all upstreams want the patches against their latest master and its =
easy to switch to AUTOREV locally and do it.</blockquote><div =
class=3D""><br class=3D""></div><div class=3D"">That's not a great =
reason and I'm against using git fetches when there's perfectly good =
tarballs available.</div><div class=3D""><br =
class=3D""></div></div></div></div></div></blockquote><div><br =
class=3D""></div><div>=46rom a system integrators point of view, I agree =
with your sentiments. =46rom a developers point of view not so much. We =
already have many recipes already fetching from git and more and more =
switching to use it see qt5 lately, there are perfectly fine tarballs =
released for QT5 too, just because its simpler to developer and =
integrate packages.</div><div><br class=3D""></div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><div =
class=3D"gmail_quote"><div class=3D"">Ross&nbsp;</div></div></div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_46D5814B-9A5F-42CF-B515-C2FCCEA59F48--

--Apple-Mail=_C9E7F5E7-DBB0-4DCC-BBCC-F274A9F90F21
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlWNbaIACgkQuwUzVZGdMxQxjACfX5clKYyx8VbkJRRah/HvEPo+
92QAnj0P/vKdv4N5atdCEd03jZrMbNln
=oMd9
-----END PGP SIGNATURE-----

--Apple-Mail=_C9E7F5E7-DBB0-4DCC-BBCC-F274A9F90F21--
