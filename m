Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FAAC43327
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 05:32:31 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67987.1782624743401049356
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 22:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=f1DLYwdH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gomSvqJl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019f0cb6eb74-eb1f2f1f-bc43-42f9-ba3d-9585f2049267-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782624742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=f/DqPYz99kLv8v6XcI0mxNKcpeyk80nXpdZmVEl9iuQ=;
	b=f1DLYwdHFjQEKJqaQXDhOOP66y6ijaHVEuhuXr20t3qWrAQi/YqJwqYR33UHo+qM
	94IMl9WPIGY0VKYmCdFdSAllPrfbCqc2c+3d3zQg9wghnWYxYfX12UmwQlgYTf/C6wt
	qQRbAiKPcK7jmSKD7NMH0WbrARdRIkYUROGCCuLs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782624742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=f/DqPYz99kLv8v6XcI0mxNKcpeyk80nXpdZmVEl9iuQ=;
	b=gomSvqJlBoYj2yve5oU+c4stpiXa98vixvWEkanZzAN3ESQE6bLHYrlZfhQLaSSU
	99Q5Dhgd21ZBFQPs9wl+5wnIG2bXkaUHdJyc+JUsmBM/0cVROuUG7eqrkkifTxhGN/3
	irsQ4L9Pt8cN7qI6Q9i7758AX1NPaKYoemTBcXtc=
Content-Type: multipart/mixed; boundary="===============4047207718185203634=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wic: upgrading to 0.3.1 SUCCEEDED
Message-ID: <0101019f0cb6eb74-eb1f2f1f-bc43-42f9-ba3d-9585f2049267-000000@us-west-2.amazonses.com>
Date: Sun, 28 Jun 2026 05:32:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.28-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 05:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239706

--===============4047207718185203634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wic* to *0.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wic-upgrade-0.3.0-0.3.1.patch
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
From 91388f19c537cf1a4b658ee8a65b9cf9ebc66c37 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 28 Jun 2026 05:32:15 +0000
Subject: [PATCH] wic: upgrade 0.3.0 -> 0.3.1

