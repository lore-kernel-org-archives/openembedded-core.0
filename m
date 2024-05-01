Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9EAC3065C
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:23 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.1132.1714579216386155415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JoyGZpyD;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Xv9DhqSz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018f34e2953a-5cfc6b9d-e30e-489c-8657-0d9897e0d4f8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=We/kh8kyk9TsEgPiQFZPtLSp7U1o/DE7CGWZUltMsdk=;
	b=JoyGZpyDcvdR3I2TsOgU8yXqSsvjZfBzY3BmsBAXg3E7iHxefj0ukqYE8LBE2Jhq
	OvxZ4JNbi6RTviruycHMoSSwTo/Y9jN2qvsRv4E5c5/1xRkw3SxeV08OnMA+aE4elrd
	KKnHPe5kWV0QL7j5AWVmp34E+/m+/ZTt+QiOH7S0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=We/kh8kyk9TsEgPiQFZPtLSp7U1o/DE7CGWZUltMsdk=;
	b=Xv9DhqSzeqC/uTVU1nJav7AOyz/zmMFLwSrH51bo73aGrm9j5gAfRBu0q19W4iKU
	YtiuBdiCDZVhQsOD2QyYZxk/DhLfA1XOJHvprb85giHXZST1KcG4EColT8xHnA4+HQ0
	Gb8FnM0qAOQWQxFBu/9xpklWmHkCgMt2kT9HIPT4=
Content-Type: multipart/mixed; boundary="===============0427596546521092127=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.15.1 FAILED
Message-ID: <0101018f34e2953a-5cfc6b9d-e30e-489c-8657-0d9897e0d4f8-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198842

--===============0427596546521092127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shadow* to *4.15.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-shadow-upgrade-4.15.0-4.15.1.patch
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
From a71b7876ccea9e8431afed2b534829d55f929992 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 09:12:34 +0000
Subject: [PATCH] shadow: upgrade 4.15.0 -> 4.15.1

