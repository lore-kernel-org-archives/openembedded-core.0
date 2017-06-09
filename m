Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7683478273
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 03:41:45 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id v14so6456618pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 20:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pYpP+1spuccw0hK4Ef6GUam8PMFMSPWD14OnQFdvYPc=;
	b=vghv7aeniwIkBrlM4ZbTtt4HWuse3oqB2fq/xGVYE5+UGgx1wbol8iOuz0aYTcZR0A
	Z41HLgEctBEaIwUXuf1fen3YdGp2SqQ1306jMtdt4GZp7BnLVVxlC1UJJWUndQrRCOI1
	jB6klaYzMLv+p+MGRzEwydISlXI+Gww9W7HFGIdIYiBs/wpxKO4IamPvxIfs7Qo5G1Rc
	QFQzPAthdtb7T/d3OKX5g60au9N0sNnI/DycL8GaaJDDMdx+RtFg4ALJd2IqX4rikHNO
	kjYrqmjcMeytXQeZQ8yBXrjllY9gM4DaNvFKok+vfwixsNwknJGIaUiD08oJ/k96Bnp2
	moQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pYpP+1spuccw0hK4Ef6GUam8PMFMSPWD14OnQFdvYPc=;
	b=fnDCY95weAzdhWgU/+eSXi8NUgbXsU4mZeozXYijt0OvB3xeEAvYOyWg+UcVbdfbt9
	yDQNc8jsw/31LEQuL3cpijm0cPl1ZLFt7HsaJ+D0q4ehDLBi8Goz9PeS8aaSp7tyWsnu
	Q2WYdZ650lKF4npKOlddWMGdxGzzc8JmLC6jPa+2NUcQPlXzJiY30uOZcztJrrN4ClKt
	WH5Y8Df0nY2VOR01rsky6hulTM9S2cLGNlX7bIXOq7JRXqr57SEl5jlX86SyloxbRr2g
	Ms/cflAAo4X8H2J1EajdON5GMKCanOy4ckwgCUJNTZ+00noKalVQcEmHRZNoDaVFz/B8
	HJWA==
X-Gm-Message-State: AODbwcDoOchryyqSSE8eTyVhTKSgdrDcEJ9A3sx2OYSYu822z1PkJqra
	Rbu12sKGVid7LfTA
X-Received: by 10.101.76.201 with SMTP id n9mr42033918pgt.40.1496979706562;
	Thu, 08 Jun 2017 20:41:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id
	z64sm12587357pfd.20.2017.06.08.20.41.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jun 2017 20:41:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 20:41:33 -0700
Message-Id: <f871750ba329cb80968e2f090a312d39e4c4950b.1496979431.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1496979431.git.raj.khem@gmail.com>
References: <cover.1496979431.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] testimage.bbclass: Correct the comment to state right dir for test cases
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
X-List-Received-Date: Fri, 09 Jun 2017 03:41:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/testimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 1185593a1b..589ef5db93 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -13,7 +13,7 @@
 
 # You can set (or append to) TEST_SUITES in local.conf to select the tests
 # which you want to run for your target.
-# The test names are the module names in meta/lib/oeqa/runtime.
+# The test names are the module names in meta/lib/oeqa/runtime/cases.
 # Each name in TEST_SUITES represents a required test for the image. (no skipping allowed)
 # Appending "auto" means that it will try to run all tests that are suitable for the image (each test decides that on it's own).
 # Note that order in TEST_SUITES is relevant: tests are run in an order such that
-- 
2.13.1


