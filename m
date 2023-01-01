Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661A6C678D5
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:18 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.20188.1672605968503208421
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Se0D33ee;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101856f15a499-e119dab6-57c3-4fab-b8de-51845aec7b18-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=drKXtF+fxU0ymgMJ0mr4P3w6k06dNOYYmNjQwb8NQZE=;
	b=Se0D33eeJFigW/Wi1vwAC5dWk/J/ScPf9l2Ow4ybDzydzRTI81/YhfdttSdJgjqp
	vbGp/4VAnxP72TY99XSjsogRvRUDL8bPhs4WDh0ucb4d9hnOJDkovlR98i2KKtdgl5s
	ovNSw8e+A+s3KbPmJtGlbLT7vk9PauBztXFjY4qg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=drKXtF+fxU0ymgMJ0mr4P3w6k06dNOYYmNjQwb8NQZE=;
	b=eFLAgvu8xWmJSUXpdMs8iOpXVDDdx9nXCa06uL4y2w8NxVAYJ+BwEOvWUIQygx1b
	NUWDRoZ4+6ZRAu89iNDswDpdHEchWjc3ZvBmVSlgu1otN+XN1Ajml6Gpjcok0i5pf3U
	evpm655+MAKPvNOK3yU4Y/c/Q+lYa4FZ4D2nvbrY=
Content-Type: multipart/mixed; boundary="===============6353743899891083964=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lsof: upgrading to 4.96.5 SUCCEEDED
Message-ID: <010101856f15a499-e119dab6-57c3-4fab-b8de-51845aec7b18-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175293

--===============6353743899891083964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lsof* to *4.96.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lsof-upgrade-4.96.4-4.96.5.patch
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
--===============6353743899891083964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lsof: PKGV changed from 4.96.4 [default] to 4.96.5 [default]
packages/core2-32-poky-linux/lsof: PV changed from "4.96.4" to "4.96.5"
packages/core2-32-poky-linux/lsof/lsof-dbg: PKGV changed from 4.96.4 [default] to 4.96.5 [default]
packages/core2-32-poky-linux/lsof/lsof-dbg: PV changed from "4.96.4" to "4.96.5"
packages/core2-32-poky-linux/lsof/lsof-dev: PKGV changed from 4.96.4 [default] to 4.96.5 [default]
packages/core2-32-poky-linux/lsof/lsof-dev: PV changed from "4.96.4" to "4.96.5"
packages/core2-32-poky-linux/lsof/lsof-doc: PKGV changed from 4.96.4 [default] to 4.96.5 [default]
packages/core2-32-poky-linux/lsof/lsof-doc: PV changed from "4.96.4" to "4.96.5"
packages/core2-32-poky-linux/lsof/lsof-locale: PKGV changed from 4.96.4 [default] to 4.96.5 [default]
packages/core2-32-poky-linux/lsof/lsof-locale: PV changed from "4.96.4" to "4.96.5"
packages/core2-32-poky-linux/lsof/lsof-src: PKGSIZE changed from 560999 to 561042 (+0%)
packages/core2-32-poky-linux/lsof/lsof-src: PKGV changed from 4.96.4 [default] to 4.96.5 [default]
packages/core2-32-poky-linux/lsof/lsof-src: PV changed from "4.96.4" to "4.96.5"
packages/core2-32-poky-linux/lsof/lsof-staticdev: PKGV changed from 4.96.4 [default] to 4.96.5 [default]
packages/core2-32-poky-linux/lsof/lsof-staticdev: PV changed from "4.96.4" to "4.96.5"
packages/core2-32-poky-linux/lsof/lsof: PKGV changed from 4.96.4 [default] to 4.96.5 [default]
packages/core2-32-poky-linux/lsof/lsof: PV changed from "4.96.4" to "4.96.5"

--===============6353743899891083964==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lsof-upgrade-4.96.4-4.96.5.patch"

RnJvbSBjZTQyMDdkYzU4ZTA3MDNiNDkzN2E3NWZiYmUzOTM0OWMyZjhiMGExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxMjowOTozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxz
b2Y6IHVwZ3JhZGUgNC45Ni40IC0+IDQuOTYuNQoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bHNvZi97bHNvZl80Ljk2LjQuYmIgPT4gbHNvZl80Ljk2LjUuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2xzb2Yve2xzb2ZfNC45Ni40LmJiID0+IGxzb2ZfNC45Ni41LmJifSAoOTYlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2xzb2ZfNC45Ni40LmJiIGIv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xzb2YvbHNvZl80Ljk2LjUuYmIKc2ltaWxhcml0eSBpbmRl
eCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xzb2YvbHNvZl80Ljk2LjQu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2xzb2ZfNC45Ni41LmJiCmlu
ZGV4IDExZGU1MzVhMGYuLjlmODAxNzZlZTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9sc29mL2xzb2ZfNC45Ni40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29m
L2xzb2ZfNC45Ni41LmJiCkBAIC04LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly8wMFJFQURNRTtiZWdpbmxpbmU9NjQ1O2VuZGxpbmU9Njc5O21kNT05NjRkZjI3NWQyNjQyOQog
CiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbHNvZi1vcmcvbHNvZjticmFuY2g9bWFzdGVy
O3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmlsZTovL3JlbW92ZS1ob3N0LWluZm9ybWF0
aW9uLnBhdGNoIgotU1JDUkVWID0gIjY2OWMzM2EyNTNlNDE0ZmViNjBmYmJjZjI5ODRjMjVkYzQx
M2NkNzUiCitTUkNSRVYgPSAiODk4OTE2ZDRjN2MzOTBlYTQ2MTBhZWJhZjFkMzJiOGEzYzQ5ZjI2
YiIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi4zNy4zCgo=

--===============6353743899891083964==--

