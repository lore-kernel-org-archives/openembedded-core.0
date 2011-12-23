Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RdtWc-0008E9-OJ
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 02:02:19 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBN0tBjC004372
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 16:55:11 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 22 Dec 2011 16:55:11 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Dec 2011 19:01:38 -0600
Message-ID: <9b31b5050738a2175faa361fe5dd6e1c3107b34a.1324601996.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1324601996.git.mark.hatle@windriver.com>
References: <cover.1324601996.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 4/7] udev: Remove linux-libc-headers dependency
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
X-List-Received-Date: Fri, 23 Dec 2011 01:02:19 -0000
Content-Type: text/plain

The linux-libc-headers dependency is not needed, as it is
automatically inherited from the libc and other dependencies.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/udev/udev-new.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/udev/udev-new.inc b/meta/recipes-core/udev/udev-new.inc
index e302c03..198336b 100644
--- a/meta/recipes-core/udev/udev-new.inc
+++ b/meta/recipes-core/udev/udev-new.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://libudev/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://extras/gudev/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-DEPENDS = "acl glib-2.0 libusb usbutils pciutils linux-libc-headers gperf-native libxslt-native"
+DEPENDS = "acl glib-2.0 libusb usbutils pciutils gperf-native libxslt-native"
 RPROVIDES_${PN} = "hotplug"
 RRECOMMENDS_${PN} += "udev-extraconf udev-cache usbutils-ids pciutils-ids"
 RDEPENDS_libudev = "${PN} (= ${EXTENDPKGV})"
-- 
1.7.3.4



