Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8306.1794115345407220905
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2026 21:22:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=nnVqGEo2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bwHkSI0t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1b99b98a3-f80ecd96-2467-4e6d-a89b-933e865f8482-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794115344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5Uw5doh1K1n8rAokOQv91Cki2kC/g6Gg0HCjeoZHnZE=;
	b=nnVqGEo2wx2EP3eESb/gFUiIzcRkEwXHAl9lrbLKh1IwsW7s8Y6Q9Mm6FkgMnfkd
	hDz8B8AFGupcad5qNH8IOAG16Gt1v+lYMFseCErwN2ym6oFhhU4nVqNUDpmo4OssGBZ
	rIel0nmV4/LoPmArZ+ZEne4PROz0SgWRUwbt4YOo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794115344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5Uw5doh1K1n8rAokOQv91Cki2kC/g6Gg0HCjeoZHnZE=;
	b=bwHkSI0tehE0L4DI7WR8iTkXZKJDRM2wIyJNCQ9yRI3JU0OV8Hd4yzkdNVPm1Lax
	8z2Kt9t3k36XFxxmJiADTv5irwZ8N+WXpf3G4sX0RbzKBWBBYNpo/W/n6X2aQIpoFnl
	/2kISBhl08taiAdzkmRxQcG+ocJNGXQGIcZd1U6o=
Content-Type: multipart/mixed; boundary="===============1480187526380524899=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <marta.rybczynska@ygreky.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uritools: upgrading to 6.1.5 SUCCEEDED
Message-ID: <010101a1b99b98a3-f80ecd96-2467-4e6d-a89b-933e865f8482-000000@us-west-2.amazonses.com>
Date: Sun, 8 Nov 2026 05:22:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.08-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 05:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249749

--===============1480187526380524899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uritools* to *6.1.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uritools-upgrade-6.1.3-6.1.5.patch
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
From 924fa5bb787d1f1aa34ec63bbd6ef228948f4011 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 8 Nov 2026 05:20:05 +0000
Subject: [PATCH] python3-uritools: upgrade 6.1.3 -> 6.1.5

v6.1.5 (2026-11-07)
===================

- Bound ``uriencode()`` lookup table using ``functools.lru_cache()``.
- Minor code and test improvements.

v6.1.4 (2026-11-04)
===================

