Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3A9C021B0
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.42634.1738416054622171991
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QSheF63a;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=L8yoXjMG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010194c1abdef4-be8e1006-abd1-4d54-a640-b93e4c68bd51-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416054;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MOHEPGD7dEhmdPa+ApKVfCq2yqE0qafNPUHQlyK8y9E=;
	b=QSheF63aDbj8iIeYtXSZcVb4H/z9I5vFPfKVmw+Uqy9UCs4Yqb17DB5XDgx63mrT
	P4Px81FPIYCSwmxwnvnAkhPYmtfeHBu0gGiFKETqWgZKIMn9lqvOh9/8epbM+sxnaOZ
	RKJDMPyvYBNIgfJcRxjUXi6xsiFt015jPIDdddyA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416054;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MOHEPGD7dEhmdPa+ApKVfCq2yqE0qafNPUHQlyK8y9E=;
	b=L8yoXjMGooDaiZKgrVAAtrTwGz4rNlbxyyGHhCjzlg+IejHMGdYNY6krM0mRioKl
	BDF1RqR3FMPviCme1rDG9leAB6FJI+ydxv9adVXOuL1j+DLLTuRJogGEpc9BBQBn6W0
	hq3pe0YA1NzCSyvwgbOSS62Je1hQbS7Og4TEWgE0=
Content-Type: multipart/mixed; boundary="===============5764530052934018635=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-ruamel-yaml: upgrading to 0.18.10 SUCCEEDED
Message-ID: <01010194c1abdef4-be8e1006-abd1-4d54-a640-b93e4c68bd51-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210543

--===============5764530052934018635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-ruamel-yaml* to *0.18.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-ruamel-yaml-upgrade-0.18.9-0.18.10.patch
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
From 60cd2f02ef962103958733ac2fffee274fb77137 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 08:33:14 +0000
Subject: [PATCH] python3-ruamel-yaml: upgrade 0.18.9 -> 0.18.10

---
 ...on3-ruamel-yaml_0.18.9.bb => python3-ruamel-yaml_0.18.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.18.9.bb => python3-ruamel-yaml_0.18.10.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.9.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.10.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.18.9.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.18.10.bb
index efc07169f7..02b04e3c0c 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.9.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.10.bb
@@ -9,7 +9,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "59d0f8b10c658bd55ecd107e334d4117d766a2b9cc8f5176afcdadcff6f84a5e"
+SRC_URI[sha256sum] = "20c86ab29ac2153f80a428e1254a8adf686d3383df04490514ca3b79a362db58"
 
 RDEPENDS:${PN} += "\
     python3-shell \
-- 
2.44.1


--===============5764530052934018635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-ruamel-yaml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.18.9.tar.gz;downloadfilename=ruamel.yaml-0.18.9.tar.gz" to "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.18.10.tar.gz;downloadfilename=ruamel.yaml-0.18.10.tar.gz"
packages/core2-64-poky-linux/python3-ruamel-yaml: PKGV changed from 0.18.9 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml: PV changed from "0.18.9" to "0.18.10"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PKGV changed from 0.18.9 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PV changed from "0.18.9" to "0.18.10"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PKGV changed from 0.18.9 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PV changed from "0.18.9" to "0.18.10"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PKGV changed from 0.18.9 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PV changed from "0.18.9" to "0.18.10"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PKGV changed from 0.18.9 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PV changed from "0.18.9" to "0.18.10"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PKGV changed from 0.18.9 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PV changed from "0.18.9" to "0.18.10"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PKGV changed from 0.18.9 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PV changed from "0.18.9" to "0.18.10"
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGSIZE changed from 1199703 to 1200073 (+0%)
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGV changed from 0.18.9 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PV changed from "0.18.9" to "0.18.10"
Changes to packages/core2-64-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.10.dist-info was added
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.10.dist-info/LICENSE was added
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.10.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.10.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.10.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.9.dist-info was removed
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.9.dist-info/LICENSE was removed
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.9.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.9.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.9.dist-info/WHEEL was removed

--===============5764530052934018635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.10.dist-info was added
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.10.dist-info/LICENSE was added
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.10.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.10.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.10.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.9.dist-info was removed
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.9.dist-info/LICENSE was removed
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.9.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.9.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/ruamel.yaml-0.18.9.dist-info/WHEEL was removed

--===============5764530052934018635==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-ruamel-yaml-upgrade-0.18.9-0.18.10.patch"

RnJvbSA2MGNkMmYwMmVmOTYyMTAzOTU4NzMzYWMyZmZmZWUyNzRmYjc3MTM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwODozMzoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcnVhbWVsLXlhbWw6IHVwZ3JhZGUgMC4xOC45IC0+IDAuMTguMTAKCi0tLQogLi4ub24z
LXJ1YW1lbC15YW1sXzAuMTguOS5iYiA9PiBweXRob24zLXJ1YW1lbC15YW1sXzAuMTguMTAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1ydWFtZWwteWFtbF8w
LjE4LjkuYmIgPT4gcHl0aG9uMy1ydWFtZWwteWFtbF8wLjE4LjEwLmJifSAoODUlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ydWFtZWwteWFtbF8w
LjE4LjkuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlh
bWxfMC4xOC4xMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4xOC45LmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4xOC4x
MC5iYgppbmRleCBlZmMwNzE2OWY3Li4wMmIwNGUzYzBjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnVhbWVsLXlhbWxfMC4xOC45LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ydWFtZWwteWFtbF8wLjE4LjEwLmJi
CkBAIC05LDcgKzksNyBAQCBVUFNUUkVBTV9DSEVDS19QWVBJX1BBQ0tBR0UgPSAiJHtQWVBJX1BB
Q0tBR0V9IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNTlkMGY4YjEwYzY1OGJkNTVlY2QxMDdlMzM0ZDQxMTdkNzY2
YTJiOWNjOGY1MTc2YWZjZGFkY2ZmNmY4NGE1ZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyMGM4
NmFiMjlhYzIxNTNmODBhNDI4ZTEyNTRhOGFkZjY4NmQzMzgzZGYwNDQ5MDUxNGNhM2I3OWEzNjJk
YjU4IgogCiBSREVQRU5EUzoke1BOfSArPSAiXAogICAgIHB5dGhvbjMtc2hlbGwgXAotLSAKMi40
NC4xCgo=

--===============5764530052934018635==--

