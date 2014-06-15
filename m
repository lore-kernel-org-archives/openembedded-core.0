Return-Path: <akuster@mvista.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 740E56FDA6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jun 2014 01:40:13 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id rq2so1215176pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Jun 2014 18:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GXsrOaJwboJdTyKX0RU8mSWlWljRFwR87efHf0etzeI=;
	b=aVPFnqL22uyBBPzdSGcsF5Va/KbLz6j25JDGFfgPwvNsBXaXytHSAfDvnvM6n8ZGfE
	xoqI4KwY1lNRoHM2DYkxR0d+Jda6deslgQ+aexubA14jOdBZ1fDW7tkXqAC33dkC4dSK
	T3SuJF8Wh3Diff1u4dtOYNaNadlbbqF0x9YXrjF5gx41PHvKsideoYTphWebOA15WS7S
	xht+VS4m6k7d4DXyudwXJYE361VLe/Co147HQwVmsk62gMKxzJgTFiZatsEuHbNP7bTM
	XrAFASmXmsU96RbfUkCnYAO9nCpGJo4bXQckZKVfFrByMoZVKs7vdrOHDmHulsVdrOBf
	oPzg==
X-Gm-Message-State: ALoCoQm+zv26BDO8SIuSXqDlE3ml76BX8n1zP/5KP94CYb3JkOAtL9KCnPN4QvM3eeo4CMPsR+k9
X-Received: by 10.68.245.100 with SMTP id xn4mr13959519pbc.152.1402796414528; 
	Sat, 14 Jun 2014 18:40:14 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	qq5sm11021999pbb.24.2014.06.14.18.40.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 14 Jun 2014 18:40:13 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Jun 2014 18:40:04 -0700
Message-Id: <1402796404-12726-3-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1402796404-12726-1-git-send-email-akuster@mvista.com>
References: <1402796404-12726-1-git-send-email-akuster@mvista.com>
Subject: [PATCH 2/2] tzcode: update to verison 2014e
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
X-List-Received-Date: Sun, 15 Jun 2014 01:40:19 -0000

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/tzcode/tzcode-native_2014d.bb | 11 -----------
 meta/recipes-extended/tzcode/tzcode-native_2014e.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014d.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014e.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014d.bb b/meta/recipes-extended/tzcode/tzcode-native_2014d.bb
deleted file mode 100644
index 8d20158..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2014d.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-# note that we allow for us to use data later than our code version
-#
-SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2014d.tar.gz;name=tzdata"
-
-SRC_URI[tzcode.md5sum] = "4a0f5f259ba8a2b826fffb1fa26d0134"
-SRC_URI[tzcode.sha256sum] = "e9c775bb76c9700521ada77776277c25f8650a22b56d46c9f00f4147970ef13e"
-SRC_URI[tzdata.md5sum] = "299b86c0368ecfb321f15d5c408a1d9b"
-SRC_URI[tzdata.sha256sum] = "4b4966912f5d4a299b0bdf47e6f3103d82dc6a0b5a6b321e2b9d5662597a62f0"
-
-require tzcode-native.inc
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014e.bb b/meta/recipes-extended/tzcode/tzcode-native_2014e.bb
new file mode 100644
index 0000000..405ed60
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2014e.bb
@@ -0,0 +1,11 @@
+# note that we allow for us to use data later than our code version
+#
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata2014e.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "552251600ee3571c244d33c7196ec2ed"
+SRC_URI[tzcode.sha256sum] = "43ebc426ab4911e222a4487f24289adfd2bc5eb09363a5e77cdabf56374a8c1c"
+SRC_URI[tzdata.md5sum] = "8a49fdedd4e832da8e85f7f9bcaedc33"
+SRC_URI[tzdata.sha256sum] = "08e243a79051f838d86ac1311a78b74047951302d448024e823b5b7aa71f86c5"
+
+require tzcode-native.inc
-- 
1.9.1


