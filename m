Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 090D9C7EE21
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:51 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.107418.1682976349473379046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TxNaucyI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010187d9351fbe-a8a588dd-dbf7-4d95-935b-11d963a6d26b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6lPbCRpveVMBOSYEBW+Ayxq4GQuCAS87UyUKcQ6/MS4=;
	b=TxNaucyI1w2UyoMvkVGK26S7AYl2KvA05TRtxqIgXa20yfumTu9Q/hphKvPWOY7x
	gnP0WCib3NZ/yeZ4qAdJcFX9WH2l9qq/BWVKXcXqLRPtVXENhsCk08Na0Hgl38dFDkT
	IK67+p0Swz/Lw/7p0E5zScvCoasFlalh6tzeo4NY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6lPbCRpveVMBOSYEBW+Ayxq4GQuCAS87UyUKcQ6/MS4=;
	b=nk9E/2aNd3jaOgtrhsG1hAHpB+AzM3gyhJnHzGYglICTCSYfViw7F4QYMj6b/2Oa
	agmGwVXPN6+kcZGB4U0zXwr16cw/R0bZPWvVd6c+EN8EytJAAwZsJhGrTFRaUwPB8If
	MjJjRRoKvVboDVzVEU1kYtPLT24loQ7HkQk9AX1c=
Content-Type: multipart/mixed; boundary="===============6807286585329228858=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 23.1.2 SUCCEEDED
Message-ID: <01010187d9351fbe-a8a588dd-dbf7-4d95-935b-11d963a6d26b-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180619

--===============6807286585329228858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pip* to *23.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pip-upgrade-23.0.1-23.1.2.patch
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
--===============6807286585329228858==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pip-upgrade-23.0.1-23.1.2.patch"

