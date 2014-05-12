Return-Path: <petter@technux.se>
Received: from vsp-authed-02-02.binero.net (unknown [195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 54DEB605B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 14:28:31 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-02-02.binero.net (Halon Mail Gateway) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 16:28:22 +0200 (CEST)
Received: from localhost.localdomain
	(host-90-236-245-133.mobileonline.telia.com [90.236.245.133])
	(Authenticated sender: petter@technux.se)
	by smtp-10-01.atm.binero.net (Postfix) with ESMTPSA id 4294B3A232;
	Mon, 12 May 2014 15:55:47 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 15:55:37 +0200
Message-Id: <4b97136db0b402561c806a63beb5618b9dd36cc6.1399868537.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1da008f3d9c89cfaf931e94d18154acfed49d636.1399868537.git.petter@technux.se>
References: <1da008f3d9c89cfaf931e94d18154acfed49d636.1399868537.git.petter@technux.se>
In-Reply-To: <cover.1399868537.git.petter@technux.se>
References: <cover.1399868537.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCHv3 12/13] uclibc: remove usage of FILESPATH
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
X-List-Received-Date: Mon, 12 May 2014 14:28:32 -0000
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
index 0649aca..69e834d 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -2,7 +2,7 @@ SRCREV="5eddde8f094ef52dca06695cc598e3b2556dcccb"
 
 PV = "0.9.33+git${SRCPV}"
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/uclibc-git:"
 
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


