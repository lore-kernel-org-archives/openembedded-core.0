Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 946F06FF84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 10:09:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAMA9kQI009779
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 02:09:46 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.209) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 22 Nov 2016 02:09:45 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Nov 2016 18:10:30 +0800
Message-ID: <a5dede5bea6263f3df277a18f24f638e26bd7315.1479809328.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1479809328.git.Qi.Chen@windriver.com>
References: <cover.1479809328.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] bitbake.conf: add VOLATILE_LOG_DIR variable
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
X-List-Received-Date: Tue, 22 Nov 2016 10:09:46 -0000
Content-Type: text/plain

The default value is "yes" which results in the /var/log being a link
pointing to /var/volatile/log which is on tmpfs.

The user could override this value to "no" which causes /var/log to be
a directory on persistent storage.

[YOCTO #6132]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1472e8f..794f422 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -83,6 +83,9 @@ USRBINPATH_class-nativesdk = "/usr/bin"
 # Root home directory
 ROOT_HOME ??= "/home/root"
 
+# If set to "yes", /var/log links to /var/volatile/log; otherwise, /var/log is on persistent storage.
+VOLATILE_LOG_DIR ?= "yes"
+
 ##################################################################
 # Architecture-dependent build variables.
 ##################################################################
-- 
1.9.1


