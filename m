Return-Path: <akuster808@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9A108716FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 15:47:22 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id y20so7748083ier.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 08:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=R9Tz7gw41L8Hzs3AKVYODdDYtxbM6f1q8f1cv7uP1Es=;
	b=niiyaQZlC81i9G0/dTc+NBohIi/+A9sRO2b11qsBSd5Of7y4g72Gx+3c8YraH8op4y
	FK9dv/nZU6YWlOnVWozlSXUCBafGCn3UBonj4l9O4kfZl4t6VXqxGJSTXuGJkzaaDpfR
	GdpvxhFYdTvqiTplwQYiNBTD1/EG9YkwBGsFnmv3IxqJtGDKYdtlVwghOn1il2Ey0aKI
	vfs+ySU2JrlFAKzckTyoVOjs6I6VuzzIj4KFcq2OUlgPCzwzCXRoxP9ObMlO/FQqvb1l
	q/keLvS4dPoQmV3OBzR2VqbdwKknfLO4KT3mkF3X8xceN3q7tRN4NNGiAVdpz66xZBrq
	TBkg==
X-Received: by 10.42.101.77 with SMTP id d13mr51975821ico.53.1412092043547;
	Tue, 30 Sep 2014 08:47:23 -0700 (PDT)
Received: from localhost.localdomain (75-163-154-89.clsp.qwest.net.
	[75.163.154.89]) by mx.google.com with ESMTPSA id
	hg4sm13331857igb.15.2014.09.30.08.47.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Sep 2014 08:47:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Sep 2014 08:47:16 -0700
Message-Id: <1412092036-30364-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1412092036-30364-1-git-send-email-akuster808@gmail.com>
References: <1412092036-30364-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 2/2] tzdata: update to 2014h
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
X-List-Received-Date: Tue, 30 Sep 2014 15:47:24 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/tzdata_2014g.bb | 6 ------
 meta/recipes-extended/tzdata/tzdata_2014h.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2014g.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2014h.bb

diff --git a/meta/recipes-extended/tzdata/tzdata_2014g.bb b/meta/recipes-extended/tzdata/tzdata_2014g.bb
deleted file mode 100644
index e831833..0000000
--- a/meta/recipes-extended/tzdata/tzdata_2014g.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
-
-SRC_URI[tzdata.md5sum] = "f9f59425e55b21d2e52bb3a95fc17b8d"
-SRC_URI[tzdata.sha256sum] = "5547d5b7a982f7f53fffe68cb2a13692553f591a17d58c8ef15b20679d82a270"
-
-require tzdata.inc
diff --git a/meta/recipes-extended/tzdata/tzdata_2014h.bb b/meta/recipes-extended/tzdata/tzdata_2014h.bb
new file mode 100644
index 0000000..9334a62
--- /dev/null
+++ b/meta/recipes-extended/tzdata/tzdata_2014h.bb
@@ -0,0 +1,6 @@
+SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
+
+SRC_URI[tzdata.md5sum] = "ed05111948beba8a0f30956baa46b272"
+SRC_URI[tzdata.sha256sum] = "e78152f616fb07c1dea124215ffca57d0de66d8897e00896086542e3de30f69e"
+
+require tzdata.inc
-- 
1.9.1


