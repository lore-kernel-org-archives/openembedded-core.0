Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 35C82734E6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 05:41:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2P5fFCs001621
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 22:41:15 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 24 Mar 2015 22:41:14 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Mar 2015 22:41:14 -0700
Message-ID: <78a8e0beb1dd78a8461b994816267ec8848b2ca7.1427262046.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1427262046.git.liezhi.yang@windriver.com>
References: <cover.1427262046.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libarchive: set CLEANBROKEN
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
X-List-Received-Date: Wed, 25 Mar 2015 05:41:14 -0000
Content-Type: text/plain

Errors when rebuild:
checking for xml2-config... /path/to/tmp/sysroots/qemux86-64/usr/bin/crossscripts/xml2-config
checking for xmlInitParser in -lxml2... no
configure: error: in `/path/to/tmp/work/core2-64-poky-linux/libarchive/3.1.2-r0/libarchive-3.1.2':
configure: error: Missing xml2 library

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../libarchive/libarchive_3.1.2.bb                 |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
index 96e2d50..2ac8c5e 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b4e3ffd607d6686c6cb2f63394370841"
 
 DEPENDS = "e2fsprogs-native"
 
+CLEANBROKEN = "1"
+
 PACKAGECONFIG ?= "libxml2 zlib bz2"
 
 PACKAGECONFIG_append_class-target = "\
-- 
1.7.9.5


