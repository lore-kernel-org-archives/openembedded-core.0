Return-Path: <yaoxp@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 28ED06BAA1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 03:26:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.98,986,1392134400"; d="scan'208";a="31544538"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jun 2014 11:23:51 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id s563QRPQ032339
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jun 2014 11:26:27 +0800
Received: from FEDORA20.fnst.cn.fujitsu.com (10.167.226.101) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 6 Jun 2014 11:26:33 +0800
From: Yao Xinpan <yaoxp@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Jun 2014 23:26:17 -0400
Message-ID: <1402025177-7694-1-git-send-email-yaoxp@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.4.2
MIME-Version: 1.0
X-Originating-IP: [10.167.226.101]
Subject: [PATCH] lvm2.inc: EXTRA_OECONF is been overwrited
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
X-List-Received-Date: Fri, 06 Jun 2014 03:26:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

EXTRA_OECONF has been assigned before =E2=80=98EXTRA_OECONF =3D "--with-usr=
libdir=3D${libdir}"=E2=80=99.

So, =E2=80=98EXTRA_OECONF =3D "--with-usrlibdir=3D${libdir}"=E2=80=99 shoul=
d be changed to
=E2=80=98EXTRA_OECONF +=3D "--with-usrlibdir=3D${libdir}"=E2=80=99.

Signed-off-by: Yao Xinpan <yaoxp@cn.fujitsu.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-suppor=
t/lvm2/lvm2.inc
index c6a9ec0..71f782a 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -47,4 +47,4 @@ FILES_${PN} +=3D "${libdir}/device-mapper/*.so ${base_lib=
dir}/udev"
 FILES_${PN}-dbg +=3D "${libdir}/device-mapper/.debug"
=20
 RDEPENDS_${PN} =3D "bash"
-EXTRA_OECONF =3D "--with-usrlibdir=3D${libdir}"
+EXTRA_OECONF +=3D "--with-usrlibdir=3D${libdir}"
--=20
1.8.4.2


