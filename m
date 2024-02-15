Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68E8C54E64
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:34 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.20177.1708018346379342948
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TPPAvhOH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=d3+rHZpe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018dadd3a5c1-5076b5a4-5faa-456b-b8b8-ac51700c1014-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VLI4eS9WUO35jb5Y1V3nd+leTybYzhbMgt5mBtn/EE8=;
	b=TPPAvhOHLy6k0aNe0n0K6+w+lGuGTT78+3HePxScZzKeUX/xQ7ltQ0tu5Bu2As4t
	vqkCVcxGuTDmrjP57+CunssbrPSP7bsWd9yRHU0oRoFP2BnWsKZx3ezIdiAw8xlxbP1
	U8fZ/Di5jXky2Qv6LHdd3z7qGqr1Jg7nzXhC4THY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VLI4eS9WUO35jb5Y1V3nd+leTybYzhbMgt5mBtn/EE8=;
	b=d3+rHZpewsDvcL0Pl0wS/P/x0ygNiwYksm6myU0u+gV8izgZT37NK9lhO2JdpU2q
	NCaKD3ZJJw46dkb/v5uprqyCuhXMhWXTokB/jsxA48zSzHJMBcatRjp9JyjNZtDTi2J
	86qJ8GNCIkTO7BKvzrNwbCUAYYsYnAXHFlfcrPvc=
Content-Type: multipart/mixed; boundary="===============3653203167792518029=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.98.5 SUCCEEDED
Message-ID: <0101018dadd3a5c1-5076b5a4-5faa-456b-b8b8-ac51700c1014-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195629

--===============3653203167792518029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.98.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.97.3-6.98.5.patch
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
From c77ad97675788d190f03916efb61337b3f65de70 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 08:04:38 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.97.3 -> 6.98.5

---
 ...ython3-hypothesis_6.97.3.bb => python3-hypothesis_6.98.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.97.3.bb => python3-hypothesis_6.98.5.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.97.3.bb b/meta/recipes-devtools/python/python3-hypothesis_6.98.5.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.97.3.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.98.5.bb
index c93727f36c..13b1387c05 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.97.3.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.98.5.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "00216ddadaee17ba73451e262f973970a97d34fd75ec34ef57510147264c34d1"
+SRC_URI[sha256sum] = "cfe4c2320580f97dd0d11cd3ee954a347764aec42aa0c95b7a0285c2b02447ab"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.42.0


--===============3653203167792518029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.97.3.tar.gz;downloadfilename=hypothesis-6.97.3.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.98.5.tar.gz;downloadfilename=hypothesis-6.98.5.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-64-poky-linux/python3-hypothesis: PV changed from "6.97.3" to "6.98.5"
packages/core2-64-poky-linux/python3-hypothesis: PKGV changed from 6.97.3 [default] to 6.98.5 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.97.3" to "6.98.5"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.97.3 [default] to 6.98.5 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.97.3" to "6.98.5"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.97.3 [default] to 6.98.5 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.97.3" to "6.98.5"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.97.3 [default] to 6.98.5 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.97.3" to "6.98.5"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.97.3 [default] to 6.98.5 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.97.3" to "6.98.5"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.97.3 [default] to 6.98.5 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.97.3" to "6.98.5"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.97.3 [default] to 6.98.5 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.97.3" to "6.98.5"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.97.3 [default] to 6.98.5 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.97.3" to "6.98.5"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2875008 to 2935411 (+2%)
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.97.3 [default] to 6.98.5 [default]
Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.12/site-packages/hypothesis-6.97.3.dist-info moved to /usr/lib/python3.12/site-packages/hypothesis-6.98.5.dist-info

--===============3653203167792518029==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.97.3-6.98.5.patch"

RnJvbSBjNzdhZDk3Njc1Nzg4ZDE5MGYwMzkxNmVmYjYxMzM3YjNmNjVkZTcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDg6MDQ6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi45Ny4zIC0+IDYuOTguNQoKLS0tCiAuLi55dGhv
bjMtaHlwb3RoZXNpc182Ljk3LjMuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuOTguNS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWh5cG90aGVzaXNfNi45
Ny4zLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182Ljk4LjUuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi45Ny4z
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi45
OC41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuOTcuMy5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi45OC41LmJiCmluZGV4
IGM5MzcyN2YzNmMuLjEzYjEzODdjMDUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuOTcuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182Ljk4LjUuYmIKQEAgLTEzLDcgKzEz
LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUucHkgXAogICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjAwMjE2ZGRhZGFlZTE3YmE3MzQ1MWUyNjJmOTczOTcwYTk3
ZDM0ZmQ3NWVjMzRlZjU3NTEwMTQ3MjY0YzM0ZDEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2Zl
NGMyMzIwNTgwZjk3ZGQwZDExY2QzZWU5NTRhMzQ3NzY0YWVjNDJhYTBjOTViN2EwMjg1YzJiMDI0
NDdhYiIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9uMy1hdHRycyBcCi0tIAoy
LjQyLjAKCg==

--===============3653203167792518029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.12/site-packages/hypothesis-6.97.3.dist-info moved to /usr/lib/python3.12/site-packages/hypothesis-6.98.5.dist-info

--===============3653203167792518029==--

