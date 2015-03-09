Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 023A4738FA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 07:15:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t297FFV7003561
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Mar 2015 00:15:15 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 Mar 2015 00:15:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Mar 2015 00:15:10 -0700
Message-ID: <3db6099303c0793af3ef9dc52634b1d517043017.1425885208.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1425885208.git.liezhi.yang@windriver.com>
References: <cover.1425885208.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] libevent: fix SRC_URI
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
X-List-Received-Date: Mon, 09 Mar 2015 07:15:16 -0000
Content-Type: text/plain

The wget reported errors for the past URI since it can't follow the redirection well:
Connecting to cloud.github.com (cloud.github.com)|54.192.140.6|:443... connected.
OpenSSL: error:14077410:SSL routines:SSL23_GET_SERVER_HELLO:sslv3 alert handshake failure
Unable to establish SSL connection.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/libevent/libevent_2.0.21.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libevent/libevent_2.0.21.bb b/meta/recipes-support/libevent/libevent_2.0.21.bb
index 5a1ff3b..1230e92 100644
--- a/meta/recipes-support/libevent/libevent_2.0.21.bb
+++ b/meta/recipes-support/libevent/libevent_2.0.21.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=45c5316ff684bcfe2f9f86d8b1279559"
 
 PR = "r1"
 
-SRC_URI = "http://github.com/downloads/libevent/libevent/${BPN}-${PV}-stable.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/levent/${BP}-stable.tar.gz \
            file://obsolete_automake_macros.patch \
            file://disable_tests.patch \
 "
-- 
1.7.9.5


