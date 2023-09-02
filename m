Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C475AC83F3E
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:14 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.5673.1693650552905516454
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=P+Iq1ucK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OP8NbBHD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018a55708a58-f471a288-c1c0-464c-9820-a6d5917778c9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sMrXuQZ7oWGWJlcR0XFVWwEaDJu3A0VApeVwzjBK8GI=;
	b=P+Iq1ucKOryLY0z8GoHgBcl6ELQ0KRI9tlm/VBftcf/ptRGFcYCoUDvmaGfB971L
	p38KiTciPamIuYbKqswfHZ2DUltRV/wZuVZVW1uiJ4pk+L+6v8AQ5noPh3Mc/U5hMpc
	3wv2euDcESO4Kp3N1h5iwGdODuZk1UjX4hCxN9jA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sMrXuQZ7oWGWJlcR0XFVWwEaDJu3A0VApeVwzjBK8GI=;
	b=OP8NbBHD+9h97TJJ9cIhEVvyKDKcgzJTuMCSuD7IfsjyZZyiNo12hOcTr102uoM3
	6l3gS6A+8uRutsUCSEcPbIk3Kb8Us1CTCQbZsfrG/0WXTwo0plFyb/EAYx3uGBO1TIg
	Mce2ROOuFzaBngW7f8X0qoxjiMim5xIoIN2K/T54=
Content-Type: multipart/mixed; boundary="===============0191289981443412518=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wheel: upgrading to 0.41.2 SUCCEEDED
Message-ID: <0101018a55708a58-f471a288-c1c0-464c-9820-a6d5917778c9-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187075

--===============0191289981443412518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-wheel* to *0.41.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wheel-upgrade-0.41.1-0.41.2.patch
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
From 5a1da00e2c15a043258afc2ef5cdbc8d1eb585f5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 16:57:58 +0000
Subject: [PATCH] python3-wheel: upgrade 0.41.1 -> 0.41.2

---
 .../python/{python3-wheel_0.41.1.bb => python3-wheel_0.41.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.41.1.bb => python3-wheel_0.41.2.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.41.1.bb b/meta/recipes-devtools/python/python3-wheel_0.41.2.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-wheel_0.41.1.bb
rename to meta/recipes-devtools/python/python3-wheel_0.41.2.bb
index 8eb931b5c9..d11c6a857a 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.41.1.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.41.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "12b911f083e876e10c595779709f8a88a59f45aacc646492a67fe9ef796c1b47"
+SRC_URI[sha256sum] = "0c5ac5ff2afb79ac23ab82bab027a0be7b5dbcf2e54dc50efe4bf507de1f7985"
 
 inherit python_flit_core pypi
 
-- 
2.39.2


--===============0191289981443412518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-wheel: PKGV changed from 0.41.1 [default] to 0.41.2 [default]
packages/core2-32-poky-linux/python3-wheel: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wheel/wheel-0.41.1.tar.gz;downloadfilename=wheel-0.41.1.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wheel/wheel-0.41.2.tar.gz;downloadfilename=wheel-0.41.2.tar.gz"
packages/core2-32-poky-linux/python3-wheel: PV changed from "0.41.1" to "0.41.2"
packages/core2-32-poky-linux/python3-wheel/python3-wheel-dbg: PKGV changed from 0.41.1 [default] to 0.41.2 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel-dbg: PV changed from "0.41.1" to "0.41.2"
packages/core2-32-poky-linux/python3-wheel/python3-wheel-dev: PKGV changed from 0.41.1 [default] to 0.41.2 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel-dev: PV changed from "0.41.1" to "0.41.2"
packages/core2-32-poky-linux/python3-wheel/python3-wheel-doc: PKGV changed from 0.41.1 [default] to 0.41.2 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel-doc: PV changed from "0.41.1" to "0.41.2"
packages/core2-32-poky-linux/python3-wheel/python3-wheel-locale: PKGV changed from 0.41.1 [default] to 0.41.2 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel-locale: PV changed from "0.41.1" to "0.41.2"
packages/core2-32-poky-linux/python3-wheel/python3-wheel-src: PKGV changed from 0.41.1 [default] to 0.41.2 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel-src: PV changed from "0.41.1" to "0.41.2"
packages/core2-32-poky-linux/python3-wheel/python3-wheel-staticdev: PKGV changed from 0.41.1 [default] to 0.41.2 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel-staticdev: PV changed from "0.41.1" to "0.41.2"
packages/core2-32-poky-linux/python3-wheel/python3-wheel: PKGV changed from 0.41.1 [default] to 0.41.2 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel: PKGSIZE changed from 466693 to 467789 (+0%)
packages/core2-32-poky-linux/python3-wheel/python3-wheel: PV changed from "0.41.1" to "0.41.2"
Changes to packages/core2-32-poky-linux/python3-wheel (sysroot):
  /usr/lib/python3.11/site-packages/wheel-0.41.1.dist-info moved to /usr/lib/python3.11/site-packages/wheel-0.41.2.dist-info

--===============0191289981443412518==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wheel-upgrade-0.41.1-0.41.2.patch"

RnJvbSA1YTFkYTAwZTJjMTVhMDQzMjU4YWZjMmVmNWNkYmM4ZDFlYjU4NWY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAxNjo1Nzo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2hlZWw6IHVwZ3JhZGUgMC40MS4xIC0+IDAuNDEuMgoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXdoZWVsXzAuNDEuMS5iYiA9PiBweXRob24zLXdoZWVsXzAuNDEuMi5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXdoZWVsXzAuNDEuMS5iYiA9PiBw
eXRob24zLXdoZWVsXzAuNDEuMi5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2hlZWxfMC40MS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVsXzAuNDEuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDg1
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2hlZWxf
MC40MS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
d2hlZWxfMC40MS4yLmJiCmluZGV4IDhlYjkzMWI1YzkuLmQxMWM2YTg1N2EgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13aGVlbF8wLjQxLjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVsXzAuNDEuMi5iYgpA
QCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIk1JVCIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT03ZmZiMGRiMDQ1Mjdj
ZmUzODBlNGYyNzI2YmQwNWViZiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjEyYjkxMWYwODNl
ODc2ZTEwYzU5NTc3OTcwOWY4YTg4YTU5ZjQ1YWFjYzY0NjQ5MmE2N2ZlOWVmNzk2YzFiNDciCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMGM1YWM1ZmYyYWZiNzlhYzIzYWI4MmJhYjAyN2EwYmU3YjVk
YmNmMmU1NGRjNTBlZmU0YmY1MDdkZTFmNzk4NSIKIAogaW5oZXJpdCBweXRob25fZmxpdF9jb3Jl
IHB5cGkKIAotLSAKMi4zOS4yCgo=

--===============0191289981443412518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-wheel (sysroot):
  /usr/lib/python3.11/site-packages/wheel-0.41.1.dist-info moved to /usr/lib/python3.11/site-packages/wheel-0.41.2.dist-info

--===============0191289981443412518==--

