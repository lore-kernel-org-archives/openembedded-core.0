Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE73C88CBF
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.32121.1680384534424768715
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=c7KmDQLI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101873eb92578-e825543f-e703-4f90-841a-962695aa06b7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DAfo5bm3Hj+Y3IlLQh+jwIuHV8lSEfSX/Q2LEOwAEmQ=;
	b=c7KmDQLIPxJMl642M7satgbrpZjXGbtOGVBlHCMdYsWEJ9bTQdgHL/Ii+Wkc3d4a
	lrE4S2o6WzAEvLF6gijjGcP2mOVc60ZuU0WR6+HZpUK0+FTDCVWDWVC+cZ/SbYHpISi
	GZzLhkKU98KauI68pX2Xb0nkcynXLtzPpIF8bS8A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DAfo5bm3Hj+Y3IlLQh+jwIuHV8lSEfSX/Q2LEOwAEmQ=;
	b=ovVNpA3FCGQQdf0+Q52DiN2PrVOcP2t3mmVV533R1dnvd68ysuPxaP+lKglTnZQL
	hn0b4p/oOYJryyClqs6Lr2xzKFNn2JIpaQtnh3QAxho0ujEqJIyLuOSY9sLLoFyQ0We
	w3QCKc3Csb6ML1AlNFO9H10onKtq6Itq1CJazabY=
Content-Type: multipart/mixed; boundary="===============4102238216526012671=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtools: upgrading to 4.0.43 SUCCEEDED
Message-ID: <010101873eb92578-e825543f-e703-4f90-841a-962695aa06b7-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179491

--===============4102238216526012671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mtools* to *4.0.43* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mtools-upgrade-4.0.42-4.0.43.patch
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
--===============4102238216526012671==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtools-upgrade-4.0.42-4.0.43.patch"

RnJvbSAwMTM3ZTY4ZTQzODliZDZlZjAxZDAxNzNiMzM2NDg0OWQ5OTg0OTYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAwODozNzowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG10
b29sczogdXBncmFkZSA0LjAuNDIgLT4gNC4wLjQzCgotLS0KIC4uLi9tdG9vbHMvbXRvb2xzL2Rp
c2FibGUtaGFyZGNvZGVkLWNvbmZpZ3MucGF0Y2ggICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9t
dG9vbHMve210b29sc180LjAuNDIuYmIgPT4gbXRvb2xzXzQuMC40My5iYn0gICAgICAgICAgICAg
ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMve210b29sc180LjAuNDIuYmIg
PT4gbXRvb2xzXzQuMC40My5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbXRvb2xzL210b29scy9kaXNhYmxlLWhhcmRjb2RlZC1jb25maWdzLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvZGlzYWJsZS1oYXJkY29kZWQtY29uZmln
cy5wYXRjaAppbmRleCA1N2JlOTM1NDg3Li5lOWNmODlhNzhiIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9kaXNhYmxlLWhhcmRjb2RlZC1jb25maWdzLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL2Rpc2FibGUtaGFy
ZGNvZGVkLWNvbmZpZ3MucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDJlZjliMzcxYTVjYzQ0
ZTczMDE0M2U2OTRkNzE2NjU4MzFmYWMyMTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGRkNzgwYjg2MWU5NWVmZWU5MDFmOGRmZWEzNjlmZjMwNDY0MjdiZTYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBFZCBCYXJ0b3NoIDxlZC5iYXJ0b3NoQGxpbnV4LmludGVsLmNvbT4K
IERhdGU6IFR1ZSwgMTMgSnVuIDIwMTcgMTQ6NTU6NTIgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0g
RGlzYWJsZWQgcmVhZGluZyBob3N0IGNvbmZpZ3MuCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvbXRvb2xzL210b29sc180LjAuNDIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bXRvb2xzL210b29sc180LjAuNDMuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHNfNC4wLjQyLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29sc180LjAuNDMuYmIKaW5kZXggODVkOWU0
NTFjMi4uODU5MTAzOTc5ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29s
cy9tdG9vbHNfNC4wLjQyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRv
b2xzXzQuMC40My5iYgpAQCAtMjQsNyArMjQsNyBAQCBSUkVDT01NRU5EUzoke1BOfTpsaWJjLWds
aWJjID0gIlwKIAlnbGliYy1nY29udi1pYm04NjYgXAogCWdsaWJjLWdjb252LWlibTg2OSBcCiAJ
IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY0YmZkZmRlNGQ4MmFmNmIyMmYzYzFjNzJjM2UyMzFj
YmI2MThmNGMyMzA5Y2M0NmY1NGQxNmQ1NTAyY2NmMTUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NTQxZTE3OTY2NWRjNGUyNzJiOTYwMmYyMDc0MjQzNTkxYTE1N2RhODljYzQ3MDY0ZGE4YzU4Mjlk
YmQyYjMzOSIKIAogU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L210b29scy9tdG9vbHMtJHtQVn0u
dGFyLmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly9tdG9vbHMtbWFrZWluZm8ucGF0Y2ggXAotLSAK
Mi4zOS4yCgo=

--===============4102238216526012671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mtools: PKGV changed from 4.0.42 [default] to 4.0.43 [default]
packages/core2-32-poky-linux/mtools: SRC_URI changed from "https://ftp.gnu.org/gnu/mtools/mtools-4.0.42.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch" to "https://ftp.gnu.org/gnu/mtools/mtools-4.0.43.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch"
packages/core2-32-poky-linux/mtools: PV changed from "4.0.42" to "4.0.43"
packages/core2-32-poky-linux/mtools/mtools-dbg: PKGV changed from 4.0.42 [default] to 4.0.43 [default]
packages/core2-32-poky-linux/mtools/mtools-dbg: PV changed from "4.0.42" to "4.0.43"
packages/core2-32-poky-linux/mtools/mtools-dbg: PKGSIZE changed from 729940 to 729852 (-0%)
packages/core2-32-poky-linux/mtools/mtools-dev: PKGV changed from 4.0.42 [default] to 4.0.43 [default]
packages/core2-32-poky-linux/mtools/mtools-dev: PV changed from "4.0.42" to "4.0.43"
packages/core2-32-poky-linux/mtools/mtools-doc: PKGV changed from 4.0.42 [default] to 4.0.43 [default]
packages/core2-32-poky-linux/mtools/mtools-doc: PV changed from "4.0.42" to "4.0.43"
packages/core2-32-poky-linux/mtools/mtools-doc: PKGSIZE changed from 242482 to 242854 (+0%)
packages/core2-32-poky-linux/mtools/mtools-locale: PKGV changed from 4.0.42 [default] to 4.0.43 [default]
packages/core2-32-poky-linux/mtools/mtools-locale: PV changed from "4.0.42" to "4.0.43"
packages/core2-32-poky-linux/mtools/mtools-src: PKGV changed from 4.0.42 [default] to 4.0.43 [default]
packages/core2-32-poky-linux/mtools/mtools-src: PV changed from "4.0.42" to "4.0.43"
packages/core2-32-poky-linux/mtools/mtools-src: PKGSIZE changed from 597010 to 597781 (+0%)
packages/core2-32-poky-linux/mtools/mtools-staticdev: PKGV changed from 4.0.42 [default] to 4.0.43 [default]
packages/core2-32-poky-linux/mtools/mtools-staticdev: PV changed from "4.0.42" to "4.0.43"
packages/core2-32-poky-linux/mtools/mtools: PKGV changed from 4.0.42 [default] to 4.0.43 [default]
packages/core2-32-poky-linux/mtools/mtools: PV changed from "4.0.42" to "4.0.43"

--===============4102238216526012671==--

