Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SfPxG-0001O3-Lg
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 08:24:22 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so4635855pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 23:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=bIRZpHO6QqhHwhnWFMoh0X1Npn6WcNRJMBdYd6ECMPs=;
	b=BXnKz7SpOTvl6Jqbt7fZPSFvikbT1Aenn+e7wk7Ta8i5kwXwu+pkbkHZXJ8sDbLRfa
	LyQoVTD63GWk8U8/3fjo+s2qTILmJoB7QMylLED3UhYMN0cuGxNZ1BuVFFu9CQBU+xYI
	zItY0GfaM/v7U13OLqwPyfsQVG+AG9mUWFHrPxlf6lHPSjr9fjjM1+itrcm9kyt26Wn1
	l7vdUw0vCwoSYkhEUqC4XvI77wzSjCad/J5BTSwcmyRHb94Yk4rACxjzc2jUr1LmlkBk
	dJyiQMpU8uqWQks69xoC9BR1Xy58Lz5+9Lmg4IZwj7dEv2AP4Iz+FDu753M/wAd7EiK7
	GKrg==
Received: by 10.68.228.130 with SMTP id si2mr1283805pbc.59.1339740826337;
	Thu, 14 Jun 2012 23:13:46 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id tm2sm12117280pbc.69.2012.06.14.23.13.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jun 2012 23:13:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 23:12:28 -0700
Message-Id: <1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1339740433.git.raj.khem@gmail.com>
References: <cover.1339740433.git.raj.khem@gmail.com>
Subject: [PATCH 1/9] uclibc_0.9.33.bb: Upgrade to latest git
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jun 2012 06:24:22 -0000

This is needed otherwise glib-2.0 wont run
correctly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc_0.9.33.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc_0.9.33.bb b/meta/recipes-core/uclibc/uclibc_0.9.33.bb
index 43c8f74..b72f9dd 100644
--- a/meta/recipes-core/uclibc/uclibc_0.9.33.bb
+++ b/meta/recipes-core/uclibc/uclibc_0.9.33.bb
@@ -1,8 +1,8 @@
-SRCREV="f7c18471f1ff8f3e54e462df0e96e19739869c78"
+SRCREV="7810e4f8027b5c4c8ceec6fefec4eb779362ebb5"
 
 require uclibc.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
 SRC_URI = "git://uclibc.org/uClibc.git;branch=${PV};protocol=git \
-- 
1.7.5.4