RnJvbSA2Yjk2Nzg2YTBmZTQyMzM5NTdhNmEzMzNjNjcyMDIxZWY0ZmUzMGUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxMTowMjo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGlwOiB1cGdyYWRlIDIzLjAuMSAtPiAyMy4xLjIKCi0tLQogLi4ubjMtcGlwXzIzLjAu
MS5iYiA9PiBweXRob24zLXBpcF8yMy4xLjIuYmJ9IHwgNDkgKysrKysrKysrKysrKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1waXBfMjMuMC4xLmJiID0+IHB5
dGhvbjMtcGlwXzIzLjEuMi5iYn0gKDU3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzIzLjAuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1waXBfMjMuMS4yLmJiCnNpbWlsYXJpdHkgaW5kZXggNTclCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjMuMC4xLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzIzLjEu
Mi5iYgppbmRleCBkOWI5OTA2ZmY5Li4yZWVkYjA5YTRlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzIzLjAuMS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzIzLjEuMi5iYgpAQCAtMSwzICsxLDQ4IEBA
CisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQg
YnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2Ug
YmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0
ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMg
aW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChl
eGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisj
IFRoZSBjaGFuZ2VzOgorIworIyAtLS0gc3JjL3BpcC9fdmVuZG9yL3BrZ19yZXNvdXJjZXMvTElD
RU5TRQorIyArKysgc3JjL3BpcC9fdmVuZG9yL3BrZ19yZXNvdXJjZXMvTElDRU5TRQorIyBAQCAt
MSwxOSArMSwxOSBAQAorIyAtQ29weXJpZ2h0IChDKSAyMDE2IEphc29uIFIgQ29vbWJzIDxqYXJh
Y29AamFyYWNvLmNvbT4KKyMgK0NvcHlyaWdodCBKYXNvbiBSLiBDb29tYnMKKyMgIAorIyAtUGVy
bWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24g
b2J0YWluaW5nIGEgY29weSBvZgorIyAtdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1
bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwgaW4KKyMgLXRoZSBTb2Z0
d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uIHRo
ZSByaWdodHMgdG8KKyMgLXVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJp
YnV0ZSwgc3VibGljZW5zZSwgYW5kL29yIHNlbGwgY29waWVzCisjIC1vZiB0aGUgU29mdHdhcmUs
IGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZSBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQg
dG8gZG8KKyMgLXNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKKyMgK1Bl
cm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29u
IG9idGFpbmluZyBhIGNvcHkKKyMgK29mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9j
dW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0bworIyArZGVhbCBpbiB0aGUgU29m
dHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0
aGUKKyMgK3JpZ2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3Ry
aWJ1dGUsIHN1YmxpY2Vuc2UsIGFuZC9vcgorIyArc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJl
LCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUgU29mdHdhcmUgaXMKKyMgK2Z1cm5p
c2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CisjICAK
KyMgLVRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNl
IHNoYWxsIGJlIGluY2x1ZGVkIGluIGFsbAorIyAtY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRp
b25zIG9mIHRoZSBTb2Z0d2FyZS4KKyMgK1RoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0
aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJlIGluY2x1ZGVkIGluCisjICthbGwgY29waWVz
IG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KKyMgIAorIyAgVEhFIFNP
RlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQs
IEVYUFJFU1MgT1IKKyMgIElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhF
IFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLAorIyAgRklUTkVTUyBGT1IgQSBQQVJUSUNV
TEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gSU4gTk8gRVZFTlQgU0hBTEwgVEhFCisj
ICBBVVRIT1JTIE9SIENPUFlSSUdIVCBIT0xERVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBE
QU1BR0VTIE9SIE9USEVSCisjIC1MSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENP
TlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSwgQVJJU0lORyBGUk9NLAorIyAtT1VUIE9GIE9SIElO
IENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUiBPVEhFUiBERUFMSU5H
UyBJTiBUSEUKKyMgLVNPRlRXQVJFLgorIyArTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElP
TiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcKKyMgK0ZST00sIE9VVCBP
RiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIg
REVBTElOR1MKKyMgK0lOIFRIRSBTT0ZUV0FSRS4KKyMgCisjCisKIFNVTU1BUlkgPSAiVGhlIFB5
UEEgcmVjb21tZW5kZWQgdG9vbCBmb3IgaW5zdGFsbGluZyBQeXRob24gcGFja2FnZXMiCiBIT01F
UEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2plY3QvcGlwIgogU0VDVElPTiA9ICJkZXZlbC9w
eXRob24iCkBAIC0xMyw3ICs1OCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0UudHh0O21kNT02M2VjNTJiYWY5NTE2M2I1OTcwMDhiYjQ2ZGI2ODAzMCBcCiAgICAgICAgICAg
ICAgICAgICAgIGZpbGU6Ly9zcmMvcGlwL192ZW5kb3IvbXNncGFjay9DT1BZSU5HO21kNT1jZDk1
MjMxODFkOWQ0ZmJmN2ZmY2E1MmVhYTJhNTc1MSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly9zcmMvcGlwL192ZW5kb3IvcGFja2FnaW5nL0xJQ0VOU0U7bWQ1PWZhYWRhZWRjYTkyNTFhOTBi
MjA1YzkxNjc1NzhjZTkxIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9waXAvX3Zl
bmRvci9wYWNrYWdpbmcvTElDRU5TRS5BUEFDSEU7bWQ1PTJlZTQxMTEyYTQ0ZmU3MDE0ZGNlMzNl
MjY0NjhiYTkzIFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9waXAvX3ZlbmRvci9w
a2dfcmVzb3VyY2VzL0xJQ0VOU0U7bWQ1PTlhMzM4OTdmMWJjYTExNjBkN2FhZDM4MzUxNTJlMTU4
IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9waXAvX3ZlbmRvci9wa2dfcmVzb3Vy
Y2VzL0xJQ0VOU0U7bWQ1PTdhNzEyNmUwNjgyMDYyOTBmM2ZlOWY4ZDZjNzEzZWE2IFwKICAgICAg
ICAgICAgICAgICAgICAgZmlsZTovL3NyYy9waXAvX3ZlbmRvci9wbGF0Zm9ybWRpcnMvTElDRU5T
RTttZDU9ZWE0ZjVhNDE0NTQ3NDZhOWVkMTExZTNkODcyM2QxN2EgXAogICAgICAgICAgICAgICAg
ICAgICBmaWxlOi8vc3JjL3BpcC9fdmVuZG9yL3B5Z21lbnRzL0xJQ0VOU0U7bWQ1PTM2YTEzYzkw
NTE0ZTI4OTlmMWViYTdmNDFjM2VlNTkyIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3Ny
Yy9waXAvX3ZlbmRvci9weXBhcnNpbmcvTElDRU5TRTttZDU9NjU3YTU2NjIzMzg4ODUxM2UxZjA3
YmExM2UyZjQ3ZjEgXApAQCAtMzMsNyArNzgsNyBAQCBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVw
dG9vbHNfYnVpbGRfbWV0YQogCiBTUkNfVVJJICs9ICJmaWxlOi8vbm9fc2hlYmFuZ19tYW5nbGlu
Zy5wYXRjaCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImNkMDE1ZWExYmZiMGZjZWY1OWQ4YTI4
NmMxZjhiZWJjYjk4M2Y2MzE3NzE5ZDQxNWRjNTM1MWVmYjdjZDcwMjQiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMGU3Yzg2ZjQ4NjkzNTg5M2M3MDgyODdiMzBiZDA1MGEzNmFjODI3ZWM3ZmU1ZTQz
ZmU3Y2IxOThkZDgzNWZiYSIKIAogZG9faW5zdGFsbDphcHBlbmQoKSB7CiAgICAgcm0gLWYgJHtE
fS8ke2JpbmRpcn0vcGlwCi0tIAoyLjM5LjIKCg==

