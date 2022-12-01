Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E7CC636F9
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.46832.1669908628481138033
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SE2Exv7r;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010184ce4f8111-6e7c40ce-8ad1-435d-86d5-d0a445a5b030-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bIFiOH9UnQzPZ4k5LFBvAaQINb3F4oIA7CPrexnXkEE=;
	b=SE2Exv7rbAfxxwh6cDpfBX5NURfC1xACfqKTtnDCmx3bAx1CAl/OBnUSUWCSl4Rp
	6j8Zz2kAONm3pIG4hjlmoyqSU+XudxZUfoEBzUGCkYGE0vm6FIsXb+xFVr+VnzB/JaJ
	pUXCK0MPL4ClzSDHKKu+bnJFTywfilfgjOGlBEFU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bIFiOH9UnQzPZ4k5LFBvAaQINb3F4oIA7CPrexnXkEE=;
	b=ZbZYOY6TPgroidVA9eVUkvLJ4YnfxDNeDk6QU6D8RsaU0e2EAehIuPEYq3dyicLw
	Dr2fbDh7ewfooCFlSpSo0+WUWEoit81vhW77Z1kUgMOBNFDgDldYkKMgZbXIyKB/OF+
	7BhaZFD6gctBJ0fwAtqGxGIwOiO1l+Rpz0GdLMlI=
Content-Type: multipart/mixed; boundary="===============2223702183426033052=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-protocols: upgrading to 1.31 SUCCEEDED
Message-ID: <01010184ce4f8111-6e7c40ce-8ad1-435d-86d5-d0a445a5b030-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174182

--===============2223702183426033052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wayland-protocols* to *1.31* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wayland-protocols-upgrade-1.28-1.31.patch
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
--===============2223702183426033052==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-protocols-upgrade-1.28-1.31.patch"

RnJvbSBiNTE0NWVhMmZmNDIxNjUxZTNiNWM1ZDdjMDQ0NDlmZWMzMzc4OGE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAxMjo1MTowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdh
eWxhbmQtcHJvdG9jb2xzOiB1cGdyYWRlIDEuMjggLT4gMS4zMQoKLS0tCiAuLi4ve3dheWxhbmQt
cHJvdG9jb2xzXzEuMjguYmIgPT4gd2F5bGFuZC1wcm90b2NvbHNfMS4zMS5iYn0gICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC97d2F5bGFuZC1wcm90b2NvbHNfMS4yOC5iYiA9
PiB3YXlsYW5kLXByb3RvY29sc18xLjMxLmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzXzEuMjguYmIgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjMxLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dh
eWxhbmQtcHJvdG9jb2xzXzEuMjguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93
YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzXzEuMzEuYmIKaW5kZXggMjM2NmNjNzg1OS4uYWZkZTk5
NWZkNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC1w
cm90b2NvbHNfMS4yOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXls
YW5kLXByb3RvY29sc18xLjMxLmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PWM3YjEyYjY3MDJkYTM4Y2EwMjhhY2U1NGFhZTNkNDg0IFwK
ICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3N0YWJsZS9wcmVzZW50YXRpb24tdGltZS9wcmVz
ZW50YXRpb24tdGltZS54bWw7ZW5kbGluZT0yNjttZDU9NDY0NmNkN2Q5ZWRjOWZhNTVkYjk0MWYy
ZDNhN2RjNTMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3dh
eWxhbmQvd2F5bGFuZC1wcm90b2NvbHMvLS9yZWxlYXNlcy8ke1BWfS9kb3dubG9hZHMvd2F5bGFu
ZC1wcm90b2NvbHMtJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM3NjU5ZmI2
YmYxNDkwNWU2OGVmNjA1Zjg5OGRlNjBkMWMwNjZiZjY2ZGJlYTkyNzk4NTczZGRkZWMxNTM1YjYi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTA3ZmE3MjJlZDg3Njc2ZWMwMjBkODY3NzE0YmM5YTJm
MjRjNDY0ZGE3MzkxMmYzOTcwNmVlZWY1MjE5ZTIzOCIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0g
Imh0dHBzOi8vd2F5bGFuZC5mcmVlZGVza3RvcC5vcmcvcmVsZWFzZXMuaHRtbCIKIAotLSAKMi4z
MS4xCgo=

--===============2223702183426033052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wayland-protocols: PV changed from "1.28" to "1.31"
packages/all-poky-linux/wayland-protocols: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.28/downloads/wayland-protocols-1.28.tar.xz" to "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.31/downloads/wayland-protocols-1.31.tar.xz"
packages/all-poky-linux/wayland-protocols: PKGV changed from 1.28 [default] to 1.31 [default]
Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/share/wayland-protocols/staging/fractional-scale was added
  /usr/share/wayland-protocols/staging/fractional-scale/fractional-scale-v1.xml was added
  /usr/share/wayland-protocols/staging/tearing-control was added
  /usr/share/wayland-protocols/staging/tearing-control/tearing-control-v1.xml was added
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PV changed from "1.28" to "1.31"
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PKGV changed from 1.28 [default] to 1.31 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILELIST: added "/usr/share/wayland-protocols/staging/tearing-control/tearing-control-v1.xml /usr/share/wayland-protocols/staging/fractional-scale/fractional-scale-v1.xml"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PV changed from "1.28" to "1.31"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGSIZE changed from 497492 to 507848 (+2%)
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGV changed from 1.28 [default] to 1.31 [default]

--===============2223702183426033052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/share/wayland-protocols/staging/fractional-scale was added
  /usr/share/wayland-protocols/staging/fractional-scale/fractional-scale-v1.xml was added
  /usr/share/wayland-protocols/staging/tearing-control was added
  /usr/share/wayland-protocols/staging/tearing-control/tearing-control-v1.xml was added
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILELIST: added "/usr/share/wayland-protocols/staging/tearing-control/tearing-control-v1.xml /usr/share/wayland-protocols/staging/fractional-scale/fractional-scale-v1.xml"

--===============2223702183426033052==--

