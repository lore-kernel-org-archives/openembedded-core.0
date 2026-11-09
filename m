Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.284.1794201493057910702
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 21:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=tYgYmsfI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=m1RkLOlk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1bebe1b57-a83c5c2e-5ca3-427e-ad54-db117738d3ee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794201492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rbAfcvKFhxQs8r0L6agYxNboVktySwwEF7a58ivdMCg=;
	b=tYgYmsfIGIyY4QqkLKriQbfz2tHYyq4Sk8jlsHadxdnOEU4BbI6lifqKrQJ89s1V
	GwPhVksUPlgyl/VV0tMRUbxNQEZfs3boTg3CVFB0Tu/1S1OqUZrdwoU2Mq8dqiVDhpT
	wbY/xv9ny0UpUu4eBTSDWgLGLLeEDza9Nfr7p9Go=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794201492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rbAfcvKFhxQs8r0L6agYxNboVktySwwEF7a58ivdMCg=;
	b=m1RkLOlkVS4jtqtr+XlXcvA7sSjYy4I9ZreXlBA5EwUCcS9o98kK9CdbkMGrwL+c
	kN/hPwQ/5TuvdZxp1MSDbUDI77T6OJRbuqylcxg+b8BtL3R4p2lJOkW3M/vCP6/kvS1
	0+dX2kX2ruJ8N1V7qF738PxCNANxmZjwXiB8qBKk=
Content-Type: multipart/mixed; boundary="===============2055729957773670176=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <marta.rybczynska@ygreky.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uritools: upgrading to 7.0.0 SUCCEEDED
Message-ID: <010101a1bebe1b57-a83c5c2e-5ca3-427e-ad54-db117738d3ee-000000@us-west-2.amazonses.com>
Date: Mon, 9 Nov 2026 05:18:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.09-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 05:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249787

--===============2055729957773670176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uritools* to *7.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uritools-upgrade-6.1.3-7.0.0.patch
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
From f1e6e4cc8d11805ec87901636addfe0df7b2c66f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 9 Nov 2026 05:15:07 +0000
Subject: [PATCH] python3-uritools: upgrade 6.1.3 -> 7.0.0

v7.0.0 (2026-11-08)
===================

- Drop Python 3.10 support (breaking change).

- Fix ``SplitResult.host`` for registered names consisting of digits
  only (potentially breaking change).

- ``uriencode()`` and ``uricompose()`` now raise ``TypeError`` on a
  wrong type instead of leaking ``AttributeError`` (potentially
  breaking change).

- Update build and test environment.

v6.1.5 (2026-11-07)
===================

- Bound ``uriencode()`` lookup table using ``functools.lru_cache()``.
- Minor code and test improvements.

v6.1.4 (2026-11-04)
===================

