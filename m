Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A12C63713
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:46 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web09.5199.1668517536787327687
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KYLy4U9z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101847b65237e-c0e6e76c-0a8e-4fdc-9ec4-eab688a20f5f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=thD89WbUxclAlu7DegJ9AyADQe9yUoWnFMgciuI6Kyg=;
	b=KYLy4U9zNDwXrhIEuKKZmt35cub89Y++FpbFwhlj+oGe5ZrpxYouUInVfJe0Ss6Q
	SsuzN0C9VhH5kUhAWw3BCTrnO1dMkKPShvCjHY5oFzmWfb3QQNJjJ/Ndav937a9IZeQ
	zCsq+lGrZU6WZ/pY0LNF+tE88PNzppu9v2ip8nzU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=thD89WbUxclAlu7DegJ9AyADQe9yUoWnFMgciuI6Kyg=;
	b=beI8BMaTxpAOXZ+SwFBk0Z+UbMBoMcZNZDf1nDIMv4gLJ8mj73CY4ZnaTQf03HBy
	QMPcz9/RMAXt4wx3eeGiTl4JZFg7NkYndCYpZGLTzMAHhQI9vnCUm2dCg8VpFitnyQo
	YKH6ratOaskCT3e9BSMZuUaRsare5xTwHDkBYJ3Y=
Content-Type: multipart/mixed; boundary="===============3194018284841257148=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to ff406d4edc62af1f459ba2b17a9110a8e3ef71bc
 SUCCEEDED
Message-ID: <010101847b65237e-c0e6e76c-0a8e-4fdc-9ec4-eab688a20f5f-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173323

--===============3194018284841257148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *ff406d4edc62af1f459ba2b17a9110a8e3ef71bc* has Succeeded.

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
--===============3194018284841257148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+ff406d4edc
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+ff406d4edc
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+ff406d4edc
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+ff406d4edc
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+ff406d4edc
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+ff406d4edc
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+ff406d4edc

--===============3194018284841257148==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSBjNDgyNzU2ZGEwN2FmYWUyY2YyNzQxZjA2M2NlOTgzMjM1NWU1ODA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMTI6MjY6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6
emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19n
aXQuYmIKaW5kZXggNjE1ZWIxYmI3Ny4uYjgzZjA5YjVmMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24v
cHV6emxlcy5naXQ7YnJhbmNoPW1haW4iCiAKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIK
LVNSQ1JFViA9ICIwNmY2ZTg3OGEwYjU4OGM1MTMwMjRjMzQ5OGI2OGEzYzg3NTk0YWI3IgorU1JD
UkVWID0gImZmNDA2ZDRlZGM2MmFmMWY0NTliYTJiMTdhOTExMGE4ZTNlZjcxYmMiCiBQRSA9ICIy
IgogUFYgPSAiMC4wK2dpdCR7U1JDUFZ9IgogCi0tIAoyLjMxLjEKCg==

--===============3194018284841257148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+06f6e878a0 [default] to 0.0+gitAUTOINC+ff406d4edc [default]
packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+06f6e878a0" to "0.0+gitAUTOINC+ff406d4edc"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 14067328 to 14114548 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+ff406d4edc
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+06f6e878a0" to "0.0+gitAUTOINC+ff406d4edc"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+ff406d4edc
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+06f6e878a0" to "0.0+gitAUTOINC+ff406d4edc"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+ff406d4edc
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+06f6e878a0" to "0.0+gitAUTOINC+ff406d4edc"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+ff406d4edc
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+06f6e878a0" to "0.0+gitAUTOINC+ff406d4edc"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3489298 to 3491161 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+ff406d4edc
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+06f6e878a0" to "0.0+gitAUTOINC+ff406d4edc"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+ff406d4edc
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+06f6e878a0" to "0.0+gitAUTOINC+ff406d4edc"
packages/core2-32-poky-linux/puzzles/puzzles: PKGSIZE changed from 6909378 to 6938050 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+06f6e878a0 to 0.0+git0+ff406d4edc
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+06f6e878a0" to "0.0+gitAUTOINC+ff406d4edc"

--===============3194018284841257148==--

