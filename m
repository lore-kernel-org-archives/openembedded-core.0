Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FB0C3DA4B
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:44 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.42235.1717263220124625108
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=HlTS0mKd;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=nRA+lJ7M;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018fd4dd3aee-244ec6c3-bf44-4b72-a59b-1cb41c1a740f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rpzt1+fkygupAZmuUsoVpSUt/6vHTSTR/0ofQ86JIkc=;
	b=HlTS0mKdMuhxjkY7VTRwtgewfjjHv17NFdJpsFucunO3hZwEorkqmWXekmq2lhkD
	00E88DOduNBPK6IGF8mezXcDPRt2dwAqz/VGGjdS2c0sTXSrrc8GO9n+H5Yo2pKfESn
	CFZZbAdIwqBgIhJmILC7BHZbJ3XSBQF8/0O+IsQs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rpzt1+fkygupAZmuUsoVpSUt/6vHTSTR/0ofQ86JIkc=;
	b=nRA+lJ7M0I67gd9n+TPAY46vhzccYfzyMUHw7q7MqVuWpaUMV2bV/tRmnCbP9ezF
	NNNBOUUTDefoXrGuexG09+S/tvoTLFsBF/MQ8XDOXyHKfoKS96hzoPKTEbKV6jQheja
	WlOjrMbRChqp8+kbfHv+CabUIwmdY2spLLMZZDGo=
Content-Type: multipart/mixed; boundary="===============4502498604892694182=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rng-tools: upgrading to 6.17 SUCCEEDED
Message-ID: <0101018fd4dd3aee-244ec6c3-bf44-4b72-a59b-1cb41c1a740f-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200193

--===============4502498604892694182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rng-tools* to *6.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rng-tools-upgrade-6.16-6.17.patch
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
From 3fcdd4c47faf7a720319732504d7af08baa0fc8e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 17:10:17 +0000
Subject: [PATCH] rng-tools: upgrade 6.16 -> 6.17

