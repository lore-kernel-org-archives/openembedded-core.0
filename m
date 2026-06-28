Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C5CC43602
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 05:32:30 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67985.1782624739957984178
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 22:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XEhl504b;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nG5H0GcN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019f0cb6de80-da96257f-4952-47cb-9760-5c1238656d9e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782624739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cUoybt9+NYixEcNw7+cXA2I7TfOIn4CP87cZM394UXo=;
	b=XEhl504bTiC1/XQaLtjLYOZm7mJQq8XQnXqRsTRcO8jS7AnHqXoKfkdCzVa7lLci
	vozBJzoeSpYocTMcnaBEOmKch56XGpvt0oIai0KdSdcdK3gjL1CA17FWtDnn5jFsI2g
	TEfcjLcOl4dXnC0ImXwVKRdWGolqtngyQ88/mntQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782624739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cUoybt9+NYixEcNw7+cXA2I7TfOIn4CP87cZM394UXo=;
	b=nG5H0GcNHj2W0vVmhorgsF49v8uJ4UPRu9mHh+Hg+hmXawWMZckpKWszos6+weP6
	o8VI2VDWEd3Uu/ENYp6olY4wvCU1L50pawaxhzziiuXfxcq5aDCKiv7ZXFJoLl+0gFo
	/tFTpSpJF6sWCXaTzyl3JV8yeQotguEaeOR1rkqA=
Content-Type: multipart/mixed; boundary="===============4194859410857668169=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] json-c: upgrading to 0.19 SUCCEEDED
Message-ID: <0101019f0cb6de80-da96257f-4952-47cb-9760-5c1238656d9e-000000@us-west-2.amazonses.com>
Date: Sun, 28 Jun 2026 05:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.28-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 05:32:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239703

--===============4194859410857668169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *json-c* to *0.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-json-c-upgrade-0.18-0.19.patch
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
From d307b8441ada51c63e82f53078b74d48aade1109 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 28 Jun 2026 05:19:26 +0000
Subject: [PATCH] json-c: upgrade 0.18 -> 0.19

