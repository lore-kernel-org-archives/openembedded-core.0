Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6291DC4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:22 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.1111.1714579216249953635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PsVivQmj;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=y7DPXN6C;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018f34e29317-0ac15903-1975-46ac-9176-7f9492083436-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gki/3a0hwN1AFV4KYyvdm6x0HsWNsDelMHncugHieKo=;
	b=PsVivQmjgUb7xFCyf0OPIg65DHSvhLDk7b1BgCiy6mirdnwver3gw8iMiY7UpGnN
	7JB+rQHcpIjzwTiDGVLasriIMpF9tjI2SgtvKLLJLs52pilXsb1GswJcTisE5e/4+/5
	JXmAsdVXF8lLazlFEtpLa0WsEff+2taxFJnHS+tg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gki/3a0hwN1AFV4KYyvdm6x0HsWNsDelMHncugHieKo=;
	b=y7DPXN6CoyS9G3wY3xJXVKKKyYtgFaUGJ9n1I6RXKSLwZmD4Wf897v0mtBAuQLoa
	E0qL5yP4U6OGWxj/TPckIhxFJ1ZJPG7LRQ4NpeejzhdJL/ZgZV5JZyDbuUQbIhbwSO+
	W9aawWcImsixuoNpOFSAAhw7vvoSVZwaEo2NH9hw=
Content-Type: multipart/mixed; boundary="===============8499793930658159271=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.24.2 SUCCEEDED
Message-ID: <0101018f34e29317-0ac15903-1975-46ac-9176-7f9492083436-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198835

--===============8499793930658159271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.24.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.24.1-1.24.2.patch
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
From 05cba1d7895c8dfbc2e085f2a47eaf9ba32364bd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 06:25:27 +0000
Subject: [PATCH] python3-hatchling: upgrade 1.24.1 -> 1.24.2

---
 ...{python3-hatchling_1.24.1.bb => python3-hatchling_1.24.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.24.1.bb => python3-hatchling_1.24.2.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.24.1.bb b/meta/recipes-devtools/python/python3-hatchling_1.24.2.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.24.1.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.24.2.bb
index fc8d953281..0ad545f448 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.24.1.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.24.2.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "51f861891e98c4044eb455163a737e5d2328d7aa74890b182db2d80fee22a497"
+SRC_URI[sha256sum] = "41ddc27cdb25db9ef7b68bef075f829c84cb349aa1bff8240797d012510547b0"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.44.0


--===============8499793930658159271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.24.1.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.24.1.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info

--===============8499793930658159271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.24.1.tar.gz;downloadfilename=hatchling-1.24.1.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.24.2.tar.gz;downloadfilename=hatchling-1.24.2.tar.gz"
packages/core2-64-poky-linux/python3-hatchling: PKGV changed from 1.24.1 [default] to 1.24.2 [default]
packages/core2-64-poky-linux/python3-hatchling: PV changed from "1.24.1" to "1.24.2"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.24.1 [default] to 1.24.2 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.24.1" to "1.24.2"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.24.1 [default] to 1.24.2 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.24.1" to "1.24.2"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.24.1 [default] to 1.24.2 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.24.1" to "1.24.2"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.24.1 [default] to 1.24.2 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.24.1" to "1.24.2"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.24.1 [default] to 1.24.2 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.24.1" to "1.24.2"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.24.1 [default] to 1.24.2 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.24.1" to "1.24.2"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 715154 to 715588 (+0%)
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.24.1 [default] to 1.24.2 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.24.1" to "1.24.2"
Changes to packages/core2-64-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.24.1.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.24.1.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info

--===============8499793930658159271==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.24.1-1.24.2.patch"

RnJvbSAwNWNiYTFkNzg5NWM4ZGZiYzJlMDg1ZjJhNDdlYWY5YmEzMjM2NGJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAwNjoyNToyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaGF0Y2hsaW5nOiB1cGdyYWRlIDEuMjQuMSAtPiAxLjI0LjIKCi0tLQogLi4ue3B5dGhv
bjMtaGF0Y2hsaW5nXzEuMjQuMS5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjI0LjIuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oYXRjaGxpbmdfMS4yNC4x
LmJiID0+IHB5dGhvbjMtaGF0Y2hsaW5nXzEuMjQuMi5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjQuMS5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4yNC4yLmJi
CnNpbWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4yNC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjQuMi5iYgppbmRleCBmYzhkOTUz
MjgxLi4wYWQ1NDVmNDQ4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjQuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjQuMi5iYgpAQCAtOCw3ICs4LDcgQEAgaW5oZXJp
dCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIERFUEVORFMgKz0gInB5dGhvbjMtcGx1Z2d5LW5hdGl2
ZSBweXRob24zLXBhdGhzcGVjLW5hdGl2ZSBweXRob24zLXBhY2thZ2luZy1uYXRpdmUgcHl0aG9u
My1lZGl0YWJsZXMtbmF0aXZlIHB5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnMtbmF0aXZlIgogREVQ
RU5EUzpyZW1vdmU6Y2xhc3MtbmF0aXZlID0gInB5dGhvbjMtaGF0Y2hsaW5nLW5hdGl2ZSIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjUxZjg2MTg5MWU5OGM0MDQ0ZWI0NTUxNjNhNzM3ZTVkMjMy
OGQ3YWE3NDg5MGIxODJkYjJkODBmZWUyMmE0OTciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDFk
ZGMyN2NkYjI1ZGI5ZWY3YjY4YmVmMDc1ZjgyOWM4NGNiMzQ5YWExYmZmODI0MDc5N2QwMTI1MTA1
NDdiMCIKIAogZG9fY29tcGlsZTpwcmVwZW5kKCkgewogICAgIGV4cG9ydCBQWVRIT05QQVRIPXNy
YwotLSAKMi40NC4wCgo=

--===============8499793930658159271==--

