Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B18AC3A5A3
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:19 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web09.24568.1665871395989456616
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HCMuCfdN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010183ddac39d5-6e00cac1-66a2-40dc-a116-f7585a1cc1ff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2YlkQHTMeb49fMJ3zacprmrfrGZr12wKfv7b5fIM2s4=;
	b=HCMuCfdNvLQbaHKuffyIJsvHFY+r8TT7iIPwOhYyGgn086G7B5ttc0HgPhNm/74Y
	FI16ngfk67HTLdrkr/hIgEAqhLkwY21dLXGsRH734Ssh/B9GfvpBjssKUFGZ2dJPQS+
	vFB2i0BLvwJZuUXbvgmOc1vHKv1xFFhhYHRvdihs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2YlkQHTMeb49fMJ3zacprmrfrGZr12wKfv7b5fIM2s4=;
	b=QpWK8M+zi+EIcYi1X1jSykfSi95O+PJJA7BW2XzHEg5Py7HLbp59G2o7lPwAs3Gd
	WJi2rZ786tVqAvkh9GWtA/oNvTlYlYZaa57xrpbVdvjngPmW3DddavrCoGjac8cKGmp
	LRGC8OWg9RXw/SfmOIlyCEOsPa1myq5gxnsOXLRE=
Content-Type: multipart/mixed; boundary="===============6382599883049611354=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsdl2: upgrading to 2.24.1 SUCCEEDED
Message-ID: <01010183ddac39d5-6e00cac1-66a2-40dc-a116-f7585a1cc1ff-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171835

--===============6382599883049611354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsdl2* to *2.24.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsdl2-upgrade-2.24.0-2.24.1.patch
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
--===============6382599883049611354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libsdl2/libsdl2: FILELIST: removed "/usr/lib/libSDL2-2.0.so.0.2400.0", added "/usr/lib/libSDL2-2.0.so.0.2400.1"
Changes to packages/core2-32-poky-linux/libsdl2 (sysroot):
  /usr/lib/libSDL2-2.0.so.0 changed symlink target from libSDL2-2.0.so.0.2400.0 to libSDL2-2.0.so.0.2400.1
  /usr/lib/libSDL2-2.0.so.0.2400.0 moved to /usr/lib/libSDL2-2.0.so.0.2400.1

--===============6382599883049611354==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsdl2-upgrade-2.24.0-2.24.1.patch"