---
 .../rng-tools/{rng-tools_6.16.bb => rng-tools_6.17.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/rng-tools/{rng-tools_6.16.bb => rng-tools_6.17.bb} (98%)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.16.bb b/meta/recipes-support/rng-tools/rng-tools_6.17.bb
similarity index 98%
rename from meta/recipes-support/rng-tools/rng-tools_6.16.bb
rename to meta/recipes-support/rng-tools/rng-tools_6.17.bb
index ed755ae705..fc141a984c 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.16.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.17.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
            file://default \
            file://rng-tools.service \
            "
-SRCREV = "e061c313b95890eb5fa0ada0cd6eec619dafdfe2"
+SRCREV = "bd00c08b0c3c6a880b0988befe97fd35b315468c"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.0


--===============4502498604892694182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/rng-tools: PV changed from "6.16" to "6.17"
packages/core2-64-poky-linux/rng-tools: PKGV changed from 6.16 [default] to 6.17 [default]
packages/core2-64-poky-linux/rng-tools/rng-tools-dbg: PV changed from "6.16" to "6.17"
packages/core2-64-poky-linux/rng-tools/rng-tools-dbg: PKGV changed from 6.16 [default] to 6.17 [default]
packages/core2-64-poky-linux/rng-tools/rng-tools-dbg: PKGSIZE changed from 228296 to 245920 (+8%)
packages/core2-64-poky-linux/rng-tools/rng-tools-dev: PV changed from "6.16" to "6.17"
packages/core2-64-poky-linux/rng-tools/rng-tools-dev: PKGV changed from 6.16 [default] to 6.17 [default]
packages/core2-64-poky-linux/rng-tools/rng-tools-doc: PV changed from "6.16" to "6.17"
packages/core2-64-poky-linux/rng-tools/rng-tools-doc: PKGV changed from 6.16 [default] to 6.17 [default]
packages/core2-64-poky-linux/rng-tools/rng-tools-doc: PKGSIZE changed from 12940 to 13989 (+8%)
packages/core2-64-poky-linux/rng-tools/rng-tools-locale: PV changed from "6.16" to "6.17"
packages/core2-64-poky-linux/rng-tools/rng-tools-locale: PKGV changed from 6.16 [default] to 6.17 [default]
packages/core2-64-poky-linux/rng-tools/rng-tools-service: PV changed from "6.16" to "6.17"
packages/core2-64-poky-linux/rng-tools/rng-tools-service: PKGV changed from 6.16 [default] to 6.17 [default]
packages/core2-64-poky-linux/rng-tools/rng-tools-src: PV changed from "6.16" to "6.17"
packages/core2-64-poky-linux/rng-tools/rng-tools-src: PKGV changed from 6.16 [default] to 6.17 [default]
packages/core2-64-poky-linux/rng-tools/rng-tools-src: PKGSIZE changed from 107992 to 115375 (+7%)
packages/core2-64-poky-linux/rng-tools/rng-tools-src: FILELIST: directory renamed /usr/src/debug/rng-tools/6.16/contrib -> /usr/src/debug/rng-tools/6.17/contrib, removed "/usr/src/debug/rng-tools/6.16/stats.h /usr/src/debug/rng-tools/6.16/rngd_linux.c /usr/src/debug/rng-tools/6.16/rngd_jitter.c /usr/src/debug/rng-tools/6.16/rngd_linux.h /usr/src/debug/rng-tools/6.16/stats.c /usr/src/debug/rng-tools/6.16/rngd.h /usr/src/debug/rng-tools/6.16/rngtest.c /usr/src/debug/rng-tools/6.16/util.c /usr/src/debug/rng-tools/6.16/rngd_rdrand.c /usr/src/debug/rng-tools/6.16/ossl_helpers.h /usr/src/debug/rng-tools/6.16/fips.h /usr/src/debug/rng-tools/6.16/rngd_entsource.h /usr/src/debug/rng-tools/6.16/rngd.c /usr/src/debug/rng-tools/6.16/rngd_entsource.c /usr/src/debug/rng-tools/6.16/fips.c /usr/src/debug/rng-tools/6.16/ossl_helpers.c", added "/usr/src/debug/rng-tools/6.17/stats.h /usr/src/debug/rng-tools/6.17/rngd_linux.c /usr/src/debug/rng-tools/6.17/rngd_jitter.c /usr/src/debug/rng-tools/6.17/rngd
 _linux.h /usr/src/debug/rng-tools/6.17/stats.c /usr/src/debug/rng-tools/6.17/rngd.h /usr/src/debug/rng-tools/6.17/rngtest.c /usr/src/debug/rng-tools/6.17/util.c /usr/src/debug/rng-tools/6.17/fips.c /usr/src/debug/rng-tools/6.17/rngd_rdrand.c /usr/src/debug/rng-tools/6.17/ossl_helpers.h /usr/src/debug/rng-tools/6.17/fips.h /usr/src/debug/rng-tools/6.17/rngd_entsource.h /usr/src/debug/rng-tools/6.17/rngd.c /usr/src/debug/rng-tools/6.17/rngd_entsource.c /usr/src/debug/rng-tools/6.17/rngd_namedpipe.c /usr/src/debug/rng-tools/6.17/ossl_helpers.c"
packages/core2-64-poky-linux/rng-tools/rng-tools-staticdev: PV changed from "6.16" to "6.17"
packages/core2-64-poky-linux/rng-tools/rng-tools-staticdev: PKGV changed from 6.16 [default] to 6.17 [default]
packages/core2-64-poky-linux/rng-tools/rng-tools: PV changed from "6.16" to "6.17"
packages/core2-64-poky-linux/rng-tools/rng-tools: PKGV changed from 6.16 [default] to 6.17 [default]
packages/core2-64-poky-linux/rng-tools/rng-tools: PKGSIZE changed from 100168 to 136136 (+36%)

--===============4502498604892694182==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rng-tools-upgrade-6.16-6.17.patch"

RnJvbSAzZmNkZDRjNDdmYWY3YTcyMDMxOTczMjUwNGQ3YWYwOGJhYTBmYzhlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAxNzoxMDoxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJu
Zy10b29sczogdXBncmFkZSA2LjE2IC0+IDYuMTcKCi0tLQogLi4uL3JuZy10b29scy97cm5nLXRv
b2xzXzYuMTYuYmIgPT4gcm5nLXRvb2xzXzYuMTcuYmJ9ICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvcm5nLXRvb2xzL3tybmctdG9vbHNfNi4xNi5iYiA9PiBybmctdG9vbHNfNi4x
Ny5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ybmctdG9vbHMv
cm5nLXRvb2xzXzYuMTYuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ybmctdG9vbHMvcm5nLXRv
b2xzXzYuMTcuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvcm5nLXRvb2xzL3JuZy10b29sc182LjE2LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9ybmctdG9vbHMvcm5nLXRvb2xzXzYuMTcuYmIKaW5kZXggZWQ3NTVhZTcwNS4u
ZmMxNDFhOTg0YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcm5nLXRvb2xzL3Ju
Zy10b29sc182LjE2LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3JuZy10b29scy9ybmct
dG9vbHNfNi4xNy5iYgpAQCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5j
b20vbmhvcm1hbi9ybmctdG9vbHMuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAog
ICAgICAgICAgICBmaWxlOi8vZGVmYXVsdCBcCiAgICAgICAgICAgIGZpbGU6Ly9ybmctdG9vbHMu
c2VydmljZSBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICJlMDYxYzMxM2I5NTg5MGViNWZhMGFk
YTBjZDZlZWM2MTlkYWZkZmUyIgorU1JDUkVWID0gImJkMDBjMDhiMGMzYzZhODgwYjA5ODhiZWZl
OTdmZDM1YjMxNTQ2OGMiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuNDQuMAoK

--===============4502498604892694182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/rng-tools/rng-tools: PKGSIZE changed from 100168 to 136136 (+36%)

--===============4502498604892694182==--

