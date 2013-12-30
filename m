Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B5856B5B0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 03:35:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBU3ZKcu025985
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2013 19:35:20 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 29 Dec 2013 19:35:20 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 29 Dec 2013 22:34:58 -0500
Message-ID: <855b175f79a06066a03795b06b6695e6e4f33efc.1388369850.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1388369850.git.liezhi.yang@windriver.com>
References: <cover.1388369850.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/14] bluez-hcidump: remove unrecognised options
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
X-List-Received-Date: Mon, 30 Dec 2013 03:35:19 -0000
Content-Type: text/plain

Remove the following two options since they are not needed any more:
* --with-bluez-libs
* --with-bluez-includes

  commit 78631c5f66f0580695ff3aac4dc8831e3795b735
  Author: Marcel Holtmann <marcel@holtmann.org>
  Date:   Wed Aug 31 00:57:30 2011 -0700

      Change includes to use local copy of Bluetooth library

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb b/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
index 6bddcba..8af5c6b 100644
--- a/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
+++ b/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
@@ -17,6 +17,4 @@ SRC_URI[md5sum] = "2eab54bbd2b59a2ed4274ebb9390cf18"
 SRC_URI[sha256sum] = "9b7c52b375081883738cf049ecabc103b97d094b19c6544fb241267905d88881"
 S = "${WORKDIR}/bluez-hcidump-${PV}"
 
-EXTRA_OECONF = "--with-bluez-libs=${STAGING_LIBDIR} --with-bluez-includes=${STAGING_INCDIR}"
-
 inherit autotools
-- 
1.7.10.4


