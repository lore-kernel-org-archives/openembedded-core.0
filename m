Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1099.1792734604992743433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 22:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ke/mtZcm;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=g1BRks22;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a1674f2b83-e1f77f36-34b9-4ebf-b70d-446eaec76e88-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792734604;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kuZbzj03Zkf7CHUXOWFaywG04P09Xq7jodF+1itfXZU=;
	b=Ke/mtZcmMKEgV4SISAe6yQP8/uHuYdQKe+j97K+nohfCKPZn/caRWtOKJfaWR35N
	yky93lw+1dItE/0E0JKW7VwM+7Ryj900LAuZkXtSZROv+s6VUY/Kp8tac1znriXYZpo
	QuF+0ICoaAdc4Xg2KQbl0WCEPhcsMrNLvEQk/+/A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792734604;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kuZbzj03Zkf7CHUXOWFaywG04P09Xq7jodF+1itfXZU=;
	b=g1BRks223BFaVDDoIMWVOj+1TLLWX7ZK3UrGs0DOxog6wr2iBBAYJ3svqOnUh9IH
	O0+lMMfUGeluMlgPun3p1NK6M4Nt3/mWXupy1ZIq97MRgLddeShGciUFrI7BxSbR+T0
	lB3RmExwxCau9cx74pQWY2Djd2+AV06ycijju6Uc=
Content-Type: multipart/mixed; boundary="===============1387603377563148590=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycparser: upgrading to 3.12 SUCCEEDED
Message-ID: <010101a1674f2b83-e1f77f36-34b9-4ebf-b70d-446eaec76e88-000000@us-west-2.amazonses.com>
Date: Fri, 23 Oct 2026 05:50:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.23-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 05:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248478

--===============1387603377563148590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycparser* to *3.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycparser-upgrade-3.11-3.12.patch
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
From dc7e8d551f2e55db76397f94d06fcbd4a56b37dc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 23 Oct 2026 05:24:42 +0000
Subject: [PATCH] python3-pycparser: upgrade 3.11 -> 3.12

---
 .../{python3-pycparser_3.11.bb => python3-pycparser_3.12.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycparser_3.11.bb => python3-pycparser_3.12.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pycparser_3.11.bb b/meta/recipes-devtools/python/python3-pycparser_3.12.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pycparser_3.11.bb
rename to meta/recipes-devtools/python/python3-pycparser_3.12.bb
index adeb882a3e..a08d34ba56 100644
--- a/meta/recipes-devtools/python/python3-pycparser_3.11.bb
+++ b/meta/recipes-devtools/python/python3-pycparser_3.12.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eliben/pycparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c453675224ee9a35b46135214d26c055"
 
-SRC_URI[sha256sum] = "d875f09c3507d00e1aba0eecc6dcadc1352f30fff09dc6bff2f1c2935e97c2bc"
+SRC_URI[sha256sum] = "f03387877eab82ce01bbdfd0ba7252ee55a90b1c708d5129e2ce915475cf1db6"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============1387603377563148590==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycparser-upgrade-3.11-3.12.patch"

RnJvbSBkYzdlOGQ1NTFmMmU1NWRiNzYzOTdmOTRkMDZmY2JkNGE1NmIzN2RjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjMgT2N0IDIwMjYgMDU6MjQ6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Y3BhcnNlcjogdXBncmFkZSAzLjExIC0+IDMuMTIKCi0tLQogLi4uL3tweXRob24z
LXB5Y3BhcnNlcl8zLjExLmJiID0+IHB5dGhvbjMtcHljcGFyc2VyXzMuMTIuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWNwYXJzZXJfMy4xMS5iYiA9
PiBweXRob24zLXB5Y3BhcnNlcl8zLjEyLmJifSAoODMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNwYXJzZXJfMy4xMS5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNwYXJzZXJfMy4xMi5iYgpzaW1pbGFyaXR5
IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHljcGFyc2VyXzMuMTEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1weWNwYXJzZXJfMy4xMi5iYgppbmRleCBhZGViODgyYTNlLi5hMDhkMzRiYTU2
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcGFy
c2VyXzMuMTEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5
Y3BhcnNlcl8zLjEyLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1
Yi5jb20vZWxpYmVuL3B5Y3BhcnNlciIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIgogTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YzQ1MzY3NTIyNGVlOWEzNWI0NjEzNTIx
NGQyNmMwNTUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkODc1ZjA5YzM1MDdkMDBlMWFiYTBl
ZWNjNmRjYWRjMTM1MmYzMGZmZjA5ZGM2YmZmMmYxYzI5MzVlOTdjMmJjIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gImYwMzM4Nzg3N2VhYjgyY2UwMWJiZGZkMGJhNzI1MmVlNTVhOTBiMWM3MDhkNTEy
OWUyY2U5MTU0NzVjZjFkYjYiCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWls
ZF9tZXRhCiAKLS0gCjIuNDcuMQoK

--===============1387603377563148590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pycparser: PKGV changed from 3.11 [default] to 3.12 [default]
packages/x86-64-v3-poky-linux/python3-pycparser: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycparser/pycparser-3.11.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycparser/pycparser-3.12.tar.gz"
packages/x86-64-v3-poky-linux/python3-pycparser: PV changed from "3.11" to "3.12"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-dbg: PKGV changed from 3.11 [default] to 3.12 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-dbg: PV changed from "3.11" to "3.12"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-dev: PKGV changed from 3.11 [default] to 3.12 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-dev: PV changed from "3.11" to "3.12"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-doc: PKGV changed from 3.11 [default] to 3.12 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-doc: PV changed from "3.11" to "3.12"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-locale: PKGV changed from 3.11 [default] to 3.12 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-locale: PV changed from "3.11" to "3.12"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-src: PKGV changed from 3.11 [default] to 3.12 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-src: PV changed from "3.11" to "3.12"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-staticdev: PKGV changed from 3.11 [default] to 3.12 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser-staticdev: PV changed from "3.11" to "3.12"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PKGV changed from 3.11 [default] to 3.12 [default]
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PKGSIZE changed from 493431 to 599855 (+22%)
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PV changed from "3.11" to "3.12"
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info -> /usr/lib/python3.14/site-packages/pycparser-3.12.dist-info, directory renamed /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info/licenses -> /usr/lib/python3.14/site-packages/pycparser-3.12.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pycparser (sysroot):
  /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info moved to /usr/lib/python3.14/site-packages/pycparser-3.12.dist-info

--===============1387603377563148590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info -> /usr/lib/python3.14/site-packages/pycparser-3.12.dist-info, directory renamed /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info/licenses -> /usr/lib/python3.14/site-packages/pycparser-3.12.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pycparser/python3-pycparser: PKGSIZE changed from 493431 to 599855 (+22%)
Changes to packages/x86-64-v3-poky-linux/python3-pycparser (sysroot):
  /usr/lib/python3.14/site-packages/pycparser-3.11.dist-info moved to /usr/lib/python3.14/site-packages/pycparser-3.12.dist-info

--===============1387603377563148590==--