--===============6807286585329228858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pip: PKGV changed from 23.0.1 [default] to 23.1.2 [default]
packages/core2-32-poky-linux/python3-pip: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pip/pip-23.0.1.tar.gz;downloadfilename=pip-23.0.1.tar.gz file://no_shebang_mangling.patch" to "https://files.pythonhosted.org/packages/source/p/pip/pip-23.1.2.tar.gz;downloadfilename=pip-23.1.2.tar.gz file://no_shebang_mangling.patch"
packages/core2-32-poky-linux/python3-pip: PV changed from "23.0.1" to "23.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip-dbg: PKGV changed from 23.0.1 [default] to 23.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-dbg: PV changed from "23.0.1" to "23.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip-dev: PKGV changed from 23.0.1 [default] to 23.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-dev: PV changed from "23.0.1" to "23.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip-doc: PKGV changed from 23.0.1 [default] to 23.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-doc: PV changed from "23.0.1" to "23.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip-locale: PKGV changed from 23.0.1 [default] to 23.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-locale: PV changed from "23.0.1" to "23.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip-src: PKGV changed from 23.0.1 [default] to 23.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-src: PV changed from "23.0.1" to "23.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip-staticdev: PKGV changed from 23.0.1 [default] to 23.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-staticdev: PV changed from "23.0.1" to "23.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip: PKGV changed from 23.0.1 [default] to 23.1.2 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip: FILELIST: removed "/usr/lib/python3.11/site-packages/pip/_internal/utils/__pycache__/distutils_args.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_vendor/pkg_resources/__pycache__/py31compat.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_internal/utils/distutils_args.py /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/top_level.txt /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/entry_points.txt /usr/lib/python3.11/site-packages/pip/_internal/operations/install/legacy.py /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/RECORD /usr/lib/python3.11/site-packages/pip/_vendor/pkg_resources/py31compat.py /usr/lib/python3.11/site-packages/pip/_internal/operations/install/__pycache__/legacy.cpython-311.pyc /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/METADATA /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/WHEEL /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/LICENSE.txt", added "
 /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/top_level.txt /usr/lib/python3.11/site-packages/pip/_vendor/rich/_fileno.py /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/AUTHORS.txt /usr/lib/python3.11/site-packages/pip/_internal/utils/__pycache__/_jaraco_text.cpython-311.pyc /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/entry_points.txt /usr/lib/python3.11/site-packages/pip/_vendor/rich/__pycache__/_fileno.cpython-311.pyc /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/RECORD /usr/lib/python3.11/site-packages/pip/_internal/utils/_jaraco_text.py /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/METADATA /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/WHEEL /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/LICENSE.txt"
