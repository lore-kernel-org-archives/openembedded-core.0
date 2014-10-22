Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 30700601F5;
	Wed, 22 Oct 2014 09:36:42 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id x13so3277955wgg.18
	for <multiple recipients>; Wed, 22 Oct 2014 02:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=sbJJ5BfpliuF2sb+dhroxSaFREPw9HNXSA+TQfRcdfc=;
	b=ztH07NX/d0EmtoLQWkEYhlplCpPRTEbOHDgqVAx1osZj7mGqKbnk0w2kkwB3YJ1AVT
	cPPqKdwfS3xPASrTwQQkyoghA5Fb1CN3nLFd3hIB+w8DbXf9EaB0b1rgkfb7CaMBSWM7
	sGfWfo0aeQ/z6GgFYCPkfavxEDYzECleCgY9L84H418+S8JINQ4H5GC6z+k6et/HvxDP
	SaqEpVMWWoSsdvUCrhX2Yx1DRdI6yR2oRQrFuNMSrIPv2LRazzaIHPeP+wLNJFxIaOb8
	thAdkubcTnXw7gxXaYpb7mxmf3IdjMMayDU0ZpA2STRf5yKcVpM5AXZJtEVaSiSp2O2y
	wGMQ==
X-Received: by 10.194.8.103 with SMTP id q7mr50115449wja.82.1413970602329;
	Wed, 22 Oct 2014 02:36:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fm10sm1256637wib.21.2014.10.22.02.36.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Oct 2014 02:36:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 22 Oct 2014 11:36:43 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20141022093643.GH2455@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, files not tracked by sstate
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
X-List-Received-Date: Wed, 22 Oct 2014 09:36:47 -0000
X-Groupsio-MsgNum: 58825
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6K2R/cS9K4qvcBNq"
Content-Disposition: inline

--6K2R/cS9K4qvcBNq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

These are the files which are installed into sysroot without sstate
knowledge, so if you reuse the components which created them from sstate
these files will be missing.

cat << EOF > sstate-sysroot-cruft-whitelist.txt
[^/]*/home/builder
[^/]*/usr/src/kernel/patches
[^/]*/usr/src/kernel/scripts/.*
[^/]*/usr/lib/gdk-pixbuf-2.0/.*/loaders.cache
[^/]*/etc/sgml/sgml-docbook.cat
[^/]*/usr/src/kernel/patches
[^/]*/etc/sgml/sgml-docbook.cat
[^/]*/usr/lib/python3.3/__pycache__
[^/]*/usr/lib/python3.3/[^/]*/__pycache__
[^/]*/usr/lib/python3.3/[^/]*/[^/]*/__pycache__
[^/]*/usr/share/dbus
[^/]*/usr/share/dbus/dbus-bus-introspect.xml
[^/]*/usr/share/dbus/session.conf
[^/]*/usr/bin/crossscripts/guile-config
[^/]*/usr/lib/python2.7/config/libpython2.7.so
[^/]*/var
[^/]*/usr/bin/i586-oe-linux-g77
[^/]*/usr/bin/arm-oe-linux-gnueabi-g77
[^/]*/usr/lib/php/\.channels.*
[^/]*/usr/lib/php/\.registry.*
[^/]*/usr/lib/php/\.depdb.*
[^/]*/usr/lib/php/\.filemap
[^/]*/usr/lib/php/\.lock
[^/]*/usr/lib/gdk-pixbuf-2.0/.*/loaders.cache
[^/]*/usr/include/ruby-1.9.1/i386-linux
[^/]*/usr/include/ruby-1.9.1/i386-linux/ruby
[^/]*/usr/include/ruby-1.9.1/i386-linux/ruby/config.h
[^/]*/usr/include/ruby-1.9.1/ruby/win32.h
[^/]*/usr/lib/ruby/i386-linux
[^/]*/usr/lib/ruby/i386-linux/fake.rb
[^/]*/usr/lib/ruby/i386-linux/libruby.so.1.9.1
[^/]*/usr/lib/ruby/i386-linux/libruby-static.a
[^/]*/usr/lib/ruby/i386-linux/rbconfig.rb
[^/]*/usr/lib/qt4/plugins/webkit
[^/]*/usr/lib/qt5/plugins/webkit
EOF

You can easily verify it in your build (after build without
sstate-cache) with:
openembedded-core/scripts/sstate-sysroot-cruft.sh --tmpdir=3Dtmp-glibc
--whitelist=3Dsstate-sysroot-cruft-whitelist.txt 2>&1

RFC for g77 fix was sent couple months ago (no reply):
http://lists.openembedded.org/pipermail/openembedded-core/2014-April/091480=
=2Ehtml

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6K2R/cS9K4qvcBNq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRHeqsACgkQN1Ujt2V2gByxxwCgh8sin35TS2pplpTRa2czidp1
ZZsAn1gt9knRg1mFp7QMlLZ+zA3QCriL
=3o5L
-----END PGP SIGNATURE-----

--6K2R/cS9K4qvcBNq--
