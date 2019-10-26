Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D1BC7FC01
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:10 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r141so4130668wme.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6/oWzLdnQNt16Ikz72U4gfQXzFN+IjB54Z/iRKzowT0=;
	b=g/FpErmhQofyMSYZHKzXfYUz8tRBOu5yZfdNcIWmXKFDXyghNXf2hqu5Ho19oIxsyc
	nkxd8OqCFKWuEL5gtQH0/FhM3nkLY2rPuuxygjE3RFZMrCpEs3XXrrX4DpkrqfVPEpJb
	eFtSdXgN+Zoi6DK+dwudYJYbHy5yUWwKC8lIWf9NRMIFg91hy2y6hegxmo4YDiTMkQCc
	779cAqX49D5QyuLW/dqZWVVwx2gk+2L9HrB1nK3ccEHJLorna6nwu/wli2eVECIi1R7x
	mFIefcMX/aECDOpmPCUhJ7E9TIWo63h7og4DRmy25ijI+yVxmF7KmL9wM7d4w4yANExz
	ms6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6/oWzLdnQNt16Ikz72U4gfQXzFN+IjB54Z/iRKzowT0=;
	b=MnQtAJAEIAtAF+RDQ04AvoyWfPCa9/0sCGlnfL45woOOz8HY2XEF0iT6ZLMGW5gqBU
	3dyQwZiEPRT4vMsuQHa00ov1coARShB9z4XHgtwU7Wrl8Y+DDnV+fYAqHjY3LYVtdOIT
	bhXe3jRxXcrWehaD4S3IEzJ0+3socaCF6jFdE7AOw6hWLVB8qWzDZzwMX9o24C/aI9s+
	szZebkwKG5hKij9CpbUo7YZd0OfTyCvkIESgsEWUfsl9OxwnY0ngKKhpXeUZ4lcKo8jA
	M0cZOAzR+B5mW8/meuhIiTB0Qr+n98mUucVf9Xc5RCVEFA2RaAo5buIdJlPrz0nDThDF
	dvyg==
X-Gm-Message-State: APjAAAVDh20XjYWL9T/J2IPtr6fGxxyxL2Sek9qDbfbRjxM5LNaWC38Q
	KQtAOMbh9w56n7x5OXdq4QyabQQUHR4=
X-Google-Smtp-Source: APXvYqwXFy4lJUvalOR2rbbtCrZ8/F2NGrZcuvHitREM3AzALONOz5qR4SMr64WLqc5wTzV/f6j53g==
X-Received: by 2002:a1c:a90f:: with SMTP id s15mr6631828wme.100.1572072611120; 
	Fri, 25 Oct 2019 23:50:11 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:40 -0700
Message-Id: <5c11937348debf57e3a87c7c6a6c0429fd756eca.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 08/28] sysstat: fix CVE-2019-16167
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:11 -0000

From: Wenlin Kang <wenlin.kang@windriver.com>

This commit is another part of CVE-2019-16167, please see
https://github.com/sysstat/sysstat/issues/232.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 586c045eb81b79200b46bf743f5d3fdb5f68c12d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ory-corruption-bug-due-to-Integer-Overflo.patch | 46 ++++++++++++++++++++++
 meta/recipes-extended/sysstat/sysstat_12.1.6.bb    |  4 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/0001-Fix-232-Memory-corruption-bug-due-to-Integer-Overflo.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/0001-Fix-232-Memory-corruption-bug-due-to-Integer-Overflo.patch b/meta/recipes-extended/sysstat/sysstat/0001-Fix-232-Memory-corruption-bug-due-to-Integer-Overflo.patch
new file mode 100644
index 0000000..46b1118
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/0001-Fix-232-Memory-corruption-bug-due-to-Integer-Overflo.patch
@@ -0,0 +1,46 @@
+From 603ae4ed8cd65abf0776ef7f68354a5c24a3411c Mon Sep 17 00:00:00 2001
+From: Sebastien GODARD <sysstat@users.noreply.github.com>
+Date: Tue, 15 Oct 2019 14:39:33 +0800
+Subject: [PATCH] Fix #232: Memory corruption bug due to Integer Overflow in
+ remap_struct()
+
+Try to avoid integer overflow when reading a corrupted binary datafile
+with sadf.
+
+Upstream-Status: Backport [https://github.com/sysstat/sysstat/commit/83fad9c895d1ac13f76af5883b7451b3302beef5]
+CVE: CVE-2019-16167
+
+Signed-off-by: Sebastien GODARD <sysstat@users.noreply.github.com>
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ sa_common.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/sa_common.c b/sa_common.c
+index 395c11c..cfa9007 100644
+--- a/sa_common.c
++++ b/sa_common.c
+@@ -1336,7 +1336,8 @@ int remap_struct(unsigned int gtypes_nr[], unsigned int ftypes_nr[],
+ 	/* Remap [unsigned] int fields */
+ 	d = gtypes_nr[1] - ftypes_nr[1];
+ 	if (d) {
+-		if (ftypes_nr[1] * UL_ALIGNMENT_WIDTH < ftypes_nr[1])
++		if (gtypes_nr[0] * ULL_ALIGNMENT_WIDTH +
++		    ftypes_nr[1] * UL_ALIGNMENT_WIDTH < ftypes_nr[1])
+ 			/* Overflow */
+ 			return -1;
+ 
+@@ -1365,7 +1366,9 @@ int remap_struct(unsigned int gtypes_nr[], unsigned int ftypes_nr[],
+ 	/* Remap possible fields (like strings of chars) following int fields */
+ 	d = gtypes_nr[2] - ftypes_nr[2];
+ 	if (d) {
+-		if (ftypes_nr[2] * U_ALIGNMENT_WIDTH < ftypes_nr[2])
++		if (gtypes_nr[0] * ULL_ALIGNMENT_WIDTH +
++		    gtypes_nr[1] * UL_ALIGNMENT_WIDTH +
++		    ftypes_nr[2] * U_ALIGNMENT_WIDTH < ftypes_nr[2])
+ 			/* Overflow */
+ 			return -1;
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/sysstat/sysstat_12.1.6.bb b/meta/recipes-extended/sysstat/sysstat_12.1.6.bb
index 8cf8c36..362888d 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.1.6.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.1.6.bb
@@ -2,7 +2,9 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
+SRC_URI += "file://0001-Include-needed-headers-explicitly.patch \
+	    file://0001-Fix-232-Memory-corruption-bug-due-to-Integer-Overflo.patch \
+"
 
 SRC_URI[md5sum] = "d8e3bbb9c873dd370f6d33664e326570"
 SRC_URI[sha256sum] = "f752f3c406153a6fc446496f1102872505ace3f0931d975c1d664c81ec09f129"
-- 
2.7.4


