Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by mx.groups.io with SMTP id smtpd.web12.8350.1611037568458169358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:26:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: huawei.com, ip: 45.249.212.190, mailfrom: zhengjunling@huawei.com)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DKdsz249bzl71M
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 14:24:39 +0800 (CST)
Received: from pekphicprd07980.huawei.com (10.243.114.245) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Tue, 19 Jan 2021 14:25:52 +0800
From: "Junling Zheng" <zhengjunling@huawei.com>
To: <openembedded-core@lists.openembedded.org>
CC: <zhengjunling@huawei.com>
Subject: [OE-core] [PATCH 1/2] tcp-wrappers: Update checksum for SRC_URI
Date: Tue, 19 Jan 2021 14:25:44 +0800
Message-ID: <20210119062545.625-1-zhengjunling@huawei.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Originating-IP: [10.243.114.245]
X-CFilter-Loop: Reflected
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Commit a11edd68b2 (Change ftp:// URIs to http(s)://) changed the URI
from ftp to http without updating tarball's checksum, which is different
between them unfortunately.

Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
---
 meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/met=
a/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index e903b9db14..f769a9d229 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -52,8 +52,8 @@ SRC_URI =3D "http://ftp.porcupine.org/pub/security/tcp_=
wrappers_${PV}.tar.gz \
            file://0001-Remove-fgets-extern-declaration.patch \
            "
=20
-SRC_URI[md5sum] =3D "e6fa25f71226d090f34de3f6b122fb5a"
-SRC_URI[sha256sum] =3D "9543d7adedf78a6de0b221ccbbd1952e08b5138717f4ade8=
14039bb489a4315d"
+SRC_URI[md5sum] =3D "5da85a422a30045a62da165404575d8e"
+SRC_URI[sha256sum] =3D "98c38ba2469a4873a0d85bbead180c0d23c2989a946c16c6=
f1fe04fbac6c1dd3"
=20
 S =3D "${WORKDIR}/tcp_wrappers_${PV}"
=20
--=20
2.30.0

