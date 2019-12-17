Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail.openembedded.org (Postfix) with ESMTP id 55DCB7D066
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 20:36:45 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id c16so12604224ioo.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 12:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Nkkno5L7/w8dG+r+0phLLmJPlLu1pRZSOjs13G/n6x4=;
	b=Cgbp1cTCVMoP6UV0XU5l+g9wjB8Zs0A/e9BxUyJTGigc+w0P8U/NvpWkhZFcCfXZq2
	QcNiID1cM2YCvBwlybew3r3S60C3qThokv0mTGs2O90SHN2UPFP9r6obAGQQ+59lBfX0
	2NbXe7rwj2vUVO/k5wemIHpsdrrltR7Dc+c/JTXqe40oxYeynqse0aCJFs7UzQVOkuDK
	1xeKgfhReqbHwf1yS8DR4NstMSfudCFGCNCDlKViL5jU1dFPwu9+fdcfZa6SQ0tiCdJ4
	+iyF4P5g34AR1WCEtmuLe+RE2cNgBBz0cMWMur8FWLWpXlNfF1cZjMPgJNLSZ+mpp5mY
	Qb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Nkkno5L7/w8dG+r+0phLLmJPlLu1pRZSOjs13G/n6x4=;
	b=bT7dLBrGBDcldbrj0B4MUGe7/BI5DyHqp62Brp94/Bc21OZDcaB25VASM2VwbqYRs3
	4M59/HX3q5ylo9NF07b4RfnBl4VbpGUGOeVsi6JTnBfo9+hX30EnZ2ep3iOuyGSS//8C
	yHWGhmc+xU0crV2ajPgaQAg1gmzYXenTNsYoi/vYolFc6iVKqmbBMqNFi6R46cyTGI1X
	q8mSVhMArsWhhVu4inDVRC1VaP6YBEpnkUMWKEtUwot233B0e9n4kXrw3LfMCbh6blDm
	NrFg25EZy5FfJPcIqkZKar+Pz3636swfV2ApqEG8aPMjvyXFU+vxL8BbFUXwclqD3H0+
	wEug==
X-Gm-Message-State: APjAAAWpqVu4Qr/FzrGnnntq6OFJEbYv4D6UrNrqT2GwYPVAxFcj0MAJ
	8E8w0MPhecfUYXD0FmPtXzKlQPcbDgM=
X-Google-Smtp-Source: APXvYqwy6DcixMK9iMUx3vKijUXnhW+uRPJjpnun38gxovzsJYt/vN50xZfCKP8oiePkNuE//BpHMA==
X-Received: by 2002:a5d:964e:: with SMTP id d14mr2911293ios.193.1576615006019; 
	Tue, 17 Dec 2019 12:36:46 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id 71sm7179585ilv.19.2019.12.17.12.36.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Dec 2019 12:36:45 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Dec 2019 14:36:23 -0600
Message-Id: <20191217203623.2509417-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] oeqa: reproducible: Test core-image-sato and core-image-full-cmdline
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
X-List-Received-Date: Tue, 17 Dec 2019 20:36:45 -0000
Content-Transfer-Encoding: 8bit

Adds core-image-sato and core-image-full-cmdline to the list of images
that the reproducible build test builds.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index a9110565a94..db538a4f891 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -78,7 +78,7 @@ def compare_file(reference, test, diffutils_sysroot):
 
 class ReproducibleTests(OESelftestTestCase):
     package_classes = ['deb', 'ipk']
-    images = ['core-image-minimal']
+    images = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline']
     save_results = False
 
     def setUpLocal(self):
-- 
2.23.0


