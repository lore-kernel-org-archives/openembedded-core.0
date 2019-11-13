Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id AE38F7F7DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:36 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id az9so1204525plb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Veb47STQy06JyrRpRrtcJzVXh/pb7PA3d6emSS2vUrE=;
	b=KHbvDelA7368ZC+8m6hhDy94jvXwE0JzkYBbk27W0rCDzDZBOfZvkLPTeTt3AZgk5V
	2o5DIGhbILxhKfKy2Zr9xEZ1vYMQ2ayije5t6Fx2nGqGOlqP3iQevrD2pGfJhkciQ1wp
	GTl720q2Hb+tKWPqSo117dRXXZ3JEn/DgGbS+kcISUgKu+vxH6UApw/tWG+EDefRBGOl
	tyJXtTf9MAe6d3fi9DKsS6MHOcQ7qTreXNTUpg2bjADPE4PFrj1BjNVexmbJ07T0LD8y
	7T9FR6GhOO74EZoxpSdO4wnI4qNuVDHJy7XkFUml7uQxlnuo3yO503yFmZMt1Q6Gv4gv
	9eRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Veb47STQy06JyrRpRrtcJzVXh/pb7PA3d6emSS2vUrE=;
	b=oY3QevniiTp+bhdNTvBbcfpiUGv3SlfQAECp4efVbCI3wnqCi8oy8yy3xmV8fmkDnB
	EbNM6t3cP78KKA6W3yLhdYtxb59I8LI4w5v1o7QeZTNcGfRLtAGuLMLygipBNGhDxxbM
	YtAK+XoFY8mcSo7XYChugNDilYaBpOsQnkuawAm5QGSerGsUIS4GP4O68WW5HNDfuuS0
	/tJbCIDtI6rnj8Q2rVat8eI10SuwTh2gDmR3dc1MTQyCHrEuMEILaEv+KshathxN14zx
	bN3fMwJwl5iThG494Z4OHEAsEwS7J9i6Wc1yDRxlHoj8Ob+XMazxiUqJows1eqtQefJ1
	6Fow==
X-Gm-Message-State: APjAAAVqMestoJ3QbgQ2zU74edJxnmJfV3XmgoPcrNNWhCBh1a6sTW5I
	Jlcf2f85B7DHODdkRZcu75pJqvIB
X-Google-Smtp-Source: APXvYqyxm6DYdWW7yPMJ059ijnW3e7V90LN5kDxPRaiRwTD0UVjeqqPeOj99r6XnKpSUeGKw1Pc2HQ==
X-Received: by 2002:a17:902:9b86:: with SMTP id
	y6mr4597900plp.36.1573659157510; 
	Wed, 13 Nov 2019 07:32:37 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:31:54 -0800
Message-Id: <2435c38e109cac68476ee672eca09b4cd6237ed4.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 12/31] file: fix CVE-2019-18218
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:37 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../file/file/CVE-2019-18218.patch                 | 55 ++++++++++++++++++++++
 meta/recipes-devtools/file/file_5.37.bb            |  3 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/file/file/CVE-2019-18218.patch

diff --git a/meta/recipes-devtools/file/file/CVE-2019-18218.patch b/meta/recipes-devtools/file/file/CVE-2019-18218.patch
new file mode 100644
index 0000000..3d02c5a
--- /dev/null
+++ b/meta/recipes-devtools/file/file/CVE-2019-18218.patch
@@ -0,0 +1,55 @@
+cdf_read_property_info in cdf.c in file through 5.37 does not restrict the
+number of CDF_VECTOR elements, which allows a heap-based buffer overflow (4-byte
+out-of-bounds write).
+
+CVE: CVE-2019-18218
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 46a8443f76cec4b41ec736eca396984c74664f84 Mon Sep 17 00:00:00 2001
+From: Christos Zoulas <christos@zoulas.com>
+Date: Mon, 26 Aug 2019 14:31:39 +0000
+Subject: [PATCH] Limit the number of elements in a vector (found by oss-fuzz)
+
+---
+ src/cdf.c | 9 ++++-----
+ src/cdf.h | 1 +
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/cdf.c b/src/cdf.c
+index 9d6396742..bb81d6374 100644
+--- a/src/cdf.c
++++ b/src/cdf.c
+@@ -1016,8 +1016,9 @@ cdf_read_property_info(const cdf_stream_t *sst, const cdf_header_t *h,
+ 				goto out;
+ 			}
+ 			nelements = CDF_GETUINT32(q, 1);
+-			if (nelements == 0) {
+-				DPRINTF(("CDF_VECTOR with nelements == 0\n"));
++			if (nelements > CDF_ELEMENT_LIMIT || nelements == 0) {
++				DPRINTF(("CDF_VECTOR with nelements == %"
++				    SIZE_T_FORMAT "u\n", nelements));
+ 				goto out;
+ 			}
+ 			slen = 2;
+@@ -1060,8 +1061,6 @@ cdf_read_property_info(const cdf_stream_t *sst, const cdf_header_t *h,
+ 					goto out;
+ 				inp += nelem;
+ 			}
+-			DPRINTF(("nelements = %" SIZE_T_FORMAT "u\n",
+-			    nelements));
+ 			for (j = 0; j < nelements && i < sh.sh_properties;
+ 			    j++, i++)
+ 			{
+diff --git a/src/cdf.h b/src/cdf.h
+index 2f7e554b7..05056668f 100644
+--- a/src/cdf.h
++++ b/src/cdf.h
+@@ -48,6 +48,7 @@
+ typedef int32_t cdf_secid_t;
+ 
+ #define CDF_LOOP_LIMIT					10000
++#define CDF_ELEMENT_LIMIT				100000
+ 
+ #define CDF_SECID_NULL					0
+ #define CDF_SECID_FREE					-1
diff --git a/meta/recipes-devtools/file/file_5.37.bb b/meta/recipes-devtools/file/file_5.37.bb
index 6547d12..509b6ce 100644
--- a/meta/recipes-devtools/file/file_5.37.bb
+++ b/meta/recipes-devtools/file/file_5.37.bb
@@ -14,7 +14,8 @@ DEPENDS_class-native = "zlib-native"
 # Blacklist a bogus tag in upstream check
 UPSTREAM_CHECK_GITTAGREGEX = "FILE(?P<pver>(?!6_23).+)"
 
-SRC_URI = "git://github.com/file/file.git"
+SRC_URI = "git://github.com/file/file.git \
+           file://CVE-2019-18218.patch"
 
 SRCREV = "a0d5b0e4e9f97d74a9911e95cedd579852e25398"
 S = "${WORKDIR}/git"
-- 
2.7.4


