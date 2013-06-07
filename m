Return-Path: <eu@felipetonello.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by mail.openembedded.org (Postfix) with ESMTP id 05BE26A8D1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 17:18:18 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id n12so3609482oag.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2013 10:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=yJ1T9sSFpwfxmRw/7sJMea79iwhSmNkVTANCIzWcceE=;
	b=R/UxBVUaFlAvPeReLEGIdoC8MyHUfsrbKV/44t6/ZvrZiTmVClYRoUpZM6pu6uKdyt
	fOS00nopI0xeqFTUUaLQftOHhavAv9/l2HrqeYmS7WUaiibP06105r9shkCz8SjBYSmo
	rvyvfIqTn3QlcqYa6u4dDYA15ihz7ouNMsv6m9LsVHVr+JXjbxnOkgW3OXFjltjZE6tU
	AOA9zCbqR44X0zxGG2fpIZsQ5spj0OZYhdlPj221phc0uMb+YzTf+5vNngrIC8Zjv3Ki
	EsMQboXKpB35xTyKjaV4mWnvGfCTNgn8iZSkfzttyzIumjddYBbtvlchx7WhWdTqp6+O
	qeuQ==
X-Received: by 10.182.40.202 with SMTP id z10mr13672724obk.74.1370625499277;
	Fri, 07 Jun 2013 10:18:19 -0700 (PDT)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id r4sm1434702oem.3.2013.06.07.10.18.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 07 Jun 2013 10:18:18 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2013 10:18:01 -0700
Message-Id: <1370625481-4539-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQn6QYGikzpXlb1usRpFWbo3/Jkk3F2e4EtV0amYbaMWcwq8H45f/p8dBQts9xRNqt+Dhhcm
Subject: [PATCH] libxml2: added python dependency to nativesdk
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
X-List-Received-Date: Fri, 07 Jun 2013 17:18:19 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

This is necessary since libxml2 has python dependency.

This patch will fix this error:
...
/path/to/build/system/4.7.2/ld: cannot find -lpython2.7
...
ERROR: Task 4152 (virtual:nativesdk:meta/recipes-core/libxml/libxml2_2.9.0.bb, do_compile) failed with exit code '1'

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta/recipes-core/libxml/libxml2.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 91cc14b..9b2af0f 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=2044417e2e5006b65a8b9067b683fcf1 \
                     file://list.c;beginline=4;endline=13;md5=cdbfa3dee51c099edb04e39f762ee907 \
                     file://trio.c;beginline=5;endline=14;md5=6c025753c86d958722ec76e94cae932e"
 
+DEPENDS_class-nativesdk = "nativesdk-python"
 DEPENDS_class-native = "python-native"
 DEPENDS =+ "zlib"
 
-- 
1.8.1.4


