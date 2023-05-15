Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74032CA9EBC
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.3716.1684186748382786239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SpyRY23B;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010188215a5307-5e7e2d7d-0ccb-4475-8706-bc4e43c3a66f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YFllEm7yFa9mxu3UxKyaBr3VF1Sk5U0prNTTGTUrpRM=;
	b=SpyRY23Bjo3woDV45VLTluEKId8asYOifCA7FoebNHJCyv5aMNvjn14z5ds3111G
	4gsDFJB2vxjimLEbHNJGw9y7DtairOifGHol/rI8wYlN/KoLUCCdAZZ8JV7HLBl4fvk
	YV+8Z9vjwiNthaUZm1eoBvvQkXcj/AwK4tjxwzCk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YFllEm7yFa9mxu3UxKyaBr3VF1Sk5U0prNTTGTUrpRM=;
	b=ok7d9+hyG0C5I7L8euChv+NQMulCObl5dmdLmRuEwZuNPFt0CtdM9smtu3nPfuYE
	EvZiSgBRMSdblgChJF5l8FfpNlnL8ems96rGKwDDhLk2oZ8HFGokSZJ8zl224gvESM6
	PleHEBH54DPGzgViWZPUpFeN4t3dInd7PvKGKmqY=
Content-Type: multipart/mixed; boundary="===============6997896507130992736=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-ruamel-yaml: upgrading to 0.17.26 SUCCEEDED
Message-ID: <01010188215a5307-5e7e2d7d-0ccb-4475-8706-bc4e43c3a66f-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181317

--===============6997896507130992736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-ruamel-yaml* to *0.17.26* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-ruamel-yaml-upgrade-0.17.21-0.17.26.patch
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
--===============6997896507130992736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-ruamel-yaml: PV changed from "0.17.21" to "0.17.26"
packages/core2-32-poky-linux/python3-ruamel-yaml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.17.21.tar.gz;downloadfilename=ruamel.yaml-0.17.21.tar.gz" to "https://files.pythonhosted.org/packages/source/r/ruamel.yaml/ruamel.yaml-0.17.26.tar.gz;downloadfilename=ruamel.yaml-0.17.26.tar.gz"
packages/core2-32-poky-linux/python3-ruamel-yaml: PKGV changed from 0.17.21 [default] to 0.17.26 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PV changed from "0.17.21" to "0.17.26"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dbg: PKGV changed from 0.17.21 [default] to 0.17.26 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PV changed from "0.17.21" to "0.17.26"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-dev: PKGV changed from 0.17.21 [default] to 0.17.26 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PV changed from "0.17.21" to "0.17.26"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-doc: PKGV changed from 0.17.21 [default] to 0.17.26 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PV changed from "0.17.21" to "0.17.26"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-locale: PKGV changed from 0.17.21 [default] to 0.17.26 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PV changed from "0.17.21" to "0.17.26"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-src: PKGV changed from 0.17.21 [default] to 0.17.26 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PV changed from "0.17.21" to "0.17.26"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml-staticdev: PKGV changed from 0.17.21 [default] to 0.17.26 [default]
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGSIZE changed from 1173286 to 1197952 (+2%)
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: FILELIST: removed "/usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21-py3.11-nspkg.pth /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/WHEEL /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/namespace_packages.txt /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/top_level.txt /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/LICENSE /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/RECORD /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/METADATA", added "/usr/lib/python3.11/site-packages/ruamel.yaml-0.17.26.dist-info/WHEEL /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.26.dist-info/top_level.txt /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.26.dist-info/LICENSE /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.26.dist-info/RECORD /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.26.dist-info/METADATA"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PV changed from "0.17.21" to "0.17.26"
packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: PKGV changed from 0.17.21 [default] to 0.17.26 [default]
Changes to packages/core2-32-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info moved to /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.26.dist-info
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/namespace_packages.txt was removed
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21-py3.11-nspkg.pth was removed

--===============6997896507130992736==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-ruamel-yaml-upgrade-0.17.21-0.17.26.patch"