packages/core2-32-poky-linux/python3-pip/python3-pip: PV changed from "23.0.1" to "23.1.2"
packages/core2-32-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 14034474 to 14089996 (+0%)
Changes to packages/core2-32-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t32.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t64-arm.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t64.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w32.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w64-arm.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w64.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info moved to /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info
  /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/AUTHORS.txt was added
  /usr/lib/python3.11/site-packages/pip/_internal/utils/_jaraco_text.py was added
  /usr/lib/python3.11/site-packages/pip/_internal/utils/__pycache__/_jaraco_text.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip/_vendor/rich/_fileno.py was added
  /usr/lib/python3.11/site-packages/pip/_vendor/rich/__pycache__/_fileno.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip/_internal/operations/install/legacy.py was removed
  /usr/lib/python3.11/site-packages/pip/_internal/operations/install/__pycache__/legacy.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pip/_internal/utils/distutils_args.py was removed
  /usr/lib/python3.11/site-packages/pip/_internal/utils/__pycache__/distutils_args.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pip/_vendor/pkg_resources/py31compat.py was removed
  /usr/lib/python3.11/site-packages/pip/_vendor/pkg_resources/__pycache__/py31compat.cpython-311.pyc was removed

--===============6807286585329228858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pip/python3-pip: FILELIST: removed "/usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/top_level.txt /usr/lib/python3.11/site-packages/pip/_internal/operations/install/legacy.py /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/LICENSE.txt /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/WHEEL /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/METADATA /usr/lib/python3.11/site-packages/pip/_internal/operations/install/__pycache__/legacy.cpython-311.pyc /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/entry_points.txt /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info/RECORD /usr/lib/python3.11/site-packages/pip/_internal/utils/distutils_args.py /usr/lib/python3.11/site-packages/pip/_vendor/pkg_resources/py31compat.py /usr/lib/python3.11/site-packages/pip/_vendor/pkg_resources/__pycache__/py31compat.cpython-311.pyc /usr/lib/python3.11/site-packages/pip/_internal/utils/__pycache__/distutils_args.cpython-311.pyc", added "
 /usr/lib/python3.11/site-packages/pip/_internal/utils/__pycache__/_jaraco_text.cpython-311.pyc /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/top_level.txt /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/LICENSE.txt /usr/lib/python3.11/site-packages/pip/_internal/utils/_jaraco_text.py /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/METADATA /usr/lib/python3.11/site-packages/pip/_vendor/rich/_fileno.py /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/WHEEL /usr/lib/python3.11/site-packages/pip/_vendor/rich/__pycache__/_fileno.cpython-311.pyc /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/entry_points.txt /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/RECORD /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/AUTHORS.txt"
Changes to packages/core2-32-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t32.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t64-arm.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/t64.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w32.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w64-arm.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip/_vendor/distlib/w64.exe changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.11/site-packages/pip-23.0.1.dist-info moved to /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info
  /usr/lib/python3.11/site-packages/pip-23.1.2.dist-info/AUTHORS.txt was added
  /usr/lib/python3.11/site-packages/pip/_internal/utils/_jaraco_text.py was added
  /usr/lib/python3.11/site-packages/pip/_internal/utils/__pycache__/_jaraco_text.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip/_vendor/rich/_fileno.py was added
  /usr/lib/python3.11/site-packages/pip/_vendor/rich/__pycache__/_fileno.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pip/_internal/operations/install/legacy.py was removed
  /usr/lib/python3.11/site-packages/pip/_internal/operations/install/__pycache__/legacy.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pip/_internal/utils/distutils_args.py was removed
  /usr/lib/python3.11/site-packages/pip/_internal/utils/__pycache__/distutils_args.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pip/_vendor/pkg_resources/py31compat.py was removed
  /usr/lib/python3.11/site-packages/pip/_vendor/pkg_resources/__pycache__/py31compat.cpython-311.pyc was removed

--===============6807286585329228858==--

