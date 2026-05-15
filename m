Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE9BCD4F54
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:34 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34822.1778851228595118131
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=nEW+/2fS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SPbVOqsP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019e2bcba93a-95462a61-4346-41a7-940a-b5c6ba26bf43-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DhW27fDybAklfrOAdAxzn+uePQ6LMsFeefJHlKBx0t0=;
	b=nEW+/2fS5OLm07HTVsEQyjzAnKsG38iN1AKyaKpPQ1WisH7uQx9q9IBRRG4uqiMn
	UOdKwzXXtXSVs/R5UaQjZru3MRX+6mnTB79JBPbmLuY3etm2YJ/SDT+EP7/tDNF0CUS
	5VambLQVmLH9MozD7FVUG0bYrXhB18Kq7Se59A8U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DhW27fDybAklfrOAdAxzn+uePQ6LMsFeefJHlKBx0t0=;
	b=SPbVOqsP7jFLAA0ey6f0G5GmOXTac0nRQBJzqiY8YyHvgoiJIEr7vRmbMZX/GRp2
	NVPA/tpAj/gCJJYLHlm2wh89AkzoP5tHnyT/G7LphYm+zQKd5NlL3MqKhUPgSkV7YSb
	hP4ZLe2jZhvUh/+IruOxDtwWUgZVNGiARl7EigfM=
Content-Type: multipart/mixed; boundary="===============3837123120419997074=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 7.0 SUCCEEDED
Message-ID: <0101019e2bcba93a-95462a61-4346-41a7-940a-b5c6ba26bf43-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237104

--===============3837123120419997074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *btrfs-tools* to *7.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.19.1-7.0.patch
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
From 10d28990c77426113583b54d518194b24cc8e9c4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 07:05:21 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.19.1 -> 7.0

---
 ...d-a-possibility-to-specify-where-python-modules-ar.patch | 6 +++---
 .../{btrfs-tools_6.19.1.bb => btrfs-tools_7.0.bb}           | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.19.1.bb => btrfs-tools_7.0.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 7272c27c6c..ba1dbb7fed 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 7edcee57078769b7752275e0e5f35aefbfefc9eb Mon Sep 17 00:00:00 2001
+From c0dfc5d53fa27cb431b8a1747c3bac7768e7f075 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 96c11830..3f2585cb 100644
+index 4f471ff4..2bcfbf63 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -997,7 +997,7 @@ endif
+@@ -995,7 +995,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.0.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_7.0.bb
index dee1270fa0..72b5575703 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.0.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "fa79dbea32d39ac0ae41a88a079013c7ad2a8a58"
+SRCREV = "9c5987432906daebde23f9703c0f6f90c35fa9da"
 
 PACKAGECONFIG ??= " \
     programs \
-- 
2.47.1


--===============3837123120419997074==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.19.1-7.0.patch"

RnJvbSAxMGQyODk5MGM3NzQyNjExMzU4M2I1NGQ1MTgxOTRiMjRjYzhlOWM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDc6MDU6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
dHJmcy10b29sczogdXBncmFkZSA2LjE5LjEgLT4gNy4wCgotLS0KIC4uLmQtYS1wb3NzaWJpbGl0
eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoIHwgNiArKystLS0KIC4u
Li97YnRyZnMtdG9vbHNfNi4xOS4xLmJiID0+IGJ0cmZzLXRvb2xzXzcuMC5iYn0gICAgICAgICAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL3tidHJmcy10b29sc182
LjE5LjEuYmIgPT4gYnRyZnMtdG9vbHNfNy4wLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3Np
YmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJp
bGl0eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoCmluZGV4IDcyNzJj
MjdjNmMuLmJhMWRiYjdmZWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJm
cy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnktd2hl
cmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0
cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13
aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gN2VkY2Vl
NTcwNzg3NjliNzc1MjI3NWUwZTVmMzVhZWZiZmVmYzllYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gYzBkZmM1ZDUzZmEyN2NiNDMxYjhhMTc0N2MzYmFjNzc2OGU3ZjA3NSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogRGF0ZTogV2VkLCAyMyBNYXkgMjAxOCAyMToyMDozNSArMDMwMAogU3ViamVj
dDogW1BBVENIXSBBZGQgYSBwb3NzaWJpbGl0eSB0byBzcGVjaWZ5IHdoZXJlIHB5dGhvbiBtb2R1
bGVzIGFyZQpAQCAtMTEsMTAgKzExLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5h
dmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQot
aW5kZXggOTZjMTE4MzAuLjNmMjU4NWNiIDEwMDY0NAoraW5kZXggNGY0NzFmZjQuLjJiY2ZiZjYz
IDEwMDY0NAogLS0tIGEvTWFrZWZpbGUKICsrKyBiL01ha2VmaWxlCi1AQCAtOTk3LDcgKzk5Nyw3
IEBAIGVuZGlmCitAQCAtOTk1LDcgKzk5NSw3IEBAIGVuZGlmCiAgaWZlcSAoJChQWVRIT05fQklO
RElOR1MpLDEpCiAgaW5zdGFsbF9weXRob246IGxpYmJ0cmZzdXRpbF9weXRob24KICAJJChRKWNk
IGxpYmJ0cmZzdXRpbC9weXRob247IFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9idHJmcy10b29scy9idHJmcy10b29sc182LjE5LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182
LjE5LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJm
cy10b29sc183LjAuYmIKaW5kZXggZGVlMTI3MGZhMC4uNzJiNTU3NTcwMyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMTkuMS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNy4wLmJi
CkBAIC0xOCw3ICsxOCw3IEBAIERFUEVORFMgPSAidXRpbC1saW51eCB6bGliIgogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL2tkYXZlL2J0cmZzLXByb2dzLmdpdDticmFuY2g9bWFzdGVyO3By
b3RvY29sPWh0dHBzO3RhZz12JHtQVn0gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1BZGQtYS1w
b3NzaWJpbGl0eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoIFwKICAg
ICAgICAgICAgIgotU1JDUkVWID0gImZhNzlkYmVhMzJkMzlhYzBhZTQxYTg4YTA3OTAxM2M3YWQy
YThhNTgiCitTUkNSRVYgPSAiOWM1OTg3NDMyOTA2ZGFlYmRlMjNmOTcwM2MwZjZmOTBjMzVmYTlk
YSIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiBcCiAgICAgcHJvZ3JhbXMgXAotLSAKMi40Ny4xCgo=

