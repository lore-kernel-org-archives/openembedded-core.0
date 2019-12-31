Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 21F6C7FA23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 14:18:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47nGcD6H15zTB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 15:18:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1577801901;
	bh=DSdAHmAJVsy0VnJQf0cw2/GB7EPVCSimIQqhKemgR4Y=;
	h=From:To:Subject:Date:From;
	b=SQ+J8VLi6/5LgOkvrlfUleezOoupuaBGpN3UadTKI4gvro0AzhYioaKzBOUnF0hvA
	jKbCVmoumCMzqWBoPIBu4/uuHafYtpy7OTKu3FflDOfHqpqGZ2lbupyljchKS7TGNY
	CIHwjb64WV8bHXMic9kmxrkOujtax3ubjUjGO1BRhycaX+ECiwKEl+W5c+4O4gkVn9
	jLEKbKtFsEf1sYb6Dvkz1tYFR9bWv+uZrv6CzTH4LZU8zMwiiU+YpsfAOk3eoFk07J
	+bLYO6RsGPut1wc+V868JRINNsfIoMj/JDGoeDFuUHY4vpzRITKVZEt3kq9AIsBHOw
	GYdaWsqoWJ8C35hLG0+MlIej8CIIoP7to0UISTel4KonVsvChb+koxEKiAoiiSVRpT
	cagY/+9KzK37pWcsZtG8iNsbtXI0rrdN6ekywodKZST2kC0P/k02rw2mI8KHtM/eGL
	0vlaaYp4SHKyENVXIa4Tl6vClioyt8OFo4sFibm4+VJa1fNESPueB9rrAjtPD+fAUd
	/MDU1aVL/FPqayZ7UGoBaHrbZ31VwiyC4NV25j/I9MMit87LEZRAz8ikJgRzvTzjGL
	T2eAQaM6HnuuH/tAln2WxUlXxyboUGODrNmiHuKv83GMHyhmgYHdWUnoLizzm8OiN1
	P0os1VaIFsqFi52xY+O2ax/Y=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Dec 2019 16:18:19 +0200
Message-Id: <20191231141819.5037-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [zeus][PATCH] systemd: Upgrade 243 -> 243.2
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
X-List-Received-Date: Tue, 31 Dec 2019 14:18:23 -0000

Bugfix-only changes on the 243 stable branch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../systemd/{systemd-boot_243.bb => systemd-boot_243.2.bb}    | 0
 .../systemd/{systemd-conf_243.bb => systemd-conf_243.2.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                         | 4 +---
 .../recipes-core/systemd/{systemd_243.bb => systemd_243.2.bb} | 0
 4 files changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_243.bb => systemd-boot_243.2.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_243.bb => systemd-conf_243.2.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_243.bb => systemd_243.2.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_243.bb b/meta/recipes-core/systemd/systemd-boot_243.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_243.bb
rename to meta/recipes-core/systemd/systemd-boot_243.2.bb
diff --git a/meta/recipes-core/systemd/systemd-conf_243.bb b/meta/recipes-core/systemd/systemd-conf_243.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-conf_243.bb
rename to meta/recipes-core/systemd/systemd-conf_243.2.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 7f3a59c208..18f17d28ac 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,10 +14,8 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "efb536d0cbe2e58f80e501d19999928c75e08f6a"
+SRCREV = "fab6f010ac6c3bc93a10868de722d7c8c3622eb9"
 SRCBRANCH = "v243-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
-
-PV_append = "+${SRCPV}"
diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/systemd/systemd_243.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_243.bb
rename to meta/recipes-core/systemd/systemd_243.2.bb
-- 
2.17.1


