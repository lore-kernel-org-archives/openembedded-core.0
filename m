Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id A5CB97280D;
	Wed, 11 Feb 2015 20:35:09 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id x3so5932133wes.6;
	Wed, 11 Feb 2015 12:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sxQC+G1g6Qscv6jtVGyhYp8f5Hbld7eBWZy55SFvJng=;
	b=mXejV511MGIjgwpnTbj2MeVTLk6YXRMH6eAgn0mxc6H/+6ctUpOhY6lySRwtUCJZmm
	d5bkLPen7mEfbcnUJPrzKsvIG7M4xBpVvyUsp4IJLxHnA3jhhhM5E5sz05TSBGCcrr7f
	+JUlJ7g/SDjHRWW/gtWoUUA/df9sVfGtx14+6eYH3d+rtpaEBqCzYm4Kcs1d2/4WVgZ8
	vzuFeKVHOZ/zO8AJ0nXhidVmCHOwq+9LzkAMzI7vRIUyJ3RAAUeyN5fAbDqvGGh3fxr3
	jFyOX+G9o344GCMX9zwinDcxoVHouTkEit5H3Jv9V581DC3JpkjLhvMTu0buYkoRjWFL
	2pyQ==
X-Received: by 10.180.80.230 with SMTP id u6mr6460116wix.69.1423686910078;
	Wed, 11 Feb 2015 12:35:10 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	kj8sm2747693wjc.29.2015.02.11.12.35.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Feb 2015 12:35:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 11 Feb 2015 21:35:12 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150211203512.GB2272@jama>
References: <20150211202632.GA2272@jama>
MIME-Version: 1.0
In-Reply-To: <20150211202632.GA2272@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: State of bitbake world, Failed tasks 2015-02-10
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
X-List-Received-Date: Wed, 11 Feb 2015 20:35:11 -0000
X-Groupsio-MsgNum: 62311
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Content-Disposition: inline

--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2015 at 09:26:32PM +0100, Martin Jansa wrote:
> http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> =3D=3D Failed tasks 2015-02-10 =3D=3D
>=20
> INFO: jenkins-job.sh-1.1.0 Complete log available at http://logs.nslu2-li=
nux.org/buildlogs/oe/world/log.report.20150210_214029.log
>=20

More details bellow:

* /meta-openembedded/meta-oe/recipes-support/fltk/fltk_1.1.10.bb, do_compile
* /meta-openembedded/meta-python/recipes-devtools/python/python-lxml_3.2.5.=
bb, do_compile
are trying to use xml2-config

* /meta-openembedded/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb=
, do_compile
* /meta-openembedded/meta-networking/recipes-support/wireshark/wireshark_1.=
12.3.bb, do_configure
are trying to use pcap-config


* /meta-openembedded/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb, do_compi=
le
| i586-oe-linux-gcc: error: unrecognized command line option '--should-not-=
have-used-/usr/bin/freetype-config'

* /meta-openembedded/meta-oe/recipes-support/start-stop-daemon/start-stop-d=
aemon_1.16.0.2.bb, do_compile
*** error: gettext infrastructure mismatch: using a Makefile.in.in from
gettext version 0.18 but the autoconf macros are from gettext version
0.19

* /openembedded-core/meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb, do_=
compile
| tools/dumpimage.c:195:37: error: 'PLAIN_VERSION' undeclared (first use in=
 this function)

* /meta-openembedded/meta-oe/recipes-extended/unixodbc/unixodbc_2.3.2.bb, d=
o_configure
| gnu-configize: 'configure.ac' or 'configure.in' is required

* /meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
| qemu: uncaught target signal 11 (Segmentation fault) - core dumped

* /openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb, =
do_compile
| btrfs.c:172:17: error: 'BTRFS_BUILD_VERSION' undeclared (first use in thi=
s function)

* /meta-openembedded/meta-networking/recipes-connectivity/snort/snort_2.9.6=
=2E0.bb, do_configure
ERROR!  Libpcre header not found.

* /meta-openembedded/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb, do_com=
pile
ktap.c:33:2: error: #error "Please enable CONFIG_EVENT_TRACING before compi=
le ktap"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTbvQAACgkQN1Ujt2V2gBzkYQCgqejzq2ZhPVBoQ2NTPSxll18s
cDsAoJuaKoyi+/2cuLKZW98pnQi1bIHa
=yFB4
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--
