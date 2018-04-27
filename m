Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 72D9F62134
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2018 06:22:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3R6MFfU016759
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2018 23:22:30 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 26 Apr 2018 23:22:04 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Apr 2018 13:53:09 +0800
Message-ID: <713b813263d95085d85c456361d0080ebb9dc5e6.1524808358.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1524808358.git.kai.kang@windriver.com>
References: <cover.1524808358.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] mpg123: remove LICENSE_FLAGS
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
X-List-Received-Date: Fri, 27 Apr 2018 06:22:39 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

mgp123 is patent free from version 1.25.0, so remove LICENSE_FLAGS.

https://mpg123.de/cgi-bin/news.cgi#2017-05-29

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb b/meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb
index 929069ab49..ff2b7d893b 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb
@@ -7,7 +7,6 @@ BUGTRACKER = "http://sourceforge.net/p/mpg123/bugs/"
 SECTION = "multimedia"
 
 LICENSE = "LGPLv2.1"
-LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-- 
2.14.1


