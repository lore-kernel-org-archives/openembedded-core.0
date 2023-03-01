Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78771C7EE39
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:18 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.24034.1677681914416025473
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lig+qGBt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101869da26e7e-87d459ee-58ad-44e2-afe6-877ef82aa780-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NXQZDUchZ/b/oU9KeJK2//AZNcqqXgy4y3T1iPycj60=;
	b=lig+qGBtshubmBvZNS3fcRa/A8lUN78TS8Q+mZIL30NIjopTbA92Cj4JpCLBxtwM
	DgeQnQssu130M+gno8rbd12jxBXCoDOzWHr4nxxtRCp298Bwa9cLyAXW11YRXypyTPd
	VXofiNqzkSJHrG11/vWeiOL+TJYm+MCiPC8UFFqs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NXQZDUchZ/b/oU9KeJK2//AZNcqqXgy4y3T1iPycj60=;
	b=KwuPKrrVGRGupxv+naWIn/zj/eB+QIO5G3uc1Su1e699bJ3DifGg4Ub9P1GNn2FZ
	M+1iHlJaUvpmPBi/s6WdrNF4yw+CJDCOqNjxrCS98MTjm/sL7CDLAMiZUAxV+kJKPOc
	kk3pgQEq40fgn8cImRnmjqQ7l80DbXDboDT3mEpc=
Content-Type: multipart/mixed; boundary="===============0833757462467541710=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] make: upgrading to 4.4.1 SUCCEEDED
Message-ID: <010101869da26e7e-87d459ee-58ad-44e2-afe6-877ef82aa780-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177898

--===============0833757462467541710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *make* to *4.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-make-upgrade-4.4-4.4.1.patch
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
--===============0833757462467541710==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-make-upgrade-4.4-4.4.1.patch"

