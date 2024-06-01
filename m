Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA79C2BA18
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:40 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.42220.1717263219003271835
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LdzCHInS;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=WR1Bab2q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018fd4dd35ce-e4735cd8-dcb0-4cbe-98d9-f535be33d57b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AhVafytG7VaCwXrHAXgbDNqbv5DZeWhLZbXqg69nHKY=;
	b=LdzCHInSvFt0BmjEa3Yrit1ZNY8S4FjIdT4XMB/v149Z8Fv+TlieF0VE9AldmQoj
	IJn3/mifTJ/eAxtFWP04hQQ/BXxcf7j+Un3rCL5uSS/AC0Shf/0VbgHubUKebPKU+F1
	GX7z1pXnLzuzm2wbS6A3yUDA9MQRBQRuEdxclUwE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AhVafytG7VaCwXrHAXgbDNqbv5DZeWhLZbXqg69nHKY=;
	b=WR1Bab2q0LNaXj9vMrPMMnh6c/gqwjnBJj4xekWRvFbXxk8ynhsjJxlwjn/oP2gY
	kzBFvqDdMccGcBhZ/jTyLfY/5SV+ac7OQNo43GVPLq/RUZgYRD7nZhuaEF3zU6+esWG
	ZnMe0LQdEGVsPz34yLjpS7HMiZIJOMfnzNtA7/7c=
Content-Type: multipart/mixed; boundary="===============2797909060987833398=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-requests: upgrading to 2.32.3 SUCCEEDED
Message-ID: <0101018fd4dd35ce-e4735cd8-dcb0-4cbe-98d9-f535be33d57b-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200153

--===============2797909060987833398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-requests* to *2.32.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-requests-upgrade-2.32.1-2.32.3.patch
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
From 0728e4a267ae64284885149695614b276c91b66a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 09:28:46 +0000
Subject: [PATCH] python3-requests: upgrade 2.32.1 -> 2.32.3

---
 .../{python3-requests_2.32.1.bb => python3-requests_2.32.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.32.1.bb => python3-requests_2.32.3.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.32.1.bb b/meta/recipes-devtools/python/python3-requests_2.32.3.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-requests_2.32.1.bb
rename to meta/recipes-devtools/python/python3-requests_2.32.3.bb
index a1144181bc..4f0638b50c 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.1.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://requests.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "eb97e87e64c79e64e5b8ac75cee9dd1f97f49e289b083ee6be96268930725685"
+SRC_URI[sha256sum] = "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.44.0


--===============2797909060987833398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-requests: PV changed from "2.32.1" to "2.32.3"
packages/core2-64-poky-linux/python3-requests: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/requests/requests-2.32.1.tar.gz;downloadfilename=requests-2.32.1.tar.gz" to "https://files.pythonhosted.org/packages/source/r/requests/requests-2.32.3.tar.gz;downloadfilename=requests-2.32.3.tar.gz"
packages/core2-64-poky-linux/python3-requests: PKGV changed from 2.32.1 [default] to 2.32.3 [default]
packages/core2-64-poky-linux/python3-requests/python3-requests-dbg: PV changed from "2.32.1" to "2.32.3"
packages/core2-64-poky-linux/python3-requests/python3-requests-dbg: PKGV changed from 2.32.1 [default] to 2.32.3 [default]
packages/core2-64-poky-linux/python3-requests/python3-requests-dev: PV changed from "2.32.1" to "2.32.3"
packages/core2-64-poky-linux/python3-requests/python3-requests-dev: PKGV changed from 2.32.1 [default] to 2.32.3 [default]
packages/core2-64-poky-linux/python3-requests/python3-requests-doc: PV changed from "2.32.1" to "2.32.3"
packages/core2-64-poky-linux/python3-requests/python3-requests-doc: PKGV changed from 2.32.1 [default] to 2.32.3 [default]
packages/core2-64-poky-linux/python3-requests/python3-requests-locale: PV changed from "2.32.1" to "2.32.3"
packages/core2-64-poky-linux/python3-requests/python3-requests-locale: PKGV changed from 2.32.1 [default] to 2.32.3 [default]
packages/core2-64-poky-linux/python3-requests/python3-requests-src: PV changed from "2.32.1" to "2.32.3"
packages/core2-64-poky-linux/python3-requests/python3-requests-src: PKGV changed from 2.32.1 [default] to 2.32.3 [default]
packages/core2-64-poky-linux/python3-requests/python3-requests-staticdev: PV changed from "2.32.1" to "2.32.3"
packages/core2-64-poky-linux/python3-requests/python3-requests-staticdev: PKGV changed from 2.32.1 [default] to 2.32.3 [default]
packages/core2-64-poky-linux/python3-requests/python3-requests: PV changed from "2.32.1" to "2.32.3"
packages/core2-64-poky-linux/python3-requests/python3-requests: PKGV changed from 2.32.1 [default] to 2.32.3 [default]
packages/core2-64-poky-linux/python3-requests/python3-requests: PKGSIZE changed from 406069 to 415385 (+2%)
Changes to packages/core2-64-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.12/site-packages/requests-2.32.1.dist-info moved to /usr/lib/python3.12/site-packages/requests-2.32.3.dist-info

--===============2797909060987833398==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-requests-upgrade-2.32.1-2.32.3.patch"

RnJvbSAwNzI4ZTRhMjY3YWU2NDI4NDg4NTE0OTY5NTYxNGIyNzZjOTFiNjZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAwOToyODo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcmVxdWVzdHM6IHVwZ3JhZGUgMi4zMi4xIC0+IDIuMzIuMwoKLS0tCiAuLi4ve3B5dGhv
bjMtcmVxdWVzdHNfMi4zMi4xLmJiID0+IHB5dGhvbjMtcmVxdWVzdHNfMi4zMi4zLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXJlcXVlc3RzXzIuMzIuMS5i
YiA9PiBweXRob24zLXJlcXVlc3RzXzIuMzIuMy5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmVxdWVzdHNfMi4zMi4xLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlcXVlc3RzXzIuMzIuMy5iYgpzaW1p
bGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcmVxdWVzdHNfMi4zMi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcmVxdWVzdHNfMi4zMi4zLmJiCmluZGV4IGExMTQ0MTgxYmMuLjRm
MDYzOGI1MGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1yZXF1ZXN0c18yLjMyLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXJlcXVlc3RzXzIuMzIuMy5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0
cHM6Ly9yZXF1ZXN0cy5yZWFkdGhlZG9jcy5pbyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTM0NDAwYjY4MDcyZDcxMGZlY2Qw
YTI5NDBhMGQxNjU4IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWI5N2U4N2U2NGM3OWU2NGU1
YjhhYzc1Y2VlOWRkMWY5N2Y0OWUyODliMDgzZWU2YmU5NjI2ODkzMDcyNTY4NSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICI1NTM2NTQxNzczNGViMTgyNTU1OTBhOWZmOWViOTdlOWUxZGE4NjhkNGNj
ZDY0MDIzOTllYWY2OGFmMjBhNzYwIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNf
YnVpbGRfbWV0YQogCi0tIAoyLjQ0LjAKCg==

--===============2797909060987833398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.12/site-packages/requests-2.32.1.dist-info moved to /usr/lib/python3.12/site-packages/requests-2.32.3.dist-info

--===============2797909060987833398==--