- Add support for Python 3.15.
- Fix newline handling in ``uricompose()`` and ``urisplit()``.
- Compare schemes case-insensitively in non-strict ``urijoin()``.
- Recognize an uppercase ``IPvFuture`` version flag.
- Various documentation improvements.
- Minor unit test improvements.
- Update build environment.
---
 .../{python3-uritools_6.1.3.bb => python3-uritools_7.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-uritools_6.1.3.bb => python3-uritools_7.0.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-uritools_6.1.3.bb b/meta/recipes-devtools/python/python3-uritools_7.0.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-uritools_6.1.3.bb
rename to meta/recipes-devtools/python/python3-uritools_7.0.0.bb
index 47fddec046..a19949c721 100644
--- a/meta/recipes-devtools/python/python3-uritools_6.1.3.bb
+++ b/meta/recipes-devtools/python/python3-uritools_7.0.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/tkem/uritools/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=079933dfba36eb60b5e3512ca0ab61ae"
 
-SRC_URI[sha256sum] = "3a498e7e85ef3249343d5710618d641a414da0fbae6d23053ada7976ee83ea5f"
+SRC_URI[sha256sum] = "110b773e3f8fbaebcdcbe1377d04e418b1985adf69deeca4ed569f3e328cbf48"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============2055729957773670176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uritools: PV changed from "6.1.3" to "7.0.0"
packages/x86-64-v3-poky-linux/python3-uritools: PKGV changed from 6.1.3 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/python3-uritools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uritools/uritools-6.1.3.tar.gz" to "https://files.pythonhosted.org/packages/source/u/uritools/uritools-7.0.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dbg: PV changed from "6.1.3" to "7.0.0"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dbg: PKGV changed from 6.1.3 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dev: PV changed from "6.1.3" to "7.0.0"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dev: PKGV changed from 6.1.3 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-doc: PV changed from "6.1.3" to "7.0.0"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-doc: PKGV changed from 6.1.3 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-locale: PV changed from "6.1.3" to "7.0.0"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-locale: PKGV changed from 6.1.3 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PV changed from "6.1.3" to "7.0.0"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PKGV changed from 6.1.3 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PKGSIZE changed from 50062 to 58857 (+18%)
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-src: PV changed from "6.1.3" to "7.0.0"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-src: PKGV changed from 6.1.3 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-staticdev: PV changed from "6.1.3" to "7.0.0"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-staticdev: PKGV changed from 6.1.3 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PV changed from "6.1.3" to "7.0.0"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/uritools-7.0.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info -> /usr/lib/python3.14/site-packages/uritools-7.0.0.dist-info
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PKGV changed from 6.1.3 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PKGSIZE changed from 73198 to 76280 (+4%)
Changes to packages/x86-64-v3-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info moved to /usr/lib/python3.14/site-packages/uritools-7.0.0.dist-info

--===============2055729957773670176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-uritools-changelog.txt"

v7.0.0 (2026-11-08)
===================

- Drop Python 3.10 support (breaking change).

- Fix ``SplitResult.host`` for registered names consisting of digits
  only (potentially breaking change).

- ``uriencode()`` and ``uricompose()`` now raise ``TypeError`` on a
  wrong type instead of leaking ``AttributeError`` (potentially
  breaking change).

- Update build and test environment.

v6.1.5 (2026-11-07)
===================

- Bound ``uriencode()`` lookup table using ``functools.lru_cache()``.
- Minor code and test improvements.

v6.1.4 (2026-11-04)
===================

- Add support for Python 3.15.
- Fix newline handling in ``uricompose()`` and ``urisplit()``.
- Compare schemes case-insensitively in non-strict ``urijoin()``.
- Recognize an uppercase ``IPvFuture`` version flag.
- Various documentation improvements.
- Minor unit test improvements.
- Update build environment.

--===============2055729957773670176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PKGSIZE changed from 50062 to 58857 (+18%)
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info -> /usr/lib/python3.14/site-packages/uritools-7.0.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/uritools-7.0.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info moved to /usr/lib/python3.14/site-packages/uritools-7.0.0.dist-info

--===============2055729957773670176==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uritools-upgrade-6.1.3-7.0.0.patch"

RnJvbSBmMWU2ZTRjYzhkMTE4MDVlYzg3OTAxNjM2YWRkZmUwZGY3YjJjNjZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgOSBOb3YgMjAyNiAwNToxNTowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXJpdG9vbHM6IHVwZ3JhZGUgNi4xLjMgLT4gNy4wLjAKCnY3LjAuMCAoMjAyNi0xMS0w
OCkKPT09PT09PT09PT09PT09PT09PQoKLSBEcm9wIFB5dGhvbiAzLjEwIHN1cHBvcnQgKGJyZWFr
aW5nIGNoYW5nZSkuCgotIEZpeCBgYFNwbGl0UmVzdWx0Lmhvc3RgYCBmb3IgcmVnaXN0ZXJlZCBu
YW1lcyBjb25zaXN0aW5nIG9mIGRpZ2l0cwogIG9ubHkgKHBvdGVudGlhbGx5IGJyZWFraW5nIGNo
YW5nZSkuCgotIGBgdXJpZW5jb2RlKClgYCBhbmQgYGB1cmljb21wb3NlKClgYCBub3cgcmFpc2Ug
YGBUeXBlRXJyb3JgYCBvbiBhCiAgd3JvbmcgdHlwZSBpbnN0ZWFkIG9mIGxlYWtpbmcgYGBBdHRy
aWJ1dGVFcnJvcmBgIChwb3RlbnRpYWxseQogIGJyZWFraW5nIGNoYW5nZSkuCgotIFVwZGF0ZSBi
dWlsZCBhbmQgdGVzdCBlbnZpcm9ubWVudC4KCnY2LjEuNSAoMjAyNi0xMS0wNykKPT09PT09PT09
PT09PT09PT09PQoKLSBCb3VuZCBgYHVyaWVuY29kZSgpYGAgbG9va3VwIHRhYmxlIHVzaW5nIGBg
ZnVuY3Rvb2xzLmxydV9jYWNoZSgpYGAuCi0gTWlub3IgY29kZSBhbmQgdGVzdCBpbXByb3ZlbWVu
dHMuCgp2Ni4xLjQgKDIwMjYtMTEtMDQpCj09PT09PT09PT09PT09PT09PT0KCi0gQWRkIHN1cHBv
cnQgZm9yIFB5dGhvbiAzLjE1LgotIEZpeCBuZXdsaW5lIGhhbmRsaW5nIGluIGBgdXJpY29tcG9z
ZSgpYGAgYW5kIGBgdXJpc3BsaXQoKWBgLgotIENvbXBhcmUgc2NoZW1lcyBjYXNlLWluc2Vuc2l0
aXZlbHkgaW4gbm9uLXN0cmljdCBgYHVyaWpvaW4oKWBgLgotIFJlY29nbml6ZSBhbiB1cHBlcmNh
c2UgYGBJUHZGdXR1cmVgYCB2ZXJzaW9uIGZsYWcuCi0gVmFyaW91cyBkb2N1bWVudGF0aW9uIGlt
cHJvdmVtZW50cy4KLSBNaW5vciB1bml0IHRlc3QgaW1wcm92ZW1lbnRzLgotIFVwZGF0ZSBidWls
ZCBlbnZpcm9ubWVudC4KLS0tCiAuLi4ve3B5dGhvbjMtdXJpdG9vbHNfNi4xLjMuYmIgPT4gcHl0
aG9uMy11cml0b29sc183LjAuMC5iYn0gICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3tweXRob24zLXVyaXRvb2xzXzYuMS4zLmJiID0+IHB5dGhvbjMtdXJpdG9vbHNfNy4wLjAu
YmJ9ICg3OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXVyaXRvb2xzXzYuMS4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXVyaXRvb2xzXzcuMC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggNzklCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cml0b29sc182LjEuMy5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVyaXRvb2xzXzcuMC4w
LmJiCmluZGV4IDQ3ZmRkZWMwNDYuLmExOTk0OWM3MjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cml0b29sc182LjEuMy5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJpdG9vbHNfNy4wLjAuYmIKQEAgLTQsNyAr
NCw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS90a2VtL3VyaXRvb2xzLyIKIExJ
Q0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MDc5
OTMzZGZiYTM2ZWI2MGI1ZTM1MTJjYTBhYjYxYWUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIz
YTQ5OGU3ZTg1ZWYzMjQ5MzQzZDU3MTA2MThkNjQxYTQxNGRhMGZiYWU2ZDIzMDUzYWRhNzk3NmVl
ODNlYTVmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjExMGI3NzNlM2Y4ZmJhZWJjZGNiZTEzNzdk
MDRlNDE4YjE5ODVhZGY2OWRlZWNhNGVkNTY5ZjNlMzI4Y2JmNDgiCiAKIGluaGVyaXQgcHlwaSBw
eXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhIHB0ZXN0LXB5dGhvbi1weXRlc3QKIAotLSAKMi40
Ny4xCgo=

--===============2055729957773670176==--
