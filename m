Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4BA0473286
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:23:04 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id n128so8059491pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=3Ut4NbXf3GCicjJkZgGAUqpR7MuJtCeZXuIacJpoCsM=;
	b=WvZoav4qbhQ//nIj1OfN/yocV+jB7kHCQpvJ7tHZzkgPttnF8XGZaDWs2MokFSweu6
	yBsgJeZ8YRuA9oNw79zMKPwRZLqHHgzKc13yM7vj+efzexmjc8u1BEp2NM5GT1w07Q4R
	7j3IdK3i6+sVwdUHoj5WKwwIaFw8v3AkpZcHYNs5r+5tLB8JYZ+Inv3AuPX9l+99EQJm
	fa71MtGGpLAjIAuCaq0JdyrwKxntH1nsYFpZD6HMaWFBUAMoYprnSUbDjeDFiwpa0kAX
	PS5HmcBR1ZRgB1GRRr3pUYjjAPfvJZ+AUqS0zoIXuCvumB87QaJi+D4CMA7zsZEIn1GU
	vKeA==
X-Received: by 10.98.71.73 with SMTP id u70mr3202487pfa.130.1452248585931;
	Fri, 08 Jan 2016 02:23:05 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:4934:16a1:ccba:482b?
	([2601:646:8802:5d5c:4934:16a1:ccba:482b])
	by smtp.gmail.com with ESMTPSA id
	w22sm1885000pfa.79.2016.01.08.02.23.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jan 2016 02:23:05 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LaOj_UtSr4hDo5YSR+HVFwaaQsuz6H+_sK6kS=Niuy-WQ@mail.gmail.com>
Date: Fri, 8 Jan 2016 02:23:00 -0800
Message-Id: <3242BCB4-E372-44E9-BA34-8A2C75FAEB78@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
	<8b25bbe0ade4a8c4eeb058ff0f9e3fd02cddf891.1450568936.git.raj.khem@gmail.com>
	<CAJTo0LaOj_UtSr4hDo5YSR+HVFwaaQsuz6H+_sK6kS=Niuy-WQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/17] xserver-xorg: Fix build with musl
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
X-List-Received-Date: Fri, 08 Jan 2016 10:23:07 -0000
X-Groupsio-MsgNum: 75700
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D5AC1C36-7ECC-487C-876E-98C822D990FC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D5AC1C36-7ECC-487C-876E-98C822D990FC
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_574C791F-D37C-4931-86E4-7DE71E99BBFA"

--Apple-Mail=_574C791F-D37C-4931-86E4-7DE71E99BBFA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 8, 2016, at 2:10 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 19 December 2015 at 23:52, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> inb/outb are implemented for ARM on glibc but not on linux in general
> therefore the conditional has to reflect that
>=20
> Untestable as libdrm fails to build with musl:
>=20
> | =
/data/poky-master/tmp/work/corei7-64-poky-linux-musl/libdrm/2.4.65-r0/libd=
rm-2.4.65/xf86drm.c: In function 'drmParseSubsystemType':
> | =
/data/poky-master/tmp/work/corei7-64-poky-linux-musl/libdrm/2.4.65-r0/libd=
rm-2.4.65/xf86drm.c:2840:15: error: 'PATH_MAX' undeclared (first use in =
this function)
> |      char link[PATH_MAX + 1] =3D "";
>=20
> Ross


Ignore this, I have send a new pull request just now which should fix =
it.

--Apple-Mail=_574C791F-D37C-4931-86E4-7DE71E99BBFA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jan 8, 2016, at 2:10 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 19 December 2015 at 23:52, Khem Raj <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div id=3D":5ns" class=3D"" =
style=3D"overflow:hidden">inb/outb are implemented for ARM on glibc but =
not on linux in general<br class=3D"">
therefore the conditional has to reflect that<br =
class=3D""></div></blockquote></div><br class=3D"">Untestable as libdrm =
fails to build with musl:</div><div class=3D"gmail_extra"><br =
class=3D""></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">| =
/data/poky-master/tmp/work/corei7-64-poky-linux-musl/libdrm/2.4.65-r0/libd=
rm-2.4.65/xf86drm.c: In function 'drmParseSubsystemType':</div><div =
class=3D"gmail_extra">| =
/data/poky-master/tmp/work/corei7-64-poky-linux-musl/libdrm/2.4.65-r0/libd=
rm-2.4.65/xf86drm.c:2840:15: error: 'PATH_MAX' undeclared (first use in =
this function)</div><div class=3D"gmail_extra">| &nbsp; &nbsp; =
&nbsp;char link[PATH_MAX + 1] =3D "";</div><div class=3D"gmail_extra"><br =
class=3D""></div><div class=3D"gmail_extra">Ross</div></div></div>
</div></blockquote></div><br class=3D""><div class=3D""><br =
class=3D""></div><div class=3D"">Ignore this, I have send a new pull =
request just now which should fix it.</div></body></html>=

--Apple-Mail=_574C791F-D37C-4931-86E4-7DE71E99BBFA--

--Apple-Mail=_D5AC1C36-7ECC-487C-876E-98C822D990FC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaPjggACgkQuwUzVZGdMxTF1QCdHCa+kcONg7zxPVrDooTNLOSv
HMMAnjdObYA3aq6RXhmg4qkXzfiA0xR7
=Zifu
-----END PGP SIGNATURE-----

--Apple-Mail=_D5AC1C36-7ECC-487C-876E-98C822D990FC--
