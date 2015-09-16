Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E2F8873CBD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 07:52:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G7qkt4008878
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 00:52:46 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 16 Sep 2015 00:52:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Sep 2015 00:52:44 -0700
Message-ID: <1a61ca4dde43182b4b6f6fd73d4a084a20ca0947.1442389930.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1442389930.git.liezhi.yang@windriver.com>
References: <cover.1442389930.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] nspr: fix SRC_URI
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
X-List-Received-Date: Wed, 16 Sep 2015 07:52:46 -0000
Content-Type: text/plain

Fixed:
WARNING: Failed to fetch URL ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v4.10.8/src/nspr-4.10.8.tar.gz, attempting MIRRORS if available

Its ftp:// doesn't work with wget, but http:// works.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/nspr/nspr_4.10.8.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/nspr/nspr_4.10.8.bb b/meta/recipes-support/nspr/nspr_4.10.8.bb
index 944994e..bc60018 100644
--- a/meta/recipes-support/nspr/nspr_4.10.8.bb
+++ b/meta/recipes-support/nspr/nspr_4.10.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://configure.in;beginline=3;endline=6;md5=90c2fdee38e45d
                     file://Makefile.in;beginline=4;endline=38;md5=beda1dbb98a515f557d3e58ef06bca99"
 SECTION = "libs/network"
 
-SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz \
+SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz \
            file://remove-rpath-from-tests.patch \
            file://fix-build-on-x86_64.patch \
            file://remove-srcdir-from-configure-in.patch \
-- 
1.7.9.5


