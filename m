Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7D5186BB5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 17:02:03 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id f81so3039710wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 09:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=cSQy8Mebet9rb2cQ8Q5H7uKQJf2AARxGGehacqmVnww=;
	b=kXp8XHeEAVPK9K9ZDMSnXK1UUIoG2YrlmQWJzyAYr9Tt/+wB/CVY1FMcWHDzbXr8H6
	6lalhT72ljqFFfTE/dB91DjExwQtxa8VLCH4AXXH0hiQtnvPG8myM4RwexMrOmdP/Gf5
	YryRxFlP5RQuGfvP/Uw2i/nkMkEutypVTUtYbknw/6CZ7zJkpZKEXpplos3JbSI4L1Xg
	0HlV9aEpolne1K57A5S5wYfjZmIapCsbJ8ynnxCGGV++DYgH6Gfc/g05YAvxuiZ4JyIJ
	GLlzHIZrrnWeXSTKd4MtpGfy7uaDrAW4SnZ/L1PrSPrid4LjUyDkHz6HbtfE+K1/cqYY
	JxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=cSQy8Mebet9rb2cQ8Q5H7uKQJf2AARxGGehacqmVnww=;
	b=h6dHsMHfNPtLusORSc7HYx0tNqOTXVadQvPRWhH4PQdypJOZRHVkykUOdWzcRcUx6/
	oTZGlLKw9R0x4HKsGvOsBCk6lqmHFQcbn0qBhM86yrxQaX1lL8zVVXg1hO9dlKOqKowo
	mIMvB9BMvT7mnKarZZwoX5+zoswBfNH2MRsX5VQzXQwnk2K0A3tmpwm+lmseXvtElDcF
	XWRKdDPqfIpzsiC0gVhIHzeaNJjPgX6iCHTgGjEX3sfManxRIjRbI6nLFtiLEQFixwyr
	kUMAR8Wd+dXTjNWlNNSKpZ2Dqou7KZ5WBGJmX/MTgyIJS9FKKWy6NMvChsd3EiBSSVRx
	AZpQ==
X-Gm-Message-State: AA+aEWbAXgQd28QTYzGkI3sYMyxOxUUl7oM0g24kfRTRv+tnsQ0Ml48p
	Fk5+f2L0zLffk6e8oF6oeOA=
X-Google-Smtp-Source: AFSGD/VAJmAfHuP2nsn2Y59fwCavPdI3VaNQgxgBQGvu4XhbtFz9KvJuuL3DeTJv/uiT2AZMsy9UNw==
X-Received: by 2002:a1c:6e01:: with SMTP id j1mr3044435wmc.103.1544547724120; 
	Tue, 11 Dec 2018 09:02:04 -0800 (PST)
Received: from [10.42.8.217] (b2b-78-94-80-58.unitymedia.biz. [78.94.80.58])
	by smtp.gmail.com with ESMTPSA id
	c129sm269944wma.48.2018.12.11.09.02.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Dec 2018 09:02:03 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <28042577-6739-48F8-B887-96E2335772B4@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Date: Tue, 11 Dec 2018 18:02:02 +0100
In-Reply-To: <CAJTo0LZD=NP_yqmJN0XLy9PikqnxdS2FdpWwpGk46aAcKVUucg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
References: <20181128081530.31125-1-sno@netbsd.org>
	<CAJTo0LZD=NP_yqmJN0XLy9PikqnxdS2FdpWwpGk46aAcKVUucg@mail.gmail.com>
X-Mailer: Apple Mail (2.3445.102.3)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] avahi: avoid depending on skipped package
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
X-List-Received-Date: Tue, 11 Dec 2018 17:02:04 -0000
X-Groupsio-MsgNum: 119053
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B467B970-E534-493A-A1FB-0116DAEC395E";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_B467B970-E534-493A-A1FB-0116DAEC395E
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_7F45D86B-EAE1-45C8-B1B6-E4D0C102C154"

--Apple-Mail=_7F45D86B-EAE1-45C8-B1B6-E4D0C102C154
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Yes, for name-resolution via zeroconf.

