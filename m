Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A239C54E76
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:07 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.20661.1672605966727682574
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iWEzNXEM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101856f159e91-08c5e0f5-6c4a-4afb-828e-816200afd930-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8fqHeZQxm17QQ7HsCziRtl2vTxNIVYxxe2664TTK5/I=;
	b=iWEzNXEMqwJXIaEGjlS4AlVdexOMXUOliTgJfz4B5pjGqyjq0GpGkBps4iq4G9fT
	i+fx4Ns8R8T3DeNNSO6GuRjL2lYSL8NtiuHbnN6F8waF67xQc79x6KN/kMEgzMRAIPE
	cBN7WP71Xe9Rulc1v3Q9/Po6QOw38e57T4MtHKx4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8fqHeZQxm17QQ7HsCziRtl2vTxNIVYxxe2664TTK5/I=;
	b=W+oAEfCFL6qcHOG4rEjn3T7dj9KaAzGbdm/2ruYnq7SOo+j1SBfp/Yh2ml1H+HM+
	kp9aKMTtUQhDuPnbh3E0Fe5Z4TuoVJQAocLwezHRl+IaUdu/lDw8sxKkG9Ye8I5bMtx
	9pcfN7azhbWkUZDxjAKXsXF/oy315jf7LUmUuAvc=
Content-Type: multipart/mixed; boundary="===============1879249511967476781=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtest-fatal-perl: upgrading to 0.017 SUCCEEDED
Message-ID: <010101856f159e91-08c5e0f5-6c4a-4afb-828e-816200afd930-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175245

--===============1879249511967476781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libtest-fatal-perl* to *0.017* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtest-fatal-perl-upgrade-0.016-0.017.patch
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
--===============1879249511967476781==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtest-fatal-perl-upgrade-0.016-0.017.patch"

