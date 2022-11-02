Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971D6C64EB4
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.848.1667349633224385035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LYVeIfly;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018435c85a12-7346a1e5-af59-4373-a64f-6c007beb722e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nxggNT5JCdIaFjlCZJLIhJtqbqx0RwK6djvoLedz1Q0=;
	b=LYVeIflyS5L/cy6lEZilEoBZHSzejY9O91lPWpkRimvJiVP0IXwD+Em3cixoEPsj
	fwHlQ90imniLeX3276/7yAW22FKoh/5YaIgghI1OzDL+Px2BL3m3zABun78/F63UcvC
	hRHFBnZzapEyHKunHIo8bZq01cQ0sFeHj+J1EbTI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nxggNT5JCdIaFjlCZJLIhJtqbqx0RwK6djvoLedz1Q0=;
	b=H79QZxaykXblHm3sA0eFZb4hxAhBAJPUwJWL5cIJ7VhXTZWguk3NzGDRpbLCTf49
	Q4Zs4zECMchKKidl7rK66BOPZxUu0kGznzSIpJQRjMXZS61ckD31C0habH7FWXIPyuX
	LIvIfCDIQAEk96/Mr0EoXuXyqc0H2xaV69OBlV+A=
Content-Type: multipart/mixed; boundary="===============4574971386464345906=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.29.5 SUCCEEDED
Message-ID: <0101018435c85a12-7346a1e5-af59-4373-a64f-6c007beb722e-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172438

--===============4574971386464345906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.29.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.29.3-2.29.5.patch
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
--===============4574971386464345906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/repo: PV changed from "2.29.3" to "2.29.5"
packages/core2-32-poky-linux/repo: PKGV changed from 2.29.3 [default] to 2.29.5 [default]
packages/core2-32-poky-linux/repo/repo-dbg: PV changed from "2.29.3" to "2.29.5"
packages/core2-32-poky-linux/repo/repo-dbg: PKGV changed from 2.29.3 [default] to 2.29.5 [default]
packages/core2-32-poky-linux/repo/repo-dev: PV changed from "2.29.3" to "2.29.5"
packages/core2-32-poky-linux/repo/repo-dev: PKGV changed from 2.29.3 [default] to 2.29.5 [default]
packages/core2-32-poky-linux/repo/repo-doc: PV changed from "2.29.3" to "2.29.5"
packages/core2-32-poky-linux/repo/repo-doc: PKGV changed from 2.29.3 [default] to 2.29.5 [default]
packages/core2-32-poky-linux/repo/repo-locale: PV changed from "2.29.3" to "2.29.5"
packages/core2-32-poky-linux/repo/repo-locale: PKGV changed from 2.29.3 [default] to 2.29.5 [default]
packages/core2-32-poky-linux/repo/repo-src: PV changed from "2.29.3" to "2.29.5"
packages/core2-32-poky-linux/repo/repo-src: PKGV changed from 2.29.3 [default] to 2.29.5 [default]
packages/core2-32-poky-linux/repo/repo-staticdev: PV changed from "2.29.3" to "2.29.5"
packages/core2-32-poky-linux/repo/repo-staticdev: PKGV changed from 2.29.3 [default] to 2.29.5 [default]
packages/core2-32-poky-linux/repo/repo: PKGSIZE changed from 45758 to 45804 (+0%)
packages/core2-32-poky-linux/repo/repo: PV changed from "2.29.3" to "2.29.5"
packages/core2-32-poky-linux/repo/repo: PKGV changed from 2.29.3 [default] to 2.29.5 [default]

--===============4574971386464345906==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.29.3-2.29.5.patch"

RnJvbSA0MjYwZWVhOTVmN2U5ZTliYTcyN2E0MTA5NjMxOTlmNDQ2YjcyNGIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxMTozMToyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi4yOS4zIC0+IDIuMjkuNQoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cmVwby97cmVwb18yLjI5LjMuYmIgPT4gcmVwb18yLjI5LjUuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3JlcG8ve3JlcG9fMi4yOS4zLmJiID0+IHJlcG9fMi4yOS41LmJifSAoOTUlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4yOS4zLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjI5LjUuYmIKc2ltaWxhcml0eSBpbmRl
eCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjI5LjMu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4yOS41LmJiCmlu
ZGV4IDY2YjYzMmMyOWQuLjAzNzkxOTY0MWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9yZXBvL3JlcG9fMi4yOS4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3JlcG9fMi4yOS41LmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogU1JDX1VS
SSA9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9
aHR0cHM7YnJhbmNoPW1haW4gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1weXRob24zLXNoZWJh
bmcucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiYWNjNGM4NTdhMGI2ZTJlMzNlMzY0
NzAyOGNiZDMxMjQ5OGZkNTkwMCIKK1NSQ1JFViA9ICJiNzUwYjQ4ZjUwZWI0YTExMDg3Y2E2Nzc1
MTYxZDViZjRkNWM0N2Q1IgogCiBNSVJST1JTICs9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xlc291cmNl
LmNvbS9naXQtcmVwby5naXQgZ2l0Oi8vZ2l0aHViLmNvbS9HZXJyaXRDb2RlUmV2aWV3L2dpdC1y
ZXBvLmdpdCIKIAotLSAKMi4zMS4xCgo=

--===============4574971386464345906==--

