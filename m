Return-Path: <Mark.Jonas@de.bosch.com>
X-Greylist: delayed 318 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 04 Aug 2018 18:31:42 UTC
Received: from de-deferred1.bosch-org.com (de-deferred1.bosch-org.com
	[139.15.180.216])
	by mail.openembedded.org (Postfix) with ESMTP id BCC8660602
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Aug 2018 18:31:42 +0000 (UTC)
Received: from de-out1.bosch-org.com (unknown [139.15.180.215])
	by si0vms0224.rbdmz01.com (Postfix) with ESMTPS id 41jXRj2H79z1h
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Aug 2018 20:26:25 +0200 (CEST)
Received: from fe0vm1650.rbesz01.com (unknown [139.15.230.188])
	by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 41jXRg1YKpz4f3kl4;
	Sat,  4 Aug 2018 20:26:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
	s=2015-01-21; t=1533407183;
	bh=uI1OYDuVfYqGIYM+HBdQzJKxICvg5/O66n3Q5xvv9aQ=; l=10;
	h=From:From:Reply-To:Sender;
	b=JIZf+uq4Q9KGSPJQB8k7Ukm2ezdwHivJ+LPi3u9r9NXqfzDN5r0itEMa5UTPGcVDZ
	uKboRHRM/T7yzhIcqrqB5dXxmDZj41rbPEo0+OLdz/9W4l3zieVCwv3fhOAZBruZBx
	STmgzWNO+GM1SfNhJxy/aC+lHVATtXflSK51WbFM=
Received: from fe0vm1741.rbesz01.com (unknown [10.58.172.176])
	by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 41jXRg1804z1Cj;
	Sat,  4 Aug 2018 20:26:23 +0200 (CEST)
X-AuditID: 0a3aad15-18dff70000001291-6b-5b65efd59cfd
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
	(using TLS with cipher AES128-SHA (128/128 bits))
	(Client did not present a certificate)
	by fe0vm1741.rbesz01.com (SMG Outbound) with SMTP id
	E9.2C.04753.5DFE56B5; Sat,  4 Aug 2018 20:26:30 +0200 (CEST)
Received: from FE-HUB1000.de.bosch.com (fe-hub1000.de.bosch.com [10.4.103.107])
	by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 41jXRf6nN7z6D5yfS;
	Sat,  4 Aug 2018 20:26:22 +0200 (CEST)
Received: from luchador.grb-fir.grb.de.bosch.com (10.19.187.97) by
	FE-HUB1000.de.bosch.com (10.4.103.107) with Microsoft SMTP Server id
	14.3.408.0; Sat, 4 Aug 2018 20:26:22 +0200
From: Mark Jonas <mark.jonas@de.bosch.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 4 Aug 2018 20:26:02 +0200
Message-ID: <1533407162-21497-1-git-send-email-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjl+LIzCtJLcpLzFFi42Lhslorq3vtfWq0waK/jBZ3fr5jt2i7PgvI
	evGJyYHZY+esu+we5zauYAxgiuKySUnNySxLLdK3S+DK2LB1L3vBJrGKJ6tmsTcwtgh3MXJy
	SAiYSLw+e5q9i5GLQ0ignUnicmMHI4Szn1HiyN5lTBDONkaJaeumM4O0sAloSdw8sQPI5uAQ
	EdCTuPpPFCTMLJAvcb9nCliJsIC3xOvvrewgNouAisTc7qNsIDavgLtE24EnTBCb5SRunutk
	hogLSpyc+YQFYo6ExMEXL5gnMPLOQpKahSS1gJFpFaNoWqpBWa6huYmhXlFSanGVgaFecn7u
	JkZICInuYFy/OfUQowAHoxIPb+rL1Ggh1sSy4srcQ4ymHExKoryml1OihfiS8lMqMxKLM+KL
	SnNSi5WkeBkZGBiEhOHCxaVJuZnFxZn5eYcYJTiYlUR4/zcAjeJNSaysSi3Kh2g7xCjNwaIk
	ziv8NyxaSCA9sSQ1OzW1ILUIJmvNwaEkwfvpHVCjYFFqempFWmZOCUxaSRZipxiyDLK1TByc
	hxiNOXiAdiu/BdldXJCYW5yZDtUuCdEuBBNFaD3F6Mzx5/3UScxCLHn5ealS4rxHQU4QAKnM
	KM2Du0BKhvfno+RoIVEkCYQprxhvMALDUJj3KUgzDzAhIuyW4N0hPCdSSBAqiNBktASoR2AB
	p8SGR1YS83Z8ZZSYt+Q+i8S1Iys4JDbPu8wp8X8DkFgyv59L4vCMDbwSq/pf8Er8ONEkIHFp
	yw1BiUc39gtLnLh0SVzi36UGGYkXm+bLSGz8cURO4kLTI2WJM1OuqEncuvtQTWLOg5dqEotW
	9alLzJt1RVNiSfd9TYlbz1ZpSWzsnKwtcWPmI22JeU+m6Ei8O7VMR6J/2iNdkL16Ene+/9eX
	ON3wwPAVMFyZgOFabQIO15LEEizhChVFeE6qgdFtw6apDw5c4eXyluXXrKuUevTfLm/h5gdn
	761PKfGNm2uZ18xTFHCQQbEjcv2tjcL6hUv5Taa6xQvKf2+x7Ph3Xv3OTw4uRkvXQnvxuvCy
	4nypVfVJ/IlZ55pyK/Y1e4b/Do8MWjz3EPed2zv8uxj/iNSfeXVaS38VU/fG576zY9I+CGwr
	UmIpzkg01GIuKk4EAMUHGCshBAAA
