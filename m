Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id D26F371AC2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 11:13:14 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id z78so90838831lff.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jul 2017 04:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=zTTUdTdX0tMrb2/xGnJey9c0rPEs7rLvnc0+k4SdI6Q=;
	b=W5ba0jyS2MTf3jASWil9QPLNhw9Bj9BaubT3sePrXcGrY0I4aetUMLlx95d9WqGN3m
	rlO2RJ/ZBhuno2GdrH+LV7fpmuNhqLVEasxAVMxvPumeA2p6WMUaWjODcoh8gwsbREQs
	giXJHQQ2rqaAFzBGUcKjTqugHxsmg7hZD3Q4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zTTUdTdX0tMrb2/xGnJey9c0rPEs7rLvnc0+k4SdI6Q=;
	b=muqTpYUdqS4l3u6mW+3aZZ3PUbnilIF0L0xoVgT6bzipE18pfMZjcaRKjXOTxGYfdW
	J1W2CtkfasB4fo92vU7EnORUG5KeN+PDE7giR2qzupRnVTLOOw7u8FM1BGDCYUtIDQxm
	A9896Vwblt0JwVflb50eINWGzPnFpnhySiKCJ+4iRXWF3VU5VeV61EHAeVj87Y6Yt2nW
	uYi67V8ltKPqTZ8PosvACGVyxkv8pRqIcErAtIqUS4mGZz4p9YgyW+FT2Wnby+YH17af
	wTQerjJTpRTqFJqi2TRSBraTp12hP8ZkO421fgiyGDOTW3FtgqH8IjcdP+gylVGsusLP
	nSpA==
X-Gm-Message-State: AKS2vOxWZCgS0ky8G7GaQ8HWYzaNGOEU5aIcEBKNuw6U7gkV2Yd0zUA5
	DTxd4gr5EpQqpZHrmsRlEg==
X-Received: by 10.25.15.221 with SMTP id 90mr13745307lfp.10.1499253194926;
	Wed, 05 Jul 2017 04:13:14 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-101.elisa-laajakaista.fi.
	[91.156.68.101]) by smtp.gmail.com with ESMTPSA id
	h74sm3964309lfh.31.2017.07.05.04.13.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Jul 2017 04:13:13 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jul 2017 14:13:11 +0300
Message-Id: <20170705111311.13943-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.13.0
Cc: Tom Rini <trini@konsulko.com>, naresh.kamboju@linaro.org
Subject: [PATCH v3] ltp: add acl, attr, curl and util-linux runtime dependencies
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
X-List-Received-Date: Wed, 05 Jul 2017 11:13:15 -0000

* Use a list and re-order alphabetically to make it easier to read and
  update.
* Add missing runtime dependencies:
  - acl (getfacl/setfacl commands are required)
  - attr (getfattr/setfattr commands are required)
  - iproute2 (required for netns tests)
  - curl (curl command is required)
  - util-linux (ipcs command is required)

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
Changes in v3:
 * add iproute2, used by netns tests. Thanks to Tom Rini <trini@konsulko.com>

Changes in v2:
 * add missing backslash

 meta/recipes-extended/ltp/ltp_20170516.bb | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20170516.bb b/meta/recipes-extended/ltp/ltp_20170516.bb
index f537d60c15..1d5f999dd0 100644
--- a/meta/recipes-extended/ltp/ltp_20170516.bb
+++ b/meta/recipes-extended/ltp/ltp_20170516.bb
@@ -95,7 +95,28 @@ do_install(){
     cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
 }
 
-RDEPENDS_${PN} = "perl e2fsprogs-mke2fs python-core libaio bash gawk expect ldd unzip gzip cpio cronie logrotate which at"
+RDEPENDS_${PN} = "\
+    acl \
+    at \
+    attr \
+    bash \
+    cpio \
+    cronie \
+    curl \
+    e2fsprogs-mke2fs \
+    expect \
+    gawk \
+    gzip \
+    iproute2 \
+    ldd \
+    libaio \
+    logrotate \
+    perl \
+    python-core \
+    unzip \
+    util-linux \
+    which \
+"
 
 FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a /opt/ltp/testcases/data/nm01/lib.a"
 
@@ -106,4 +127,3 @@ INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 # However, test_arch_stripped is already stripped, so...
 INSANE_SKIP_${PN} += "already-stripped"
-
-- 
2.13.0


