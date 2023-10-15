Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDA6C04AB3
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:23 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.102674.1697399114612676122
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=F9paHNgv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cigCTcfy;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.29, mailfrom: 0101018b34df060a-93b1a40b-fb0c-4bb8-869d-3538123a6e74-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=u+b/W7wjEz7S0G7Gtjc+flYUf6v/kB4iwRaFO1mNbBQ=;
	b=F9paHNgv/oxzQp+S9AA9661qJTw8SDkUWA2dKe7Nhutf6Q+149L57gmSSdOW5j3j
	EoOHF8XiudRqaDlO4ftvxbgCIc6/3k4NyD3bEKVJSx9T1VT81+V6QMiHGcePEF+oAoN
	gvIhq9JVmEwF3P3lVJTMp7i4tWFirL7ndVhkfvdI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=u+b/W7wjEz7S0G7Gtjc+flYUf6v/kB4iwRaFO1mNbBQ=;
	b=cigCTcfyeuA9kgQs3y9W6ZnfBdMdB9MSpBZgBGNt0DMz02Oz9C1PXb67lVhR2xjQ
	5VfEsA6N/6KEhxorWQIov4IEV7YaqMHPh1Bz84UJoSK9J4SfOWbyCLYVXqqxO6vOHCQ
	5Dru/wIYNh211mJicFBnilahHBM84vDWQG2aHrK4=
Content-Type: multipart/mixed; boundary="===============5069287903940163843=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 1.0.1 SUCCEEDED
Message-ID: <0101018b34df060a-93b1a40b-fb0c-4bb8-869d-3538123a6e74-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189193

--===============5069287903940163843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *createrepo-c* to *1.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-1.0.0-1.0.1.patch
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
From 068b7dfbcb78c6af5eaec52513452f633481f23f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 09:01:40 +0000
Subject: [PATCH] createrepo-c: upgrade 1.0.0 -> 1.0.1

---
 ...s_groupfile-outside-WITH_LIBMODULEMD.patch | 46 -------------------
 ...erepo-c_1.0.0.bb => createrepo-c_1.0.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 48 deletions(-)
 delete mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-Move-cr_compress_groupfile-outside-WITH_LIBMODULEMD.patch
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.0.0.bb => createrepo-c_1.0.1.bb} (92%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Move-cr_compress_groupfile-outside-WITH_LIBMODULEMD.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Move-cr_compress_groupfile-outside-WITH_LIBMODULEMD.patch
deleted file mode 100644
index ea768e06e6..0000000000
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Move-cr_compress_groupfile-outside-WITH_LIBMODULEMD.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 5326969acc0c7e9e3cabca202154e4120c0d2c2f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 26 Sep 2023 14:52:11 -0700
-Subject: [PATCH] Move cr_compress_groupfile outside WITH_LIBMODULEMD
-
-This function is used in code which is not conditional under WITH_LIBMODULEMD
-therefore the declaration should also match its definition scope
-
-Fixes build issues flagged by clang
-
-src/createrepo_c.c:850:16: error: incompatible integer to pointer conversion initializing 'gchar *' (aka 'char *') with an
- expression of type 'int' [-Wint-conversion]
-|   850 |         gchar *compressed_path = cr_compress_groupfile(cmd_options->groupfile_fullpath, tmp_out_repo, compression);
-|       |                ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/createrepo_c/pull/387]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/metadata_internal.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/metadata_internal.h b/src/metadata_internal.h
-index 8ba0576..ecfbac2 100644
---- a/src/metadata_internal.h
-+++ b/src/metadata_internal.h
-@@ -52,14 +52,14 @@ cr_metadata_load_modulemd(ModulemdModuleIndex **moduleindex,
-  * @param dest_dir      Path to directory where the compressed groupfile should be stored.
-  * @return              Path to the new compressed groupfile. Has to be freed by the caller.
-  */
-+
-+#endif /* WITH_LIBMODULEMD */
-+
- gchar *
- cr_compress_groupfile(const char *groupfile,
-                       const char *dest_dir,
-                       cr_CompressionType compression);
- 
--
--#endif /* WITH_LIBMODULEMD */
--
- #ifdef __cplusplus
- }
- #endif
--- 
-2.42.0
-
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb
similarity index 92%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb
index f4e65492f8..44d9213bd4 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb
@@ -8,10 +8,9 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0001-include-rpm-rpmstring.h.patch \
            file://time64fix.patch \
-           file://0001-Move-cr_compress_groupfile-outside-WITH_LIBMODULEMD.patch \
            "
 
-SRCREV = "0cc13920991b2fb8f87fb9d352bd3394c2983289"
+SRCREV = "e7af838e04009cd2f848a00e1ea31cc42c8f3ae7"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============5069287903940163843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.1.0.0", added "/usr/lib/libcreaterepo_c.so.1.0.1"
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.1 changed symlink target from libcreaterepo_c.so.1.0.0 to libcreaterepo_c.so.1.0.1
  /usr/lib/libcreaterepo_c.so.1.0.0 moved to /usr/lib/libcreaterepo_c.so.1.0.1

--===============5069287903940163843==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-1.0.0-1.0.1.patch"