---
 ...copy_entry-use-temporary-stat-buffer.patch | 37 -------------------
 ...nexpected-open-failure-in-chroot-env.patch |  2 +-
 .../shadow/files/shadow-update-pam-conf.patch |  2 +-
 meta/recipes-extended/shadow/shadow.inc       |  5 ++-
 .../{shadow_4.15.0.bb => shadow_4.15.1.bb}    |  0
 5 files changed, 5 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch
 rename meta/recipes-extended/shadow/{shadow_4.15.0.bb => shadow_4.15.1.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch b/meta/recipes-extended/shadow/files/0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch
deleted file mode 100644
index 2e5503bfd4..0000000000
--- a/meta/recipes-extended/shadow/files/0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From af4b8cb780587aa736692a3baa76b60474f19c5d Mon Sep 17 00:00:00 2001
-From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
-Date: Mon, 18 Mar 2024 12:14:21 +0100
-Subject: [PATCH] lib/copydir:copy_entry(): use temporary stat buffer
-
-There are no guarantees that fstatat() does not clobber the stat
-buffer on errors.
-
-Use a temporary buffer so that the following code sees correct
-attributes of the source entry.
-
-Upstream-Status: Submitted [https://github.com/shadow-maint/shadow/pull/974]
-
-Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
----
- lib/copydir.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
---- a/lib/copydir.c
-+++ b/lib/copydir.c
-@@ -400,6 +400,7 @@ static int copy_entry (const struct path
- {
- 	int err = 0;
- 	struct stat sb;
-+	struct stat tmp_sb;
- 	struct link_name *lp;
- 	struct timespec mt[2];
- 
-@@ -423,7 +424,7 @@ static int copy_entry (const struct path
- 	* If the destination already exists do nothing.
- 	* This is after the copy_dir above to still iterate into subdirectories.
- 	*/
--	if (fstatat(dst->dirfd, dst->name, &sb, AT_SYMLINK_NOFOLLOW) != -1) {
-+	if (fstatat(dst->dirfd, dst->name, &tmp_sb, AT_SYMLINK_NOFOLLOW) != -1) {
- 		return err;
- 	}
- 
diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index cd99aad135..16807a6099 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From f512071dd3a4c29d4bf048c5a89c4ba9160e37b1 Mon Sep 17 00:00:00 2001
+From 5759b189b9bd9f41718976f90535fc65134c2a7d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Jul 2014 15:53:34 +0800
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
diff --git a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
index 1eacb8a53f..d973840fb4 100644
--- a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
+++ b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
@@ -1,4 +1,4 @@
-From 38882ab288fd4d2cc2e45dff222ae3412c8fe357 Mon Sep 17 00:00:00 2001
+From 87a7c13a8719a7bdb4316c346d8a1a502ed37554 Mon Sep 17 00:00:00 2001
 From: Kang Kai <kai.kang@windriver.com>
 Date: Wed, 20 Jul 2011 19:18:14 +0800
 Subject: [PATCH] shadow: update pam related configure files
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index c15715fc77..03c70fd214 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -12,9 +12,10 @@ DEPENDS = "virtual/crypt"
 
 GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
-           file://0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
+           file://login_defs_pam.sed \
+           file://shadow-update-pam-conf.patch \
            "
 
 SRC_URI:append:class-target = " \
@@ -25,7 +26,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            "
-SRC_URI[sha256sum] = "377fe0d7c1a0aa5e3514c08fdf5ddc70c9dcbb391678c2134445ed97326bcc26"
+SRC_URI[sha256sum] = "b34686b89b279887ffbf1f33128902ccc0fa1a998a3add44213bb12d7385b218"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
diff --git a/meta/recipes-extended/shadow/shadow_4.15.0.bb b/meta/recipes-extended/shadow/shadow_4.15.1.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.15.0.bb
rename to meta/recipes-extended/shadow/shadow_4.15.1.bb
-- 
2.44.0


--===============0427596546521092127==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shadow-upgrade-4.15.0-4.15.1.patch"

RnJvbSBhNzFiNzg3NmNjZWE5ZTg0MzFhZmVkMmI1MzQ4MjlkNTVmOTI5OTkyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAwOToxMjozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRvdzogdXBncmFkZSA0LjE1LjAgLT4gNC4xNS4xCgotLS0KIC4uLmNvcHlfZW50cnktdXNlLXRl
bXBvcmFyeS1zdGF0LWJ1ZmZlci5wYXRjaCB8IDM3IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLm5l
eHBlY3RlZC1vcGVuLWZhaWx1cmUtaW4tY2hyb290LWVudi5wYXRjaCB8ICAyICstCiAuLi4vc2hh
ZG93L2ZpbGVzL3NoYWRvdy11cGRhdGUtcGFtLWNvbmYucGF0Y2ggfCAgMiArLQogbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3cuaW5jICAgICAgIHwgIDUgKystCiAuLi4ve3NoYWRv
d180LjE1LjAuYmIgPT4gc2hhZG93XzQuMTUuMS5iYn0gICAgfCAgMAogNSBmaWxlcyBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvMDAwMS1saWItY29weWRpci1jb3B5X2Vu
dHJ5LXVzZS10ZW1wb3Jhcnktc3RhdC1idWZmZXIucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvc2hhZG93L3tzaGFkb3dfNC4xNS4wLmJiID0+IHNoYWRvd180LjE1LjEuYmJ9ICgx
MDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvMDAw
MS1saWItY29weWRpci1jb3B5X2VudHJ5LXVzZS10ZW1wb3Jhcnktc3RhdC1idWZmZXIucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzLzAwMDEtbGliLWNvcHlkaXItY29w
eV9lbnRyeS11c2UtdGVtcG9yYXJ5LXN0YXQtYnVmZmVyLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAyZTU1MDNiZmQ0Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9zaGFkb3cvZmlsZXMvMDAwMS1saWItY29weWRpci1jb3B5X2VudHJ5LXVzZS10ZW1w
b3Jhcnktc3RhdC1idWZmZXIucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzNyArMCwwIEBACi1G
cm9tIGFmNGI4Y2I3ODA1ODdhYTczNjY5MmEzYmFhNzZiNjA0NzRmMTljNWQgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCi1Gcm9tOiBFbnJpY28gU2Nob2x6IDxlbnJpY28uc2Nob2x6QHNpZ21hLWNo
ZW1uaXR6LmRlPgotRGF0ZTogTW9uLCAxOCBNYXIgMjAyNCAxMjoxNDoyMSArMDEwMAotU3ViamVj
dDogW1BBVENIXSBsaWIvY29weWRpcjpjb3B5X2VudHJ5KCk6IHVzZSB0ZW1wb3Jhcnkgc3RhdCBi
dWZmZXIKLQotVGhlcmUgYXJlIG5vIGd1YXJhbnRlZXMgdGhhdCBmc3RhdGF0KCkgZG9lcyBub3Qg
Y2xvYmJlciB0aGUgc3RhdAotYnVmZmVyIG9uIGVycm9ycy4KLQotVXNlIGEgdGVtcG9yYXJ5IGJ1
ZmZlciBzbyB0aGF0IHRoZSBmb2xsb3dpbmcgY29kZSBzZWVzIGNvcnJlY3QKLWF0dHJpYnV0ZXMg
b2YgdGhlIHNvdXJjZSBlbnRyeS4KLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBz
Oi8vZ2l0aHViLmNvbS9zaGFkb3ctbWFpbnQvc2hhZG93L3B1bGwvOTc0XQotCi1TaWduZWQtb2Zm
LWJ5OiBFbnJpY28gU2Nob2x6IDxlbnJpY28uc2Nob2x6QHNpZ21hLWNoZW1uaXR6LmRlPgotLS0t
Ci0gbGliL2NvcHlkaXIuYyB8IDMgKystCi0gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQotCi0tLS0gYS9saWIvY29weWRpci5jCi0rKysgYi9saWIvY29weWRp
ci5jCi1AQCAtNDAwLDYgKzQwMCw3IEBAIHN0YXRpYyBpbnQgY29weV9lbnRyeSAoY29uc3Qgc3Ry
dWN0IHBhdGgKLSB7Ci0gCWludCBlcnIgPSAwOwotIAlzdHJ1Y3Qgc3RhdCBzYjsKLSsJc3RydWN0
IHN0YXQgdG1wX3NiOwotIAlzdHJ1Y3QgbGlua19uYW1lICpscDsKLSAJc3RydWN0IHRpbWVzcGVj
IG10WzJdOwotIAotQEAgLTQyMyw3ICs0MjQsNyBAQCBzdGF0aWMgaW50IGNvcHlfZW50cnkgKGNv
bnN0IHN0cnVjdCBwYXRoCi0gCSogSWYgdGhlIGRlc3RpbmF0aW9uIGFscmVhZHkgZXhpc3RzIGRv
IG5vdGhpbmcuCi0gCSogVGhpcyBpcyBhZnRlciB0aGUgY29weV9kaXIgYWJvdmUgdG8gc3RpbGwg
aXRlcmF0ZSBpbnRvIHN1YmRpcmVjdG9yaWVzLgotIAkqLwotLQlpZiAoZnN0YXRhdChkc3QtPmRp
cmZkLCBkc3QtPm5hbWUsICZzYiwgQVRfU1lNTElOS19OT0ZPTExPVykgIT0gLTEpIHsKLSsJaWYg
KGZzdGF0YXQoZHN0LT5kaXJmZCwgZHN0LT5uYW1lLCAmdG1wX3NiLCBBVF9TWU1MSU5LX05PRk9M
TE9XKSAhPSAtMSkgewotIAkJcmV0dXJuIGVycjsKLSAJfQotIApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9w
ZW4tZmFpbHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3No
YWRvdy9maWxlcy9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1jaHJv
b3QtZW52LnBhdGNoCmluZGV4IGNkOTlhYWQxMzUuLjE2ODA3YTYwOTkgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvY29tbW9uaW8uYy1maXgtdW5leHBlY3Rl
ZC1vcGVuLWZhaWx1cmUtaW4tY2hyb290LWVudi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvc2hhZG93L2ZpbGVzL2NvbW1vbmlvLmMtZml4LXVuZXhwZWN0ZWQtb3Blbi1mYWlsdXJl
LWluLWNocm9vdC1lbnYucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGY1MTIwNzFkZDNhNGMy
OWQ0YmYwNDhjNWE4OWM0YmE5MTYwZTM3YjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDU3NTliMTg5YjliZDlmNDE3MTg5NzZmOTA1MzVmYzY1MTM0YzJhN2QgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBU
aHUsIDE3IEp1bCAyMDE0IDE1OjUzOjM0ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbW1vbmlv
LmMtZml4LXVuZXhwZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvc2hhZG93LXVwZGF0ZS1wYW0tY29u
Zi5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvc2hhZG93LXVwZGF0
ZS1wYW0tY29uZi5wYXRjaAppbmRleCAxZWFjYjhhNTNmLi5kOTczODQwZmI0IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL3NoYWRvdy11cGRhdGUtcGFtLWNv
bmYucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy9zaGFkb3ct
dXBkYXRlLXBhbS1jb25mLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzODg4MmFiMjg4ZmQ0
ZDJjYzJlNDVkZmYyMjJhZTM0MTJjOGZlMzU3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA4N2E3YzEzYTg3MTlhN2JkYjQzMTZjMzQ2ZDhhMWE1MDJlZDM3NTU0IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogS2FuZyBLYWkgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+CiBEYXRl
OiBXZWQsIDIwIEp1bCAyMDExIDE5OjE4OjE0ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNoYWRv
dzogdXBkYXRlIHBhbSByZWxhdGVkIGNvbmZpZ3VyZSBmaWxlcwpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3cuaW5jIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3NoYWRvdy9zaGFkb3cuaW5jCmluZGV4IGMxNTcxNWZjNzcuLjAzYzcwZmQyMTQgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93LmluYworKysgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvdy5pbmMKQEAgLTEyLDkgKzEyLDEwIEBAIERFUEVO
RFMgPSAidmlydHVhbC9jcnlwdCIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHVi
LmNvbS9zaGFkb3ctbWFpbnQvc2hhZG93L3JlbGVhc2VzIgogU1JDX1VSSSA9ICIke0dJVEhVQl9C
QVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vJHtCUH0udGFyLmd6IFwKLSAgICAgICAgICAgZmlsZTov
LzAwMDEtbGliLWNvcHlkaXItY29weV9lbnRyeS11c2UtdGVtcG9yYXJ5LXN0YXQtYnVmZmVyLnBh
dGNoIFwKICAgICAgICAgICAgJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAn
cGFtJywgJyR7UEFNX1NSQ19VUkl9JywgJycsIGQpfSBcCiAgICAgICAgICAgIGZpbGU6Ly91c2Vy
YWRkIFwKKyAgICAgICAgICAgZmlsZTovL2xvZ2luX2RlZnNfcGFtLnNlZCBcCisgICAgICAgICAg
IGZpbGU6Ly9zaGFkb3ctdXBkYXRlLXBhbS1jb25mLnBhdGNoIFwKICAgICAgICAgICAgIgogCiBT
UkNfVVJJOmFwcGVuZDpjbGFzcy10YXJnZXQgPSAiIFwKQEAgLTI1LDcgKzI2LDcgQEAgU1JDX1VS
STphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiBcCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUg
PSAiIFwKICAgICAgICAgICAgZmlsZTovL2NvbW1vbmlvLmMtZml4LXVuZXhwZWN0ZWQtb3Blbi1m
YWlsdXJlLWluLWNocm9vdC1lbnYucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMzc3ZmUwZDdjMWEwYWE1ZTM1MTRjMDhmZGY1ZGRjNzBjOWRjYmIzOTE2NzhjMjEz
NDQ0NWVkOTczMjZiY2MyNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiMzQ2ODZiODliMjc5ODg3
ZmZiZjFmMzMxMjg5MDJjY2MwZmExYTk5OGEzYWRkNDQyMTNiYjEyZDczODViMjE4IgogCiAjIEFk
ZGl0aW9uYWwgUG9saWN5IGZpbGVzIGZvciBQQU0KIFBBTV9TUkNfVVJJID0gImZpbGU6Ly9wYW0u
ZC9jaGZuIFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93
XzQuMTUuMC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93XzQuMTUuMS5i
YgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3NoYWRvdy9zaGFkb3dfNC4xNS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
c2hhZG93L3NoYWRvd180LjE1LjEuYmIKLS0gCjIuNDQuMAoK

--===============0427596546521092127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1876 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-195d73c49da4563ded921a90d053bc627297ef8c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:195d73c49da4563ded921a90d053bc627297ef8c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 454 Local 424 Mirrors 0 Missed 30 Current 361 (93% match, 96% complete)
Removing 6 stale sstate objects for arch core2-64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 391 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_package_setscene)
NOTE: Running setscene task 466 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package_setscene)
NOTE: Running setscene task 470 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 478 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_create_spdx_setscene)
NOTE: Running setscene task 524 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 656 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 658 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 665 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 668 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_255.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 670 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 673 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_255.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 679 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 680 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 686 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 688 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 691 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.16.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 693 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 697 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 699 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_255.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 700 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_package_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe systemd-1_255.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_package_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 742 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 745 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 748 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 752 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 757 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 761 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.12.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1173 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa)
NOTE: Running task 1243 of 2317 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa)
NOTE: Running task 1346 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_fetch)
NOTE: Running task 1360 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1416 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1464 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_fetch)
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa: Started
NOTE: Running task 1496 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_warn_musl)
NOTE: Running task 1497 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_write_config)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-native-4.15.1-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe procps-4.0.4-r0: task do_fetch: Started
NOTE: recipe systemd-1_255.4-r0: task do_fetch: Started
NOTE: recipe systemd-1_255.4-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_255.4-r0: task do_warn_musl: Succeeded
NOTE: recipe systemd-1_255.4-r0: task do_write_config: Started
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_fetch: Succeeded
NOTE: Running setscene task 767 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 771 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 773 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 774 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_255.4-r0: task do_write_config: Succeeded
NOTE: Running setscene task 775 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_package_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 776 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 777 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe systemd-1_255.4-r0: task do_fetch: Succeeded
NOTE: Running task 1624 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_fetch)
NOTE: recipe shadow-native-4.15.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1625 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_unpack)
NOTE: Running task 1626 of 2317 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_fetch)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_fetch: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 779 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_255.4-r0: task do_unpack: Started
NOTE: Running setscene task 785 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1636 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1637 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_unpack)
NOTE: recipe shadow-native-4.15.1-r0: task do_fetch: Started
NOTE: recipe shadow-4.15.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 787 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1638 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_unpack)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1c0125cf2439354bc5b9d2d86d0c011da603c250ea3e952ab1960cc5517f8e0e
NOTE: Running setscene task 790 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 792 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-native-4.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 1639 of 2317 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_unpack)
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 796 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_unpack: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-native-4.15.1-r0: task do_unpack: Started
NOTE: Running task 1684 of 2317 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1707 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_patch)
NOTE: recipe shadow-native-4.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-native-4.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1708 of 2317 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_patch)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_patch: Started
NOTE: recipe shadow-native-4.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1714 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_patch)
NOTE: recipe procps-4.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1715 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_patch)
NOTE: recipe shadow-native-4.15.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_patch: Started
NOTE: recipe procps-4.0.4-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_patch: Succeeded
NOTE: recipe shadow-native-4.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1717 of 2317 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe procps-4.0.4-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_package_setscene: Succeeded
NOTE: recipe shadow-native-4.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 799 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 800 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 802 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 804 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 808 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 810 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 813 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-native-4.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_255.4-r0: task do_unpack: Succeeded
NOTE: Running task 1719 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_255.4.bb:do_patch)
NOTE: Running task 1720 of 2317 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_configure)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 815 of 815 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-native-4.15.1-r0: task do_configure: Started
NOTE: recipe systemd-1_255.4-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe systemd-1_255.4-r0: task do_patch: Succeeded
NOTE: Running task 2009 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2259 of 2317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.15.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_patch: Failed
NOTE: recipe shadow-native-4.15.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2274 tasks of which 2249 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501091201.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501091201.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: shadow-4.15.1-r0 do_patch: Applying patch 'shadow-update-pam-conf.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shadow/4.15.1/shadow-4.15.1'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shadow/4.15.1/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch shadow-update-pam-conf.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/shadow/4.15.1/temp/log.do_patch.1295121
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_patch) failed with exit code '1'

--===============0427596546521092127==--

