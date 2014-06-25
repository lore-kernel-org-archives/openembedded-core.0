Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C692B65D6D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 00:13:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jun 2014 17:13:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,541,1400050800"; d="scan'208";a="560482005"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jun 2014 17:13:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jun 2014 17:13:12 -0700
Message-Id: <0137af66358c2e7a7446602d6887009d08f9152c.1403654908.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1403654908.git.sgw@linux.intel.com>
References: <cover.1403654908.git.sgw@linux.intel.com>
In-Reply-To: <cover.1403654908.git.sgw@linux.intel.com>
References: <cover.1403654908.git.sgw@linux.intel.com>
Subject: [PATCH 02/10] libusb1: Update to 1.0.19
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
X-List-Received-Date: Wed, 25 Jun 2014 00:13:40 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/libusb/{libusb1_1.0.18.bb => libusb1_1.0.19.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libusb/{libusb1_1.0.18.bb => libusb1_1.0.19.bb} (85%)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.18.bb b/meta/recipes-support/libusb/libusb1_1.0.19.bb
similarity index 85%
rename from meta/recipes-support/libusb/libusb1_1.0.18.bb
rename to meta/recipes-support/libusb/libusb1_1.0.19.bb
index 395145a..a20e1fc 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.18.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.19.bb
@@ -11,8 +11,8 @@ BBCLASSEXTEND = "native nativesdk"
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
           "
 
-SRC_URI[md5sum] = "4a6d049923efc6496f1d383054dac1a6"
-SRC_URI[sha256sum] = "c73f5cec45a5de94418da4e151b7232958571926984acfb9bce02b9424e83720"
+SRC_URI[md5sum] = "f9e2bb5879968467e5ca756cb4e1fa7e"
+SRC_URI[sha256sum] = "6c502c816002f90d4f76050a6429c3a7e0d84204222cbff2dce95dd773ba6840"
 
 S = "${WORKDIR}/libusb-${PV}"
 
-- 
1.8.3.1


