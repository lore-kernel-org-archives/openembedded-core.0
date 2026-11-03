Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5335.1793687202650649923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 22:26:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=lxJPKRW5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BuEZS5pf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1a016a7ae-43d967ef-7ac8-4038-8584-506a6ec60a41-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793687201;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IaIT7j/W9F+m1Q96u6kLyyFhIlc9TkHh73n3F6FDfp4=;
	b=lxJPKRW5YcdQ2EesDj6Jj+ZnsD/iACxrWuBs/8MbGT+nO2x53hMF8JqZwQ1QLqjH
	qqvLg+nIFpGhps+A1Z61Jb8x+khRHfiYt/9mqDeEGoFp/Hl89Mr0wK01ILdJtkfVUWd
	KO9pZ7SvKYuREbl2H2I1ztVcUFeNCtn2TTdB21VU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793687201;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IaIT7j/W9F+m1Q96u6kLyyFhIlc9TkHh73n3F6FDfp4=;
	b=BuEZS5pfOO5Lhq7+tYPWNabN9jCXGz+f/fHmWiVehzASDKwIe3jT+gwWiGg6hVf9
	nspgVLlrbpuSXmoogCxbJsXe63knh5r/WZsctk5mT0hkXnYdqp8oYIZEwsw7nbJifw6
	lsMBP2dTxp1ePG81cPb60cHMBjj8Q4X1mjtUAV3s=
Content-Type: multipart/mixed; boundary="===============2564019062152291384=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markupsafe: upgrading to 3.0.4 SUCCEEDED
Message-ID: <010101a1a016a7ae-43d967ef-7ac8-4038-8584-506a6ec60a41-000000@us-west-2.amazonses.com>
Date: Tue, 3 Nov 2026 06:26:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.03-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 06:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249235

--===============2564019062152291384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-markupsafe* to *3.0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markupsafe-upgrade-3.0.3-3.0.4.patch
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
From 900e05b398558a13eed801b29fee270c82eed019 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 3 Nov 2026 05:43:28 +0000
Subject: [PATCH] python3-markupsafe: upgrade 3.0.3 -> 3.0.4

Version 3.0.4
-------------

Released 2026-10-02

