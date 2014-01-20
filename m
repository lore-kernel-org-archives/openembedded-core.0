Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9E7806E7B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 11:40:29 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id el20so2911187lab.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 03:40:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bgTxQxQWV+SWHb9LlRqa2Mlm9dN81fStELRHoKMCLUo=;
	b=USy6mgvKFW7BTnS9rbp7gdJDSmLLvm/F5CA8AL9puISSAkXjIsIt9YSdRmt5VVKxXS
	pWeDKs2MQqiXo0iuPiTElc+TPDe5UnSWOIFxvq5OnheTMbYi82l8eoxJ9LElppidxAnf
	FbCXDpN9ksSzUdh+oEnbkdMC1YrfqLXkIW3o5mzPX1jWecF1oNXruTvdMkc/OjT/mbIf
	/zn5GlL1oak7Yd3a1x5ADUsOrRPmD4V0l2LIQgUYLLy86bTeir6FzUX95Y5POBEO4fRW
	qZNhUL9JYdjahWR6BRdHn2iOUPx5ZxM+yxLWlV3CecRgzC3bMjAPzpQh7MJQjyaOW4FI
	5qCg==
X-Gm-Message-State: ALoCoQlu8jPfy/NfGQtnmuY+ywrOXZsqYDC2mvFZ14Hw6NAaRA4iYFquJ+IkbjUjhvKr428g9/Xj
X-Received: by 10.152.28.137 with SMTP id b9mr11844433lah.4.1390218029949;
	Mon, 20 Jan 2014 03:40:29 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id gi5sm609509lbc.4.2014.01.20.03.40.28
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 20 Jan 2014 03:40:29 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2014 13:40:15 +0200
Message-Id: <1390218017-10423-6-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1390218017-10423-1-git-send-email-fathi.boudra@linaro.org>
References: <1390218017-10423-1-git-send-email-fathi.boudra@linaro.org>
Subject: [PATCHv2 5/7] ltp: update ffsb-6.0-rc2 license file path
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
X-List-Received-Date: Mon, 20 Jan 2014 11:40:31 -0000

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