RnJvbSA4ZjA2MjhjNGUwZGVlMGNhYjI2YzdkN2RlNmY5YTdkMjdiZTZkZTUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAwNzo1OTo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnRlc3QtZmF0YWwtcGVybDogdXBncmFkZSAwLjAxNiAtPiAwLjAxNwoKLS0tCiAuLi5sXzAuMDE2
LmJiID0+IGxpYnRlc3QtZmF0YWwtcGVybF8wLjAxNy5iYn0gfCA1MyArKysrKysrKysrKysrKysr
KystCiAxIGZpbGUgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC97bGlidGVzdC1mYXRhbC1wZXJsXzAuMDE2
LmJiID0+IGxpYnRlc3QtZmF0YWwtcGVybF8wLjAxNy5iYn0gKDI5JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ0ZXN0LWZhdGFsLXBlcmxfMC4wMTYuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ0ZXN0LWZhdGFsLXBlcmxfMC4wMTcuYmIKc2lt
aWxhcml0eSBpbmRleCAyOSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Blcmwv
bGlidGVzdC1mYXRhbC1wZXJsXzAuMDE2LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGVybC9saWJ0ZXN0LWZhdGFsLXBlcmxfMC4wMTcuYmIKaW5kZXggNmQzNmM5NGVlYi4uMTJl
YzBiZDFhNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidGVzdC1m
YXRhbC1wZXJsXzAuMDE2LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYnRl
c3QtZmF0YWwtcGVybF8wLjAxNy5iYgpAQCAtMSwzICsxLDUyIEBACisjIEZJWE1FOiB0aGUgTElD
X0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFk
ZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFu
ZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1
ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBt
ZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1V
cGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIwor
IyAtLS0gTElDRU5TRQorIyArKysgTElDRU5TRQorIyBAQCAtMjkyLDIxICsyOTIsMjEgQEAKKyMg
IAorIyAgICAtICJQYWNrYWdlIiByZWZlcnMgdG8gdGhlIGNvbGxlY3Rpb24gb2YgZmlsZXMgZGlz
dHJpYnV0ZWQgYnkgdGhlIENvcHlyaWdodAorIyAgICAgIEhvbGRlciwgYW5kIGRlcml2YXRpdmVz
IG9mIHRoYXQgY29sbGVjdGlvbiBvZiBmaWxlcyBjcmVhdGVkIHRocm91Z2gKKyMgLSAgICB0ZXh0
dWFsIG1vZGlmaWNhdGlvbi4gCisjICsgICAgdGV4dHVhbCBtb2RpZmljYXRpb24uCisjICAgIC0g
IlN0YW5kYXJkIFZlcnNpb24iIHJlZmVycyB0byBzdWNoIGEgUGFja2FnZSBpZiBpdCBoYXMgbm90
IGJlZW4gbW9kaWZpZWQsCisjICAgICAgb3IgaGFzIGJlZW4gbW9kaWZpZWQgaW4gYWNjb3JkYW5j
ZSB3aXRoIHRoZSB3aXNoZXMgb2YgdGhlIENvcHlyaWdodAorIyAtICAgIEhvbGRlci4gCisjICsg
ICAgSG9sZGVyLgorIyAgICAtICJDb3B5cmlnaHQgSG9sZGVyIiBpcyB3aG9ldmVyIGlzIG5hbWVk
IGluIHRoZSBjb3B5cmlnaHQgb3IgY29weXJpZ2h0cyBmb3IKKyMgLSAgICB0aGUgcGFja2FnZS4g
CisjICsgICAgdGhlIHBhY2thZ2UuCisjICAgIC0gIllvdSIgaXMgeW91LCBpZiB5b3UncmUgdGhp
bmtpbmcgYWJvdXQgY29weWluZyBvciBkaXN0cmlidXRpbmcgdGhpcyBQYWNrYWdlLgorIyAgICAt
ICJSZWFzb25hYmxlIGNvcHlpbmcgZmVlIiBpcyB3aGF0ZXZlciB5b3UgY2FuIGp1c3RpZnkgb24g
dGhlIGJhc2lzIG9mIG1lZGlhCisjICAgICAgY29zdCwgZHVwbGljYXRpb24gY2hhcmdlcywgdGlt
ZSBvZiBwZW9wbGUgaW52b2x2ZWQsIGFuZCBzbyBvbi4gKFlvdSB3aWxsCisjICAgICAgbm90IGJl
IHJlcXVpcmVkIHRvIGp1c3RpZnkgaXQgdG8gdGhlIENvcHlyaWdodCBIb2xkZXIsIGJ1dCBvbmx5
IHRvIHRoZQorIyAtICAgIGNvbXB1dGluZyBjb21tdW5pdHkgYXQgbGFyZ2UgYXMgYSBtYXJrZXQg
dGhhdCBtdXN0IGJlYXIgdGhlIGZlZS4pIAorIyArICAgIGNvbXB1dGluZyBjb21tdW5pdHkgYXQg
bGFyZ2UgYXMgYSBtYXJrZXQgdGhhdCBtdXN0IGJlYXIgdGhlIGZlZS4pCisjICAgIC0gIkZyZWVs
eSBBdmFpbGFibGUiIG1lYW5zIHRoYXQgbm8gZmVlIGlzIGNoYXJnZWQgZm9yIHRoZSBpdGVtIGl0
c2VsZiwgdGhvdWdoCisjICAgICAgdGhlcmUgbWF5IGJlIGZlZXMgaW52b2x2ZWQgaW4gaGFuZGxp
bmcgdGhlIGl0ZW0uIEl0IGFsc28gbWVhbnMgdGhhdAorIyAgICAgIHJlY2lwaWVudHMgb2YgdGhl
IGl0ZW0gbWF5IHJlZGlzdHJpYnV0ZSBpdCB1bmRlciB0aGUgc2FtZSBjb25kaXRpb25zIHRoZXkK
KyMgLSAgICByZWNlaXZlZCBpdC4gCisjICsgICAgcmVjZWl2ZWQgaXQuCisjICAKKyMgIDEuIFlv
dSBtYXkgbWFrZSBhbmQgZ2l2ZSBhd2F5IHZlcmJhdGltIGNvcGllcyBvZiB0aGUgc291cmNlIGZv
cm0gb2YgdGhlCisjICBTdGFuZGFyZCBWZXJzaW9uIG9mIHRoaXMgUGFja2FnZSB3aXRob3V0IHJl
c3RyaWN0aW9uLCBwcm92aWRlZCB0aGF0IHlvdQorIyBAQCAtMzczLDcgKzM3Myw3IEBACisjICAK
KyMgIDkuIFRISVMgUEFDS0FHRSBJUyBQUk9WSURFRCAiQVMgSVMiIEFORCBXSVRIT1VUIEFOWSBF
WFBSRVNTIE9SIElNUExJRUQKKyMgIFdBUlJBTlRJRVMsIElOQ0xVRElORywgV0lUSE9VVCBMSU1J
VEFUSU9OLCBUSEUgSU1QTElFRCBXQVJSQU5USUVTIE9GCisjIC1NRVJDSEFOVElCSUxJVFkgQU5E
IEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLgorIyArTUVSQ0hBTlRBQklMSVRZIEFO
RCBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4KKyMgIAorIyAgVGhlIEVuZAorIyAg
CisjIAorIworCiBTVU1NQVJZID0gIkluY3JlZGlibHkgc2ltcGxlIGhlbHBlcnMgZm9yIHRlc3Rp
bmcgY29kZSB3aXRoIGV4Y2VwdGlvbnMiCiBERVNDUklQVElPTiA9ICJUZXN0OjpGYXRhbCBpcyBh
biBhbHRlcm5hdGl2ZSB0byB0aGUgcG9wdWxhciBUZXN0OjpFeGNlcHRpb24uXAogSXQgZG9lcyBt
dWNoIGxlc3MsIGJ1dCBzaG91bGQgYWxsb3cgZ3JlYXRlciBmbGV4aWJpbGl0eSBpbiB0ZXN0aW5n
IFwKQEAgLTcsMTEgKzU2LDExIEBAIEJVR1RSQUNLRVIgPSAiaHR0cHM6Ly9naXRodWIuY29tL3Jq
YnMvVGVzdC1GYXRhbC9pc3N1ZXMiCiBTRUNUSU9OID0gImxpYnMiCiBMSUNFTlNFID0gIkFydGlz
dGljLTEuMCB8IEdQTC0xLjAtb3ItbGF0ZXIiCiAKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0U7bWQ1PWY3YzczYmYyNGJlMWJjNzc1OWJkZTljMTUwMDBkYjZjIgorTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YjVjODUxMjkwY2FiMWRkYTEyZmNmYjBlOWVj
NDM2MzkiCiAKIFNSQ19VUkkgPSAiJHtDUEFOX01JUlJPUn0vYXV0aG9ycy9pZC9SL1JKL1JKQlMv
VGVzdC1GYXRhbC0ke1BWfS50YXIuZ3oiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3MjgzZDQz
MGYyYmEyMDMwYjhjZDk3OWFlMzAzOWQzZjFiMmVjM2RkZTFhMTFjYTZhZTA5Zjk5MmE2NmY3ODhm
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM3ZGZmZmRhZmI4NGI3NjJlZmU5NmIwMmZiMmFhNDFm
MzcwMjZjNzNlNmI4MzU5MGRiNzYyMjk2OTdmM2M0YTYiCiAKIFMgPSAiJHtXT1JLRElSfS9UZXN0
LUZhdGFsLSR7UFZ9IgogCi0tIAoyLjM3LjMKCg==

