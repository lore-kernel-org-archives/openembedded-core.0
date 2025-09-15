Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A40CAC5BA
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:48 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.30919.1757937278907563967
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=K0B94nfb;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fsLVAfc/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101994d3a1d85-90e9c164-5560-48d6-9839-238b7406918b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937278;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=U453vhr6cMob7eLX7ObOPC6h3IyUqkMbiCh3lugQ9z4=;
	b=K0B94nfbmjWOLKwxbshSl0g1+ZKv5+2ik9HAdjeHjua2FRgakT3LBp4S3f+hF2ZU
	aSD80Orlo628e+reNncdKDB2aIw+5kYZ9+Ral+qhwCJL5YbczvYBmh5bY+SIJ22gmV5
	D4sCEE4ehJ+tW9QDMU/u1E5IocfeIGwLn06c2ISM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937278;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=U453vhr6cMob7eLX7ObOPC6h3IyUqkMbiCh3lugQ9z4=;
	b=fsLVAfc/gDzcUoBcAsQmKTRMdPKn1Zt/JZR1xB6c8ZDzXHVVYol1tQHXuKqagIx6
	avkZfQEsvJauJNT/3b7izcVMPgFzjT2tuJsSBwNJfGwD2I53ePmc1wzwuAzXPpgPx/0
	8yPL90WPVbJyjrSXL9eX05FH5BXdsidiMQVwju04=
Content-Type: multipart/mixed; boundary="===============0138238192056111448=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.16.1 SUCCEEDED
Message-ID: <010101994d3a1d85-90e9c164-5560-48d6-9839-238b7406918b-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223414

--===============0138238192056111448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *btrfs-tools* to *6.16.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.16-6.16.1.patch
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
From d5eaf52b19dd3b53103473881aedc99e62a30614 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 07:45:21 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.16 -> 6.16.1

---
 ...d-a-possibility-to-specify-where-python-modules-ar.patch | 6 +++---
 .../{btrfs-tools_6.16.bb => btrfs-tools_6.16.1.bb}          | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.16.bb => btrfs-tools_6.16.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 2cd66d2722..0172834c83 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 030ec81c0dac1e067faf49924d5631bb22ccc90d Mon Sep 17 00:00:00 2001
+From 3e8395e9c1238ce015a2a0bf9c20e94376e13119 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 7e36aa42..edff7d5b 100644
+index 7bc22466..0c4b0a88 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -996,7 +996,7 @@ endif
+@@ -997,7 +997,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.1.bb
index ef809d384b..f865972488 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.1.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "54694de98fdc4ea5678cdd77b920c044bbf64f26"
+SRCREV = "7ab197efaaebecf30ce22baa4f459a7511461c0f"
 
 PACKAGECONFIG ??= " \
     programs \
-- 
2.47.1


--===============0138238192056111448==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.16-6.16.1.patch"

RnJvbSBkNWVhZjUyYjE5ZGQzYjUzMTAzNDczODgxYWVkYzk5ZTYyYTMwNjE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMDc6NDU6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
dHJmcy10b29sczogdXBncmFkZSA2LjE2IC0+IDYuMTYuMQoKLS0tCiAuLi5kLWEtcG9zc2liaWxp
dHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCB8IDYgKysrLS0tCiAu
Li4ve2J0cmZzLXRvb2xzXzYuMTYuYmIgPT4gYnRyZnMtdG9vbHNfNi4xNi4xLmJifSAgICAgICAg
ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy97YnRyZnMtdG9vbHNf
Ni4xNi5iYiA9PiBidHJmcy10b29sc182LjE2LjEuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9z
c2liaWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3Np
YmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2gKaW5kZXggMmNk
NjZkMjcyMi4uMDE3MjgzNGM4MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0
cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13
aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
YnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVjaWZ5
LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMzBl
YzgxYzBkYWMxZTA2N2ZhZjQ5OTI0ZDU2MzFiYjIyY2NjOTBkIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSAzZTgzOTVlOWMxMjM4Y2UwMTVhMmEwYmY5YzIwZTk0Mzc2ZTEzMTE5IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZp
bkBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDIzIE1heSAyMDE4IDIxOjIwOjM1ICswMzAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIEFkZCBhIHBvc3NpYmlsaXR5IHRvIHNwZWNpZnkgd2hlcmUgcHl0aG9uIG1v
ZHVsZXMgYXJlCkBAIC0xMSwxMCArMTEsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxl
Ci1pbmRleCA3ZTM2YWE0Mi4uZWRmZjdkNWIgMTAwNjQ0CitpbmRleCA3YmMyMjQ2Ni4uMGM0YjBh
ODggMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZQogKysrIGIvTWFrZWZpbGUKLUBAIC05OTYsNyArOTk2
LDcgQEAgZW5kaWYKK0BAIC05OTcsNyArOTk3LDcgQEAgZW5kaWYKICBpZmVxICgkKFBZVEhPTl9C
SU5ESU5HUyksMSkKICBpbnN0YWxsX3B5dGhvbjogbGliYnRyZnN1dGlsX3B5dGhvbgogIAkkKFEp
Y2QgbGliYnRyZnN1dGlsL3B5dGhvbjsgXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMTYuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4xNi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTgl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29s
c182LjE2LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRy
ZnMtdG9vbHNfNi4xNi4xLmJiCmluZGV4IGVmODA5ZDM4NGIuLmY4NjU5NzI0ODggMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjE2LmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjE2
LjEuYmIKQEAgLTE4LDcgKzE4LDcgQEAgREVQRU5EUyA9ICJ1dGlsLWxpbnV4IHpsaWIiCiBTUkNf
VVJJID0gImdpdDovL2dpdGh1Yi5jb20va2RhdmUvYnRyZnMtcHJvZ3MuZ2l0O2JyYW5jaD1tYXN0
ZXI7cHJvdG9jb2w9aHR0cHM7dGFnPXYke1BWfSBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUFk
ZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2gg
XAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiNTQ2OTRkZTk4ZmRjNGVhNTY3OGNkZDc3YjkyMGMw
NDRiYmY2NGYyNiIKK1NSQ1JFViA9ICI3YWIxOTdlZmFhZWJlY2YzMGNlMjJiYWE0ZjQ1OWE3NTEx
NDYxYzBmIgogCiBQQUNLQUdFQ09ORklHID8/PSAiIFwKICAgICBwcm9ncmFtcyBcCi0tIAoyLjQ3
LjEKCg==