> Am 28.11.2018 um 12:20 schrieb Burton, Ross <ross.burton@intel.com>:
>=20
> Is Avahi actually useful without DBus?
>=20
> This reminds me that I've been wanting to gut that recipe for a long =
time now...
>=20
> Ross
> On Wed, 28 Nov 2018 at 08:16, Jens Rehsack <sno@netbsd.org> wrote:
>>=20
>> When built without D-Bus, libavahi-client is not build:
>>  Building libavahi-client:           no   (You need avahi-daemon and =
D-Bus!)
>> which causes avahi-dev RDEPENDS failing when creating an image
>> containing development-tools:
>> *   - nothing provides libavahi-client =3D 0.7-r0 needed by =
avahi-dev-0.7-r0.cortexa8hf-neon
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>> meta/recipes-connectivity/avahi/avahi_0.7.bb | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-connectivity/avahi/avahi_0.7.bb =
b/meta/recipes-connectivity/avahi/avahi_0.7.bb
>> index 3d5f334a88..2e04d304c7 100644
>> --- a/meta/recipes-connectivity/avahi/avahi_0.7.bb
>> +++ b/meta/recipes-connectivity/avahi/avahi_0.7.bb
>> @@ -38,7 +38,8 @@ FILES_libavahi-glib =3D =
"${libdir}/libavahi-glib.so.*"
>> FILES_libavahi-gobject =3D "${libdir}/libavahi-gobject.so.*  =
${libdir}/girepository-1.0/Avahi*.typelib"
>> FILES_avahi-utils =3D "${bindir}/avahi-*"
>>=20
>> -RDEPENDS_${PN}-dev =3D "avahi-daemon (=3D ${EXTENDPKGV}) =
libavahi-core (=3D ${EXTENDPKGV}) libavahi-client (=3D ${EXTENDPKGV})"
>> +RDEPENDS_${PN}-dev =3D "avahi-daemon (=3D ${EXTENDPKGV}) =
libavahi-core (=3D ${EXTENDPKGV})"
>> +RDEPENDS_${PN}-dev +=3D "${@["", " libavahi-client (=3D =
${EXTENDPKGV})"][bb.utils.contains('PACKAGECONFIG', 'dbus', 1, 0, d)]}"
>>=20
>> RRECOMMENDS_avahi-daemon_append_libc-glibc =3D " libnss-mdns"
>>=20
>> --
>> 2.17.1
>>=20
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_7F45D86B-EAE1-45C8-B1B6-E4D0C102C154
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Yes, =
for name-resolution via zeroconf.<br class=3D""><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">Am =
28.11.2018 um 12:20 schrieb Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Is =
Avahi actually useful without DBus?<br class=3D""><br class=3D"">This =
reminds me that I've been wanting to gut that recipe for a long time =
now...<br class=3D""><br class=3D"">Ross<br class=3D"">On Wed, 28 Nov =
2018 at 08:16, Jens Rehsack &lt;<a href=3D"mailto:sno@netbsd.org" =
class=3D"">sno@netbsd.org</a>&gt; wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D""><br class=3D"">When built without D-Bus, =
libavahi-client is not build:<br class=3D""> &nbsp;Building =
libavahi-client: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;no =
&nbsp;&nbsp;(You need avahi-daemon and D-Bus!)<br class=3D"">which =
causes avahi-dev RDEPENDS failing when creating an image<br =
class=3D"">containing development-tools:<br class=3D""> * &nbsp;&nbsp;- =
nothing provides libavahi-client =3D 0.7-r0 needed by =
avahi-dev-0.7-r0.cortexa8hf-neon<br class=3D""><br =
class=3D"">Signed-off-by: Jens Rehsack &lt;<a =
href=3D"mailto:sno@netbsd.org" class=3D"">sno@netbsd.org</a>&gt;<br =
class=3D"">---<br class=3D""> =
meta/recipes-connectivity/avahi/avahi_0.7.bb | 3 ++-<br class=3D""> 1 =
file changed, 2 insertions(+), 1 deletion(-)<br class=3D""><br =
class=3D"">diff --git a/meta/recipes-connectivity/avahi/avahi_0.7.bb =
b/meta/recipes-connectivity/avahi/avahi_0.7.bb<br class=3D"">index =
3d5f334a88..2e04d304c7 100644<br class=3D"">--- =
a/meta/recipes-connectivity/avahi/avahi_0.7.bb<br class=3D"">+++ =
b/meta/recipes-connectivity/avahi/avahi_0.7.bb<br class=3D"">@@ -38,7 =
+38,8 @@ FILES_libavahi-glib =3D "${libdir}/libavahi-glib.so.*"<br =
class=3D""> FILES_libavahi-gobject =3D "${libdir}/libavahi-gobject.so.* =
&nbsp;${libdir}/girepository-1.0/Avahi*.typelib"<br class=3D""> =
FILES_avahi-utils =3D "${bindir}/avahi-*"<br class=3D""><br =
class=3D"">-RDEPENDS_${PN}-dev =3D "avahi-daemon (=3D ${EXTENDPKGV}) =
libavahi-core (=3D ${EXTENDPKGV}) libavahi-client (=3D =
${EXTENDPKGV})"<br class=3D"">+RDEPENDS_${PN}-dev =3D "avahi-daemon (=3D =
${EXTENDPKGV}) libavahi-core (=3D ${EXTENDPKGV})"<br =
class=3D"">+RDEPENDS_${PN}-dev +=3D "${@["", " libavahi-client (=3D =
${EXTENDPKGV})"][bb.utils.contains('PACKAGECONFIG', 'dbus', 1, 0, =
d)]}"<br class=3D""><br class=3D""> =
RRECOMMENDS_avahi-daemon_append_libc-glibc =3D " libnss-mdns"<br =
class=3D""><br class=3D"">--<br class=3D"">2.17.1<br class=3D""><br =
class=3D"">--<br =
class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></blockquote></div></div></blockquote></div><br =
class=3D""><div class=3D"">
<div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; orphans: =
auto; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">--&nbsp;</div><div class=3D"">Jens Rehsack - =
<a href=3D"mailto:rehsack@gmail.com" =
class=3D"">rehsack@gmail.com</a></div></div></div>
</div>
<br class=3D""></body></html>=

