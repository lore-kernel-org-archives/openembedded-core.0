Return-Path: <ole2mail@mail.com>
Received: from mout.gmx.com (mout.gmx.com [74.208.4.201])
	by mail.openembedded.org (Postfix) with ESMTP id DD054787C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 15:08:00 +0000 (UTC)
Received: from localhost.localdomain ([109.0.249.169]) by mail.gmx.com
	(mrgmxus002 [74.208.5.15]) with ESMTPSA (Nemesis) id
	0MMjsH-1ejzSR40wp-008Yze; Fri, 19 Jan 2018 16:08:01 +0100
From: Oleg Kokorin <ole2mail@mail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jan 2018 16:07:52 +0100
Message-Id: <1516374472-5682-1-git-send-email-ole2mail@mail.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K0:uPfg0lqDAThrJ9xS4w0UG5c2vrlQSXhsEZMp4+nZ0duA706mTNv
	lMpKBOA0ijpxY3vL9mou64Af5PXhoHGlpaRNy4ZoPTRnhCwMr8aV4f3wPSdbjTXKpR688MK
	kZEov6fTtPAYNXkP82zsZkX1x0Euvug2m+qwQnns1fT112jT/svlxTZdQYiKgMjY02xkTSp
	dG0m/dd7Ou+uc2DAetV3Q==
X-UI-Out-Filterresults: notjunk:1;V01:K0:80//QTElwZc=:au/kShDD5T7LvcmlaLWeAp
	ax3tgZQBZ6odDot4TPYO0hD68OQ1500rGzlgIaO8D475SDyx6TmWzXyfrhvS9YWwnnuxMVtVf
	SMxLxaCYDXWtgp08KkEn7AalR3msZQquvW7lTF2I2GV0G1Hi8+NIf5FKKKn78MN5pPtq+ZBCj
	T5jRvElcnYWSgYJMUUxYR5NL7UzUqYLSOuuwUSFE4FMCd9KBqOb9ErlxtnBhtEaddHu60Kkmr
	vDlKMU8LMV578bmmye6j8hCmBcv4c1uwcJ0iqDma24KXB7bSXmQTEkNtLqLxLnTeTobTSYH3L
	HnLiel1mDElGm3QjlY9cUMeFhNlAg9kN8M+g6Yh8UvCFEAu7/186dzoU++nCIlfibzOsT42Do
	PoB4jYsOPbw6s29IycjjYpcVsgS5tm0gvyjWE2FVfr+XBPZHNf0kXusjUBYmQQCdvpqUAEvwM
	KzQlRtelTdTHAwNy6emKoJ3CVkJq6TdCrTLlw/F1Q76ImVX0/GOZ0LwEqZLUlDJvBeO0QOrqt
	uQyQyp30KWaDz9qjDx/JmCqdfDG8SlGQ0a6ljuCpYCLzedf28J6YotbUp3lH+yRjfvnuAFX+w
	rlqNfywz+PX7qcfsqR5SIWuprgeVqq+TANxHqQqtWEf8eNaJi2nfwc89LU2OVQExVhqbmwM0h
	eOTWTJ1kKo+Yh5q2qFqYxyBqAmYhdqCZi8bAI7AguNJ4XvcimzBOhHP1fN1uTLJJ1nE71oDxk
	ZpimIUbDqqPQJl9zXJVC2VWARUpy5Rrxsz24gZljDH87xe4tb9oKodyOVe6FWGRFV1Gd0uUTe
	bdVmlfJbS9KKUGg85rFzLJwXmQmlg==
Subject: [PATCH] [PATCH v3] mtd-utils: remove double hashtable iterator definition
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
X-List-Received-Date: Fri, 19 Jan 2018 15:08:01 -0000

hashtable_iterator_key and hashtable_iterator_value redefinition inside
mkfs.ubifs/hashtable/hashtable_itr.h cause linker redefinition error

Signed-off-by: Oleg Kokorin <ole2mail@mail.com>
---
 .../mtd-utils-fix-hashtable_iterator.patch         | 43 ++++++++++++++++++++++
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-hashtable_iterator.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-hashtable_iterator.patch b/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-hashtable_iterator.patch
new file mode 100644
index 0000000..4253286
--- /dev/null
+++ b/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-hashtable_iterator.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Submitted to dizzy
+
+Author: Oleg Kokorin <ole2mail@mail.com>
+Date:   Fri Jan 19 11:52:12 2018 +0100
+
+mtd-utils: remove double hashtable iterator definition
+
+hashtable_iterator_key and hashtable_iterator_value redefinition inside
+mkfs.ubifs/hashtable/hashtable_itr.h cause linker redefinition error
+
+Signed-off-by: Oleg Kokorin <ole2mail@mail.com>
+
+Index: setup-scripts/build/tmp-angstrom_v2014_12-glibc/work/x86_64-linux/mtd-utils-native/1.5.1+gitAUTOINC+9f107132a6-r0/git/mkfs.ubifs/hashtable/hashtable_itr.h
+===================================================================
+--- a/mkfs.ubifs/hashtable/hashtable_itr.h
++++ b/mkfs.ubifs/hashtable/hashtable_itr.h
+@@ -27,22 +27,22 @@ hashtable_iterator(struct hashtable *h);
+ /*****************************************************************************/
+ /* hashtable_iterator_key
+  * - return the value of the (key,value) pair at the current position */
+-
++/*
+ extern inline void *
+ hashtable_iterator_key(struct hashtable_itr *i)
+ {
+     return i->e->k;
+ }
+-
++*/
+ /*****************************************************************************/
+ /* value - return the value of the (key,value) pair at the current position */
+-
++/*
+ extern inline void *
+ hashtable_iterator_value(struct hashtable_itr *i)
+ {
+     return i->e->v;
+ }
+-
++*/
+ /*****************************************************************************/
+ /* advance - advance the iterator to the next element
+  *           returns zero if advanced to end of table */
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 52297c6..f903a65 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -11,6 +11,7 @@ SRCREV = "9f107132a6a073cce37434ca9cda6917dd8d866b"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
 		file://add-exclusion-to-mkfs-jffs2-git-2.patch \
 		file://fix-armv7-neon-alignment.patch \
+		file://mtd-utils-fix-hashtable_iterator.patch \
 "
 
 PV = "1.5.1+git${SRCPV}"
-- 
2.7.4


