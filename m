Received: from giant.haxx.se ([80.67.6.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bjst@giant.haxx.se>) id 1SzNAz-0000QG-Hk
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Aug 2012 09:29:01 +0200
Received: from giant.haxx.se (localhost.localdomain [127.0.0.1])
	by giant.haxx.se (8.14.4/8.14.4/Debian-2) with ESMTP id q797HD7h027547
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Aug 2012 09:17:13 +0200
Received: (from bjst@localhost)
	by giant.haxx.se (8.14.4/8.14.4/Submit) id q797HDKl027536
	for openembedded-core@lists.openembedded.org;
	Thu, 9 Aug 2012 09:17:13 +0200
Date: Thu, 9 Aug 2012 09:17:13 +0200
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120809071713.GA26150@giant>
References: <20120808150633.GB32611@giant>
	<ED067880-C84B-42D9-B3C8-92F5E5B1250F@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <ED067880-C84B-42D9-B3C8-92F5E5B1250F@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIME-Autoconverted: from 8bit to quoted-printable by giant.haxx.se id
	q797HD7h027547
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
X-List-Received-Date: Thu, 09 Aug 2012 07:29:01 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

---
 meta/recipes-extended/pigz/pigz_2.2.4.bb |   11 -----------
 meta/recipes-extended/pigz/pigz_2.2.5.bb |   11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-extended/pigz/pigz_2.2.4.bb
 create mode 100644 meta/recipes-extended/pigz/pigz_2.2.5.bb

diff --git a/meta/recipes-extended/pigz/pigz_2.2.4.bb b/meta/recipes-exte=
nded/pigz/pigz_2.2.4.bb
deleted file mode 100644
index e76c49c..0000000
--- a/meta/recipes-extended/pigz/pigz_2.2.4.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require pigz.inc
-
-PR =3D "r2"
-
-NATIVE_PACKAGE_PATH_SUFFIX =3D "/${PN}"
-
-BBCLASSEXTEND =3D "native"
-
-SRC_URI[md5sum] =3D "9df2a3c742524446fa4e797c17e8fd85"
-SRC_URI[sha256sum] =3D "7e7967c47f66c07be97cbfa25c8816b72f9d35258466ea31=
eddc7666c914160e"
-LIC_FILES_CHKSUM =3D "file://pigz.c;md5=3D53f47c097bbf11b937a421b1816a8d=
c5"
diff --git a/meta/recipes-extended/pigz/pigz_2.2.5.bb b/meta/recipes-exte=
nded/pigz/pigz_2.2.5.bb
new file mode 100644
index 0000000..36669c2
--- /dev/null
+++ b/meta/recipes-extended/pigz/pigz_2.2.5.bb
@@ -0,0 +1,11 @@
+require pigz.inc
+
+NATIVE_PACKAGE_PATH_SUFFIX =3D "/${PN}"
+
+BBCLASSEXTEND =3D "native"
+
+SRC_URI[md5sum] =3D "188f769ccedc403893d03049ad31e969"
+SRC_URI[sha256sum] =3D "e37498cbf3a475d7ebe2519751188c29564bf8dd27ba68bd=
3c7fe1ac08792759"
+LIC_FILES_CHKSUM =3D "file://pigz.c;md5=3Dee5481b3699dcac1f63cec8d038ada=
8a"
--=20
1.7.10.4

--=20
Bj=F6rn


