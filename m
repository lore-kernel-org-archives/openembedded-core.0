Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 71E5C60043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 05:46:39 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so50812556pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 22:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=7n7vbuKN5Zxr3TZEjEiT3Y3QH2X3MeC7s7hydC9hiSo=;
	b=uUY9xExxCd66kNb602pOq17G1diuz+xSR6JO4N0ThJPTPGCWF4W7zSKIISNaeYGQL8
	y8roubn+xLe/pFiR1z+hcpko0DNP8maagYauJJpBfascWH1xu5bc2BHvrk9+UA04ojRX
	B0WbYum3ZO6kdW8TFe2X5eoDdhfPzS2nz9FfnOdZH4wOXqpME+2KTJfcLu14qS976EdY
	Rq+jabGrMbNWSFDOsrzaYSTJr3FI2MUjb9SS+O8MJFt5TZp3w6vY1cYCj0uiOaqM7Pbx
	o5tAwlikaoNy1NQH42PdURUDKnBpolGSEshUDQQkM2s7luGekCVrSpXIzKv09PVHmjSQ
	mZFQ==
X-Received: by 10.66.146.132 with SMTP id tc4mr12401212pab.124.1440740799586; 
	Thu, 27 Aug 2015 22:46:39 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:e943:4351:71e0:b332?
	([2601:646:8601:4580:e943:4351:71e0:b332])
	by smtp.gmail.com with ESMTPSA id
	oe10sm4339404pbc.11.2015.08.27.22.46.38
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Aug 2015 22:46:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <2B9C97B395470A40B9E9E5D469BCD9FA176DC5AD@EU-MBX-03.mgc.mentorg.com>
Date: Thu, 27 Aug 2015 22:46:32 -0700
Message-Id: <D026266D-4D46-474D-BBEC-3D9D6F6238B6@gmail.com>
References: <2B9C97B395470A40B9E9E5D469BCD9FA176DC5AD@EU-MBX-03.mgc.mentorg.com>
To: "Arslan, Fahad" <Fahad_Arslan@mentor.com>
X-Mailer: Apple Mail (2.2104)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: default gui with core-image-weston?
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
X-List-Received-Date: Fri, 28 Aug 2015 05:46:43 -0000
X-Groupsio-MsgNum: 70200
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C7EEBB6D-069B-4956-BC33-604838D80894";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C7EEBB6D-069B-4956-BC33-604838D80894
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_5B934BA7-1FE3-430D-9823-14058C71A704"

--Apple-Mail=_5B934BA7-1FE3-430D-9823-14058C71A704
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


> On Aug 27, 2015, at 9:36 PM, Arslan, Fahad <Fahad_Arslan@mentor.com> =
wrote:
>=20
> Hi,
>=20
> I'm looking for weston based image recipe that provides GUI, so if I =
build core-image-weston will it provide any graphical interface on =
display attached to the target.
>=20

yes


--Apple-Mail=_5B934BA7-1FE3-430D-9823-14058C71A704
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Diso-8859-1"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Aug 27, 2015, at 9:36 PM, Arslan, Fahad &lt;<a =
href=3D"mailto:Fahad_Arslan@mentor.com" =
class=3D"">Fahad_Arslan@mentor.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
style=3D"font-size: 10pt; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; direction: ltr; font-family: Tahoma;" =
class=3D"">Hi,<br class=3D""><div style=3D"font-family: 'Times New =
Roman'; font-size: 16px;" class=3D""><div class=3D""><div =
style=3D"direction: ltr; font-family: Tahoma; font-size: 10pt;" =
class=3D""><br class=3D"">I'm looking for weston based image recipe that =
provides GUI, so if I build core-image-weston will it provide any =
graphical interface on display attached to the target.<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D""><br =
class=3D""></div></div></div></div></div></blockquote><div><br =
class=3D""></div>yes</div><div><br class=3D""></div></body></html>=

--Apple-Mail=_5B934BA7-1FE3-430D-9823-14058C71A704--

--Apple-Mail=_C7EEBB6D-069B-4956-BC33-604838D80894
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXf9bwACgkQuwUzVZGdMxTp9gCfXe17ZD1mJLi0VeDS226kmi2k
USgAnjlQxJaNko+Ykwirbu2FyyevxuEM
=6Mh4
-----END PGP SIGNATURE-----

--Apple-Mail=_C7EEBB6D-069B-4956-BC33-604838D80894--
