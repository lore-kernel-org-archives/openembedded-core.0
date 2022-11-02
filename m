Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF543C64EC8
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.851.1667349633338330918
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=W+ezgmxs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018435c85525-3c550ea8-349a-434c-9346-01ae23c4a14f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yECpD27REnHQKcKEWd70brniHjj5qkhOCCE1NCrj29c=;
	b=W+ezgmxsG/JybhoGcSXF/Ii5rH3dCEEKEjJkmn4Nq3WwbB6a10j6c9Jd2lbswIol
	DJASQD2J0rJGa5wajVWRc224o6by5jCEl+MjBXTAYPkUVq2eO192WKHexiITx5OYjs+
	z4Th/E5XnFqEF/KGhHLGTS8Z3pKRmYcGXF1HhsXU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yECpD27REnHQKcKEWd70brniHjj5qkhOCCE1NCrj29c=;
	b=Rneh0fxN8mmeva8BesnBEBeu8HQb3IuzCfXDtsTF5dJORss43EJqI+wRVZu1DjZk
	eKjzIFVZiIXBJi2CUn7u6EwBSaZiJDYLXzOu/IpMD+Ut3Pupadck4iZbuZvyMHTmxd0
	9gSWaNOtf4I6V6y/34uPrJY/P+TWVpWstP2Zu6fQ=
Content-Type: multipart/mixed; boundary="===============8687136140250514398=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtools: upgrading to 4.0.42 SUCCEEDED
Message-ID: <0101018435c85525-3c550ea8-349a-434c-9346-01ae23c4a14f-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172423

--===============8687136140250514398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mtools* to *4.0.42* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mtools-upgrade-4.0.41-4.0.42.patch
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
--===============8687136140250514398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mtools: PV changed from "4.0.41" to "4.0.42"
packages/core2-32-poky-linux/mtools: PKGV changed from 4.0.41 [default] to 4.0.42 [default]
packages/core2-32-poky-linux/mtools: SRC_URI changed from "https://ftp.gnu.org/gnu/mtools/mtools-4.0.41.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch" to "https://ftp.gnu.org/gnu/mtools/mtools-4.0.42.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch"
packages/core2-32-poky-linux/mtools/mtools-dbg: PV changed from "4.0.41" to "4.0.42"
packages/core2-32-poky-linux/mtools/mtools-dbg: PKGSIZE changed from 726188 to 729908 (+1%)
packages/core2-32-poky-linux/mtools/mtools-dbg: PKGV changed from 4.0.41 [default] to 4.0.42 [default]
packages/core2-32-poky-linux/mtools/mtools-dev: PV changed from "4.0.41" to "4.0.42"
packages/core2-32-poky-linux/mtools/mtools-dev: PKGV changed from 4.0.41 [default] to 4.0.42 [default]
packages/core2-32-poky-linux/mtools/mtools-doc: PV changed from "4.0.41" to "4.0.42"
packages/core2-32-poky-linux/mtools/mtools-doc: PKGSIZE changed from 241786 to 242482 (+0%)
packages/core2-32-poky-linux/mtools/mtools-doc: PKGV changed from 4.0.41 [default] to 4.0.42 [default]
packages/core2-32-poky-linux/mtools/mtools-locale: PV changed from "4.0.41" to "4.0.42"
packages/core2-32-poky-linux/mtools/mtools-locale: PKGV changed from 4.0.41 [default] to 4.0.42 [default]
packages/core2-32-poky-linux/mtools/mtools-src: PV changed from "4.0.41" to "4.0.42"
packages/core2-32-poky-linux/mtools/mtools-src: PKGSIZE changed from 596193 to 597010 (+0%)
packages/core2-32-poky-linux/mtools/mtools-src: PKGV changed from 4.0.41 [default] to 4.0.42 [default]
packages/core2-32-poky-linux/mtools/mtools-staticdev: PV changed from "4.0.41" to "4.0.42"
packages/core2-32-poky-linux/mtools/mtools-staticdev: PKGV changed from 4.0.41 [default] to 4.0.42 [default]
packages/core2-32-poky-linux/mtools/mtools: PV changed from "4.0.41" to "4.0.42"
packages/core2-32-poky-linux/mtools/mtools: PKGSIZE changed from 253630 to 261822 (+3%)
packages/core2-32-poky-linux/mtools/mtools: PKGV changed from 4.0.41 [default] to 4.0.42 [default]

--===============8687136140250514398==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtools-upgrade-4.0.41-4.0.42.patch"

