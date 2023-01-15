Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DCBC77B62
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:32 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.145824.1673805742953582716
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UWx6xWhU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010185b698bfce-c54ee0cc-033d-47ae-991e-6a3b2771aa4f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=95/W25QNYusjW3pxkR5UknVaoacBEe7BstzqdTFC+aI=;
	b=UWx6xWhUtXvCcR+UXM7TQSdNsqK7O1Ltt1AyCVDat6Yh113bc+/x93p1/n6DIj0a
	aZ4B67bOAeZ+1MAUV4nagWB54YcsBdejC4HsAfnZf1v2sEdCgBFiNvxlv4y/1pG6xTd
	VuzNe1tout8Fx/otoJbLFNwC1PTo3bu+oz19JCOY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=95/W25QNYusjW3pxkR5UknVaoacBEe7BstzqdTFC+aI=;
	b=IDzee8054jy03dndh2p2TCPKt6s8ej3U3qnBy2doqa6v/tVaQhjv3OIvdYbWzPSs
	BArlBIGEmTylNSyxS2n7gP0MTomgDG4r2IMpJ4rvj8Xv/nu00EpbPSkOfMS9oRmyprR
	V3Po2cuaznj2x3XPkI5U3qNXfSkDK4bwC2FBWsvU=
Content-Type: multipart/mixed; boundary="===============3325971301703982438=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ncurses: upgrading to 6.4 SUCCEEDED
Message-ID: <01010185b698bfce-c54ee0cc-033d-47ae-991e-6a3b2771aa4f-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175891

--===============3325971301703982438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ncurses* to *6.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ncurses-upgrade-6.3-20220423-6.4.patch
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
--===============3325971301703982438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ncurses: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-dbg: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-dbg: PKGSIZE changed from 3427536 to 3438048 (+0%)
packages/core2-32-poky-linux/ncurses/ncurses-dbg: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-dev: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-dev: PKGSIZE changed from 357139 to 357799 (+0%)
packages/core2-32-poky-linux/ncurses/ncurses-dev: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-doc: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-doc: PKGSIZE changed from 1124197 to 1128722 (+0%)
packages/core2-32-poky-linux/ncurses/ncurses-doc: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-libform: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-libform: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-libformw: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-libformw: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-libmenu: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-libmenu: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-libmenuw: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-libmenuw: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-libncurses: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-libncurses: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-libncursesw: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-libncursesw: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-libpanel: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-libpanel: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-libpanelw: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-libpanelw: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-libtic: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-libtic: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-libticw: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-libticw: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-libtinfo: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-libtinfo: PKGSIZE changed from 157687 to 161783 (+3%)
packages/core2-32-poky-linux/ncurses/ncurses-libtinfo: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-locale: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-locale: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-src: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-src: PKGSIZE changed from 3274066 to 3290046 (+0%)
packages/core2-32-poky-linux/ncurses/ncurses-src: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-staticdev: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-staticdev: PKGSIZE changed from 798580 to 798412 (-0%)
packages/core2-32-poky-linux/ncurses/ncurses-staticdev: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-terminfo-base: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-terminfo-base: PKGSIZE changed from 22351 to 22561 (+1%)
packages/core2-32-poky-linux/ncurses/ncurses-terminfo-base: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-terminfo: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-terminfo: PKGSIZE changed from 2101992 to 2132814 (+1%)
packages/core2-32-poky-linux/ncurses/ncurses-terminfo: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-terminfo: FILELIST: removed "/usr/share/terminfo/t/tt505-22", added "/usr/share/terminfo/x/xterm-p371 /usr/share/terminfo/d/decid+cpr /usr/share/terminfo/n/no+brackets /usr/share/terminfo/a/ansi+cpr /usr/share/terminfo/x/xterm+alt47 /usr/share/terminfo/a/att505-22 /usr/share/terminfo/a/apollo+vt132 /usr/share/terminfo/x/xterm+focus /usr/share/terminfo/b/bracketed+paste /usr/share/terminfo/n/nsterm-build440 /usr/share/terminfo/s/screen-base"
packages/core2-32-poky-linux/ncurses/ncurses-tools: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-tools: PKGSIZE changed from 203766 to 207862 (+2%)
packages/core2-32-poky-linux/ncurses/ncurses-tools: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses: PV changed from "6.3+20220423" to "6.4"

--===============3325971301703982438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/ncurses/ncurses-terminfo: FILELIST: removed "/usr/share/terminfo/t/tt505-22", added "/usr/share/terminfo/x/xterm-p371 /usr/share/terminfo/n/nsterm-build440 /usr/share/terminfo/n/no+brackets /usr/share/terminfo/a/ansi+cpr /usr/share/terminfo/s/screen-base /usr/share/terminfo/d/decid+cpr /usr/share/terminfo/b/bracketed+paste /usr/share/terminfo/a/apollo+vt132 /usr/share/terminfo/x/xterm+alt47 /usr/share/terminfo/x/xterm+focus /usr/share/terminfo/a/att505-22"

--===============3325971301703982438==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ncurses-upgrade-6.3-20220423-6.4.patch"

