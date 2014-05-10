Return-Path: <petter@technux.se>
Received: from vsp-authed-02-02.binero.net (unknown [195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 385E365FEC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 May 2014 08:06:26 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-02-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Sat, 10 May 2014 10:06:24 +0200 (CEST)
Received: from eldbvzzwp1-7x.lan (81-229-90-163-no67.tbcn.telia.com
	[81.229.90.163]) (Authenticated sender: petter@technux.se)
	by smtp-09-01.atm.binero.net (Postfix) with ESMTPSA id 310AC3A149;
	Sat, 10 May 2014 10:06:16 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 May 2014 10:06:05 +0200
Message-Id: <ea450c444fa41ccb9d2a4354779d7c51d6eec7a6.1399671290.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a517943d9b90ee7793ec9f6734a0bdd80c38d75f.1399671290.git.petter@technux.se>
References: <a517943d9b90ee7793ec9f6734a0bdd80c38d75f.1399671290.git.petter@technux.se>
In-Reply-To: <cover.1399671290.git.petter@technux.se>
References: <cover.1399671290.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCHv2 12/13] uclibc: remove usage of FILESPATH
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
X-List-Received-Date: Sat, 10 May 2014 08:06:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #4497]

Usage of FILESPATH is discouraged, since it can make recipes harder to
bbappend. Instead FILESEXTRAPATHS should be used to extend the path.

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 meta/recipes-core/uclibc/uclibc-git.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index 0649aca..4790852 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -2,7 +2,7 @@ SRCREV="5eddde8f094ef52dca06695cc598e3b2556dcccb"
 
 PV = "0.9.33+git${SRCPV}"
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
+FILESEXTRAPATHS_prepend := "${THISDIR}/uclibc-git:"
 
 SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
 	file://uClibc.machine \
@@ -24,6 +24,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
 	file://0001-Add-eventfd_read-and-eventfd_write.patch \
 	file://0002-wire-setns-syscall.patch \
 	file://0003-fcntl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch \
-        file://0004-Add-clock_adjtime-syscall.patch \ 
+	file://0004-Add-clock_adjtime-syscall.patch \ 
 	"
 S = "${WORKDIR}/git"
-- 
1.7.9.5


