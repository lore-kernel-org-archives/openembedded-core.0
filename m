Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF0F62137
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 19:01:57 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id c189so9188746pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 12:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=UzhplqlCoxpD6CnVEtNmQ5DCHPME3r7C4v3vlQLIRXw=;
	b=uGr5ouCVJf+F7x4JpKJkVPui61+ynG1d6Tt5hHQFfBCDUT0QoZfqXdD3f8LjoikNyx
	i9Zyj3pNolrx0WX+lwqZ2StxW5L1YHIwUuB0iOsfAGvuQbfaoUb0XeP3ASCmPc/ATPv+
	QRSnR9Y949EHn7ai9z56eOgp0MAbKjP8qCAEjlvL2Rm3bJumn3cDbkx7Jy49PEU1ijek
	SXdhoZhLbbdHg2Guq4PjeuHHDw+K+oFUAq4LgORHHhrNDmLNjTiDnYAYDDaRmquGb06o
	7+mZ+1fkbeL0ZxhJJTU0A2DCCNlOv+4vmLVs7SlA4oLyjcS1tcL2kFjATE3rtPKkGet6
	BchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=UzhplqlCoxpD6CnVEtNmQ5DCHPME3r7C4v3vlQLIRXw=;
	b=MV5o5Jp0zJw/5m76DItuumzybWnp3N+wUieIHx3lEJqLvvS5kNhiEr6p7dIhVpta+u
	zznRfatoC/DiyDmc3+t0VO62vJPAYpNdi7vlP0xoqd2jGaJHsFzmjoM/PefjFfHH0q52
	7IyiQuV/nF12IsoDyP2VTgqVZm39uuiBI+o2/Mkf259AyFee9+7H4aQkOdt1iP8Cj5+Y
	HvUCaTrZ9+bex+LAFLey8seC/6b/MUdrDxP3E72oyqiwiXXfifPCfbsmoXaw7ek2qOrm
	rdzvGe8n0BYfkKnLueWfUyR5IWu1+NXpEuHJ6ljwKPAqdPrlg2DanRaSHyz/sJmcPWx0
	u6Pw==
X-Gm-Message-State: AOPr4FWrOkz2DYG0N6qhDaup+bOfDeAvl0i/WpQeIXRdX9+57DtJtQBbtea2MlmQcEyyOA==
X-Received: by 10.98.90.7 with SMTP id o7mr60713543pfb.110.1462906917939;
	Tue, 10 May 2016 12:01:57 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:5c9e:1d92:71:ee77?
	([2601:646:8800:5a9a:5c9e:1d92:71:ee77])
	by smtp.gmail.com with ESMTPSA id
	zs16sm6292158pab.13.2016.05.10.12.01.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2016 12:01:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <VI1PR04MB1583BDC40DA6D580FE8F6C3591710@VI1PR04MB1583.eurprd04.prod.outlook.com>
Date: Tue, 10 May 2016 12:02:10 -0700
Message-Id: <02AD60DD-1B28-43A5-B5AD-8755233AA005@gmail.com>
References: <VI1PR04MB1583BDC40DA6D580FE8F6C3591710@VI1PR04MB1583.eurprd04.prod.outlook.com>
To: Neena Busireddy <neenareddy.busireddy@nxp.com>
X-Mailer: Apple Mail (2.3124)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: proposal: replace GLUT with FreeGLUT
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
X-List-Received-Date: Tue, 10 May 2016 19:01:57 -0000
X-Groupsio-MsgNum: 81819
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C5CE991B-5B7C-460F-A7DC-64B05C09330E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C5CE991B-5B7C-460F-A7DC-64B05C09330E
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_8C2B7B4F-3C91-4B17-A60B-0DECBAB701BE"

