Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3230BEEE244
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:00 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.29466.1694804393850464698
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cJXvABP/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=apetGIvy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018a9a36bcd4-a3581f2b-d2e9-4de4-be39-5458e5d749de-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3SStLvvYy1jhvsAe+/m/kAQT6doXDZQ2b0d4QxtmJVY=;
	b=cJXvABP/jOv3LJ7rFVTLT7ZvmSDtuQgaaKFVtDq7+LQTz2uROPeGxTwpnNlM8KuL
	8npxloXRN6GDHnhk3BUfdPALDUYcoC0XcfrFP71QNwl2APF8OyNuS17kDhYfYFhiLoY
	2hMDGzO/RQNfcpdjABomPDYrJomSln2dI4tD9Cmc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3SStLvvYy1jhvsAe+/m/kAQT6doXDZQ2b0d4QxtmJVY=;
	b=apetGIvyMcbeYW4XbIwjTXHLxZ1cQ3y/ShnyCTWGttJU55UcvesjYUXK6dy5JvLR
	1CUct3GnFnVDtPH0nQfBlTiZbcKb1XvZQSIDb5wUZpVM0peRxC8sHN9A9L8wYoQRi0K
	U0Waj80naQi9SX8X5rHJizY+9OJba49vunudD/8w=
Content-Type: multipart/mixed; boundary="===============5825608438800484515=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2023.7 SUCCEEDED
Message-ID: <0101018a9a36bcd4-a3581f2b-d2e9-4de4-be39-5458e5d749de-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187698

--===============5825608438800484515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2023.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2023.6.1-2023.7.patch
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
From 75462c1441900dfa21329f960464d28cbe137b4a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 09:54:02 +0000
Subject: [PATCH] python3-dtschema: upgrade 2023.6.1 -> 2023.7

---
 ...{python3-dtschema_2023.6.1.bb => python3-dtschema_2023.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2023.6.1.bb => python3-dtschema_2023.7.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb b/meta/recipes-devtools/python/python3-dtschema_2023.7.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
rename to meta/recipes-devtools/python/python3-dtschema_2023.7.bb
index 0c2c156ec4..c1dc3e019a 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2023.7.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "d9dc11cea6a46ae2ee5ac4a5a1c7da7cb3704417cb390881820460f7c61eb784"
+SRC_URI[sha256sum] = "de7cd73a35244cf76a8cdd9919bbeb31f362aa5744f3c76c80e0e612489dd0c0"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.39.2


--===============5825608438800484515==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2023.6.1-2023.7.patch"

RnJvbSA3NTQ2MmMxNDQxOTAwZGZhMjEzMjlmOTYwNDY0ZDI4Y2JlMTM3YjRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMDk6NTQ6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0c2NoZW1hOiB1cGdyYWRlIDIwMjMuNi4xIC0+IDIwMjMuNwoKLS0tCiAuLi57cHl0
aG9uMy1kdHNjaGVtYV8yMDIzLjYuMS5iYiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjMuNy5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWR0c2NoZW1hXzIwMjMu
Ni4xLmJiID0+IHB5dGhvbjMtZHRzY2hlbWFfMjAyMy43LmJifSAoODUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjYuMS5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjcu
YmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjMuNi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMy43LmJiCmluZGV4IDBjMmMx
NTZlYzQuLmMxZGMzZTAxOWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjYuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMy43LmJiCkBAIC03LDcgKzcsNyBAQCBpbmhl
cml0IHB5cGkgc2V0dXB0b29sczMKIAogUFlQSV9QQUNLQUdFID0gImR0c2NoZW1hIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZDlkYzExY2VhNmE0NmFlMmVlNWFjNGE1YTFjN2RhN2NiMzcwNDQx
N2NiMzkwODgxODIwNDYwZjdjNjFlYjc4NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkZTdjZDcz
YTM1MjQ0Y2Y3NmE4Y2RkOTkxOWJiZWIzMWYzNjJhYTU3NDRmM2M3NmM4MGUwZTYxMjQ4OWRkMGMw
IgogCiBERVBFTkRTICs9ICJweXRob24zLXNldHVwdG9vbHMtc2NtLW5hdGl2ZSIKIFJERVBFTkRT
OiR7UE59ICs9ICJcCi0tIAoyLjM5LjIKCg==

--===============5825608438800484515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtschema: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2023.6.1.tar.gz;downloadfilename=dtschema-2023.6.1.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2023.7.tar.gz;downloadfilename=dtschema-2023.7.tar.gz"
packages/core2-32-poky-linux/python3-dtschema: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 299330 to 299324 (-0%)
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/WHEEL was removed

--===============5825608438800484515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/WHEEL was removed

--===============5825608438800484515==--