--===============1879249511967476781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libtest-fatal-perl: SRC_URI changed from "https://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Test-Fatal-0.016.tar.gz file://ptest-perl/run-ptest" to "https://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Test-Fatal-0.017.tar.gz file://ptest-perl/run-ptest"
packages/core2-32-poky-linux/libtest-fatal-perl: PV changed from "0.016" to "0.017"
packages/core2-32-poky-linux/libtest-fatal-perl: PKGV changed from 0.016 [default] to 0.017 [default]
packages/core2-32-poky-linux/libtest-fatal-perl/libtest-fatal-perl-dbg: PV changed from "0.016" to "0.017"
packages/core2-32-poky-linux/libtest-fatal-perl/libtest-fatal-perl-dbg: PKGV changed from 0.016 [default] to 0.017 [default]
packages/core2-32-poky-linux/libtest-fatal-perl/libtest-fatal-perl-dev: PV changed from "0.016" to "0.017"
packages/core2-32-poky-linux/libtest-fatal-perl/libtest-fatal-perl-dev: PKGV changed from 0.016 [default] to 0.017 [default]
packages/core2-32-poky-linux/libtest-fatal-perl/libtest-fatal-perl-doc: PV changed from "0.016" to "0.017"
packages/core2-32-poky-linux/libtest-fatal-perl/libtest-fatal-perl-doc: PKGV changed from 0.016 [default] to 0.017 [default]
packages/core2-32-poky-linux/libtest-fatal-perl/libtest-fatal-perl-doc: PKGSIZE changed from 9141 to 9647 (+6%)
packages/core2-32-poky-linux/libtest-fatal-perl/libtest-fatal-perl-locale: PV changed from "0.016" to "0.017"
packages/core2-32-poky-linux/libtest-fatal-perl/libtest-fatal-perl-locale: PKGV changed from 0.016 [default] to 0.017 [default]
packages/core2-32-poky-linux/libtest-fatal-perl/libtest-fatal-perl-ptest: PV changed from "0.016" to "0.017"
packages/core2-32-poky-linux/libtest-fatal-perl/libtest-fatal-perl-ptest: PKGV changed from 0.016 [default] to 0.017 [default]
packages/core2-32-poky-linux/libtest-fatal-perl/libtest-fatal-perl-ptest: PKGSIZE changed from 13261 to 13284 (+0%)
packages/core2-32-poky-linux/libtest-fatal-perl/libtest-fatal-perl-src: PV changed from "0.016" to "0.017"
packages/core2-32-poky-linux/libtest-fatal-perl/libtest-fatal-perl-src: PKGV changed from 0.016 [default] to 0.017 [default]
packages/core2-32-poky-linux/libtest-fatal-perl/libtest-fatal-perl-staticdev: PV changed from "0.016" to "0.017"
packages/core2-32-poky-linux/libtest-fatal-perl/libtest-fatal-perl-staticdev: PKGV changed from 0.016 [default] to 0.017 [default]
packages/core2-32-poky-linux/libtest-fatal-perl/libtest-fatal-perl: PV changed from "0.016" to "0.017"
packages/core2-32-poky-linux/libtest-fatal-perl/libtest-fatal-perl: PKGV changed from 0.016 [default] to 0.017 [default]
packages/core2-32-poky-linux/libtest-fatal-perl/libtest-fatal-perl: PKGSIZE changed from 14864 to 15355 (+3%)

--===============1879249511967476781==--

