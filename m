Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420BEC79F94
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 06:28:40 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3417.1788589715774989761
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 23:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aTwxag9r;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Jevfvpow;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a070412cfb-39566b44-11c2-40a1-bd18-28b2ccb90808-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788589714;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kA/y2hikEEFCmcRVv/K9tWedMMCoYgJosd3E4UacQ6Y=;
	b=aTwxag9r+o6TFC3SDiHRl4AM70xHV1mL7HB4tumPOcK+FafgL0J5+JJWcwZwp6ij
	+bM6aBk4ovjzGxMaNi5JR2SWsmjdBkx8/nzwZURMvO95dpwSzYCiKAb7gI0fzX7DLTK
	E86ANbIepZBRIDq20UgQwWJv2iR+S+4yJbDh6JSE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788589714;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kA/y2hikEEFCmcRVv/K9tWedMMCoYgJosd3E4UacQ6Y=;
	b=JevfvpowxP7WxVHcXVZ919qdrEHTEW5i1TaEllYVw5AcnXfQ193DumVpB5YD6xSO
	fhspVNGJxR7Zk/RCqf2c+aSdmHI5gqiRu5ii8NA+bPVmS4ejBKSES6t2XuIH8tV4B9I
	meu6nGSqmCULfJ1HPwgEBdADyCIm0qsNgqfbU/vk=
Content-Type: multipart/mixed; boundary="===============4807786979830765518=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytz: upgrading to 2026.3.post1 SUCCEEDED
Message-ID: <010101a070412cfb-39566b44-11c2-40a1-bd18-28b2ccb90808-000000@us-west-2.amazonses.com>
Date: Sat, 5 Sep 2026 06:28:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.05-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 06:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245136

--===============4807786979830765518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pytz* to *2026.3.post1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytz-upgrade-2026.3-2026.3.post1.patch
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
From 49157591fd5e0c0b996a98c15b9aea28d86d8b32 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 5 Sep 2026 06:09:03 +0000
Subject: [PATCH] python3-pytz: upgrade 2026.3 -> 2026.3.post1

---
 .../{python3-pytz_2026.3.bb => python3-pytz_2026.3.post1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2026.3.bb => python3-pytz_2026.3.post1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2026.3.bb b/meta/recipes-devtools/python/python3-pytz_2026.3.post1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pytz_2026.3.bb
rename to meta/recipes-devtools/python/python3-pytz_2026.3.post1.bb
index cfcf33c837..2190b7dc13 100644
--- a/meta/recipes-devtools/python/python3-pytz_2026.3.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2026.3.post1.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3 ptest-python-pytest
 
 PTEST_PYTEST_DIR = "pytz/tests"
 
-SRC_URI[sha256sum] = "3a30feb7a1a04cf0fa0be1624415930843b02f012eb800380f36f906a723e4ae"
+SRC_URI[sha256sum] = "2211d3fcf9a797d3405cac96ac7f61d80e6a644f72a3309607282fe8a2010c5d"
 
 RDEPENDS:${PN}:class-target += "\
     python3-datetime \
-- 
2.47.1


--===============4807786979830765518==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytz-upgrade-2026.3-2026.3.post1.patch"

RnJvbSA0OTE1NzU5MWZkNWUwYzBiOTk2YTk4YzE1YjlhZWEyOGQ4NmQ4YjMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNSBTZXAgMjAyNiAwNjowOTowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHl0ejogdXBncmFkZSAyMDI2LjMgLT4gMjAyNi4zLnBvc3QxCgotLS0KIC4uLi97cHl0
aG9uMy1weXR6XzIwMjYuMy5iYiA9PiBweXRob24zLXB5dHpfMjAyNi4zLnBvc3QxLmJifSAgICB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHl0el8yMDI2LjMuYmIg
PT4gcHl0aG9uMy1weXR6XzIwMjYuMy5wb3N0MS5iYn0gKDg3JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0el8yMDI2LjMuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0el8yMDI2LjMucG9zdDEuYmIKc2ltaWxh
cml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXB5dHpfMjAyNi4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcHl0el8yMDI2LjMucG9zdDEuYmIKaW5kZXggY2ZjZjMzYzgzNy4uMjE5MGI3
ZGMxMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5
dHpfMjAyNi4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
eXR6XzIwMjYuMy5wb3N0MS5iYgpAQCAtNyw3ICs3LDcgQEAgaW5oZXJpdCBweXBpIHNldHVwdG9v
bHMzIHB0ZXN0LXB5dGhvbi1weXRlc3QKIAogUFRFU1RfUFlURVNUX0RJUiA9ICJweXR6L3Rlc3Rz
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2EzMGZlYjdhMWEwNGNmMGZhMGJlMTYyNDQxNTkz
MDg0M2IwMmYwMTJlYjgwMDM4MGYzNmY5MDZhNzIzZTRhZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICIyMjExZDNmY2Y5YTc5N2QzNDA1Y2FjOTZhYzdmNjFkODBlNmE2NDRmNzJhMzMwOTYwNzI4MmZl
OGEyMDEwYzVkIgogCiBSREVQRU5EUzoke1BOfTpjbGFzcy10YXJnZXQgKz0gIlwKICAgICBweXRo
b24zLWRhdGV0aW1lIFwKLS0gCjIuNDcuMQoK

--===============4807786979830765518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pytz: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2026.3.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2026.3.post1.tar.gz"
packages/x86-64-v3-poky-linux/python3-pytz: PV changed from "2026.3" to "2026.3.post1"
packages/x86-64-v3-poky-linux/python3-pytz: PKGV changed from 2026.3 [default] to 2026.3.post1 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-dbg: PV changed from "2026.3" to "2026.3.post1"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-dbg: PKGV changed from 2026.3 [default] to 2026.3.post1 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-dev: PV changed from "2026.3" to "2026.3.post1"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-dev: PKGV changed from 2026.3 [default] to 2026.3.post1 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-doc: PV changed from "2026.3" to "2026.3.post1"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-doc: PKGV changed from 2026.3 [default] to 2026.3.post1 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-locale: PV changed from "2026.3" to "2026.3.post1"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-locale: PKGV changed from 2026.3 [default] to 2026.3.post1 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-ptest: PV changed from "2026.3" to "2026.3.post1"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-ptest: PKGV changed from 2026.3 [default] to 2026.3.post1 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-ptest: PKGSIZE changed from 60073 to 60079 (+0%)
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-src: PV changed from "2026.3" to "2026.3.post1"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-src: PKGV changed from 2026.3 [default] to 2026.3.post1 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-staticdev: PV changed from "2026.3" to "2026.3.post1"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz-staticdev: PKGV changed from 2026.3 [default] to 2026.3.post1 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info -> /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info, directory renamed /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: PV changed from "2026.3" to "2026.3.post1"
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: PKGV changed from 2026.3 [default] to 2026.3.post1 [default]
packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: PKGSIZE changed from 1042555 to 1042572 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info was added
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/zip-safe was added
  /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info/zip-safe was removed
Changes to packages/x86_64-linux/python3-flit-core-native (sysroot):
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/RECORD was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core was removed
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core/vendor was removed
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/RECORD was removed
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/WHEEL was removed

--===============4807786979830765518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pytz/python3-pytz: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info -> /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info was added
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/pytz-2026.3.post1.dist-info/zip-safe was added
  /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/pytz-2026.3.dist-info/zip-safe was removed
Changes to packages/x86_64-linux/python3-flit-core-native (sysroot):
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/RECORD was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core was removed
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core/vendor was removed
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/RECORD was removed
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/WHEEL was removed

--===============4807786979830765518==--