--===============0138238192056111448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.16" to "6.16.1"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 27118320 to 27168304 (+0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.16 [default] to 6.16.1 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.16" to "6.16.1"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 166886 to 166890 (+0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.16 [default] to 6.16.1 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.16" to "6.16.1"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.16 [default] to 6.16.1 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.16" to "6.16.1"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.16 [default] to 6.16.1 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.16" to "6.16.1"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4256836 to 4267675 (+0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.16 [default] to 6.16.1 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.16" to "6.16.1"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.16 [default] to 6.16.1 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.16" to "6.16.1"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 5881343 to 5905921 (+0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.16 [default] to 6.16.1 [default]
packages/x86-64-v3-poky-linux/btrfs-tools: PV changed from "6.16" to "6.16.1"
packages/x86-64-v3-poky-linux/btrfs-tools: SRC_URI changed from "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v6.16 file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch" to "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v6.16.1 file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch"
packages/x86-64-v3-poky-linux/btrfs-tools: PKGV changed from 6.16 [default] to 6.16.1 [default]
Changes to packages/x86-64-v3-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.13/site-packages/btrfsutil-6.16.1-py3.13.egg-info was added
  /usr/lib/python3.13/site-packages/btrfsutil-6.16.1-py3.13.egg-info/dependency_links.txt was added
  /usr/lib/python3.13/site-packages/btrfsutil-6.16.1-py3.13.egg-info/PKG-INFO was added
  /usr/lib/python3.13/site-packages/btrfsutil-6.16.1-py3.13.egg-info/SOURCES.txt was added
  /usr/lib/python3.13/site-packages/btrfsutil-6.16.1-py3.13.egg-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/btrfsutil-6.16-py3.13.egg-info was removed
  /usr/lib/python3.13/site-packages/btrfsutil-6.16-py3.13.egg-info/dependency_links.txt was removed
  /usr/lib/python3.13/site-packages/btrfsutil-6.16-py3.13.egg-info/PKG-INFO was removed
  /usr/lib/python3.13/site-packages/btrfsutil-6.16-py3.13.egg-info/SOURCES.txt was removed
  /usr/lib/python3.13/site-packages/btrfsutil-6.16-py3.13.egg-info/top_level.txt was removed

--===============0138238192056111448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.13/site-packages/btrfsutil-6.16.1-py3.13.egg-info was added
  /usr/lib/python3.13/site-packages/btrfsutil-6.16.1-py3.13.egg-info/dependency_links.txt was added
  /usr/lib/python3.13/site-packages/btrfsutil-6.16.1-py3.13.egg-info/PKG-INFO was added
  /usr/lib/python3.13/site-packages/btrfsutil-6.16.1-py3.13.egg-info/SOURCES.txt was added
  /usr/lib/python3.13/site-packages/btrfsutil-6.16.1-py3.13.egg-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/btrfsutil-6.16-py3.13.egg-info was removed
  /usr/lib/python3.13/site-packages/btrfsutil-6.16-py3.13.egg-info/dependency_links.txt was removed
  /usr/lib/python3.13/site-packages/btrfsutil-6.16-py3.13.egg-info/PKG-INFO was removed
  /usr/lib/python3.13/site-packages/btrfsutil-6.16-py3.13.egg-info/SOURCES.txt was removed
  /usr/lib/python3.13/site-packages/btrfsutil-6.16-py3.13.egg-info/top_level.txt was removed

--===============0138238192056111448==--

