Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23491C41535
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:13:12 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web08.24546.1665871975984385568
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RiugLxZa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010183ddb512b0-c937f653-8a98-490e-89da-00254ff597fe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871975;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bhLZBMJlDdpMDrrtlv8+FBS4Lvbqkp365/wTFBYoCGE=;
	b=RiugLxZaNRbyag2UfJ9Adxhl1pvBUbir0MUrhVh2DBWH6WUIOCKmvoIsjCIvTrsA
	BdTZyR+ebAyhgmH7ddzYZKJr1XMBKmmIYgdSvdVV9SomCGqED1eViAwviFmwMNpTi8u
	sqpBrJ3rCwNj6DokTQCPtURWVaPiOadsfnmv7VMo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871975;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bhLZBMJlDdpMDrrtlv8+FBS4Lvbqkp365/wTFBYoCGE=;
	b=G7fP3MQ8QtVs/hLLGYs9Nq5RizVOfmEHuyN0gbaOn5piklRptyPtYj/rSLaQJQ5c
	szR0J37RH2eFVMQN0XXi9SZrADQe14C7J2nfFYb+vpxbZVit296qeM9f7ZxsaHCQwpM
	s3YQzRuLtc3NUBXL9FIn7mPZvbNTh5DUhnJ0TCIE=
Content-Type: multipart/mixed; boundary="===============2128151663726026768=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libksba: upgrading to 1.6.2 SUCCEEDED
Message-ID: <01010183ddb512b0-c937f653-8a98-490e-89da-00254ff597fe-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:12:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171878

--===============2128151663726026768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libksba* to *1.6.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libksba-upgrade-1.6.0-1.6.2.patch
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
--===============2128151663726026768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libksba/libksba: FILELIST: removed "/usr/lib/libksba.so.8.14.0", added "/usr/lib/libksba.so.8.14.2"
Changes to packages/core2-32-poky-linux/libksba (sysroot):
  /usr/lib/libksba.so.8 changed symlink target from libksba.so.8.14.0 to libksba.so.8.14.2
  /usr/lib/libksba.so changed symlink target from libksba.so.8.14.0 to libksba.so.8.14.2
  /usr/lib/libksba.so.8.14.0 moved to /usr/lib/libksba.so.8.14.2

--===============2128151663726026768==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libksba-upgrade-1.6.0-1.6.2.patch"

RnJvbSBmNGVkNGJjMDRjMzU1YjU0ODhhYmIzNmRkMjI2YzUzYWE1ZTNhZjY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMjE6MDk6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJrc2JhOiB1cGdyYWRlIDEuNi4wIC0+IDEuNi4yCgotLS0KIC4uLi9saWJrc2JhL3tsaWJrc2Jh
XzEuNi4wLmJiID0+IGxpYmtzYmFfMS42LjIuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmtzYmEve2xpYmtzYmFfMS42LjAuYmIgPT4gbGlia3NiYV8xLjYuMi5i
Yn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJrc2JhL2xpYmtz
YmFfMS42LjAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJrc2JhL2xpYmtzYmFfMS42LjIu
YmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGlia3NiYS9saWJrc2JhXzEuNi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJrc2JhL2xpYmtzYmFfMS42LjIuYmIKaW5kZXggZjllODM2ODFkZC4uZjZlY2I5YWVjNCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlia3NiYS9saWJrc2JhXzEuNi4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmtzYmEvbGlia3NiYV8xLjYuMi5iYgpAQCAtMjQs
NyArMjQsNyBAQCBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9nbnVwZy5vcmcvZG93bmxv
YWQvaW5kZXguaHRtbCIKIFNSQ19VUkkgPSAiJHtHTlVQR19NSVJST1J9LyR7QlBOfS8ke0JQTn0t
JHtQVn0udGFyLmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly9rc2JhLWFkZC1wa2djb25maWctc3Vw
cG9ydC5wYXRjaCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImRhZDY4M2U2ZjJkOTE1ZDg4MGFh
NGJlZDVjZWE5YTExNTY5MGI4OTM1Yjc4YTFiYmUwMTY2OTE4OTMwN2E0OGIiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiZmNlMDFjY2FjNTk4MTJiZGRhZGZmYWNmZjAxN2RhYzJlNDc2MmJkYjZlYmM2
ZmZlMDZmNmVkNGY2MTkyYzk3MSIKIAogZG9fY29uZmlndXJlOnByZXBlbmQgKCkgewogCSMgRWxz
ZSB0aGVzZSBjb3VsZCBiZSB1c2VkIGluIHByZWZlcmVuY2UgdG8gdGhvc2UgaW4gYWNsb2NhbC1j
b3B5Ci0tIAoyLjMxLjEKCg==

--===============2128151663726026768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libksba: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/libksba: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/libksba: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.6.0.tar.bz2 file://ksba-add-pkgconfig-support.patch" to "https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.6.2.tar.bz2 file://ksba-add-pkgconfig-support.patch"
packages/core2-32-poky-linux/libksba/libksba-dbg: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/libksba/libksba-dbg: FILELIST: removed "/usr/lib/.debug/libksba.so.8.14.0", added "/usr/lib/.debug/libksba.so.8.14.2"
packages/core2-32-poky-linux/libksba/libksba-dbg: PKGSIZE changed from 703236 to 704196 (+0%)
packages/core2-32-poky-linux/libksba/libksba-dbg: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/libksba/libksba-dev: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/libksba/libksba-dev: PKGSIZE changed from 30113 to 30114 (+0%)
packages/core2-32-poky-linux/libksba/libksba-dev: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/libksba/libksba-doc: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/libksba/libksba-doc: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/libksba/libksba-locale: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/libksba/libksba-locale: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/libksba/libksba-src: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/libksba/libksba-src: PKGSIZE changed from 876599 to 878692 (+0%)
packages/core2-32-poky-linux/libksba/libksba-src: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/libksba/libksba-staticdev: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/libksba/libksba-staticdev: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
packages/core2-32-poky-linux/libksba/libksba: PV changed from "1.6.0" to "1.6.2"
packages/core2-32-poky-linux/libksba/libksba: FILELIST: removed "/usr/lib/libksba.so.8.14.0", added "/usr/lib/libksba.so.8.14.2"
packages/core2-32-poky-linux/libksba/libksba: PKGV changed from 1.6.0 [default] to 1.6.2 [default]
Changes to packages/core2-32-poky-linux/libksba (sysroot):
  /usr/lib/libksba.so.8 changed symlink target from libksba.so.8.14.0 to libksba.so.8.14.2
  /usr/lib/libksba.so changed symlink target from libksba.so.8.14.0 to libksba.so.8.14.2
  /usr/lib/libksba.so.8.14.0 moved to /usr/lib/libksba.so.8.14.2

--===============2128151663726026768==--

