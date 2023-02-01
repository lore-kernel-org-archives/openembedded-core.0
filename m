Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE64C64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:23 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.30353.1675272854130532536
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iJ+b0XxK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101860e0b1652-95381159-d6e8-40fd-92a0-d33e053c16bc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AMN+NiI/8QraMifpoS2s+xKD2qSA4RC5E1blWPsQ69E=;
	b=iJ+b0XxK+bdb4Eo5y3zpW7VYxe3AKJ3FWUS3PV9Beit37XZlIzP52RCeGr/Dz774
	BDhOEKdA4zqCNTeBSZVPGI2inOPrghgE7/lG/qqTGAuWJYMpK0sklU6VR0W+z9O2oYg
	FrAH8RqauqZMy7WYQ7Vq1ox8P+6ltzPvewCFl0Mk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AMN+NiI/8QraMifpoS2s+xKD2qSA4RC5E1blWPsQ69E=;
	b=clodb4d5pBFtviNKVVWej9zZN+4xFg8nAZtgiiDya8/P44jthOCuGM/mWL9BxziE
	llr2cflezb4Dtjwq578PHvNtt/pfyqAVYwFPDza9+A47PP8Qjw0dg/VrYsRNAjTyv9K
	6MCtzNPZ5r1SXyRcnNEFXdlDKxmNHOhImPi/fQjM=
Content-Type: multipart/mixed; boundary="===============4024550142955141601=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ncurses: upgrading to 6.4 SUCCEEDED
Message-ID: <010101860e0b1652-95381159-d6e8-40fd-92a0-d33e053c16bc-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176576

--===============4024550142955141601==
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
--===============4024550142955141601==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ncurses-upgrade-6.3-20220423-6.4.patch"

RnJvbSBmMjEyZTBlNDhiZTRjMTU2YmZiOTEwYTAzMDJlOWUwYjM4NzI5NGI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAwNzoyNDowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5j
dXJzZXM6IHVwZ3JhZGUgNi4zKzIwMjIwNDIzIC0+IDYuNAoKLS0tCiAuLi4vbmN1cnNlcy9maWxl
cy9leGl0X3Byb3RvdHlwZS5wYXRjaCAgICAgICAgIHwgMTggKysrKysrKysrKysrKystLS0tCiAu
Li57bmN1cnNlc182LjMrMjAyMjA0MjMuYmIgPT4gbmN1cnNlc182LjQuYmJ9IHwgIDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL3tuY3Vyc2VzXzYuMysyMDIyMDQyMy5iYiA9PiBuY3Vy
c2VzXzYuNC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2Vz
L2ZpbGVzL2V4aXRfcHJvdG90eXBlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9m
aWxlcy9leGl0X3Byb3RvdHlwZS5wYXRjaAppbmRleCA3OTE0MjFhMzM4Li5mZDk2MTUxMmUwIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL2ZpbGVzL2V4aXRfcHJvdG90eXBl
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMvZmlsZXMvZXhpdF9wcm90b3R5
cGUucGF0Y2gKQEAgLTEsMTggKzEsMjggQEAKLUFkZCBuZWVkZWQgaGVhZGVycyBmb3IgaW5jbHVk
aW5nIG1ic3RhdGVfdCBhbmQgZXhpdCgpCitGcm9tIDRhNzY5YTQ0MWQ3ZTU3YTIzMDE3YzMwMzdj
ZGUzZTUzZmI5ZjM1ZmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPgorRGF0ZTogVHVlLCAzMCBBdWcgMjAyMiAxNTo1ODozMiAtMDcw
MAorU3ViamVjdDogW1BBVENIXSBBZGQgbmVlZGVkIGhlYWRlcnMgZm9yIGluY2x1ZGluZyBtYnN0
YXRlX3QgYW5kIGV4aXQoKQogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW1JlY29u
ZmlndXJlIHdpbGwgc29sdmUgaXRdCiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPgorCistLS0KKyBjb25maWd1cmUgfCAyICsrCisgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQorCitkaWZmIC0tZ2l0IGEvY29uZmlndXJlIGIvY29uZmlndXJlCitpbmRl
eCBmMzc3ZjU1MS4uMTYzZjg4OTkgMTAwNzU1CiAtLS0gYS9jb25maWd1cmUKICsrKyBiL2NvbmZp
Z3VyZQotQEAgLTM0MjIsNiArMzQyMiw3IEBAIHJtIC1mICJjb25mdGVzdC4kYWNfb2JqZXh0IiAi
Y29uZnRlc3QuJGEKK0BAIC0zNDIzLDYgKzM0MjMsNyBAQCBybSAtZiAiY29uZnRlc3QuJGFjX29i
amV4dCIgImNvbmZ0ZXN0LiRhY19leHQiCiAgICBjYXQgPiJjb25mdGVzdC4kYWNfZXh0IiA8PF9B
Q0VPRgotICNsaW5lIDM0MjMgImNvbmZpZ3VyZSIKKyAjbGluZSAzNDI0ICJjb25maWd1cmUiCiAg
I2luY2x1ZGUgImNvbmZkZWZzLmgiCiArI2luY2x1ZGUgPHN0ZGxpYi5oPgogICRhY19kZWNsYXJh
dGlvbgogIGludAogIG1haW4gKHZvaWQpCi1AQCAtMTI5OTcsNiArMTI5OTgsNyBAQCBjYXQgPiJj
b25mdGVzdC4kYWNfZXh0IiA8PF9BQ0VPRgorQEAgLTEzMTExLDYgKzEzMTEyLDcgQEAgY2F0ID4i
Y29uZnRlc3QuJGFjX2V4dCIgPDxfQUNFT0YKICAjaW5jbHVkZSA8c3RkbGliLmg+CiAgI2luY2x1
ZGUgPHN0ZGFyZy5oPgogICNpbmNsdWRlIDxzdGRpby5oPgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvcmUvbmN1cnNlcy9uY3Vyc2VzXzYuMysyMDIyMDQyMy5iYiBiL21ldGEvcmVjaXBlcy1j
b3JlL25jdXJzZXMvbmN1cnNlc182LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9uY3Vyc2VzXzYuMysyMDIyMDQyMy5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9uY3Vyc2VzXzYuNC5iYgppbmRleCBmYjhj
MTE1ODJiLi4yMGZkMmRhZGRhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2Vz
L25jdXJzZXNfNi4zKzIwMjIwNDIzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMv
bmN1cnNlc182LjQuYmIKQEAgLTYsNyArNiw3IEBAIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLXRp
Yy1oYW5nLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2V4aXRfcHJvdG90eXBlLnBhdGNoIFwK
ICAgICAgICAgICAgIgogIyBjb21taXQgaWQgY29ycmVzcG9uZHMgdG8gdGhlIHJldmlzaW9uIGlu
IHBhY2thZ2UgdmVyc2lvbgotU1JDUkVWID0gIjIwZGIxZmI0MWVjOTFjZDhhMWY1MjhlNzcwMzYy
MDkyYzU0MDMzNzgiCitTUkNSRVYgPSAiNzliOTA3MWYyYmUyMGEyNGM3YmUwMzE2NTVhNTYzOGY2
MDMyZjI5ZiIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiBFWFRSQV9PRUNPTkYgKz0gIi0td2l0aC1h
YmktdmVyc2lvbj01IgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+XGQr
KFwuXGQrKSspJCIKLS0gCjIuMzcuMwoK