--===============3837123120419997074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.19.1 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 27562504 to 27625640 (+0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.19.1" to "7.0"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.19.1 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 166890 to 166884 (-0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.19.1" to "7.0"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.19.1 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.19.1" to "7.0"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.19.1 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.19.1" to "7.0"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/6.19.1/include -> /usr/src/debug/btrfs-tools/7.0/include, directory renamed /usr/src/debug/btrfs-tools/6.19.1/kernel-shared -> /usr/src/debug/btrfs-tools/7.0/kernel-shared, directory renamed /usr/src/debug/btrfs-tools/6.19.1/libbtrfsutil -> /usr/src/debug/btrfs-tools/7.0/libbtrfsutil, directory renamed /usr/src/debug/btrfs-tools/6.19.1/check -> /usr/src/debug/btrfs-tools/7.0/check, directory renamed /usr/src/debug/btrfs-tools/6.19.1/cmds -> /usr/src/debug/btrfs-tools/7.0/cmds, directory renamed /usr/src/debug/btrfs-tools/6.19.1/common -> /usr/src/debug/btrfs-tools/7.0/common, directory renamed /usr/src/debug/btrfs-tools/6.19.1/kernel-shared/uapi -> /usr/src/debug/btrfs-tools/7.0/kernel-shared/uapi, directory renamed /usr/src/debug/btrfs-tools/6.19.1/convert -> /usr/src/debug/btrfs-tools/7.0/convert, directory renamed /usr/src/debug/btrfs-tools/6.19.1/mkfs -> /usr/src/debu
 g/btrfs-tools/7.0/mkfs, directory renamed /usr/src/debug/btrfs-tools/6.19.1/crypto -> /usr/src/debug/btrfs-tools/7.0/crypto, directory renamed /usr/src/debug/btrfs-tools/6.19.1/libbtrfs -> /usr/src/debug/btrfs-tools/7.0/libbtrfs, directory renamed /usr/src/debug/btrfs-tools/6.19.1 -> /usr/src/debug/btrfs-tools/7.0, directory renamed /usr/src/debug/btrfs-tools/6.19.1/kernel-lib -> /usr/src/debug/btrfs-tools/7.0/kernel-lib, directory renamed /usr/src/debug/btrfs-tools/6.19.1/image -> /usr/src/debug/btrfs-tools/7.0/image, removed "/usr/src/debug/btrfs-tools/6.19.1/tune/change-csum.c /usr/src/debug/btrfs-tools/6.19.1/tune/seeding.c /usr/src/debug/btrfs-tools/6.19.1/tune/convert-bgt.c /usr/src/debug/btrfs-tools/6.19.1/tune/tune.h /usr/src/debug/btrfs-tools/6.19.1/tune/main.c /usr/src/debug/btrfs-tools/6.19.1/tune/quota.c /usr/src/debug/btrfs-tools/6.19.1/tune/change-uuid.c /usr/src/debug/btrfs-tools/6.19.1/tune/change-metadata-uuid.c", added "/usr/src/debug/btrfs-tools/7.0/tune/quota.c /
 usr/src/debug/btrfs-tools/7.0/tune/convert-bgt.c /usr/src/debug/btrfs-tools/7.0/tune/tune.h /usr/src/debug/btrfs-tools/7.0/tune/change-uuid.c /usr/src/debug/btrfs-tools/7.0/tune/change-csum.c /usr/src/debug/btrfs-tools/7.0/tune/main.c /usr/src/debug/btrfs-tools/7.0/tune/convert-remap-tree.c /usr/src/debug/btrfs-tools/7.0/tune/change-metadata-uuid.c /usr/src/debug/btrfs-tools/7.0/tune/seeding.c"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.19.1 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4317762 to 4327127 (+0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.19.1" to "7.0"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.19.1 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.19.1" to "7.0"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info -> /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.19.1 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 5984491 to 5992680 (+0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.19.1" to "7.0"
packages/x86-64-v3-poky-linux/btrfs-tools: SRC_URI changed from "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v6.19.1 file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch" to "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v7.0 file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch"
packages/x86-64-v3-poky-linux/btrfs-tools: PKGV changed from 6.19.1 [default] to 7.0 [default]
packages/x86-64-v3-poky-linux/btrfs-tools: PV changed from "6.19.1" to "7.0"
Changes to packages/x86-64-v3-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info was added
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info/dependency_links.txt was added
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info/PKG-INFO was added
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info/SOURCES.txt was added
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info/dependency_links.txt was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info/PKG-INFO was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info/SOURCES.txt was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info/top_level.txt was removed

--===============3837123120419997074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info -> /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info
Changes to packages/x86-64-v3-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info was added
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info/dependency_links.txt was added
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info/PKG-INFO was added
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info/SOURCES.txt was added
  /usr/lib/python3.14/site-packages/btrfsutil-7.0-py3.14.egg-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info/dependency_links.txt was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info/PKG-INFO was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info/SOURCES.txt was removed
  /usr/lib/python3.14/site-packages/btrfsutil-6.19.1-py3.14.egg-info/top_level.txt was removed

--===============3837123120419997074==--

