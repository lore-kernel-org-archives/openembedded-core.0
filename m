Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9618C7E637
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 17:26:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45YCkX4vKWz56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 19:26:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561483588;
	bh=rE/ur87NuudUEkjXdwfGNKzrPNYh9YzZKf9xiRbDfFQ=;
	h=From:To:Subject:Date:From;
	b=ZyNmjVFRZIHxJ5WM8ja1xFqK8lw9DquuzR0/w15CjShEUiEgPTo389mtNcGFXMDHW
	O3KWz2rYSL9H2ORcJzAt+R7v7FhNOfgGuD3IdlAc/3B+kfIXvST64C1C1UF/NbxZVb
	Y7ytH9dAJ3ErYfMTheuIp/95ZlHOiWRI/QgRc1z0Z4ecPVNJHLVq+G/QNGWtxHhv40
	wnmhlUlqRffV/OJWQtypecvanpAJ5nn9WFOxvDa05yXpPyYSvY1JLXPEazcyumTNoE
	ein/JaIWrzeWYDDc3sWYpZKhA1rLZKaM7oIw2MzoSjc3Q+XGor+6g7YNZJ8glIvHeo
	6GPqtQExUVF5jEAi3H1CZavL4o8sot1fRCVKuWNssnR1AcuY2f1PUCWd/EptkDkq2n
	ICh2lsugFSPKhwPb4oKfugq+M9cURXAQWT3A7dHwDuUTB9e6EIkkRt9qK5sPTPhggL
	hFqy6/aEYqCT2x5wD0G58NKVAUky0GrWIMcvLz4//Vo3xWAWAies4zUHaqvbbt3FeU
	ddMkw/64KNVqaeAf0CEvtRKhfDg56Nd1+rteX+839dzMb0n3BobWigJFHwXMdWYOlV
	j71kljd5sMBF8DoLNlSswIaAvKzcoQ5UZtjrlwDMY6TTWstb7PAXOBWs2jPp7Zq1tS
	IKIYtA0z7my+R+yzVDlZgsl0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2019 20:26:24 +0300
Message-Id: <20190625172627.24662-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] bluez5: Remove obsolete dependency on dbus-glib
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
X-List-Received-Date: Tue, 25 Jun 2019 17:26:28 -0000

Upstream stopped using it in 2008.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 8f321638ce..28aaeea418 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e"
-DEPENDS = "dbus-glib glib-2.0"
+DEPENDS = "dbus glib-2.0"
 PROVIDES += "bluez-hcidump"
 RPROVIDES_${PN} += "bluez-hcidump"
 
-- 
2.17.1


