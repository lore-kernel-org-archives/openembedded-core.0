Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE1DC48BF9
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:34:01 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.88281.1705340029787030628
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Y9qEXhGL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TzrdDfjg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018d0e2fc860-fa45a01f-08a1-45f6-9176-f7bd003b192d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4lJkm2HCTVYHyqxsSotqXkhtkXh6vMlZq9OrKXdLsWA=;
	b=Y9qEXhGL0uETt6Iq5NVvyYlt9hgg7zoc3o2Gunx80v0y51PjepLocED0paP6YsqC
	sg5lV/679bt3wpKwTVTlygBkTkpOmFJ2frmKawWc3vdx6xcGncLBJQq7Dea1oDSP0VY
	0V2GTg7asgxygmoerz9eGVGxD3XGVP72i3NwQfFY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4lJkm2HCTVYHyqxsSotqXkhtkXh6vMlZq9OrKXdLsWA=;
	b=TzrdDfjgW2vuMvMXIWc2tTvCb6XtoCf3rMhdCou6WSFx5fDfzEUy+nQYW5kHYSjZ
	LLvHRLURZVS5LTSCmi1XgKgWDN0uAfw3JJuKjXWU6hVVx4dwJi/n/6TzyOSJXdFsYyw
	CuooS8pNZ60qLQBErX5rjS9GZmltkn9akcLwhDwo=
Content-Type: multipart/mixed; boundary="===============9188650499007447854=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.6.3 SUCCEEDED
Message-ID: <0101018d0e2fc860-fa45a01f-08a1-45f6-9176-f7bd003b192d-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193716

--===============9188650499007447854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.6.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.5.3-6.6.3.patch
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
From 2deda554e1c04528be31db2ed3c3a74699416539 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 06:01:09 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.5.3 -> 6.6.3

---
 ...-a-possibility-to-specify-where-python-modules-ar.patch | 7 ++++---
 .../{btrfs-tools_6.5.3.bb => btrfs-tools_6.6.3.bb}         | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.5.3.bb => btrfs-tools_6.6.3.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 5846f04d1a..287888b62e 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From d3adfc21c9cc264bd191722f102963cbc4794259 Mon Sep 17 00:00:00 2001
+From 17fd0ef090e5df2b26069f160873444960aa6322 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -6,15 +6,16 @@ Subject: [PATCH] Add a possibility to specify where python modules are
 
 Upstream-Status: Inappropriate [oe-core specific to solve multilib use case]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 1697794c..8ab38818 100644
+index 374f59b9..ed083f6b 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -651,7 +651,7 @@ endif
+@@ -959,7 +959,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.6.3.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.6.3.bb
index 873d5e7a14..ef40f553fb 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.6.3.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "a45c360b64660477c726e192d9e92ceb73a50f80"
+SRCREV = "92e18dbce521789e02057d406769b073d474fa72"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.42.0


--===============9188650499007447854==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.5.3-6.6.3.patch"

