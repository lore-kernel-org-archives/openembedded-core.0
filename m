Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A8AC64ED4
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.847.1667349632999146985
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=R3qMx6Vy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018435c852d4-bceea430-6efc-4cc1-ac30-623b6bb96a27-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349631;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cN2rHcNPokmYrYvshFRNQNXOJRVqEQtIvpR188p402M=;
	b=R3qMx6VyKuI1DVcQL3vUueZIzvJ7vPMnNl0zeUXXN9sLPBVfFXs8Q8mGZPIyCHSh
	Bk/NlNSzNwyc+yeJsm0nPRQ84FWZxIiMauiiI7R5SEV5o6yAL+l+mbyIlT0tJ40E0Q/
	1GviGe3SBuc/ga6vGFDgtIRfEjiqjsliihATAPy8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349631;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cN2rHcNPokmYrYvshFRNQNXOJRVqEQtIvpR188p402M=;
	b=apXl9s5VzP5Ayodfc7JMZS/RvET/yQTBAoo5GgG/jSwPuD28fLSzLOp/Iwa6pZyl
	+WWrnkHogd7f1B6+WWSoZiD2GutXs+iKCJTCLjxeBftxbQsZP9YymR9BX7ft5G+XrH0
	YJGZNcN0Lo8U7R8At0LdTU9SV/CS2Fr5Fqe3t1h4=
Content-Type: multipart/mixed; boundary="===============7080059796166287938=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffstat: upgrading to 1.65 SUCCEEDED
Message-ID: <0101018435c852d4-bceea430-6efc-4cc1-ac30-623b6bb96a27-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172418

--===============7080059796166287938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffstat* to *1.65* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffstat-upgrade-1.64-1.65.patch
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
--===============7080059796166287938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffstat/diffstat-dbg: PKGV changed from 1.64 [default] to 1.65 [default]
packages/core2-32-poky-linux/diffstat/diffstat-dbg: PKGSIZE changed from 115600 to 115984 (+0%)
packages/core2-32-poky-linux/diffstat/diffstat-dbg: PV changed from "1.64" to "1.65"
packages/core2-32-poky-linux/diffstat/diffstat-dev: PKGV changed from 1.64 [default] to 1.65 [default]
packages/core2-32-poky-linux/diffstat/diffstat-dev: PV changed from "1.64" to "1.65"
packages/core2-32-poky-linux/diffstat/diffstat-doc: PKGV changed from 1.64 [default] to 1.65 [default]
packages/core2-32-poky-linux/diffstat/diffstat-doc: PKGSIZE changed from 9069 to 9066 (-0%)
packages/core2-32-poky-linux/diffstat/diffstat-doc: PV changed from "1.64" to "1.65"
packages/core2-32-poky-linux/diffstat/diffstat-locale: PKGV changed from 1.64 [default] to 1.65 [default]
packages/core2-32-poky-linux/diffstat/diffstat-locale: PV changed from "1.64" to "1.65"
packages/core2-32-poky-linux/diffstat/diffstat-ptest: FILELIST: added "/usr/lib/diffstat/ptest/testing/case43.ref /usr/lib/diffstat/ptest/testing/case44k.ref /usr/lib/diffstat/ptest/testing/case44p1.ref /usr/lib/diffstat/ptest/testing/case46.ref /usr/lib/diffstat/ptest/testing/case42f0.ref /usr/lib/diffstat/ptest/testing/case45u.ref /usr/lib/diffstat/ptest/testing/case45b.ref /usr/lib/diffstat/ptest/testing/case46k.ref /usr/lib/diffstat/ptest/testing/case44.ref /usr/lib/diffstat/ptest/testing/case43p1.ref /usr/lib/diffstat/ptest/testing/case43r2.ref /usr/lib/diffstat/ptest/testing/case43f0.ref /usr/lib/diffstat/ptest/testing/case43p9.ref /usr/lib/diffstat/ptest/testing/case42R.ref /usr/lib/diffstat/ptest/testing/case42k.ref /usr/lib/diffstat/ptest/testing/case44r1.ref /usr/lib/diffstat/ptest/testing/case46b.ref /usr/lib/diffstat/ptest/testing/case44b.ref /usr/lib/diffstat/ptest/testing/case44r2.ref /usr/lib/diffstat/ptest/testing/case46R.ref /usr/lib/diffstat/ptest/testing/case45.pat
  /usr/lib/diffstat/ptest/testing/case42u.ref /usr/lib/diffstat/ptest/testing/case46.pat /usr/lib/diffstat/ptest/testing/case42r2.ref /usr/lib/diffstat/ptest/testing/case46f0.ref /usr/lib/diffstat/ptest/testing/case42p9.ref /usr/lib/diffstat/ptest/testing/case45r2.ref /usr/lib/diffstat/ptest/testing/case46p1.ref /usr/lib/diffstat/ptest/testing/case46Rp0.ref /usr/lib/diffstat/ptest/testing/case44f0.ref /usr/lib/diffstat/ptest/testing/case43u.ref /usr/lib/diffstat/ptest/testing/case45p1.ref /usr/lib/diffstat/ptest/testing/case44u.ref /usr/lib/diffstat/ptest/testing/case43k.ref /usr/lib/diffstat/ptest/testing/case45R.ref /usr/lib/diffstat/ptest/testing/case45f0.ref /usr/lib/diffstat/ptest/testing/case45r1.ref /usr/lib/diffstat/ptest/testing/case42p1.ref /usr/lib/diffstat/ptest/testing/case45.ref /usr/lib/diffstat/ptest/testing/case43Rp0.ref /usr/lib/diffstat/ptest/testing/case44.pat /usr/lib/diffstat/ptest/testing/case45Rp0.ref /usr/lib/diffstat/ptest/testing/case45p9.ref /usr/lib/diffs
 tat/ptest/testing/case44R.ref /usr/lib/diffstat/ptest/testing/case46u.ref /usr/lib/diffstat/ptest/testing/case45k.ref /usr/lib/diffstat/ptest/testing/case46r2.ref /usr/lib/diffstat/ptest/testing/case43.pat /usr/lib/diffstat/ptest/testing/case42.ref /usr/lib/diffstat/ptest/testing/case43r1.ref /usr/lib/diffstat/ptest/testing/case46r1.ref /usr/lib/diffstat/ptest/testing/case44Rp0.ref /usr/lib/diffstat/ptest/testing/case42r1.ref /usr/lib/diffstat/ptest/testing/case44p9.ref /usr/lib/diffstat/ptest/testing/case42b.ref /usr/lib/diffstat/ptest/testing/case43R.ref /usr/lib/diffstat/ptest/testing/case43b.ref /usr/lib/diffstat/ptest/testing/case46p9.ref /usr/lib/diffstat/ptest/testing/case42.pat /usr/lib/diffstat/ptest/testing/case42Rp0.ref"
