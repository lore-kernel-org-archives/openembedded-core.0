Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B22DC88C84
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:52 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.107882.1682976348752815537
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SH+O8T20;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010187d935143f-e51fa9ef-8f8c-4b29-b158-3c78e04f9e0a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=P4aN3svLMumMWahrVA2mZBNPuObhwH+eaF7DW548twc=;
	b=SH+O8T201g46UR5NSfy1ljDcPLL8uK1biwd/YNlbOPo3Hdt5fwBdxdxZO7tm56TD
	UgbGiHtEOvYy5PR9rktLjYQlKpioWdKpTDUhR+PyFcXizJkQW1OnNofkDBtWQ1cn8yj
	y0CMOjXU3NpbAxvn6DegKgyNE2U4/+erjf40wnXw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=P4aN3svLMumMWahrVA2mZBNPuObhwH+eaF7DW548twc=;
	b=OmrGdO9TOgC0HMscuyZqcIq+0GOToJqleNZlgUAUOiuXGAuE7/Q43z8XtVmAwhRy
	tLs5/j7RNfpOJV2CORXt+ZxA2wDC3coQEU/z8dyTAkLMfx+H8PeOolpbpHEr4A3y6XX
	8+xbTs0FEdFMt6kbDPL9IuQhJMmOEg7+m7zlyXa4=
Content-Type: multipart/mixed; boundary="===============1061874900397343258=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 6.3.0 SUCCEEDED
Message-ID: <01010187d935143f-e51fa9ef-8f8c-4b29-b158-3c78e04f9e0a-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180591

--===============1061874900397343258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iproute2* to *6.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iproute2-upgrade-6.2.0-6.3.0.patch
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
--===============1061874900397343258==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-6.2.0-6.3.0.patch"

RnJvbSA0M2UzZjAyZDI2MjhlNGU5MzYyZGQ3ZDY5MTNjMGZkMGM3ZjFkM2U2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAwNjo1MToyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlw
cm91dGUyOiB1cGdyYWRlIDYuMi4wIC0+IDYuMy4wCgotLS0KIC4uLi9pcHJvdXRlMi97aXByb3V0
ZTJfNi4yLjAuYmIgPT4gaXByb3V0ZTJfNi4zLjAuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIve2lwcm91dGUyXzYuMi4wLmJiID0+IGlwcm91dGUy
XzYuMy4wLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
aXByb3V0ZTIvaXByb3V0ZTJfNi4yLjAuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lw
cm91dGUyL2lwcm91dGUyXzYuMy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi4yLjAuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi4zLjAu
YmIKaW5kZXggNjVkZGZhODIyMy4uODkyZmE4NTRkYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMl82LjIuMC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzYuMy4wLmJiCkBAIC0xNSw3ICsxNSw3
IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC91dGlscy9uZXQvJHtCUE59
LyR7QlB9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWxpYmMtY29tcGF0LmgtYWRk
LW11c2wtd29ya2Fyb3VuZC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjRkNzI3MzAyMDBlYzViMmFhYmFhMWEyZjIwNTUzYzY3NDgyOTJmMDY1ZDlhMTU0Yzdk
NWUyMjU1OWRmOWZkNjIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGZiMmE5OGRiOTZlN2E2NTNj
ZmZjNjY5MzMzNWExYTQ2NmUyOWEzNGI2YWM1MjhiZTQ4ZjM1ZTFkMjc2NjczMiIKIAogaW5oZXJp
dCB1cGRhdGUtYWx0ZXJuYXRpdmVzIGJhc2gtY29tcGxldGlvbiBwa2djb25maWcKIAotLSAKMi4z
OS4yCgo=

--===============1061874900397343258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/iproute2/iproute2-bash-completion: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2/iproute2-bash-completion: PKGV changed from 6.2.0 [default] to 6.3.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PKGV changed from 6.2.0 [default] to 6.3.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 6723724 to 6733092 (+0%)
packages/core2-32-poky-linux/iproute2/iproute2-dev: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2/iproute2-dev: PKGV changed from 6.2.0 [default] to 6.3.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-devlink: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2/iproute2-devlink: PKGV changed from 6.2.0 [default] to 6.3.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-doc: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2/iproute2-doc: PKGV changed from 6.2.0 [default] to 6.3.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-genl: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2/iproute2-genl: PKGV changed from 6.2.0 [default] to 6.3.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ifstat: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2/iproute2-ifstat: PKGV changed from 6.2.0 [default] to 6.3.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ip: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2/iproute2-ip: PKGV changed from 6.2.0 [default] to 6.3.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-lnstat: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2/iproute2-lnstat: PKGV changed from 6.2.0 [default] to 6.3.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-locale: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2/iproute2-locale: PKGV changed from 6.2.0 [default] to 6.3.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-nstat: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2/iproute2-nstat: PKGV changed from 6.2.0 [default] to 6.3.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-rdma: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2/iproute2-rdma: PKGV changed from 6.2.0 [default] to 6.3.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-routel: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2/iproute2-routel: PKGV changed from 6.2.0 [default] to 6.3.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-rtacct: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2/iproute2-rtacct: PKGV changed from 6.2.0 [default] to 6.3.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-src: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2/iproute2-src: PKGV changed from 6.2.0 [default] to 6.3.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-src: PKGSIZE changed from 3616687 to 3625705 (+0%)
packages/core2-32-poky-linux/iproute2/iproute2-ss: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2/iproute2-ss: PKGV changed from 6.2.0 [default] to 6.3.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-staticdev: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2/iproute2-staticdev: PKGV changed from 6.2.0 [default] to 6.3.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-tc: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2/iproute2-tc: PKGV changed from 6.2.0 [default] to 6.3.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-tipc: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2/iproute2-tipc: PKGV changed from 6.2.0 [default] to 6.3.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2/iproute2: PKGV changed from 6.2.0 [default] to 6.3.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2: PKGSIZE changed from 291992 to 296088 (+1%)
packages/core2-32-poky-linux/iproute2: PV changed from "6.2.0" to "6.3.0"
packages/core2-32-poky-linux/iproute2: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.2.0.tar.xz file://0001-libc-compat.h-add-musl-workaround.patch" to "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.3.0.tar.xz file://0001-libc-compat.h-add-musl-workaround.patch"
packages/core2-32-poky-linux/iproute2: PKGV changed from 6.2.0 [default] to 6.3.0 [default]

--===============1061874900397343258==--

