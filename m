Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4B1FB7F877
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 09:39:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47HLPz1Zfrz8t
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 10:39:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574156375;
	bh=yhTp78inZuitJpayJwfZrPErfjODh3rOVuUxAQNHFu4=;
	h=From:To:Subject:Date:From;
	b=g63nIY2kELT9wJZvXGQI6K7QdTNrBNTyfH86gOuo7QVcik34a07aTfk6kAHGALwxI
	wFjXoMNUemBroIkEfMdZGRRbW5/dfVsyJc1fd6dAPwnsaX3Fd+o+8fgKADYfQS/2Wl
	OoR+XickJ3LEMe7HaJ2heIh0l/Wf3Pi7bkzTf1Jn5J+0rMEtCPb5DfDR1pzi7cbTEN
	9V8fvtBhT51hruJe5gbr41IhQEKJxvRFME/DR3vBiNQjK1L9uqqwf3Q8cQ7Q5XtTw9
	zBGncEHzAT4jJ03qBQoo6S3EIdh0nX/ee56nhFmQ0gGiS72JvWeOoNvVGgTQmke4M1
	EVSjEmsheWcxs0vs7LaBlISXzME8SxHVYZu3AOlKi8w6fqbgYJmsP2vTqMox3RVV1S
	r2v0AT4rBFmjtmg44PEeNfHYUEZALimCy0nawZWs/mfC+UNzITnZ7dUTBpjdRLW2XI
	E5qmmF7PfqWWmcvLWOilVZO/+SAAYaCve75LuSuc2gDAEL4Y3R3Ypezw//RdhwLCoN
	qtWGTaOXC52Sa5Ozr/EDwoVnEiTSkrQfvYaZtSJCNSuEosDytx22yU12aPb9E0Tzkm
	WBpK94sorXxguJ0TUksM8xe6MpGOPKFb/Kzpd6PQdzKD6+8W/xs4ErPHcNw4B3CpSi
	zp/+LkOeGMVUsZ4Fy6/jzvt0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2019 11:39:33 +0200
Message-Id: <20191119093933.7872-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] libpcap: upgrade 1.9.0 -> 1.9.1
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
X-List-Received-Date: Tue, 19 Nov 2019 09:39:36 -0000

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

-libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
 Removed since this is included in 1.9.1.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[CVE-2018-16301 CVE-2019-15161 CVE-2019-15162 CVE-2019-15163 CVE-2019-15164 CVE-2019-15165]
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...-add-missing-limits.h-for-musl-syste.patch | 29 -------------------
 .../{libpcap_1.9.0.bb => libpcap_1.9.1.bb}    |  5 ++--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
 rename meta/recipes-connectivity/libpcap/{libpcap_1.9.0.bb => libpcap_1.9.1.bb} (88%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch b/meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
deleted file mode 100644
index 01773834c7..0000000000
--- a/meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From aafa3512b7b742f5e66a5543e41974cc5e7eebfa Mon Sep 17 00:00:00 2001
-From: maxice8 <thinkabit.ukim@gmail.com>
-Date: Sun, 22 Jul 2018 18:54:17 -0300
-Subject: [PATCH] pcap-usb-linux.c: add missing limits.h for musl systems.
-
-fix compilation on musl libc systems like Void Linux and Alpine.
-
-Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/d557c98a16dc254aaff03762b694fe624e180bea]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- pcap-usb-linux.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/pcap-usb-linux.c b/pcap-usb-linux.c
-index 6f8adf65..b92c05ea 100644
---- a/pcap-usb-linux.c
-+++ b/pcap-usb-linux.c
-@@ -50,6 +50,7 @@
- #include <stdlib.h>
- #include <unistd.h>
- #include <fcntl.h>
-+#include <limits.h>
- #include <string.h>
- #include <dirent.h>
- #include <byteswap.h>
--- 
-2.17.1
-
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb b/meta/recipes-connectivity/libpcap/libpcap_1.9.1.bb
similarity index 88%
rename from meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.9.1.bb
index 78361561e6..a0f66ac0fa 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.9.1.bb
@@ -11,10 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
 DEPENDS = "flex-native bison-native"
 
 SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
-           file://0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch \
            "
-SRC_URI[md5sum] = "dffd65cb14406ab9841f421732eb0f33"
-SRC_URI[sha256sum] = "2edb88808e5913fdaa8e9c1fcaf272e19b2485338742b5074b9fe44d68f37019"
+SRC_URI[md5sum] = "21af603d9a591c7d96a6457021d84e6c"
+SRC_URI[sha256sum] = "635237637c5b619bcceba91900666b64d56ecb7be63f298f601ec786ce087094"
 
 inherit autotools binconfig-disabled pkgconfig bluetooth
 
-- 
2.17.1