--Apple-Mail=_7F45D86B-EAE1-45C8-B1B6-E4D0C102C154--

--Apple-Mail=_B467B970-E534-493A-A1FB-0116DAEC395E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlwP7YoACgkQRJmWrtzl
Cp2GYw//dTpnJSVoyG73JZu/Nk3vHTwT+w08dVDKocgfx0JLI4NX+dTbg5d2Iz95
kcT4ISa61PDAckBRgSO8qOvRxUvVlwkyL3YNRgHC1QiPBcp/DYnlKpPCSnMvcE8S
z60To2irFiaCEiavm/tQcP6uP4K2ieMnPqZiEMekpJ9JUywAB9sgyJcFFym7EZ7V
jtAlT6a3uDL9UNOeRsMKSzCFY4DNo0EWem/15KNdLNKiiTulzJ+lHTHHhqFeThsD
9d1r1F0wFI/WMFf4NufUziyMmYectrB+LSfjX6OAUQklJoHgxsp/LPT6yX39JYkJ
B8CfzBWTpCvo7wS0MMyyvdUyNRqckHn7kiPcdU4RUNrqK6X2M9yHM4XiQZMziJ9K
LeUWRTbHxFy5GOZ1UopGOMVPRUAUIAge0Vgw+cQPbb1Suy+O1jBuChwxaovE4ymc
YZqse3U1fTJJ+gZRM5h0VmUtSC0IeORdgHTW0h9YPHiEanaF3bzq53C+gR7Snvyq
qiCoZ+sBQlLkq8i0igDP8H7PksGhWfEN7hrShR/DXeiQnvpmGZg+cSk1ZtYR7NHw
aSPor1JryC8ukF94xzKOFBJgKUV8sHzwxOTmg4MUYbArnZj1dTyBToOdxGls9rKq
sUudkbaf/PzbrkAsXIMdKUsndfFS/mpRBKTUEnl4QDKOUB+8/s8=
=fPK0
-----END PGP SIGNATURE-----

--Apple-Mail=_B467B970-E534-493A-A1FB-0116DAEC395E--
