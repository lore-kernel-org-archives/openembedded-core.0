Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8E2CD8C95
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:45 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1555.1780328130323382964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=lMVW6imo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cFluL4si;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019e83d39957-d37b6845-15dc-4dc0-b368-4559314b2d43-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=R/ydn1jNgC0jq44KI9GSJqs7IgbeDHyihUymJD8PDoo=;
	b=lMVW6imoGzcRmqy0jYEfIAdDr8pSxV7dTaKO+se+xDDQqsPJ2V8emvsQ9EcmpjW6
	o3QtL9Ykw7mfDrcTpOkkji90GZ50qibOd7RrpcOymE3mTxvlLQ7qQSa2p7hmFrGrZcO
	hXueo1jkGbjrycJxk8CMZ4FZF/t/MQA0Hd2ko2hU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=R/ydn1jNgC0jq44KI9GSJqs7IgbeDHyihUymJD8PDoo=;
	b=cFluL4sirS1+bQ+0zImZYl6uoieCoicccM2cttR1yjA4j0A/ARbSGBYr6wlfuDRy
	oTT9NmFkS6fnMJM7lMTC0m7gPxZvv2nEO79AjCZM0sB74ivhGTHnVQSXyE5uFc9jas5
	0e6SwYoY9OLgithGntI+1VbpSMxZbuGlMF5htEg4=
Content-Type: multipart/mixed; boundary="===============4723140653932995871=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wcwidth: upgrading to 0.7.0 SUCCEEDED
Message-ID: <0101019e83d39957-d37b6845-15dc-4dc0-b368-4559314b2d43-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237897

--===============4723140653932995871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-wcwidth* to *0.7.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wcwidth-upgrade-0.6.0-0.7.0.patch
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
From ce943ca44d5923e2390c67be004745e7996d08da Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 09:45:47 +0000
Subject: [PATCH] python3-wcwidth: upgrade 0.6.0 -> 0.7.0

