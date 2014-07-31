Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AEEC370988
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 01:16:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s6V1GUSX020572
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 18:16:30 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 30 Jul 2014 18:16:30 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Jul 2014 20:16:26 -0500
Message-ID: <12ddb0d8215c165212835fd07d276afa2bdb1334.1406769215.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1406769215.git.mark.hatle@windriver.com>
References: <cover.1406769215.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] tune-mips*: Ensure tunes are inherited in order
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
X-List-Received-Date: Thu, 31 Jul 2014 01:16:29 -0000
Content-Type: text/plain

Without this, you are not able to use mips32r2 on a mips64 based tune.

We want to be able to do a tri-lib system of mips64, mips64-n32 and mips32r2.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/machine/include/tune-mips32r2.inc | 2 +-
 meta/conf/machine/include/tune-mips64.inc   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/tune-mips32r2.inc b/meta/conf/machine/include/tune-mips32r2.inc
index fb60592..c9deff8 100644
--- a/meta/conf/machine/include/tune-mips32r2.inc
+++ b/meta/conf/machine/include/tune-mips32r2.inc
@@ -1,6 +1,6 @@
 DEFAULTTUNE ?= "mips32r2"
 
-require conf/machine/include/mips/arch-mips.inc
+require conf/machine/include/tune-mips32.inc
 
 TUNEVALID[mips32r2] = "Enable mips32r2 specific processor optimizations"
 TUNECONFLICTS[mips32r2] = "n64 n32"
diff --git a/meta/conf/machine/include/tune-mips64.inc b/meta/conf/machine/include/tune-mips64.inc
index ba79e2b..9be0e0f 100644
--- a/meta/conf/machine/include/tune-mips64.inc
+++ b/meta/conf/machine/include/tune-mips64.inc
@@ -1,3 +1,3 @@
 DEFAULTTUNE ?= "mips64"
 
-require conf/machine/include/mips/arch-mips.inc
+require conf/machine/include/tune-mips32r2.inc
-- 
1.9.3


