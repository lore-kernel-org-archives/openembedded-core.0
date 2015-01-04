Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BD8AA727D4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 10:04:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t04A4nJp025406
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Jan 2015 02:04:49 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 4 Jan 2015 02:04:49 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 4 Jan 2015 18:04:59 +0800
Message-ID: <3e2a14de446a26cc2ae207b13f19a5b060269f17.1420359776.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1420359776.git.Qi.Chen@windriver.com>
References: <cover.1420359776.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] sysklogd: upgrade to 1.5.1
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
X-List-Received-Date: Sun, 04 Jan 2015 10:04:55 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sysklogd/sysklogd_1.5.1.bb | 5 +++++
 meta/recipes-extended/sysklogd/sysklogd_1.5.bb   | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/sysklogd/sysklogd_1.5.1.bb
 delete mode 100644 meta/recipes-extended/sysklogd/sysklogd_1.5.bb

diff --git a/meta/recipes-extended/sysklogd/sysklogd_1.5.1.bb b/meta/recipes-extended/sysklogd/sysklogd_1.5.1.bb
new file mode 100644
index 0000000..4b54f1b
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/sysklogd_1.5.1.bb
@@ -0,0 +1,5 @@
+require sysklogd.inc
+PR = "r7"
+
+SRC_URI[md5sum] = "c70599ab0d037fde724f7210c2c8d7f8"
+SRC_URI[sha256sum] = "5166c185ae23c92e8b9feee66a6e3d0bc944bf673112f53e3ecf62e08ce7c201"
diff --git a/meta/recipes-extended/sysklogd/sysklogd_1.5.bb b/meta/recipes-extended/sysklogd/sysklogd_1.5.bb
deleted file mode 100644
index 5c95889..0000000
--- a/meta/recipes-extended/sysklogd/sysklogd_1.5.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require sysklogd.inc
-PR = "r7"
-
-SRC_URI[md5sum] = "e053094e8103165f98ddafe828f6ae4b"
-SRC_URI[sha256sum] = "6169b8e91d29288e90404f01462b69e7f2afb1161aa419826fe4736c7f9eb773"
-- 
1.9.1


