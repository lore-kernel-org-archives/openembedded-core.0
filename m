Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id DE29A75733
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 19:51:45 +0000 (UTC)
Received: by qkoo18 with SMTP id o18so12154650qko.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 12:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=4Kj4375OOfRk9Hwi4TzCDpZEtNMd/H0CsTcUK5uHbWg=;
	b=AB5t8LvEb84hRJX3iOVD5QhPxcZTRXEh2yA4aDXHl5QHd/0Ay8ZAEflJUMT1q3hXzH
	YWDAgTwBYGI3bB4tJdHhQsLDRzi0q1nskJShbqNvY9G5pJo+f1fna3C+Dt+Ut8wzIX/M
	pzxzrIlKEn+Rog+w9JcNrpXKyTIZP4rZPK5gEgahHDatJjVDgLFM2G7ml6COoCNh55eA
	APgJc78yJYT/6r6xdXeyqPBvc9P/baVCyk3IeosBQY031SWzPXhBVvo5sgejMP9I3ltU
	8ZMUKoe6YMJRhAwhPE2da4dFypBdzTf7Q13cg7TPlebcKQ/D467DMjiXbUUJqXB3tD3u
	IEDQ==
X-Received: by 10.55.17.79 with SMTP id b76mr62893872qkh.70.1433361106578;
	Wed, 03 Jun 2015 12:51:46 -0700 (PDT)
Received: from cacsvmo-14452.hsd1.ca.comcast.net
	(c-24-130-225-169.hsd1.ca.comcast.net. [24.130.225.169])
	by mx.google.com with ESMTPSA id l81sm974372qhl.24.2015.06.03.12.51.45
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Jun 2015 12:51:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LafGz=hMpwRh7G6+NkRO8b=kB7vMjhVfXAC2OMS0EE==A@mail.gmail.com>
Date: Wed, 3 Jun 2015 12:51:44 -0700
Message-Id: <6EDDDC39-6F91-4B83-B1CD-2EBE287CF37D@gmail.com>
References: <cover.1433349512.git.raj.khem@gmail.com>
	<0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
	<CAJTo0LanFDJR+AteOHRQ5hNd0T9bMNAa+Z4b9xfZe2kdP+28aA@mail.gmail.com>
	<CAMKF1spaRQoh1_uEFOOFN9fOwAwEdRXC8pqusSvzfVpPs9hU_A@mail.gmail.com>
	<CAJTo0LafGz=hMpwRh7G6+NkRO8b=kB7vMjhVfXAC2OMS0EE==A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2098)
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 03 Jun 2015 19:51:46 -0000
X-Groupsio-MsgNum: 66282
Content-Type: multipart/signed;
	boundary="Apple-Mail=_76989FBC-8825-45C7-952C-13AEBB4E3D7E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_76989FBC-8825-45C7-952C-13AEBB4E3D7E
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_A8A853FA-7E38-4A66-A596-AA1438DE45D6"

--Apple-Mail=_A8A853FA-7E38-4A66-A596-AA1438DE45D6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 3, 2015, at 11:56 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
> Upgrading the Wayland protocol is independent from upgrading Weston.  =
libinput can be upgraded independently of Weston.  They have an implied =
ordering (wayland before weston, libinput before weston) but they're not =
single unit.
>=20

I will send it that way, however, I am thinking from bisecting purpose =
at meta level.

--Apple-Mail=_A8A853FA-7E38-4A66-A596-AA1438DE45D6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jun 3, 2015, at 11:56 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
style=3D"font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D"">Upgrading the Wayland =
protocol is independent from upgrading Weston. &nbsp;libinput can be =
upgraded independently of Weston.&nbsp; They have an implied ordering =
(wayland before weston, libinput before weston) but they're not single =
unit.</div><br =
class=3D"Apple-interchange-newline"></div></blockquote></div><br =
class=3D""><div class=3D"">I will send it that way, however, I am =
thinking from bisecting purpose at meta level.&nbsp;</div></body></html>=

--Apple-Mail=_A8A853FA-7E38-4A66-A596-AA1438DE45D6--

--Apple-Mail=_76989FBC-8825-45C7-952C-13AEBB4E3D7E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVvWtAACgkQuwUzVZGdMxRp/ACfcJpinLbvdpW7EJu+ItwDypro
RFkAn2aP5dNXK67QNXMhFDzlTcVmQ4sR
=+ik9
-----END PGP SIGNATURE-----

--Apple-Mail=_76989FBC-8825-45C7-952C-13AEBB4E3D7E--
