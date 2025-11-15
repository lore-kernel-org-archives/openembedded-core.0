Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A269CCED240
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:52 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11925.1763224707999583407
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=p2TuTT+t;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ic5WUChg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019a886226a0-556e352c-13f0-4e4f-8d6d-58707ee372f2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=japFzGIB+JjEgtC/VY9wJmZhsJC6O901/dhD+5Nl7f8=;
	b=p2TuTT+tG1HDlfPdk2JkhbUmrAoGaMq3XBgxn1ndwLnCS+l/FigbKCwr9aXMoJhD
	sJ16Xl3n3U8YsZlKb4nicMYVkF2YdQgAK1tWNx6G2b71+ePx88XhsTQXzZgyKvL1gJO
	g+PW5WmKqz56OUc8UkFIU3izce53hXmciNInOdUc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=japFzGIB+JjEgtC/VY9wJmZhsJC6O901/dhD+5Nl7f8=;
	b=ic5WUChgedKXty98hB+atxazwNFEQI0mZo+Y/hPUMUEbYt+BMMXoISOf4ELSN5Qk
	uBrqHh8BdRSblAIqhHdNUnWiQ7MUVSN0bIaobMFdFuwoi6OjxmQWInQ6I5pv1IK4hb8
	E8gJzw5n4AqsN8fWHBZg2psPr0KSgWOuCU+ltH6w=
Content-Type: multipart/mixed; boundary="===============8616837367287827027=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dbusmock: upgrading to 0.37.1 SUCCEEDED
Message-ID: <0101019a886226a0-556e352c-13f0-4e4f-8d6d-58707ee372f2-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226355

--===============8616837367287827027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dbusmock* to *0.37.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dbusmock-upgrade-0.37.0-0.37.1.patch
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
From fce0832cbd0439608d3b99c208339dcf1f2201ff Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 10:12:40 +0000
Subject: [PATCH] python3-dbusmock: upgrade 0.37.0 -> 0.37.1

---
 .../{python3-dbusmock_0.37.0.bb => python3-dbusmock_0.37.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.37.0.bb => python3-dbusmock_0.37.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.37.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.37.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-dbusmock_0.37.0.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.37.1.bb
index 50c46abc95..57de7b60ff 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.37.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.37.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "38754c5ad2ad8f3936ff67d4b058bca416588a72bc094e91ded9f8f401b06310"
+SRC_URI[sha256sum] = "a65aeedc17d8bbc1f0bf3f0b295988914c48619882d77b9afa4117eed95fc594"
 
 PYPI_PACKAGE = "python_dbusmock"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============8616837367287827027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-dbusmock: PV changed from "0.37.0" to "0.37.1"
packages/x86-64-v3-poky-linux/python3-dbusmock: PKGV changed from 0.37.0 [default] to 0.37.1 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/python_dbusmock/python_dbusmock-0.37.0.tar.gz;downloadfilename=python_dbusmock-0.37.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/python_dbusmock/python_dbusmock-0.37.1.tar.gz;downloadfilename=python_dbusmock-0.37.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PV changed from "0.37.0" to "0.37.1"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-dbg: PKGV changed from 0.37.0 [default] to 0.37.1 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-dev: PV changed from "0.37.0" to "0.37.1"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-dev: PKGV changed from 0.37.0 [default] to 0.37.1 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-doc: PV changed from "0.37.0" to "0.37.1"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-doc: PKGV changed from 0.37.0 [default] to 0.37.1 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-locale: PV changed from "0.37.0" to "0.37.1"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-locale: PKGV changed from 0.37.0 [default] to 0.37.1 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-src: PV changed from "0.37.0" to "0.37.1"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-src: PKGV changed from 0.37.0 [default] to 0.37.1 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PV changed from "0.37.0" to "0.37.1"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock-staticdev: PKGV changed from 0.37.0 [default] to 0.37.1 [default]
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock: PKGSIZE changed from 490071 to 490067 (-0%)
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock: PV changed from "0.37.0" to "0.37.1"
packages/x86-64-v3-poky-linux/python3-dbusmock/python3-dbusmock: PKGV changed from 0.37.0 [default] to 0.37.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.13/site-packages/python_dbusmock-0.37.0.dist-info moved to /usr/lib/python3.13/site-packages/python_dbusmock-0.37.1.dist-info

--===============8616837367287827027==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dbusmock-upgrade-0.37.0-0.37.1.patch"

RnJvbSBmY2UwODMyY2JkMDQzOTYwOGQzYjk5YzIwODMzOWRjZjFmMjIwMWZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTA6MTI6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWRidXNtb2NrOiB1cGdyYWRlIDAuMzcuMCAtPiAwLjM3LjEKCi0tLQogLi4uL3tweXRo
b24zLWRidXNtb2NrXzAuMzcuMC5iYiA9PiBweXRob24zLWRidXNtb2NrXzAuMzcuMS5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kYnVzbW9ja18wLjM3LjAu
YmIgPT4gcHl0aG9uMy1kYnVzbW9ja18wLjM3LjEuYmJ9ICg4OCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRidXNtb2NrXzAuMzcuMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kYnVzbW9ja18wLjM3LjEuYmIKc2lt
aWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWRidXNtb2NrXzAuMzcuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWRidXNtb2NrXzAuMzcuMS5iYgppbmRleCA1MGM0NmFiYzk1Li41
N2RlN2I2MGZmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtZGJ1c21vY2tfMC4zNy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1kYnVzbW9ja18wLjM3LjEuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0
dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9weXRob24tZGJ1c21vY2svIgogTElDRU5TRSA9ICJHUEwt
My4wLW9ubHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1lNmE2MDBm
ZDVlMWQ5Y2JkZTJkOTgzNjgwMjMzYWQwMiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM4NzU0
YzVhZDJhZDhmMzkzNmZmNjdkNGIwNThiY2E0MTY1ODhhNzJiYzA5NGU5MWRlZDlmOGY0MDFiMDYz
MTAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTY1YWVlZGMxN2Q4YmJjMWYwYmYzZjBiMjk1OTg4
OTE0YzQ4NjE5ODgyZDc3YjlhZmE0MTE3ZWVkOTVmYzU5NCIKIAogUFlQSV9QQUNLQUdFID0gInB5
dGhvbl9kYnVzbW9jayIKIFVQU1RSRUFNX0NIRUNLX1BZUElfUEFDS0FHRSA9ICIke1BZUElfUEFD
S0FHRX0iCi0tIAoyLjQ3LjEKCg==

--===============8616837367287827027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-dbusmock (sysroot):
  /usr/lib/python3.13/site-packages/python_dbusmock-0.37.0.dist-info moved to /usr/lib/python3.13/site-packages/python_dbusmock-0.37.1.dist-info

--===============8616837367287827027==--

