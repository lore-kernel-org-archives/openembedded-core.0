Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3179E714A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 09:32:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8J9WfBn026386
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 19 Sep 2014 02:32:41 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Fri, 19 Sep 2014 02:32:41 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <raj.khem@gmail.com>, <mark.hatle@windriver.com>
Date: Fri, 19 Sep 2014 17:21:11 +0800
Message-ID: <593bbb68487e533b7ea2bbc27745b835a690dabc.1411117403.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1411117403.git.kai.kang@windriver.com>
References: <cover.1411117403.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] qt4-embedded: disable webkit
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
X-List-Received-Date: Fri, 19 Sep 2014 09:32:41 -0000
Content-Type: text/plain

Disable webkit for aarch64 that make qt4-embedded build.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-qt/qt4/qt4-embedded_4.8.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.6.bb b/meta/recipes-qt/qt4/qt4-embedded_4.8.6.bb
index 1435d85..a3995c9 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.8.6.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.8.6.bb
@@ -7,3 +7,4 @@ QT_CONFIG_FLAGS += " \
  -exceptions \
 "
 
+QT_CONFIG_FLAGS_append_aarch64 = " -no-webkit"
-- 
1.9.1