packages/core2-32-poky-linux/diffstat/diffstat-ptest: PKGV changed from 1.64 [default] to 1.65 [default]
packages/core2-32-poky-linux/diffstat/diffstat-ptest: PKGSIZE changed from 558757 to 623782 (+12%)
packages/core2-32-poky-linux/diffstat/diffstat-ptest: PV changed from "1.64" to "1.65"
packages/core2-32-poky-linux/diffstat/diffstat-src: PKGV changed from 1.64 [default] to 1.65 [default]
packages/core2-32-poky-linux/diffstat/diffstat-src: PKGSIZE changed from 85056 to 85350 (+0%)
packages/core2-32-poky-linux/diffstat/diffstat-src: PV changed from "1.64" to "1.65"
packages/core2-32-poky-linux/diffstat/diffstat-staticdev: PKGV changed from 1.64 [default] to 1.65 [default]
packages/core2-32-poky-linux/diffstat/diffstat-staticdev: PV changed from "1.64" to "1.65"
packages/core2-32-poky-linux/diffstat/diffstat: PKGV changed from 1.64 [default] to 1.65 [default]
packages/core2-32-poky-linux/diffstat/diffstat: PV changed from "1.64" to "1.65"
packages/core2-32-poky-linux/diffstat: PKGV changed from 1.64 [default] to 1.65 [default]
packages/core2-32-poky-linux/diffstat: PV changed from "1.64" to "1.65"
packages/core2-32-poky-linux/diffstat: SRC_URI changed from "http://invisible-mirror.net/archives/diffstat/diffstat-1.64.tgz file://run-ptest file://avoid-check-user-break-cc.patch" to "http://invisible-mirror.net/archives/diffstat/diffstat-1.65.tgz file://run-ptest file://avoid-check-user-break-cc.patch"

