Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B495FCD37B3
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:54 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15616.1777645533803624288
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DAFoMDhk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eRmBBCuz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019de3ee7309-532649ea-49ac-4393-8693-4703ea36cbc9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645548;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Jadyd6gL1jLz4cdw2ZnKbdM4Jlu9e5iAqDiZp/NteUY=;
	b=DAFoMDhkaL54c4X980N/l2pf1EQLZ9bFaIW0UWRoCbiUHlqqaMdxyMwJbOMS3/6l
	Ulcknq0fYxyxoGecaeYss8ABhMZ+rKij5xb36CDt5pYd6NJ3JMiBET+kwBnwm7j3iPF
	F0XG+XzwdbisdYLREvBMMuoc2mUOyZzpGTIMWy0s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645548;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Jadyd6gL1jLz4cdw2ZnKbdM4Jlu9e5iAqDiZp/NteUY=;
	b=eRmBBCuzPrWuB5H52ZdrBRcLCIZI2PSsXrhl3I51+EKDiX5F2yCKh2TjSne6sbY6
	UOC2ARfvar+4FEIIXJ1YWlZBdr32Y82TGV0T2bfI1QhaMnY1S423EcnazR4LZLV0MLs
	MunNazIfJbm3nfzuAfRAIwRmXFOP6HFAjfO4YK0M=
Content-Type: multipart/mixed; boundary="===============7104780938385326931=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xz: upgrading to 5.8.3 SUCCEEDED
Message-ID: <0101019de3ee7309-532649ea-49ac-4393-8693-4703ea36cbc9-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236263

--===============7104780938385326931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xz* to *5.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xz-upgrade-5.8.2-5.8.3.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 5ecb679c4ef6f58e3813ab474a29ab54e84463f1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 10:51:36 +0000
Subject: [PATCH] xz: upgrade 5.8.2 -> 5.8.3

---
 ...buffer-overflow-in-lzma_index_append.patch | 66 -------------------
 .../xz/{xz_5.8.2.bb => xz_5.8.3.bb}           |  5 +-
 2 files changed, 2 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch
 rename meta/recipes-extended/xz/{xz_5.8.2.bb => xz_5.8.3.bb} (94%)

