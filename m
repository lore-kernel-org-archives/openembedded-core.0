Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF5E7C71149
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.145437.1671136351457160848
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EjKCI/CW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010185177d12c2-159e25ca-9d60-4ed6-9357-44a7ebea0580-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=b112hJsl5LqChvCUnnkGs97P41RX5sT18u215jqP8ZU=;
	b=EjKCI/CW2hOdT3NZYGIFYN2j6krquampqRH0ZE5AioMSUE9ZHHPgAG8h2yFItBht
	2n5dQ7cZiRF6qe39s4KdUMbtD33wI60w4cpxlT+Xn+KfH3Ns5jj/GhyXN5d6bIZxUwh
	z0T1+rtgYgvLw0I7DnNOa2mQ/K+laT0WngFfI+GQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=b112hJsl5LqChvCUnnkGs97P41RX5sT18u215jqP8ZU=;
	b=U5WtL0682pmYci+ltY5gFwiYpCgxfWmTmWN8QN1W1Vo2KJsmqohcMWk3p4N91PKn
	90fMXe+yeyW5nV8F/8EOIvicAoRyQk6eMYmWYSRqUVnydr0vgkleFTnJ2GcctLULkQT
	ECKB57LJMhDfvAqHpt+PAjI+Fhi8CI1NuxTCXd6w=
Content-Type: multipart/mixed; boundary="===============8266791345963929474=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-gitdb: upgrading to 4.0.10 SUCCEEDED
Message-ID: <01010185177d12c2-159e25ca-9d60-4ed6-9357-44a7ebea0580-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174638

--===============8266791345963929474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-gitdb* to *4.0.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-gitdb-upgrade-4.0.9-4.0.10.patch
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
--===============8266791345963929474==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-gitdb-upgrade-4.0.9-4.0.10.patch"

RnJvbSAzNzMzNWY1NzgyNDFmNzk0MzM1MDNkNzQ4ZTIyYWY5NjZhNjBkNTFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTA6NTA6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWdpdGRiOiB1cGdyYWRlIDQuMC45IC0+IDQuMC4xMAoKLS0tCiBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1naXRkYi5pbmMgICAgICAgICAgICAgICAgICAgfCAyICst
CiAuLi4vcHl0aG9uL3tweXRob24zLWdpdGRiXzQuMC45LmJiID0+IHB5dGhvbjMtZ2l0ZGJfNC4w
LjEwLmJifSAgfCAwCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1naXRkYl80
LjAuOS5iYiA9PiBweXRob24zLWdpdGRiXzQuMC4xMC5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tZ2l0ZGIuaW5jIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tZ2l0ZGIuaW5jCmluZGV4IDk0ODI5NjRmMzAuLmQ5
MmQ2NDUzZDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
LWdpdGRiLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1naXRk
Yi5pbmMKQEAgLTgsNyArOCw3IEBAIGluaGVyaXQgcHlwaQogCiBQWVBJX1BBQ0tBR0UgPSAiZ2l0
ZGIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiYWMyZmQ0NWMwYTFjOWNmNjE5ZTYzYTkwZDYy
YmRjNjM4OTJlZjkyMzg3NDI0Yjg1NTc5MmE2Y2FiZTc4OWFhIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjZlYjk5MGI2OWRmNGUxNWJhZDg5OWVhODY4ZGM0NjU3MmMzZjc1MzM5NzM1NjYzYjgxZGU3
OWIwNmYxN2ViOWEiCiAKIERFUEVORFMgPSAiJHtQWVRIT05fUE59LWFzeW5jICR7UFlUSE9OX1BO
fS1zZXR1cHRvb2xzLW5hdGl2ZSAke1BZVEhPTl9QTn0tc21tYXAiCiAKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1naXRkYl80LjAuOS5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1naXRkYl80LjAuMTAuYmIKc2ltaWxhcml0
eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1naXRkYl80LjAuOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWdpdGRiXzQuMC4xMC5iYgotLSAKMi4zNy4zCgo=

--===============8266791345963929474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-gitdb: PV changed from "4.0.9" to "4.0.10"
packages/core2-32-poky-linux/python3-gitdb: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/core2-32-poky-linux/python3-gitdb: SRC_URI changed from "https://files.pythonhosted.org/packages/source/g/gitdb/gitdb-4.0.9.tar.gz" to "https://files.pythonhosted.org/packages/source/g/gitdb/gitdb-4.0.10.tar.gz"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-dbg: PV changed from "4.0.9" to "4.0.10"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-dbg: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-dev: PV changed from "4.0.9" to "4.0.10"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-dev: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-doc: PV changed from "4.0.9" to "4.0.10"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-doc: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-locale: PV changed from "4.0.9" to "4.0.10"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-locale: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-src: PV changed from "4.0.9" to "4.0.10"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-src: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-staticdev: PV changed from "4.0.9" to "4.0.10"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-staticdev: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb: PV changed from "4.0.9" to "4.0.10"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb: PKGSIZE changed from 410961 to 408148 (-1%)
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb: PKGV changed from 4.0.9 [default] to 4.0.10 [default]
Changes to packages/core2-32-poky-linux/python3-gitdb (sysroot):
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/AUTHORS was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/AUTHORS was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/WHEEL was removed

--===============8266791345963929474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-gitdb (sysroot):
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/AUTHORS was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/LICENSE was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.10.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/AUTHORS was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/LICENSE was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/gitdb-4.0.9.dist-info/WHEEL was removed

--===============8266791345963929474==--