--===============7080059796166287938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/diffstat/diffstat-ptest: FILELIST: added "/usr/lib/diffstat/ptest/testing/case42.ref /usr/lib/diffstat/ptest/testing/case43k.ref /usr/lib/diffstat/ptest/testing/case42p1.ref /usr/lib/diffstat/ptest/testing/case42r1.ref /usr/lib/diffstat/ptest/testing/case43f0.ref /usr/lib/diffstat/ptest/testing/case46f0.ref /usr/lib/diffstat/ptest/testing/case45R.ref /usr/lib/diffstat/ptest/testing/case46R.ref /usr/lib/diffstat/ptest/testing/case42.pat /usr/lib/diffstat/ptest/testing/case46r1.ref /usr/lib/diffstat/ptest/testing/case45.pat /usr/lib/diffstat/ptest/testing/case45.ref /usr/lib/diffstat/ptest/testing/case42u.ref /usr/lib/diffstat/ptest/testing/case46p9.ref /usr/lib/diffstat/ptest/testing/case43r1.ref /usr/lib/diffstat/ptest/testing/case46Rp0.ref /usr/lib/diffstat/ptest/testing/case44f0.ref /usr/lib/diffstat/ptest/testing/case46.pat /usr/lib/diffstat/ptest/testing/case46b.ref /usr/lib/diffstat/ptest/testing/case42p9.ref /usr/lib/diffstat/ptest/testing/case44R.r
 ef /usr/lib/diffstat/ptest/testing/case44k.ref /usr/lib/diffstat/ptest/testing/case43p9.ref /usr/lib/diffstat/ptest/testing/case46p1.ref /usr/lib/diffstat/ptest/testing/case44b.ref /usr/lib/diffstat/ptest/testing/case43.ref /usr/lib/diffstat/ptest/testing/case45r2.ref /usr/lib/diffstat/ptest/testing/case45b.ref /usr/lib/diffstat/ptest/testing/case45p9.ref /usr/lib/diffstat/ptest/testing/case44.pat /usr/lib/diffstat/ptest/testing/case46.ref /usr/lib/diffstat/ptest/testing/case43u.ref /usr/lib/diffstat/ptest/testing/case42R.ref /usr/lib/diffstat/ptest/testing/case42Rp0.ref /usr/lib/diffstat/ptest/testing/case43.pat /usr/lib/diffstat/ptest/testing/case46r2.ref /usr/lib/diffstat/ptest/testing/case42r2.ref /usr/lib/diffstat/ptest/testing/case43R.ref /usr/lib/diffstat/ptest/testing/case42b.ref /usr/lib/diffstat/ptest/testing/case44r1.ref /usr/lib/diffstat/ptest/testing/case45p1.ref /usr/lib/diffstat/ptest/testing/case45u.ref /usr/lib/diffstat/ptest/testing/case45r1.ref /usr/lib/diffstat/p
 test/testing/case43Rp0.ref /usr/lib/diffstat/ptest/testing/case43p1.ref /usr/lib/diffstat/ptest/testing/case43b.ref /usr/lib/diffstat/ptest/testing/case45Rp0.ref /usr/lib/diffstat/ptest/testing/case46u.ref /usr/lib/diffstat/ptest/testing/case46k.ref /usr/lib/diffstat/ptest/testing/case43r2.ref /usr/lib/diffstat/ptest/testing/case45f0.ref /usr/lib/diffstat/ptest/testing/case44Rp0.ref /usr/lib/diffstat/ptest/testing/case44p9.ref /usr/lib/diffstat/ptest/testing/case42k.ref /usr/lib/diffstat/ptest/testing/case42f0.ref /usr/lib/diffstat/ptest/testing/case44.ref /usr/lib/diffstat/ptest/testing/case45k.ref /usr/lib/diffstat/ptest/testing/case44p1.ref /usr/lib/diffstat/ptest/testing/case44u.ref /usr/lib/diffstat/ptest/testing/case44r2.ref"
packages/core2-32-poky-linux/diffstat/diffstat-ptest: PKGSIZE changed from 558757 to 623782 (+12%)

--===============7080059796166287938==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffstat-upgrade-1.64-1.65.patch"