---
 meta/recipes-support/wic/{wic_0.3.0.bb => wic_0.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/wic/{wic_0.3.0.bb => wic_0.3.1.bb} (90%)

diff --git a/meta/recipes-support/wic/wic_0.3.0.bb b/meta/recipes-support/wic/wic_0.3.1.bb
similarity index 90%
rename from meta/recipes-support/wic/wic_0.3.0.bb
rename to meta/recipes-support/wic/wic_0.3.1.bb
index 7dbf84b039..bfd34374a1 100644
--- a/meta/recipes-support/wic/wic_0.3.0.bb
+++ b/meta/recipes-support/wic/wic_0.3.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4ee23c52855c222cba72583d301d2338"
 
 SRC_URI = "git://git.yoctoproject.org/wic.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "5974ade11032f218841d9f449ef0efeee3f9a2ca"
+SRCREV = "5137f70fb43189d98e5738b7734f69f214516b97"
 
 CVE_PRODUCT = "yoctoproject:wic"
 
-- 
2.47.1


--===============4047207718185203634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/wic: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/x86-64-v3-poky-linux/wic: PV changed from "0.3.0" to "0.3.1"
packages/x86-64-v3-poky-linux/wic: SRC_URI changed from "git://git.yoctoproject.org/wic.git;branch=master;protocol=https;tag=v0.3.0" to "git://git.yoctoproject.org/wic.git;branch=master;protocol=https;tag=v0.3.1"
Changes to packages/x86-64-v3-poky-linux/wic (sysroot):
  /usr/lib/python3.14/site-packages/wic/bb was added
  /usr/lib/python3.14/site-packages/wic/bb/__init__.py was added
  /usr/lib/python3.14/site-packages/wic/bb/__pycache__ was added
  /usr/lib/python3.14/site-packages/wic/bb/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wic/bb/__pycache__/utils.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wic/bb/utils.py was added
  /usr/lib/python3.14/site-packages/wic/oe was added
  /usr/lib/python3.14/site-packages/wic/oe/bootfiles.py was added
  /usr/lib/python3.14/site-packages/wic/oe/__init__.py was added
  /usr/lib/python3.14/site-packages/wic/oe/path.py was added
  /usr/lib/python3.14/site-packages/wic/oe/__pycache__ was added
  /usr/lib/python3.14/site-packages/wic/oe/__pycache__/bootfiles.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wic/oe/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wic/oe/__pycache__/path.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/bb was removed
  /usr/lib/python3.14/site-packages/bb/__init__.py was removed
  /usr/lib/python3.14/site-packages/bb/__pycache__ was removed
  /usr/lib/python3.14/site-packages/bb/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/bb/__pycache__/utils.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/bb/utils.py was removed
  /usr/lib/python3.14/site-packages/oe was removed
  /usr/lib/python3.14/site-packages/oe/bootfiles.py was removed
  /usr/lib/python3.14/site-packages/oe/__init__.py was removed
  /usr/lib/python3.14/site-packages/oe/path.py was removed
  /usr/lib/python3.14/site-packages/oe/__pycache__ was removed
  /usr/lib/python3.14/site-packages/oe/__pycache__/bootfiles.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/oe/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/oe/__pycache__/path.cpython-314.pyc was removed
packages/x86-64-v3-poky-linux/wic/wic-dbg: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/x86-64-v3-poky-linux/wic/wic-dbg: PV changed from "0.3.0" to "0.3.1"
packages/x86-64-v3-poky-linux/wic/wic-dev: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/x86-64-v3-poky-linux/wic/wic-dev: PV changed from "0.3.0" to "0.3.1"
packages/x86-64-v3-poky-linux/wic/wic-doc: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/x86-64-v3-poky-linux/wic/wic-doc: PV changed from "0.3.0" to "0.3.1"
packages/x86-64-v3-poky-linux/wic/wic-locale: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/x86-64-v3-poky-linux/wic/wic-locale: PV changed from "0.3.0" to "0.3.1"
packages/x86-64-v3-poky-linux/wic/wic-src: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/x86-64-v3-poky-linux/wic/wic-src: PV changed from "0.3.0" to "0.3.1"
packages/x86-64-v3-poky-linux/wic/wic-staticdev: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/x86-64-v3-poky-linux/wic/wic-staticdev: PV changed from "0.3.0" to "0.3.1"
packages/x86-64-v3-poky-linux/wic/wic: PKGSIZE changed from 692103 to 693773 (+0%)
packages/x86-64-v3-poky-linux/wic/wic: PKGV changed from 0.3.0 [default] to 0.3.1 [default]
packages/x86-64-v3-poky-linux/wic/wic: PV changed from "0.3.0" to "0.3.1"
packages/x86-64-v3-poky-linux/wic/wic: FILELIST: directory renamed /usr/lib/python3.14/site-packages/oe -> /usr/lib/python3.14/site-packages/wic/oe, directory renamed /usr/lib/python3.14/site-packages/bb -> /usr/lib/python3.14/site-packages/wic/bb, directory renamed /usr/lib/python3.14/site-packages/oe/__pycache__ -> /usr/lib/python3.14/site-packages/wic/oe/__pycache__, directory renamed /usr/lib/python3.14/site-packages/bb/__pycache__ -> /usr/lib/python3.14/site-packages/wic/bb/__pycache__

--===============4047207718185203634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/wic (sysroot):
  /usr/lib/python3.14/site-packages/wic/bb was added
  /usr/lib/python3.14/site-packages/wic/bb/__init__.py was added
  /usr/lib/python3.14/site-packages/wic/bb/__pycache__ was added
  /usr/lib/python3.14/site-packages/wic/bb/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wic/bb/__pycache__/utils.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wic/bb/utils.py was added
  /usr/lib/python3.14/site-packages/wic/oe was added
  /usr/lib/python3.14/site-packages/wic/oe/bootfiles.py was added
  /usr/lib/python3.14/site-packages/wic/oe/__init__.py was added
  /usr/lib/python3.14/site-packages/wic/oe/path.py was added
  /usr/lib/python3.14/site-packages/wic/oe/__pycache__ was added
  /usr/lib/python3.14/site-packages/wic/oe/__pycache__/bootfiles.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wic/oe/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wic/oe/__pycache__/path.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/bb was removed
  /usr/lib/python3.14/site-packages/bb/__init__.py was removed
  /usr/lib/python3.14/site-packages/bb/__pycache__ was removed
  /usr/lib/python3.14/site-packages/bb/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/bb/__pycache__/utils.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/bb/utils.py was removed
  /usr/lib/python3.14/site-packages/oe was removed
  /usr/lib/python3.14/site-packages/oe/bootfiles.py was removed
  /usr/lib/python3.14/site-packages/oe/__init__.py was removed
  /usr/lib/python3.14/site-packages/oe/path.py was removed
  /usr/lib/python3.14/site-packages/oe/__pycache__ was removed
  /usr/lib/python3.14/site-packages/oe/__pycache__/bootfiles.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/oe/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/oe/__pycache__/path.cpython-314.pyc was removed
packages/x86-64-v3-poky-linux/wic/wic: FILELIST: directory renamed /usr/lib/python3.14/site-packages/bb/__pycache__ -> /usr/lib/python3.14/site-packages/wic/bb/__pycache__, directory renamed /usr/lib/python3.14/site-packages/bb -> /usr/lib/python3.14/site-packages/wic/bb, directory renamed /usr/lib/python3.14/site-packages/oe -> /usr/lib/python3.14/site-packages/wic/oe, directory renamed /usr/lib/python3.14/site-packages/oe/__pycache__ -> /usr/lib/python3.14/site-packages/wic/oe/__pycache__

--===============4047207718185203634==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-wic-upgrade-0.3.0-0.3.1.patch"

RnJvbSA5MTM4OGYxOWM1MzdjZjFhNGI2NThlZThhNjViOWNmOWViYzY2YzM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMjggSnVuIDIwMjYgMDU6MzI6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
aWM6IHVwZ3JhZGUgMC4zLjAgLT4gMC4zLjEKCi0tLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQvd2lj
L3t3aWNfMC4zLjAuYmIgPT4gd2ljXzAuMy4xLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L3dpYy97d2ljXzAuMy4wLmJiID0+IHdpY18wLjMuMS5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC93aWMvd2ljXzAuMy4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvd2ljL3dpY18wLjMuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC93aWMvd2ljXzAuMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
c3VwcG9ydC93aWMvd2ljXzAuMy4xLmJiCmluZGV4IDdkYmY4NGIwMzkuLmJmZDM0Mzc0YTEgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3dpYy93aWNfMC4zLjAuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvd2ljL3dpY18wLjMuMS5iYgpAQCAtNCw3ICs0LDcgQEAgTElDRU5T
RSA9ICJHUEwtMi4wLW9ubHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21k
NT00ZWUyM2M1Mjg1NWMyMjJjYmE3MjU4M2QzMDFkMjMzOCIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9n
aXQueW9jdG9wcm9qZWN0Lm9yZy93aWMuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHM7
dGFnPXYke1BWfSIKLVNSQ1JFViA9ICI1OTc0YWRlMTEwMzJmMjE4ODQxZDlmNDQ5ZWYwZWZlZWUz
ZjlhMmNhIgorU1JDUkVWID0gIjUxMzdmNzBmYjQzMTg5ZDk4ZTU3MzhiNzczNGY2OWYyMTQ1MTZi
OTciCiAKIENWRV9QUk9EVUNUID0gInlvY3RvcHJvamVjdDp3aWMiCiAKLS0gCjIuNDcuMQoK

--===============4047207718185203634==--

