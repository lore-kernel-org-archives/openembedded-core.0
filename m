Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id E775560125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 17:33:24 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id u206so114121373wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 10:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=JzakEAiGLeCdd/1HNg2JFNzUCquVwD5J7pI3ER3putw=;
	b=QEGawsPDYasrDPxaFaNgvwvGKfwIH3odPEoBLBr5NU0fh6FSxUZX1HW9yOSkCX2LoU
	kHXJTmyE2VFx864sDjnF7g93OdZYTShs5k+GfJpldUDNCP5zVbVUyQropeDwcb1bNBPb
	SW3JJvvsByK5xhoKGnc4VbeVC5syePBaQzEfdWvhxaBhl386Eyr18IYJ2px2p7CcoYrV
	jdFVPCo7cMopiPSAn5xbhc5oIJc5RKvMg2VPKSEhe/29W5jK8MImtasEc060i37jHCYA
	iTGi848mYaA3xThP4NrM7tDlaWMAoblqWV1WulMjt+heuwiSIC7NhoxELtDNwHp0sfvQ
	dKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JzakEAiGLeCdd/1HNg2JFNzUCquVwD5J7pI3ER3putw=;
	b=it+ERwOljCWv67jOVoEn1lBMs7+H4uzHU+YDyoUBCJG98Uhp5F2t84JO1OJZ8qh4cI
	am4Empf74lTangk0ADhksWoiE4j+E3rbwZlcis30jQua9mk9iZGab6By2IGIOZTj4zGg
	Muqs5zSfL0jCfSyuG03BKwc58rwi+OmoZV8qtw6rsdpFRFTwuvKTRNfmJxnSX052lfHP
	09qdgmAijD/RNsiocwOW9VKDNDWLfBUsSCUwOu2wkhWruuKmZrlNuBLhbZlsAbr7Yf6k
	Tgs6mlq3CfC9hsJJtUxec8cJXCRq39h4s8GIVNcWRTiu6cjpWz9Ntiqzv63Y0yIoUz4w
	B+uQ==
X-Gm-Message-State: AD7BkJK3Tn5TkgxNnMTfRgYuDZM+7UvkORgYm8hL63kh4EPXm1ZYz7+5rECPxmUV4JZaSiTt
X-Received: by 10.28.27.73 with SMTP id b70mr19661743wmb.19.1460396004712;
	Mon, 11 Apr 2016 10:33:24 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	y3sm18407302wmy.17.2016.04.11.10.33.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Apr 2016 10:33:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Apr 2016 18:33:22 +0100
Message-Id: <1460396002-31970-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] oeqa/selftest/sstatetests: remove obsolete exclusion
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
X-List-Received-Date: Mon, 11 Apr 2016 17:33:25 -0000

These changes have been fixed in oe-core now, so remove the workaround.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/sstatetests.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index d41b1d3..6a9ae9a 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -329,8 +329,6 @@ MACHINE = \"qemuarm\"
             f = {}
             for root, dirs, files in os.walk(d):
                 for name in files:
-                    if "meta-environment" in root or "cross-canadian" in root:
-                        continue
                     if "do_build" not in name:
                         # 1.4.1+gitAUTOINC+302fca9f4c-r0.do_package_write_ipk.sigdata.f3a2a38697da743f0dbed8b56aafcf79
                         (_, task, _, shash) = name.rsplit(".", 3)
-- 
2.8.0.rc3


