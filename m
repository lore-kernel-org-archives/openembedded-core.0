Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id CD2FC7F0DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:13:29 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id q21so296214pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 20:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OPu0GmjsKHBlMV4nV/MrZrlKcL2eTv9WWJTfFpnTNO4=;
	b=u4FaVCUfHX6oBzrHjhbx64pGP/qpXeQqnxVPCDA+Pl3He0bNVtLGAo5FgldMOBBHl1
	I/jJOcTIw7BDShn5VmRWKcEm2PFeff2o+juOw4abz+NzeD9vRoGaJXBmRmAd27v2iAeu
	5hrRySjcUkg2aS+Gyu3kLYYhtozSGKS9DN5FoLqIM/PFoFSd19yq5qf+NTPOaJgdA1Vu
	AVA6EftGOMViN6VglOjof/uQKR9OQ+mt8ztCvWhwZ0IY8CWNOaZGqMikiHqAAhmMkpeM
	ZxAHTtTbjh9kl8fSid6Xg6la5qPX2m3SIXxFwF47gwN73Cx8UZ1TUD82IG66ierVPXNl
	lffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OPu0GmjsKHBlMV4nV/MrZrlKcL2eTv9WWJTfFpnTNO4=;
	b=k7pEj30wCNCU6QXAhWyErlAptE/ML2VtJ6YHlFaE8VCPNY+XLxWi+y6ArsAQbBH36n
	ovuaIGg8xpo31GY7ewvQ3OUULBlHGfR5lqBXFNM8E6nBPXo6y033STBgr3ni9tbh2QRU
	SfksvYQWnAgVyPNsJwFr9OZVS+J+AWZ+IOHnsoZEebsakiVVNjah75ypdiZS7lF5eGav
	8spld3bQetkw2Z1Xl2/YfpHcsP4lCpJAv5DBEAWamw3vWOxF7OUvEPYsRNhuPLMOAM4E
	ndz7KtIVx2ElnssPfGS7E+Tb0cX6QD2Z57rSqAvyDl5zph+cZheEbizDmsOdRnw/tV8a
	YuDQ==
X-Gm-Message-State: APjAAAXQEBUxnZh5rzcWstTe3ha4qTHoTxhrDAssRNCKNyavv+9PBgiq
	sijsZyd2eaHtnRvoN4/HLIdlGQaCo2c=
X-Google-Smtp-Source: APXvYqy9zMus7fPbqQVcN3puSn5B3Qfhu/NNFMlham1aP0YxtWCcdF0MuISX6JA4iappuw/f/j0UXg==
X-Received: by 2002:a65:420d:: with SMTP id c13mr838047pgq.293.1569294810731; 
	Mon, 23 Sep 2019 20:13:30 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id z23sm252602pgi.78.2019.09.23.20.13.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 20:13:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 20:13:03 -0700
Message-Id: <2cebc7faa10c7ac6f60437658702f7adce3b3a89.1569294712.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569294712.git.akuster808@gmail.com>
References: <cover.1569294712.git.akuster808@gmail.com>
Subject: [Thud][ 07/24] libcomps: fix CVE-2019-3817
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
X-List-Received-Date: Tue, 24 Sep 2019 03:13:30 -0000

From: Andrii Bordunov via Openembedded-core <openembedded-core@lists.openembedded.org>

Signed-off-by: Kevin Weng <t-keweng@microsoft.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libcomps/libcomps/CVE-2019-3817.patch          | 97 ++++++++++++++++++++++
 meta/recipes-devtools/libcomps/libcomps_git.bb     |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-devtools/libcomps/libcomps/CVE-2019-3817.patch