RnJvbSA4NTE3NzkwYTVmNWY5YzdkNjIzY2UwZjgxZDI2NWEyY2NkMDU3YjJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwNzo0NDoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZzdGF0OiB1cGdyYWRlIDEuNjQgLT4gMS42NQoKLS0tCiAuLi4ve2RpZmZzdGF0XzEuNjQuYmIg
PT4gZGlmZnN0YXRfMS42NS5iYn0gICAgfCAyMyArKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZGlmZnN0YXQve2RpZmZzdGF0XzEuNjQuYmIgPT4gZGlmZnN0YXRfMS42
NS5iYn0gKDQ3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGlmZnN0YXQv
ZGlmZnN0YXRfMS42NC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kaWZmc3RhdC9kaWZmc3Rh
dF8xLjY1LmJiCnNpbWlsYXJpdHkgaW5kZXggNDclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9kaWZmc3RhdC9kaWZmc3RhdF8xLjY0LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZGlmZnN0YXQvZGlmZnN0YXRfMS42NS5iYgppbmRleCA3MTdmNTAzMDM5Li5jM2Vm
OWU0NjE3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGlmZnN0YXQvZGlmZnN0
YXRfMS42NC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGlmZnN0YXQvZGlmZnN0YXRf
MS42NS5iYgpAQCAtMSwzICsxLDIyIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2
YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xs
b3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vu
c2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFu
ZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGlj
ZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdo
dCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORwor
IyArKysgQ09QWUlORworIyBAQCAtMSw0ICsxLDQgQEAKKyMgLUNvcHlyaWdodCAxOTk0LTIwMTks
MjAyMSBieSBUaG9tYXMgRS4gRGlja2V5CisjICtDb3B5cmlnaHQgMTk5NC0yMDIxLDIwMjIgYnkg
VGhvbWFzIEUuIERpY2tleQorIyAgQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyMgIAorIyAgUGVybWlz
c2lvbiB0byB1c2UsIGNvcHksIG1vZGlmeSwgYW5kIGRpc3RyaWJ1dGUgdGhpcyBzb2Z0d2FyZSBh
bmQgaXRzCisjIAorIworCiBTVU1NQVJZID0gIlRvb2wgdG8gcHJvZHVjZSBhIHN0YXRpc3RpY3Mg
YmFzZWQgb24gYSBkaWZmIgogREVTQ1JJUFRJT04gPSAiZGlmZnN0YXQgcmVhZHMgdGhlIG91dHB1
dCBvZiBkaWZmIGFuZCBkaXNwbGF5cyBhIGhpc3RvZ3JhbSBvZiBcCiB0aGUgaW5zZXJ0aW9ucywg
ZGVsZXRpb25zLCBhbmQgbW9kaWZpY2F0aW9ucyBwZXItZmlsZS4gSXQgaXMgdXNlZnVsIGZvciBc
CkBAIC01LDE0ICsyNCwxNCBAQCByZXZpZXdpbmcgbGFyZ2UsIGNvbXBsZXggcGF0Y2ggZmlsZXMu
IgogSE9NRVBBR0UgPSAiaHR0cDovL2ludmlzaWJsZS1pc2xhbmQubmV0L2RpZmZzdGF0LyIKIFNF
Q1RJT04gPSAiZGV2ZWwiCiBMSUNFTlNFID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0NPUFlJTkc7bWQ1PWY2MDViMTk4NmNjM2I4MDhlYzBlNGZhOWQwZTBmMmQ5IgorTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NjQ1MDU5NDA0OWYwZWVkMTA1MmU2MzRk
ZGNiZWVjMjgiCiAKIFNSQ19VUkkgPSAiaHR0cDovL2ludmlzaWJsZS1taXJyb3IubmV0L2FyY2hp
dmVzLyR7QlBOfS8ke0JQfS50Z3ogXAogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAg
ICAgICAgICAgZmlsZTovL2F2b2lkLWNoZWNrLXVzZXItYnJlYWstY2MucGF0Y2ggXAogICAgICAg
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiOGFlZTM4ZDlkMmUxZDA1OTI2ZTZiNTU4
MTBhOWQyYzJkZDQwN2YyNGQ2YTI2NzM4NzU2M2E0NDM2ZTNmN2ZjIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjhjZjI3NDI0OTI2ZGViY2Q4NTkyMTc1NWMzOTE1NTU5Mjg4MjQ0YmQxMDNmNjJkNzQw
ZGM2YjgzYjU1N2EyOGEiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIGdldHRleHQgcHRlc3QKIAotLSAK
Mi4zMS4xCgo=

--===============7080059796166287938==--

