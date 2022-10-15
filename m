Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681CEC64E92
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.24225.1665871394517647008
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=N+JfnUt6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010183ddac3376-fd9deb9c-a415-4718-b990-82eff9dab81e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FTQfghNGWqEGN+yYyQkGti8/g3IM7sGnvMTZx5GxdGw=;
	b=N+JfnUt6q2pRJo9x6Qas2ZN5IkbllhmhQyOoQkoj3F/sA+nzOAS6WReSpEDw11Sz
	pWE42JLjYB09ZNbKgywNELjczGX+sm7WyVg5kdbkIWbh8Dp1W1gjAPog2jRPjs5vEA6
	43DXFST+EU8kMEfDEQ0OHlXu9DlBWwALTrc4fDC8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FTQfghNGWqEGN+yYyQkGti8/g3IM7sGnvMTZx5GxdGw=;
	b=JdIjW6cTPdxzt0cAL8ol7NuJ0ucjmEsk0RZNfQWXTvNlGOIS+O2j85KFK1pO9Cxa
	LooyPmvgw2hE6G1RiS7vvEOXPmDDudV0ZS9K0ByeGwu0dipbc1UaV789v2quNHyAaTu
	LBQ0AzXo+axE/q5uhYIfhHqXn47IQY2bTtILDobc=
Content-Type: multipart/mixed; boundary="===============5396649432211189517=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-importlib-metadata: upgrading to 5.0.0 SUCCEEDED
Message-ID: <01010183ddac3376-fd9deb9c-a415-4718-b990-82eff9dab81e-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171788

--===============5396649432211189517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-importlib-metadata* to *5.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-importlib-metadata-upgrade-4.12.0-5.0.0.patch
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
--===============5396649432211189517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: FILELIST: directory renamed /usr/lib/python3.10/site-packages/importlib_metadata-4.12.0.dist-info -> /usr/lib/python3.10/site-packages/importlib_metadata-5.0.0.dist-info, added "/usr/lib/python3.10/site-packages/importlib_metadata/__pycache__/_py39compat.cpython-310.pyc /usr/lib/python3.10/site-packages/importlib_metadata/_py39compat.py"
Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.10/site-packages/importlib_metadata-5.0.0.dist-info was added
  /usr/lib/python3.10/site-packages/importlib_metadata-5.0.0.dist-info/LICENSE was added
  /usr/lib/python3.10/site-packages/importlib_metadata-5.0.0.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/importlib_metadata-5.0.0.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/importlib_metadata-5.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/importlib_metadata-5.0.0.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/importlib_metadata/_py39compat.py was added
  /usr/lib/python3.10/site-packages/importlib_metadata/__pycache__/_py39compat.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/importlib_metadata-4.12.0.dist-info was removed
  /usr/lib/python3.10/site-packages/importlib_metadata-4.12.0.dist-info/LICENSE was removed
  /usr/lib/python3.10/site-packages/importlib_metadata-4.12.0.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/importlib_metadata-4.12.0.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/importlib_metadata-4.12.0.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/importlib_metadata-4.12.0.dist-info/WHEEL was removed

--===============5396649432211189517==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-importlib-metadata-upgrade-4.12.0-5.0.0.patch"

