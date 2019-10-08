Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9A7197F360
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 10:46:10 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id n14so18768276wrw.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 03:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=jRb6qwgjTQxOc2Ws4DkEMHCnnh5p5Sh/1sDaws4EVOM=;
	b=nf0mPaOnyFWytM1nFQoaCncDaxOtbXjJ6DaUukn2BsOoD0NohRY9T19zE0zBgZMsdO
	BSOCKPoOSeG73zyl/iValPjEe/x809asvrj0X44CKdK1JtAYPCs3RsPOPwRCEg8YIa2J
	sdrm8NNUdALPf4ftOSdpyX2ICpOGOSES4l6Z1hrcw7bdEfPw+23a96DfIDXWwwzQxzy9
	RMn0ys4F/TscV9fnna4mStIffGII+gtUUXNY6Nqq6pw7pSdhHuK7xl8/DWCg3z+StROE
	Y485YRSnQwWn01PLzkQjgCQJmV66PFupo/rg7igBPbVH7GyGppiNwLF4rL0+euUmtG5d
	7Sxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jRb6qwgjTQxOc2Ws4DkEMHCnnh5p5Sh/1sDaws4EVOM=;
	b=mdAptWO/dQkibwoTfUujVPEX2KEG+9FPI+iKn29RXBToHnsJGWmUrHsxRjN1D/hWsa
	2M871piXlFegCMzEkSPW2UPReLF3wEDIBUkoD3uqr19Oxf3JWk7MD78f1qCFZba/X0bO
	10xo57/ez77ey074impO2JENz5BmxKjelWPs6NCQ6Vc8GZ55Er78j+SD+L2bwJUBIbh1
	p3DFPE2kXNr428ern9k+s7kRaFZdr4X+/y4OHuZp6fGBEq4+37w5l2+Bd1VTpnMFkbDe
	osRsFFRvYeTFyRiL8kp8+eVn67APmnmX6IF7S50XFH1o4OFEAhumKe6S4yPLOsB4i0YY
	l3Gw==
X-Gm-Message-State: APjAAAUc2N/UZpGc+jEWX6djn1GO3HJE3vznuNp2Xc45jbgO1iEqMeEC
	bBRDbepNjbfKZ/i+5brBwVt1WwvgOXU=
X-Google-Smtp-Source: APXvYqxEEieYGm+NhMYsNfXqZ2HcGXYpdV9YeWLo1XgpkmNFUe/ME3kSiLvnbDqze4EMRATrkX2Lug==
X-Received: by 2002:a5d:4944:: with SMTP id r4mr25301596wrs.283.1570531571011; 
	Tue, 08 Oct 2019 03:46:11 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	x129sm3387191wmg.8.2019.10.08.03.46.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 08 Oct 2019 03:46:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 11:46:05 +0100
Message-Id: <20191008104605.28981-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008104605.28981-1-ross.burton@intel.com>
References: <20191008104605.28981-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] bluez5: remove upstream rejected patch to test suite
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
X-List-Received-Date: Tue, 08 Oct 2019 10:46:11 -0000
Content-Transfer-Encoding: 8bit

0001-test-gatt-Fix-hung-issue.patch was added to solve a problem with the test
case, but the test passes without it and upstream don't agree that this is
fixing the test case[1].

[1] https://marc.info/?l=linux-bluetooth&m=153509658106588&w=2

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 -
 .../0001-test-gatt-Fix-hung-issue.patch       | 43 -------------------
 2 files changed, 44 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index f582a07e22a..ced44b474bc 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -53,7 +53,6 @@ SRC_URI = "\
     file://run-ptest \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
     file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
-    file://0001-test-gatt-Fix-hung-issue.patch \
     file://0001-Makefile.am-Fix-a-race-issue-for-tools.patch \
     file://CVE-2018-10910.patch \
     file://gcc9-fixes.patch \
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
deleted file mode 100644
index e90b6a546fd..00000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 61e741654cc2eb167bca212a3bb2ba8f3ba280c1 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <Mingli.Yu@windriver.com>
-Date: Fri, 24 Aug 2018 12:04:03 +0800
-Subject: [PATCH] test-gatt: Fix hung issue
-
-The below test hangs infinitely
-$ unit/test-gatt -p  /robustness/unkown-request -d
-/robustness/unkown-request - init
-/robustness/unkown-request - setup
-/robustness/unkown-request - setup complete
-/robustness/unkown-request - run
-  GATT: < 02 17 00                                         ...
-  bt_gatt_server:MTU exchange complete, with MTU: 23
-  GATT: > 03 00 02                                         ...
-  PDU: = 03 00 02                                         ...
-  GATT: < bf 00
-
-Actually, the /robustness/unkown-request test does
-no action.
-
-Upstream-Status: Submitted [https://marc.info/?l=linux-bluetooth&m=153508881804635&w=2]
-
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- unit/test-gatt.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/unit/test-gatt.c b/unit/test-gatt.c
-index c7e28f8..b57373b 100644
---- a/unit/test-gatt.c
-+++ b/unit/test-gatt.c
-@@ -4463,7 +4463,7 @@ int main(int argc, char *argv[])
- 			test_server, service_db_1, NULL,
- 			raw_pdu(0x03, 0x00, 0x02),
- 			raw_pdu(0xbf, 0x00),
--			raw_pdu(0x01, 0xbf, 0x00, 0x00, 0x06));
-+			raw_pdu());
- 
- 	define_test_server("/robustness/unkown-command",
- 			test_server, service_db_1, NULL,
--- 
-2.7.4
-
-- 
2.20.1