RnJvbSA5OWRiMDQ4ODA3NjI0MmEwNDFkYTQ4YmMwZTJlYjFiNWUwMjNiOTExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMDY6NTg6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
Y3Vyc2VzOiB1cGdyYWRlIDYuMysyMDIyMDQyMyAtPiA2LjQKCi0tLQogLi4uL25jdXJzZXMvZmls
ZXMvZXhpdF9wcm90b3R5cGUucGF0Y2ggICAgICAgICB8IDE4ICsrKysrKysrKysrKysrLS0tLQog
Li4ue25jdXJzZXNfNi4zKzIwMjIwNDIzLmJiID0+IG5jdXJzZXNfNi40LmJifSB8ICAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy97bmN1cnNlc182LjMrMjAyMjA0MjMuYmIgPT4gbmN1
cnNlc182LjQuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNl
cy9maWxlcy9leGl0X3Byb3RvdHlwZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMv
ZmlsZXMvZXhpdF9wcm90b3R5cGUucGF0Y2gKaW5kZXggNzkxNDIxYTMzOC4uZTViNTZlNTk4OCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9maWxlcy9leGl0X3Byb3RvdHlw
ZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL2ZpbGVzL2V4aXRfcHJvdG90
eXBlLnBhdGNoCkBAIC0xLDE4ICsxLDI4IEBACi1BZGQgbmVlZGVkIGhlYWRlcnMgZm9yIGluY2x1
ZGluZyBtYnN0YXRlX3QgYW5kIGV4aXQoKQorRnJvbSA0YmMyZGU3ZDgwOTI1ZDc0MzY5YjY1MDRl
YjAwNTg1YTZjZWQwN2JkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4KK0RhdGU6IFR1ZSwgMzAgQXVnIDIwMjIgMTU6NTg6MzIgLTA3
MDAKK1N1YmplY3Q6IFtQQVRDSF0gQWRkIG5lZWRlZCBoZWFkZXJzIGZvciBpbmNsdWRpbmcgbWJz
dGF0ZV90IGFuZCBleGl0KCkKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtSZWNv
bmZpZ3VyZSB3aWxsIHNvbHZlIGl0XQogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4KKworLS0tCisgY29uZmlndXJlIHwgMiArKworIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKKworZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZSBiL2NvbmZpZ3VyZQoraW5k
ZXggZjM3N2Y1NTEuLjE2M2Y4ODk5IDEwMDc1NQogLS0tIGEvY29uZmlndXJlCiArKysgYi9jb25m
aWd1cmUKLUBAIC0zNDIyLDYgKzM0MjIsNyBAQCBybSAtZiAiY29uZnRlc3QuJGFjX29iamV4dCIg
ImNvbmZ0ZXN0LiRhCitAQCAtMzQyMyw2ICszNDIzLDcgQEAgcm0gLWYgImNvbmZ0ZXN0LiRhY19v
YmpleHQiICJjb25mdGVzdC4kYWNfZXh0IgogICAgY2F0ID4iY29uZnRlc3QuJGFjX2V4dCIgPDxf
QUNFT0YKLSAjbGluZSAzNDIzICJjb25maWd1cmUiCisgI2xpbmUgMzQyNCAiY29uZmlndXJlIgog
ICNpbmNsdWRlICJjb25mZGVmcy5oIgogKyNpbmNsdWRlIDxzdGRsaWIuaD4KICAkYWNfZGVjbGFy
YXRpb24KICBpbnQKICBtYWluICh2b2lkKQotQEAgLTEyOTk3LDYgKzEyOTk4LDcgQEAgY2F0ID4i
Y29uZnRlc3QuJGFjX2V4dCIgPDxfQUNFT0YKK0BAIC0xMzExMSw2ICsxMzExMiw3IEBAIGNhdCA+
ImNvbmZ0ZXN0LiRhY19leHQiIDw8X0FDRU9GCiAgI2luY2x1ZGUgPHN0ZGxpYi5oPgogICNpbmNs
dWRlIDxzdGRhcmcuaD4KICAjaW5jbHVkZSA8c3RkaW8uaD4KZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL25jdXJzZXMvbmN1cnNlc182LjMrMjAyMjA0MjMuYmIgYi9tZXRhL3JlY2lwZXMt
Y29yZS9uY3Vyc2VzL25jdXJzZXNfNi40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMvbmN1cnNlc182LjMrMjAyMjA0MjMuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMvbmN1cnNlc182LjQuYmIKaW5kZXggZmI4
YzExNTgyYi4uMjBmZDJkYWRkYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNl
cy9uY3Vyc2VzXzYuMysyMDIyMDQyMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2Vz
L25jdXJzZXNfNi40LmJiCkBAIC02LDcgKzYsNyBAQCBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS10
aWMtaGFuZy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9leGl0X3Byb3RvdHlwZS5wYXRjaCBc
CiAgICAgICAgICAgICIKICMgY29tbWl0IGlkIGNvcnJlc3BvbmRzIHRvIHRoZSByZXZpc2lvbiBp
biBwYWNrYWdlIHZlcnNpb24KLVNSQ1JFViA9ICIyMGRiMWZiNDFlYzkxY2Q4YTFmNTI4ZTc3MDM2
MjA5MmM1NDAzMzc4IgorU1JDUkVWID0gIjc5YjkwNzFmMmJlMjBhMjRjN2JlMDMxNjU1YTU2Mzhm
NjAzMmYyOWYiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogRVhUUkFfT0VDT05GICs9ICItLXdpdGgt
YWJpLXZlcnNpb249NSIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPlxk
KyhcLlxkKykrKSQiCi0tIAoyLjM3LjMKCg==

--===============3325971301703982438==--