RnJvbSAyYjAzYTdiMDkxNmViZDRmNzZkYzhhNmUyNzdmZmE4ZDNiNWQ5MDYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTA6MTk6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWltcG9ydGxpYi1tZXRhZGF0YTogdXBncmFkZSA0LjEyLjAgLT4gNS4wLjAKCi0tLQog
Li4uYi1tZXRhZGF0YV80LjEyLjAuYmIgPT4gcHl0aG9uMy1pbXBvcnRsaWItbWV0YWRhdGFfNS4w
LjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1pbXBvcnRs
aWItbWV0YWRhdGFfNC4xMi4wLmJiID0+IHB5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzUuMC4w
LmJifSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1pbXBvcnRsaWItbWV0YWRhdGFfNC4xMi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV81LjAuMC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
aW1wb3J0bGliLW1ldGFkYXRhXzQuMTIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV81LjAuMC5iYgppbmRleCBjMDBl
NDJjYjFjLi5mMDYyMzY2OWQ3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzQuMTIuMC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzUuMC4wLmJiCkBA
IC04LDcgKzgsNyBAQCBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQog
UFlQSV9QQUNLQUdFID0gImltcG9ydGxpYl9tZXRhZGF0YSIKIFVQU1RSRUFNX0NIRUNLX1JFR0VY
ID0gIi9pbXBvcnRsaWItbWV0YWRhdGEvKD9QPHB2ZXI+KFxkK1tcLlwtX10qKSspLyIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjYzNzI0NWI4YmFiMmI2NTAyZmNiYzc1MmNjNGI3YTZmNjI0M2Ji
MDJiMzFjNWMyNjE1NmFkMTAzZDNkNDU2NzAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGEzMWRi
MzJiMzA0MzE0ZDA0NGQzYzEyYzc5YmQ1OWUzMDc4ODliMjg3YWQxMmZmMzg3YjM1MDA4MzVmYzJh
YiIKIAogUyA9ICIke1dPUktESVJ9L2ltcG9ydGxpYl9tZXRhZGF0YS0ke1BWfSIKIAotLSAKMi4z
MS4xCgo=

--===============5396649432211189517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-importlib-metadata: PV changed from "4.12.0" to "5.0.0"
packages/core2-32-poky-linux/python3-importlib-metadata: PKGV changed from 4.12.0 [default] to 5.0.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-4.12.0.tar.gz" to "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-5.0.0.tar.gz"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PV changed from "4.12.0" to "5.0.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PKGV changed from 4.12.0 [default] to 5.0.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PV changed from "4.12.0" to "5.0.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PKGV changed from 4.12.0 [default] to 5.0.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PV changed from "4.12.0" to "5.0.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PKGV changed from 4.12.0 [default] to 5.0.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PV changed from "4.12.0" to "5.0.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PKGV changed from 4.12.0 [default] to 5.0.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PV changed from "4.12.0" to "5.0.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PKGV changed from 4.12.0 [default] to 5.0.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PV changed from "4.12.0" to "5.0.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PKGV changed from 4.12.0 [default] to 5.0.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PV changed from "4.12.0" to "5.0.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGV changed from 4.12.0 [default] to 5.0.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGSIZE changed from 115993 to 109960 (-5%)
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: FILELIST: directory renamed /usr/lib/python3.10/site-packages/importlib_metadata-4.12.0.dist-info -> /usr/lib/python3.10/site-packages/importlib_metadata-5.0.0.dist-info, added "/usr/lib/python3.10/site-packages/importlib_metadata/__pycache__/_py39compat.cpython-310.pyc /usr/lib/python3.10/site-packages/importlib_metadata/_py39compat.py"
Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.10/site-packages/importlib_metadata-5.0.0.dist-info was added
  /usr/lib/python3.10/site-packages/importlib_metadata-5.0.0.dist-info/LICENSE was added
  /usr/lib/python3.10/site-packages/importlib_metadata-5.0.0.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/importlib_metadata-5.0.0.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/importlib_metadata-5.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/importlib_metadata-5.0.0.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/importlib_metadata/_py39compat.py was added
  /usr/lib/python3.10/site-packages/importlib_metadata/__pycache__/_py39compat.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/importlib_metadata-4.12.0.dist-info was removed
  /usr/lib/python3.10/site-packages/importlib_metadata-4.12.0.dist-info/LICENSE was removed
  /usr/lib/python3.10/site-packages/importlib_metadata-4.12.0.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/importlib_metadata-4.12.0.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/importlib_metadata-4.12.0.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/importlib_metadata-4.12.0.dist-info/WHEEL was removed

--===============5396649432211189517==--