diff --git a/meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch b/meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch
deleted file mode 100644
index d3918233ea..0000000000
--- a/meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From c8c22869e780ff57c96b46939c3d79ff99395f87 Mon Sep 17 00:00:00 2001
-From: Lasse Collin <lasse.collin@tukaani.org>
-Date: Sun, 29 Mar 2026 19:11:21 +0300
-Subject: [PATCH] liblzma: Fix a buffer overflow in lzma_index_append()
-
-If lzma_index_decoder() was used to decode an Index that contained no
-Records, the resulting lzma_index had an invalid internal "prealloc"
-value. If lzma_index_append() was called on this lzma_index, too
-little memory would be allocated and a buffer overflow would occur.
-
-While this combination of the API functions is meant to work, in the
-real-world apps this call sequence is rare or might not exist at all.
-
-This bug is older than xz 5.0.0, so all stable releases are affected.
-
-Reported-by: GitHub user christos-spearbit
-
-CVE: CVE-2026-34743
-Upstream-Status: Backport [https://github.com/tukaani-project/xz/commit/c8c22869e780ff57c96b46939c3d79ff99395f87]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/liblzma/common/index.c | 21 +++++++++++++++++++++
- 1 file changed, 21 insertions(+)
-
-diff --git a/src/liblzma/common/index.c b/src/liblzma/common/index.c
-index 6add6a68..c4aadb9b 100644
---- a/src/liblzma/common/index.c
-+++ b/src/liblzma/common/index.c
-@@ -433,6 +433,26 @@ lzma_index_prealloc(lzma_index *i, lzma_vli records)
- 	if (records > PREALLOC_MAX)
- 		records = PREALLOC_MAX;
- 
-+	// If index_decoder.c calls us with records == 0, it's decoding
-+	// an Index that has no Records. In that case the decoder won't call
-+	// lzma_index_append() at all, and i->prealloc isn't used during
-+	// the Index decoding either.
-+	//
-+	// Normally the first lzma_index_append() call from the Index decoder
-+	// would reset i->prealloc to INDEX_GROUP_SIZE. With no Records,
-+	// lzma_index_append() isn't called and the resetting of prealloc
-+	// won't occur either. Thus, if records == 0, use the default value
-+	// INDEX_GROUP_SIZE instead.
-+	//
-+	// NOTE: lzma_index_append() assumes i->prealloc > 0. liblzma <= 5.8.2
-+	// didn't have this check and could set i->prealloc = 0, which would
-+	// result in a buffer overflow if the application called
-+	// lzma_index_append() after decoding an empty Index. Appending
-+	// Records after decoding an Index is a rare thing to do, but
-+	// it is supposed to work.
-+	if (records == 0)
-+		records = INDEX_GROUP_SIZE;
-+
- 	i->prealloc = (size_t)(records);
- 	return;
- }
-@@ -685,6 +705,7 @@ lzma_index_append(lzma_index *i, const lzma_allocator *allocator,
- 		++g->last;
- 	} else {
- 		// We need to allocate a new group.
-+		assert(i->prealloc > 0);
- 		g = lzma_alloc(sizeof(index_group)
- 				+ i->prealloc * sizeof(index_record),
- 				allocator);
--- 
-2.43.0
-
diff --git a/meta/recipes-extended/xz/xz_5.8.2.bb b/meta/recipes-extended/xz/xz_5.8.3.bb
similarity index 94%
rename from meta/recipes-extended/xz/xz_5.8.2.bb
rename to meta/recipes-extended/xz/xz_5.8.3.bb
index 15eaa7a52f..74efe561c6 100644
--- a/meta/recipes-extended/xz/xz_5.8.2.bb
+++ b/meta/recipes-extended/xz/xz_5.8.3.bb
@@ -26,10 +26,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d38d562f6112174de93a9677682231b2 \
                     "
 
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
-           file://0001-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch \
            file://run-ptest \
-          "
-SRC_URI[sha256sum] = "ce09c50a5962786b83e5da389c90dd2c15ecd0980a258dd01f70f9e7ce58a8f1"
+           "
+SRC_URI[sha256sum] = "3d3a1b973af218114f4f889bbaa2f4c037deaae0c8e815eec381c3d546b974a0"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 
-- 
2.47.1


--===============7104780938385326931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.8.2", added "/usr/lib/liblzma.so.5.8.3"
Changes to packages/x86-64-v3-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so.5.8.2 moved to /usr/lib/liblzma.so.5.8.3
packages/x86-64-v3-poky-linux/xz/xz-doc: FILELIST: added "/usr/share/man/ar/man1/lzdiff.1 /usr/share/man/ar/man1/xzdiff.1 /usr/share/man/ar/man1/xzgrep.1 /usr/share/man/ar/man1/lzgrep.1 /usr/share/man/ar/man1/lzcat.1 /usr/share/man/ar/man1/unxz.1 /usr/share/man/ar/man1/unlzma.1 /usr/share/man/ar/man1/xzcat.1 /usr/share/man/ar/man1/lzmadec.1 /usr/share/man/ar/man1/lzmainfo.1 /usr/share/man/ar/man1/xzless.1 /usr/share/man/ar/man1/lzless.1 /usr/share/man/ar/man1/xz.1 /usr/share/man/ar/man1/xzmore.1 /usr/share/man/ar/man1/lzmore.1 /usr/share/man/ar/man1/lzegrep.1 /usr/share/man/ar/man1/xzegrep.1 /usr/share/man/ar/man1/xzdec.1 /usr/share/man/ar/man1/lzma.1 /usr/share/man/ar/man1/lzcmp.1 /usr/share/man/ar/man1/lzfgrep.1 /usr/share/man/ar/man1/xzcmp.1 /usr/share/man/ar/man1/xzfgrep.1"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was removed
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so.5.8.2 moved to /usr/lib/liblzma.so.5.8.3

--===============7104780938385326931==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-xz-upgrade-5.8.2-5.8.3.patch"

RnJvbSA1ZWNiNjc5YzRlZjZmNThlMzgxM2FiNDc0YTI5YWI1NGU4NDQ2M2YxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMDo1MTozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHh6
OiB1cGdyYWRlIDUuOC4yIC0+IDUuOC4zCgotLS0KIC4uLmJ1ZmZlci1vdmVyZmxvdy1pbi1sem1h
X2luZGV4X2FwcGVuZC5wYXRjaCB8IDY2IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi94ei97eHpf
NS44LjIuYmIgPT4geHpfNS44LjMuYmJ9ICAgICAgICAgICB8ICA1ICstCiAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgNjkgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQg
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL3h6L3h6LzAwMDEtbGlibHptYS1GaXgtYS1idWZmZXItb3Zl
cmZsb3ctaW4tbHptYV9pbmRleF9hcHBlbmQucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQveHove3h6XzUuOC4yLmJiID0+IHh6XzUuOC4zLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC94ei94ei8wMDAxLWxpYmx6bWEtRml4LWEtYnVmZmVyLW92
ZXJmbG93LWluLWx6bWFfaW5kZXhfYXBwZW5kLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3h6L3h6LzAwMDEtbGlibHptYS1GaXgtYS1idWZmZXItb3ZlcmZsb3ctaW4tbHptYV9pbmRleF9h
cHBlbmQucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGQzOTE4MjMzZWEuLjAw
MDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3h6L3h6LzAwMDEtbGlibHptYS1G
aXgtYS1idWZmZXItb3ZlcmZsb3ctaW4tbHptYV9pbmRleF9hcHBlbmQucGF0Y2gKKysrIC9kZXYv
bnVsbApAQCAtMSw2NiArMCwwIEBACi1Gcm9tIGM4YzIyODY5ZTc4MGZmNTdjOTZiNDY5MzljM2Q3
OWZmOTkzOTVmODcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBMYXNzZSBDb2xsaW4g
PGxhc3NlLmNvbGxpbkB0dWthYW5pLm9yZz4KLURhdGU6IFN1biwgMjkgTWFyIDIwMjYgMTk6MTE6
MjEgKzAzMDAKLVN1YmplY3Q6IFtQQVRDSF0gbGlibHptYTogRml4IGEgYnVmZmVyIG92ZXJmbG93
IGluIGx6bWFfaW5kZXhfYXBwZW5kKCkKLQotSWYgbHptYV9pbmRleF9kZWNvZGVyKCkgd2FzIHVz
ZWQgdG8gZGVjb2RlIGFuIEluZGV4IHRoYXQgY29udGFpbmVkIG5vCi1SZWNvcmRzLCB0aGUgcmVz
dWx0aW5nIGx6bWFfaW5kZXggaGFkIGFuIGludmFsaWQgaW50ZXJuYWwgInByZWFsbG9jIgotdmFs
dWUuIElmIGx6bWFfaW5kZXhfYXBwZW5kKCkgd2FzIGNhbGxlZCBvbiB0aGlzIGx6bWFfaW5kZXgs
IHRvbwotbGl0dGxlIG1lbW9yeSB3b3VsZCBiZSBhbGxvY2F0ZWQgYW5kIGEgYnVmZmVyIG92ZXJm
bG93IHdvdWxkIG9jY3VyLgotCi1XaGlsZSB0aGlzIGNvbWJpbmF0aW9uIG9mIHRoZSBBUEkgZnVu
Y3Rpb25zIGlzIG1lYW50IHRvIHdvcmssIGluIHRoZQotcmVhbC13b3JsZCBhcHBzIHRoaXMgY2Fs
bCBzZXF1ZW5jZSBpcyByYXJlIG9yIG1pZ2h0IG5vdCBleGlzdCBhdCBhbGwuCi0KLVRoaXMgYnVn
IGlzIG9sZGVyIHRoYW4geHogNS4wLjAsIHNvIGFsbCBzdGFibGUgcmVsZWFzZXMgYXJlIGFmZmVj
dGVkLgotCi1SZXBvcnRlZC1ieTogR2l0SHViIHVzZXIgY2hyaXN0b3Mtc3BlYXJiaXQKLQotQ1ZF
OiBDVkUtMjAyNi0zNDc0MwotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRo
dWIuY29tL3R1a2FhbmktcHJvamVjdC94ei9jb21taXQvYzhjMjI4NjllNzgwZmY1N2M5NmI0Njkz
OWMzZDc5ZmY5OTM5NWY4N10KLVNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRv
bkBhcm0uY29tPgotLS0tCi0gc3JjL2xpYmx6bWEvY29tbW9uL2luZGV4LmMgfCAyMSArKysrKysr
KysrKysrKysrKysrKysKLSAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQotCi1kaWZm
IC0tZ2l0IGEvc3JjL2xpYmx6bWEvY29tbW9uL2luZGV4LmMgYi9zcmMvbGlibHptYS9jb21tb24v
aW5kZXguYwotaW5kZXggNmFkZDZhNjguLmM0YWFkYjliIDEwMDY0NAotLS0tIGEvc3JjL2xpYmx6
bWEvY29tbW9uL2luZGV4LmMKLSsrKyBiL3NyYy9saWJsem1hL2NvbW1vbi9pbmRleC5jCi1AQCAt
NDMzLDYgKzQzMywyNiBAQCBsem1hX2luZGV4X3ByZWFsbG9jKGx6bWFfaW5kZXggKmksIGx6bWFf
dmxpIHJlY29yZHMpCi0gCWlmIChyZWNvcmRzID4gUFJFQUxMT0NfTUFYKQotIAkJcmVjb3JkcyA9
IFBSRUFMTE9DX01BWDsKLSAKLSsJLy8gSWYgaW5kZXhfZGVjb2Rlci5jIGNhbGxzIHVzIHdpdGgg
cmVjb3JkcyA9PSAwLCBpdCdzIGRlY29kaW5nCi0rCS8vIGFuIEluZGV4IHRoYXQgaGFzIG5vIFJl
Y29yZHMuIEluIHRoYXQgY2FzZSB0aGUgZGVjb2RlciB3b24ndCBjYWxsCi0rCS8vIGx6bWFfaW5k
ZXhfYXBwZW5kKCkgYXQgYWxsLCBhbmQgaS0+cHJlYWxsb2MgaXNuJ3QgdXNlZCBkdXJpbmcKLSsJ
Ly8gdGhlIEluZGV4IGRlY29kaW5nIGVpdGhlci4KLSsJLy8KLSsJLy8gTm9ybWFsbHkgdGhlIGZp
cnN0IGx6bWFfaW5kZXhfYXBwZW5kKCkgY2FsbCBmcm9tIHRoZSBJbmRleCBkZWNvZGVyCi0rCS8v
IHdvdWxkIHJlc2V0IGktPnByZWFsbG9jIHRvIElOREVYX0dST1VQX1NJWkUuIFdpdGggbm8gUmVj
b3JkcywKLSsJLy8gbHptYV9pbmRleF9hcHBlbmQoKSBpc24ndCBjYWxsZWQgYW5kIHRoZSByZXNl
dHRpbmcgb2YgcHJlYWxsb2MKLSsJLy8gd29uJ3Qgb2NjdXIgZWl0aGVyLiBUaHVzLCBpZiByZWNv
cmRzID09IDAsIHVzZSB0aGUgZGVmYXVsdCB2YWx1ZQotKwkvLyBJTkRFWF9HUk9VUF9TSVpFIGlu
c3RlYWQuCi0rCS8vCi0rCS8vIE5PVEU6IGx6bWFfaW5kZXhfYXBwZW5kKCkgYXNzdW1lcyBpLT5w
cmVhbGxvYyA+IDAuIGxpYmx6bWEgPD0gNS44LjIKLSsJLy8gZGlkbid0IGhhdmUgdGhpcyBjaGVj
ayBhbmQgY291bGQgc2V0IGktPnByZWFsbG9jID0gMCwgd2hpY2ggd291bGQKLSsJLy8gcmVzdWx0
IGluIGEgYnVmZmVyIG92ZXJmbG93IGlmIHRoZSBhcHBsaWNhdGlvbiBjYWxsZWQKLSsJLy8gbHpt
YV9pbmRleF9hcHBlbmQoKSBhZnRlciBkZWNvZGluZyBhbiBlbXB0eSBJbmRleC4gQXBwZW5kaW5n
Ci0rCS8vIFJlY29yZHMgYWZ0ZXIgZGVjb2RpbmcgYW4gSW5kZXggaXMgYSByYXJlIHRoaW5nIHRv
IGRvLCBidXQKLSsJLy8gaXQgaXMgc3VwcG9zZWQgdG8gd29yay4KLSsJaWYgKHJlY29yZHMgPT0g
MCkKLSsJCXJlY29yZHMgPSBJTkRFWF9HUk9VUF9TSVpFOwotKwotIAlpLT5wcmVhbGxvYyA9IChz
aXplX3QpKHJlY29yZHMpOwotIAlyZXR1cm47Ci0gfQotQEAgLTY4NSw2ICs3MDUsNyBAQCBsem1h
X2luZGV4X2FwcGVuZChsem1hX2luZGV4ICppLCBjb25zdCBsem1hX2FsbG9jYXRvciAqYWxsb2Nh
dG9yLAotIAkJKytnLT5sYXN0OwotIAl9IGVsc2UgewotIAkJLy8gV2UgbmVlZCB0byBhbGxvY2F0
ZSBhIG5ldyBncm91cC4KLSsJCWFzc2VydChpLT5wcmVhbGxvYyA+IDApOwotIAkJZyA9IGx6bWFf
YWxsb2Moc2l6ZW9mKGluZGV4X2dyb3VwKQotIAkJCQkrIGktPnByZWFsbG9jICogc2l6ZW9mKGlu
ZGV4X3JlY29yZCksCi0gCQkJCWFsbG9jYXRvcik7Ci0tLSAKLTIuNDMuMAotCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQveHoveHpfNS44LjIuYmIgYi9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQveHoveHpfNS44LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3h6L3h6XzUuOC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQveHoveHpfNS44LjMuYmIKaW5kZXggMTVlYWE3YTUyZi4uNzRlZmU1NjFjNiAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3h6L3h6XzUuOC4yLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1leHRlbmRlZC94ei94el81LjguMy5iYgpAQCAtMjYsMTAgKzI2LDkgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9ZDM4ZDU2MmY2MTEyMTc0ZGU5M2E5Njc3
NjgyMjMxYjIgXAogICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9n
aXRodWIuY29tL3R1a2FhbmktcHJvamVjdC94ei9yZWxlYXNlcy9kb3dubG9hZC92JHtQVn0veHot
JHtQVn0udGFyLmd6IFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtbGlibHptYS1GaXgtYS1idWZm
ZXItb3ZlcmZsb3ctaW4tbHptYV9pbmRleF9hcHBlbmQucGF0Y2ggXAogICAgICAgICAgICBmaWxl
Oi8vcnVuLXB0ZXN0IFwKLSAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2UwOWM1
MGE1OTYyNzg2YjgzZTVkYTM4OWM5MGRkMmMxNWVjZDA5ODBhMjU4ZGQwMWY3MGY5ZTdjZTU4YThm
MSIKKyAgICAgICAgICAgIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNkM2ExYjk3M2FmMjE4MTE0
ZjRmODg5YmJhYTJmNGMwMzdkZWFhZTBjOGU4MTVlZWMzODFjM2Q1NDZiOTc0YTAiCiBVUFNUUkVB
TV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy90YWcvdig/UDxwdmVyPlxkKyhcLlxkKykrKSIKIFVQ
U1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vdHVrYWFuaS1wcm9qZWN0L3h6
L3JlbGVhc2VzLyIKIAotLSAKMi40Ny4xCgo=

--===============7104780938385326931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xz: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz: SRC_URI changed from "https://github.com/tukaani-project/xz/releases/download/v5.8.2/xz-5.8.2.tar.gz file://0001-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch file://run-ptest" to "https://github.com/tukaani-project/xz/releases/download/v5.8.3/xz-5.8.3.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/xz: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/liblzma: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.8.2", added "/usr/lib/liblzma.so.5.8.3"
packages/x86-64-v3-poky-linux/xz/liblzma: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
Changes to packages/x86-64-v3-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so.5.8.2 moved to /usr/lib/liblzma.so.5.8.3
packages/x86-64-v3-poky-linux/xz/xz-dbg: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-dbg: FILELIST: removed "/usr/lib/.debug/liblzma.so.5.8.2", added "/usr/lib/.debug/liblzma.so.5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-dbg: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-dbg: PKGSIZE changed from 2251048 to 2255160 (+0%)
packages/x86-64-v3-poky-linux/xz/xz-dev: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-dev: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-dev: PKGSIZE changed from 229928 to 229942 (+0%)
packages/x86-64-v3-poky-linux/xz/xz-doc: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-doc: FILELIST: added "/usr/share/man/ar/man1/lzdiff.1 /usr/share/man/ar/man1/xzdiff.1 /usr/share/man/ar/man1/lzless.1 /usr/share/man/ar/man1/xzless.1 /usr/share/man/ar/man1/xzcmp.1 /usr/share/man/ar/man1/lzcmp.1 /usr/share/man/ar/man1/lzfgrep.1 /usr/share/man/ar/man1/xzfgrep.1 /usr/share/man/ar/man1/xzdec.1 /usr/share/man/ar/man1/lzmainfo.1 /usr/share/man/ar/man1/lzmadec.1 /usr/share/man/ar/man1/lzma.1 /usr/share/man/ar/man1/lzmore.1 /usr/share/man/ar/man1/xzmore.1 /usr/share/man/ar/man1/unxz.1 /usr/share/man/ar/man1/xz.1 /usr/share/man/ar/man1/lzegrep.1 /usr/share/man/ar/man1/lzgrep.1 /usr/share/man/ar/man1/xzegrep.1 /usr/share/man/ar/man1/xzgrep.1 /usr/share/man/ar/man1/unlzma.1 /usr/share/man/ar/man1/xzcat.1 /usr/share/man/ar/man1/lzcat.1"
packages/x86-64-v3-poky-linux/xz/xz-doc: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-doc: PKGSIZE changed from 1390205 to 1517047 (+9%)
packages/x86-64-v3-poky-linux/xz/xz-locale-ca: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-ca: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-cs: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-cs: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-da: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-da: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-de: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-de: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-eo: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-eo: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-es: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-es: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-fi: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-fi: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-fr: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-fr: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-hr: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-hr: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-hu: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-hu: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-it: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-it: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-ka: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-ka: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-ko: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-ko: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-nl: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-nl: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-pl: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-pl: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-pt-br: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-pt-br: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-pt: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-pt: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-ro: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-ro: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-sr: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-sr: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-sv: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-sv: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-tr: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-tr: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-uk: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-uk: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-vi: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-vi: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-zh-cn: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-zh-cn: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-locale-zh-tw: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-locale-zh-tw: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-ptest: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-ptest: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-src: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-src: FILELIST: directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/lz -> /usr/src/debug/xz/5.8.3/src/liblzma/lz, directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/simple -> /usr/src/debug/xz/5.8.3/src/liblzma/simple, directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/rangecoder -> /usr/src/debug/xz/5.8.3/src/liblzma/rangecoder, directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/lzma -> /usr/src/debug/xz/5.8.3/src/liblzma/lzma, directory renamed /usr/src/debug/xz/5.8.2/src/common -> /usr/src/debug/xz/5.8.3/src/common, directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/delta -> /usr/src/debug/xz/5.8.3/src/liblzma/delta, directory renamed /usr/src/debug/xz/5.8.2/src/xzdec -> /usr/src/debug/xz/5.8.3/src/xzdec, directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/check -> /usr/src/debug/xz/5.8.3/src/liblzma/check, directory renamed /usr/src/debug/xz/5.8.2/src/xz -> /usr/src/debug/xz/5.8.3/src/xz, directory renamed /usr/src/debug/xz/5.8.2
 /src/liblzma/common -> /usr/src/debug/xz/5.8.3/src/liblzma/common, directory renamed /usr/src/debug/xz/5.8.2/src/lzmainfo -> /usr/src/debug/xz/5.8.3/src/lzmainfo, directory renamed /usr/src/debug/xz/5.8.2/tests -> /usr/src/debug/xz/5.8.3/tests, directory renamed /usr/src/debug/xz/5.8.2/src/liblzma/api/lzma -> /usr/src/debug/xz/5.8.3/src/liblzma/api/lzma
packages/x86-64-v3-poky-linux/xz/xz-src: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz-src: PKGSIZE changed from 1697314 to 1698866 (+0%)
packages/x86-64-v3-poky-linux/xz/xz-staticdev: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz-staticdev: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
packages/x86-64-v3-poky-linux/xz/xz: PV changed from "5.8.2" to "5.8.3"
packages/x86-64-v3-poky-linux/xz/xz: PKGV changed from 5.8.2 [default] to 5.8.3 [default]
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8800.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.88.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8800.0-gdb.py was removed
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.8.2 to liblzma.so.5.8.3
  /usr/lib/liblzma.so.5.8.2 moved to /usr/lib/liblzma.so.5.8.3

--===============7104780938385326931==--

