Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F91D47CCA
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:52 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1438.1768526749311986654
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=A2+w/dlM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YEQFJJ8w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019bc4689bbc-4400f28b-4fdd-4d5e-bb72-2c4424972a49-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ckSLsE6qQnq27n3POrMBk+VOKD4t+M4D+qfwY1LoWJ8=;
	b=A2+w/dlMrNk0qLRO4bk2XJqY9ulQV7G1KIdkiv2F/koV21jBLeyhDMMMK6V1MeVA
	f/q1rDZh6CL/tRKniWoT0b635z4rQTCbvAa+t3KEjHWS2sK9STwPnDEYteHAYavGWii
	8pJRW1JybSK1K+1uaGDJQVbjdLi8BcFmem02sXlE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ckSLsE6qQnq27n3POrMBk+VOKD4t+M4D+qfwY1LoWJ8=;
	b=YEQFJJ8wCwjT3AeVhDMdt5bXNLlVCPitqu2Vcd4C7oRhQXzZzJUAuuqRO72OXEpC
	pbG8QLGD2appOKVgqVhDCtomrAhC/YTCZAc3wdKmN/g9KwlgGSXkuApP/2Zl813MvBG
	q8MCrmy9zFyjIlnqpL59fu4UGHE5Kedfz2dk2reI=
Content-Type: multipart/mixed; boundary="===============6022971384405436145=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx-rtd-theme: upgrading to 3.1.0 SUCCEEDED
Message-ID: <0101019bc4689bbc-4400f28b-4fdd-4d5e-bb72-2c4424972a49-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229471

--===============6022971384405436145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sphinx-rtd-theme* to *3.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-rtd-theme-upgrade-3.0.2-3.1.0.patch
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
From 28a42da822083621f244ddc326c8fc3649203b5e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 21:51:23 +0000
Subject: [PATCH] python3-sphinx-rtd-theme: upgrade 3.0.2 -> 3.1.0

---
 ...inx-rtd-theme_3.0.2.bb => python3-sphinx-rtd-theme_3.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx-rtd-theme_3.0.2.bb => python3-sphinx-rtd-theme_3.1.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.2.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.1.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.2.bb
rename to meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.1.0.bb
index 03e7a50125..05e2c097c5 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.2.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.1.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += " \
 PYPI_PACKAGE = "sphinx_rtd_theme"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "b7457bc25dda723b20b086a670b9953c859eab60a2a03ee8eb2bb23e176e5f85"
+SRC_URI[sha256sum] = "b44276f2c276e909239a4f6c955aa667aaafeb78597923b1c60babc76db78e4c"
 
 inherit setuptools3 pypi
 
-- 
2.47.1


--===============6022971384405436145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: FILELIST: directory renamed /usr/lib/python3.13/site-packages/sphinx_rtd_theme-3.0.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/sphinx_rtd_theme-3.1.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/sphinx_rtd_theme-3.0.2.dist-info -> /usr/lib/python3.13/site-packages/sphinx_rtd_theme-3.1.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme (sysroot):
  /usr/lib/python3.13/site-packages/sphinx_rtd_theme-3.0.2.dist-info moved to /usr/lib/python3.13/site-packages/sphinx_rtd_theme-3.1.0.dist-info

--===============6022971384405436145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx_rtd_theme/sphinx_rtd_theme-3.0.2.tar.gz;downloadfilename=sphinx_rtd_theme-3.0.2.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx_rtd_theme/sphinx_rtd_theme-3.1.0.tar.gz;downloadfilename=sphinx_rtd_theme-3.1.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme: PKGV changed from 3.0.2 [default] to 3.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme: PV changed from "3.0.2" to "3.1.0"
packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dbg: PKGV changed from 3.0.2 [default] to 3.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dbg: PV changed from "3.0.2" to "3.1.0"
packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dev: PKGV changed from 3.0.2 [default] to 3.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dev: PV changed from "3.0.2" to "3.1.0"
packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-doc: PKGV changed from 3.0.2 [default] to 3.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-doc: PV changed from "3.0.2" to "3.1.0"
packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-locale: PKGV changed from 3.0.2 [default] to 3.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-locale: PV changed from "3.0.2" to "3.1.0"
packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-src: PKGV changed from 3.0.2 [default] to 3.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-src: PV changed from "3.0.2" to "3.1.0"
packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-staticdev: PKGV changed from 3.0.2 [default] to 3.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-staticdev: PV changed from "3.0.2" to "3.1.0"
packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PKGSIZE changed from 9956839 to 9956967 (+0%)
packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: FILELIST: directory renamed /usr/lib/python3.13/site-packages/sphinx_rtd_theme-3.0.2.dist-info -> /usr/lib/python3.13/site-packages/sphinx_rtd_theme-3.1.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/sphinx_rtd_theme-3.0.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/sphinx_rtd_theme-3.1.0.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PKGV changed from 3.0.2 [default] to 3.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PV changed from "3.0.2" to "3.1.0"
Changes to packages/x86-64-v3-poky-linux/python3-sphinx-rtd-theme (sysroot):
  /usr/lib/python3.13/site-packages/sphinx_rtd_theme-3.0.2.dist-info moved to /usr/lib/python3.13/site-packages/sphinx_rtd_theme-3.1.0.dist-info

--===============6022971384405436145==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-rtd-theme-upgrade-3.0.2-3.1.0.patch"

RnJvbSAyOGE0MmRhODIyMDgzNjIxZjI0NGRkYzMyNmM4ZmMzNjQ5MjAzYjVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjE6NTE6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueC1ydGQtdGhlbWU6IHVwZ3JhZGUgMy4wLjIgLT4gMy4xLjAKCi0tLQogLi4u
aW54LXJ0ZC10aGVtZV8zLjAuMi5iYiA9PiBweXRob24zLXNwaGlueC1ydGQtdGhlbWVfMy4xLjAu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zcGhpbngtcnRk
LXRoZW1lXzMuMC4yLmJiID0+IHB5dGhvbjMtc3BoaW54LXJ0ZC10aGVtZV8zLjEuMC5iYn0gKDg5
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3Bo
aW54LXJ0ZC10aGVtZV8zLjAuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1zcGhpbngtcnRkLXRoZW1lXzMuMS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODklCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbngtcnRkLXRo
ZW1lXzMuMC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc3BoaW54LXJ0ZC10aGVtZV8zLjEuMC5iYgppbmRleCAwM2U3YTUwMTI1Li4wNWUyYzA5N2M1
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54
LXJ0ZC10aGVtZV8zLjAuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc3BoaW54LXJ0ZC10aGVtZV8zLjEuMC5iYgpAQCAtMTUsNyArMTUsNyBAQCBSREVQRU5E
Uzoke1BOfSArPSAiIFwKIFBZUElfUEFDS0FHRSA9ICJzcGhpbnhfcnRkX3RoZW1lIgogVVBTVFJF
QU1fQ0hFQ0tfUFlQSV9QQUNLQUdFID0gIiR7UFlQSV9QQUNLQUdFfSIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImI3NDU3YmMyNWRkYTcyM2IyMGIwODZhNjcwYjk5NTNjODU5ZWFiNjBhMmEwM2Vl
OGViMmJiMjNlMTc2ZTVmODUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjQ0Mjc2ZjJjMjc2ZTkw
OTIzOWE0ZjZjOTU1YWE2NjdhYWFmZWI3ODU5NzkyM2IxYzYwYmFiYzc2ZGI3OGU0YyIKIAogaW5o
ZXJpdCBzZXR1cHRvb2xzMyBweXBpCiAKLS0gCjIuNDcuMQoK

--===============6022971384405436145==--

