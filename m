Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 24B5F60043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 06:47:20 +0000 (UTC)
Received: by pabzx8 with SMTP id zx8so52697581pab.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 23:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=e5N9Uu6WIuyKIO3RqSg4g8JOHQgkebfc8o5ABnac6A8=;
	b=AhAmyNd21N1dqpKlthSY+ju26hdWNSeNaBvr5F+GqsZuVhy9LMhR21BccZrDmYmYlG
	8+lssl0Ru0k/N+7ThW+HQqWYuQolqAbHZZcSoitSOCUbMv2GyhlcMVuB2dQtpWnJDrxg
	/WQWw6wse/56FpInTsigdnI1s3YTzpCsV6qSSEEBETdyAt3lGL6pq/8QKOt7CGMjKcna
	ZJBJtc1/5enOxQ5fG4Ob1M3FHl/RhZReXvUx7jFIvv5Jb9N1VQ+AVbuJJp9gefhkCuHf
	kRowxQcfomS6hBPQZguZF2aiRS205SCHQPQ1hGGxOR5SgWDUc7/6Zdl62pyplbL97QOE
	yTQA==
X-Received: by 10.68.99.197 with SMTP id es5mr6914980pbb.112.1440744440621;
	Thu, 27 Aug 2015 23:47:20 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:e943:4351:71e0:b332?
	([2601:646:8601:4580:e943:4351:71e0:b332])
	by smtp.gmail.com with ESMTPSA id c6sm4562847pat.13.2015.08.27.23.47.19
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Aug 2015 23:47:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <6CC83472A885EA4DB329C78841C52459131205DB@VF2WDEXMB3.verifone.com>
Date: Thu, 27 Aug 2015 23:47:13 -0700
Message-Id: <FE86B0D4-35C3-47CE-9996-5AE36D3BEE63@gmail.com>
References: <6CC83472A885EA4DB329C78841C52459131205DB@VF2WDEXMB3.verifone.com>
To: Nageswari Srinivasan <NageswariS1@VERIFONE.com>
X-Mailer: Apple Mail (2.2104)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: STAGING_KERNEL_DIR not populated with kernel source
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
X-List-Received-Date: Fri, 28 Aug 2015 06:47:23 -0000
X-Groupsio-MsgNum: 70205
Content-Type: multipart/signed;
	boundary="Apple-Mail=_248B9328-2D15-43C0-BE5D-1A429FD99CA5";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_248B9328-2D15-43C0-BE5D-1A429FD99CA5
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_35914B52-828F-4951-A0A8-EED47904A0B9"

--Apple-Mail=_35914B52-828F-4951-A0A8-EED47904A0B9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


> On Aug 26, 2015, at 4:33 AM, Nageswari Srinivasan =
<NageswariS1@VERIFONE.com> wrote:
>=20
> Hi,
>=20
> While migrating my current build to fido,  STAGING_KERNEL_DIR  is not =
getting populated with kernel sources so  custom module builds are =
failing?
>=20
> Any pointers here?
>=20

you should be able to use STAGING_KERNEL_BUILDDIR

> regards,
> Nageswari
>=20
>=20
> This electronic message, including attachments, is intended only for =
the use of the individual or company named above or to which it is =
addressed. The information contained in this message shall be considered =
confidential and proprietary, and may include confidential work product. =
If you are not the intended recipient, please be aware that any =
unauthorized use, dissemination, distribution or copying of this message =
is strictly prohibited. If you have received this email in error, please =
notify the sender by replying to this message and deleting this email =
immediately. --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>

--Apple-Mail=_35914B52-828F-4951-A0A8-EED47904A0B9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Diso-8859-1"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Aug 26, 2015, at 4:33 AM, Nageswari Srinivasan &lt;<a =
href=3D"mailto:NageswariS1@VERIFONE.com" =
class=3D"">NageswariS1@VERIFONE.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
style=3D"font-size: 10pt; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; direction: ltr; font-family: Tahoma;" =
class=3D"">Hi,<br class=3D""><br class=3D"">While migrating my current =
build to fido,&nbsp; STAGING_KERNEL_DIR&nbsp; is not getting populated =
with kernel sources so&nbsp; custom module builds are failing?<br =
class=3D""><br class=3D"">Any pointers here?<br class=3D""><br =
class=3D""></div></div></blockquote><div><br class=3D""></div><div>you =
should be able to use STAGING_KERNEL_BUILDDIR</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
style=3D"font-size: 10pt; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; direction: ltr; font-family: Tahoma;" =
class=3D"">regards,<br class=3D"">Nageswari<br class=3D""><br =
class=3D""><br class=3D""></div><hr style=3D"font-family: Helvetica; =
font-size: 13px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><font face=3D"VERDANA" color=3D"GRAY" size=3D"2" =
style=3D"font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D"">This electronic message, including attachments, is intended =
only for the use of the individual or company named above or to which it =
is addressed. The information contained in this message shall be =
considered confidential and proprietary, and may include confidential =
work product. If you are not the intended recipient, please be aware =
that any unauthorized use, dissemination, distribution or copying of =
this message is strictly prohibited. If you have received this email in =
error, please notify the sender by replying to this message and deleting =
this email immediately.</font><span style=3D"font-family: Helvetica; =
font-size: 13px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D""><span =
class=3D"Apple-converted-space">&nbsp;</span>--<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" =
class=3D"">_______________________________________________</span><br =
style=3D"font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Openembedded-core mailing list</span><br =
style=3D"font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
style=3D"font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
style=3D"font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
style=3D"font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e</a></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_35914B52-828F-4951-A0A8-EED47904A0B9--

--Apple-Mail=_248B9328-2D15-43C0-BE5D-1A429FD99CA5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXgA/YACgkQuwUzVZGdMxTmLACgh/XFwVC7TKiH0KViO9+TpONu
DwAAn0ZiqS9VbySHri/WRH0iSaKd8jIp
=PBv4
-----END PGP SIGNATURE-----

--Apple-Mail=_248B9328-2D15-43C0-BE5D-1A429FD99CA5--