RnJvbSAyZGVkYTU1NGUxYzA0NTI4YmUzMWRiMmVkM2MzYTc0Njk5NDE2NTM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMDY6MDE6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
dHJmcy10b29sczogdXBncmFkZSA2LjUuMyAtPiA2LjYuMwoKLS0tCiAuLi4tYS1wb3NzaWJpbGl0
eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoIHwgNyArKysrLS0tCiAu
Li4ve2J0cmZzLXRvb2xzXzYuNS4zLmJiID0+IGJ0cmZzLXRvb2xzXzYuNi4zLmJifSAgICAgICAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL3tidHJmcy10b29sc182
LjUuMy5iYiA9PiBidHJmcy10b29sc182LjYuMy5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3Nz
aWJpbGl0eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2li
aWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaAppbmRleCA1ODQ2
ZjA0ZDFhLi4yODc4ODhiNjJlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRy
ZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVjaWZ5LXdo
ZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9i
dHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnkt
d2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQzYWRm
YzIxYzljYzI2NGJkMTkxNzIyZjEwMjk2M2NiYzQ3OTQyNTkgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDE3ZmQwZWYwOTBlNWRmMmIyNjA2OWYxNjA4NzM0NDQ5NjBhYTYzMjIgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMjMgTWF5IDIwMTggMjE6MjA6MzUgKzAzMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gQWRkIGEgcG9zc2liaWxpdHkgdG8gc3BlY2lmeSB3aGVyZSBweXRob24gbW9k
dWxlcyBhcmUKQEAgLTYsMTUgKzYsMTYgQEAgU3ViamVjdDogW1BBVENIXSBBZGQgYSBwb3NzaWJp
bGl0eSB0byBzcGVjaWZ5IHdoZXJlIHB5dGhvbiBtb2R1bGVzIGFyZQogCiBVcHN0cmVhbS1TdGF0
dXM6IEluYXBwcm9wcmlhdGUgW29lLWNvcmUgc3BlY2lmaWMgdG8gc29sdmUgbXVsdGlsaWIgdXNl
IGNhc2VdCiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdt
YWlsLmNvbT4KKwogLS0tCiAgTWFrZWZpbGUgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2Vm
aWxlCi1pbmRleCAxNjk3Nzk0Yy4uOGFiMzg4MTggMTAwNjQ0CitpbmRleCAzNzRmNTliOS4uZWQw
ODNmNmIgMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZQogKysrIGIvTWFrZWZpbGUKLUBAIC02NTEsNyAr
NjUxLDcgQEAgZW5kaWYKK0BAIC05NTksNyArOTU5LDcgQEAgZW5kaWYKICBpZmVxICgkKFBZVEhP
Tl9CSU5ESU5HUyksMSkKICBpbnN0YWxsX3B5dGhvbjogbGliYnRyZnN1dGlsX3B5dGhvbgogIAkk
KFEpY2QgbGliYnRyZnN1dGlsL3B5dGhvbjsgXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuNS4zLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuNi4zLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10
b29sc182LjUuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xz
L2J0cmZzLXRvb2xzXzYuNi4zLmJiCmluZGV4IDg3M2Q1ZTdhMTQuLmVmNDBmNTUzZmIgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjUu
My5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNf
Ni42LjMuYmIKQEAgLTE4LDcgKzE4LDcgQEAgREVQRU5EUyA9ICJ1dGlsLWxpbnV4IHpsaWIiCiBT
UkNfVVJJID0gImdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9r
ZGF2ZS9idHJmcy1wcm9ncy5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0
aG9uLW1vZHVsZXMtYXIucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiYTQ1YzM2MGI2
NDY2MDQ3N2M3MjZlMTkyZDllOTJjZWI3M2E1MGY4MCIKK1NSQ1JFViA9ICI5MmUxOGRiY2U1MjE3
ODllMDIwNTdkNDA2NzY5YjA3M2Q0NzRmYTcyIgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogUEFD
S0FHRUNPTkZJRyA/Pz0gIiBcCi0tIAoyLjQyLjAKCg==

--===============9188650499007447854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.5.3-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.6.3-py3.11.egg-info

--===============9188650499007447854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.5.3 [default] to 6.6.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.5.3" to "6.6.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 24925904 to 25012304 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.5.3 [default] to 6.6.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.5.3" to "6.6.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.5.3 [default] to 6.6.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.5.3" to "6.6.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.5.3 [default] to 6.6.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.5.3" to "6.6.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.5.3 [default] to 6.6.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.5.3" to "6.6.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4123002 to 4144114 (+1%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.5.3 [default] to 6.6.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.5.3" to "6.6.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.5.3 [default] to 6.6.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.5.3" to "6.6.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 5751116 to 5783884 (+1%)
packages/core2-64-poky-linux/btrfs-tools: PKGV changed from 6.5.3 [default] to 6.6.3 [default]
packages/core2-64-poky-linux/btrfs-tools: PV changed from "6.5.3" to "6.6.3"
Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.5.3-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.6.3-py3.11.egg-info

--===============9188650499007447854==--

