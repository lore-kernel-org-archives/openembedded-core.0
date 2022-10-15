Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D991C433FE
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:13:01 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web12.24663.1665871974979398968
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=K3UO5fNN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010183ddb50f22-4960563b-26e7-4f02-9364-2bb7b645e47a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871974;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fO3B/zBSZhoeSMZbXpWwawk0JIYAcJAAHgozqdDkTYQ=;
	b=K3UO5fNNigPuCQCH2w2myUTfEph7/+Uu0akJP2mJN6R/3IAVyYdI6Ew6/JaTiZOD
	3Fg9jwExxz+xeofk4lyl/FJtvUHvy1z9DacbaHtSFwQza50R9CzL6Ms4wPqoAWZZRfo
	hCNd6Yq22W9mIY5+uKDfEZFlyQOP3/EBGdjvmkF8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871974;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fO3B/zBSZhoeSMZbXpWwawk0JIYAcJAAHgozqdDkTYQ=;
	b=Nct1gH+oxvIhOx0V5hyYb7x9XuCjTlFGlBR4QcOT5SRQt0xBJb8Gv68v2FhxuaRk
	vC7Usqz07q3BLYiISMzl5tOubhfgmSJIELKQj+B63QMY6d2PZx1+95Yje3M1DUmGItM
	KBIMC+oTUsOSaYTHUFMC3oZNWEc727nDnat6YcOc=
Content-Type: multipart/mixed; boundary="===============2690737824899602680=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to f11e93e3bd05d133d2b0df7dd6c4a33f4ed7fefa
 SUCCEEDED
Message-ID: <01010183ddb50f22-4960563b-26e7-4f02-9364-2bb7b645e47a-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:12:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171868

--===============2690737824899602680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *f11e93e3bd05d133d2b0df7dd6c4a33f4ed7fefa* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
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
--===============2690737824899602680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+f11e93e3bd
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+f11e93e3bd
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+f11e93e3bd
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+f11e93e3bd
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+f11e93e3bd
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+f11e93e3bd
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+f11e93e3bd

--===============2690737824899602680==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSAwMjNhNWZlNDczZTU3ZmQwNDZkNDZlMWNjMWYzMjgxZjZmZDZiNDgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTk6MjY6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6
emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19n
aXQuYmIKaW5kZXggOWU5YmNkMmVlZi4uMGE5ZmU5MDlhNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24v
cHV6emxlcy5naXQ7YnJhbmNoPW1haW4iCiAKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIK
LVNSQ1JFViA9ICI4Mzk5Y2ZmNmEzYjliZjE1YzZkMWQ5ZTBjOTA1ZDE0MTFmMjVmOWI4IgorU1JD
UkVWID0gImYxMWU5M2UzYmQwNWQxMzNkMmIwZGY3ZGQ2YzRhMzNmNGVkN2ZlZmEiCiBQRSA9ICIy
IgogUFYgPSAiMC4wK2dpdCR7U1JDUFZ9IgogCi0tIAoyLjMxLjEKCg==

--===============2690737824899602680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+8399cff6a3 [default] to 0.0+gitAUTOINC+f11e93e3bd [default]
packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+8399cff6a3" to "0.0+gitAUTOINC+f11e93e3bd"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+8399cff6a3" to "0.0+gitAUTOINC+f11e93e3bd"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+f11e93e3bd
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 13529192 to 13652176 (+1%)
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+8399cff6a3" to "0.0+gitAUTOINC+f11e93e3bd"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+f11e93e3bd
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+8399cff6a3" to "0.0+gitAUTOINC+f11e93e3bd"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+f11e93e3bd
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+8399cff6a3" to "0.0+gitAUTOINC+f11e93e3bd"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+f11e93e3bd
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+8399cff6a3" to "0.0+gitAUTOINC+f11e93e3bd"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+f11e93e3bd
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3484474 to 3486803 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+8399cff6a3" to "0.0+gitAUTOINC+f11e93e3bd"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+f11e93e3bd
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+8399cff6a3" to "0.0+gitAUTOINC+f11e93e3bd"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+8399cff6a3 to 0.0+git0+f11e93e3bd
packages/core2-32-poky-linux/puzzles/puzzles: PKGSIZE changed from 6720962 to 6774210 (+1%)

--===============2690737824899602680==--

