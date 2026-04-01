Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E121076389
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:02 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14748.1775054159247703731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Y6i0eXQP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AmCgTyI+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019d4978fad8-1f9f921b-9c31-4935-b383-f36e5bd4efb7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PhHnhNs9whhe1sItgAHQTdexr6E4y6mZzLNBke4xbL4=;
	b=Y6i0eXQPr++tmWVJKc2SVh8zfkkL8nqtz00DXqb7+QDUxNjw4dQTYBf+OHWOlNYL
	qf/vU1YtmuCvVJ327GTbmV48gDX3/yRY/CMCnsipEKZMq9pyu4KjadfU2yFukNGINut
	WLEcFcBBiQbaQMApZqMAXHUW8XylfQ6FBy8rjUBg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PhHnhNs9whhe1sItgAHQTdexr6E4y6mZzLNBke4xbL4=;
	b=AmCgTyI+w9Pkj5Fd+6s3QAvw8mHd4/H3HYkxy9CajjXaz1X7Y8BZxA5yJzAn9Gfv
	h9LwAW/mowA3FyvMB2cUfIorvRE/qBFwdt9+Vb1Dc7o5IomAbW8b484PiUFGKxQyrIB
	VBbxta+88uilUwCOukmGtUJus62pgCZ3q3HLi+KE=
Content-Type: multipart/mixed; boundary="===============9012297988421870629=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-attrs: upgrading to 26.1.0 SUCCEEDED
Message-ID: <0101019d4978fad8-1f9f921b-9c31-4935-b383-f36e5bd4efb7-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:35:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234372

--===============9012297988421870629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-attrs* to *26.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-attrs-upgrade-25.4.0-26.1.0.patch
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
From 4dd9879b9777bc2e6135f3857c40fa4e9402a975 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 09:02:47 +0000
Subject: [PATCH] python3-attrs: upgrade 25.4.0 -> 26.1.0

---
 .../python/{python3-attrs_25.4.0.bb => python3-attrs_26.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-attrs_25.4.0.bb => python3-attrs_26.1.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-attrs_25.4.0.bb b/meta/recipes-devtools/python/python3-attrs_26.1.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-attrs_25.4.0.bb
rename to meta/recipes-devtools/python/python3-attrs_26.1.0.bb
index 7bc581b875..03621e41a6 100644
--- a/meta/recipes-devtools/python/python3-attrs_25.4.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_26.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
 
-SRC_URI[sha256sum] = "16d5969b87f0859ef33a48b35d55ac1be6e42ae49d5e853b597db70c35c57e11"
+SRC_URI[sha256sum] = "d03ceb89cb322a8fd706d4fb91940737b6642aa36998fe130a9bc96c985eff32"
 
 inherit pypi ptest-python-pytest python_hatchling
 
-- 
2.47.1


--===============9012297988421870629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs: FILELIST: directory renamed /usr/lib/python3.14/site-packages/attrs-25.4.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/attrs-26.1.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/attrs-25.4.0.dist-info -> /usr/lib/python3.14/site-packages/attrs-26.1.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-attrs (sysroot):
  /usr/lib/python3.14/site-packages/attrs-25.4.0.dist-info moved to /usr/lib/python3.14/site-packages/attrs-26.1.0.dist-info

--===============9012297988421870629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-attrs: SRC_URI changed from "https://files.pythonhosted.org/packages/source/a/attrs/attrs-25.4.0.tar.gz;downloadfilename=attrs-25.4.0.tar.gz" to "https://files.pythonhosted.org/packages/source/a/attrs/attrs-26.1.0.tar.gz;downloadfilename=attrs-26.1.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-attrs: PKGV changed from 25.4.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-attrs: PV changed from "25.4.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-dbg: PKGV changed from 25.4.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-dbg: PV changed from "25.4.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-dev: PKGV changed from 25.4.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-dev: PV changed from "25.4.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-doc: PKGV changed from 25.4.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-doc: PV changed from "25.4.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-locale: PKGV changed from 25.4.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-locale: PV changed from "25.4.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-ptest: PKGV changed from 25.4.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-ptest: PV changed from "25.4.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-ptest: PKGSIZE changed from 371846 to 380764 (+2%)
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-src: PKGV changed from 25.4.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-src: PV changed from "25.4.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-staticdev: PKGV changed from 25.4.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs-staticdev: PV changed from "25.4.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs: PKGV changed from 25.4.0 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs: FILELIST: directory renamed /usr/lib/python3.14/site-packages/attrs-25.4.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/attrs-26.1.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/attrs-25.4.0.dist-info -> /usr/lib/python3.14/site-packages/attrs-26.1.0.dist-info
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs: PV changed from "25.4.0" to "26.1.0"
packages/x86-64-v3-poky-linux/python3-attrs/python3-attrs: PKGSIZE changed from 443005 to 445220 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-attrs (sysroot):
  /usr/lib/python3.14/site-packages/attrs-25.4.0.dist-info moved to /usr/lib/python3.14/site-packages/attrs-26.1.0.dist-info

--===============9012297988421870629==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-attrs-upgrade-25.4.0-26.1.0.patch"

RnJvbSA0ZGQ5ODc5Yjk3NzdiYzJlNjEzNWYzODU3YzQwZmE0ZTk0MDJhOTc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAwOTowMjo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYXR0cnM6IHVwZ3JhZGUgMjUuNC4wIC0+IDI2LjEuMAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLWF0dHJzXzI1LjQuMC5iYiA9PiBweXRob24zLWF0dHJzXzI2LjEuMC5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWF0dHJzXzI1LjQuMC5iYiA9PiBw
eXRob24zLWF0dHJzXzI2LjEuMC5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXR0cnNfMjUuNC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWF0dHJzXzI2LjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg0
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXR0cnNf
MjUuNC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
YXR0cnNfMjYuMS4wLmJiCmluZGV4IDdiYzU4MWI4NzUuLjAzNjIxZTQxYTYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1hdHRyc18yNS40LjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWF0dHJzXzI2LjEuMC5iYgpA
QCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL3d3dy5hdHRycy5vcmcvIgogTElDRU5T
RSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT01ZTU1NzMx
ODI0Y2Y5MjA1Y2ZhYmVhYjlhMDYwMDg4NyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE2ZDU5
NjliODdmMDg1OWVmMzNhNDhiMzVkNTVhYzFiZTZlNDJhZTQ5ZDVlODUzYjU5N2RiNzBjMzVjNTdl
MTEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDAzY2ViODljYjMyMmE4ZmQ3MDZkNGZiOTE5NDA3
MzdiNjY0MmFhMzY5OThmZTEzMGE5YmM5NmM5ODVlZmYzMiIKIAogaW5oZXJpdCBweXBpIHB0ZXN0
LXB5dGhvbi1weXRlc3QgcHl0aG9uX2hhdGNobGluZwogCi0tIAoyLjQ3LjEKCg==

--===============9012297988421870629==--

