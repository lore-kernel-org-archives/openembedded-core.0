Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C9DECA0EE3
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:01 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.88800.1754057267128198881
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JknGoIVR;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NSi+yWGP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019865f5e6c0-15c5ab4e-609d-47ad-85f8-30264df43e8d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057271;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qVWnu3VqXk2R25rZchXwSXEvT14Zg/2G+vy4o1+uzj8=;
	b=JknGoIVRnt4dvx4Ow+UNjERV1KS82lmSx8rF4t6xyM4amSwdPGSDnRLCF0RhYu11
	gF/TYgPi1cb5xUnGI2F1GwiewNcUl0QCtakfUqc+mGVcMBHV2ww/GUtusw+7XoBuMQK
	/1rz9YEnlWGy91AUZdioAEEud4L1ALXUZW64D6rE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057271;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qVWnu3VqXk2R25rZchXwSXEvT14Zg/2G+vy4o1+uzj8=;
	b=NSi+yWGPTsYj4NgdSDSNWzcwmH09ronW4bI+BsskkQ57dw3skaeS+2n1qfkbJexz
	R/nBt1/oQOc6/bAA5aVNExUx51fdtOBOMttZ7n2ghUUscctAVz/WideTMunSY8qcxx0
	TB9iSnjyBu31pmv/M88KC97e3rpS4pMTPisurIsM=
Content-Type: multipart/mixed; boundary="===============8777563282135879579=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-click: upgrading to 8.2.1 SUCCEEDED
Message-ID: <0101019865f5e6c0-15c5ab4e-609d-47ad-85f8-30264df43e8d-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221272

--===============8777563282135879579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-click* to *8.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-click-upgrade-8.1.8-8.2.1.patch
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
From 00f621235f05d7e130b29d9dec1bc3c0bec62647 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 09:18:50 +0000
Subject: [PATCH] python3-click: upgrade 8.1.8 -> 8.2.1

