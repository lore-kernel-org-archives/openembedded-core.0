Received: from giant.haxx.se ([80.67.6.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bjst@giant.haxx.se>) id 1SzmAC-0005pp-0T
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 12:09:52 +0200
Received: from giant.haxx.se (localhost.localdomain [127.0.0.1])
	by giant.haxx.se (8.14.4/8.14.4/Debian-2) with ESMTP id q7A9w3kZ007910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2012 11:58:03 +0200
Received: (from bjst@localhost)
	by giant.haxx.se (8.14.4/8.14.4/Submit) id q7A9w2jD007909
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 11:58:02 +0200
Date: Fri, 10 Aug 2012 11:58:02 +0200
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120810095802.GA22136@giant>
References: <20120808150633.GB32611@giant>
	<ED067880-C84B-42D9-B3C8-92F5E5B1250F@dominion.thruhere.net>
	<20120809071713.GA26150@giant> <5023C1FD.5040506@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <5023C1FD.5040506@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIME-Autoconverted: from 8bit to quoted-printable by giant.haxx.se id
	q7A9w3kZ007910
Subject: Re: [PATCH] pigz: Update to upstream version 2.2.5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Aug 2012 10:09:52 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Also added beginline/endline to LIC_FILES_CHKSUM to not track whole pigz.=
c.

Signed-off-by: Bj=F6rn Stenberg <bjst@enea.com>
---
 .../pigz/{pigz_2.2.4.bb =3D> pigz_2.2.5.bb}          |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/pigz/{pigz_2.2.4.bb =3D> pigz_2.2.5.bb} (26=
%)

diff --git a/meta/recipes-extended/pigz/pigz_2.2.4.bb
b/meta/recipes-extended/pigz/pigz_2.2.5.bb
similarity index 26%
rename from meta/recipes-extended/pigz/pigz_2.2.4.bb
rename to meta/recipes-extended/pigz/pigz_2.2.5.bb
index e76c49c..76c7c6c 100644
--- a/meta/recipes-extended/pigz/pigz_2.2.4.bb
+++ b/meta/recipes-extended/pigz/pigz_2.2.5.bb
@@ -1,11 +1,9 @@
 require pigz.inc

-PR =3D "r2"
-
 NATIVE_PACKAGE_PATH_SUFFIX =3D "/${PN}"

 BBCLASSEXTEND =3D "native"

-SRC_URI[md5sum] =3D "9df2a3c742524446fa4e797c17e8fd85"
-SRC_URI[sha256sum] =3D
"7e7967c47f66c07be97cbfa25c8816b72f9d35258466ea31eddc7666c914160e"
-LIC_FILES_CHKSUM =3D "file://pigz.c;md5=3D53f47c097bbf11b937a421b1816a8d=
c5"
+SRC_URI[md5sum] =3D "188f769ccedc403893d03049ad31e969"
+SRC_URI[sha256sum] =3D
"e37498cbf3a475d7ebe2519751188c29564bf8dd27ba68bd3c7fe1ac08792759"
+LIC_FILES_CHKSUM =3D
"file://pigz.c;beginline=3D7;endline=3D21;md5=3Da21d4075cb00ab4ca17fce5e7=
534ca95"
--
1.7.5.4

--=20
Bj=F6rn