RnJvbSBhZjFiZDQ1YzZkMDczZGE3NDQ3YTkyOTgxNjU5M2QzMzdlZTQ0MDhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTI6MTc6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXJ1YW1lbC15YW1sOiB1cGdyYWRlIDAuMTcuMjEgLT4gMC4xNy4yNgoKLS0tCiAuLi43
LjIxLmJiID0+IHB5dGhvbjMtcnVhbWVsLXlhbWxfMC4xNy4yNi5iYn0gfCAyNSArKysrKysrKysr
KysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXJ1YW1lbC15
YW1sXzAuMTcuMjEuYmIgPT4gcHl0aG9uMy1ydWFtZWwteWFtbF8wLjE3LjI2LmJifSAoMzUlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ydWFtZWwt
eWFtbF8wLjE3LjIxLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1
YW1lbC15YW1sXzAuMTcuMjYuYmIKc2ltaWxhcml0eSBpbmRleCAzNSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJ1YW1lbC15YW1sXzAuMTcuMjEuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ydWFtZWwteWFt
bF8wLjE3LjI2LmJiCmluZGV4IDdkNjVjNGMyZDguLjNhYTU0MjU3YTcgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ydWFtZWwteWFtbF8wLjE3LjIxLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ydWFtZWwteWFtbF8w
LjE3LjI2LmJiCkBAIC0xLDE1ICsxLDM2IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NV
TSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBm
b2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxp
Y2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQs
IGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAn
TGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHly
aWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5T
RQorIyArKysgTElDRU5TRQorIyBAQCAtMSw2ICsxLDYgQEAKKyMgICBUaGUgTUlUIExpY2Vuc2Ug
KE1JVCkKKyMgIAorIyAtIENvcHlyaWdodCAoYykgMjAxNC0yMDIyIEFudGhvbiB2YW4gZGVyIE5l
dXQsIFJ1YW1lbCBidmJhCisjICsgQ29weXJpZ2h0IChjKSAyMDE0LTIwMjMgQW50aG9uIHZhbiBk
ZXIgTmV1dCwgUnVhbWVsIGJ2YmEKKyMgIAorIyAgIFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50
ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBhIGNvcHkKKyMgICBv
ZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAi
U29mdHdhcmUiKSwgdG8gZGVhbAorIyAKKyMKKwogU1VNTUFSWSA9ICJZQU1MIHBhcnNlci9lbWl0
dGVyIHRoYXQgc3VwcG9ydHMgcm91bmR0cmlwIHByZXNlcnZhdGlvbiBvZiBjb21tZW50cywgc2Vx
L21hcCBmbG93IHN0eWxlLCBhbmQgbWFwIGtleSBvcmRlci4iCiBIT01FUEFHRSA9ICJodHRwczov
L3B5cGkub3JnL3Byb2plY3QvcnVhbWVsLnlhbWwvIgogQVVUSE9SID0gIkFudGhvbiB2YW4gZGVy
IE5ldXQiCiAKIExJQ0VOU0UgPSAiTUlUIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRTttZDU9MDM0MTU0YjczNDRkMTU0MzhiYzVlZDVlZTljYzA3NWYiCitMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0wZTVmNDFkYjU3YzNhOGQzNTg0YjQ1MGQzNTk4NWFk
MSIKIAogUFlQSV9QQUNLQUdFID0gInJ1YW1lbC55YW1sIgogCiBpbmhlcml0IHB5cGkgc2V0dXB0
b29sczMKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhiN2NlNjk3YTJmMjEyNzUyYTM1YzFhYzQx
NDQ3MWRjMTZjNDI0Yzk1NzNiZTQ5MjZiNTZmZjNmNWQyM2I3YWYiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYmFhMmQwYTVhYWQyMDM0ODI2YzQzOWNlNjFjMTQyYzA3MDgyYjc2ZjQ3OTFkNTQxNDVl
MTMxMjA2ZTk5ODA1OSIKIAogUkRFUEVORFM6JHtQTn0gKz0gIlwKICAgICAke1BZVEhPTl9QTn0t
c2hlbGwgXAotLSAKMi4zOS4yCgo=

--===============6997896507130992736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-ruamel-yaml/python3-ruamel-yaml: FILELIST: removed "/usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/METADATA /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/RECORD /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/LICENSE /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21-py3.11-nspkg.pth /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/namespace_packages.txt /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/top_level.txt /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/WHEEL", added "/usr/lib/python3.11/site-packages/ruamel.yaml-0.17.26.dist-info/METADATA /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.26.dist-info/RECORD /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.26.dist-info/LICENSE /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.26.dist-info/top_level.txt /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.26.dist-info/WHEEL"
Changes to packages/core2-32-poky-linux/python3-ruamel-yaml (sysroot):
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info moved to /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.26.dist-info
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21.dist-info/namespace_packages.txt was removed
  /usr/lib/python3.11/site-packages/ruamel.yaml-0.17.21-py3.11-nspkg.pth was removed

--===============6997896507130992736==--

