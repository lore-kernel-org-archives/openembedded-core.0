Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5267C83F2A
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:23 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1426.1751386807841302544
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Q+HLvb1V;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=f+KURval;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010197c6c9fe6a-d404c753-d3fd-465f-befd-d978beafaeb7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386816;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Bh6lLSiRzyQfyNxAfwSGm4ReCKhH3LXWBkHTbK502+U=;
	b=Q+HLvb1VUzmpSrmHN/y6/AFwZpd0B+PrOuMehTQLy4CEzkAUmmAIO+JBQAO/wcg8
	pGzBD69L5M8qsrpAMLY/zxrr2J7CVcsSH9asbjmUsH5MAKm0KwEOD8Tupmg8rdXssi8
	1nuC3A/DOtTO1ZC3FqTJKpMlsjwosJ/DmhaBLXWU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386816;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Bh6lLSiRzyQfyNxAfwSGm4ReCKhH3LXWBkHTbK502+U=;
	b=f+KURvalGPBFfy9QDq44HpoMV2lRKgh+QBD11M0/xeba1wcsXaF2t6gfxFF2Z1qF
	QYmhKPO0ctLAHUmSu+qT4qXwRn9MSn6mNyUjY2ftCRfg9CfxZFn4OiaImcpVZ+GURPH
	stlfKz0NnUtENvGlnh3u4HcsSFgXoEUEGvKZzCh4=
Content-Type: multipart/mixed; boundary="===============8471468141696091304=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.25.4 SUCCEEDED
Message-ID: <01010197c6c9fe6a-d404c753-d3fd-465f-befd-d978beafaeb7-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219642

--===============8471468141696091304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.25.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.25.1-2.25.4.patch
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
From 3f667c3a56ffb6a30b3c5ddc47b25ce2b15f42e2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 09:50:34 +0000
Subject: [PATCH] python3-pdm: upgrade 2.25.1 -> 2.25.4

---
 .../python/{python3-pdm_2.25.1.bb => python3-pdm_2.25.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.25.1.bb => python3-pdm_2.25.4.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.25.1.bb b/meta/recipes-devtools/python/python3-pdm_2.25.4.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pdm_2.25.1.bb
rename to meta/recipes-devtools/python/python3-pdm_2.25.4.bb
index d9331ba72c..1e25e18974 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.25.1.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.25.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "3145251f37a3f94fa211ade992e7db7792da4c3e8e3eeeb1993d952adebe0b96"
+SRC_URI[sha256sum] = "bd655d789429928d6e27ff6693c19c82bc81aa75ba51d7b1c6102d039c8f211c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============8471468141696091304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.25.1.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.25.4.dist-info

--===============8471468141696091304==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.25.1-2.25.4.patch"

RnJvbSAzZjY2N2MzYTU2ZmZiNmEzMGIzYzVkZGM0N2IyNWNlMmIxNWY0MmUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwOTo1MDozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGRtOiB1cGdyYWRlIDIuMjUuMSAtPiAyLjI1LjQKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1wZG1fMi4yNS4xLmJiID0+IHB5dGhvbjMtcGRtXzIuMjUuNC5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wZG1fMi4yNS4xLmJiID0+IHB5dGhv
bjMtcGRtXzIuMjUuNC5iYn0gKDgyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjUuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1wZG1fMi4yNS40LmJiCnNpbWlsYXJpdHkgaW5kZXggODIlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG1fMi4yNS4xLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjUuNC5i
YgppbmRleCBkOTMzMWJhNzJjLi4xZTI1ZTE4OTc0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjUuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjUuNC5iYgpAQCAtNCw3ICs0LDcgQEAgTElD
RU5TRSA9ICJNSVQiCiBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTJlYjMxYTJjYzFhNzU4YzM0YjQ5OWYyODdkZDA0ZWYyIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzE0NTI1MWYzN2EzZjk0ZmEyMTFhZGU5OTJlN2RiNzc5
MmRhNGMzZThlM2VlZWIxOTkzZDk1MmFkZWJlMGI5NiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJi
ZDY1NWQ3ODk0Mjk5MjhkNmUyN2ZmNjY5M2MxOWM4MmJjODFhYTc1YmE1MWQ3YjFjNjEwMmQwMzlj
OGYyMTFjIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi0t
IAoyLjQ3LjEKCg==

--===============8471468141696091304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.25.1.tar.gz;downloadfilename=pdm-2.25.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.25.4.tar.gz;downloadfilename=pdm-2.25.4.tar.gz"
packages/core2-64-poky-linux/python3-pdm: PV changed from "2.25.1" to "2.25.4"
packages/core2-64-poky-linux/python3-pdm: PKGV changed from 2.25.1 [default] to 2.25.4 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.25.1" to "2.25.4"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.25.1 [default] to 2.25.4 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.25.1" to "2.25.4"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.25.1 [default] to 2.25.4 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.25.1" to "2.25.4"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.25.1 [default] to 2.25.4 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.25.1" to "2.25.4"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.25.1 [default] to 2.25.4 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.25.1" to "2.25.4"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.25.1 [default] to 2.25.4 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.25.1" to "2.25.4"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.25.1 [default] to 2.25.4 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PV changed from "2.25.1" to "2.25.4"
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.25.1 [default] to 2.25.4 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2232098 to 2239953 (+0%)
Changes to packages/core2-64-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.25.1.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.25.4.dist-info

--===============8471468141696091304==--

