Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A35C76188
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.30361.1675272857276619492
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GwQfxV/S;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101860e0b225e-06817738-7da4-4a77-b240-9f2aa0d2339f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/SqBFPilZpm4Hy+SCRMgfrB0gx4o5/wDsacpIo3+JY8=;
	b=GwQfxV/SH+cLUCh4uWLu3pL3meut0rRq1O3dQM+v86oYArxJiX0Fdv2I1T/r6HBh
	uYdBrD6rRmQb8tJ+QBPyTmTw9irLmxvdfqbNd7iwq0MS1CW7MJh9fShTzztFuh1CmjP
	RYI9z9tArW64eT7cSRgOWtBltrKobiSo6rFgtckQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/SqBFPilZpm4Hy+SCRMgfrB0gx4o5/wDsacpIo3+JY8=;
	b=LyEBtr+ssUZlIrgM3XKvSeP+aI0EfO9KccOAHMJmxtx+Fbx7yCGnH9cftf4HiB1d
	3GxsXBYLOHjLaeyGCof+3rWdSXBwGc0asZZN8bGdcLbqqfgfLbCGwk1DzFzPa1cG+vh
	MO6wAjyxz9ZFnlQUbUJI+HZ7J71fiFYPYs5hKYzY=
Content-Type: multipart/mixed; boundary="===============3134930651446818017=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] msmtp: upgrading to 1.8.23 SUCCEEDED
Message-ID: <010101860e0b225e-06817738-7da4-4a77-b240-9f2aa0d2339f-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176621

--===============3134930651446818017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *msmtp* to *1.8.23* has Succeeded.