- Fix newline handling in ``uricompose()`` and ``urisplit()``.
- Compare schemes case-insensitively in non-strict ``urijoin()``.
- Recognize an uppercase ``IPvFuture`` version flag.
- Various documentation improvements.
- Minor unit test improvements.
- Update build environment.
---
 .../{python3-uritools_6.1.3.bb => python3-uritools_6.1.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-uritools_6.1.3.bb => python3-uritools_6.1.5.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-uritools_6.1.3.bb b/meta/recipes-devtools/python/python3-uritools_6.1.5.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-uritools_6.1.3.bb
rename to meta/recipes-devtools/python/python3-uritools_6.1.5.bb
index 47fddec046..f886a3b38d 100644
--- a/meta/recipes-devtools/python/python3-uritools_6.1.3.bb
+++ b/meta/recipes-devtools/python/python3-uritools_6.1.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/tkem/uritools/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=079933dfba36eb60b5e3512ca0ab61ae"
 
-SRC_URI[sha256sum] = "3a498e7e85ef3249343d5710618d641a414da0fbae6d23053ada7976ee83ea5f"
+SRC_URI[sha256sum] = "5a46002351b745a6910f24167abc1ba0a7f78818121fffb32dbe1fc7767f462f"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============1480187526380524899==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uritools-upgrade-6.1.3-6.1.5.patch"

RnJvbSA5MjRmYTViYjc4N2QxZjFhYTM0ZWM2M2JiZDZlZjIyODk0OGY0MDExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgOCBOb3YgMjAyNiAwNToyMDowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXJpdG9vbHM6IHVwZ3JhZGUgNi4xLjMgLT4gNi4xLjUKCnY2LjEuNSAoMjAyNi0xMS0w
NykKPT09PT09PT09PT09PT09PT09PQoKLSBCb3VuZCBgYHVyaWVuY29kZSgpYGAgbG9va3VwIHRh
YmxlIHVzaW5nIGBgZnVuY3Rvb2xzLmxydV9jYWNoZSgpYGAuCi0gTWlub3IgY29kZSBhbmQgdGVz
dCBpbXByb3ZlbWVudHMuCgp2Ni4xLjQgKDIwMjYtMTEtMDQpCj09PT09PT09PT09PT09PT09PT0K
Ci0gRml4IG5ld2xpbmUgaGFuZGxpbmcgaW4gYGB1cmljb21wb3NlKClgYCBhbmQgYGB1cmlzcGxp
dCgpYGAuCi0gQ29tcGFyZSBzY2hlbWVzIGNhc2UtaW5zZW5zaXRpdmVseSBpbiBub24tc3RyaWN0
IGBgdXJpam9pbigpYGAuCi0gUmVjb2duaXplIGFuIHVwcGVyY2FzZSBgYElQdkZ1dHVyZWBgIHZl
cnNpb24gZmxhZy4KLSBWYXJpb3VzIGRvY3VtZW50YXRpb24gaW1wcm92ZW1lbnRzLgotIE1pbm9y
IHVuaXQgdGVzdCBpbXByb3ZlbWVudHMuCi0gVXBkYXRlIGJ1aWxkIGVudmlyb25tZW50LgotLS0K
IC4uLi97cHl0aG9uMy11cml0b29sc182LjEuMy5iYiA9PiBweXRob24zLXVyaXRvb2xzXzYuMS41
LmJifSAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdXJpdG9v
bHNfNi4xLjMuYmIgPT4gcHl0aG9uMy11cml0b29sc182LjEuNS5iYn0gKDc5JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJpdG9vbHNfNi4xLjMu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJpdG9vbHNfNi4xLjUu
YmIKc2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXVyaXRvb2xzXzYuMS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJpdG9vbHNfNi4xLjUuYmIKaW5kZXggNDdmZGRlYzA0
Ni4uZjg4NmEzYjM4ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXVyaXRvb2xzXzYuMS4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy11cml0b29sc182LjEuNS5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAi
aHR0cHM6Ly9naXRodWIuY29tL3RrZW0vdXJpdG9vbHMvIgogTElDRU5TRSA9ICJNSVQiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0wNzk5MzNkZmJhMzZlYjYwYjVlMzUx
MmNhMGFiNjFhZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNhNDk4ZTdlODVlZjMyNDkzNDNk
NTcxMDYxOGQ2NDFhNDE0ZGEwZmJhZTZkMjMwNTNhZGE3OTc2ZWU4M2VhNWYiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiNWE0NjAwMjM1MWI3NDVhNjkxMGYyNDE2N2FiYzFiYTBhN2Y3ODgxODEyMWZm
ZmIzMmRiZTFmYzc3NjdmNDYyZiIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1
aWxkX21ldGEgcHRlc3QtcHl0aG9uLXB5dGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============1480187526380524899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uritools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uritools/uritools-6.1.3.tar.gz" to "https://files.pythonhosted.org/packages/source/u/uritools/uritools-6.1.5.tar.gz"
packages/x86-64-v3-poky-linux/python3-uritools: PKGV changed from 6.1.3 [default] to 6.1.5 [default]
packages/x86-64-v3-poky-linux/python3-uritools: PV changed from "6.1.3" to "6.1.5"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dbg: PKGV changed from 6.1.3 [default] to 6.1.5 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dbg: PV changed from "6.1.3" to "6.1.5"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dev: PKGV changed from 6.1.3 [default] to 6.1.5 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-dev: PV changed from "6.1.3" to "6.1.5"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-doc: PKGV changed from 6.1.3 [default] to 6.1.5 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-doc: PV changed from "6.1.3" to "6.1.5"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-locale: PKGV changed from 6.1.3 [default] to 6.1.5 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-locale: PV changed from "6.1.3" to "6.1.5"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PKGV changed from 6.1.3 [default] to 6.1.5 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PV changed from "6.1.3" to "6.1.5"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PKGSIZE changed from 50062 to 56253 (+12%)
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-src: PKGV changed from 6.1.3 [default] to 6.1.5 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-src: PV changed from "6.1.3" to "6.1.5"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-staticdev: PKGV changed from 6.1.3 [default] to 6.1.5 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-staticdev: PV changed from "6.1.3" to "6.1.5"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/uritools-6.1.5.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info -> /usr/lib/python3.14/site-packages/uritools-6.1.5.dist-info
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PKGV changed from 6.1.3 [default] to 6.1.5 [default]
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PV changed from "6.1.3" to "6.1.5"
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: PKGSIZE changed from 73198 to 75487 (+3%)
Changes to packages/x86-64-v3-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info moved to /usr/lib/python3.14/site-packages/uritools-6.1.5.dist-info

--===============1480187526380524899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-uritools-changelog.txt"

v6.1.5 (2026-11-07)
===================

- Bound ``uriencode()`` lookup table using ``functools.lru_cache()``.
- Minor code and test improvements.

v6.1.4 (2026-11-04)
===================

- Fix newline handling in ``uricompose()`` and ``urisplit()``.
- Compare schemes case-insensitively in non-strict ``urijoin()``.
- Recognize an uppercase ``IPvFuture`` version flag.
- Various documentation improvements.
- Minor unit test improvements.
- Update build environment.

--===============1480187526380524899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools-ptest: PKGSIZE changed from 50062 to 56253 (+12%)
packages/x86-64-v3-poky-linux/python3-uritools/python3-uritools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/uritools-6.1.5.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info -> /usr/lib/python3.14/site-packages/uritools-6.1.5.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.14/site-packages/uritools-6.1.3.dist-info moved to /usr/lib/python3.14/site-packages/uritools-6.1.5.dist-info

--===============1480187526380524899==--
