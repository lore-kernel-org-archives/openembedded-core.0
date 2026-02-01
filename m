Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D15EE65291
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:13:10 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29062.1769951573731433471
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2nfQQr6o;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=n0FHlqs8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019c1955cd40-5b7e4e31-7cbb-4af0-9052-ed88dc2ace2a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951579;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kgI/Uto9lKJ4caj27Po1LNoeCwjHJZYtl2FR5QzXSs0=;
	b=2nfQQr6oCS4DKAkdi/XN36IdxWTwHVFZPjfHv9RKum/0RZm/l1yJtfFBXez4bDkh
	TK9hL4GDwSWS8Ty8C/4+bX8L3tM9MrOylqa/ukkZYtAkjpaMkB4WBlr3JHQ4XSaubhr
	duW7vL2jk2Bxo3ykFZxdialRRwK9xoZ0nPB4Tr9c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951579;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kgI/Uto9lKJ4caj27Po1LNoeCwjHJZYtl2FR5QzXSs0=;
	b=n0FHlqs8j+S1KLPzYdoGO3X5bAXKgABYSdJPX1D1shskxCPKNfciWqk7cyxQxlH5
	0VxYl0plsDwIYkDgEh2AkYKp6wdYe+D3sDGaqfHYbaVVdMZe00pGmbY38eDp/12oi8m
	jcWtBVrRyl0isIZDvxZRabN/vOeCJ+iEQcQGrfcs=
Content-Type: multipart/mixed; boundary="===============4014832905448059356=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] aspell: upgrading to 0.60.8.2 SUCCEEDED
Message-ID: <0101019c1955cd40-5b7e4e31-7cbb-4af0-9052-ed88dc2ace2a-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230324

--===============4014832905448059356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *aspell* to *0.60.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-aspell-upgrade-0.60.8.1-0.60.8.2.patch
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
From b09b06051fb19f75ed71099d504f607f22581759 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 12:50:28 +0000
Subject: [PATCH] aspell: upgrade 0.60.8.1 -> 0.60.8.2

---
 ...default-vector_hash-t.hpp-fix-gcc-15.patch | 42 -------------------
 ...{aspell_0.60.8.1.bb => aspell_0.60.8.2.bb} |  5 +--
 2 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch
 rename meta/recipes-support/aspell/{aspell_0.60.8.1.bb => aspell_0.60.8.2.bb} (84%)