RnJvbSAwNjhiN2RmYmNiNzhjNmFmNWVhZWM1MjUxMzQ1MmY2MzM0ODFmMjNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMDk6MDE6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
cmVhdGVyZXBvLWM6IHVwZ3JhZGUgMS4wLjAgLT4gMS4wLjEKCi0tLQogLi4uc19ncm91cGZpbGUt
b3V0c2lkZS1XSVRIX0xJQk1PRFVMRU1ELnBhdGNoIHwgNDYgLS0tLS0tLS0tLS0tLS0tLS0tLQog
Li4uZXJlcG8tY18xLjAuMC5iYiA9PiBjcmVhdGVyZXBvLWNfMS4wLjEuYmJ9IHwgIDMgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQ4IGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1j
LzAwMDEtTW92ZS1jcl9jb21wcmVzc19ncm91cGZpbGUtb3V0c2lkZS1XSVRIX0xJQk1PRFVMRU1E
LnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy97Y3JlYXRl
cmVwby1jXzEuMC4wLmJiID0+IGNyZWF0ZXJlcG8tY18xLjAuMS5iYn0gKDkyJSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAx
LU1vdmUtY3JfY29tcHJlc3NfZ3JvdXBmaWxlLW91dHNpZGUtV0lUSF9MSUJNT0RVTEVNRC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEt
TW92ZS1jcl9jb21wcmVzc19ncm91cGZpbGUtb3V0c2lkZS1XSVRIX0xJQk1PRFVMRU1ELnBhdGNo
CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBlYTc2OGUwNmU2Li4wMDAwMDAwMDAwCi0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEt
TW92ZS1jcl9jb21wcmVzc19ncm91cGZpbGUtb3V0c2lkZS1XSVRIX0xJQk1PRFVMRU1ELnBhdGNo
CisrKyAvZGV2L251bGwKQEAgLTEsNDYgKzAsMCBAQAotRnJvbSA1MzI2OTY5YWNjMGM3ZTllM2Nh
YmNhMjAyMTU0ZTQxMjBjMGQyYzJmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLURhdGU6IFR1ZSwgMjYgU2VwIDIwMjMgMTQ6NTI6
MTEgLTA3MDAKLVN1YmplY3Q6IFtQQVRDSF0gTW92ZSBjcl9jb21wcmVzc19ncm91cGZpbGUgb3V0
c2lkZSBXSVRIX0xJQk1PRFVMRU1ECi0KLVRoaXMgZnVuY3Rpb24gaXMgdXNlZCBpbiBjb2RlIHdo
aWNoIGlzIG5vdCBjb25kaXRpb25hbCB1bmRlciBXSVRIX0xJQk1PRFVMRU1ECi10aGVyZWZvcmUg
dGhlIGRlY2xhcmF0aW9uIHNob3VsZCBhbHNvIG1hdGNoIGl0cyBkZWZpbml0aW9uIHNjb3BlCi0K
LUZpeGVzIGJ1aWxkIGlzc3VlcyBmbGFnZ2VkIGJ5IGNsYW5nCi0KLXNyYy9jcmVhdGVyZXBvX2Mu
Yzo4NTA6MTY6IGVycm9yOiBpbmNvbXBhdGlibGUgaW50ZWdlciB0byBwb2ludGVyIGNvbnZlcnNp
b24gaW5pdGlhbGl6aW5nICdnY2hhciAqJyAoYWthICdjaGFyIConKSB3aXRoIGFuCi0gZXhwcmVz
c2lvbiBvZiB0eXBlICdpbnQnIFstV2ludC1jb252ZXJzaW9uXQotfCAgIDg1MCB8ICAgICAgICAg
Z2NoYXIgKmNvbXByZXNzZWRfcGF0aCA9IGNyX2NvbXByZXNzX2dyb3VwZmlsZShjbWRfb3B0aW9u
cy0+Z3JvdXBmaWxlX2Z1bGxwYXRoLCB0bXBfb3V0X3JlcG8sIGNvbXByZXNzaW9uKTsKLXwgICAg
ICAgfCAgICAgICAgICAgICAgICBeICAgICAgICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn4KLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0aHViLmNvbS9y
cG0tc29mdHdhcmUtbWFuYWdlbWVudC9jcmVhdGVyZXBvX2MvcHVsbC8zODddCi1TaWduZWQtb2Zm
LWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gc3JjL21ldGFkYXRhX2lu
dGVybmFsLmggfCA2ICsrKy0tLQotIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9zcmMvbWV0YWRhdGFfaW50ZXJuYWwuaCBiL3Ny
Yy9tZXRhZGF0YV9pbnRlcm5hbC5oCi1pbmRleCA4YmEwNTc2Li5lY2ZiYWMyIDEwMDY0NAotLS0t
IGEvc3JjL21ldGFkYXRhX2ludGVybmFsLmgKLSsrKyBiL3NyYy9tZXRhZGF0YV9pbnRlcm5hbC5o
Ci1AQCAtNTIsMTQgKzUyLDE0IEBAIGNyX21ldGFkYXRhX2xvYWRfbW9kdWxlbWQoTW9kdWxlbWRN
b2R1bGVJbmRleCAqKm1vZHVsZWluZGV4LAotICAqIEBwYXJhbSBkZXN0X2RpciAgICAgIFBhdGgg
dG8gZGlyZWN0b3J5IHdoZXJlIHRoZSBjb21wcmVzc2VkIGdyb3VwZmlsZSBzaG91bGQgYmUgc3Rv
cmVkLgotICAqIEByZXR1cm4gICAgICAgICAgICAgIFBhdGggdG8gdGhlIG5ldyBjb21wcmVzc2Vk
IGdyb3VwZmlsZS4gSGFzIHRvIGJlIGZyZWVkIGJ5IHRoZSBjYWxsZXIuCi0gICovCi0rCi0rI2Vu
ZGlmIC8qIFdJVEhfTElCTU9EVUxFTUQgKi8KLSsKLSBnY2hhciAqCi0gY3JfY29tcHJlc3NfZ3Jv
dXBmaWxlKGNvbnN0IGNoYXIgKmdyb3VwZmlsZSwKLSAgICAgICAgICAgICAgICAgICAgICAgY29u
c3QgY2hhciAqZGVzdF9kaXIsCi0gICAgICAgICAgICAgICAgICAgICAgIGNyX0NvbXByZXNzaW9u
VHlwZSBjb21wcmVzc2lvbik7Ci0gCi0tCi0tI2VuZGlmIC8qIFdJVEhfTElCTU9EVUxFTUQgKi8K
LS0KLSAjaWZkZWYgX19jcGx1c3BsdXMKLSB9Ci0gI2VuZGlmCi0tLSAKLTIuNDIuMAotCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tY18x
LjAuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1j
XzEuMC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzEuMC4wLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tY18xLjAuMS5iYgppbmRl
eCBmNGU2NTQ5MmY4Li40NGQ5MjEzYmQ0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tY18xLjAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tY18xLjAuMS5iYgpAQCAtOCwxMCArOCw5
IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9ycG0tc29mdHdhcmUtbWFuYWdlbWVudC9j
cmVhdGVyZXBvX2M7YnJhbmNoPW1hc3RlcjtwCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLURvLW5v
dC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoIFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtaW5jbHVkZS1ycG0tcnBtc3RyaW5nLmgucGF0Y2ggXAogICAgICAg
ICAgICBmaWxlOi8vdGltZTY0Zml4LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtTW92
ZS1jcl9jb21wcmVzc19ncm91cGZpbGUtb3V0c2lkZS1XSVRIX0xJQk1PRFVMRU1ELnBhdGNoIFwK
ICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiMGNjMTM5MjA5OTFiMmZiOGY4N2ZiOWQzNTJiZDMz
OTRjMjk4MzI4OSIKK1NSQ1JFViA9ICJlN2FmODM4ZTA0MDA5Y2QyZjg0OGEwMGUxZWEzMWNjNDJj
OGYzYWU3IgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM5LjIKCg==

