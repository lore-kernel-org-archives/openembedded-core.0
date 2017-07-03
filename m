Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 92A3760806
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 08:03:34 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id h22so97861862lfk.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 01:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=RYzJOXjtvmk5/HC1s1oWL0Oq7twdKk979sDAxdQCxV4=;
	b=KbVy3+47AlzodW219SHhVgmA7gWWTE6mpSXUdc2E1zMCx6VnmXmwSSp4A02hbVqNSr
	DfkNOpMICFly002FuN0CPAQa3VrIAQELDj/gbH+g4AnSkPaIfDOs+rnGdSTHD/GYFkCz
	Gq1qvoNF6bj1teywU+kr1MNt/eX33AuvFks0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RYzJOXjtvmk5/HC1s1oWL0Oq7twdKk979sDAxdQCxV4=;
	b=Dtr65vK5jlMCI6cCgKNICa+huOGxu9FQd3Pqf9WKEEtQd9lWPC7aKbPuE7Q/Iz4/8f
	MQTLUNPO23IzQnXMpJTbb2ksKM5LSQQWR7rJeH0D3RIYpLUGjewAlXXaQ2ALtqGWrWxg
	YvPLFZO/efJof+EqjGCD+OWtV3unDBDS5trlTW8YIZYnaeRVu8q7sg8+rTG7n00zLVIL
	t7FeFlx+B4L/gubXHGjNeekltqWagePbKWXf+xxtdWNhwxhVhF3XVBP+/zyOdRIgRpBs
	M+hg9QdridumJp5ohx4/cQY1ElROt4i9HlfIzeKUTFOVkkCNzPme9lBlPaNf/Ox1pPX6
	9jGw==
X-Gm-Message-State: AKS2vOxAKFmyPOj3e6GH3JO7Z3rWITjD8glG6jQlGTSPEY2+mqZEwOJs
	qVh44ZdGcVhXiDrLVY4+fw==
X-Received: by 10.46.83.13 with SMTP id h13mr9594965ljb.102.1499069014828;
	Mon, 03 Jul 2017 01:03:34 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-101.elisa-laajakaista.fi.
	[91.156.68.101])
	by smtp.gmail.com with ESMTPSA id s199sm866548lfs.4.2017.07.03.01.03.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jul 2017 01:03:33 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jul 2017 11:03:31 +0300
Message-Id: <20170703080331.5973-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.13.0
Cc: naresh.kamboju@linaro.org
Subject: [PATCH] ltp: add acl, attr, curl and util-linux runtime dependencies
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
X-List-Received-Date: Mon, 03 Jul 2017 08:03:35 -0000

* Use a list and re-order alphabetically to make it easier to read and
  update.
* Add missing runtime dependencies:
  - acl (getfacl/setfacl commands are required)
  - attr (getfattr/setfattr commands are required)
  - curl (curl command is required)
  - util-linux (ipcs command is required)

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/recipes-extended/ltp/ltp_20170516.bb | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20170516.bb b/meta/recipes-extended/ltp/ltp_20170516.bb
index f537d60c15..564fdcf8c2 100644
--- a/meta/recipes-extended/ltp/ltp_20170516.bb
+++ b/meta/recipes-extended/ltp/ltp_20170516.bb
@@ -95,7 +95,27 @@ do_install(){
     cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
 }
 
-RDEPENDS_${PN} = "perl e2fsprogs-mke2fs python-core libaio bash gawk expect ldd unzip gzip cpio cronie logrotate which at"
+RDEPENDS_${PN} = "
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
 
@@ -106,4 +126,3 @@ INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 # However, test_arch_stripped is already stripped, so...
 INSANE_SKIP_${PN} += "already-stripped"
-
-- 
2.13.0


