Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id EBE446DC16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 21:57:15 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id w7so2932505lbi.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 13:57:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bgTxQxQWV+SWHb9LlRqa2Mlm9dN81fStELRHoKMCLUo=;
	b=PP9KYHrTE8H5ErnORLChZozvC6bexRgXDpznb+75NQUPHeseFthuWluiNnixD7GiFY
	W6wdLhrffd2aIQx6jjH4hIf69lU4VTbY4Tx3mvbtlniySXUzQzdr0auwacsLCgR/V+Wr
	x+2VG75E0BXNXmDCkNAQddWKHMT2w/hf43TiH1oQAdQTeBhltwzctY6qgzNRV7Y5vx8s
	2WuKubvGxT3bjl8A3muhv9LkLJfZ6RS0Mhb6nCa0UbqgWhr4tI1b4W18n5FG2V2FTbY7
	9/KUnesm3Cu/T0WFebnqNcUOtgMP4TI/fra43hdLrt5Rak5obLHuG/pKwsq9+Dbrxv57
	R6oQ==
X-Gm-Message-State: ALoCoQl1zadfoGOpq/RaC4q4VwGJ3QheqTSQW2Bphs1wyhXrUz3dEkiuOAu4qc54lRLqTBXwUKIj
X-Received: by 10.152.22.99 with SMTP id c3mr2288laf.89.1389995836179;
	Fri, 17 Jan 2014 13:57:16 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id bl6sm7612764lbb.5.2014.01.17.13.57.15
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 17 Jan 2014 13:57:15 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2014 23:57:02 +0200
Message-Id: <1389995824-9066-6-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1389995824-9066-1-git-send-email-fathi.boudra@linaro.org>
References: <1389995824-9066-1-git-send-email-fathi.boudra@linaro.org>
Subject: [PATCH 5/7] Update ffsb-6.0-rc2 license file path
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
X-List-Received-Date: Fri, 17 Jan 2014 21:57:16 -0000

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


