Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 39C3E6FF9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 18:06:27 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l126so74719016wml.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 10:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rK5gv5g26t/pHo2vVwu0aMDBrEEGAm2SOGbGtL7Hm9A=;
	b=dJT9MihsdCcCkvQLTMuyV5nIwAzhaMAk0HEWBz2BJxzVMa9jB4nxqUBxznoq2NoEBy
	UnzH+76Yd5GG8jiDh6UB9lgeQ2LWPMlESeRqtL6Mxl4O03HiHjWEPo0Efff+v+AtyckH
	InFoqbb3YtGPBv5IPQUUuUVi3XrBeaWKnNkNquVmR0nU3gpM1IHbg8K79X/vG1ZAzscA
	ra7t0L2gj8ZC38U9lFE5tdW4C15nq82Yx90agixP5ymWH9xuZ5gtbalLnfnwnxcbyoxY
	IPqQbniSvD5ZwuPtpNZHhbVgvvAuqCUgvsiRTyY19sfxp9rbxrZIaOeUmNKzVn82Yr7J
	XCmw==
X-Received: by 10.194.121.35 with SMTP id lh3mr5513074wjb.164.1450461988106;
	Fri, 18 Dec 2015 10:06:28 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id o65sm7686816wmg.3.2015.12.18.10.06.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Dec 2015 10:06:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Dec 2015 19:09:04 +0100
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20151218180904.GB2556@jama>
References: <cover.1449754341.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1449754341.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][jethro][RESEND 00/11] Backports for jethro
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
X-List-Received-Date: Fri, 18 Dec 2015 18:06:29 -0000
X-Groupsio-MsgNum: 75040
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Content-Disposition: inline

--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2015 at 02:48:21PM +0100, Martin Jansa wrote:
> The following changes since commit 224bcc2ead676600bcd9e290ed23d9b2ed2f48=
1e:
>=20
>   rpcbind: Security Advisory - rpcbind - CVE-2015-7236 (2015-12-08 00:18:=
12 -0800)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib jansa/jethro-backp=
orts
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Djansa/jethro-backports
>=20
> Martin Jansa (10):
>   icu: force arm mode
>   guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable
>     thumb where it fails for qemuarm
>   directfb: add fPIC to CFLAGS
>   libunwind: fix build for qemuarm
>   gstreamer1.0-plugins-{base,good}: update PACKAGECONFIGs
>   gstreamer1.0-plugins-bad: fix dependencies for uvch264 PACKAGECONFIG
>   gstreamer1.0-plugins-good: fix PACKAGECONFIG for gudev and add one for
>     v4l2 and libv4l2
>   gst-plugins-bad: add PACKAGECONFIGs for voamrwbenc, voaacenc, resindvd
>   package_manager.py: define info_dir and status_file when OPKGLIBDIR
>     isn't the default
>   texinfo: don't create dependency on INHERIT variable
>=20
> Ross Burton (1):
>   libsdl2: require GLES when building Wayland support

PING

>  meta/lib/oe/package_manager.py                     | 19 +++++++
>  meta/recipes-devtools/gcc/gcc_4.9.bb               |  5 +-
>  meta/recipes-devtools/guile/guile_2.0.11.bb        |  4 ++
>  meta/recipes-devtools/opensp/opensp_1.5.2.bb       |  4 ++
>  meta/recipes-extended/mailx/mailx_12.5-5.bb        |  5 ++
>  meta/recipes-extended/texinfo/texinfo_6.0.bb       |  2 +-
>  meta/recipes-graphics/directfb/directfb.inc        |  3 +-
>  meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb     |  2 +-
>  .../gstreamer/gstreamer1.0-libav_1.4.5.bb          |  3 ++
>  .../gstreamer/gstreamer1.0-plugins-bad.inc         | 13 ++---
>  .../gstreamer/gstreamer1.0-plugins-base.inc        |  7 ++-
>  .../gstreamer/gstreamer1.0-plugins-good.inc        | 14 ++---
>  meta/recipes-support/icu/icu_55.1.bb               |  4 ++
>  ...Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch | 61 ++++++++++++++++=
++++++
>  meta/recipes-support/libunwind/libunwind_1.1.bb    |  5 ++
>  15 files changed, 126 insertions(+), 25 deletions(-)
>  create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Add-AO_R=
EQUIRE_CAS-to-fix-build-on-ARM-v6.patch
>=20
> --=20
> 2.6.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZ0S8AACgkQN1Ujt2V2gBynCACfWAzIR4K1wG9qw/6ZkNm2L5/h
JqUAn3xEb9NCtT6j4w2w03hmY11/R2SE
=Hp2z
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--
