Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38FDC04ABF
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:23 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.102673.1697399114574228511
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DS+uOGLX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=X1cJad9T;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.191, mailfrom: 0101018b34df08e3-5fadea16-d667-4670-aad3-b7fc0a5448ad-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1VVjXIMW/p1Qu8MrtoMG+NQr7Z/8sGr5kPRUIs8TnMs=;
	b=DS+uOGLXSoaI8JJ6JEoWgf9AY8VT7eRRWHFLv2Ro/mC1vK91+UXlL5v1mdyAuY51
	a5gke0e1WV7ucbRG2zUsww/tFNC4vS3GPQINSLJwL5AK9XQMQd4E+ZaVdgg7B0Cymgj
	LlV84gSwbVo8/P4LpUm4GO5Ha7C9y6TRQhJEuawU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1VVjXIMW/p1Qu8MrtoMG+NQr7Z/8sGr5kPRUIs8TnMs=;
	b=X1cJad9T4+AX8CBX4evT3HciYBT2Tdp9LP6bV+tkpzFGwMSjvPI8RL98Iaupu0Vw
	MHr12SPIP9ApYblees7O8OGzfvvgiS+I6yZLgeKDZBQCCFzF0mXitJLcM1SuJaE2s4m
	xI9LPiuK3vNzJIsiBKvJBPz72u2igjDWo5Shu7Y0=
Content-Type: multipart/mixed; boundary="===============1551579348639298207=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-ruamel-yaml: upgrading to 0.17.35 SUCCEEDED
Message-ID: <0101018b34df08e3-5fadea16-d667-4670-aad3-b7fc0a5448ad-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189187

--===============1551579348639298207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-ruamel-yaml* to *0.17.35* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-ruamel-yaml-upgrade-0.17.32-0.17.35.patch
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
From 4eec7ab38bc1031a0dc44c36c9b90bd10c4aa05d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 12:02:51 +0000
Subject: [PATCH] python3-ruamel-yaml: upgrade 0.17.32 -> 0.17.35

---
 ...n3-ruamel-yaml_0.17.32.bb => python3-ruamel-yaml_0.17.35.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.17.32.bb => python3-ruamel-yaml_0.17.35.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb
index 4b5e77e6e3..1760fec7ee 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ec939063761914e14542972a5cba6d33c23b0859ab6342f61cf070cfc600efc2"
+SRC_URI[sha256sum] = "801046a9caacb1b43acc118969b49b96b65e8847f29029563b29ac61d02db61b"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-shell \
-- 
2.39.2


--===============1551579348639298207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.32.dist-info moved to /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.35.dist-info

--===============1551579348639298207==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-ruamel-yaml-upgrade-0.17.32-0.17.35.patch"

RnJvbSA0ZWVjN2FiMzhiYzEwMzFhMGRjNDRjMzZjOWI5MGJkMTBjNGFhMDVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTI6MDI6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXJ1YW1lbC15YW1sOiB1cGdyYWRlIDAuMTcuMzIgLT4gMC4xNy4zNQoKLS0tCiAuLi5u
My1ydWFtZWwteWFtbF8wLjE3LjMyLmJiID0+IHB5dGhvbjMtcnVhbWVsLXlhbWxfMC4xNy4zNS5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXJ1YW1lbC15YW1s
XzAuMTcuMzIuYmIgPT4gcHl0aG9uMy1ydWFtZWwteWFtbF8wLjE3LjM1LmJifSAoODUlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ydWFtZWwteWFt
bF8wLjE3LjMyLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1l
bC15YW1sXzAuMTcuMzUuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAuMTcuMzIuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ydWFtZWwteWFtbF8w
LjE3LjM1LmJiCmluZGV4IDRiNWU3N2U2ZTMuLjE3NjBmZWM3ZWUgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ydWFtZWwteWFtbF8wLjE3LjMyLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ydWFtZWwteWFtbF8wLjE3
LjM1LmJiCkBAIC04LDcgKzgsNyBAQCBQWVBJX1BBQ0tBR0UgPSAicnVhbWVsLnlhbWwiCiAKIGlu
aGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWM5MzkwNjM3
NjE5MTRlMTQ1NDI5NzJhNWNiYTZkMzNjMjNiMDg1OWFiNjM0MmY2MWNmMDcwY2ZjNjAwZWZjMiIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4MDEwNDZhOWNhYWNiMWI0M2FjYzExODk2OWI0OWI5NmI2
NWU4ODQ3ZjI5MDI5NTYzYjI5YWM2MWQwMmRiNjFiIgogCiBSREVQRU5EUzoke1BOfSArPSAiXAog
ICAgICR7UFlUSE9OX1BOfS1zaGVsbCBcCi0tIAoyLjM5LjIKCg==

--===============1551579348639298207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-ruamel-yaml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.17.32.tar.gz;downloadfilename=ruamel.yaml-0.17.32.tar.gz" to "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.17.35.tar.gz;downloadfilename=ruamel.yaml-0.17.35.tar.gz"
packages/core2-32-poky-linux/python3-ruamel-yaml: PKGV changed from 0.17.32 [default] to 0.17.35 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml: PV changed from "0.17.32" to "0.17.35"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PKGV changed from 0.17.32 [default] to 0.17.35 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PV changed from "0.17.32" to "0.17.35"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PKGV changed from 0.17.32 [default] to 0.17.35 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PV changed from "0.17.32" to "0.17.35"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PKGV changed from 0.17.32 [default] to 0.17.35 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PV changed from "0.17.32" to "0.17.35"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PKGV changed from 0.17.32 [default] to 0.17.35 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PV changed from "0.17.32" to "0.17.35"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PKGV changed from 0.17.32 [default] to 0.17.35 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PV changed from "0.17.32" to "0.17.35"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PKGV changed from 0.17.32 [default] to 0.17.35 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PV changed from "0.17.32" to "0.17.35"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGV changed from 0.17.32 [default] to 0.17.35 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PV changed from "0.17.32" to "0.17.35"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGSIZE changed from 1227492 to 1228939 (+0%)
Changes to packages/core2-32-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.32.dist-info moved to /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.35.dist-info

--===============1551579348639298207==--