--===============5069287903940163843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1847 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1845 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-af2b74c6c3ed674226566aadd4d43827290a9a6a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:af2b74c6c3ed674226566aadd4d43827290a9a6a"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 104 Local 65 Mirrors 0 Missed 39 Current 767 (62% match, 95% complete)
Removing 2 stale sstate objects for arch core2-64...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 784 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 792 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 845 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 849 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 862 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_254.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_254.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1570 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa)
NOTE: Running task 1571 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_recipe_qa)
NOTE: recipe popt-1.19-r0: task do_recipe_qa: Started
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa: Started
NOTE: Running task 1884 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_recipe_qa)
NOTE: Running task 1925 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_recipe_qa)
NOTE: Running task 2060 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_collect_spdx_deps)
NOTE: Running task 2062 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_collect_spdx_deps)
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa: Started
NOTE: Running task 2091 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_recipe_qa: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_recipe_qa: Started
NOTE: Running task 2092 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 2093 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_fetch)
NOTE: recipe systemd-1_254.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2176 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_collect_spdx_deps)
NOTE: recipe curl-8.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe file-5.45-r0: task do_collect_spdx_deps: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: Running task 2263 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: recipe lua-5.4.6-r0: task do_fetch: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2264 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_fetch)
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: Running task 2265 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: recipe lua-5.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2266 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2267 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_unpack)
NOTE: Running task 2268 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.45-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2269 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_create_spdx)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/systemd/254.4/temp/log.do_packagedata_setscene.3564136
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_fetch: Started
NOTE: recipe lua-5.4.6-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running setscene task 863 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_package_setscene)
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 2270 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.4.0-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2271 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_patch)
NOTE: Running task 2272 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: Running task 2273 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_unpack)
NOTE: Running task 2274 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx)
NOTE: Running task 2275 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2276 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_create_spdx)
NOTE: Running task 2277 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_collect_spdx_deps)
NOTE: Running task 2278 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_unpack: Started
NOTE: recipe lua-5.4.6-r0: task do_patch: Started
NOTE: recipe file-5.45-r0: task do_create_spdx: Started
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Started
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_patch: Succeeded
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2279 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 2280 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2281 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure)
NOTE: Running task 2282 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe file-5.45-r0: task do_create_spdx: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2283 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_patch)
NOTE: recipe systemd-1_254.4-r0: task do_package_setscene: Started
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe lua-5.4.6-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_patch: Started
NOTE: Running task 2284 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: recipe lua-5.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2285 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure_ptest_base)
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Succeeded
NOTE: Running task 2286 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2287 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile)
NOTE: recipe createrepo-c-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2288 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2289 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_generate_toolchain_file)
NOTE: Running task 2290 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_populate_lic)
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.6-r0: task do_compile: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2291 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_create_spdx)
NOTE: recipe createrepo-c-1.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Running task 2292 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 868 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 869 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 870 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running task 2300 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe lua-5.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2304 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile_ptest_base)
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_254.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Started
NOTE: recipe systemd-1_254.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2310 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe lua-5.4.6-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2324 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2325 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.6-r0: task do_install: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 2326 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2327 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_populate_sysroot)
NOTE: Running task 2328 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 10a3d096213e68b46dda39376084094e6d9882114e0faf328ef664c8af422828
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.6-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2346 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe curl-8.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2347 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 41de79a8e5aa4adff5c84d9689e46f868ca74cfd324d8705ad647ed0c045a6a1
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 07189b57492dcf04a216293f7082402a470c2453b63e0bd4c36977ccb9d72336 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': 'd4f2e923ce9f32878bf5bbf74b237db363cb2ad339c737483fd9d226c9d1eefd', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '07189b57492dcf04a216293f7082402a470c2453b63e0bd4c36977ccb9d72336'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed d4f2e923ce9f32878bf5bbf74b237db363cb2ad339c737483fd9d226c9d1eefd -> 07189b57492dcf04a216293f7082402a470c2453b63e0bd4c36977ccb9d72336 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 2349 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Started
NOTE: recipe systemd-1_254.4-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2355 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Succeeded
NOTE: Running task 2356 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_collect_spdx_deps)
NOTE: recipe systemd-1_254.4-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2362 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_create_spdx)
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_package: Succeeded
NOTE: Running task 2363 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_packagedata)
NOTE: recipe lua-5.4.6-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2364 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2365 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2366 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2367 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2368 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2369 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2370 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 2371 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2372 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2373 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_configure)
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 2374 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2375 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx: Succeeded
NOTE: Running task 2376 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_collect_spdx_deps)
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_compile)
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Succeeded
NOTE: Running task 2378 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_install)
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Succeeded
NOTE: Running task 2379 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_package)
NOTE: Running task 2380 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2381 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2382 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_configure)
NOTE: recipe createrepo-c-1.0.1-r0: task do_configure: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2383 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_compile)
NOTE: recipe createrepo-c-1.0.1-r0: task do_compile: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_install)
NOTE: recipe createrepo-c-1.0.1-r0: task do_install: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-1.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Succeeded
NOTE: Running task 2386 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2387 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_package)
NOTE: Running task 2388 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_create_spdx)
NOTE: recipe createrepo-c-1.0.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2389 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_collect_spdx_deps)
NOTE: recipe createrepo-c-1.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 2390 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_packagedata)
NOTE: recipe createrepo-c-1.0.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2391 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_create_spdx)
NOTE: Running task 2392 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_package_write_rpm)
NOTE: Running task 2393 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_package_qa)
NOTE: recipe createrepo-c-1.0.1-r0: task do_create_spdx: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2394 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_create_runtime_spdx)
NOTE: recipe createrepo-c-1.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2395 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2395 tasks of which 2308 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 69 ERROR messages, returning a non-zero exit code.
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-src went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dbg went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-staticdev went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dev went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-doc went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-gui went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-vconsole-setup went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-initramfs went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-analyze went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-kernel-install went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-rpm-macros went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-binfmt went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-zsh-completion went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-container went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-gatewayd went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-upload went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-remote went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-extra-utils went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-udev-rules went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd-shared went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev-hwdb went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-bash-completion went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be+latin went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-bg went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ca went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-cs went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-da went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-de went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-el went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-es went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-et went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-eu went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fi went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fr went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-gl went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hr went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hu went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-id went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-it went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ja went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ka went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-kab went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ko went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-lt went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-nl went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pa went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pl went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt-br went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ro went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ru went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-si went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sk went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sr went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sv went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-tr went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-uk went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-cn went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-tw went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-myhostname went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-mymachines went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-resolve went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-systemd went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libudev went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5069287903940163843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 65 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-af2b74c6c3ed674226566aadd4d43827290a9a6a"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:af2b74c6c3ed674226566aadd4d43827290a9a6a"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 106 Local 67 Mirrors 0 Missed 39 Current 765 (63% match, 95% complete)
Removing 2 stale sstate objects for arch mips32r2...done.
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 782 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 790 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 843 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 847 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 862 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1570 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa)
NOTE: Running task 1571 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_recipe_qa)
NOTE: recipe systemd-1_254.4-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_254.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1884 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_recipe_qa)
NOTE: recipe popt-1.19-r0: task do_recipe_qa: Started
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa: Started
NOTE: Running task 1923 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_recipe_qa)
NOTE: Running task 2060 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_collect_spdx_deps)
NOTE: Running task 2062 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_collect_spdx_deps)
NOTE: Running task 2089 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_recipe_qa: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa: Started
NOTE: Running task 2112 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_recipe_qa: Started
NOTE: Running task 2150 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_fetch)
NOTE: Running task 2176 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_collect_spdx_deps)
NOTE: recipe curl-8.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe file-5.45-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2263 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: recipe lua-5.4.6-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2264 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_fetch)
NOTE: recipe lua-5.4.6-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: Running task 2265 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_unpack)
NOTE: recipe libarchive-3.7.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2266 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2267 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 2268 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_254.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2269 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_create_spdx)
NOTE: recipe file-5.45-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2270 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx)
NOTE: Running task 2271 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_create_spdx)
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_fetch: Started
NOTE: recipe lua-5.4.6-r0: task do_unpack: Started
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2272 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_create_spdx)
NOTE: recipe curl-8.4.0-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe file-5.45-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2273 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe createrepo-c-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 2274 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_collect_spdx_deps)
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Started
NOTE: Running task 2275 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_patch)
NOTE: Running task 2276 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: Running task 2277 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_unpack)
NOTE: Running task 2278 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_collect_spdx_deps)
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/systemd/254.4/temp/log.do_packagedata_setscene.3819533
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 863 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_package_setscene)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Started
NOTE: recipe lua-5.4.6-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2279 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2280 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe file-5.45-r0: task do_create_spdx: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Succeeded
NOTE: Running task 2281 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_collect_spdx_deps)
NOTE: recipe createrepo-c-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2282 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_patch)
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2283 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure)
NOTE: Running task 2284 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 2285 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: recipe createrepo-c-1.0.1-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe lua-5.4.6-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2286 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2287 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure_ptest_base)
NOTE: recipe systemd-1_254.4-r0: task do_package_setscene: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2288 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2289 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_generate_toolchain_file)
NOTE: Running task 2290 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_populate_lic)
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2291 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile)
NOTE: recipe createrepo-c-1.0.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_compile: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Running task 2292 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2293 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile_ptest_base)
NOTE: recipe systemd-1_254.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 868 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 869 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 870 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running task 2301 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2305 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe systemd-1_254.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe systemd-1_254.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_install: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe lua-5.4.6-r0: task do_install: Succeeded
NOTE: Running task 2324 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install_ptest_base)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2325 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2326 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2327 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_populate_sysroot)
NOTE: Running task 2328 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_package)
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.6-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 07057cc95e39daad70e97eff764c368302272559801702d46dd8e82b5abfe46e
NOTE: recipe curl-8.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2346 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2347 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2348 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_create_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 92d337ef06d6815edfae603f3065f50a80d7a4e3b16f348bd050c3d4b458d813
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 5eafe398529f24cafd57d29cce72ed4bb4c77f1d5c02a0210a6abeddbcfb7ec8 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '4601a16f8ce6b794ca6b9b76bd6a6790ed1c916d2fb0f27a9312853a0a2fa26a', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '5eafe398529f24cafd57d29cce72ed4bb4c77f1d5c02a0210a6abeddbcfb7ec8'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 4601a16f8ce6b794ca6b9b76bd6a6790ed1c916d2fb0f27a9312853a0a2fa26a -> 5eafe398529f24cafd57d29cce72ed4bb4c77f1d5c02a0210a6abeddbcfb7ec8 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 2350 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_packagedata)
NOTE: recipe systemd-1_254.4-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Succeeded
NOTE: Running task 2356 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_collect_spdx_deps)
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2357 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_create_spdx)
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Started
NOTE: recipe systemd-1_254.4-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_package: Succeeded
NOTE: Running task 2363 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_packagedata)
NOTE: recipe lua-5.4.6-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2364 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2365 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2366 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2367 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2368 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2369 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2370 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 2371 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2372 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2373 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_configure)
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 2374 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2375 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx: Succeeded
NOTE: Running task 2376 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_collect_spdx_deps)
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_compile)
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Succeeded
NOTE: Running task 2378 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_install)
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Succeeded
NOTE: Running task 2379 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_package)
NOTE: Running task 2380 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2381 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2382 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_configure)
NOTE: recipe createrepo-c-1.0.1-r0: task do_configure: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2383 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_compile)
NOTE: recipe createrepo-c-1.0.1-r0: task do_compile: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_install)
NOTE: recipe createrepo-c-1.0.1-r0: task do_install: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-1.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Succeeded
NOTE: Running task 2386 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2387 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_package)
NOTE: Running task 2388 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_create_spdx)
NOTE: recipe createrepo-c-1.0.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2389 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_collect_spdx_deps)
NOTE: recipe createrepo-c-1.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 2390 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_packagedata)
NOTE: recipe createrepo-c-1.0.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2391 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_create_spdx)
NOTE: Running task 2392 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_package_write_rpm)
NOTE: Running task 2393 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_package_qa)
NOTE: recipe createrepo-c-1.0.1-r0: task do_create_spdx: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2394 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_create_runtime_spdx)
NOTE: recipe createrepo-c-1.0.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2395 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2395 tasks of which 2308 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 10 seconds