---
 meta/recipes-devtools/json-c/{json-c_0.18.bb => json-c_0.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/json-c/{json-c_0.18.bb => json-c_0.19.bb} (93%)

diff --git a/meta/recipes-devtools/json-c/json-c_0.18.bb b/meta/recipes-devtools/json-c/json-c_0.19.bb
similarity index 93%
rename from meta/recipes-devtools/json-c/json-c_0.18.bb
rename to meta/recipes-devtools/json-c/json-c_0.19.bb
index c112aacf4b..ee2c886580 100644
--- a/meta/recipes-devtools/json-c/json-c_0.18.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.19.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "876ab046479166b869afc6896d288183bbc0e5843f141200c677b3e8dfb11724"
+SRC_URI[sha256sum] = "37ad0249902e301bd9052bf712e511fcc6acff4ecaad4b5900aad9ce564e26de"
 
 # NVD uses full tag name including date
 CVE_VERSION = "0.18-20240915"
-- 
2.47.1


--===============4194859410857668169==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-json-c-upgrade-0.18-0.19.patch"

RnJvbSBkMzA3Yjg0NDFhZGE1MWM2M2U4MmY1MzA3OGI3NGQ0OGFhZGUxMTA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMjggSnVuIDIwMjYgMDU6MTk6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBq
c29uLWM6IHVwZ3JhZGUgMC4xOCAtPiAwLjE5CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9q
c29uLWMve2pzb24tY18wLjE4LmJiID0+IGpzb24tY18wLjE5LmJifSB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9qc29uLWMve2pzb24tY18wLjE4LmJiID0+IGpzb24tY18wLjE5LmJifSAoOTMl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9qc29uLWMvanNvbi1jXzAuMTgu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvanNvbi1jL2pzb24tY18wLjE5LmJiCnNpbWlsYXJp
dHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9qc29uLWMvanNv
bi1jXzAuMTguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9qc29uLWMvanNvbi1j
XzAuMTkuYmIKaW5kZXggYzExMmFhY2Y0Yi4uZWUyYzg4NjU4MCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2pzb24tYy9qc29uLWNfMC4xOC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvanNvbi1jL2pzb24tY18wLjE5LmJiCkBAIC05LDcgKzksNyBAQCBMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1kZTU0YjYwZmJiYzM1MTIzYmExOTNmZWE4ZWUy
MTZmMiIKIFNSQ19VUkkgPSAiaHR0cHM6Ly9zMy5hbWF6b25hd3MuY29tL2pzb24tY19yZWxlYXNl
cy9yZWxlYXNlcy8ke0JQfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwK
ICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg3NmFiMDQ2NDc5MTY2Yjg2OWFm
YzY4OTZkMjg4MTgzYmJjMGU1ODQzZjE0MTIwMGM2NzdiM2U4ZGZiMTE3MjQiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiMzdhZDAyNDk5MDJlMzAxYmQ5MDUyYmY3MTJlNTExZmNjNmFjZmY0ZWNhYWQ0
YjU5MDBhYWQ5Y2U1NjRlMjZkZSIKIAogIyBOVkQgdXNlcyBmdWxsIHRhZyBuYW1lIGluY2x1ZGlu
ZyBkYXRlCiBDVkVfVkVSU0lPTiA9ICIwLjE4LTIwMjQwOTE1IgotLSAKMi40Ny4xCgo=

--===============4194859410857668169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/json-c/json-c-dbg: FILELIST: removed "/usr/lib/.debug/libjson-c.so.5.4.0", added "/usr/lib/json-c/ptest/tests/.debug/test_safe_json_pointer_set /usr/lib/json-c/ptest/tests/.debug/test_deep_nesting /usr/lib/.debug/libjson-c.so.5.5.0"
packages/x86-64-v3-poky-linux/json-c/json-c-dbg: PKGSIZE changed from 875360 to 952288 (+9%)
packages/x86-64-v3-poky-linux/json-c/json-c-dbg: PV changed from "0.18" to "0.19"
packages/x86-64-v3-poky-linux/json-c/json-c-dbg: PKGV changed from 0.18 [default] to 0.19 [default]
packages/x86-64-v3-poky-linux/json-c/json-c-dev: PKGSIZE changed from 112240 to 118243 (+5%)
packages/x86-64-v3-poky-linux/json-c/json-c-dev: PV changed from "0.18" to "0.19"
packages/x86-64-v3-poky-linux/json-c/json-c-dev: PKGV changed from 0.18 [default] to 0.19 [default]
packages/x86-64-v3-poky-linux/json-c/json-c-doc: PV changed from "0.18" to "0.19"
packages/x86-64-v3-poky-linux/json-c/json-c-doc: PKGV changed from 0.18 [default] to 0.19 [default]
packages/x86-64-v3-poky-linux/json-c/json-c-locale: PV changed from "0.18" to "0.19"
packages/x86-64-v3-poky-linux/json-c/json-c-locale: PKGV changed from 0.18 [default] to 0.19 [default]
packages/x86-64-v3-poky-linux/json-c/json-c-ptest: FILELIST: added "/usr/lib/json-c/ptest/tests/test_deep_nesting.expected /usr/lib/json-c/ptest/tests/test_json_parse_cli.test /usr/lib/json-c/ptest/tests/test_safe_json_pointer_set.expected /usr/lib/json-c/ptest/tests/test_deep_nesting.test /usr/lib/json-c/ptest/tests/test_json_parse_cli.expected /usr/lib/json-c/ptest/tests/test_safe_json_pointer_set.test /usr/lib/json-c/ptest/tests/test_safe_json_pointer_set /usr/lib/json-c/ptest/tests/test_deep_nesting"
packages/x86-64-v3-poky-linux/json-c/json-c-ptest: PKGSIZE changed from 576598 to 624823 (+8%)
packages/x86-64-v3-poky-linux/json-c/json-c-ptest: PV changed from "0.18" to "0.19"
packages/x86-64-v3-poky-linux/json-c/json-c-ptest: PKGV changed from 0.18 [default] to 0.19 [default]
packages/x86-64-v3-poky-linux/json-c/json-c-src: FILELIST: directory renamed /usr/src/debug/json-c/0.18 -> /usr/src/debug/json-c/0.19, removed "/usr/src/debug/json-c/0.18/tests/test1.c /usr/src/debug/json-c/0.18/tests/test_printbuf.c /usr/src/debug/json-c/0.18/tests/test2.c /usr/src/debug/json-c/0.18/tests/test4.c /usr/src/debug/json-c/0.18/tests/test_deep_copy.c /usr/src/debug/json-c/0.18/tests/test_null.c /usr/src/debug/json-c/0.18/tests/test_float.c /usr/src/debug/json-c/0.18/tests/test_parse.c /usr/src/debug/json-c/0.18/tests/test_set_serializer.c /usr/src/debug/json-c/0.18/tests/test_compare.c /usr/src/debug/json-c/0.18/tests/test_json_pointer.c /usr/src/debug/json-c/0.18/tests/test_util_file.c /usr/src/debug/json-c/0.18/tests/testReplaceExisting.c /usr/src/debug/json-c/0.18/tests/parse_flags.c /usr/src/debug/json-c/0.18/tests/test_json_patch.c /usr/src/debug/json-c/0.18/tests/test_strerror.c /usr/src/debug/json-c/0.18/tests/test_locale.c /usr/src/debug/json-c/0.18/tests/parse_f
 lags.h /usr/src/debug/json-c/0.18/tests/test_charcase.c /usr/src/debug/json-c/0.18/tests/test_int_get.c /usr/src/debug/json-c/0.18/tests/test_cast.c /usr/src/debug/json-c/0.18/tests/test_set_value.c /usr/src/debug/json-c/0.18/tests/test_double_serializer.c /usr/src/debug/json-c/0.18/tests/test_visit.c /usr/src/debug/json-c/0.18/tests/test_int_add.c /usr/src/debug/json-c/0.18/tests/test_parse_int64.c /usr/src/debug/json-c/0.18/tests/test_object_iterator.c", added "/usr/src/debug/json-c/0.19/tests/test1.c /usr/src/debug/json-c/0.19/tests/test_printbuf.c /usr/src/debug/json-c/0.19/tests/test_safe_json_pointer_set.c /usr/src/debug/json-c/0.19/tests/test2.c /usr/src/debug/json-c/0.19/tests/test_deep_copy.c /usr/src/debug/json-c/0.19/tests/test4.c /usr/src/debug/json-c/0.19/tests/test_null.c /usr/src/debug/json-c/0.19/tests/test_float.c /usr/src/debug/json-c/0.19/tests/test_parse.c /usr/src/debug/json-c/0.19/tests/test_set_serializer.c /usr/src/debug/json-c/0.19/tests/test_compare.c /usr/
 src/debug/json-c/0.19/tests/test_json_pointer.c /usr/src/debug/json-c/0.19/tests/test_util_file.c /usr/src/debug/json-c/0.19/tests/testReplaceExisting.c /usr/src/debug/json-c/0.19/tests/parse_flags.c /usr/src/debug/json-c/0.19/tests/test_json_patch.c /usr/src/debug/json-c/0.19/tests/test_strerror.c /usr/src/debug/json-c/0.19/tests/test_locale.c /usr/src/debug/json-c/0.19/tests/parse_flags.h /usr/src/debug/json-c/0.19/tests/test_charcase.c /usr/src/debug/json-c/0.19/tests/test_deep_nesting.c /usr/src/debug/json-c/0.19/tests/test_int_get.c /usr/src/debug/json-c/0.19/tests/test_cast.c /usr/src/debug/json-c/0.19/tests/test_set_value.c /usr/src/debug/json-c/0.19/tests/test_double_serializer.c /usr/src/debug/json-c/0.19/tests/test_visit.c /usr/src/debug/json-c/0.19/tests/test_int_add.c /usr/src/debug/json-c/0.19/tests/test_parse_int64.c /usr/src/debug/json-c/0.19/tests/test_object_iterator.c"
packages/x86-64-v3-poky-linux/json-c/json-c-src: PKGSIZE changed from 398854 to 435571 (+9%)
packages/x86-64-v3-poky-linux/json-c/json-c-src: PV changed from "0.18" to "0.19"
packages/x86-64-v3-poky-linux/json-c/json-c-src: PKGV changed from 0.18 [default] to 0.19 [default]
packages/x86-64-v3-poky-linux/json-c/json-c-staticdev: PKGSIZE changed from 445274 to 466022 (+5%)
packages/x86-64-v3-poky-linux/json-c/json-c-staticdev: PV changed from "0.18" to "0.19"
packages/x86-64-v3-poky-linux/json-c/json-c-staticdev: PKGV changed from 0.18 [default] to 0.19 [default]
packages/x86-64-v3-poky-linux/json-c/json-c: FILELIST: removed "/usr/lib/libjson-c.so.5.4.0", added "/usr/lib/libjson-c.so.5.5.0"
packages/x86-64-v3-poky-linux/json-c/json-c: PKGSIZE changed from 80194 to 84290 (+5%)
packages/x86-64-v3-poky-linux/json-c/json-c: PV changed from "0.18" to "0.19"
packages/x86-64-v3-poky-linux/json-c/json-c: PKGV changed from 0.18 [default] to 0.19 [default]
packages/x86-64-v3-poky-linux/json-c: PKGV changed from 0.18 [default] to 0.19 [default]
packages/x86-64-v3-poky-linux/json-c: SRC_URI changed from "https://s3.amazonaws.com/json-c_releases/releases/json-c-0.18.tar.gz file://run-ptest" to "https://s3.amazonaws.com/json-c_releases/releases/json-c-0.19.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/json-c: PV changed from "0.18" to "0.19"
Changes to packages/x86-64-v3-poky-linux/json-c (sysroot):
  /usr/lib/libjson-c.so.5 changed symlink target from libjson-c.so.5.4.0 to libjson-c.so.5.5.0
  /usr/lib/libjson-c.so.5.4.0 moved to /usr/lib/libjson-c.so.5.5.0
Changes to packages/x86_64-linux/json-c-native (sysroot):
  /usr/lib/libjson-c.so.5 changed symlink target from libjson-c.so.5.4.0 to libjson-c.so.5.5.0
  /usr/lib/libjson-c.so.5.4.0 moved to /usr/lib/libjson-c.so.5.5.0

--===============4194859410857668169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/json-c/json-c-ptest: FILELIST: added "/usr/lib/json-c/ptest/tests/test_json_parse_cli.expected /usr/lib/json-c/ptest/tests/test_safe_json_pointer_set.expected /usr/lib/json-c/ptest/tests/test_deep_nesting.expected /usr/lib/json-c/ptest/tests/test_json_parse_cli.test /usr/lib/json-c/ptest/tests/test_deep_nesting.test /usr/lib/json-c/ptest/tests/test_safe_json_pointer_set /usr/lib/json-c/ptest/tests/test_safe_json_pointer_set.test /usr/lib/json-c/ptest/tests/test_deep_nesting"
packages/x86-64-v3-poky-linux/json-c/json-c: FILELIST: removed "/usr/lib/libjson-c.so.5.4.0", added "/usr/lib/libjson-c.so.5.5.0"
Changes to packages/x86-64-v3-poky-linux/json-c (sysroot):
  /usr/lib/libjson-c.so.5 changed symlink target from libjson-c.so.5.4.0 to libjson-c.so.5.5.0
  /usr/lib/libjson-c.so.5.4.0 moved to /usr/lib/libjson-c.so.5.5.0
Changes to packages/x86_64-linux/json-c-native (sysroot):
  /usr/lib/libjson-c.so.5 changed symlink target from libjson-c.so.5.4.0 to libjson-c.so.5.5.0
  /usr/lib/libjson-c.so.5.4.0 moved to /usr/lib/libjson-c.so.5.5.0

--===============4194859410857668169==--

