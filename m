Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD9EC71156
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:19 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.20179.1672605967239804541
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ChXh/8p2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101856f15a009-3541c9db-af54-47ff-91e0-4291a63131d3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TdilX8waRcH5ZiwG61tDqNuqwRs2+6lBGha5sNU5P7g=;
	b=ChXh/8p2lAQztmwVj2qWLhUOWNHdQuohxkF7TrFOHtkh/YKV8WiQhTcPZuUP6wee
	SdJnpmfc4v4phNVTmqZ45nxAxohMyMJGR83FOZPgVRAyyqHL70TkX9UrDs0iuFX2ERM
	r89yDpzeb/BCJAZWzcnxRsN89fnEHKGv+HQbUdR0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TdilX8waRcH5ZiwG61tDqNuqwRs2+6lBGha5sNU5P7g=;
	b=YiPdggcU5rwBNGynvT8XLdfiRrqZnIooNS8zwo3nzlQZ3qGwfqkG2VIg8yciYMtl
	80cVOzCM4ZQXd6On1yw+B2obTarkOsZ8B45JZSawCQ6dmqZ8RRul2mhUxgx7r0Cv0UJ
	kC4Y1rC8WBmGdaSKm1kee3n/kMBvBbEi6QuQNKhc=
Content-Type: multipart/mixed; boundary="===============3474489384628254145=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.12.1 SUCCEEDED
Message-ID: <010101856f15a009-3541c9db-af54-47ff-91e0-4291a63131d3-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175260

--===============3474489384628254145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.12.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.11.1-1.12.1.patch
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
--===============3474489384628254145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.11.1.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.12.1.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.11.1.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.12.1.dist-info

--===============3474489384628254145==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.11.1-1.12.1.patch"

RnJvbSA0YzRlMGE3YWZiYjAxN2U5ZDNhNTRjODc0NGNlZWFkNzhlMTRjYzU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAwOTowNzowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaGF0Y2hsaW5nOiB1cGdyYWRlIDEuMTEuMSAtPiAxLjEyLjEKCi0tLQogLi4ue3B5dGhv
bjMtaGF0Y2hsaW5nXzEuMTEuMS5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjEyLjEuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oYXRjaGxpbmdfMS4xMS4x
LmJiID0+IHB5dGhvbjMtaGF0Y2hsaW5nXzEuMTIuMS5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTEuMS5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4xMi4xLmJi
CnNpbWlsYXJpdHkgaW5kZXggODQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4xMS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTIuMS5iYgppbmRleCAwNGY1ZjVm
ZDRjLi5mYTU2ZDdhNDJhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTIuMS5iYgpAQCAtOCw3ICs4LDcgQEAgaW5oZXJp
dCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIERFUEVORFMgKz0gInB5dGhvbjMtcGx1Z2d5LW5hdGl2
ZSBweXRob24zLXBhdGhzcGVjLW5hdGl2ZSBweXRob24zLXBhY2thZ2luZy1uYXRpdmUgcHl0aG9u
My1lZGl0YWJsZXMtbmF0aXZlIgogREVQRU5EUzpyZW1vdmU6Y2xhc3MtbmF0aXZlID0gInB5dGhv
bjMtaGF0Y2hsaW5nLW5hdGl2ZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjlmODQzNjFmNzBj
ZjNhN2FiOTU0M2IwYzNlY2M2NDIxMWVkMmJhOGE2MDZhNzFlYjZhNDczYzFjOWIwOGUxZDAiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNWIzNmM5MDNkNGQ3Njc5MGIxYzFmMmI3YzhmNTQ0NmZiNzMz
ZmFiNmNlMzliMjAzNDAxZDIzMzdkNDQxYjQxMSIKIAogZG9fY29tcGlsZTpwcmVwZW5kKCkgewog
ICAgIGV4cG9ydCBQWVRIT05QQVRIPXNyYwotLSAKMi4zNy4zCgo=

--===============3474489384628254145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.11.1.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.12.1.tar.gz"
packages/core2-32-poky-linux/python3-hatchling: PV changed from "1.11.1" to "1.12.1"
packages/core2-32-poky-linux/python3-hatchling: PKGV changed from 1.11.1 [default] to 1.12.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.11.1" to "1.12.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.11.1 [default] to 1.12.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.11.1" to "1.12.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.11.1 [default] to 1.12.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.11.1" to "1.12.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.11.1 [default] to 1.12.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.11.1" to "1.12.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.11.1 [default] to 1.12.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.11.1" to "1.12.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.11.1 [default] to 1.12.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.11.1" to "1.12.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.11.1 [default] to 1.12.1 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 680378 to 729772 (+7%)
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.11.1" to "1.12.1"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.11.1 [default] to 1.12.1 [default]
Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.11.1.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.12.1.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.11.1.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.12.1.dist-info

--===============3474489384628254145==--