---
 .../{python3-wcwidth_0.6.0.bb => python3-wcwidth_0.7.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.6.0.bb => python3-wcwidth_0.7.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.6.0.bb b/meta/recipes-devtools/python/python3-wcwidth_0.7.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-wcwidth_0.6.0.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.7.0.bb
index 874b30b7dd..cd5e40b080 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.6.0.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.7.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "cdc4e4262d6ef9a1a57e018384cbeb1208d8abbc64176027e2c2455c81313159"
+SRC_URI[sha256sum] = "90e3a7ea092341c44b99562e75d09e4d5160fe7a3974c6fb842a101a95e7eed0"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.1


--===============4723140653932995871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: FILELIST: added "/usr/lib/python3-wcwidth/ptest/tests/test_clip_cjk_emoji.py /usr/lib/python3-wcwidth/ptest/tests/test_clip_overtyping.py /usr/lib/python3-wcwidth/ptest/tests/test_hyperlink.py /usr/lib/python3-wcwidth/ptest/tests/test_text_sizing.py"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 118993 to 164307 (+38%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.6.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/wcwidth-0.7.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.6.0.dist-info -> /usr/lib/python3.14/site-packages/wcwidth-0.7.0.dist-info, added "/usr/lib/python3.14/site-packages/wcwidth/_wcwidth.py /usr/lib/python3.14/site-packages/wcwidth/_width.py /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_wcwidth.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/__pycache__/text_sizing.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/_clip.py /usr/lib/python3.14/site-packages/wcwidth/align.py /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_constants.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/text_sizing.py /usr/lib/python3.14/site-packages/wcwidth/__pycache__/hyperlink.cpython-314.pyc /usr/lib/python3.14/site-packages/wcw
 idth/_wcswidth.py /usr/lib/python3.14/site-packages/wcwidth/_constants.py /usr/lib/python3.14/site-packages/wcwidth/__pycache__/align.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_clip.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/hyperlink.py /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_width.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_wcswidth.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 483083 to 582094 (+20%)
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.14/site-packages/wcwidth-0.6.0.dist-info moved to /usr/lib/python3.14/site-packages/wcwidth-0.7.0.dist-info
  /usr/lib/python3.14/site-packages/wcwidth/align.py was added
  /usr/lib/python3.14/site-packages/wcwidth/_clip.py was added
  /usr/lib/python3.14/site-packages/wcwidth/_constants.py was added
  /usr/lib/python3.14/site-packages/wcwidth/hyperlink.py was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/align.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_clip.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_constants.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/hyperlink.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/text_sizing.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_wcswidth.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_wcwidth.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_width.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/text_sizing.py was added
  /usr/lib/python3.14/site-packages/wcwidth/_wcswidth.py was added
  /usr/lib/python3.14/site-packages/wcwidth/_wcwidth.py was added
  /usr/lib/python3.14/site-packages/wcwidth/_width.py was added
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.22.10.dist-info moved to /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info

--===============4723140653932995871==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wcwidth-upgrade-0.6.0-0.7.0.patch"

RnJvbSBjZTk0M2NhNDRkNTkyM2UyMzkwYzY3YmUwMDQ3NDVlNzk5NmQwOGRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwOTo0NTo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2N3aWR0aDogdXBncmFkZSAwLjYuMCAtPiAwLjcuMAoKLS0tCiAuLi4ve3B5dGhvbjMt
d2N3aWR0aF8wLjYuMC5iYiA9PiBweXRob24zLXdjd2lkdGhfMC43LjAuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXdjd2lkdGhfMC42LjAuYmIgPT4g
cHl0aG9uMy13Y3dpZHRoXzAuNy4wLmJifSAoODQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuNi4wLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdjd2lkdGhfMC43LjAuYmIKc2ltaWxhcml0eSBpbmRl
eCA4NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdj
d2lkdGhfMC42LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy13Y3dpZHRoXzAuNy4wLmJiCmluZGV4IDg3NGIzMGI3ZGQuLmNkNWU0MGIwODAgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuNi4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAu
Ny4wLmJiCkBAIC00LDcgKzQsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vanF1
YXN0L3djd2lkdGgiCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0U7bWQ1PWIxNTk3OWMzOWEyNTQzODkyZmNhOGNkODZiNGI1MmNiIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiY2RjNGU0MjYyZDZlZjlhMWE1N2UwMTgzODRjYmViMTIwOGQ4YWJiYzY0
MTc2MDI3ZTJjMjQ1NWM4MTMxMzE1OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5MGUzYTdlYTA5
MjM0MWM0NGI5OTU2MmU3NWQwOWU0ZDUxNjBmZTdhMzk3NGM2ZmI4NDJhMTAxYTk1ZTdlZWQwIgog
CiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZyBwdGVzdC1weXRob24tcHl0ZXN0CiAKLS0g
CjIuNDcuMQoK

--===============4723140653932995871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.6.0.tar.gz;downloadfilename=wcwidth-0.6.0.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.7.0.tar.gz;downloadfilename=wcwidth-0.7.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-wcwidth: PV changed from "0.6.0" to "0.7.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PV changed from "0.6.0" to "0.7.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PV changed from "0.6.0" to "0.7.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PV changed from "0.6.0" to "0.7.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PV changed from "0.6.0" to "0.7.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: FILELIST: added "/usr/lib/python3-wcwidth/ptest/tests/test_text_sizing.py /usr/lib/python3-wcwidth/ptest/tests/test_hyperlink.py /usr/lib/python3-wcwidth/ptest/tests/test_clip_overtyping.py /usr/lib/python3-wcwidth/ptest/tests/test_clip_cjk_emoji.py"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PV changed from "0.6.0" to "0.7.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 118993 to 164307 (+38%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PV changed from "0.6.0" to "0.7.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PV changed from "0.6.0" to "0.7.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.6.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/wcwidth-0.7.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.6.0.dist-info -> /usr/lib/python3.14/site-packages/wcwidth-0.7.0.dist-info, added "/usr/lib/python3.14/site-packages/wcwidth/__pycache__/_wcswidth.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_constants.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/hyperlink.py /usr/lib/python3.14/site-packages/wcwidth/_clip.py /usr/lib/python3.14/site-packages/wcwidth/align.py /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_width.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_wcwidth.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_clip.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/_constants.py /usr/lib/python3.1
 4/site-packages/wcwidth/_width.py /usr/lib/python3.14/site-packages/wcwidth/__pycache__/hyperlink.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/text_sizing.py /usr/lib/python3.14/site-packages/wcwidth/__pycache__/align.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/_wcwidth.py /usr/lib/python3.14/site-packages/wcwidth/__pycache__/text_sizing.cpython-314.pyc /usr/lib/python3.14/site-packages/wcwidth/_wcswidth.py"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGV changed from 0.6.0 [default] to 0.7.0 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PV changed from "0.6.0" to "0.7.0"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 483083 to 582094 (+20%)
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.14/site-packages/wcwidth-0.6.0.dist-info moved to /usr/lib/python3.14/site-packages/wcwidth-0.7.0.dist-info
  /usr/lib/python3.14/site-packages/wcwidth/align.py was added
  /usr/lib/python3.14/site-packages/wcwidth/_clip.py was added
  /usr/lib/python3.14/site-packages/wcwidth/_constants.py was added
  /usr/lib/python3.14/site-packages/wcwidth/hyperlink.py was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/align.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_clip.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_constants.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/hyperlink.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/text_sizing.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_wcswidth.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_wcwidth.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/__pycache__/_width.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/wcwidth/text_sizing.py was added
  /usr/lib/python3.14/site-packages/wcwidth/_wcswidth.py was added
  /usr/lib/python3.14/site-packages/wcwidth/_wcwidth.py was added
  /usr/lib/python3.14/site-packages/wcwidth/_width.py was added
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.22.10.dist-info moved to /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info

--===============4723140653932995871==--

