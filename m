Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 464837F333
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 21:21:52 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d85so4937817pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 14:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OPu0GmjsKHBlMV4nV/MrZrlKcL2eTv9WWJTfFpnTNO4=;
	b=h9dadDev5U7CNPNpsvObjuTTaeCZ2qaqJAOzMiL61fZJkdWcFLy231IUjzj8R0z6zE
	b5X4x5mfspkoQ+IFVEgf42Wz/ldgFm3tZFf+RCcR+VHO9RSpjMnkk6C/wJolfC6c1a7w
	vUHhRMXTxhhmpXqPJbBq19QYdAc91Ggibinl8Q6nGxCUOIJtDhTLjDGjTLFfSdQFtEQm
	zlfGEyMlzVmstu6ZQNLM9uXsxkb3x0oMMGpVZPlmMpTOWRGABV6T9za/EGvjKrCDTdxx
	ut5/8MdlFHcQsH3W3xIds/ie6J+bCUZXWKWUFs3cYd1iD6BvzM275WD1S8iPn6pvzxd3
	SliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OPu0GmjsKHBlMV4nV/MrZrlKcL2eTv9WWJTfFpnTNO4=;
	b=BBBdogp2rQLDhSOaJ+gnEpqQA2jNKXPsP95G/tOFzGUquIvraAn+WjN5NLusU9BWCP
	UDCDYcnwo/poNJJ3X6H5VAf3UmIn6gZmASZYvKzwTv/ODwcuYQ7ZWwNehugcLODOxG00
	X510TBLzT94fDAICYHPFJeo0weoWjTnl/tg1kmo6v2DNnFHkfaAxxoAmOOaE4U1wqjJx
	ODiA4NdjPM2YphYArHxK5tFoQT/xYnr8RiEwZlMNvY95vNkkr78el/3n7K3trfcQayr6
	4IXJMM1joiaQjuwAATA2v0NCS5X1HH5nFb1kwBZJCISyQCA63PG9vaZEiZaVosWKV2qa
	zU0A==
X-Gm-Message-State: APjAAAVnYKukUWINT5bVCkfpOSFd16R3fmPyoLR6Mc4fzkoqIoUxZdtq
	oYq0g3LP/eS89SAR9GvwEv9HwWIj
X-Google-Smtp-Source: APXvYqwv6cAUvoW62pziRu5fNuzwDnfjsI1UhnZgrZPTe5hycRj4TKcmJlAIoxGB3B3oUrzaz6eKZA==
X-Received: by 2002:a62:1d11:: with SMTP id d17mr17279406pfd.249.1566076913419;
	Sat, 17 Aug 2019 14:21:53 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:29d8:851b:cd27:3ce0])
	by smtp.gmail.com with ESMTPSA id a20sm7261804pjo.0.2019.08.17.14.21.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Aug 2019 14:21:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Aug 2019 14:21:40 -0700
Message-Id: <2cebc7faa10c7ac6f60437658702f7adce3b3a89.1566076780.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1566076780.git.akuster808@gmail.com>
References: <cover.1566076780.git.akuster808@gmail.com>
Subject: [thud-next][ 7/8] libcomps: fix CVE-2019-3817
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
X-List-Received-Date: Sat, 17 Aug 2019 21:21:52 -0000

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


