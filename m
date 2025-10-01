Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A98CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:22 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.18072.1759325536079836896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xi8CrLo0;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=OAm+ehdK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101999ff952a5-2aedd210-bce0-4c6f-9a97-50f734fd99d4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325541;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=47MsjxsSo8Px56YxdeMcCxtkGglDT0P0UtnNqXLPWK8=;
	b=xi8CrLo0Qu/7wsTS+leogarxS3MXbWAzyBq8vrdiTWJE+MrMB+fT1ZWVsd82RoQQ
	sfeIjezA7gaWwg1m67Q+bP8NVlvf84nz2sSRUsk72H9OW3bdy4CHee+ZraDrWbOln/s
	CAQSHrFlFnI/HW3KPbhinreijWaJXKL/8v8t/i/4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325541;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=47MsjxsSo8Px56YxdeMcCxtkGglDT0P0UtnNqXLPWK8=;
	b=OAm+ehdK+iRPsnOujPdnAUHRu4JPX8ypgwsGgqxlnaSBrnafcaHOvQdz2lTZJvck
	jr9p431IAPNSSGJPIDxeLrgyPDqEgR7nrtFKsDoVr8z0QCEYVTm13jY6beFovy/0/GN
	m48pcFFnh4BxZmz7nNV2ielJy9XjACH9BiE5Tkq4=
Content-Type: multipart/mixed; boundary="===============6712953004938858576=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-poetry-core: upgrading to 2.2.1 SUCCEEDED
Message-ID: <010101999ff952a5-2aedd210-bce0-4c6f-9a97-50f734fd99d4-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224242

--===============6712953004938858576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-poetry-core* to *2.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-poetry-core-upgrade-2.1.3-2.2.1.patch
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
From 839d247ff5d915079b3fa01b86fb3b57ca49c87c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 09:13:04 +0000
Subject: [PATCH] python3-poetry-core: upgrade 2.1.3 -> 2.2.1

---
 ...ython3-poetry-core_2.1.3.bb => python3-poetry-core_2.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_2.1.3.bb => python3-poetry-core_2.2.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.1.3.bb b/meta/recipes-devtools/python/python3-poetry-core_2.2.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-poetry-core_2.1.3.bb
rename to meta/recipes-devtools/python/python3-poetry-core_2.2.1.bb
index 12c4751de8..45af8768e9 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_2.1.3.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.2.1.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "0522a015477ed622c89aad56a477a57813cace0c8e7ff2a2906b7ef4a2e296a4"
+SRC_URI[sha256sum] = "97e50d8593c8729d3f49364b428583e044087ee3def1e010c6496db76bd65ac5"
 
 inherit python_poetry_core pypi
 
-- 
2.47.1


--===============6712953004938858576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-poetry-core: PKGV changed from 2.1.3 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-2.1.3.tar.gz;downloadfilename=poetry_core-2.1.3.tar.gz" to "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-2.2.1.tar.gz;downloadfilename=poetry_core-2.2.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-poetry-core: PV changed from "2.1.3" to "2.2.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PKGV changed from 2.1.3 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PV changed from "2.1.3" to "2.2.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dev: PKGV changed from 2.1.3 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-dev: PV changed from "2.1.3" to "2.2.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-doc: PKGV changed from 2.1.3 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-doc: PV changed from "2.1.3" to "2.2.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-locale: PKGV changed from 2.1.3 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-locale: PV changed from "2.1.3" to "2.2.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-src: PKGV changed from 2.1.3 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-src: PV changed from "2.1.3" to "2.2.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PKGV changed from 2.1.3 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PV changed from "2.1.3" to "2.2.1"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PKGV changed from 2.1.3 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: FILELIST: removed "/usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info/WHEEL /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info/LICENSE /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info/METADATA", added "/usr/lib/python3.13/site-packages/poetry_core-2.2.1.dist-info/METADATA /usr/lib/python3.13/site-packages/poetry_core-2.2.1.dist-info/WHEEL /usr/lib/python3.13/site-packages/poetry/core/json/schemas/dependency-groups-schema.json /usr/lib/python3.13/site-packages/poetry_core-2.2.1.dist-info/licenses/LICENSE"
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PKGSIZE changed from 2494216 to 2541004 (+2%)
packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: PV changed from "2.1.3" to "2.2.1"
Changes to packages/x86-64-v3-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-2.2.1.dist-info
  /usr/lib/python3.13/site-packages/poetry_core-2.2.1.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/poetry_core-2.2.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/poetry/core/json/schemas/dependency-groups-schema.json was added
  /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info/LICENSE was removed
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-2.2.1.dist-info
  /usr/lib/python3.13/site-packages/poetry_core-2.2.1.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/poetry_core-2.2.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/poetry/core/json/schemas/dependency-groups-schema.json was added
  /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info/LICENSE was removed

