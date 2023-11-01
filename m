Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1717C18E57
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:15 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.8490.1698848704555154051
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QeSKT2E2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VmRgO1mW;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.193, mailfrom: 0101018b8b4605e4-98f4bc88-a0cb-4665-897e-5e9e506d5ab9-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OOHeRDZiCYCxQLxDXvIdb8gyMZNzkhsJorrX5PAZ+bA=;
	b=QeSKT2E22kq7JROyNPM2he9OIVbbi5xwSFAPmFp4/wDdW/MLLYkMkIFccN0PsDEp
	mJowIbO/j56bVkDkcLktjaTpZ4eJoORFMDsfckzaLDL+t/RhrFYYvqQ5TzhPqncmkNx
	1CAD/8/bvDU5bBdhgk9Wn2QsphZ7rRgCGBZGcFqk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OOHeRDZiCYCxQLxDXvIdb8gyMZNzkhsJorrX5PAZ+bA=;
	b=VmRgO1mWTTsH5PVW/NOyttoUyS1CqLJh9egY/o6vMNzPcxBd+VUGbbFCprgY76RY
	6b0YuaB3uuZBiNudU6YF4wOc965yw8TkLJXtulk+AR0InTBbOP7CkeP59ifuweWihPY
	zzwYH5K9yzK29VlP7JbwvVwKSJhm29pGyYqbmR+A=
Content-Type: multipart/mixed; boundary="===============0709600957009248014=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-ruamel-yaml: upgrading to 0.18.3 SUCCEEDED
Message-ID: <0101018b8b4605e4-98f4bc88-a0cb-4665-897e-5e9e506d5ab9-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189953

--===============0709600957009248014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-ruamel-yaml* to *0.18.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-ruamel-yaml-upgrade-0.17.35-0.18.3.patch
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
From 8afa914789b45eda17b2160be34bd24a8fc6492c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 09:27:51 +0000
Subject: [PATCH] python3-ruamel-yaml: upgrade 0.17.35 -> 0.18.3

---
 ...on3-ruamel-yaml_0.17.35.bb => python3-ruamel-yaml_0.18.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.17.35.bb => python3-ruamel-yaml_0.18.3.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.3.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.18.3.bb
index 1760fec7ee..0ec804667a 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.3.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "801046a9caacb1b43acc118969b49b96b65e8847f29029563b29ac61d02db61b"
+SRC_URI[sha256sum] = "36dbbe90390d977f957436570d2bd540bfd600e6ec5a1ea42bcdb9fc7963d802"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-shell \
-- 
2.39.2


--===============0709600957009248014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-ruamel-yaml: PKGV changed from 0.17.35 [default] to 0.18.3 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml: PV changed from "0.17.35" to "0.18.3"
packages/core2-64-poky-linux/python3-ruamel-yaml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.17.35.tar.gz;downloadfilename=ruamel.yaml-0.17.35.tar.gz" to "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.18.3.tar.gz;downloadfilename=ruamel.yaml-0.18.3.tar.gz"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PV changed from "0.17.35" to "0.18.3"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PKGV changed from 0.17.35 [default] to 0.18.3 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PV changed from "0.17.35" to "0.18.3"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PKGV changed from 0.17.35 [default] to 0.18.3 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PV changed from "0.17.35" to "0.18.3"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PKGV changed from 0.17.35 [default] to 0.18.3 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PV changed from "0.17.35" to "0.18.3"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PKGV changed from 0.17.35 [default] to 0.18.3 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PV changed from "0.17.35" to "0.18.3"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PKGV changed from 0.17.35 [default] to 0.18.3 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PV changed from "0.17.35" to "0.18.3"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PKGV changed from 0.17.35 [default] to 0.18.3 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGSIZE changed from 1228939 to 1226995 (-0%)
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PV changed from "0.17.35" to "0.18.3"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGV changed from 0.17.35 [default] to 0.18.3 [default]
Changes to packages/core2-64-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.18.3.dist-info was added
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.18.3.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.18.3.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.18.3.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.18.3.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.18.3.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.35.dist-info was removed
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.35.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.35.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.35.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.35.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.35.dist-info/WHEEL was removed

--===============0709600957009248014==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-ruamel-yaml-upgrade-0.17.35-0.18.3.patch"

RnJvbSA4YWZhOTE0Nzg5YjQ1ZWRhMTdiMjE2MGJlMzRiZDI0YThmYzY0OTJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwOToyNzo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcnVhbWVsLXlhbWw6IHVwZ3JhZGUgMC4xNy4zNSAtPiAwLjE4LjMKCi0tLQogLi4ub24z
LXJ1YW1lbC15YW1sXzAuMTcuMzUuYmIgPT4gcHl0aG9uMy1ydWFtZWwteWFtbF8wLjE4LjMuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1ydWFtZWwteWFtbF8w
LjE3LjM1LmJiID0+IHB5dGhvbjMtcnVhbWVsLXlhbWxfMC4xOC4zLmJifSAoODUlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ydWFtZWwteWFtbF8w
LjE3LjM1LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15
YW1sXzAuMTguMy5iYgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4xNy4zNS5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAuMTgu
My5iYgppbmRleCAxNzYwZmVjN2VlLi4wZWM4MDQ2NjdhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4xNy4zNS5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4xOC4zLmJi
CkBAIC04LDcgKzgsNyBAQCBQWVBJX1BBQ0tBR0UgPSAicnVhbWVsLnlhbWwiCiAKIGluaGVyaXQg
cHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODAxMDQ2YTljYWFjYjFi
NDNhY2MxMTg5NjliNDliOTZiNjVlODg0N2YyOTAyOTU2M2IyOWFjNjFkMDJkYjYxYiIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICIzNmRiYmU5MDM5MGQ5NzdmOTU3NDM2NTcwZDJiZDU0MGJmZDYwMGU2
ZWM1YTFlYTQyYmNkYjlmYzc5NjNkODAyIgogCiBSREVQRU5EUzoke1BOfSArPSAiXAogICAgICR7
UFlUSE9OX1BOfS1zaGVsbCBcCi0tIAoyLjM5LjIKCg==

--===============0709600957009248014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.18.3.dist-info was added
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.18.3.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.18.3.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.18.3.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.18.3.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.18.3.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.35.dist-info was removed
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.35.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.35.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.35.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.35.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.35.dist-info/WHEEL was removed

--===============0709600957009248014==--