-   Build Python 3.15, armv7l, ppc64le, Android, and iOS wheels.
-   Improve performance of ``striptags``. :issue:`521`
---
 ...{python3-markupsafe_3.0.3.bb => python3-markupsafe_3.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markupsafe_3.0.3.bb => python3-markupsafe_3.0.4.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb b/meta/recipes-devtools/python/python3-markupsafe_3.0.4.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
rename to meta/recipes-devtools/python/python3-markupsafe_3.0.4.bb
index 58c03766c6..63b9fb4801 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_3.0.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "722695808f4b6457b320fdc131280796bdceb04ab50fe1795cd540799ebe1698"
+SRC_URI[sha256sum] = "2e9ad7dd851bf45fab9f75cbff4cb493fee9979e8d8c7c9c3ee119022518edd6"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============2564019062152291384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-markupsafe: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/markupsafe/markupsafe-3.0.3.tar.gz" to "https://files.pythonhosted.org/packages/source/m/markupsafe/markupsafe-3.0.4.tar.gz"
packages/x86-64-v3-poky-linux/python3-markupsafe: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/python3-markupsafe: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-dbg: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-dbg: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-dev: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-dev: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-doc: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-doc: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-locale: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-locale: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-ptest: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-ptest: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-src: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-src: FILELIST: directory renamed /usr/src/debug/python3-markupsafe/3.0.3/src/markupsafe -> /usr/src/debug/python3-markupsafe/3.0.4/src/markupsafe
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-src: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-staticdev: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe-staticdev: PV changed from "3.0.3" to "3.0.4"
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe: PKGSIZE changed from 65789 to 66079 (+0%)
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe: PKGV changed from 3.0.3 [default] to 3.0.4 [default]
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe: FILELIST: directory renamed /usr/lib/python3.14/site-packages/markupsafe-3.0.3.dist-info -> /usr/lib/python3.14/site-packages/markupsafe-3.0.4.dist-info, directory renamed /usr/lib/python3.14/site-packages/markupsafe-3.0.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/markupsafe-3.0.4.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe: PV changed from "3.0.3" to "3.0.4"
Changes to packages/x86-64-v3-poky-linux/python3-markupsafe (sysroot):
  /usr/lib/python3.14/site-packages/markupsafe-3.0.3.dist-info moved to /usr/lib/python3.14/site-packages/markupsafe-3.0.4.dist-info

--===============2564019062152291384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-markupsafe-changelog.txt"

Version 3.0.4
-------------

Released 2026-10-02

-   Build Python 3.15, armv7l, ppc64le, Android, and iOS wheels.
-   Improve performance of ``striptags``. :issue:`521`

--===============2564019062152291384==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markupsafe-upgrade-3.0.3-3.0.4.patch"

RnJvbSA5MDBlMDViMzk4NTU4YTEzZWVkODAxYjI5ZmVlMjcwYzgyZWVkMDE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMyBOb3YgMjAyNiAwNTo0MzoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWFya3Vwc2FmZTogdXBncmFkZSAzLjAuMyAtPiAzLjAuNAoKVmVyc2lvbiAzLjAuNAot
LS0tLS0tLS0tLS0tCgpSZWxlYXNlZCAyMDI2LTEwLTAyCgotICAgQnVpbGQgUHl0aG9uIDMuMTUs
IGFybXY3bCwgcHBjNjRsZSwgQW5kcm9pZCwgYW5kIGlPUyB3aGVlbHMuCi0gICBJbXByb3ZlIHBl
cmZvcm1hbmNlIG9mIGBgc3RyaXB0YWdzYGAuIDppc3N1ZTpgNTIxYAotLS0KIC4uLntweXRob24z
LW1hcmt1cHNhZmVfMy4wLjMuYmIgPT4gcHl0aG9uMy1tYXJrdXBzYWZlXzMuMC40LmJifSB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbWFya3Vwc2FmZV8zLjAuMy5i
YiA9PiBweXRob24zLW1hcmt1cHNhZmVfMy4wLjQuYmJ9ICg4MSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmt1cHNhZmVfMy4wLjMuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya3Vwc2FmZV8zLjAuNC5iYgpz
aW1pbGFyaXR5IGluZGV4IDgxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtbWFya3Vwc2FmZV8zLjAuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmt1cHNhZmVfMy4wLjQuYmIKaW5kZXggNThjMDM3NjZj
Ni4uNjNiOWZiNDgwMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLW1hcmt1cHNhZmVfMy4wLjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLW1hcmt1cHNhZmVfMy4wLjQuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdF
ID0gImh0dHA6Ly9naXRodWIuY29tL21pdHN1aGlrby9tYXJrdXBzYWZlIgogTElDRU5TRSA9ICJC
U0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9
ZmZlZmZhNTljOTBjOWM0YTAzM2M3NTc0ZjhmM2ZiNzUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICI3MjI2OTU4MDhmNGI2NDU3YjMyMGZkYzEzMTI4MDc5NmJkY2ViMDRhYjUwZmUxNzk1Y2Q1NDA3
OTllYmUxNjk4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJlOWFkN2RkODUxYmY0NWZhYjlmNzVj
YmZmNGNiNDkzZmVlOTk3OWU4ZDhjN2M5YzNlZTExOTAyMjUxOGVkZDYiCiAKIGluaGVyaXQgcHlw
aSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhIHB0ZXN0LXB5dGhvbi1weXRlc3QKIAotLSAK
Mi40Ny4xCgo=

--===============2564019062152291384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-markupsafe/python3-markupsafe: FILELIST: directory renamed /usr/lib/python3.14/site-packages/markupsafe-3.0.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/markupsafe-3.0.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/markupsafe-3.0.3.dist-info -> /usr/lib/python3.14/site-packages/markupsafe-3.0.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-markupsafe (sysroot):
  /usr/lib/python3.14/site-packages/markupsafe-3.0.3.dist-info moved to /usr/lib/python3.14/site-packages/markupsafe-3.0.4.dist-info

--===============2564019062152291384==--