--===============6712953004938858576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-poetry-core/python3-poetry-core: FILELIST: removed "/usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info/METADATA /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info/LICENSE /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info/WHEEL", added "/usr/lib/python3.13/site-packages/poetry_core-2.2.1.dist-info/WHEEL /usr/lib/python3.13/site-packages/poetry_core-2.2.1.dist-info/licenses/LICENSE /usr/lib/python3.13/site-packages/poetry_core-2.2.1.dist-info/METADATA /usr/lib/python3.13/site-packages/poetry/core/json/schemas/dependency-groups-schema.json"
Changes to packages/x86-64-v3-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-2.2.1.dist-info
  /usr/lib/python3.13/site-packages/poetry_core-2.2.1.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/poetry_core-2.2.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/poetry/core/json/schemas/dependency-groups-schema.json was added
  /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info/LICENSE was removed
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-2.2.1.dist-info
  /usr/lib/python3.13/site-packages/poetry_core-2.2.1.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/poetry_core-2.2.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/poetry/core/json/schemas/dependency-groups-schema.json was added
  /usr/lib/python3.13/site-packages/poetry_core-2.1.3.dist-info/LICENSE was removed

--===============6712953004938858576==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-poetry-core-upgrade-2.1.3-2.2.1.patch"

RnJvbSA4MzlkMjQ3ZmY1ZDkxNTA3OWIzZmEwMWI4NmZiM2I1N2NhNDljODdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAwOToxMzowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcG9ldHJ5LWNvcmU6IHVwZ3JhZGUgMi4xLjMgLT4gMi4yLjEKCi0tLQogLi4ueXRob24z
LXBvZXRyeS1jb3JlXzIuMS4zLmJiID0+IHB5dGhvbjMtcG9ldHJ5LWNvcmVfMi4yLjEuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wb2V0cnktY29yZV8yLjEu
My5iYiA9PiBweXRob24zLXBvZXRyeS1jb3JlXzIuMi4xLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8yLjEuMy5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8yLjIu
MS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4xLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8yLjIuMS5iYgppbmRleCAx
MmM0NzUxZGU4Li40NWFmODc2OGU5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4xLjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzIuMi4xLmJiCkBAIC0xNSw3ICsxNSw3
IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiXAogICAgIGZpbGU6Ly9zcmMvcG9ldHJ5L2NvcmUvX3Zl
bmRvci90b21saS9MSUNFTlNFO21kNT1hYWFhZjA4NzlkMTdkZjAxMTBkMWFhOGM4YzlmNDZmNSBc
CiAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwNTIyYTAxNTQ3N2VkNjIyYzg5YWFkNTZhNDc3
YTU3ODEzY2FjZTBjOGU3ZmYyYTI5MDZiN2VmNGEyZTI5NmE0IgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjk3ZTUwZDg1OTNjODcyOWQzZjQ5MzY0YjQyODU4M2UwNDQwODdlZTNkZWYxZTAxMGM2NDk2
ZGI3NmJkNjVhYzUiCiAKIGluaGVyaXQgcHl0aG9uX3BvZXRyeV9jb3JlIHB5cGkKIAotLSAKMi40
Ny4xCgo=

--===============6712953004938858576==--

