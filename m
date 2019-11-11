Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id D78AA7FA48
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 18:30:10 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id o9so8121011plk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Veb47STQy06JyrRpRrtcJzVXh/pb7PA3d6emSS2vUrE=;
	b=ZIIQbb+64vb2wQrZYvcjTy/9pUB6jctLAWcPE7Gs5EGt5p3917A2LXgKIXQ1ToXkA3
	6PaS1Y/Ndn1jwZbq+tHx0YBJAbcQrkwaSmKIW7fKP1HfkjfvDi1rNG0el56Hnf0tEWSs
	MYxh3kf6y8FJ4DskzXapv1+/m8fEBWq1SUg7p2MNdjMAZBAbqHBCC/8SDeAEVFgSIO2M
	mn7n2wrxOvoIDjwcVWGTUO2iK+D/5jDOrbKuiMSCb+7BQ6MIS4XVUOS6BdC/wKoogfEo
	A2G1+aabXDim4w+lsLNiegAhzeY2umu1gVJ2RVy1AT3LLq213SYXZ+rC4RvdoCOib+U6
	mOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Veb47STQy06JyrRpRrtcJzVXh/pb7PA3d6emSS2vUrE=;
	b=tQg2Hfw6MAK0CS7/luyTGYsNWYDmVt/HjeSiZ2Ku94nFEre/wiAE3qguKcNGB8OUto
	RPI6nWRadI4vZlDPS6oY+U6uqj83GlP6UZs0CwDRGFyqpJe+VDwSDbxr0qyOZEe+z1wQ
	JF80CFvHjJY/eObAhlY3asDnl5i1nBLjqTyhrsRf5xiTnzsiTSt1e+CobAs2PEq3eVLC
	Kt4DPB0pTTbOgoJxy0Xd1uvBi/7FrbUD9kodHXYVOkMMOfmrZBOgj+3Xr1YdkTr3DMWy
	8CUU1gFn5Z19mChWRZTkQ4mqBBonQpy/5lXd4DZarhHPXegzGgiG9UTM33oOFm4G1Ptn
	FjVA==
X-Gm-Message-State: APjAAAVx4xJ4Zxq2ERFkE5kJUPwOSvJD99L+gpsYczlDT/73G5QQ3TU/
	gtHt1c17oJHp6euMdltc0EPMyhxi
X-Google-Smtp-Source: APXvYqx6tmcRi9JSgNKrvUhGPL+hNvYRS7OjOLxKQPBGsU43bmMuYrj86F37728viJ/ZbRdlZ1ckIA==
X-Received: by 2002:a17:902:b702:: with SMTP id
	d2mr716984pls.104.1573497010723; 
	Mon, 11 Nov 2019 10:30:10 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	l62sm17731698pgl.24.2019.11.11.10.30.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 10:30:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 10:29:44 -0800
Message-Id: <2435c38e109cac68476ee672eca09b4cd6237ed4.1573496794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573496794.git.akuster808@gmail.com>
References: <cover.1573496794.git.akuster808@gmail.com>
Subject: [zeus 02/21] file: fix CVE-2019-18218
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
X-List-Received-Date: Mon, 11 Nov 2019 18:30:11 -0000

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


