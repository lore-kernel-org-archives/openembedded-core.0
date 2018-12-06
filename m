Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8DD8A71A74
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 00:34:09 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id w73so10842698pfk.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2018 16:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0Bx/n3mKhRN0qllq3ee+fNRbVGMf7NKvc+jrXuVfgY8=;
	b=ezOtG0goEKEJ1qHBgfYXe2TMs5pW0ayG0ws7inwaRsn4Y8zdW4W0FloI9RTjOgXtjV
	Z3Sk+XvJchh98SL4sFhaj50JAW+nksVgJVr9XvmCs+doDzOduyz4UtCPPMtBC1BNlMYe
	H8+skE4T10PUcKTwwiDbKDdIr09Xcyp80tZMJjHd1EMgIIs8xUJVKxuJoMm7bdi21PvR
	HMf9OsrZex9tvP+A5vhhh0NQm27gp5lHjRRi8Vj6RS2UbkKwar5iwjTzlgcQUU3LStUa
	/qiVyRCwPtjBU3NptiwA9xPs2lYt6efIP14biI38g1auPHHpyHcG6szHbIFFBxADHa98
	98eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0Bx/n3mKhRN0qllq3ee+fNRbVGMf7NKvc+jrXuVfgY8=;
	b=K4xaFnrQhq+Kwdw5+Gbbkwlnc7EEUaMqYJ+ynfcWdncJdS/5I7JQR+qLZOEhlJviVu
	j4H+vQQxNok5xuJkH/dQXF6uVKEdje7AnMuyIzyXSQL9HT3/QCuN9ThWo5nnvk7Sfu49
	IBeIuHzvtdj5x7KNmiXIK9VquOeRdsZxxS5GRfJcNsziXYcK365SmzX6ICvPZHo9lBMG
	TgxEc/SwvIPjiNnwQJ4QPQ/RCKHCOPFT/t4PcfcBGhexMVm0WYKJy64fBNTyTiAcuOgf
	m/VbmerDdSxo7cRG7TVPDUukEFOMmuGqOnMhbk7XZazUc+E0FPvnvPLTdtYAkQNxOpqt
	ywXg==
X-Gm-Message-State: AA+aEWYMxYMk7c+5WxS9CGBeUrngx0BpIieEiCNPP1HX/ktEtz/hWpRd
	phkKgRG0HCfpMCnhL9i7ploWK4TsRNI=
X-Google-Smtp-Source: AFSGD/Xgvx7fXlvN05KDbRMmcE/ZFfdc32oR1s08jNxbbw8Y1Drl9K6RTktVKkyPCWFjOwi+wHiSyA==
X-Received: by 2002:a63:bc02:: with SMTP id q2mr22494499pge.116.1544056450023; 
	Wed, 05 Dec 2018 16:34:10 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::5f84])
	by smtp.gmail.com with ESMTPSA id
	134sm23773178pgb.78.2018.12.05.16.34.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Dec 2018 16:34:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2018 16:33:55 -0800
Message-Id: <20181206003355.18035-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH] recipeutils-test: Add missing LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 06 Dec 2018 00:34:09 -0000
Content-Transfer-Encoding: 8bit

Fixes
ERROR: QA Issue: recipeutils-test: Recipe file fetches files and does
not have license file information (LIC_FILES_CHKSUM) [license-checksum]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
index f6da97b2d4..7c20d9a683 100644
--- a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
+++ b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
@@ -3,7 +3,7 @@ SUMMARY = "Test recipe for recipeutils.patch_recipe()"
 require recipeutils-test.inc
 
 LICENSE = "Proprietary"
-
+LIC_FILES_CHKSUM = "file://${WORKDIR}/somefile;md5=d41d8cd98f00b204e9800998ecf8427e"
 DEPENDS += "virtual/libx11"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.19.2


