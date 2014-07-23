Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id A7E7D707E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 21:58:27 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id b13so1819989wgh.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 14:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GLrjD/GT7Flo74eXGUl4l3ebdrgD7wsk+RAHU+cLSB4=;
	b=btCJjy3sSLRULxV7b9F+tjpcogKkCenVDEI6bCrgMqoQEVq+XrhTMizdCpuJDGNdJ2
	tClXwRVJN94IqDWnhxQd8moDl4nuJn13Dt4KF3cTzU7BQpdN8VHoMzRt5JTdmKxtysfa
	6unLHb60KNExJlBggDZgPs5LlRcXvx18/QhwOpNB8FQWj1vDO4MCrp4yl8PsjyTyyg9H
	OrSBAGB4SOlq87hXVH1jB3E9rykOmhFVw4O2UoMZaCW5ULD/eC7fBdX4UIQVbfaJo+SG
	qfNn5R7AG6lcnMrrL6TQSYiwj9yUhiPMptTcEUvAUD9luDpJdbIde9qqBaqLzcQfTqe7
	32BQ==
X-Gm-Message-State: ALoCoQk+I5TtaQLNA4uO9Z+T6Nq38foPBBNTiU8q4SJHhoz7ublanb8fKJRuni9crOhtRpb18tum
X-Received: by 10.180.97.129 with SMTP id ea1mr6738995wib.71.1406152708222;
	Wed, 23 Jul 2014 14:58:28 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	pl1sm14090074wic.17.2014.07.23.14.58.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jul 2014 14:58:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jul 2014 22:58:14 +0100
Message-Id: <1406152694-6242-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1406152694-6242-1-git-send-email-ross.burton@intel.com>
References: <1406152694-6242-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/4] shared-mime-info: upgrade to 1.3
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
X-List-Received-Date: Wed, 23 Jul 2014 21:58:28 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/shared-mime-info/shared-mime-info_1.2.bb |    7 -------
 meta/recipes-support/shared-mime-info/shared-mime-info_1.3.bb |    7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_1.2.bb
 create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_1.3.bb

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_1.2.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_1.2.bb
deleted file mode 100644
index 11fd6de..0000000
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_1.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require shared-mime-info.inc
-
-SRC_URI[md5sum] = "8f90f3f2b8478fa47e70678d34013f99"
-SRC_URI[sha256sum] = "a5516ae241b95a948a6749b1cbf65dc20c3bb563a73cc7bedb7065933788bb78"
-
-SRC_URI =+ "file://parallelmake.patch \
-	    file://install-data-hook.patch"
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_1.3.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_1.3.bb
new file mode 100644
index 0000000..4bd81cd
--- /dev/null
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_1.3.bb
@@ -0,0 +1,7 @@
+require shared-mime-info.inc
+
+SRC_URI[md5sum] = "743720bc4803dd69f55449013d350f31"
+SRC_URI[sha256sum] = "4fd49c8c7ca9ecb10c59845094a18dbb73b69c72b4bad3db5e864f2111cb323a"
+
+SRC_URI =+ "file://parallelmake.patch \
+	    file://install-data-hook.patch"
-- 
1.7.10.4


