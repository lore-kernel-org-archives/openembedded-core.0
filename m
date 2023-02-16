Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 460DBC77B6C
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:46 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.10147.1676508396335718441
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RaeX7phr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018657afff7e-0c2775f0-8d38-43aa-9fdf-574a686bcfc2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yO1P2bYEtJQg9WQomS5lrM0FbdT8/cfYsMsajyB0h0I=;
	b=RaeX7phruJFfZ22exBJ0Q+5eG8129fYk5ncu4qjbejcmVT+/TAW4xzPZ9EjABHFR
	l0MVntJH00zERyyFP9tIDvx2fpIuSiBfNwzQ5zs5CYACdzvsF1doTw2naoFdHuMXJbP
	8tW2rh6whbGRyUdrxLngqrRsF+8SC+QCHWofLOYg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yO1P2bYEtJQg9WQomS5lrM0FbdT8/cfYsMsajyB0h0I=;
	b=WQ69wMHvBBLk7DVFK4CTHNdP1EAU7ta2d09zaM6SWQkLOk3Xb0r48G1UW7/1bG/V
	0UhfuwHyZkwqLNloSv7AgU4u7yhBClrLOb+w83QvJ+5ijpXiN3FOroQlXMSyOVKZ5nd
	FKdGXq0lTZZhYvlzx9fLXisRFI5ez5Z/tUKg/NKw=
Content-Type: multipart/mixed; boundary="===============5558522790951276051=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dtc: upgrading to 1.7.0 SUCCEEDED
Message-ID: <0101018657afff7e-0c2775f0-8d38-43aa-9fdf-574a686bcfc2-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:37 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177261

--===============5558522790951276051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dtc* to *1.7.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dtc-upgrade-1.6.1-1.7.0.patch
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
--===============5558522790951276051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dtc/dtc-dbg: PV changed from "1.6.1" to "1.7.0"
packages/core2-32-poky-linux/dtc/dtc-dbg: PKGSIZE changed from 616168 to 623368 (+1%)
packages/core2-32-poky-linux/dtc/dtc-dbg: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-32-poky-linux/dtc/dtc-dev: PV changed from "1.6.1" to "1.7.0"
packages/core2-32-poky-linux/dtc/dtc-dev: PKGSIZE changed from 80359 to 81390 (+1%)
packages/core2-32-poky-linux/dtc/dtc-dev: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-32-poky-linux/dtc/dtc-doc: PV changed from "1.6.1" to "1.7.0"
packages/core2-32-poky-linux/dtc/dtc-doc: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-32-poky-linux/dtc/dtc-locale: PV changed from "1.6.1" to "1.7.0"
packages/core2-32-poky-linux/dtc/dtc-locale: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-32-poky-linux/dtc/dtc-misc: PV changed from "1.6.1" to "1.7.0"
packages/core2-32-poky-linux/dtc/dtc-misc: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-32-poky-linux/dtc/dtc-src: PV changed from "1.6.1" to "1.7.0"
packages/core2-32-poky-linux/dtc/dtc-src: PKGSIZE changed from 567703 to 573932 (+1%)
packages/core2-32-poky-linux/dtc/dtc-src: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-32-poky-linux/dtc/dtc-staticdev: PV changed from "1.6.1" to "1.7.0"
packages/core2-32-poky-linux/dtc/dtc-staticdev: PKGSIZE changed from 0 to 144876 (+100%)
packages/core2-32-poky-linux/dtc/dtc-staticdev: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-32-poky-linux/dtc/dtc-staticdev: FILELIST: added "/usr/lib/libfdt.a"
packages/core2-32-poky-linux/dtc/dtc: PV changed from "1.6.1" to "1.7.0"
packages/core2-32-poky-linux/dtc/dtc: PKGSIZE changed from 275787 to 275883 (+0%)
packages/core2-32-poky-linux/dtc/dtc: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
packages/core2-32-poky-linux/dtc: SRC_URI changed from "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=master file://0001-fdtdump-fix-Werror-int-to-pointer-cast.patch" to "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main"
packages/core2-32-poky-linux/dtc: PV changed from "1.6.1" to "1.7.0"
packages/core2-32-poky-linux/dtc: PKGV changed from 1.6.1 [default] to 1.7.0 [default]
Changes to packages/core2-32-poky-linux/dtc (sysroot):
  /usr/lib/libfdt.a was added

