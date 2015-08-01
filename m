Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 646A976659
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Aug 2015 09:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7195rIp018718; Sat, 1 Aug 2015 10:06:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SpD2jNENSOmN; Sat,  1 Aug 2015 10:06:30 +0100 (BST)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7196OsW018779
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 1 Aug 2015 10:06:26 +0100
Received: from richard by ted with local (Exim 4.84_RC1)
	(envelope-from <richard@dan.rpsys.net>)
	id 1ZLSkF-0000tb-Nw; Sat, 01 Aug 2015 10:06:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Aug 2015 10:06:11 +0100
Message-Id: <1438419973-3394-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1438419973-3394-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1438419973-3394-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/4] mpfr: 3.1.2 -> 3.1.3
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
X-List-Received-Date: Sat, 01 Aug 2015 09:06:32 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../mpfr/{mpfr-3.1.2 => mpfr-3.1.3}/long-long-thumb.patch             | 0
 meta/recipes-support/mpfr/{mpfr_3.1.2.bb => mpfr_3.1.3.bb}            | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/mpfr/{mpfr-3.1.2 => mpfr-3.1.3}/long-long-thumb.patch (100%)
 rename meta/recipes-support/mpfr/{mpfr_3.1.2.bb => mpfr_3.1.3.bb} (73%)

diff --git a/meta/recipes-support/mpfr/mpfr-3.1.2/long-long-thumb.patch b/meta/recipes-support/mpfr/mpfr-3.1.3/long-long-thumb.patch
similarity index 100%
rename from meta/recipes-support/mpfr/mpfr-3.1.2/long-long-thumb.patch
rename to meta/recipes-support/mpfr/mpfr-3.1.3/long-long-thumb.patch
diff --git a/meta/recipes-support/mpfr/mpfr_3.1.2.bb b/meta/recipes-support/mpfr/mpfr_3.1.3.bb
similarity index 73%
rename from meta/recipes-support/mpfr/mpfr_3.1.2.bb
rename to meta/recipes-support/mpfr/mpfr_3.1.3.bb
index c05e956..af19b54 100644
--- a/meta/recipes-support/mpfr/mpfr_3.1.2.bb
+++ b/meta/recipes-support/mpfr/mpfr_3.1.3.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz \
            file://long-long-thumb.patch \
            "
 
-SRC_URI[md5sum] = "e3d203d188b8fe60bb6578dd3152e05c"
-SRC_URI[sha256sum] = "399d0f47ef6608cc01d29ed1b99c7faff36d9994c45f36f41ba250147100453b"
+SRC_URI[md5sum] = "6969398cd2fbc56a6af570b5273c56a9"
+SRC_URI[sha256sum] = "6835a08bd992c8257641791e9a6a2b35b02336c8de26d0a8577953747e514a16"
 
 S = "${WORKDIR}/mpfr-${PV}"
 
-- 
2.1.0