Subject: [meta-oe][PATCH] directfb: fix tslib version check in configure.in
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
X-List-Received-Date: Sat, 04 Aug 2018 18:31:43 -0000
Content-Type: text/plain

From: Guan Ben <ben.guan@cn.bosch.com>

The patch makes sure that the old as well as the new tslib pkg-config
metadata file naming style is handled correctly.

tslib 0.0 to 1.0 created only a tslib-<VERSION>.pc pkg-config metadata
file.

With tslib 1.1 the tslib-<VERSION>.pc phase out was started.
Additionally, the pkg-config metadata file tslib.pc was added.

Since tslib 1.6 the tslib-<VERSION>.pc metadata file is deprecated.
Now, there is only a tslib.pc.

Signed-off-by: Ben Guan <ben.guan@cn.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta-oe/recipes-graphics/directfb/directfb.inc       |  1 +
 .../directfb/fix-tslib-version-version-check.patch   | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/directfb/directfb/fix-tslib-version-version-check.patch

diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/recipes-graphics/directfb/directfb.inc
index bd66a28..af07ad7 100644
--- a/meta-oe/recipes-graphics/directfb/directfb.inc
+++ b/meta-oe/recipes-graphics/directfb/directfb.inc
@@ -20,6 +20,7 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/DirectFB-${PV}.tar.g
            file://union-sigval.patch \
            file://use-PTHREAD_MUTEX_RECURSIVE.patch \
            file://fix-client-gfx_state-initialisation.patch \
+           file://fix-tslib-version-version-check.patch \
           "
 
 S = "${WORKDIR}/DirectFB-${PV}"
diff --git a/meta-oe/recipes-graphics/directfb/directfb/fix-tslib-version-version-check.patch b/meta-oe/recipes-graphics/directfb/directfb/fix-tslib-version-version-check.patch
new file mode 100644
index 0000000..b30db11
--- /dev/null
+++ b/meta-oe/recipes-graphics/directfb/directfb/fix-tslib-version-version-check.patch
@@ -0,0 +1,20 @@
+diff -Nru DirectFB-1.7.7.orig/configure.in DirectFB-1.7.7/configure.in
+--- DirectFB-1.7.7.orig/configure.in	2015-02-10 01:16:46.000000000 +0800
++++ DirectFB-1.7.7/configure.in	2018-06-06 17:19:18.472143103 +0800
+@@ -2459,10 +2459,13 @@
+ 
+ enable_tslib=no
+ if test "$checkfor_tslib" = "yes"; then
+-  PKG_CHECK_MODULES([TSLIB], [tslib-1.0 >= 1.0.0], [enable_tslib=yes], [enable_tslib=no])
++  PKG_CHECK_MODULES([TSLIB], [tslib >= 1.1], [enable_tslib=yes], [enable_tslib=no])
+   if test "$enable_tslib" = "no"; then
+-     PKG_CHECK_MODULES([TSLIB], [tslib-0.0], [enable_tslib=yes], [enable_tslib=no
+-       AC_MSG_WARN([*** no tslib -- tslib driver will not be built.])])
++    PKG_CHECK_MODULES([TSLIB], [tslib-1.0 >= 1.0], [enable_tslib=yes], [enable_tslib=no])
++    if test "$enable_tslib" = "no"; then
++      PKG_CHECK_MODULES([TSLIB], [tslib-0.0], [enable_tslib=yes], [enable_tslib=no
++        AC_MSG_WARN([*** no tslib -- tslib driver will not be built.])])
++    fi
+   fi
+ fi
+ 
-- 
2.7.4


