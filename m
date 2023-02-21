Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0C2C6FA99
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 20:10:09 +0000 (UTC)
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com [192.185.47.79])
 by mx.groups.io with SMTP id smtpd.web10.42472.1676988043275234437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linumiz.com header.s=default header.b=nkz9qKD3;
 spf=pass (domain: linumiz.com, ip: 192.185.47.79, mailfrom: parthiban@linumiz.com)
Received: from atl1wswcm03.websitewelcome.com (unknown [50.6.129.164])
	by atl1wswob02.websitewelcome.com (Postfix) with ESMTP id 6F4DB19618
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:00:42 +0000 (UTC)
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTP
	id UTCCpSBW8ZW9JUTCDpe6Er; Tue, 21 Feb 2023 14:00:42 +0000
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=np2RpKtu6mTOuRPi+AvA7Y9Z2ALTvRw6HYqL7XoDZFk=; b=nkz9qKD3L4ol3Ub+NAnqECR46G
	G4TDlkhZk3hd2aZQj9bWBxlkwchwNalFlbR7DIUtKQnQQiVPz9AsWQYcvAj79a/e2d2A7QQ5JICid
	KUQskfulB4ynlyv6qumOdHUr8Chn4FJB8ONpf3+HyEVzTsW0nZPIUZ54S3OaPN0zSo+RzvC2jyYV+
	cPCKmUrKH99xC0QGWB6A5R80u7J8c42CJImoEGSnRX9R14hB34u1zolBgmz3xu+6IEkebmGvmeH1Y
	mUduDyBrMpvE+0in8kLZpyCGqtEpI7fzPq3rjnYgfA8t7eyD2y3/XfZz+r5brPi5sa266vMMctYKv
	T/Vph6jQ==;
Received: from [117.206.136.115] (port=52858 helo=localhost.localdomain)
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <parthiban@linumiz.com>)
	id 1pUTCB-002o5U-KG;
	Tue, 21 Feb 2023 14:00:39 +0000
From: "Parthiban" <parthiban@linumiz.com>
To: openembedded-core@lists.openembedded.org
Cc: parthiban@linumiz.com
Subject: [PATCH] python3-influxdb_5.3.1.bb: add python3 recipe
Date: Tue, 21 Feb 2023 19:30:19 +0530
Message-Id: <20230221140019.287187-1-parthiban@linumiz.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 117.206.136.115
X-Source-L: No
X-Exim-ID: 1pUTCB-002o5U-KG
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [117.206.136.115]:52858
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 1
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHFLJJLV4bES3UOS6ZgxAiScPAfe9HAjZf2RQjV32l+q4KfenHtSEFTqXfmCeL7wswz73mDJ7l2S/3UX8XxWW2II34FXW1REF3HgFJgZW1UXJ2fE8TCN
 blzF7whWVQyLg3/5eU/fgbPtQszsrWw/PYjF/AS1ACMDQhFI9xG70DSUb8YitJcxm1W7K0ovDYeu6ooAy+y71/fDLJtaMkjlQGSYFNgejpD3lS0sEB/ri+Q2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 20:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178048

add python3 recipe for python3-influxdb_5.3.1.bb

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 .../python/python3-influxdb_5.3.1.bb          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-influxdb_=
5.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-influxdb_5.3.1.b=
b b/meta-python/recipes-devtools/python/python3-influxdb_5.3.1.bb
new file mode 100644
index 000000000..9ffbeb7dd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-influxdb_5.3.1.bb
@@ -0,0 +1,19 @@
+DESCRIPTION =3D "InfluxDB-Python is a client for interacting with Influx=
DB"
+HOMEPAGE =3D "https://github.com/influxdata/influxdb-python"
+SECTION =3D "devel/python"
+
+DEPENDS +=3D "${PYTHON_PN}-docutils-native"
+RDEPENDS:${PN} =3D "${PYTHON_PN}-docutils \
+                  ${PYTHON_PN}-lockfile (>=3D 0.10) \
+                  ${PYTHON_PN}-resource \
+"
+
+LICENSE =3D "Apache-2.0 & GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df61c0d3948045e1c8ebe3d70cc888=
003"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] =3D "e5888a7023e9a49d8a372538b625f908"
+SRC_URI[sha256sum] =3D "46f85e7b04ee4b3dee894672be6a295c94709003a7ddea88=
20deec2ac4d8b27a"
+
+PYPI_PACKAGE =3D "influxdb"
--=20
2.39.1