RnJvbSAyMGNiYzg1ZWFhMmZkZmM0ZjU0ODUxYmEwNDk5ODQyOTBjNzU0MjBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAwODowNjozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1h
a2U6IHVwZ3JhZGUgNC40IC0+IDQuNC4xCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tYWtl
L21ha2Uvc2lncGlwZS5wYXRjaCB8IDQyIC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9tYWtlL3tt
YWtlXzQuNC5iYiA9PiBtYWtlXzQuNC4xLmJifSAgICAgICB8ICA1ICstLQogMiBmaWxlcyBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDQ1IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tYWtlL21ha2Uvc2lncGlwZS5wYXRjaAogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9tYWtlL3ttYWtlXzQuNC5iYiA9PiBtYWtlXzQuNC4xLmJifSAo
NjclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tYWtlL21ha2Uvc2lncGlw
ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tYWtlL21ha2Uvc2lncGlwZS5wYXRjaApk
ZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYTcyNzBmZGJkYS4uMDAwMDAwMDAwMAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWFrZS9tYWtlL3NpZ3BpcGUucGF0Y2gKKysrIC9kZXYv
bnVsbApAQCAtMSw0MiArMCwwIEBACi1Gcm9tIDkyYWIyZTY0MmQyYzA0YjNkY2I1YTczNmFlNjE5
MzY4MGJmZDVmNzQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBQYXVsIFNtaXRoIDxw
c21pdGhAZ251Lm9yZz4KLURhdGU6IFN1biwgNiBOb3YgMjAyMiAxNToyMjowMiAtMDUwMAotU3Vi
amVjdDogKiBzcmMvbWFpbi5jIChtYWluKTogW1NWIDYzMzA3XSBIYW5kbGUgU0lHUElQRSBhcyBh
IGZhdGFsIHNpZ25hbAotCi1BbHdheXMgaWdub3JpbmcgU0lHUElQRSBpcyB2aXNpYmxlIHRvIGNo
aWxkIHByb2Nlc3Nlcy4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXQu
c2F2YW5uYWguZ251Lm9yZy9jZ2l0L21ha2UuZ2l0L2NvbW1pdC8/aWQ9OTJhYjJlNjQyZDJjMDRi
M2RjYjVhNzM2YWU2MTkzNjgwYmZkNWY3NF0KLVNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5h
dmluIDxhbGV4QGxpbnV0cm9uaXguZGU+Ci0tLS0KLSBzcmMvbWFpbi5jIHwgOCArKystLS0tLQot
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCi0KLWRpZmYg
LS1naXQgYS9zcmMvbWFpbi5jIGIvc3JjL21haW4uYwotaW5kZXggZWVjOTM2NS4uZjJjYWY3YSAx
MDA2NDQKLS0tLSBhL3NyYy9tYWluLmMKLSsrKyBiL3NyYy9tYWluLmMKLUBAIC0xMTgyLDExICsx
MTgyLDYgQEAgbWFpbiAoaW50IGFyZ2MsIGNoYXIgKiphcmd2LCBjaGFyICoqZW52cCkKLSAgIC8q
IFVzZWZ1bCBmb3IgYXR0YWNoaW5nIGRlYnVnZ2VycywgZXRjLiAgKi8KLSAgIFNQSU4gKCJtYWlu
LWVudHJ5Iik7Ci0gCi0tICAvKiBEb24ndCBkaWUgaWYgb3VyIHN0ZG91dCBzZW5kcyB1cyBTSUdQ
SVBFLiAgKi8KLS0jaWZkZWYgU0lHUElQRQotLSAgYnNkX3NpZ25hbCAoU0lHUElQRSwgU0lHX0lH
Tik7Ci0tI2VuZGlmCi0tCi0gI2lmZGVmIEhBVkVfQVRFWElUCi0gICBpZiAoQU5ZX1NFVCAoY2hl
Y2tfaW9fc3RhdGUgKCksIElPX1NURE9VVF9PSykpCi0gICAgIGF0ZXhpdCAoY2xvc2Vfc3Rkb3V0
KTsKLUBAIC0xMjY1LDYgKzEyNjAsOSBAQCBtYWluIChpbnQgYXJnYywgY2hhciAqKmFyZ3YsIGNo
YXIgKiplbnZwKQotICNpZmRlZiBTSUdRVUlUCi0gICBGQVRBTF9TSUcgKFNJR1FVSVQpOwotICNl
bmRpZgotKyNpZmRlZiBTSUdQSVBFCi0rICBGQVRBTF9TSUcgKFNJR1BJUEUpOwotKyNlbmRpZgot
ICAgRkFUQUxfU0lHIChTSUdJTlQpOwotICAgRkFUQUxfU0lHIChTSUdURVJNKTsKLSAKLS0tIAot
Y2dpdCB2MS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tYWtlL21ha2Vf
NC40LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21ha2UvbWFrZV80LjQuMS5iYgpzaW1pbGFy
aXR5IGluZGV4IDY3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWFrZS9tYWtl
XzQuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL21ha2UvbWFrZV80LjQuMS5i
YgppbmRleCA2NjQyYzcwOGQ4Li40ZjhjMjRhZDBlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvbWFrZS9tYWtlXzQuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWFr
ZS9tYWtlXzQuNC4xLmJiCkBAIC0yLDEzICsyLDEyIEBAIExJQ0VOU0UgPSAiR1BMLTMuMC1vbmx5
IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YzY3ODk1N2IwYzhlOTY0
YWE2YzcwZmQ3NzY0MWE3MWUiCiByZXF1aXJlIG1ha2UuaW5jCiAKLVNSQ19VUkkgKz0gIiBcCitT
UkNfVVJJICs9ICIke0dOVV9NSVJST1J9L21ha2UvbWFrZS0ke1BWfS50YXIuZ3ogXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1tNC1nZXRsb2FkYXZnLm00LXJlc3RyaWN0LUFJWC1zcGVjaWZpYy10
ZXN0LW9uLUFJWC5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly9zaWdwaXBlLnBhdGNoIFwKICAg
ICAgICAgICAgIgogCiBFWFRSQV9PRUNPTkYgKz0gIi0td2l0aG91dC1ndWlsZSIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjU4MWY0ZDRlODcyZGE3NGIzOTQxYzg3NDIxNTg5OGE3ZDM1ODAyZjAz
NzMyYmRjY2VlMWQ0YTc5NzkxMDVkMTgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGQxNmZiMWQ2
N2JmYWI3OWE3MmY1ZTgzOTA3MzVjNDllM2U4ZTcwYjQ5NDVhMTVhYjFmODFkZGI3ODY1OGZiMyIK
IAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgotLSAKMi4zOS4yCgo=