RnJvbSAxZjg2YjZhMzQ5Nzg0NjNhMWE1ZGRiNWU0M2NkOTE4YTgwNjExNzIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTU6NTI6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzZGwyOiB1cGdyYWRlIDIuMjQuMCAtPiAyLjI0LjEKCi0tLQogLi4uc2FibGUtbGlidW53aW5k
LWluLW5hdGl2ZS1PRS1idWlsZHMtYnktbm90LWxvb2tpbmcucGF0Y2ggfCA2ICsrKy0tLQogLi4u
L2xpYnNkbDIve2xpYnNkbDJfMi4yNC4wLmJiID0+IGxpYnNkbDJfMi4yNC4xLmJifSAgICAgICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlic2RsMi97bGlic2RsMl8yLjI0LjAuYmIg
PT4gbGlic2RsMl8yLjI0LjEuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL2xpYnNkbDIvbGlic2RsMi8wMDAxLURpc2FibGUtbGlidW53aW5kLWluLW5hdGl2ZS1P
RS1idWlsZHMtYnktbm90LWxvb2tpbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGli
c2RsMi9saWJzZGwyLzAwMDEtRGlzYWJsZS1saWJ1bndpbmQtaW4tbmF0aXZlLU9FLWJ1aWxkcy1i
eS1ub3QtbG9va2luZy5wYXRjaAppbmRleCA1N2JjNTIyMzkzLi40ZGIyMGQ0OTUyIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlic2RsMi9saWJzZGwyLzAwMDEtRGlzYWJsZS1s
aWJ1bndpbmQtaW4tbmF0aXZlLU9FLWJ1aWxkcy1ieS1ub3QtbG9va2luZy5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlic2RsMi9saWJzZGwyLzAwMDEtRGlzYWJsZS1saWJ1bndp
bmQtaW4tbmF0aXZlLU9FLWJ1aWxkcy1ieS1ub3QtbG9va2luZy5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gMDIzNGM1NDZkODYxNzRmYWZlOWFiMjgwY2Y1ZjQ0ZGU1MGI3MzY3NiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDRjMDU0ZjkwODRlZTI3MGU2Mjk5OGE1Nzg5OGJlNzll
M2FlYThkYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENhcmxvcyBSYWZhZWwgR2lh
bmkgPGNyZzc0NzVAbWFpbGJveC5vcmc+CiBEYXRlOiBGcmksIDE4IE1hciAyMDIyIDEyOjA2OjIz
ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIERpc2FibGUgbGlidW53aW5kIGluIG5hdGl2ZSBPRSBi
dWlsZHMgYnkgbm90IGxvb2tpbmcgZm9yCkBAIC0yMiwxMCArMjIsMTAgQEAgVXBzdHJlYW0tU3Rh
dHVzOiBJbmFwcHJvcHJpYXRlIFtPRSBzcGVjaWZpY10KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0IGIv
Q01ha2VMaXN0cy50eHQKLWluZGV4IDY0NDcxNWEuLmJiZjJlMjggMTAwNjQ0CitpbmRleCA3NjE3
MjA1Li5kOWIxNTIyIDEwMDY0NAogLS0tIGEvQ01ha2VMaXN0cy50eHQKICsrKyBiL0NNYWtlTGlz
dHMudHh0Ci1AQCAtODY5LDcgKzg2OSw3IEBAIGlmKFNETF9MSUJDKQorQEAgLTk1Miw3ICs5NTIs
NyBAQCBpZihTRExfTElCQykKICAgICAgY2hlY2tfaW5jbHVkZV9maWxlKHN5cy90eXBlcy5oIEhB
VkVfU1lTX1RZUEVTX0gpCiAgICAgIGZvcmVhY2goX0hFQURFUgogICAgICAgICAgICAgIHN0ZGlv
Lmggc3RkbGliLmggc3RkZGVmLmggc3RkYXJnLmggbWFsbG9jLmggbWVtb3J5Lmggc3RyaW5nLmgg
bGltaXRzLmggZmxvYXQuaApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnNk
bDIvbGlic2RsMl8yLjI0LjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlic2RsMi9saWJz
ZGwyXzIuMjQuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvbGlic2RsMi9saWJzZGwyXzIuMjQuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL2xpYnNkbDIvbGlic2RsMl8yLjI0LjEuYmIKaW5kZXggZDVjYmY3M2RmMi4u
NmJmZjBiOGZlMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnNkbDIvbGli
c2RsMl8yLjI0LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnNkbDIvbGlic2Rs
Ml8yLjI0LjEuYmIKQEAgLTI3LDcgKzI3LDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZl
ID0gIiBmaWxlOi8vMDAwMS1EaXNhYmxlLWxpYnVud2luZC1pbi1uYXRpdmUtT0UtYnVpbGQKIAog
UyA9ICIke1dPUktESVJ9L1NETDItJHtQVn0iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5MWU0
YzM0YjE3NjhmOTJkMzk5YjA3OGUxNzE0NDhjNmFmMThjYWZkYTc0Mzk4N2VkMjA2NGEyODk1NGQ2
ZDk3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImJjMTIxNTg4YjExMDUwNjU1OThjZTM4MDc4MDI2
YTQxNGMyOGVhOTVlNjZlZDJhZGFiNGM0NGQ4MGIzMDllMWIiCiAKIGluaGVyaXQgY21ha2UgbGli
X3BhY2thZ2UgYmluY29uZmlnLWRpc2FibGVkIHBrZ2NvbmZpZyB1cHN0cmVhbS12ZXJzaW9uLWlz
LWV2ZW4KIAotLSAKMi4zMS4xCgo=