RnJvbSBiMDJiNjRlMWJmZDEzZmFhNDQ4MmE3Y2Y1YjVkNGY4Zjg3NTBkYzk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwODozNTo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG10
b29sczogdXBncmFkZSA0LjAuNDEgLT4gNC4wLjQyCgotLS0KIC4uLi9tdG9vbHMvbXRvb2xzL2Rp
c2FibGUtaGFyZGNvZGVkLWNvbmZpZ3MucGF0Y2ggICAgICAgICAgIHwgNiArKystLS0KIC4uLi9t
dG9vbHMve210b29sc180LjAuNDEuYmIgPT4gbXRvb2xzXzQuMC40Mi5iYn0gICAgICAgICAgIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy97bXRvb2xzXzQuMC40MS5iYiA9PiBt
dG9vbHNfNC4wLjQyLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9tdG9vbHMvbXRvb2xzL2Rpc2FibGUtaGFyZGNvZGVkLWNvbmZpZ3MucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9kaXNhYmxlLWhhcmRjb2RlZC1jb25maWdzLnBh
dGNoCmluZGV4IDJkNDJmYTUzMWEuLjRkN2MyZTg0OWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL2Rpc2FibGUtaGFyZGNvZGVkLWNvbmZpZ3MucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvZGlzYWJsZS1oYXJkY29k
ZWQtY29uZmlncy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzQ5NmNhZDdiN2E4NGU1OTlm
NTIxZjI4OTY0ODM3M2RmOWZhZDgwZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDNk
NGIyZTVmZmFlMTRiNmM2YzE0ZDc0MGE5YWE1MGIzYzAxOTNkYyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEVkIEJhcnRvc2ggPGVkLmJhcnRvc2hAbGludXguaW50ZWwuY29tPgogRGF0
ZTogVHVlLCAxMyBKdW4gMjAxNyAxNDo1NTo1MiArMDMwMAogU3ViamVjdDogW1BBVENIXSBEaXNh
YmxlZCByZWFkaW5nIGhvc3QgY29uZmlncy4KQEAgLTEyLDEwICsxMiwxMCBAQCBTaWduZWQtb2Zm
LWJ5OiBFZCBCYXJ0b3NoIDxlZC5iYXJ0b3NoQGxpbnV4LmludGVsLmNvbT4KICAxIGZpbGUgY2hh
bmdlZCwgOCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZy5jIGIvY29uZmlnLmMK
LWluZGV4IDhjNWZhODMuLjM0NjA0OGIgMTAwNjQ0CitpbmRleCAyZjZhMjk3Li4zMTgxZWQ3IDEw
MDY0NAogLS0tIGEvY29uZmlnLmMKICsrKyBiL2NvbmZpZy5jCi1AQCAtODQzLDE0ICs4NDMsNiBA
QCB2b2lkIHJlYWRfY29uZmlnKHZvaWQpCitAQCAtODQ0LDE0ICs4NDQsNiBAQCB2b2lkIHJlYWRf
Y29uZmlnKHZvaWQpCiAgCW1lbWNweShkZXZpY2VzLCBjb25zdF9kZXZpY2VzLAogIAkgICAgICAg
bnJfY29uc3RfZGV2aWNlcypzaXplb2Yoc3RydWN0IGRldmljZSkpOwogIApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHNfNC4wLjQxLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL210b29scy9tdG9vbHNfNC4wLjQyLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzXzQuMC40MS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHNfNC4wLjQyLmJi
CmluZGV4IDI5ZTc0MjdhMTAuLjg1ZDllNDUxYzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tdG9vbHMvbXRvb2xzXzQuMC40MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbXRvb2xzL210b29sc180LjAuNDIuYmIKQEAgLTI0LDcgKzI0LDcgQEAgUlJFQ09NTUVORFM6
JHtQTn06bGliYy1nbGliYyA9ICJcCiAJZ2xpYmMtZ2NvbnYtaWJtODY2IFwKIAlnbGliYy1nY29u
di1pYm04NjkgXAogCSIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyNTQyMTUyMjY0ZmIzZWZmN2Vk
NzA2NjJhYmY0ZjRlZWY4MTMzYmMzN2QwYjdhNjg2YzI0MGRmMmI1ZjgwYTEzIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjY0YmZkZmRlNGQ4MmFmNmIyMmYzYzFjNzJjM2UyMzFjYmI2MThmNGMyMzA5
Y2M0NmY1NGQxNmQ1NTAyY2NmMTUiCiAKIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9tdG9vbHMv
bXRvb2xzLSR7UFZ9LnRhci5iejIgXAogICAgICAgICAgICBmaWxlOi8vbXRvb2xzLW1ha2VpbmZv
LnBhdGNoIFwKLS0gCjIuMzEuMQoK

--===============8687136140250514398==--

