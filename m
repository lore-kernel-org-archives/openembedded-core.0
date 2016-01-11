Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 70793731DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 18:15:46 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id yy13so232305170pab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 10:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=zC4YB75o8ldylEmHce1U7xEX4Z+8RVQi1s+W7F46FhM=;
	b=ph/7rJnHp4TbAC5Xo74yhAOAN3/mdAN6bX9MxHaO9KqQc7y6NOyXSH8wCamTpCmpLY
	ZlvSNZ/6LtKgHi8lGqNN6pEZ+F9hxCAEZxsfluWY4JjLTyM7fkTcKGB05SUlReBhdNkv
	pLXuE1R5QvnKNVpJsiiMVvEXQ2OWlDBMbHLSDqwYw+C6+j+tIAcBrIUfRd7Znn0r67dU
	wpNukLe60D3k8dInrku1NHE/G01Y68ijVyJIQCFK+s9VdsSTvTrcLcxo3XHhQhebOGE3
	GN6qPkkVukhgCW5Ap7d/mtBj3rS+Zq1QKhIj09SXCNuEoIx02UN6twuK6+3hHOtwUTtu
	1vtA==
X-Received: by 10.66.216.7 with SMTP id om7mr180974569pac.90.1452536147859;
	Mon, 11 Jan 2016 10:15:47 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:d5b:ee56:59f:5eeb?
	([2601:646:8802:5d5c:d5b:ee56:59f:5eeb])
	by smtp.gmail.com with ESMTPSA id
	dz12sm124185585pac.2.2016.01.11.10.15.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 10:15:47 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <DUB130-W1779730C543EF8ECE041E9DAC90@phx.gbl>
Date: Mon, 11 Jan 2016 10:15:45 -0800
Message-Id: <D84B77DD-57D3-4E8F-BE0F-0E2BB58AE8AF@gmail.com>
References: <DUB130-W1779730C543EF8ECE041E9DAC90@phx.gbl>
To: Chris Trobridge <christrobridge@hotmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Handliong Duplicate Files
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
X-List-Received-Date: Mon, 11 Jan 2016 18:15:47 -0000
X-Groupsio-MsgNum: 75859
Content-Type: multipart/signed;
	boundary="Apple-Mail=_94AB15FA-A234-49BB-B553-4A8FDF298B4B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_94AB15FA-A234-49BB-B553-4A8FDF298B4B
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_696B4ABD-75CF-4E34-A843-3DA12F6CDCD7"

--Apple-Mail=_696B4ABD-75CF-4E34-A843-3DA12F6CDCD7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


> On Jan 11, 2016, at 3:13 AM, Chris Trobridge =
<christrobridge@hotmail.com> wrote:
>=20
> Hi,
>=20
> I have been looking into producing a 'python3-dbus' recipe, based on =
the python-dbus recipe.
>=20
> This recipe outputs a couple of files that are version independent but =
end up overlapping and causing the build to fail:
> /usr/lib/pkgconfig/dbus-python.pc
> /usr/include/dbus-1.0/dbus/dbus-python.h

you can let one provide it and then delete it from other recipe but it =
means now you created a dependency also
second option is to install the files after renaming. e.g. =
dbus-python3.pc and dbus-python3.h
the may be you can use alternatives mechanism to symlink python3 =
versions to provide python2 versions as well
only if python2 is not installed.

>=20
> These files are currently marked as python-version independent - the =
header file has #ifdefs for python3.
>=20
> The immediate 'fix' was to follow the advice in the error text to add =
the file paths to SSTATE_DUPWHITELIST.
>=20
> SSTATE_DUPWHITELIST is not mentioned much elsewhere and does not seem =
like a scalable solution.  Is there a preferred method to resolve the =
situation where two recipes install the same files?
>=20
> Thanks,
> Chris
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>

--Apple-Mail=_696B4ABD-75CF-4E34-A843-3DA12F6CDCD7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Diso-8859-1"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jan 11, 2016, at 3:13 AM, Chris Trobridge &lt;<a =
href=3D"mailto:christrobridge@hotmail.com" =
class=3D"">christrobridge@hotmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D"">Hi,<div class=3D""><br =
class=3D""></div><div class=3D"">I have been looking into producing a =
'python3-dbus' recipe, based on the&nbsp;python-dbus recipe.</div><div =
class=3D""><br class=3D""></div><div class=3D"">This recipe outputs a =
couple of files that are version independent but end up overlapping and =
causing the build to fail:</div><div class=3D""><div =
class=3D"">/usr/lib/pkgconfig/dbus-python.pc</div></div><div =
class=3D""><div =
class=3D"">/usr/include/dbus-1.0/dbus/dbus-python.h</div></div></div></div=
></blockquote><div><br class=3D""></div><div>you can let one provide it =
and then delete it from other recipe but it means now you created a =
dependency also</div><div>second option is to install the files after =
renaming. e.g. dbus-python3.pc and dbus-python3.h</div><div>the may be =
you can use alternatives mechanism to symlink python3 versions to =
provide python2 versions as well</div><div>only if python2 is not =
installed.</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div dir=3D"ltr" style=3D"font-family: Calibri; font-size: =
16px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><div =
class=3D""><br class=3D""></div><div class=3D"">These files are =
currently marked as python-version independent - the header file has =
#ifdefs for python3.</div><div class=3D""><br class=3D""></div><div =
class=3D"">The immediate 'fix' was to follow the advice in the error =
text to add the file paths to&nbsp;SSTATE_DUPWHITELIST.</div><div =
class=3D""><br class=3D""></div><div class=3D"">SSTATE_DUPWHITELIST is =
not mentioned much elsewhere and does not seem like a scalable solution. =
&nbsp;Is there a preferred method to resolve the situation where two =
recipes install the same files?</div><div class=3D""><br =
class=3D""></div><div class=3D"">Thanks,</div><div =
class=3D"">Chris</div><div class=3D""><br class=3D""></div></div><span =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">--<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Calibri; font-size: 16px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" =
class=3D"">_______________________________________________</span><br =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Calibri; font-size: 16px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">Openembedded-core mailing =
list</span><br style=3D"font-family: Calibri; font-size: 16px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e</a></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_696B4ABD-75CF-4E34-A843-3DA12F6CDCD7--

--Apple-Mail=_94AB15FA-A234-49BB-B553-4A8FDF298B4B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaT8VEACgkQuwUzVZGdMxR0IQCeMjvACXUrv7AqetJJDdnouMXh
uqkAoJOf/9Pj+avGSWK+NfwbGPXMsT1A
=mqCe
-----END PGP SIGNATURE-----

--Apple-Mail=_94AB15FA-A234-49BB-B553-4A8FDF298B4B--
