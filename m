Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOuqJ-0002aW-Be
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 19:56:59 +0200
Received: by mail-pz0-f50.google.com with SMTP id h32so4082870dak.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 10:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Tpxhs4rsBz0YFzzZOi0pqyyo7Fsag/9pDuAoY58JzuY=;
	b=AEy7dc3nZBRsvA+AWcoCzAIEnRNj9mdc3Wnw5whTmHMIf3Tk19o/vMsLAT9eeqO+be
	JpkVfjLtV5eD3W3x8QqZDysBSDTEqhleH9ZgORBe1q5LVCwvUcri8Gc2CEbe7jN+oe26
	oXR/DH3YQy271uqYHGWhh8sug519lfQ6TnDXBdC1rHSqGCIhrIvqhNDOzUEzaDI4KCIh
	6i4syq+q906wEPNsgSi80OXyImpCvtKlU5ID23AjrsF6SJCR4BNSQt3NXTz011ozrxZq
	iPYSalwZIL2VxyyRZIznnFRJrKh2AMKPINnXn80ebjhaPMaBSBOxTZo88fXJlnLbUQri
	HKrA==
Received: by 10.68.221.35 with SMTP id qb3mr18997147pbc.136.1335808039073;
	Mon, 30 Apr 2012 10:47:19 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id sx8sm8239860pbc.53.2012.04.30.10.47.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 10:47:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 10:46:17 -0700
Message-Id: <8942cc4a6f441ba2c9df183280c4af199fe9122b.1335807802.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <392442de49633f6d0f3146fb5a86ad25e6c91015.1335807802.git.raj.khem@gmail.com>
References: <392442de49633f6d0f3146fb5a86ad25e6c91015.1335807802.git.raj.khem@gmail.com>
In-Reply-To: <cover.1335807802.git.raj.khem@gmail.com>
References: <cover.1335807802.git.raj.khem@gmail.com>
Subject: [PATCH 02/10] uclibc-0.9.33: Update to tip of 0.9.33 branch
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
X-List-Received-Date: Mon, 30 Apr 2012 17:56:59 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc_0.9.33.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc_0.9.33.bb b/meta/recipes-core/uclibc/uclibc_0.9.33.bb
index 461f5bd..43c8f74 100644
--- a/meta/recipes-core/uclibc/uclibc_0.9.33.bb
+++ b/meta/recipes-core/uclibc/uclibc_0.9.33.bb
@@ -1,8 +1,8 @@
-SRCREV="5653245fa516c5823226582d9a02b1b18d5e8925"
+SRCREV="f7c18471f1ff8f3e54e462df0e96e19739869c78"
 
 require uclibc.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
 SRC_URI = "git://uclibc.org/uClibc.git;branch=${PV};protocol=git \
-- 
1.7.5.4



