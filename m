Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5DDE9A051
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:46 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1424.1771440104854809897
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NyMVlNJK;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=T2LT9mtw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019c720ee3c2-d28e1975-179b-4b55-860c-e09ad43167f8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440104;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bTj405c78Gde2dvrVGqLBeCXNjA2JVJ3RjNNuK0WgFY=;
	b=NyMVlNJK7Q3AqkmeVE34BZ+KnUztHEsxbCzJuHA4m4/HGpCJeDgO007/JI+qHctr
	YAZPdAgZyLGStiASpdY3AXokXr9ycWzRVkJL6tOEx6PwcIhRluneWvz4gqHLBn7P3Ov
	f98sk+Luyxbq4Ue9cx8oTz0K/yFDLZ/eFJ0+6E38=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440104;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bTj405c78Gde2dvrVGqLBeCXNjA2JVJ3RjNNuK0WgFY=;
	b=T2LT9mtw4lFJQS045mRLEuhOmGw3ItPWiRTqMSE25l6QO0punM94MhahJh6idVVs
	0uaJX1cWUiLWPPNvq/Waw963301ppMUr9+oa4Wcn2B/Hlzq7oP0O7tYNP8ATAcOK9br
	ID8Ba84FrBindYCvKMGBsQV6LihXa7/YzDRQcgzE=
Content-Type: multipart/mixed; boundary="===============6031144809425808106=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-testtools: upgrading to 2.8.3 SUCCEEDED
Message-ID: <0101019c720ee3c2-d28e1975-179b-4b55-860c-e09ad43167f8-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231361

--===============6031144809425808106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-testtools* to *2.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-testtools-upgrade-2.8.2-2.8.3.patch
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
From b52be5fe02af4ed2e8ed7989b3712eddad2e211c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 13:56:05 +0000
Subject: [PATCH] python3-testtools: upgrade 2.8.2 -> 2.8.3

---
 .../{python3-testtools_2.8.2.bb => python3-testtools_2.8.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-testtools_2.8.2.bb => python3-testtools_2.8.3.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-testtools_2.8.2.bb b/meta/recipes-devtools/python/python3-testtools_2.8.3.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-testtools_2.8.2.bb
rename to meta/recipes-devtools/python/python3-testtools_2.8.3.bb
index c51fac2242..2ac8759784 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.8.2.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.8.3.bb
@@ -8,7 +8,7 @@ DEPENDS += "python3-hatch-vcs-native"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "b5c73332456ff54152062d47a58bc4f15f8e23514afec4e84775af124fb7db43"
+SRC_URI[sha256sum] = "3b54b543a7583a35f65538b1d36a327fc34943a26bb839bcbe4b2c5e085aa939"
 
 RDEPENDS:${PN} += "\
     python3-compression \
-- 
2.47.1


--===============6031144809425808106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/testtools-2.8.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/testtools-2.8.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/testtools-2.8.2.dist-info -> /usr/lib/python3.14/site-packages/testtools-2.8.3.dist-info
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PKGSIZE changed from 731003 to 949412 (+30%)
Changes to packages/x86-64-v3-poky-linux/python3-testtools (sysroot):
  /usr/lib/python3.14/site-packages/testtools-2.8.2.dist-info moved to /usr/lib/python3.14/site-packages/testtools-2.8.3.dist-info

--===============6031144809425808106==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-testtools-upgrade-2.8.2-2.8.3.patch"

RnJvbSBiNTJiZTVmZTAyYWY0ZWQyZThlZDc5ODliMzcxMmVkZGFkMmUyMTFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTM6NTY6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRlc3R0b29sczogdXBncmFkZSAyLjguMiAtPiAyLjguMwoKLS0tCiAuLi4ve3B5dGhv
bjMtdGVzdHRvb2xzXzIuOC4yLmJiID0+IHB5dGhvbjMtdGVzdHRvb2xzXzIuOC4zLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXRlc3R0b29sc18yLjguMi5i
YiA9PiBweXRob24zLXRlc3R0b29sc18yLjguMy5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdGVzdHRvb2xzXzIuOC4yLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRlc3R0b29sc18yLjguMy5iYgpzaW1p
bGFyaXR5IGluZGV4IDg0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtdGVzdHRvb2xzXzIuOC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtdGVzdHRvb2xzXzIuOC4zLmJiCmluZGV4IGM1MWZhYzIyNDIuLjJh
Yzg3NTk3ODQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My10ZXN0dG9vbHNfMi44LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXRlc3R0b29sc18yLjguMy5iYgpAQCAtOCw3ICs4LDcgQEAgREVQRU5EUyArPSAicHl0
aG9uMy1oYXRjaC12Y3MtbmF0aXZlIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjVjNzMzMzI0NTZmZjU0MTUyMDYyZDQ3YTU4YmM0ZjE1
ZjhlMjM1MTRhZmVjNGU4NDc3NWFmMTI0ZmI3ZGI0MyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIz
YjU0YjU0M2E3NTgzYTM1ZjY1NTM4YjFkMzZhMzI3ZmMzNDk0M2EyNmJiODM5YmNiZTRiMmM1ZTA4
NWFhOTM5IgogCiBSREVQRU5EUzoke1BOfSArPSAiXAogICAgIHB5dGhvbjMtY29tcHJlc3Npb24g
XAotLSAKMi40Ny4xCgo=

--===============6031144809425808106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-testtools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/testtools/testtools-2.8.2.tar.gz;downloadfilename=testtools-2.8.2.tar.gz" to "https://files.pythonhosted.org/packages/source/t/testtools/testtools-2.8.3.tar.gz;downloadfilename=testtools-2.8.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-testtools: PV changed from "2.8.2" to "2.8.3"
packages/x86-64-v3-poky-linux/python3-testtools: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dbg: PV changed from "2.8.2" to "2.8.3"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dbg: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dev: PV changed from "2.8.2" to "2.8.3"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dev: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-doc: PV changed from "2.8.2" to "2.8.3"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-doc: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-locale: PV changed from "2.8.2" to "2.8.3"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-locale: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-src: PV changed from "2.8.2" to "2.8.3"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-src: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-staticdev: PV changed from "2.8.2" to "2.8.3"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-staticdev: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PV changed from "2.8.2" to "2.8.3"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PKGSIZE changed from 731003 to 949412 (+30%)
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/testtools-2.8.2.dist-info -> /usr/lib/python3.14/site-packages/testtools-2.8.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/testtools-2.8.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/testtools-2.8.3.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-testtools (sysroot):
  /usr/lib/python3.14/site-packages/testtools-2.8.2.dist-info moved to /usr/lib/python3.14/site-packages/testtools-2.8.3.dist-info

--===============6031144809425808106==--