---
 .../python/{python3-click_8.1.8.bb => python3-click_8.2.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-click_8.1.8.bb => python3-click_8.2.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-click_8.1.8.bb b/meta/recipes-devtools/python/python3-click_8.2.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-click_8.1.8.bb
rename to meta/recipes-devtools/python/python3-click_8.2.1.bb
index 7be3d73546..05be963309 100644
--- a/meta/recipes-devtools/python/python3-click_8.1.8.bb
+++ b/meta/recipes-devtools/python/python3-click_8.2.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a"
+SRC_URI[sha256sum] = "27c491cc05d968d271d5a1db13e3b5a184636d9d930f148c50b038f0d0646202"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.1


--===============8777563282135879579==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-click-upgrade-8.1.8-8.2.1.patch"

RnJvbSAwMGY2MjEyMzVmMDVkN2UxMzBiMjlkOWRlYzFiYzNjMGJlYzYyNjQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAwOToxODo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2xpY2s6IHVwZ3JhZGUgOC4xLjggLT4gOC4yLjEKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1jbGlja184LjEuOC5iYiA9PiBweXRob24zLWNsaWNrXzguMi4xLmJifSAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jbGlja184LjEuOC5iYiA9PiBweXRo
b24zLWNsaWNrXzguMi4xLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jbGlja184LjEuOC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1jbGlja184LjIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC4xLjgu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jbGlja184
LjIuMS5iYgppbmRleCA3YmUzZDczNTQ2Li4wNWJlOTYzMzA5IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC4xLjguYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzguMi4xLmJiCkBAIC04LDcgKzgs
NyBAQCBIT01FUEFHRSA9ICJodHRwOi8vY2xpY2sucG9jb28ub3JnLyIKIExJQ0VOU0UgPSAiQlNE
LTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTFm
YTk4MjMyZmQ2NDU2MDg5MzdhMGZkYzgyZTk5OWI4IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
ZWQ1M2M5ZDg5OTBkODNjMmEyN2RlYWU2OGU0ZWUzMzc0NzNmNjMzMGMwNDBhMzFkNDIyNWM5NTc0
ZDE2MDk2YSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyN2M0OTFjYzA1ZDk2OGQyNzFkNWExZGIx
M2UzYjVhMTg0NjM2ZDlkOTMwZjE0OGM1MGIwMzhmMGQwNjQ2MjAyIgogCiBpbmhlcml0IHB5cGkg
cHl0aG9uX2ZsaXRfY29yZSBwdGVzdC1weXRob24tcHl0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============8777563282135879579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-click: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/click/click-8.1.8.tar.gz;downloadfilename=click-8.1.8.tar.gz" to "https://files.pythonhosted.org/packages/source/c/click/click-8.2.1.tar.gz;downloadfilename=click-8.2.1.tar.gz"
packages/core2-64-poky-linux/python3-click: PV changed from "8.1.8" to "8.2.1"
packages/core2-64-poky-linux/python3-click: PKGV changed from 8.1.8 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-click/python3-click-dbg: PV changed from "8.1.8" to "8.2.1"
packages/core2-64-poky-linux/python3-click/python3-click-dbg: PKGV changed from 8.1.8 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-click/python3-click-dev: PV changed from "8.1.8" to "8.2.1"
packages/core2-64-poky-linux/python3-click/python3-click-dev: PKGV changed from 8.1.8 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-click/python3-click-doc: PV changed from "8.1.8" to "8.2.1"
packages/core2-64-poky-linux/python3-click/python3-click-doc: PKGV changed from 8.1.8 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-click/python3-click-locale: PV changed from "8.1.8" to "8.2.1"
packages/core2-64-poky-linux/python3-click/python3-click-locale: PKGV changed from 8.1.8 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/options.rst /usr/lib/python3-click/ptest/docs/upgrading.rst /usr/lib/python3-click/ptest/docs/testing.rst", added "/usr/lib/python3-click/ptest/docs/click-concepts.rst /usr/lib/python3-click/ptest/docs/entry-points.rst /usr/lib/python3-click/ptest/docs/extending-click.rst /usr/lib/python3-click/ptest/docs/faqs.md /usr/lib/python3-click/ptest/docs/options.md /usr/lib/python3-click/ptest/docs/parameter-types.rst /usr/lib/python3-click/ptest/docs/testing.md /usr/lib/python3-click/ptest/docs/option-decorators.rst /usr/lib/python3-click/ptest/tests/typing/typing_progressbar.py /usr/lib/python3-click/ptest/docs/commands-and-groups.rst"
packages/core2-64-poky-linux/python3-click/python3-click-ptest: PKGSIZE changed from 389066 to 418448 (+8%)
packages/core2-64-poky-linux/python3-click/python3-click-ptest: PV changed from "8.1.8" to "8.2.1"
packages/core2-64-poky-linux/python3-click/python3-click-ptest: PKGV changed from 8.1.8 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-click/python3-click-src: PV changed from "8.1.8" to "8.2.1"
packages/core2-64-poky-linux/python3-click/python3-click-src: PKGV changed from 8.1.8 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-click/python3-click-staticdev: PV changed from "8.1.8" to "8.2.1"
packages/core2-64-poky-linux/python3-click/python3-click-staticdev: PKGV changed from 8.1.8 [default] to 8.2.1 [default]
packages/core2-64-poky-linux/python3-click/python3-click: PKGSIZE changed from 799194 to 801292 (+0%)
packages/core2-64-poky-linux/python3-click/python3-click: PV changed from "8.1.8" to "8.2.1"
packages/core2-64-poky-linux/python3-click/python3-click: PKGV changed from 8.1.8 [default] to 8.2.1 [default]
Changes to packages/core2-64-poky-linux/python3-click (sysroot):
  /usr/lib/python3.13/site-packages/click-8.1.8.dist-info moved to /usr/lib/python3.13/site-packages/click-8.2.1.dist-info

--===============8777563282135879579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/options.rst /usr/lib/python3-click/ptest/docs/upgrading.rst /usr/lib/python3-click/ptest/docs/testing.rst", added "/usr/lib/python3-click/ptest/docs/click-concepts.rst /usr/lib/python3-click/ptest/docs/faqs.md /usr/lib/python3-click/ptest/docs/extending-click.rst /usr/lib/python3-click/ptest/docs/testing.md /usr/lib/python3-click/ptest/docs/options.md /usr/lib/python3-click/ptest/docs/option-decorators.rst /usr/lib/python3-click/ptest/tests/typing/typing_progressbar.py /usr/lib/python3-click/ptest/docs/commands-and-groups.rst /usr/lib/python3-click/ptest/docs/entry-points.rst /usr/lib/python3-click/ptest/docs/parameter-types.rst"
Changes to packages/core2-64-poky-linux/python3-click (sysroot):
  /usr/lib/python3.13/site-packages/click-8.1.8.dist-info moved to /usr/lib/python3.13/site-packages/click-8.2.1.dist-info

--===============8777563282135879579==--