Next steps:
    - apply the patch: git am 0001-msmtp-upgrade-1.8.22-1.8.23.patch
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
--===============3134930651446818017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/msmtp: PV changed from "1.8.22" to "1.8.23"
packages/core2-32-poky-linux/msmtp: PKGV changed from 1.8.22 [default] to 1.8.23 [default]
packages/core2-32-poky-linux/msmtp: PACKAGES: added "msmtp-locale-sv"
packages/core2-32-poky-linux/msmtp: SRC_URI changed from "https://marlam.de/msmtp/releases/msmtp-1.8.22.tar.xz" to "https://marlam.de/msmtp/releases/msmtp-1.8.23.tar.xz"
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PV changed from "1.8.22" to "1.8.23"
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PKGV changed from 1.8.22 [default] to 1.8.23 [default]
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PKGSIZE changed from 343600 to 344824 (+0%)
packages/core2-32-poky-linux/msmtp/msmtp-dev: PV changed from "1.8.22" to "1.8.23"
packages/core2-32-poky-linux/msmtp/msmtp-dev: PKGV changed from 1.8.22 [default] to 1.8.23 [default]
packages/core2-32-poky-linux/msmtp/msmtp-doc: PV changed from "1.8.22" to "1.8.23"
packages/core2-32-poky-linux/msmtp/msmtp-doc: PKGV changed from 1.8.22 [default] to 1.8.23 [default]
packages/core2-32-poky-linux/msmtp/msmtp-doc: PKGSIZE changed from 114240 to 114647 (+0%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-de: PV changed from "1.8.22" to "1.8.23"
packages/core2-32-poky-linux/msmtp/msmtp-locale-de: PKGV changed from 1.8.22 [default] to 1.8.23 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-de: PKGSIZE changed from 35576 to 36812 (+3%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-eo: PV changed from "1.8.22" to "1.8.23"
packages/core2-32-poky-linux/msmtp/msmtp-locale-eo: PKGV changed from 1.8.22 [default] to 1.8.23 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-eo: PKGSIZE changed from 34678 to 34835 (+0%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-fr: PV changed from "1.8.22" to "1.8.23"
packages/core2-32-poky-linux/msmtp/msmtp-locale-fr: PKGV changed from 1.8.22 [default] to 1.8.23 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-pt-br: PV changed from "1.8.22" to "1.8.23"
packages/core2-32-poky-linux/msmtp/msmtp-locale-pt-br: PKGV changed from 1.8.22 [default] to 1.8.23 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-sr: PV changed from "1.8.22" to "1.8.23"
packages/core2-32-poky-linux/msmtp/msmtp-locale-sr: PKGV changed from 1.8.22 [default] to 1.8.23 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-sr: PKGSIZE changed from 45241 to 45442 (+0%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-ta: PV changed from "1.8.22" to "1.8.23"
packages/core2-32-poky-linux/msmtp/msmtp-locale-ta: PKGV changed from 1.8.22 [default] to 1.8.23 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-uk: PV changed from "1.8.22" to "1.8.23"
packages/core2-32-poky-linux/msmtp/msmtp-locale-uk: PKGV changed from 1.8.22 [default] to 1.8.23 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-uk: PKGSIZE changed from 47097 to 47284 (+0%)
packages/core2-32-poky-linux/msmtp/msmtp-src: PV changed from "1.8.22" to "1.8.23"
packages/core2-32-poky-linux/msmtp/msmtp-src: PKGV changed from 1.8.22 [default] to 1.8.23 [default]
packages/core2-32-poky-linux/msmtp/msmtp-src: PKGSIZE changed from 512388 to 512894 (+0%)
packages/core2-32-poky-linux/msmtp/msmtp-staticdev: PV changed from "1.8.22" to "1.8.23"
packages/core2-32-poky-linux/msmtp/msmtp-staticdev: PKGV changed from 1.8.22 [default] to 1.8.23 [default]
packages/core2-32-poky-linux/msmtp/msmtp: PV changed from "1.8.22" to "1.8.23"
packages/core2-32-poky-linux/msmtp/msmtp: PKGV changed from 1.8.22 [default] to 1.8.23 [default]
packages/core2-32-poky-linux/msmtp/msmtp: PKGSIZE changed from 204568 to 208664 (+2%)

--===============3134930651446818017==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-msmtp-upgrade-1.8.22-1.8.23.patch"

RnJvbSAzYWUyY2M2YWQ0OTk2OWM0ZDQyMmFhNDgwNWIwZDkxYWM5NDZjN2M1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNDoxNToyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1z
bXRwOiB1cGdyYWRlIDEuOC4yMiAtPiAxLjguMjMKCi0tLQogLi4uL3JlY2lwZXMtZXh0ZW5kZWQv
bXNtdHAve21zbXRwXzEuOC4yMi5iYiA9PiBtc210cF8xLjguMjMuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL21zbXRwL3ttc210cF8xLjguMjIuYmIgPT4gbXNtdHBfMS44LjIzLmJifSAo
OTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9tc210cF8xLjgu
MjIuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAvbXNtdHBfMS44LjIzLmJiCnNpbWls
YXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9t
c210cF8xLjguMjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9tc210
cF8xLjguMjMuYmIKaW5kZXggZDU2YWY3MzQ2Yi4uNWU2OGE3ZWE5MiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL21zbXRwL21zbXRwXzEuOC4yMi5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbXNtdHAvbXNtdHBfMS44LjIzLmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWQzMjIzOWJjYjY3MzQ2M2FiODc0ZTgw
ZDQ3ZmFlNTA0IgogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vbWFybGFtLmRlL21zbXRw
L2Rvd25sb2FkLyIKIAogU1JDX1VSSSA9ICJodHRwczovL21hcmxhbS5kZS8ke0JQTn0vcmVsZWFz
ZXMvJHtCUH0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFiMDQyMDYyODZhNWI4MjYy
MjMzNWU0ZWIwOWUxNzA3NDM2OGI3Mjg4ZTUzZDEzNDU0M2NiYmM2Yjc5ZWEzZTciCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiY2YwNGMxNmIwOTliM2Q0MTRkYjRiNWI5M2ZjNWVkOWQ0NmFhZDU2NGM4
MWEzNTJhYTEwN2EzMzk2NGMzNTZiOCIKIAogaW5oZXJpdCBnZXR0ZXh0IGF1dG90b29scyB1cGRh
dGUtYWx0ZXJuYXRpdmVzIHBrZ2NvbmZpZwogCi0tIAoyLjM3LjMKCg==

--===============3134930651446818017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/msmtp: PACKAGES: added "msmtp-locale-sv"

--===============3134930651446818017==--

