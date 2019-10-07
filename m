Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id A34927D41C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:11:12 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id y5so8860286pfo.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 08:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OPu0GmjsKHBlMV4nV/MrZrlKcL2eTv9WWJTfFpnTNO4=;
	b=FrMiOxdR1Ky2a5XERRJppFjQDUMbw6ETgCraS/KS570vKkY6fAqjW1UaMRl6r0IZPn
	fUaxTUUVBB0iEdvn3Un1RQsxD//e336JxbYW80YpwtFQoocOh2812yFaXMG9xTz0mxlI
	OW4lBXyJ6dRYuCtawZDVJpRaOnyLTGiG8aV7Q7lOE1UMHUl0hyTJvMq4ETziLlSIcAJD
	ICOlYmzwH8u0vr2s505U7xVdnj6D9zt0dbxUUpzwfn03Su9G2r6k1IFnpROFExjwmbzA
	G68DqB7juXS3T4NI3ig51zxB7Mju+GOsdkZm0RZ/ZMqaRAhBarBOKMBQzzPZ88VThOzg
	BE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OPu0GmjsKHBlMV4nV/MrZrlKcL2eTv9WWJTfFpnTNO4=;
	b=l/wFhNoReCmXEjJwjbn1ueQhjAK5WZERjA63YDLct48v6XLAXHet2Xu2MSoh9TU5Lg
	D4OVz7Atl3ikBRd3tWtZR921r4G+VxgromPIeXIbYsau8jXM0kX31udrp0uZjEnaMtf4
	P86nRe3nqBmmzxPONdNcY40hSqr7FHGH0fmASjnrPIPb5uBw26YdcEtErEZwV2ddxNuM
	hxVompnDWE6EQ0cND4yXvZXOyB1jyOhoxfXMJ4DiB+VJ9Ttd2p/VQWDny+hyYNF/3MrA
	efqHBuIUB0BjXYDpqTBnDOff1uZ/N7h60S3DO0KABeI2v/INemrv/za/T6vFiN21N1LS
	rYRQ==
X-Gm-Message-State: APjAAAURgfB8xminknsKxNfdkD0bYPPsRprGvFjuTgiAgS0yA0Mx1O4P
	XNSpBjHPgcEIideuJpYNHau45A2Zksc=
X-Google-Smtp-Source: APXvYqyQ+3fofArJZZ8iAHtDumN0BNo+Pb7pLfm0D//JA0a4CVWoMm0eg0vhySHsNIrKMgT/s/Mk6g==
X-Received: by 2002:a65:628f:: with SMTP id f15mr31785897pgv.215.1570461073336;
	Mon, 07 Oct 2019 08:11:13 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	m102sm12786928pje.5.2019.10.07.08.11.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Oct 2019 08:11:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 08:10:44 -0700
Message-Id: <2cebc7faa10c7ac6f60437658702f7adce3b3a89.1570460789.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570460789.git.akuster808@gmail.com>
References: <cover.1570460789.git.akuster808@gmail.com>
Subject: [thud 07/26] libcomps: fix CVE-2019-3817
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
X-List-Received-Date: Mon, 07 Oct 2019 15:11:12 -0000

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