--Apple-Mail=_8C2B7B4F-3C91-4B17-A60B-0DECBAB701BE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 10, 2016, at 11:12 AM, Neena Busireddy =
<neenareddy.busireddy@nxp.com> wrote:
>=20
> Hello,
>=20
> GLUT is dead upstream for almost three years now ( =
https://cgit.freedesktop.org/mesa/glut/ =
<https://cgit.freedesktop.org/mesa/glut/>  ) and it makes sense to =
replace GLUT with FreeGLUT .
> Some of the reasons to replace with FreeGLUT are listed here :
> http://freeglut.sourceforge.net/ <http://freeglut.sourceforge.net/>
>=20
> Also, current mesa-glut recipe does not generate GLUT library. I =
tested this when I enabled GLUT in mesa-demos.
>=20
> I discussed this issue with Otavio and he suggested to replace GLUT =
with FreeGLUT and upgrade mesa-demos to 8.3.
>=20
> Any suggestions or thoughts?

This is a good move. other distros use freeglut too so you can drive =
some stability out of that
>=20
>=20
> Thanks,
> Neena
>=20
>=20
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>

--Apple-Mail=_8C2B7B4F-3C91-4B17-A60B-0DECBAB701BE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On May 10, 2016, at 11:12 AM, Neena Busireddy &lt;<a =
href=3D"mailto:neenareddy.busireddy@nxp.com" =
class=3D"">neenareddy.busireddy@nxp.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"WordSection1" style=3D"page: WordSection1; font-family: Ubuntu; =
font-size: 14px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D"">Hello,<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D""><o:p class=3D"">&nbsp;</o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D"">GLUT is dead upstream for almost three =
years now (<span class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"https://cgit.freedesktop.org/mesa/glut/" style=3D"color: purple; =
text-decoration: underline;" =
class=3D"">https://cgit.freedesktop.org/mesa/glut/</a>&nbsp; ) and it =
makes sense to replace GLUT with FreeGLUT .<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D"">Some of =
the reasons to replace with FreeGLUT are listed here :<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D""><a =
href=3D"http://freeglut.sourceforge.net/" style=3D"color: purple; =
text-decoration: underline;" =
class=3D"">http://freeglut.sourceforge.net/</a><o:p =
class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D""><o:p =
class=3D"">&nbsp;</o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D"">Also, =
current mesa-glut recipe does not generate GLUT library. I tested this =
when I enabled GLUT in mesa-demos.<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D""><o:p class=3D"">&nbsp;</o:p></div><div =
style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: =
Calibri, sans-serif;" class=3D"">I discussed this issue with Otavio and =
he suggested to replace GLUT with FreeGLUT and upgrade mesa-demos to =
8.3.<o:p class=3D""></o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D""><o:p =
class=3D"">&nbsp;</o:p></div><div style=3D"margin: 0in 0in 0.0001pt; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D"">Any =
suggestions or thoughts?</div></div></div></blockquote><div><br =
class=3D""></div><div>This is a good move. other distros use freeglut =
too so you can drive some stability out of that&nbsp;</div><blockquote =
type=3D"cite" class=3D""><div class=3D""><div class=3D"WordSection1" =
style=3D"page: WordSection1; font-family: Ubuntu; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;"><div style=3D"margin: =
0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><o:p class=3D""></o:p></div><div style=3D"margin: 0in 0in =
0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><o:p class=3D"">&nbsp;</o:p></div><div style=3D"margin: 0in =
0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><o:p class=3D"">&nbsp;</o:p></div><div style=3D"margin: 0in =
0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">Thanks,<o:p class=3D""></o:p></div><div style=3D"margin: 0in =
0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">Neena<o:p class=3D""></o:p></div><div style=3D"margin: 0in =
0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><o:p class=3D"">&nbsp;</o:p></div><div style=3D"margin: 0in =
0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><o:p class=3D"">&nbsp;</o:p></div><div style=3D"margin: 0in =
0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><o:p class=3D"">&nbsp;</o:p></div><div style=3D"margin: 0in =
0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D""><o:p class=3D"">&nbsp;</o:p></div></div><span =
style=3D"font-family: Ubuntu; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">--<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"font-family: Ubuntu; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Ubuntu; font-size: 14px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" =
class=3D"">_______________________________________________</span><br =
style=3D"font-family: Ubuntu; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Ubuntu; font-size: 14px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">Openembedded-core mailing =
list</span><br style=3D"font-family: Ubuntu; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" style=3D"color: =
purple; text-decoration: underline; font-family: Ubuntu; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
style=3D"font-family: Ubuntu; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
style=3D"color: purple; text-decoration: underline; font-family: Ubuntu; =
font-size: 14px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e</a></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_8C2B7B4F-3C91-4B17-A60B-0DECBAB701BE--

--Apple-Mail=_C5CE991B-5B7C-460F-A7DC-64B05C09330E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcyMDUACgkQuwUzVZGdMxSOOwCeNb7cbqUbHGH2zapKxVE8SAJ0
vWIAn3YndaTpoIhJzEE1Hd/0tBeftWz7
=xard
-----END PGP SIGNATURE-----

--Apple-Mail=_C5CE991B-5B7C-460F-A7DC-64B05C09330E--
