Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C4DAC739B7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 03:34:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2A3YrLV006086
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Mar 2015 20:34:53 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 9 Mar 2015 20:34:53 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Mar 2015 11:26:43 +0800
Message-ID: <5d35d7ac8050e090a80dd10c72ece9e4e1509579.1425957496.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1425957496.git.kai.kang@windriver.com>
References: <cover.1425957496.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 1/3] systemd: correct permission mode of /var/volatile/tmp
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
X-List-Received-Date: Tue, 10 Mar 2015 03:34:55 -0000
Content-Type: text/plain

Permission mode of directory /var/volatile/tmp should be 1777,
correct it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/systemd/systemd/00-create-volatile.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
index 9ffa88e..87cbe1e 100644
--- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
+++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
@@ -4,4 +4,4 @@
 
 
 d		/var/volatile/log		-	-	-	-
-d		/var/volatile/tmp		-	-	-	-
+d		/var/volatile/tmp		1777	-	-
-- 
1.9.1


