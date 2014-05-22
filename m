Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (unknown [209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2C2DC6AF35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 18:27:59 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 9so3139483ykp.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=E8L+QuSxmeLk32Rpi6HR1vSpDFikmanjBD734lT3hH0=;
	b=l4HTlIwnut5K9jxNMhHjV/iW8FJ3QQWAiNV1y2Z2j0YiBYIIVSWFgfmXI7LCqxWfBj
	1ZwClkFqvGsDhBPQyK2gASm3sRIPYHAG1vQ7q7VB7Xq6DIApFCpGzOo35CWrwa/Ymn0G
	JiibPQ2bxsPYSSKpvfaAaEGHVi96ljHzi9CWrcLQvuiRV08td5PgiPQNR5wOYbqmi3yG
	RPu82O8QN5iZiIJn1QWFWRHJU7TO38YCuOUXyyIDZEmdeUVNivaz2gGkRAfkYJGcx9P7
	M6hPU+k6pZCNHoedcB/x31vl6ugzxdKHF1zcrGL21yOI7hTmIQtSZN/XQfZr8F/lP8oz
	PSIg==
X-Received: by 10.236.113.199 with SMTP id a47mr87343982yhh.80.1400783280463; 
	Thu, 22 May 2014 11:28:00 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id d43sm843820yhb.10.2014.05.22.11.27.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 May 2014 11:27:58 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id D647D1B13ADBB; Thu, 22 May 2014 15:27:54 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 22 May 2014 15:27:51 -0300
Message-Id: <1400783274-7258-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0.rc2
In-Reply-To: <1400783274-7258-1-git-send-email-otavio@ossystems.com.br>
References: <1400783274-7258-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [daisy-backport][PATCH 3/6] cryptodev-linux: create common .inc file to be shared by module and tests
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
X-List-Received-Date: Thu, 22 May 2014 18:28:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

(From OE-Core rev: a3a834cf9f35682655661a7c6ba66c1de3491320)

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb | 11 ++---------
 meta/recipes-kernel/cryptodev/cryptodev_1.6.inc      | 11 +++++++++++
 2 files changed, 13 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-kernel/cryptodev/cryptodev_1.6.inc

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb
index 320716d..43f58f3 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb
@@ -1,13 +1,6 @@
-SUMMARY = "A /dev/crypto device driver"
-HOMEPAGE = "http://cryptodev-linux.org/"
+require cryptodev_${PV}.inc
 
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SRC_URI = "http://download.gna.org/cryptodev-linux/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "eade38998313c25fd7934719cdf8a2ea"
-SRC_URI[sha256sum] = "75f1425c8ea1f8cae523905a5a046a35092327a6152800b0b86efc4e56fb3e2f"
+SUMMARY = "A /dev/crypto device driver header file"
 
 do_compile() {
 	:
diff --git a/meta/recipes-kernel/cryptodev/cryptodev_1.6.inc b/meta/recipes-kernel/cryptodev/cryptodev_1.6.inc
new file mode 100644
index 0000000..946faac
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/cryptodev_1.6.inc
@@ -0,0 +1,11 @@
+HOMEPAGE = "http://cryptodev-linux.org/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "http://download.gna.org/cryptodev-linux/cryptodev-linux-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "eade38998313c25fd7934719cdf8a2ea"
+SRC_URI[sha256sum] = "75f1425c8ea1f8cae523905a5a046a35092327a6152800b0b86efc4e56fb3e2f"
+
+S = "${WORKDIR}/cryptodev-linux-${PV}"
-- 
2.0.0.rc2