--===============5558522790951276051==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-dtc-upgrade-1.6.1-1.7.0.patch"

RnJvbSBlMGFmYTJlZTAzYzE5YzlhMjE0YTdiZWJmZTRjZWM0YzZhY2MwM2QwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMjE6NTc6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
dGM6IHVwZ3JhZGUgMS42LjEgLT4gMS43LjAKCi0tLQogLi4udGR1bXAtZml4LVdlcnJvci1pbnQt
dG8tcG9pbnRlci1jYXN0LnBhdGNoIHwgNDAgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL2R0Yy97
ZHRjXzEuNi4xLmJiID0+IGR0Y18xLjcuMC5iYn0gICAgICAgIHwgIDUgKy0tCiAyIGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWtlcm5lbC9kdGMvZHRjLzAwMDEtZmR0ZHVtcC1maXgtV2Vycm9yLWlu
dC10by1wb2ludGVyLWNhc3QucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2R0Yy97
ZHRjXzEuNi4xLmJiID0+IGR0Y18xLjcuMC5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMta2VybmVsL2R0Yy9kdGMvMDAwMS1mZHRkdW1wLWZpeC1XZXJyb3ItaW50LXRvLXBvaW50
ZXItY2FzdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwvZHRjL2R0Yy8wMDAxLWZkdGR1bXAt
Zml4LVdlcnJvci1pbnQtdG8tcG9pbnRlci1jYXN0LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCA0YzNlMzRiMWZmLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1rZXJu
ZWwvZHRjL2R0Yy8wMDAxLWZkdGR1bXAtZml4LVdlcnJvci1pbnQtdG8tcG9pbnRlci1jYXN0LnBh
dGNoCisrKyAvZGV2L251bGwKQEAgLTEsNDAgKzAsMCBAQAotRml4IHRoZSBidWlsZCBvZiBmZHRk
dW1wIHdpdGggbWluZ3cuCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQKLVNpZ25lZC1vZmYt
Ynk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgotCi1Gcm9tIGFlMGNlMWZhN2Y0
ZDY3OWI1ZjhkZjFmYzBlNzk3MjQ2ZTQzNTQ3ZmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1G
cm9tOiA9P1VURi04P3E/TWFyYy1BbmRyPUMzPUE5PTIwTHVyZWF1Pz0gPG1hcmNhbmRyZS5sdXJl
YXVAcmVkaGF0LmNvbT4KLURhdGU6IFdlZCwgMjUgQXVnIDIwMjEgMTY6MTM6NTAgKzA0MDAKLVN1
YmplY3Q6IFtQQVRDSF0gZmR0ZHVtcDogZml4IC1XZXJyb3I9aW50LXRvLXBvaW50ZXItY2FzdAot
TUlNRS1WZXJzaW9uOiAxLjAKLUNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYt
OAotQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAotCi1XaXRoIG1pbmd3NjQtZ2NjLCB0
aGUgY29tcGlsZXIgY29tcGxhaW5zIHdpdGggdmFyaW91cyB3YXJuaW5nczoKLWVycm9yOiBjYXN0
IGZyb20gcG9pbnRlciB0byBpbnRlZ2VyIG9mIGRpZmZlcmVudCBzaXplIFstV2Vycm9yPXBvaW50
ZXItdG8taW50LWNhc3RdCi0KLVNpZ25lZC1vZmYtYnk6IE1hcmMtQW5kcsOpIEx1cmVhdSA8bWFy
Y2FuZHJlLmx1cmVhdUByZWRoYXQuY29tPgotTWVzc2FnZS1JZDogPDIwMjEwODI1MTIxMzUwLjIx
MzU1MS0xLW1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbT4KLUFja2VkLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgotU2lnbmVkLW9mZi1ieTogRGF2aWQgR2lic29uIDxkYXZpZEBn
aWJzb24uZHJvcGJlYXIuaWQuYXU+Ci0tLS0KLSBmZHRkdW1wLmMgfCAyICstCi0gMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9mZHRk
dW1wLmMgYi9mZHRkdW1wLmMKLWluZGV4IGQ5ZmIzNzQuLjQ4M2YzNjcgMTAwNjQ0Ci0tLS0gYS9m
ZHRkdW1wLmMKLSsrKyBiL2ZkdGR1bXAuYwotQEAgLTIxLDcgKzIxLDcgQEAKLSAjZGVmaW5lIE1B
WF9WRVJTSU9OIDE3Ci0gCi0gI2RlZmluZSBBTElHTih4LCBhKQkoKCh4KSArICgoYSkgLSAxKSkg
JiB+KChhKSAtIDEpKQotLSNkZWZpbmUgUEFMSUdOKHAsIGEpCSgodm9pZCAqKShBTElHTigodW5z
aWduZWQgbG9uZykocCksIChhKSkpKQotKyNkZWZpbmUgUEFMSUdOKHAsIGEpCSgodm9pZCAqKShB
TElHTigodWludHB0cl90KShwKSwgKGEpKSkpCi0gI2RlZmluZSBHRVRfQ0VMTChwKQkocCArPSA0
LCAqKChjb25zdCBmZHQzMl90ICopKHAtNCkpKQotIAotIHN0YXRpYyBjb25zdCBjaGFyICp0YWdu
YW1lKHVpbnQzMl90IHRhZykKLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1rZXJuZWwvZHRjL2R0Y18xLjYuMS5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvZHRjL2R0Y18x
LjcuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMta2Vy
bmVsL2R0Yy9kdGNfMS42LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvZHRjL2R0
Y18xLjcuMC5iYgppbmRleCAyYTZhYzA4OWEzLi5hZDMwNTgzOTYwIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMta2VybmVsL2R0Yy9kdGNfMS42LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5l
bC9kdGMvZHRjXzEuNy4wLmJiCkBAIC03LDkgKzcsOCBAQCBMSUNFTlNFID0gIkdQTC0yLjAtb25s
eSB8IEJTRC0yLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0dQTDttZDU9YjIz
NGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMgXAogICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vbGliZmR0L2xpYmZkdC5oO2JlZ2lubGluZT00O2VuZGxpbmU9NzttZDU9MDViYjM1N2NmYjc1
Y2FlN2QyYjAxZDJlZThkNzY0MDciCiAKLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS91dGlscy9kdGMvZHRjLmdpdDticmFuY2g9bWFzdGVyIFwKLSAgICAgICAgICAgZmls
ZTovLzAwMDEtZmR0ZHVtcC1maXgtV2Vycm9yLWludC10by1wb2ludGVyLWNhc3QucGF0Y2giCi1T
UkNSRVYgPSAiYjY5MTBiZWMxMTYxNDk4MGEyMWU0NmZiY2NjMzU5MzRiNjcxYmQ4MSIKK1NSQ19V
UkkgPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS91dGlscy9kdGMvZHRjLmdpdDticmFu
Y2g9bWFpbiIKK1NSQ1JFViA9ICIwMzlhOTk0MTRlNzc4MzMyZDhmOWMwNGNiZDMwNzJlMWRjYzYy
Nzk4IgogCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+XGQrKFwuXGQr
KSspIgogCi0tIAoyLjM3LjMKCg==

--===============5558522790951276051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/dtc/dtc-staticdev: FILELIST: added "/usr/lib/libfdt.a"
packages/core2-32-poky-linux/dtc/dtc-staticdev: PKGSIZE changed from 0 to 144876 (+100%)
Changes to packages/core2-32-poky-linux/dtc (sysroot):
  /usr/lib/libfdt.a was added

--===============5558522790951276051==--