Summary: There were 69 ERROR messages, returning a non-zero exit code.
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-src went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dbg went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-staticdev went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dev went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-doc went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-gui went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-vconsole-setup went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-initramfs went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-analyze went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-kernel-install went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-rpm-macros went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-binfmt went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-zsh-completion went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-container went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-gatewayd went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-upload went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-remote went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-extra-utils went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-udev-rules went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd-shared went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev-hwdb went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-bash-completion went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be+latin went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-bg went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ca went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-cs went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-da went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-de went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-el went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-es went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-et went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-eu went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fi went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fr went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-gl went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hr went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hu went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-id went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-it went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ja went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ka went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-kab went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ko went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-lt went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-nl went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pa went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pl went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt-br went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ro went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ru went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-si went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sk went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sr went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sv went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-tr went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-uk went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-cn went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-tw went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-myhostname went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-mymachines went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-resolve went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-systemd went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libudev went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5069287903940163843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "1.0.0" to "1.0.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1277580 to 1277988 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.1.0.0", added "/usr/lib/.debug/libcreaterepo_c.so.1.0.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "1.0.0" to "1.0.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGSIZE changed from 146430 to 146429 (-0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "1.0.0" to "1.0.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "1.0.0" to "1.0.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "1.0.0" to "1.0.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1279641 to 1280187 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PV changed from "1.0.0" to "1.0.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "1.0.0" to "1.0.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGSIZE changed from 547349 to 551542 (+1%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.1.0.0", added "/usr/lib/libcreaterepo_c.so.1.0.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PV changed from "1.0.0" to "1.0.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/createrepo-c: SRC_URI changed from "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch file://0001-include-rpm-rpmstring.h.patch file://time64fix.patch file://0001-Move-cr_compress_groupfile-outside-WITH_LIBMODULEMD.patch" to "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch file://0001-include-rpm-rpmstring.h.patch file://time64fix.patch"
packages/core2-32-poky-linux/createrepo-c: PV changed from "1.0.0" to "1.0.1"
packages/core2-32-poky-linux/createrepo-c: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.1 changed symlink target from libcreaterepo_c.so.1.0.0 to libcreaterepo_c.so.1.0.1
  /usr/lib/libcreaterepo_c.so.1.0.0 moved to /usr/lib/libcreaterepo_c.so.1.0.1

--===============5069287903940163843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 71 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-af2b74c6c3ed674226566aadd4d43827290a9a6a"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:af2b74c6c3ed674226566aadd4d43827290a9a6a"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 104 Local 65 Mirrors 0 Missed 39 Current 767 (62% match, 95% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
Removing 2 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 784 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 792 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-3.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 845 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 853 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 862 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1570 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa)
NOTE: Running task 1571 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_recipe_qa)
NOTE: recipe systemd-1_254.4-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_254.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa: Started
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa: Started
NOTE: Running task 1884 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_recipe_qa)
NOTE: Running task 1925 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_recipe_qa)
NOTE: Running task 2060 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_collect_spdx_deps)
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa: Started
NOTE: Running task 2062 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_collect_spdx_deps)
NOTE: recipe createrepo-c-1.0.1-r0: task do_recipe_qa: Started
NOTE: Running task 2091 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2138 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 2175 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe file-5.45-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2262 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_fetch)
NOTE: recipe systemd-1_254.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: Running task 2263 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 2264 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2265 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_fetch)
NOTE: Running task 2266 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: recipe libarchive-3.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe file-5.45-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_fetch: Started
NOTE: Running task 2267 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_create_spdx)
NOTE: Running task 2268 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: Running task 2269 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx)
NOTE: recipe createrepo-c-1.0.1-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Started
NOTE: Running task 2270 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_unpack)
NOTE: Running task 2271 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_prepare_recipe_sysroot)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/systemd/254.4/temp/log.do_packagedata_setscene.3936236
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_fetch: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 863 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_package_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Started
NOTE: recipe libarchive-3.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2272 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: recipe file-5.45-r0: task do_create_spdx: Started
NOTE: recipe curl-8.4.0-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_unpack: Started
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2273 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2274 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_unpack)
NOTE: Running task 2275 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_create_spdx)
NOTE: Running task 2276 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2277 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_patch)
NOTE: Running task 2278 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_patch: Started
NOTE: Running task 2279 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2280 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe file-5.45-r0: task do_create_spdx: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_package_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2281 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2282 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_configure: Started
NOTE: Running task 2283 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: recipe createrepo-c-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2284 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Started
NOTE: recipe lua-5.4.6-r0: task do_configure: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_patch: Started
NOTE: Running task 2285 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure_ptest_base)
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Started
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2286 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile)
NOTE: recipe createrepo-c-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Succeeded
NOTE: Running task 2287 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2288 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_generate_toolchain_file)
NOTE: Running task 2289 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_populate_lic)
NOTE: Running task 2290 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_compile: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2291 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_create_spdx)
NOTE: recipe createrepo-c-1.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Running task 2292 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2293 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile_ptest_base)
NOTE: recipe systemd-1_254.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 868 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 869 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 870 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running task 2301 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: Running task 2305 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe systemd-1_254.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe systemd-1_254.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_install: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe lua-5.4.6-r0: task do_install: Succeeded
NOTE: Running task 2324 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install_ptest_base)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2325 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2326 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2327 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_populate_sysroot)
NOTE: Running task 2328 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_package)
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.6-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 34fff22e2bc2c145474f300a720d34bab0464b25d267c599ce9d66c85fe70567
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2346 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 200bb33903ec133f456f3590c1839eabe64198ee0b7808a12285742dded5600b
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 08375d3cd6e6a35039752ee61def5fad96f6d5b858f43e701bd9ab8efec3b830 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': 'f1f610955f33b992fb969b8feba3b51f3b91be734904af6f9b7f18a17347c38a', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '08375d3cd6e6a35039752ee61def5fad96f6d5b858f43e701bd9ab8efec3b830'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed f1f610955f33b992fb969b8feba3b51f3b91be734904af6f9b7f18a17347c38a -> 08375d3cd6e6a35039752ee61def5fad96f6d5b858f43e701bd9ab8efec3b830 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 2348 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_packagedata)
NOTE: recipe curl-8.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2354 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_collect_spdx_deps)
NOTE: recipe systemd-1_254.4-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2355 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Started
NOTE: recipe systemd-1_254.4-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Succeeded
NOTE: Running task 2361 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_collect_spdx_deps)
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2362 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_create_spdx)
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_package: Succeeded
NOTE: Running task 2363 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_packagedata)
NOTE: recipe lua-5.4.6-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2364 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2365 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2366 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2367 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2368 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2369 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2370 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 2371 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2372 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2373 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_configure)
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 2374 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2375 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx: Succeeded
NOTE: Running task 2376 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_collect_spdx_deps)
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_compile)
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Succeeded
NOTE: Running task 2378 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_install)
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Succeeded
NOTE: Running task 2379 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_package)
NOTE: Running task 2380 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2381 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2382 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_configure)
NOTE: recipe createrepo-c-1.0.1-r0: task do_configure: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2383 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_compile)
NOTE: recipe createrepo-c-1.0.1-r0: task do_compile: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_install)
NOTE: recipe createrepo-c-1.0.1-r0: task do_install: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-1.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Succeeded
NOTE: Running task 2386 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2387 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_package)
NOTE: Running task 2388 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_create_spdx)
NOTE: recipe createrepo-c-1.0.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2389 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_collect_spdx_deps)
NOTE: recipe createrepo-c-1.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 2390 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_packagedata)
NOTE: recipe createrepo-c-1.0.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2391 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_create_spdx)
NOTE: Running task 2392 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_package_write_rpm)
NOTE: Running task 2393 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_package_qa)
NOTE: recipe createrepo-c-1.0.1-r0: task do_create_spdx: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2394 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_create_runtime_spdx)
NOTE: recipe createrepo-c-1.0.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2395 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2395 tasks of which 2308 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 69 ERROR messages, returning a non-zero exit code.
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-src went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dbg went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-staticdev went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dev went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-doc went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-gui went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-vconsole-setup went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-initramfs went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-analyze went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-kernel-install went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-rpm-macros went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-binfmt went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-zsh-completion went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-container went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-gatewayd went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-upload went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-remote went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-extra-utils went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-udev-rules went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd-shared went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev-hwdb went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-bash-completion went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be+latin went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-bg went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ca went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-cs went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-da went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-de went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-el went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-es went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-et went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-eu went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fi went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fr went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-gl went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hr went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hu went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-id went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-it went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ja went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ka went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-kab went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ko went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-lt went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-nl went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pa went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pl went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt-br went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ro went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ru went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-si went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sk went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sr went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sv went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-tr went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-uk went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-cn went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-tw went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-myhostname went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-mymachines went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-resolve went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-systemd went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libudev went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5069287903940163843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 55 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-af2b74c6c3ed674226566aadd4d43827290a9a6a"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:af2b74c6c3ed674226566aadd4d43827290a9a6a"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 104 Local 65 Mirrors 0 Missed 39 Current 767 (62% match, 95% complete)
Removing 2 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 784 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 792 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-3.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 845 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 849 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1542 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa)
NOTE: Running task 1543 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_recipe_qa)
NOTE: recipe libidn2-2.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_packagedata_setscene)
NOTE: recipe popt-1.19-r0: task do_recipe_qa: Started
NOTE: Running task 1880 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_recipe_qa)
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa: Started
NOTE: Running task 1921 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_recipe_qa)
NOTE: Running task 2056 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_collect_spdx_deps)
NOTE: Running task 2058 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_collect_spdx_deps)
NOTE: Running task 2087 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_collect_spdx_deps)
NOTE: recipe systemd-1_254.4-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa: Started
NOTE: Running task 2170 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_recipe_qa: Started
NOTE: Running task 2187 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_fetch)
NOTE: recipe popt-1.19-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2258 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: recipe curl-8.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe file-5.45-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Started
NOTE: recipe libarchive-3.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.6-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2259 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_fetch)
NOTE: Running task 2260 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe lua-5.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2261 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_unpack)
NOTE: Running task 2262 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: Running task 2263 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 2264 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.45-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running setscene task 862 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 2269 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx)
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_fetch: Started
NOTE: recipe curl-8.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_unpack: Started
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: Running task 2270 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2271 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_create_spdx)
NOTE: recipe createrepo-c-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2272 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 2273 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_patch)
NOTE: Running task 2274 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: Running task 2275 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_unpack)
NOTE: Running task 2276 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_create_spdx)
NOTE: Running task 2277 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_collect_spdx_deps)
NOTE: Running task 2278 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_collect_spdx_deps)
NOTE: recipe file-5.45-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe lua-5.4.6-r0: task do_patch: Started
NOTE: recipe curl-8.4.0-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Started
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe lua-5.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2279 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2280 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/systemd/254.4/temp/log.do_packagedata_setscene.3680569
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 863 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_package_setscene)
NOTE: recipe popt-1.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-1_254.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2281 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure)
NOTE: recipe createrepo-c-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2282 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2283 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe file-5.45-r0: task do_create_spdx: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_patch: Started
NOTE: Running task 2284 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe lua-5.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2285 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_configure_ptest_base)
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Started
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2286 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2287 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_generate_toolchain_file)
NOTE: Running task 2288 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_populate_lic)
NOTE: recipe lua-5.4.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2289 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile)
NOTE: recipe createrepo-c-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx: Succeeded
NOTE: Running task 2290 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_collect_spdx_deps)
NOTE: recipe lua-5.4.6-r0: task do_compile: Started
NOTE: recipe systemd-1_254.4-r0: task do_package_setscene: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2291 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_create_spdx)
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Running task 2292 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2293 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.2-r0: task do_create_spdx: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Started
NOTE: recipe systemd-1_254.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 868 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 869 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 870 of 871 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running task 2301 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe lua-5.4.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2305 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe systemd-1_254.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_install: Started
NOTE: recipe systemd-1_254.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe lua-5.4.6-r0: task do_install: Succeeded
NOTE: Running task 2324 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_install_ptest_base)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2325 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2326 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe lua-5.4.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2327 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_populate_sysroot)
NOTE: Running task 2328 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_package)
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.6-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c4118ecc92388c0870c75e9c9b9555189e2e26c4cf37e38de1ed2d65249bd5d8
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2346 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 2572f28bd6d6ab3b8d5d65dea143291e7936867d7b6c5b21c4c3d1e3b7a8e7fe
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 6d53d42ebbc44e567dc1932397c0948a936e601489a7ba65d220495c51103ac8 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '6c0efacc054ed327723b05d1605ace2bf74419c55845c405e50899fd5326fc98', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6d53d42ebbc44e567dc1932397c0948a936e601489a7ba65d220495c51103ac8'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 6c0efacc054ed327723b05d1605ace2bf74419c55845c405e50899fd5326fc98 -> 6d53d42ebbc44e567dc1932397c0948a936e601489a7ba65d220495c51103ac8 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 2348 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.4.bb:do_packagedata)
NOTE: recipe systemd-1_254.4-r0: task do_packagedata: Started
NOTE: recipe systemd-1_254.4-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_package: Succeeded
NOTE: Running task 2359 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_packagedata)
NOTE: recipe lua-5.4.6-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2360 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.6.bb:do_create_spdx)
NOTE: recipe lua-5.4.6-r0: task do_create_spdx: Started
NOTE: recipe lua-5.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2361 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2362 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe curl-8.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2363 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_collect_spdx_deps)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2364 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Succeeded
NOTE: Running task 2365 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_collect_spdx_deps)
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2366 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2367 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2368 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2369 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2370 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 2371 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2372 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2373 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_configure)
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 2374 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2375 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx: Succeeded
NOTE: Running task 2376 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_collect_spdx_deps)
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_compile)
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Succeeded
NOTE: Running task 2378 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_install)
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Succeeded
NOTE: Running task 2379 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_package)
NOTE: Running task 2380 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2381 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2382 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_configure)
NOTE: recipe createrepo-c-1.0.1-r0: task do_configure: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2383 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_compile)
NOTE: recipe createrepo-c-1.0.1-r0: task do_compile: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_install)
NOTE: recipe createrepo-c-1.0.1-r0: task do_install: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-1.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Succeeded
NOTE: Running task 2386 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2387 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_package)
NOTE: Running task 2388 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_create_spdx)
NOTE: recipe createrepo-c-1.0.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2389 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_collect_spdx_deps)
NOTE: recipe createrepo-c-1.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 2390 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_packagedata)
NOTE: recipe createrepo-c-1.0.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2391 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_create_spdx)
NOTE: Running task 2392 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_package_write_rpm)
NOTE: Running task 2393 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_package_qa)
NOTE: recipe createrepo-c-1.0.1-r0: task do_create_spdx: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2394 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_create_runtime_spdx)
NOTE: recipe createrepo-c-1.0.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe createrepo-c-1.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe createrepo-c-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2395 of 2395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2395 tasks of which 2308 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 69 ERROR messages, returning a non-zero exit code.
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-src went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dbg went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-staticdev went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-dev went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-doc went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-gui went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-vconsole-setup went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-initramfs went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-analyze went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-kernel-install went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-rpm-macros went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-binfmt went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-zsh-completion went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-container went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-gatewayd went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-upload went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-journal-remote went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-extra-utils went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-udev-rules went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd-shared went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package udev-hwdb went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-bash-completion went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-be+latin went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-bg went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ca went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-cs went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-da went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-de went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-el went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-es went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-et went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-eu went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fi went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-fr went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-gl went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hr went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-hu went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-id went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-it went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ja went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ka went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-kab went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ko went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-lt went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-nl went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pa went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pl went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-pt-br went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ro went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-ru went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-si went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sk went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sr went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-sv went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-tr went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-uk went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-cn went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package systemd-locale-zh-tw went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-myhostname went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-mymachines went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-resolve went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libnss-systemd went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libsystemd went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: QA Issue: Package version for package libudev went backwards which would break package feeds (from 1:254.5-r0 to 1:254.4-r0) [version-going-backwards]
ERROR: systemd-1_254.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5069287903940163843==--

