Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C4E507820F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 11:52:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7GBqe9C013535
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 04:52:40 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 16 Aug 2017 04:52:39 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Aug 2017 19:57:15 +0800
Message-ID: <262a2167c19bf40e8407d22e864d0422d3ce6bd5.1502884438.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1502884438.git.Qi.Chen@windriver.com>
References: <cover.1502884438.git.Qi.Chen@windriver.com>
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
X-List-Received-Date: Wed, 16 Aug 2017 11:52:40 -0000
Content-Type: text/plain

The default value is "yes" which results in the /var/log being a link
pointing to /var/volatile/log which is on tmpfs.

Setting valid boolean false value ('no', 'n', 'false', 'f', '0') would make
/var/log to be a directory on persistent storage.

[YOCTO #6132]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/conf/bitbake.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3110b9c..334ba23 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -85,6 +85,10 @@ USRBINPATH_class-nativesdk = "/usr/bin"
 # Root home directory
 ROOT_HOME ??= "/home/root"
 
+# If set to boolean true ('yes', 'y', 'true', 't', '1'), /var/log links to /var/volatile/log.
+# If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log is on persistent storage.
+VOLATILE_LOG_DIR ?= "yes"
+
 ##################################################################
 # Architecture-dependent build variables.
 ##################################################################
-- 
1.9.1


