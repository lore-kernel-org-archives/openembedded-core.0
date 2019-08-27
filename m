Return-Path: <janklare@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6E3FB7E98F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 14:52:07 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v15so3442879wml.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 07:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2JjDcXAGShID+1m+niWYyYIY8TNNi68hf5vnEPxAIVA=;
	b=FpclEU3Jkn3g2HHkS12zZWRPtwGVlnDmQDL/1NGbuqjWIfBIFY7uOwqEBpDK2cswEi
	FcHZiszsHK6qSWIUzZtWt0Gj7NduwnpHlmZNS6ckaMP4Ti2d7ka97ULMZN5YTJYpdAWv
	8gWNWbTLWdRO8EWDFRrN+vGfO+pCFHIvHRZvP9U2Z5e0F3Z+roh4ZpC2gM1ACTxgojnv
	CElxORWd5Ru/rbT2Z5Gqkp/H6UoYJMde/x34LVfkl+NprL739HCEWQmOTcd9bvHTj0/Y
	5UibnThj07L0pY/uhQj8MzxkbUCo2OLs6WzI+uWq+2vAwJHjCMF4enzwT/Z5VsxgSyCu
	wOMA==
X-Gm-Message-State: APjAAAV8Y+kCAP88sbG9wFaVtcdU0+qMq+pWo+8KhRsTsUFh0uZkpX4N
	dVUvtf+pdgPadOPEG/xa/F3qn72+
X-Google-Smtp-Source: APXvYqxyY3tyLg+0v0fUuFOR3nVZBiR7V7bJzezgt7cUsZew0LMXhVKGirK+PlVxDRmsv7mXCN7LLw==
X-Received: by 2002:a1c:2d87:: with SMTP id
	t129mr28586324wmt.157.1566917527684; 
	Tue, 27 Aug 2019 07:52:07 -0700 (PDT)
Received: from localhost.localdomain ([185.27.182.30])
	by smtp.gmail.com with ESMTPSA id 74sm4393373wma.15.2019.08.27.07.52.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Aug 2019 07:52:06 -0700 (PDT)
From: Jan Klare <jan.klare@bisdn.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 16:52:04 +0200
Message-Id: <20190827145204.32598-1-jan.klare@bisdn.de>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [warrior][PATCH v3] systemd: update SRCREV for systemd v241-stable
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
X-List-Received-Date: Tue, 27 Aug 2019 14:52:07 -0000
Content-Transfer-Encoding: 8bit

Currently systemd 241 does break for kernels 5.2+ with the error described here:
* https://github.com/systemd/systemd/issues/12784

The issue has been fixed in master and will be fixed in the release 243. The
necessary patches have been backported to systemd/systemd-stable in the branch
v241-stable, but currently in warrior an old version of that branch is pulled
in. 

This patch updates the SRCREV to the latest commit from that branch and
therefore pulls in the needed fix to run systemd 241 on 5.2+ kernels.

Signed-off-by: Jan Klare <jan.klare@bisdn.de>
---
 meta/recipes-core/systemd/systemd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 5bd88ed6ed..2b9c291959 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "c1f8ff8d0de7e303b8004b02a0a47d4cc103a7f8"
+SRCREV = "511646b8ac5c82f210b16920044465756913d238"
 SRCBRANCH = "v241-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
-- 
2.20.1 (Apple Git-117)


