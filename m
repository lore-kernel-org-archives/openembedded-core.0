Return-Path: <petter@technux.se>
Received: from vsp-authed-01-02.binero.net (vsp-authed02.binero.net
	[195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id C73F6601A2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 21:20:14 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-01-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Wed,  7 May 2014 23:20:22 +0200 (CEST)
Received: from eldbvzzwp1-7x.lan (81-229-90-163-no67.tbcn.telia.com
	[81.229.90.163]) (Authenticated sender: petter@technux.se)
	by smtp-10-01.atm.binero.net (Postfix) with ESMTPSA id 521AE3A141;
	Wed,  7 May 2014 23:20:08 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 May 2014 23:19:47 +0200
Message-Id: <b481b46603ad2ee97a9cc55890293e24db85b8e7.1399497346.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1399497346.git.petter@technux.se>
References: <cover.1399497346.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCH 01/13] systemtap: remove usage of FILESPATH
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
X-List-Received-Date: Wed, 07 May 2014 21:20:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #4497]

Usage of FILESPATH is discouraged, since it can make recipes harder to
bbappend. All current patches in systemtap are shared, move them to
files dir instead, since it's included in base FILESPATH.

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 .../{systemtap => files}/docproc-build-fix.patch   |    0
 .../obsolete_automake_macros.patch                 |    0
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    2 --
 3 files changed, 2 deletions(-)
 rename meta/recipes-kernel/systemtap/{systemtap => files}/docproc-build-fix.patch (100%)
 rename meta/recipes-kernel/systemtap/{systemtap => files}/obsolete_automake_macros.patch (100%)

diff --git a/meta/recipes-kernel/systemtap/systemtap/docproc-build-fix.patch b/meta/recipes-kernel/systemtap/files/docproc-build-fix.patch
similarity index 100%
rename from meta/recipes-kernel/systemtap/systemtap/docproc-build-fix.patch
rename to meta/recipes-kernel/systemtap/files/docproc-build-fix.patch
diff --git a/meta/recipes-kernel/systemtap/systemtap/obsolete_automake_macros.patch b/meta/recipes-kernel/systemtap/files/obsolete_automake_macros.patch
similarity index 100%
rename from meta/recipes-kernel/systemtap/systemtap/obsolete_automake_macros.patch
rename to meta/recipes-kernel/systemtap/files/obsolete_automake_macros.patch
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index c280313..0d68dd1 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -8,8 +8,6 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://obsolete_automake_macros.patch \
           "
 
-FILESPATH = "${FILE_DIRNAME}/systemtap"
-
 # systemtap doesn't support mips
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64).*-linux'
 
-- 
1.7.9.5


