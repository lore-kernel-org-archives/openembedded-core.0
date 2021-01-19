Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by mx.groups.io with SMTP id smtpd.web08.8157.1611037567375352963
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:26:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: huawei.com, ip: 45.249.212.190, mailfrom: zhengjunling@huawei.com)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DKdsz1vKVzl6yw
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 14:24:39 +0800 (CST)
Received: from pekphicprd07980.huawei.com (10.243.114.245) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Tue, 19 Jan 2021 14:25:53 +0800
From: "Junling Zheng" <zhengjunling@huawei.com>
To: <openembedded-core@lists.openembedded.org>
CC: <zhengjunling@huawei.com>
Subject: [OE-core] [PATCH 2/2] libxml2: Update checksum for testtar
Date: Tue, 19 Jan 2021 14:25:45 +0800
Message-ID: <20210119062545.625-2-zhengjunling@huawei.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119062545.625-1-zhengjunling@huawei.com>
References: <20210119062545.625-1-zhengjunling@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.243.114.245]
X-CFilter-Loop: Reflected
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

For some unknown factor, the checksum of testtar(xmlts20080827.tar.gz)
is mismatch with that of remote. Let's fix it.

Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
---
 meta/recipes-core/libxml/libxml2_2.9.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-co=
re/libxml/libxml2_2.9.10.bb
index 07ae68610c..cab234f9b7 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -28,8 +28,8 @@ SRC_URI =3D "http://www.xmlsoft.org/sources/libxml2-${P=
V}.tar.gz;name=3Dlibtar \
=20
 SRC_URI[libtar.md5sum] =3D "10942a1dc23137a8aa07f0639cbfece5"
 SRC_URI[libtar.sha256sum] =3D "aafee193ffb8fe0c82d4afef6ef91972cbaf5feea=
100edc2f262750611b4be1f"
-SRC_URI[testtar.md5sum] =3D "ae3d1ebe000a3972afa104ca7f0e1b4a"
-SRC_URI[testtar.sha256sum] =3D "96151685cec997e1f9f3387e3626d61e6284d4d6=
e66e0e440c209286c03e9cc7"
+SRC_URI[testtar.md5sum] =3D "3a944b972f2da90b97d8a57c6f939fa8"
+SRC_URI[testtar.sha256sum] =3D "9b2c865aba66c6429ca301a7ef048d7eca2cdb7a=
9106184416710853c7b37d0d"
=20
 BINCONFIG =3D "${bindir}/xml2-config"
=20
--=20
2.30.0

