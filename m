Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 04D5F6E99B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 12:42:02 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id c11so276394lbj.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 04:42:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bgTxQxQWV+SWHb9LlRqa2Mlm9dN81fStELRHoKMCLUo=;
	b=K/tECyQzFQHPlQzrPAdYu+wz3jlBALrqnzHG2brc6dk0UTXG6V56enKErEa80nMo26
	hmIU7WtynA2DkW3AB6JzjEaiQWblYh7Abc1d60A8SsIAX3iJPSy4YMhUkyZKTl72C4tZ
	5MhHgmY/eW1h7+0vyk11src6kcc0bVPBitBL/rQ1iXuvwnjVdbswf7tA6dzuCjiwncSc
	uxH/zllzCDBQDrMuav7Dc0RzmyHtIRL9UEqXnwJYxuajHRuddW6S/+kWg7x/sYV/MywN
	w/dx84nI54/aBsXlBnSB8y26oxQwTt+AaX2duuvRj27w4j77KKaR2wtQkCrmL2n+Rw1f
	Cj6g==
X-Gm-Message-State: ALoCoQkgvoUCfoRQjzjE1H+aGCYReh+ymvSMahYBo/PTz4CymtjBgeAsYxzTfUkbVZqR2MR5STYP
X-Received: by 10.153.3.2 with SMTP id bs2mr849673lad.5.1390912923179;
	Tue, 28 Jan 2014 04:42:03 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194]) by mx.google.com with ESMTPSA id
	mx3sm16345665lbc.14.2014.01.28.04.42.02 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 28 Jan 2014 04:42:02 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2014 14:41:52 +0200
Message-Id: <1390912914-31576-5-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1390912914-31576-1-git-send-email-fathi.boudra@linaro.org>
References: <1390912914-31576-1-git-send-email-fathi.boudra@linaro.org>
Subject: [PATCHv3 4/6] ltp: update ffsb-6.0-rc2 license file path
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
X-List-Received-Date: Tue, 28 Jan 2014 12:42:03 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/recipes-extended/ltp/ltp_20140115.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20140115.bb b/meta/recipes-extended/ltp/ltp_20140115.bb
index 287f73d..d9c707b 100644
--- a/meta/recipes-extended/ltp/ltp_20140115.bb
+++ b/meta/recipes-extended/ltp/ltp_20140115.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "\
     file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
     file://testcases/kernel/controllers/freezer/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
     file://testcases/kernel/controllers/freezer/run_freezer.sh;beginline=5;endline=17;md5=86a61d2c042d59836ffb353a21456498 \
-    file://testcases/kernel/fs/ext4-new-features/ffsb-6.0-rc2/COPYING;md5=c46082167a314d785d012a244748d803 \
     file://testcases/kernel/hotplug/memory_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
     file://testcases/kernel/hotplug/cpu_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
     file://testcases/open_posix_testsuite/COPYING;md5=216e43b72efbe4ed9017cc19c4c68b01 \
@@ -17,6 +16,7 @@ LIC_FILES_CHKSUM = "\
     file://tools/top-LTP/proc/COPYING;md5=aefc88eb8a41672fbfcfe6b69ab8c49c \
     file://tools/pounder21/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
     file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+    file://utils/ffsb-6.0-rc2/COPYING;md5=c46082167a314d785d012a244748d803 \
 "
 
 DEPENDS = "attr libaio libcap acl openssl"
-- 
1.8.1.2


