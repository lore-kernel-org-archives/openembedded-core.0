Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E87CC77B61
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:31 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.12304.1678895727691885703
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WJFS8cC5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010186e5fbc77a-af7d7c86-9cbc-4098-bb16-c93f8d05a845-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895728;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bH5Va56v+NkAqfjJ+/zoBSs3CEE8WK0rrdGFdftBmUI=;
	b=WJFS8cC58LZKePcaEb0AqOiQWm38GSvJ6iTZRPgRwYcWs/l3qs0CgS3UwN0BgecZ
	j/2m8G4ihZrlqaDYVaUVoau8vK4wclxFnDX3iL3PG0d4z0cHiZAdT1WiuvAa4Ww2gpT
	sg02YZFTLjE6yNxVfN7Bi0UDUtv0yCIYJPiJMwBM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895728;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bH5Va56v+NkAqfjJ+/zoBSs3CEE8WK0rrdGFdftBmUI=;
	b=Yl15kfCGzT7DF74VtatNOA6JvQ+FdfEaIXa/mTVYCM4naYFgAwR48cZRw4uS1mVl
	gJ2KUB4R35NY19uB8THOiqBZy74MT79fvkTlvX22souqakqoCqu0nslwryEcDIplO17
	vsnllFtGmjaCpzjdPx9qpt+PurF8j3VEPn/+TJc0=
Content-Type: multipart/mixed; boundary="===============1321296226044981499=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 238 SUCCEEDED
Message-ID: <01010186e5fbc77a-af7d7c86-9cbc-4098-bb16-c93f8d05a845-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:28 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178639

--===============1321296226044981499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *238* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-236-238.patch
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
--===============1321296226044981499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-236.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-238.dist-info

--===============1321296226044981499==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-236-238.patch"

RnJvbSAwNWU2NmUxMjI1ZTMxZGI0ZmE5MTFjZTEzYWM2MGQ5MjBlODRiYWZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMTU6MTg6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDIzNiAtPiAyMzgKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjM2LmJiID0+IGRpZmZvc2NvcGVfMjM4LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yMzYuYmIgPT4gZGlmZm9zY29wZV8y
MzguYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzIzNi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yMzguYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzIzNi5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzIzOC5iYgppbmRleCA5Zjg5ZjM1
YzExLi5iM2RjMzM5ODMwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjM2LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yMzguYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiODRjNDY4NDBkYWZmZmUwMjIzMDU2NzE4ZTQyNTBjZWI1MjQ4NDQ1MmE5OTJiODVlMzQ1
ZTNjZjhhMmNmN2Q0YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiOGNhYzViZjE3NTBiNjk1MGJi
YjczMDg0YjVmZjA3YTg1YmE1OTYxZjUwZWY3MjM4OGY5ZjdkYjczYzcwMGU4IgogCiBSREVQRU5E
Uzoke1BOfSArPSAiYmludXRpbHMgdmltIHNxdWFzaGZzLXRvb2xzIHB5dGhvbjMtbGliYXJjaGl2
ZS1jIHB5dGhvbjMtbWFnaWMgcHl0aG9uMy1ycG0iCiAKLS0gCjIuMzkuMgoK

--===============1321296226044981499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "236" to "238"
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 236 [default] to 238 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "236" to "238"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 236 [default] to 238 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "236" to "238"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 236 [default] to 238 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "236" to "238"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 236 [default] to 238 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "236" to "238"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 236 [default] to 238 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "236" to "238"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 236 [default] to 238 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "236" to "238"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1406019 to 1406155 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 236 [default] to 238 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "236" to "238"
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-236.tar.gz;downloadfilename=diffoscope-236.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-238.tar.gz;downloadfilename=diffoscope-238.tar.gz"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 236 [default] to 238 [default]
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-236.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-238.dist-info

--===============1321296226044981499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1791 targets, 50 skipped, 0 masked, 0 errors.
Removing 100 recipes from the core2-32 sysroot...done.
Removing 120 recipes from the qemux86 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============1321296226044981499==--