diff --git a/meta/recipes-devtools/libcomps/libcomps/CVE-2019-3817.patch b/meta/recipes-devtools/libcomps/libcomps/CVE-2019-3817.patch
new file mode 100644
index 0000000..b8cfb3c
--- /dev/null
+++ b/meta/recipes-devtools/libcomps/libcomps/CVE-2019-3817.patch
@@ -0,0 +1,97 @@
+From cea10cd1f2ef6bb4edaac0c1d46d47bf237c42b8 Mon Sep 17 00:00:00 2001
+From: Riccardo Schirone <rschiron@redhat.com>
+Date: Mon, 21 Jan 2019 18:11:42 +0100
+Subject: [PATCH] Fix UAF in comps_objmrtree_unite function
+
+The added field is not used at all in many places and it is probably the
+left-over of some copy-paste.
+
+Upstream-Status: Backport
+[https://github.com/rpm-software-management/libcomps/commit
+/e3a5d056633677959ad924a51758876d415e7046]
+
+CVE: CVE-2019-3817
+
+Signed-off-by: Kevin Weng <t-keweng@microsoft.com>
+---
+ libcomps/src/comps_mradix.c    | 2 --
+ libcomps/src/comps_objmradix.c | 2 --
+ libcomps/src/comps_objradix.c  | 2 --
+ libcomps/src/comps_radix.c     | 1 -
+ 4 files changed, 7 deletions(-)
+
+diff --git a/libcomps/src/comps_mradix.c b/libcomps/src/comps_mradix.c
+index 338cb07..6ceb7c9 100644
+--- a/libcomps/src/comps_mradix.c
++++ b/libcomps/src/comps_mradix.c
+@@ -177,7 +177,6 @@ void comps_mrtree_unite(COMPS_MRTree *rt1, COMPS_MRTree *rt2) {
+     struct Pair {
+         COMPS_HSList * subnodes;
+         char * key;
+-        char added;
+     } *pair, *parent_pair;
+ 
+     pair = malloc(sizeof(struct Pair));
+@@ -195,7 +194,6 @@ void comps_mrtree_unite(COMPS_MRTree *rt1, COMPS_MRTree *rt2) {
+         parent_pair = (struct Pair*) it->data;
+         free(it);
+ 
+-        pair->added = 0;
+         for (it = tmp_subnodes->first; it != NULL; it=it->next) {
+             pair = malloc(sizeof(struct Pair));
+             pair->subnodes = ((COMPS_MRTreeData*)it->data)->subnodes;
+diff --git a/libcomps/src/comps_objmradix.c b/libcomps/src/comps_objmradix.c
+index 9be6648..8771c89 100644
+--- a/libcomps/src/comps_objmradix.c
++++ b/libcomps/src/comps_objmradix.c
+@@ -285,7 +285,6 @@ void comps_objmrtree_unite(COMPS_ObjMRTree *rt1, COMPS_ObjMRTree *rt2) {
+     struct Pair {
+         COMPS_HSList * subnodes;
+         char * key;
+-        char added;
+     } *pair, *parent_pair;
+ 
+     pair = malloc(sizeof(struct Pair));
+@@ -303,7 +302,6 @@ void comps_objmrtree_unite(COMPS_ObjMRTree *rt1, COMPS_ObjMRTree *rt2) {
+         parent_pair = (struct Pair*) it->data;
+         free(it);
+ 
+-        pair->added = 0;
+         for (it = tmp_subnodes->first; it != NULL; it=it->next) {
+             pair = malloc(sizeof(struct Pair));
+             pair->subnodes = ((COMPS_ObjMRTreeData*)it->data)->subnodes;
+diff --git a/libcomps/src/comps_objradix.c b/libcomps/src/comps_objradix.c
+index a790270..0ebaf22 100644
+--- a/libcomps/src/comps_objradix.c
++++ b/libcomps/src/comps_objradix.c
+@@ -692,7 +692,6 @@ void comps_objrtree_unite(COMPS_ObjRTree *rt1, COMPS_ObjRTree *rt2) {
+     struct Pair {
+         COMPS_HSList * subnodes;
+         char * key;
+-        char added;
+     } *pair, *parent_pair;
+ 
+     pair = malloc(sizeof(struct Pair));
+@@ -711,7 +710,6 @@ void comps_objrtree_unite(COMPS_ObjRTree *rt1, COMPS_ObjRTree *rt2) {
+         //printf("key-part:%s\n", parent_pair->key);
+         free(it);
+ 
+-        //pair->added = 0;
+         for (it = tmp_subnodes->first; it != NULL; it=it->next) {
+             pair = malloc(sizeof(struct Pair));
+             pair->subnodes = ((COMPS_ObjRTreeData*)it->data)->subnodes;
+diff --git a/libcomps/src/comps_radix.c b/libcomps/src/comps_radix.c
+index ada4fda..05dcaf2 100644
+--- a/libcomps/src/comps_radix.c
++++ b/libcomps/src/comps_radix.c
+@@ -529,7 +529,6 @@ void comps_rtree_unite(COMPS_RTree *rt1, COMPS_RTree *rt2) {
+     struct Pair {
+         COMPS_HSList * subnodes;
+         char * key;
+-        char added;
+     } *pair, *parent_pair;
+ 
+     pair = malloc(sizeof(struct Pair));
+-- 
+2.22.0
+
diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_git.bb
index e69bf67..b657f33 100644
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_git.bb
@@ -6,6 +6,7 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0002-Set-library-installation-path-correctly.patch \
            file://0001-Make-__comps_objmrtree_all-static-inline.patch \
+           file://CVE-2019-3817.patch \
            "
 
 PV = "0.1.8+git${SRCPV}"
-- 
2.7.4


