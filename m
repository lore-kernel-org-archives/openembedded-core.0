Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4E14465CBF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 01:40:12 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id pp5so15499385pac.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 18:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=yJL4NnL4rXF/64Vd282uhV2Vd1K9ZGSJoo5we05o/DI=;
	b=U8qx6ucfFK02a+aSMrQdnlA0rG9cSAQeVf/io9K/D2k5L3/m5NZEDfg0v1MOMupZeO
	pKaNLhgGNtnpjKbdBoIo8QeHZEqfkTRcuN7XL89UAtjM+SHQ/Nx9SXd/Ca/IuFgmRYZG
	rpnZEcKIEFz0C9Esgh4vziKqptA9IkoO5yrvVrI29ZJpWwIoy5+xedsS5fb82wGqBe94
	kh+rh17/s2540gJrQiemcLmZC9KCBj5HWG7YdLI4qBfNQjbrdUHvjoCG/pxuE2VR1rfl
	9Qp+R6OLl3SnUt02G9GCL5DlvqE/tDKPqrVay3laQS0WPIgfHDdwmFUsHxONHyE955Sz
	bOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=yJL4NnL4rXF/64Vd282uhV2Vd1K9ZGSJoo5we05o/DI=;
	b=RJdk5GPT+y4+BsspQ286DiP+SRHXduNQvvQzdW3IGVwi78Po34eNuLgu7b6IHAr0ne
	P8i0MpgSG9su8jc2zGSWXOj9nfbmHhNl/BxJbIS9BLDcA+4Eo9GhSIBSwJyvEzVF4Nwv
	kK1FxhUSy8tj6nLdb0tQRZP9CADWJdo6DX3bJk6sp5skDGiWErBEyBJnpfXOF6ecQtm9
	uzoYHCNASvCV0ureNjO3EEsRY6ZyL0T9DQiQia3hJbRcJlzPxqXoKqHilNerULuCnlVP
	4rL2sZU25IpR+18PHeRK+xRfNU/MsMtv9COTcp4ciOPee0UC4wqfhOvP1x+u3orP/qLG
	WkkA==
X-Gm-Message-State: AEkoousCEV3sHdz74NH5PPIUTO88ru/jfkQoJuuSWGpShtVHw1vZ4rQqV1dgh2uchH1iYA==
X-Received: by 10.66.83.194 with SMTP id s2mr1283619pay.33.1469670013575;
	Wed, 27 Jul 2016 18:40:13 -0700 (PDT)
Received: from [192.168.0.5] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	p14sm11970497par.32.2016.07.27.18.40.12
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jul 2016 18:40:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZxbYTwvv0ywOwaBSVxaCJ82TAejikPefPh1F+Q1zvFkQ@mail.gmail.com>
Date: Wed, 27 Jul 2016 18:40:08 -0700
Message-Id: <03C3A5A6-D337-4FFA-9013-79FCCD0E50A9@gmail.com>
References: <1469637177-2657-1-git-send-email-ross.burton@intel.com>
	<20160727170756.aridi4qzmmuyedyt@jama>
	<CAJTo0LZxbYTwvv0ywOwaBSVxaCJ82TAejikPefPh1F+Q1zvFkQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: add missing wayland-native dependency
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
X-List-Received-Date: Thu, 28 Jul 2016 01:40:14 -0000
X-Groupsio-MsgNum: 85039
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2CCC32DE-89D1-4831-8588-DA5EE9AA2710";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2CCC32DE-89D1-4831-8588-DA5EE9AA2710
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_2661F9EE-030A-4E42-A43D-16992542C9DF"

--Apple-Mail=_2661F9EE-030A-4E42-A43D-16992542C9DF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 27, 2016, at 12:51 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 27 July 2016 at 18:07, Martin Jansa <martin.jansa@gmail.com =
<mailto:martin.jansa@gmail.com>> wrote:
> On Wed, Jul 27, 2016 at 05:32:57PM +0100, Ross Burton wrote:
> > The wayland support requires wayland-scanner, so add a dependency on
> > wayland-native.
>=20
> Why is this needed when wayland already depends on wayland-native?
>=20
> Because builds from sstate won't pull in all the build dependencies =
transitively, just enough to do the required tasks. The requirements are =
the wayland runtime libraries (wayland) and the native tooling =
(waylaid-native).

Is it so that populate_sysroot tasks wont do the above two jobs ? if yes =
then why
If you are saying that behavior is different with or without sstate =
reuse if  I do
bitbake gstreamer1.0-plugins-bad, then I think there is a problem.  The =
entries changed here will
get added to DEPENDS in the end. So Martin has a point.

>=20
> Ross
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_2661F9EE-030A-4E42-A43D-16992542C9DF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jul 27, 2016, at 12:51 PM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 27 July 2016 at 18:07, Martin Jansa <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank" class=3D"">martin.jansa@gmail.com</a>&gt;</span> =
wrote:<br class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On =
Wed, Jul 27, 2016 at 05:32:57PM +0100, Ross Burton wrote:<br class=3D"">
&gt; The wayland support requires wayland-scanner, so add a dependency =
on<br class=3D"">
&gt; wayland-native.<br class=3D"">
<br class=3D"">
</span>Why is this needed when wayland already depends on =
wayland-native?<br class=3D""></blockquote><div class=3D""><br =
class=3D""></div><div class=3D"">Because builds from sstate won't pull =
in all the build dependencies transitively, just enough to do the =
required tasks. The requirements are the wayland runtime libraries =
(wayland) and the native tooling =
(waylaid-native).</div></div></div></div></div></blockquote><div><br =
class=3D""></div><div>Is it so that populate_sysroot tasks wont do the =
above two jobs ? if yes then why</div><div>If you are saying that =
behavior is different with or without sstate reuse if &nbsp;I =
do</div><div>bitbake&nbsp;gstreamer1.0-plugins-bad, then I think there =
is a problem. &nbsp;The entries changed here will</div><div>get added to =
DEPENDS in the end. So Martin has a point.</div><br class=3D""><blockquote=
 type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div=
 class=3D"gmail_extra"><div class=3D"gmail_quote"><div class=3D""><br =
class=3D""></div><div class=3D"">Ross&nbsp;</div></div><br =
class=3D""></div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_2661F9EE-030A-4E42-A43D-16992542C9DF--

--Apple-Mail=_2CCC32DE-89D1-4831-8588-DA5EE9AA2710
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleZYn0ACgkQuwUzVZGdMxSqOQCfQudn1yN86t7q5WKk3eHFWHao
X+YAmweZnqCQyyWzv4XbFtI6FHLkGY7R
=qJGc
-----END PGP SIGNATURE-----

--Apple-Mail=_2CCC32DE-89D1-4831-8588-DA5EE9AA2710--
