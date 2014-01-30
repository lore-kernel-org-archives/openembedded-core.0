Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 19B846EA98
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 04:11:47 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id q10so2553405pdj.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 20:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=d75kmEBrDCPCM9npGC2oNlGBbIth9vzin772U8MI0sQ=;
	b=VWcrfCLhBFjEmif7v2ieGnG+emkSR5hupCaa6nC4J2kKX/yAIN1036yFhzKYI03knA
	dwn9x+ltfICpUUSqIvnOFgGC0BS7i95wua3NoTZwx7J7gdT1WupUYWJEOmTKu0ESkRUX
	UhPWhefoK2U/DiTabUwtPRtGLeVG+/t2px9zAERZitSr0W3CNePdhNb8YAWHmE+D2e3K
	Hsf7QwSSoJflxxEAsso4vtxHUloGhXMKiQa7Xb5X2uqbhkOMvpfLKVOb0zRHVQl6cCbq
	7O8zqkA73MTuvUvpZ3lObFGiyXltUm/Wzzxw4f/SAcuZGeSYHgtnJ3K/NecCfD3VObek
	IG5g==
X-Received: by 10.66.175.4 with SMTP id bw4mr12175827pac.56.1391055108350;
	Wed, 29 Jan 2014 20:11:48 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	iu7sm12388951pbc.45.2014.01.29.20.11.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Jan 2014 20:11:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 20:12:25 -0800
Message-Id: <bb8a069d215f2ff378a621616465be95a26d0f08.1391054829.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
References: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
In-Reply-To: <cover.1391054829.git.raj.khem@gmail.com>
References: <cover.1391054829.git.raj.khem@gmail.com>
Subject: [PATCH 03/15] python3native.bbclass: Add python3 abstraction class
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
X-List-Received-Date: Thu, 30 Jan 2014 04:11:47 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/python3native.bbclass |    7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta/classes/python3native.bbclass

diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
new file mode 100644
index 0000000..f86374f
--- /dev/null
+++ b/meta/classes/python3native.bbclass
@@ -0,0 +1,7 @@
+PYTHON_BASEVERSION = "3.3"
+
+inherit python-dir
+
+PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
+EXTRANATIVEPATH += "${PYTHON_PN}-native"
+DEPENDS += " ${PYTHON_PN}-native "
-- 
1.7.10.4