diff --git a/meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch b/meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch
deleted file mode 100644
index 4045e8e412..0000000000
--- a/meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From d45bf96b0a3556acb2c83069a78eaaac973d31b4 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Sun, 21 Jul 2024 22:01:50 +0100
-Subject: [PATCH] modules/speller/default/vector_hash-t.hpp: fix gcc-15 build
-
-Uncoming `gcc-15` added extra checks for template instantiation that is
-guaranteed to fail in
-  https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=313afcfdabeab3e6705ac0bd1273627075be0023
-
-As a result `aspell` build now fails as:
-
-    In file included from modules/speller/default/readonly_ws.cpp:51:
-    modules/speller/default/vector_hash-t.hpp: In member function 'void aspeller::VectorHashTable<Parms>::recalc_size()':
-    modules/speller/default/vector_hash-t.hpp:186:43: error: 'class aspeller::VectorHashTable<Parms>' has no member named 'e'
-      186 |     for (iterator i = begin(); i != this->e; ++i, ++this->_size);
-          |                                           ^
-    modules/speller/default/vector_hash-t.hpp:186:59: error: 'class aspeller::VectorHashTable<Parms>' has no member named '_size'; did you mean 'size'?
-      186 |     for (iterator i = begin(); i != this->e; ++i, ++this->_size);
-          |                                                           ^~~~~
-          |                                                           size
-
-It looks like `_size` is `size_` mis-spelling and `e` was not introduced
-here.
-Upstream-Status: Backport [https://github.com/GNUAspell/aspell/commit/ee6cbb12ff36a1e6618d7388a78dd4e0a2b44041]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- modules/speller/default/vector_hash-t.hpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/modules/speller/default/vector_hash-t.hpp b/modules/speller/default/vector_hash-t.hpp
-index 969a80c..e4420b4 100644
---- a/modules/speller/default/vector_hash-t.hpp
-+++ b/modules/speller/default/vector_hash-t.hpp
-@@ -183,7 +183,7 @@ namespace aspeller {
-   template<class Parms>
-   void VectorHashTable<Parms>::recalc_size() {
-     size_ = 0;
--    for (iterator i = begin(); i != this->e; ++i, ++this->_size);
-+    for (iterator i = begin(), e = end(); i != e; ++i, ++size_);
-   }
- 
- }
diff --git a/meta/recipes-support/aspell/aspell_0.60.8.1.bb b/meta/recipes-support/aspell/aspell_0.60.8.2.bb
similarity index 84%
rename from meta/recipes-support/aspell/aspell_0.60.8.1.bb
rename to meta/recipes-support/aspell/aspell_0.60.8.2.bb
index 43940b1e1b..5b4fab7c35 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.2.bb
@@ -13,9 +13,8 @@ HOMEPAGE = "http://aspell.net/"
 LICENSE = "LGPL-2.0-only | LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
-           file://0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch"
-SRC_URI[sha256sum] = "d6da12b34d42d457fa604e435ad484a74b2effcd120ff40acd6bb3fb2887d21b"
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
+SRC_URI[sha256sum] = "57fe4863eae6048f72245a8575b44b718fb85ca14b9f8c0afc41b254dfd76919"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
-- 
2.47.1


--===============4014832905448059356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/aspell/aspell-locale-be: PKGSIZE changed from 9205 to 39332 (+327%)

--===============4014832905448059356==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-aspell-upgrade-0.60.8.1-0.60.8.2.patch"

RnJvbSBiMDliMDYwNTFmYjE5Zjc1ZWQ3MTA5OWQ1MDRmNjA3ZjIyNTgxNzU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAxMjo1MDoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFz
cGVsbDogdXBncmFkZSAwLjYwLjguMSAtPiAwLjYwLjguMgoKLS0tCiAuLi5kZWZhdWx0LXZlY3Rv
cl9oYXNoLXQuaHBwLWZpeC1nY2MtMTUucGF0Y2ggfCA0MiAtLS0tLS0tLS0tLS0tLS0tLS0tCiAu
Li57YXNwZWxsXzAuNjAuOC4xLmJiID0+IGFzcGVsbF8wLjYwLjguMi5iYn0gfCAgNSArLS0KIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtc3VwcG9ydC9hc3BlbGwvYXNwZWxsLzAwMDEtbW9kdWxl
cy1zcGVsbGVyLWRlZmF1bHQtdmVjdG9yX2hhc2gtdC5ocHAtZml4LWdjYy0xNS5wYXRjaAogcmVu
YW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2FzcGVsbC97YXNwZWxsXzAuNjAuOC4xLmJiID0+IGFz
cGVsbF8wLjYwLjguMi5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9hc3BlbGwvYXNwZWxsLzAwMDEtbW9kdWxlcy1zcGVsbGVyLWRlZmF1bHQtdmVjdG9yX2hhc2gt
dC5ocHAtZml4LWdjYy0xNS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FzcGVsbC9hc3Bl
bGwvMDAwMS1tb2R1bGVzLXNwZWxsZXItZGVmYXVsdC12ZWN0b3JfaGFzaC10LmhwcC1maXgtZ2Nj
LTE1LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA0MDQ1ZThlNDEyLi4wMDAw
MDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FzcGVsbC9hc3BlbGwvMDAwMS1tb2R1
bGVzLXNwZWxsZXItZGVmYXVsdC12ZWN0b3JfaGFzaC10LmhwcC1maXgtZ2NjLTE1LnBhdGNoCisr
KyAvZGV2L251bGwKQEAgLTEsNDIgKzAsMCBAQAotRnJvbSBkNDViZjk2YjBhMzU1NmFjYjJjODMw
NjlhNzhlYWFhYzk3M2QzMWI0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogU2VyZ2Vp
IFRyb2ZpbW92aWNoIDxzbHlpY2hAZ21haWwuY29tPgotRGF0ZTogU3VuLCAyMSBKdWwgMjAyNCAy
MjowMTo1MCArMDEwMAotU3ViamVjdDogW1BBVENIXSBtb2R1bGVzL3NwZWxsZXIvZGVmYXVsdC92
ZWN0b3JfaGFzaC10LmhwcDogZml4IGdjYy0xNSBidWlsZAotCi1VbmNvbWluZyBgZ2NjLTE1YCBh
ZGRlZCBleHRyYSBjaGVja3MgZm9yIHRlbXBsYXRlIGluc3RhbnRpYXRpb24gdGhhdCBpcwotZ3Vh
cmFudGVlZCB0byBmYWlsIGluCi0gIGh0dHBzOi8vZ2NjLmdudS5vcmcvZ2l0Lz9wPWdjYy5naXQ7
YT1jb21taXRkaWZmO2g9MzEzYWZjZmRhYmVhYjNlNjcwNWFjMGJkMTI3MzYyNzA3NWJlMDAyMwot
Ci1BcyBhIHJlc3VsdCBgYXNwZWxsYCBidWlsZCBub3cgZmFpbHMgYXM6Ci0KLSAgICBJbiBmaWxl
IGluY2x1ZGVkIGZyb20gbW9kdWxlcy9zcGVsbGVyL2RlZmF1bHQvcmVhZG9ubHlfd3MuY3BwOjUx
OgotICAgIG1vZHVsZXMvc3BlbGxlci9kZWZhdWx0L3ZlY3Rvcl9oYXNoLXQuaHBwOiBJbiBtZW1i
ZXIgZnVuY3Rpb24gJ3ZvaWQgYXNwZWxsZXI6OlZlY3Rvckhhc2hUYWJsZTxQYXJtcz46OnJlY2Fs
Y19zaXplKCknOgotICAgIG1vZHVsZXMvc3BlbGxlci9kZWZhdWx0L3ZlY3Rvcl9oYXNoLXQuaHBw
OjE4Njo0MzogZXJyb3I6ICdjbGFzcyBhc3BlbGxlcjo6VmVjdG9ySGFzaFRhYmxlPFBhcm1zPicg
aGFzIG5vIG1lbWJlciBuYW1lZCAnZScKLSAgICAgIDE4NiB8ICAgICBmb3IgKGl0ZXJhdG9yIGkg
PSBiZWdpbigpOyBpICE9IHRoaXMtPmU7ICsraSwgKyt0aGlzLT5fc2l6ZSk7Ci0gICAgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCi0gICAgbW9kdWxl
cy9zcGVsbGVyL2RlZmF1bHQvdmVjdG9yX2hhc2gtdC5ocHA6MTg2OjU5OiBlcnJvcjogJ2NsYXNz
IGFzcGVsbGVyOjpWZWN0b3JIYXNoVGFibGU8UGFybXM+JyBoYXMgbm8gbWVtYmVyIG5hbWVkICdf
c2l6ZSc7IGRpZCB5b3UgbWVhbiAnc2l6ZSc/Ci0gICAgICAxODYgfCAgICAgZm9yIChpdGVyYXRv
ciBpID0gYmVnaW4oKTsgaSAhPSB0aGlzLT5lOyArK2ksICsrdGhpcy0+X3NpemUpOwotICAgICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5+fn5+Ci0gICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZQotCi1JdCBsb29rcyBsaWtlIGBfc2l6ZWAg
aXMgYHNpemVfYCBtaXMtc3BlbGxpbmcgYW5kIGBlYCB3YXMgbm90IGludHJvZHVjZWQKLWhlcmUu
Ci1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGh1Yi5jb20vR05VQXNwZWxs
L2FzcGVsbC9jb21taXQvZWU2Y2JiMTJmZjM2YTFlNjYxOGQ3Mzg4YTc4ZGQ0ZTBhMmI0NDA0MV0K
LVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBtb2R1
bGVzL3NwZWxsZXIvZGVmYXVsdC92ZWN0b3JfaGFzaC10LmhwcCB8IDIgKy0KLSAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL21vZHVs
ZXMvc3BlbGxlci9kZWZhdWx0L3ZlY3Rvcl9oYXNoLXQuaHBwIGIvbW9kdWxlcy9zcGVsbGVyL2Rl
ZmF1bHQvdmVjdG9yX2hhc2gtdC5ocHAKLWluZGV4IDk2OWE4MGMuLmU0NDIwYjQgMTAwNjQ0Ci0t
LS0gYS9tb2R1bGVzL3NwZWxsZXIvZGVmYXVsdC92ZWN0b3JfaGFzaC10LmhwcAotKysrIGIvbW9k
dWxlcy9zcGVsbGVyL2RlZmF1bHQvdmVjdG9yX2hhc2gtdC5ocHAKLUBAIC0xODMsNyArMTgzLDcg
QEAgbmFtZXNwYWNlIGFzcGVsbGVyIHsKLSAgIHRlbXBsYXRlPGNsYXNzIFBhcm1zPgotICAgdm9p
ZCBWZWN0b3JIYXNoVGFibGU8UGFybXM+OjpyZWNhbGNfc2l6ZSgpIHsKLSAgICAgc2l6ZV8gPSAw
OwotLSAgICBmb3IgKGl0ZXJhdG9yIGkgPSBiZWdpbigpOyBpICE9IHRoaXMtPmU7ICsraSwgKyt0
aGlzLT5fc2l6ZSk7Ci0rICAgIGZvciAoaXRlcmF0b3IgaSA9IGJlZ2luKCksIGUgPSBlbmQoKTsg
aSAhPSBlOyArK2ksICsrc2l6ZV8pOwotICAgfQotIAotIH0KZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2FzcGVsbC9hc3BlbGxfMC42MC44LjEuYmIgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9hc3BlbGwvYXNwZWxsXzAuNjAuOC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggODQlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2FzcGVsbC9hc3BlbGxfMC42MC44LjEuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2FzcGVsbC9hc3BlbGxfMC42MC44LjIuYmIKaW5k
ZXggNDM5NDBiMWUxYi4uNWI0ZmFiN2MzNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvYXNwZWxsL2FzcGVsbF8wLjYwLjguMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9h
c3BlbGwvYXNwZWxsXzAuNjAuOC4yLmJiCkBAIC0xMyw5ICsxMyw4IEBAIEhPTUVQQUdFID0gImh0
dHA6Ly9hc3BlbGwubmV0LyIKIExJQ0VOU0UgPSAiTEdQTC0yLjAtb25seSB8IExHUEwtMi4xLW9u
bHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT03ZmJjMzM4MzA5YWMz
OGZlZmNkNjRiMDRiYjkwM2UzNCIKIAotU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L2FzcGVsbC9h
c3BlbGwtJHtQVn0udGFyLmd6IFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtbW9kdWxlcy1zcGVs
bGVyLWRlZmF1bHQtdmVjdG9yX2hhc2gtdC5ocHAtZml4LWdjYy0xNS5wYXRjaCIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJkNmRhMTJiMzRkNDJkNDU3ZmE2MDRlNDM1YWQ0ODRhNzRiMmVmZmNkMTIw
ZmY0MGFjZDZiYjNmYjI4ODdkMjFiIgorU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L2FzcGVsbC9h
c3BlbGwtJHtQVn0udGFyLmd6IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU3ZmU0ODYzZWFlNjA0
OGY3MjI0NWE4NTc1YjQ0YjcxOGZiODVjYTE0YjlmOGMwYWZjNDFiMjU0ZGZkNzY5MTkiCiAKIFBB
Q0tBR0VDT05GSUcgPz89ICIiCiBQQUNLQUdFQ09ORklHW2N1cnNlc10gPSAiLS1lbmFibGUtY3Vy
c2VzLC0tZGlzYWJsZS1jdXJzZXMsbmN1cnNlcyIKLS0gCjIuNDcuMQoK

--===============4014832905448059356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/aspell/aspell-dbg: PKGSIZE changed from 9040536 to 9044184 (+0%)
packages/x86-64-v3-poky-linux/aspell/aspell-dbg: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-dbg: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-dev: PKGSIZE changed from 37012 to 37210 (+1%)
packages/x86-64-v3-poky-linux/aspell/aspell-dev: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-dev: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-doc: PKGSIZE changed from 346563 to 347257 (+0%)
packages/x86-64-v3-poky-linux/aspell/aspell-doc: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-doc: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ast: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ast: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-be: PKGSIZE changed from 9205 to 39332 (+327%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-be: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-be: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ca: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ca: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-cs: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-cs: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-da: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-da: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-de: PKGSIZE changed from 32858 to 32736 (-0%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-de: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-de: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-en-gb: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-en-gb: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-eo: PKGSIZE changed from 31324 to 31200 (-0%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-eo: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-eo: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-es: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-es: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-fi: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-fi: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-fr: PKGSIZE changed from 32932 to 32807 (-0%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-fr: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-fr: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-fur: PKGSIZE changed from 32589 to 32671 (+0%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-fur: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-fur: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ga: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ga: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-hr: PKGSIZE changed from 31922 to 31800 (-0%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-hr: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-hr: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-hu: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-hu: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-id: PKGSIZE changed from 31842 to 31716 (-0%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-id: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-id: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-it: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-it: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ja: PKGSIZE changed from 34354 to 34747 (+1%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ja: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ja: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ka: PKGSIZE changed from 24164 to 24448 (+1%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ka: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ka: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-mn: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-mn: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ms: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ms: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-nl: PKGSIZE changed from 32330 to 32209 (-0%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-nl: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-nl: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-pl: PKGSIZE changed from 31539 to 31418 (-0%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-pl: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-pl: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-pt-br: PKGSIZE changed from 32122 to 31998 (-0%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-pt-br: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-pt-br: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-pt: PKGSIZE changed from 31779 to 31852 (+0%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-pt: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-pt: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ro: PKGSIZE changed from 33981 to 33852 (-0%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ro: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ro: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ru: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-ru: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-rw: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-rw: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sk: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sk: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sl: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sl: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sq: PKGSIZE changed from 28226 to 29903 (+6%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sq: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sq: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sr: PKGSIZE changed from 39050 to 39167 (+0%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sr: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sr: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sv: PKGSIZE changed from 31481 to 31543 (+0%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sv: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-sv: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-tg: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-tg: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-uk: PKGSIZE changed from 39721 to 39600 (-0%)
packages/x86-64-v3-poky-linux/aspell/aspell-locale-uk: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-uk: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-vi: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-vi: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-wa: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-wa: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-locale-zh-cn: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-locale-zh-cn: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-src: PKGSIZE changed from 974565 to 974876 (+0%)
packages/x86-64-v3-poky-linux/aspell/aspell-src: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-src: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-src: FILELIST: directory renamed /usr/src/debug/aspell/0.60.8.1/common -> /usr/src/debug/aspell/0.60.8.2/common, directory renamed /usr/src/debug/aspell/0.60.8.1/lib -> /usr/src/debug/aspell/0.60.8.2/lib, directory renamed /usr/src/debug/aspell/0.60.8.1/gen -> /usr/src/debug/aspell/0.60.8.2/gen, directory renamed /usr/src/debug/aspell/0.60.8.1/modules/filter -> /usr/src/debug/aspell/0.60.8.2/modules/filter, directory renamed /usr/src/debug/aspell/0.60.8.1/modules/speller/default -> /usr/src/debug/aspell/0.60.8.2/modules/speller/default, directory renamed /usr/src/debug/aspell/0.60.8.1/prog -> /usr/src/debug/aspell/0.60.8.2/prog, directory renamed /usr/src/debug/aspell/0.60.8.1/modules/tokenizer -> /usr/src/debug/aspell/0.60.8.2/modules/tokenizer, directory renamed /usr/src/debug/aspell/0.60.8.1/interfaces/cc -> /usr/src/debug/aspell/0.60.8.2/interfaces/cc
packages/x86-64-v3-poky-linux/aspell/aspell-staticdev: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-staticdev: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell-utils: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell-utils: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/aspell: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/aspell: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/aspell/aspell-0.60.8.1.tar.gz file://0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch" to "https://ftpmirror.gnu.org/gnu/aspell/aspell-0.60.8.2.tar.gz"
packages/x86-64-v3-poky-linux/aspell: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/libaspell: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/libaspell: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]
packages/x86-64-v3-poky-linux/aspell/libpspell: PV changed from "0.60.8.1" to "0.60.8.2"
packages/x86-64-v3-poky-linux/aspell/libpspell: PKGV changed from 0.60.8.1 [default] to 0.60.8.2 [default]

--===============4014832905448059356==--