--===============4024550142955141601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ncurses: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-dbg: PKGSIZE changed from 3427732 to 3438232 (+0%)
packages/core2-32-poky-linux/ncurses/ncurses-dbg: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-dbg: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-dev: PKGSIZE changed from 357139 to 357799 (+0%)
packages/core2-32-poky-linux/ncurses/ncurses-dev: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-dev: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-doc: PKGSIZE changed from 1124197 to 1128722 (+0%)
packages/core2-32-poky-linux/ncurses/ncurses-doc: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
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
packages/core2-32-poky-linux/ncurses/ncurses-libtinfo: PKGSIZE changed from 157687 to 161783 (+3%)
packages/core2-32-poky-linux/ncurses/ncurses-libtinfo: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-libtinfo: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-locale: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-locale: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-src: PKGSIZE changed from 3274066 to 3290046 (+0%)
packages/core2-32-poky-linux/ncurses/ncurses-src: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-src: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-staticdev: PKGSIZE changed from 798580 to 798412 (-0%)
packages/core2-32-poky-linux/ncurses/ncurses-staticdev: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-staticdev: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-terminfo-base: PKGSIZE changed from 22351 to 22561 (+1%)
packages/core2-32-poky-linux/ncurses/ncurses-terminfo-base: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-terminfo-base: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-terminfo: PKGSIZE changed from 2101992 to 2132814 (+1%)
packages/core2-32-poky-linux/ncurses/ncurses-terminfo: FILELIST: removed "/usr/share/terminfo/t/tt505-22", added "/usr/share/terminfo/x/xterm+alt47 /usr/share/terminfo/x/xterm+focus /usr/share/terminfo/a/ansi+cpr /usr/share/terminfo/n/nsterm-build440 /usr/share/terminfo/n/no+brackets /usr/share/terminfo/x/xterm-p371 /usr/share/terminfo/s/screen-base /usr/share/terminfo/a/apollo+vt132 /usr/share/terminfo/b/bracketed+paste /usr/share/terminfo/d/decid+cpr /usr/share/terminfo/a/att505-22"
packages/core2-32-poky-linux/ncurses/ncurses-terminfo: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-terminfo: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses-tools: PKGSIZE changed from 203766 to 207862 (+2%)
packages/core2-32-poky-linux/ncurses/ncurses-tools: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses-tools: PV changed from "6.3+20220423" to "6.4"
packages/core2-32-poky-linux/ncurses/ncurses: PKGV changed from 6.3+20220423 [default] to 6.4 [default]
packages/core2-32-poky-linux/ncurses/ncurses: PV changed from "6.3+20220423" to "6.4"

--===============4024550142955141601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/ncurses/ncurses-terminfo: FILELIST: removed "/usr/share/terminfo/t/tt505-22", added "/usr/share/terminfo/n/nsterm-build440 /usr/share/terminfo/b/bracketed+paste /usr/share/terminfo/s/screen-base /usr/share/terminfo/d/decid+cpr /usr/share/terminfo/a/ansi+cpr /usr/share/terminfo/a/att505-22 /usr/share/terminfo/a/apollo+vt132 /usr/share/terminfo/n/no+brackets /usr/share/terminfo/x/xterm+focus /usr/share/terminfo/x/xterm-p371 /usr/share/terminfo/x/xterm+alt47"

--===============4024550142955141601==--