--===============6382599883049611354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libsdl2: PV changed from "2.24.0" to "2.24.1"
packages/core2-32-poky-linux/libsdl2: PKGV changed from 2.24.0 [default] to 2.24.1 [default]
packages/core2-32-poky-linux/libsdl2: SRC_URI changed from "http://www.libsdl.org/release/SDL2-2.24.0.tar.gz" to "http://www.libsdl.org/release/SDL2-2.24.1.tar.gz"
packages/core2-32-poky-linux/libsdl2/libsdl2-bin: PV changed from "2.24.0" to "2.24.1"
packages/core2-32-poky-linux/libsdl2/libsdl2-bin: PKGV changed from 2.24.0 [default] to 2.24.1 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-dbg: PKGSIZE changed from 5772452 to 5775452 (+0%)
packages/core2-32-poky-linux/libsdl2/libsdl2-dbg: FILELIST: removed "/usr/lib/.debug/libSDL2-2.0.so.0.2400.0", added "/usr/lib/.debug/libSDL2-2.0.so.0.2400.1"
packages/core2-32-poky-linux/libsdl2/libsdl2-dbg: PV changed from "2.24.0" to "2.24.1"
packages/core2-32-poky-linux/libsdl2/libsdl2-dbg: PKGV changed from 2.24.0 [default] to 2.24.1 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-dev: PKGSIZE changed from 2128030 to 2128057 (+0%)
packages/core2-32-poky-linux/libsdl2/libsdl2-dev: PV changed from "2.24.0" to "2.24.1"
packages/core2-32-poky-linux/libsdl2/libsdl2-dev: PKGV changed from 2.24.0 [default] to 2.24.1 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-doc: PV changed from "2.24.0" to "2.24.1"
packages/core2-32-poky-linux/libsdl2/libsdl2-doc: PKGV changed from 2.24.0 [default] to 2.24.1 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-locale: PV changed from "2.24.0" to "2.24.1"
packages/core2-32-poky-linux/libsdl2/libsdl2-locale: PKGV changed from 2.24.0 [default] to 2.24.1 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-src: PKGSIZE changed from 9213275 to 9222376 (+0%)
packages/core2-32-poky-linux/libsdl2/libsdl2-src: PV changed from "2.24.0" to "2.24.1"
packages/core2-32-poky-linux/libsdl2/libsdl2-src: PKGV changed from 2.24.0 [default] to 2.24.1 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-staticdev: PKGSIZE changed from 8515878 to 8517800 (+0%)
packages/core2-32-poky-linux/libsdl2/libsdl2-staticdev: PV changed from "2.24.0" to "2.24.1"
packages/core2-32-poky-linux/libsdl2/libsdl2-staticdev: PKGV changed from 2.24.0 [default] to 2.24.1 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2: PKGSIZE changed from 1898119 to 1894023 (-0%)
packages/core2-32-poky-linux/libsdl2/libsdl2: FILELIST: removed "/usr/lib/libSDL2-2.0.so.0.2400.0", added "/usr/lib/libSDL2-2.0.so.0.2400.1"
packages/core2-32-poky-linux/libsdl2/libsdl2: PV changed from "2.24.0" to "2.24.1"
packages/core2-32-poky-linux/libsdl2/libsdl2: PKGV changed from 2.24.0 [default] to 2.24.1 [default]
Changes to packages/core2-32-poky-linux/libsdl2 (sysroot):
  /usr/lib/libSDL2-2.0.so.0 changed symlink target from libSDL2-2.0.so.0.2400.0 to libSDL2-2.0.so.0.2400.1
  /usr/lib/libSDL2-2.0.so.0.2400.0 moved to /usr/lib/libSDL2-2.0.so.0.2400.1

--===============6382599883049611354==--

