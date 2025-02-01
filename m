Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD8CC021B3
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:01 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.42724.1738416054510747110
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=R474cUZx;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=c31ySap4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010194c1abde9d-94298bcf-cfad-40a6-ab42-26ac54bfe696-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416054;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LNjnyGB1P81l5VJAMqf4kM8cpp6QrKOVi6fyNk0kmts=;
	b=R474cUZx+feQGWkUUGhygYGy3EcenznSxYuMc4eYxfwZy92SnfsFJCC2bys2uRBp
	Vdmdnw+oRlXrmaf+bkQUz3B8+rcuxbIeape00yJD1OQDbe6f60PqBKLeurfEGOqWaJl
	WD2jKh+oZNlkNRtTEAAc35lreFCPZKwAFxMWjPZc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416054;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LNjnyGB1P81l5VJAMqf4kM8cpp6QrKOVi6fyNk0kmts=;
	b=c31ySap4+0lYRP1J69dpERiA4E/1BBR0DSymHlslQbMaatV/gyu9BuP7qJQQQSEB
	ySxjH6pGDGCZSzuMOknKMcBaZmsyEhMnc39sJu2wyWk8ucjwqVgehTz9Q9CjJFdfQuH
	9etHJ6LrDlBiNIwfmRyhiM4VKIrvQ1FSkWecEdtM=
Content-Type: multipart/mixed; boundary="===============3371768007153709852=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-referencing: upgrading to 0.36.2 SUCCEEDED
Message-ID: <01010194c1abde9d-94298bcf-cfad-40a6-ab42-26ac54bfe696-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210542

--===============3371768007153709852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-referencing* to *0.36.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-referencing-upgrade-0.35.1-0.36.2.patch
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
From 5dadc214b825848ce1a93315375c74e30f4a5bb7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 08:30:47 +0000
Subject: [PATCH] python3-referencing: upgrade 0.35.1 -> 0.36.2

---
 ...hon3-referencing_0.35.1.bb => python3-referencing_0.36.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-referencing_0.35.1.bb => python3-referencing_0.36.2.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-referencing_0.35.1.bb b/meta/recipes-devtools/python/python3-referencing_0.36.2.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-referencing_0.35.1.bb
rename to meta/recipes-devtools/python/python3-referencing_0.36.2.bb
index 3e2a380607..388c1887fb 100644
--- a/meta/recipes-devtools/python/python3-referencing_0.35.1.bb
+++ b/meta/recipes-devtools/python/python3-referencing_0.36.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/python-jsonschema/referencing"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=93eb9740964b59e9ba30281255b044e2"
 
-SRC_URI[sha256sum] = "25b42124a6c8b632a425174f24087783efb348a6f1e0008e63cd4466fedf703c"
+SRC_URI[sha256sum] = "df2e89862cd09deabbdba16944cc3f10feb6b3e6f18e902f7cc25609a34775aa"
 
 inherit pypi python_hatchling
 
-- 
2.44.1


--===============3371768007153709852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-referencing: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/referencing/referencing-0.35.1.tar.gz;downloadfilename=referencing-0.35.1.tar.gz" to "https://files.pythonhosted.org/packages/source/r/referencing/referencing-0.36.2.tar.gz;downloadfilename=referencing-0.36.2.tar.gz"
packages/core2-64-poky-linux/python3-referencing: PV changed from "0.35.1" to "0.36.2"
packages/core2-64-poky-linux/python3-referencing: PKGV changed from 0.35.1 [default] to 0.36.2 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-dbg: PV changed from "0.35.1" to "0.36.2"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-dbg: PKGV changed from 0.35.1 [default] to 0.36.2 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-dev: PV changed from "0.35.1" to "0.36.2"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-dev: PKGV changed from 0.35.1 [default] to 0.36.2 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-doc: PV changed from "0.35.1" to "0.36.2"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-doc: PKGV changed from 0.35.1 [default] to 0.36.2 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-locale: PV changed from "0.35.1" to "0.36.2"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-locale: PKGV changed from 0.35.1 [default] to 0.36.2 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-src: PV changed from "0.35.1" to "0.36.2"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-src: PKGV changed from 0.35.1 [default] to 0.36.2 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-staticdev: PV changed from "0.35.1" to "0.36.2"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-staticdev: PKGV changed from 0.35.1 [default] to 0.36.2 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing: PV changed from "0.35.1" to "0.36.2"
packages/core2-64-poky-linux/python3-referencing/python3-referencing: PKGV changed from 0.35.1 [default] to 0.36.2 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing: PKGSIZE changed from 262180 to 262630 (+0%)
Changes to packages/core2-64-poky-linux/python3-referencing (sysroot):
  /usr/lib/python3.13/site-packages/referencing-0.35.1.dist-info moved to /usr/lib/python3.13/site-packages/referencing-0.36.2.dist-info

--===============3371768007153709852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-referencing (sysroot):
  /usr/lib/python3.13/site-packages/referencing-0.35.1.dist-info moved to /usr/lib/python3.13/site-packages/referencing-0.36.2.dist-info

--===============3371768007153709852==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-referencing-upgrade-0.35.1-0.36.2.patch"

RnJvbSA1ZGFkYzIxNGI4MjU4NDhjZTFhOTMzMTUzNzVjNzRlMzBmNGE1YmI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwODozMDo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcmVmZXJlbmNpbmc6IHVwZ3JhZGUgMC4zNS4xIC0+IDAuMzYuMgoKLS0tCiAuLi5ob24z
LXJlZmVyZW5jaW5nXzAuMzUuMS5iYiA9PiBweXRob24zLXJlZmVyZW5jaW5nXzAuMzYuMi5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXJlZmVyZW5jaW5nXzAu
MzUuMS5iYiA9PiBweXRob24zLXJlZmVyZW5jaW5nXzAuMzYuMi5iYn0gKDgxJSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmVmZXJlbmNpbmdfMC4z
NS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlZmVyZW5jaW5n
XzAuMzYuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDgxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmVmZXJlbmNpbmdfMC4zNS4xLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmVmZXJlbmNpbmdfMC4zNi4yLmJi
CmluZGV4IDNlMmEzODA2MDcuLjM4OGMxODg3ZmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1yZWZlcmVuY2luZ18wLjM1LjEuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlZmVyZW5jaW5nXzAuMzYuMi5iYgpAQCAt
Myw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi1qc29uc2No
ZW1hL3JlZmVyZW5jaW5nIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9DT1BZSU5HO21kNT05M2ViOTc0MDk2NGI1OWU5YmEzMDI4MTI1NWIwNDRlMiIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjI1YjQyMTI0YTZjOGI2MzJhNDI1MTc0ZjI0MDg3NzgzZWZiMzQ4
YTZmMWUwMDA4ZTYzY2Q0NDY2ZmVkZjcwM2MiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGYyZTg5
ODYyY2QwOWRlYWJiZGJhMTY5NDRjYzNmMTBmZWI2YjNlNmYxOGU5MDJmN2NjMjU2MDlhMzQ3NzVh
YSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAotLSAKMi40NC4xCgo=

--===============3371768007153709852==--