--===============0833757462467541710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/make: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make: SRC_URI changed from "https://ftp.gnu.org/gnu/make/make-4.4.tar.gz file://0001-m4-getloadavg.m4-restrict-AIX-specific-test-on-AIX.patch file://sigpipe.patch" to "https://ftp.gnu.org/gnu/make/make-4.4.1.tar.gz https://ftp.gnu.org/gnu/make/make-4.4.1.tar.gz file://0001-m4-getloadavg.m4-restrict-AIX-specific-test-on-AIX.patch"
packages/core2-32-poky-linux/make: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-dbg: PKGSIZE changed from 607872 to 582920 (-4%)
packages/core2-32-poky-linux/make/make-dbg: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-dbg: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-dev: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-dev: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-doc: PKGSIZE changed from 663523 to 664245 (+0%)
packages/core2-32-poky-linux/make/make-doc: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-doc: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-be: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-be: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-bg: PKGSIZE changed from 65584 to 67139 (+2%)
packages/core2-32-poky-linux/make/make-locale-bg: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-bg: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-cs: PKGSIZE changed from 50567 to 51630 (+2%)
packages/core2-32-poky-linux/make/make-locale-cs: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-cs: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-da: PKGSIZE changed from 46951 to 46271 (-1%)
packages/core2-32-poky-linux/make/make-locale-da: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-da: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-de: PKGSIZE changed from 52220 to 53393 (+2%)
packages/core2-32-poky-linux/make/make-locale-de: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-de: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-es: PKGSIZE changed from 41411 to 41139 (-1%)
packages/core2-32-poky-linux/make/make-locale-es: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-es: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-fi: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-fi: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-fr: PKGSIZE changed from 41807 to 41529 (-1%)
packages/core2-32-poky-linux/make/make-locale-fr: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-fr: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-ga: PKGSIZE changed from 38938 to 38653 (-1%)
packages/core2-32-poky-linux/make/make-locale-ga: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-ga: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-gl: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-gl: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-he: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-he: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-hr: PKGSIZE changed from 50639 to 51679 (+2%)
packages/core2-32-poky-linux/make/make-locale-hr: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-hr: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-id: PKGSIZE changed from 39490 to 39250 (-1%)
packages/core2-32-poky-linux/make/make-locale-id: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-id: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-it: PKGSIZE changed from 41012 to 40756 (-1%)
packages/core2-32-poky-linux/make/make-locale-it: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-it: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-ja: PKGSIZE changed from 54247 to 55400 (+2%)
packages/core2-32-poky-linux/make/make-locale-ja: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-ja: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-ko: PKGSIZE changed from 51905 to 53067 (+2%)
packages/core2-32-poky-linux/make/make-locale-ko: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-ko: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-lt: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-lt: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-nl: PKGSIZE changed from 48958 to 48248 (-1%)
packages/core2-32-poky-linux/make/make-locale-nl: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-nl: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-pl: PKGSIZE changed from 49133 to 50247 (+2%)
packages/core2-32-poky-linux/make/make-locale-pl: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-pl: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-pt-br: PKGSIZE changed from 39569 to 39328 (-1%)
packages/core2-32-poky-linux/make/make-locale-pt-br: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-pt-br: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-pt: PKGSIZE changed from 39137 to 38893 (-1%)
packages/core2-32-poky-linux/make/make-locale-pt: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-pt: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-ro: PKGSIZE changed from 52157 to 53348 (+2%)
packages/core2-32-poky-linux/make/make-locale-ro: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-ro: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-ru: PKGSIZE changed from 51042 to 64005 (+25%)
packages/core2-32-poky-linux/make/make-locale-ru: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-ru: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-sr: PKGSIZE changed from 59190 to 62502 (+6%)
packages/core2-32-poky-linux/make/make-locale-sr: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-sr: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-sv: PKGSIZE changed from 48252 to 49313 (+2%)
packages/core2-32-poky-linux/make/make-locale-sv: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-sv: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-tr: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-tr: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-uk: PKGSIZE changed from 61658 to 63561 (+3%)
packages/core2-32-poky-linux/make/make-locale-uk: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-uk: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-vi: PKGSIZE changed from 42515 to 42231 (-1%)
packages/core2-32-poky-linux/make/make-locale-vi: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-vi: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-zh-cn: PKGSIZE changed from 37823 to 40272 (+6%)
packages/core2-32-poky-linux/make/make-locale-zh-cn: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-zh-cn: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-locale-zh-tw: PKGSIZE changed from 45174 to 47740 (+6%)
packages/core2-32-poky-linux/make/make-locale-zh-tw: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-locale-zh-tw: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-src: PKGSIZE changed from 988728 to 1000227 (+1%)
packages/core2-32-poky-linux/make/make-src: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-src: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make-staticdev: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make-staticdev: PKGV changed from 4.4 [default] to 4.4.1 [default]
packages/core2-32-poky-linux/make/make: PKGSIZE changed from 281968 to 287360 (+2%)
packages/core2-32-poky-linux/make/make: PV changed from "4.4" to "4.4.1"
packages/core2-32-poky-linux/make/make: PKGV changed from 4.4 [default] to 4.4.1 [default]

--===============0833757462467541710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/make/make-locale-ru: PKGSIZE changed from 51042 to 64005 (+25%)

--===============0833757462467541710==--

