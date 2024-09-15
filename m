Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0088C35FFB
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:17 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.115411.1726410842333116240
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZOLP124W;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0NJ0H8YS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010191f61ade5e-ff4ef6c9-7fa2-47f4-ace1-9c4431d8c77d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VaX4uPFdcQAFn+Ibl8myez7wQXOLhyEN/ZWK//BhHB4=;
	b=ZOLP124WGg85SM61NrOiVQEVcNOK3z6QtpV71/qkm+f8A0uDUvqbdacc9mnfTJ1w
	Sr0v1/HvD8QxoaRhFzBZR8iWhxywQIbUIKMedVYIK8Fr9mpMMvkEr+o/AJCiLCautwy
	wHCRooQCmtL7tT2BXSsxuGdEk2s0bxVlkNim8jtw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VaX4uPFdcQAFn+Ibl8myez7wQXOLhyEN/ZWK//BhHB4=;
	b=0NJ0H8YSp1tOyzSOEy1NtNXJz/gyA3HUs3TcaDFgEUuRbVhWWYbND4AcJP34z25e
	YRCzV0T4e4Va0pHgP1BEaDBpXkZFOKDm2sU45pOldjF2U6WFF86qnzwQ2NkaAc7U3fG
	6XAAhGLL4KIJSu4x2JaUbLU69VhpfYnhwXz+/cLI=
Content-Type: multipart/mixed; boundary="===============0219765358430410250=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.78.0 SUCCEEDED
Message-ID: <01010191f61ade5e-ff4ef6c9-7fa2-47f4-ace1-9c4431d8c77d-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204581

--===============0219765358430410250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICp2dGUqIHRvICowLjc4LjAqIGhhcyBTdWNjZWVkZWQuCgpOZXh0IHN0ZXBzOgogICAgLSBh
cHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLXZ0ZS11cGdyYWRlLTAuNzYuMy0wLjc4LjAucGF0
Y2gKICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8gdXBzdHJlYW0gcGF0Y2hlcyBhbmQgc3VtbWFy
aXplIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLAogICAgLSBjb21waWxlIGFuIGltYWdlIHRo
YXQgY29udGFpbnMgdGhlIHBhY2thZ2UKICAgIC0gcGVyZm9ybSBzb21lIGJhc2ljIHNhbml0eSB0
ZXN0cwogICAgLSBhbWVuZCB0aGUgcGF0Y2ggYW5kIHNpZ24gaXQgb2ZmOiBnaXQgY29tbWl0IC1z
IC0tcmVzZXQtYXV0aG9yIC0tYW1lbmQKICAgIC0gc2VuZCBpdCB0byB0aGUgYXBwcm9wcmlhdGUg
bWFpbGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5LCBpZiB5b3UgYmVsaWV2ZSB0aGUgcmVjaXBlIHNo
b3VsZCBub3QgYmUgdXBncmFkZWQgYXQgdGhpcyB0aW1lLAp5b3UgY2FuIGZpbGwgUkVDSVBFX05P
X1VQREFURV9SRUFTT04gaW4gcmVzcGVjdGl2ZSByZWNpcGUgZmlsZSBzbyB0aGF0CmF1dG9tYXRp
YyB1cGdyYWRlcyB3b3VsZCBubyBsb25nZXIgYmUgYXR0ZW1wdGVkLgoKUGxlYXNlIHJldmlldyB0
aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIgaW5mb3JtYXRpb24gYW5kIGJ1aWxkL3VwZGF0
ZSBmYWlsdXJlcy4KQW55IHByb2JsZW0gcGxlYXNlIGZpbGUgYSBidWcgYXQgaHR0cHM6Ly9idWd6
aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1Zy5jZ2k/cHJvZHVjdD1BdXRvbWF0ZWQlMjBV
cGRhdGUlMjBIYW5kbGVyCgpSZWdhcmRzLApUaGUgVXBncmFkZSBIZWxwZXIKCi0tID44IC0tCkZy
b20gMTVmNDMxZjI0YmFmZmU5OGUzYzY5MzI5ZDRiZDhkYjEyMDM4ZTMwNSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxwZXIgPGF1aEB5b2N0b3Byb2plY3Qub3JnPgpE
YXRlOiBTdW4sIDE1IFNlcCAyMDI0IDE0OjMzOjU3ICswMDAwClN1YmplY3Q6IFtQQVRDSF0gdnRl
OiB1cGdyYWRlIDAuNzYuMyAtPiAwLjc4LjAKCi0tLQogLi4uL3Z0ZS8wMDAxLUFkZC1XX0VYSVRD
T0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCB8IDQgKystLQogbWV0YS9yZWNp
cGVzLXN1cHBvcnQvdnRlL3t2dGVfMC43Ni4zLmJiID0+IHZ0ZV8wLjc4LjAuYmJ9ICAgICB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS97dnRlXzAuNzYuMy5iYiA9PiB2dGVfMC43OC4w
LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAw
MS1BZGQtV19FWElUQ09ERS1tYWNyby1mb3Itbm9uLWdsaWJjLXN5c3RlbXMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlLzAwMDEtQWRkLVdfRVhJVENPREUtbWFjcm8tZm9yLW5v
bi1nbGliYy1zeXN0ZW1zLnBhdGNoCmluZGV4IGUyY2ZmNmNmNzYuLmIyMWVlNDc1NGEgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS1BZGQtV19FWElUQ09ERS1t
YWNyby1mb3Itbm9uLWdsaWJjLXN5c3RlbXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvdnRlL3Z0ZS8wMDAxLUFkZC1XX0VYSVRDT0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVt
cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjg3OTVkZGE2Mjk2MTRjZDg0MmZjYmExYzRi
NTBiZTc1OWMyMGRhNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjA1ZmQxODllMGRi
NDY3OTM5NjdjNzQyNWRmYzU0NmM1Yzc2ZmY3YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IERhbmlsbyBTcGluZWxsYSA8ZGFueXNwaW45N0Bwcm90b25tYWlsLmNvbT4KIERhdGU6IFRo
dSwgMjEgTWFyIDIwMTkgMTQ6MTk6MjYgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gQWRkIFdfRVhJ
VENPREUgbWFjcm8gZm9yIG5vbi1nbGliYyBzeXN0ZW1zCkBAIC0xNiw3ICsxNiw3IEBAIFNpZ25l
ZC1vZmYtYnk6IEFuZHJlYXMgTcO8bGxlciA8c2Nobml0emVsdG9ueUBnbWFpbC5jb20+CiAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvc3JjL3dpZGdldC5j
YyBiL3NyYy93aWRnZXQuY2MKLWluZGV4IGI4ZGFhNWMuLmMzNTc5NjAgMTAwNjQ0CitpbmRleCA2
Njk1NWE2Li5iMzUyYzExIDEwMDY0NAogLS0tIGEvc3JjL3dpZGdldC5jYwogKysrIGIvc3JjL3dp
ZGdldC5jYwogQEAgLTE2LDYgKzE2LDEwIEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC92dGUvdnRlXzAuNzYuMy5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43
OC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L3Z0ZS92dGVfMC43Ni4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUv
dnRlXzAuNzguMC5iYgppbmRleCA1MTVmZjIyOGZkLi44YzkyOTJlOGE3IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlXzAuNzYuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC92dGUvdnRlXzAuNzguMC5iYgpAQCAtMTksNyArMTksNyBAQCBHSURPQ0dFTl9NRVNP
Tl9PUFRJT04gPSAiZG9jcyIKIGluaGVyaXQgZ25vbWViYXNlIGdpLWRvY2dlbiBmZWF0dXJlc19j
aGVjayB1cHN0cmVhbS12ZXJzaW9uLWlzLWV2ZW4gZ29iamVjdC1pbnRyb3NwZWN0aW9uIHN5c3Rl
bWQgdmFsYQogCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1m
b3Itbm9uLWdsaWJjLXN5c3RlbXMucGF0Y2giCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9
ICJmNjc4ZTk0YzA1NmYzNzdmZDAwMjEyMTRhZGZmNTQ1MGNiMTcyZTlhMDhiMTYwOTExMTgxZGRm
ZjdiN2Q1ZDYwIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiMDdmMDljNjIyOGE4YmIz
YzE1OTlkZDBmNWE2ZWM3OTdiMzBkMzAxMGMzYWM5MWNmMjFiNjlkOTYzNWRmYWY3YyIKIAogQU5Z
X09GX0RJU1RST19GRUFUVVJFUyA9ICIke0dUSzNESVNUUk9GRUFUVVJFU30iCiAKLS0gCjIuNDQu
MAoK

--===============0219765358430410250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/vte: PACKAGES: added "vte-locale-kab"
packages/core2-64-poky-linux/vte/libvte-gtk4: PKGSIZE changed from 658124 to 818272 (+24%)
packages/core2-64-poky-linux/vte/libvte: PKGSIZE changed from 667911 to 815739 (+22%)
packages/core2-64-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.7600.3", added "/usr/lib/libvte-2.91.so.0.7800.0"
Changes to packages/core2-64-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.7600.3 to libvte-2.91.so.0.7800.0
  /usr/lib/libvte-2.91.so.0.7600.3 moved to /usr/lib/libvte-2.91.so.0.7800.0
  /usr/include/vte-2.91-gtk4/vte/vteuuid.h was added
  /usr/include/vte-2.91/vte/vteuuid.h was added
packages/core2-64-poky-linux/vte/vte-dbg: PKGSIZE changed from 15391968 to 20930792 (+36%)
packages/core2-64-poky-linux/vte/vte-dev: PKGSIZE changed from 456414 to 573537 (+26%)
packages/core2-64-poky-linux/vte/vte-dev: FILELIST: added "/usr/include/vte-2.91/vte/vteuuid.h"
packages/core2-64-poky-linux/vte/vte-gtk4-dev: PKGSIZE changed from 435184 to 552374 (+27%)
packages/core2-64-poky-linux/vte/vte-gtk4-dev: FILELIST: added "/usr/include/vte-2.91-gtk4/vte/vteuuid.h"
packages/core2-64-poky-linux/vte/vte-locale-hi: PKGSIZE changed from 2790 to 1655 (-41%)
packages/core2-64-poky-linux/vte/vte-locale-th: PKGSIZE changed from 2888 to 1638 (-43%)
packages/core2-64-poky-linux/vte/vte-src: PKGSIZE changed from 2863626 to 3299862 (+15%)

--===============0219765358430410250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vte: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte: PACKAGES: added "vte-locale-kab"
packages/core2-64-poky-linux/vte: SRC_URI changed from "https://download.gnome.org/sources//vte/0.76/vte-0.76.3.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch" to "https://download.gnome.org/sources//vte/0.78/vte-0.78.0.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
packages/core2-64-poky-linux/vte: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/libvte-gtk4: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/libvte-gtk4: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/libvte-gtk4: PKGSIZE changed from 658124 to 818272 (+24%)
packages/core2-64-poky-linux/vte/libvte: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.7600.3", added "/usr/lib/libvte-2.91.so.0.7800.0"
packages/core2-64-poky-linux/vte/libvte: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/libvte: PKGSIZE changed from 667911 to 815739 (+22%)
Changes to packages/core2-64-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.7600.3 to libvte-2.91.so.0.7800.0
  /usr/lib/libvte-2.91.so.0.7600.3 moved to /usr/lib/libvte-2.91.so.0.7800.0
  /usr/include/vte-2.91-gtk4/vte/vteuuid.h was added
  /usr/include/vte-2.91/vte/vteuuid.h was added
packages/core2-64-poky-linux/vte/vte-dbg: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-dbg: FILELIST: removed "/usr/lib/.debug/libvte-2.91.so.0.7600.3", added "/usr/lib/.debug/libvte-2.91.so.0.7800.0"
packages/core2-64-poky-linux/vte/vte-dbg: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-dbg: PKGSIZE changed from 15391968 to 20930792 (+36%)
packages/core2-64-poky-linux/vte/vte-dev: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-dev: FILELIST: added "/usr/include/vte-2.91/vte/vteuuid.h"
packages/core2-64-poky-linux/vte/vte-dev: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-dev: PKGSIZE changed from 456414 to 573537 (+26%)
packages/core2-64-poky-linux/vte/vte-doc: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-doc: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-gtk4-dev: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-gtk4-dev: FILELIST: added "/usr/include/vte-2.91-gtk4/vte/vteuuid.h"
packages/core2-64-poky-linux/vte/vte-gtk4-dev: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-gtk4-dev: PKGSIZE changed from 435184 to 552374 (+27%)
packages/core2-64-poky-linux/vte/vte-gtk4: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-gtk4: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-gtk4: PKGSIZE changed from 109400 to 113504 (+4%)
packages/core2-64-poky-linux/vte/vte-locale-ab: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ab: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-am: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-am: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-an: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-an: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ang: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ang: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ar: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ar: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-as: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-as: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ast: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ast: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-az: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-az: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-be+latin: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-be+latin: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-be: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-be: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-bg: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-bg: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-bn-in: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-bn-in: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-bn: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-bn: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-bs: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-bs: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ca+valencia: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ca+valencia: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ca: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ca: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ckb: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ckb: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-cs: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-cs: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-cy: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-cy: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-da: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-da: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-de: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-de: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-dz: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-dz: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-el: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-el: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-en+shaw: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-en+shaw: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-en-ca: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-en-ca: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-en-gb: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-en-gb: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-eo: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-eo: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-es: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-es: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-et: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-et: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-eu: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-eu: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-fa: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-fa: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-fi: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-fi: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-fr: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-fr: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-fur: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-fur: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ga: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ga: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-gd: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-gd: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-gl: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-gl: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-gu: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-gu: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-he: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-he: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-hi: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-hi: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-hi: PKGSIZE changed from 2790 to 1655 (-41%)
packages/core2-64-poky-linux/vte/vte-locale-hr: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-hr: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-hu: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-hu: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-id: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-id: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-is: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-is: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-it: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-it: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ja: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ja: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ka: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ka: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-kk: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-kk: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-kn: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-kn: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ko: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ko: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ku: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ku: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ky: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ky: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-li: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-li: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-lt: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-lt: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-lv: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-lv: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-mai: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-mai: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-mi: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-mi: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-mjw: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-mjw: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-mk: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-mk: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ml: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ml: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-mn: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-mn: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-mr: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-mr: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ms: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ms: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-nb: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-nb: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-nds: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-nds: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ne: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ne: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-nl: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-nl: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-nn: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-nn: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-oc: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-oc: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-or: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-or: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-pa: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-pa: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-pl: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-pl: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-pt-br: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-pt-br: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-pt: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-pt: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ro: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ro: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ru: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ru: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-rw: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-rw: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-si: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-si: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-sk: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-sk: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-sl: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-sl: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-sq: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-sq: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-sr+latin: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-sr+latin: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-sr: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-sr: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-sv: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-sv: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ta: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ta: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-te: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-te: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-tg: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-tg: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-th: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-th: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-th: PKGSIZE changed from 2888 to 1638 (-43%)
packages/core2-64-poky-linux/vte/vte-locale-tr: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-tr: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-ug: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-ug: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-uk: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-uk: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-uz+cyrillic: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-uz+cyrillic: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-vi: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-vi: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-wa: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-wa: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-xh: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-xh: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-zh-cn: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-zh-cn: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-zh-hk: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-zh-hk: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-locale-zh-tw: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-locale-zh-tw: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-prompt: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-prompt: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-prompt: PKGSIZE changed from 19564 to 20409 (+4%)
packages/core2-64-poky-linux/vte/vte-src: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-src: FILELIST: directory renamed /usr/src/debug/vte/0.76.3/src/app -> /usr/src/debug/vte/0.78.0/src/app, removed "/usr/src/debug/vte/0.76.3/src/modes-dec.hh /usr/src/debug/vte/0.76.3/src/vte/vteglobals.h /usr/src/debug/vte/0.76.3/src/systemd.cc /usr/src/debug/vte/0.76.3/src/modes.hh /usr/src/debug/vte/0.76.3/src/scheduler.h /usr/src/debug/vte/0.76.3/src/drawing-cairo.hh /usr/src/debug/vte/0.76.3/src/vteinternal.hh /usr/src/debug/vte/0.76.3/src/drawing-context.hh /usr/src/debug/vte/0.76.3/src/vteaccess.cc /usr/src/debug/vte/0.76.3/src/vteunistr.cc /usr/src/debug/vte/0.76.3/src/parser-string.hh /usr/src/debug/vte/0.76.3/src/vte/vteregex.h /usr/src/debug/vte/0.76.3/src/drawing-gsk.cc /usr/src/debug/vte/0.76.3/src/vteregex.cc /usr/src/debug/vte/0.76.3/src/vtetypes.cc /usr/src/debug/vte/0.76.3/src/refptr.hh /usr/src/debug/vte/0.76.3/src/chunk.cc /usr/src/debug/vte/0.76.3/src/parser-charset-tables.hh /usr/src/debug/vte/0.76.3/src/vtetypes.hh /usr/src/de
 bug/vte/0.76.3/src/vte/vtepty.h /usr/src/debug/vte/0.76.3/src/pastify.cc /usr/src/debug/vte/0.76.3/src/regex.cc /usr/src/debug/vte/0.76.3/src/fonts-pangocairo.cc /usr/src/debug/vte/0.76.3/src/chunk.hh /usr/src/debug/vte/0.76.3/src/fonts-pangocairo.hh /usr/src/debug/vte/0.76.3/src/marshal.h /usr/src/debug/vte/0.76.3/src/marshal.c /usr/src/debug/vte/0.76.3/src/vterowdata.hh /usr/src/debug/vte/0.76.3/src/vteseq.cc /usr/src/debug/vte/0.76.3/src/icu-converter.cc /usr/src/debug/vte/0.76.3/src/widget.cc /usr/src/debug/vte/0.76.3/src/minifont.cc /usr/src/debug/vte/0.76.3/src/ringview.cc /usr/src/debug/vte/0.76.3/src/vtegtk.cc /usr/src/debug/vte/0.76.3/src/icu-decoder.cc /usr/src/debug/vte/0.76.3/src/minifont.hh /usr/src/debug/vte/0.76.3/src/ringview.hh /usr/src/debug/vte/0.76.3/src/parser-cmd-handlers.hh /usr/src/debug/vte/0.76.3/src/vte/vtedeprecated.h /usr/src/debug/vte/0.76.3/src/debug.h /usr/src/debug/vte/0.76.3/src/spawn.hh /usr/src/debug/vte/0.76.3/src/modes-ecma.hh /usr/src/debug/vte
 /0.76.3/src/buffer.h /usr/src/debug/vte/0.76.3/src/gobject-glue.hh /usr/src/debug/vte/0.76.3/src/bidi.cc /usr/src/debug/vte/0.76.3/src/vteutils.h /usr/src/debug/vte/0.76.3/src/vte/vteenums.h /usr/src/debug/vte/0.76.3/src/cell.hh /usr/src/debug/vte/0.76.3/src/urlencode.cc /usr/src/debug/vte/0.76.3/src/pty.hh /usr/src/debug/vte/0.76.3/src/parser.cc /usr/src/debug/vte/0.76.3/src/icu-converter.hh /usr/src/debug/vte/0.76.3/src/parser-arg.hh /usr/src/debug/vte/0.76.3/src/parser-cmd.hh /usr/src/debug/vte/0.76.3/src/parser-csi.hh /usr/src/debug/vte/0.76.3/src/parser-dcs.hh /usr/src/debug/vte/0.76.3/src/parser-esc.hh /usr/src/debug/vte/0.76.3/src/pcre2-glue.hh /usr/src/debug/vte/0.76.3/src/vtepty.cc /usr/src/debug/vte/0.76.3/src/vteregexinternal.hh /usr/src/debug/vte/0.76.3/src/pty.cc /usr/src/debug/vte/0.76.3/src/pastify.hh /usr/src/debug/vte/0.76.3/src/utf8.cc /usr/src/debug/vte/0.76.3/src/reaper.cc /usr/src/debug/vte/0.76.3/src/std-glue.hh /usr/src/debug/vte/0.76.3/src/ring.hh /usr/src/de
 bug/vte/0.76.3/src/parser.hh /usr/src/debug/vte/0.76.3/src/gdkarrayimpl.c /usr/src/debug/vte/0.76.3/src/cairo-glue.hh /usr/src/debug/vte/0.76.3/src/libc-glue.hh /usr/src/debug/vte/0.76.3/src/vtespawn.cc /usr/src/debug/vte/0.76.3/src/vteutils.cc /usr/src/debug/vte/0.76.3/src/vte/vteterminal.h /usr/src/debug/vte/0.76.3/src/pango-glue.hh /usr/src/debug/vte/0.76.3/src/vte-glue.hh /usr/src/debug/vte/0.76.3/src/vteaccess.h /usr/src/debug/vte/0.76.3/src/vtespawn.hh /usr/src/debug/vte/0.76.3/src/vtestream.h /usr/src/debug/vte/0.76.3/src/vteunistr.h /usr/src/debug/vte/0.76.3/src/drawing-gsk.hh /usr/src/debug/vte/0.76.3/src/scheduler.cc /usr/src/debug/vte/0.76.3/src/icu-decoder.hh /usr/src/debug/vte/0.76.3/src/reaper.hh /usr/src/debug/vte/0.76.3/src/utf8.hh /usr/src/debug/vte/0.76.3/src/ring.cc /usr/src/debug/vte/0.76.3/src/bidi.hh /usr/src/debug/vte/0.76.3/src/clipboard-gtk.hh /usr/src/debug/vte/0.76.3/src/icu-glue.cc /usr/src/debug/vte/0.76.3/src/cxx-utils.hh /usr/src/debug/vte/0.76.3/src/d
 rawing-cairo.cc /usr/src/debug/vte/0.76.3/src/vte/vtetypebuiltins-gtk3.h /usr/src/debug/vte/0.76.3/src/vteptyinternal.hh /usr/src/debug/vte/0.76.3/src/missing.cc /usr/src/debug/vte/0.76.3/src/icu-glue.hh /usr/src/debug/vte/0.76.3/src/vtestream-base.h /usr/src/debug/vte/0.76.3/src/keymap.cc /usr/src/debug/vte/0.76.3/src/clipboard-gtk.cc /usr/src/debug/vte/0.76.3/src/graphene-glue.hh /usr/src/debug/vte/0.76.3/src/keymap.h /usr/src/debug/vte/0.76.3/src/parser-reply.hh /usr/src/debug/vte/0.76.3/src/glib-glue.hh /usr/src/debug/vte/0.76.3/src/color-triple.hh /usr/src/debug/vte/0.76.3/src/vteresources-gtk4.cc.c /usr/src/debug/vte/0.76.3/src/debug.cc /usr/src/debug/vte/0.76.3/src/vtegtk.hh /usr/src/debug/vte/0.76.3/src/missing.hh /usr/src/debug/vte/0.76.3/src/vteresources.c /usr/src/debug/vte/0.76.3/src/spawn.cc /usr/src/debug/vte/0.76.3/src/box-drawing.hh /usr/src/debug/vte/0.76.3/src/tabstops.hh /usr/src/debug/vte/0.76.3/src/vterowdata.cc /usr/src/debug/vte/0.76.3/src/parser-glue.hh /usr/
 src/debug/vte/0.76.3/src/vte.cc /usr/src/debug/vte/0.76.3/src/regex.hh /usr/src/debug/vte/0.76.3/src/vte/vtetypebuiltins-gtk4.h /usr/src/debug/vte/0.76.3/src/drawing-context.cc /usr/src/debug/vte/0.76.3/src/attr.hh /usr/src/debug/vte/0.76.3/src/fwd.hh /usr/src/debug/vte/0.76.3/src/widget.hh /usr/src/debug/vte/0.76.3/src/unicode-width.hh /usr/src/debug/vte/0.76.3/src/vte/vtetypebuiltins-gtk3.cc /usr/src/debug/vte/0.76.3/src/gtk-glue.hh /usr/src/debug/vte/0.76.3/src/vte/vtetypebuiltins-gtk4.cc /usr/src/debug/vte/0.76.3/src/vtestream-file.h /usr/src/debug/vte/0.76.3/src/glib-glue.cc /usr/src/debug/vte/0.76.3/src/systemd.hh", added "/usr/src/debug/vte/0.78.0/src/vtegtk.cc /usr/src/debug/vte/0.78.0/src/vterowdata.cc /usr/src/debug/vte/0.78.0/src/marshal.h /usr/src/debug/vte/0.78.0/src/vteseq.cc /usr/src/debug/vte/0.78.0/src/marshal.c /usr/src/debug/vte/0.78.0/src/drawing-gsk.cc /usr/src/debug/vte/0.78.0/src/missing.hh /usr/src/debug/vte/0.78.0/src/vte.cc /usr/src/debug/vte/0.78.0/src/chu
 nk.cc /usr/src/debug/vte/0.78.0/src/uuid.cc /usr/src/debug/vte/0.78.0/src/osc-colors.hh /usr/src/debug/vte/0.78.0/src/vteresources-gtk4.cc.c /usr/src/debug/vte/0.78.0/src/std-glue.hh /usr/src/debug/vte/0.78.0/src/cairo-glue.hh /usr/src/debug/vte/0.78.0/src/color-triple.hh /usr/src/debug/vte/0.78.0/src/vte/vteterminal.h /usr/src/debug/vte/0.78.0/src/vte/vtetypebuiltins-gtk3.h /usr/src/debug/vte/0.78.0/src/vte/vtedeprecated.h /usr/src/debug/vte/0.78.0/src/pastify.cc /usr/src/debug/vte/0.78.0/src/missing.cc /usr/src/debug/vte/0.78.0/src/box-drawing.hh /usr/src/debug/vte/0.78.0/src/color.hh /usr/src/debug/vte/0.78.0/src/vterowdata.hh /usr/src/debug/vte/0.78.0/src/graphene-glue.hh /usr/src/debug/vte/0.78.0/src/color-palette.hh /usr/src/debug/vte/0.78.0/src/vteresources.c /usr/src/debug/vte/0.78.0/src/vte/vteuuid.h /usr/src/debug/vte/0.78.0/src/drawing-context.hh /usr/src/debug/vte/0.78.0/src/fwd.hh /usr/src/debug/vte/0.78.0/src/tabstops.hh /usr/src/debug/vte/0.78.0/src/vteaccess.cc /usr/
 src/debug/vte/0.78.0/src/vteunistr.cc /usr/src/debug/vte/0.78.0/src/vte/vteregex.h /usr/src/debug/vte/0.78.0/src/icu-decoder.hh /usr/src/debug/vte/0.78.0/src/fonts-pangocairo.hh /usr/src/debug/vte/0.78.0/src/keymap.h /usr/src/debug/vte/0.78.0/src/minifont-coverage.inc /usr/src/debug/vte/0.78.0/src/widget.hh /usr/src/debug/vte/0.78.0/src/parser-glue.hh /usr/src/debug/vte/0.78.0/src/fonts-pangocairo.cc /usr/src/debug/vte/0.78.0/src/systemd.cc /usr/src/debug/vte/0.78.0/src/libc-glue.hh /usr/src/debug/vte/0.78.0/src/vte/vteenums.h /usr/src/debug/vte/0.78.0/src/parser-cmd-handlers.hh /usr/src/debug/vte/0.78.0/src/regex.cc /usr/src/debug/vte/0.78.0/src/color-names.hh /usr/src/debug/vte/0.78.0/src/debug.h /usr/src/debug/vte/0.78.0/src/drawing-cairo.cc /usr/src/debug/vte/0.78.0/src/vte-glue.hh /usr/src/debug/vte/0.78.0/src/vteaccess.h /usr/src/debug/vte/0.78.0/src/vtespawn.hh /usr/src/debug/vte/0.78.0/src/vtestream.h /usr/src/debug/vte/0.78.0/src/vteunistr.h /usr/src/debug/vte/0.78.0/src/cl
 ipboard-gtk.cc /usr/src/debug/vte/0.78.0/src/vtespawn.cc /usr/src/debug/vte/0.78.0/src/vteutils.cc /usr/src/debug/vte/0.78.0/src/icu-glue.hh /usr/src/debug/vte/0.78.0/src/systemd.hh /usr/src/debug/vte/0.78.0/src/icu-glue.cc /usr/src/debug/vte/0.78.0/src/cxx-utils.hh /usr/src/debug/vte/0.78.0/src/sgr.hh /usr/src/debug/vte/0.78.0/src/gobject-glue.hh /usr/src/debug/vte/0.78.0/src/spawn.hh /usr/src/debug/vte/0.78.0/src/scheduler.h /usr/src/debug/vte/0.78.0/src/pty.hh /usr/src/debug/vte/0.78.0/src/color-parser.hh /usr/src/debug/vte/0.78.0/src/icu-converter.cc /usr/src/debug/vte/0.78.0/src/modes.hh /usr/src/debug/vte/0.78.0/src/clipboard-gtk.hh /usr/src/debug/vte/0.78.0/src/vteptyinternal.hh /usr/src/debug/vte/0.78.0/src/refptr.hh /usr/src/debug/vte/0.78.0/src/utf8.hh /usr/src/debug/vte/0.78.0/src/ring.cc /usr/src/debug/vte/0.78.0/src/uuid.hh /usr/src/debug/vte/0.78.0/src/scheduler.cc /usr/src/debug/vte/0.78.0/src/spawn.cc /usr/src/debug/vte/0.78.0/src/cell.hh /usr/src/debug/vte/0.78.0/sr
 c/gdkarrayimpl.c /usr/src/debug/vte/0.78.0/src/debug.cc /usr/src/debug/vte/0.78.0/src/vtegtk.hh /usr/src/debug/vte/0.78.0/src/utf8.cc /usr/src/debug/vte/0.78.0/src/keymap.cc /usr/src/debug/vte/0.78.0/src/vtestream-file.h /usr/src/debug/vte/0.78.0/src/ring.hh /usr/src/debug/vte/0.78.0/src/buffer.h /usr/src/debug/vte/0.78.0/src/icu-decoder.cc /usr/src/debug/vte/0.78.0/src/gtk-glue.hh /usr/src/debug/vte/0.78.0/src/parser-charset-tables.hh /usr/src/debug/vte/0.78.0/src/termprops.hh /usr/src/debug/vte/0.78.0/src/parser-reply.hh /usr/src/debug/vte/0.78.0/src/parser.hh /usr/src/debug/vte/0.78.0/src/bidi.cc /usr/src/debug/vte/0.78.0/src/vtestream-base.h /usr/src/debug/vte/0.78.0/src/reaper.hh /usr/src/debug/vte/0.78.0/src/vte/vtetypebuiltins-gtk3.cc /usr/src/debug/vte/0.78.0/src/vte/vtetypebuiltins-gtk4.cc /usr/src/debug/vte/0.78.0/src/vteuuidinternal.hh /usr/src/debug/vte/0.78.0/src/modes-ecma.hh /usr/src/debug/vte/0.78.0/src/vteutils.h /usr/src/debug/vte/0.78.0/src/parser.cc /usr/src/debu
 g/vte/0.78.0/src/regex.hh /usr/src/debug/vte/0.78.0/src/minifont.hh /usr/src/debug/vte/0.78.0/src/ringview.hh /usr/src/debug/vte/0.78.0/src/vteaccess-gtk4.cc /usr/src/debug/vte/0.78.0/src/parser-string.hh /usr/src/debug/vte/0.78.0/src/urlencode.cc /usr/src/debug/vte/0.78.0/src/minifont.cc /usr/src/debug/vte/0.78.0/src/glib-glue.cc /usr/src/debug/vte/0.78.0/src/rect.hh /usr/src/debug/vte/0.78.0/src/ringview.cc /usr/src/debug/vte/0.78.0/src/drawing-context.cc /usr/src/debug/vte/0.78.0/src/unicode-width.hh /usr/src/debug/vte/0.78.0/src/drawing-gsk.hh /usr/src/debug/vte/0.78.0/src/color-parser.cc /usr/src/debug/vte/0.78.0/src/bidi.hh /usr/src/debug/vte/0.78.0/src/widget.cc /usr/src/debug/vte/0.78.0/src/osc-colors.cc /usr/src/debug/vte/0.78.0/src/vtetypes.hh /usr/src/debug/vte/0.78.0/src/pango-glue.hh /usr/src/debug/vte/0.78.0/src/chunk.hh /usr/src/debug/vte/0.78.0/src/vteregex.cc /usr/src/debug/vte/0.78.0/src/vtetypes.cc /usr/src/debug/vte/0.78.0/src/vteuuid.cc /usr/src/debug/vte/0.78.0
 /src/pastify.hh /usr/src/debug/vte/0.78.0/src/vtepty.cc /usr/src/debug/vte/0.78.0/src/glib-glue.hh /usr/src/debug/vte/0.78.0/src/drawing-cairo.hh /usr/src/debug/vte/0.78.0/src/attr.hh /usr/src/debug/vte/0.78.0/src/modes-dec.hh /usr/src/debug/vte/0.78.0/src/pty.cc /usr/src/debug/vte/0.78.0/src/vteaccess-gtk4.h /usr/src/debug/vte/0.78.0/src/icu-converter.hh /usr/src/debug/vte/0.78.0/src/vteregexinternal.hh /usr/src/debug/vte/0.78.0/src/reaper.cc /usr/src/debug/vte/0.78.0/src/vte/vteglobals.h /usr/src/debug/vte/0.78.0/src/vte/vtepty.h /usr/src/debug/vte/0.78.0/src/parser-arg.hh /usr/src/debug/vte/0.78.0/src/parser-cmd.hh /usr/src/debug/vte/0.78.0/src/parser-csi.hh /usr/src/debug/vte/0.78.0/src/parser-dcs.hh /usr/src/debug/vte/0.78.0/src/parser-esc.hh /usr/src/debug/vte/0.78.0/src/pcre2-glue.hh /usr/src/debug/vte/0.78.0/src/vteinternal.hh /usr/src/debug/vte/0.78.0/src/vte/vtetypebuiltins-gtk4.h"
packages/core2-64-poky-linux/vte/vte-src: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte-src: PKGSIZE changed from 2863626 to 3299862 (+15%)
packages/core2-64-poky-linux/vte/vte-staticdev: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte-staticdev: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte: PKGV changed from 0.76.3 [default] to 0.78.0 [default]
packages/core2-64-poky-linux/vte/vte: PV changed from "0.76.3" to "0.78.0"
packages/core2-64-poky-linux/vte/vte: PKGSIZE changed from 117770 to 121874 (+3%)

--===============0219765358430410250==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vte-upgrade-0.76.3-0.78.0.patch"

RnJvbSAxNWY0MzFmMjRiYWZmZTk4ZTNjNjkzMjlkNGJkOGRiMTIwMzhlMzA1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMTQ6MzM6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dGU6IHVwZ3JhZGUgMC43Ni4zIC0+IDAuNzguMAoKLS0tCiAuLi4vdnRlLzAwMDEtQWRkLVdfRVhJ
VENPREUtbWFjcm8tZm9yLW5vbi1nbGliYy1zeXN0ZW1zLnBhdGNoIHwgNCArKy0tCiBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC92dGUve3Z0ZV8wLjc2LjMuYmIgPT4gdnRlXzAuNzguMC5iYn0gICAgIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3t2dGVfMC43Ni4zLmJiID0+IHZ0ZV8wLjc4
LjAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8w
MDAxLUFkZC1XX0VYSVRDT0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1mb3It
bm9uLWdsaWJjLXN5c3RlbXMucGF0Y2gKaW5kZXggZTJjZmY2Y2Y3Ni4uYjIxZWU0NzU0YSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDAxLUFkZC1XX0VYSVRDT0RF
LW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC92dGUvdnRlLzAwMDEtQWRkLVdfRVhJVENPREUtbWFjcm8tZm9yLW5vbi1nbGliYy1zeXN0
ZW1zLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiODc5NWRkYTYyOTYxNGNkODQyZmNiYTFj
NGI1MGJlNzU5YzIwZGE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2MDVmZDE4OWUw
ZGI0Njc5Mzk2N2M3NDI1ZGZjNTQ2YzVjNzZmZjdjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogRGFuaWxvIFNwaW5lbGxhIDxkYW55c3Bpbjk3QHByb3Rvbm1haWwuY29tPgogRGF0ZTog
VGh1LCAyMSBNYXIgMjAxOSAxNDoxOToyNiArMDEwMAogU3ViamVjdDogW1BBVENIXSBBZGQgV19F
WElUQ09ERSBtYWNybyBmb3Igbm9uLWdsaWJjIHN5c3RlbXMKQEAgLTE2LDcgKzE2LDcgQEAgU2ln
bmVkLW9mZi1ieTogQW5kcmVhcyBNw7xsbGVyIDxzY2huaXR6ZWx0b255QGdtYWlsLmNvbT4KICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9zcmMvd2lkZ2V0
LmNjIGIvc3JjL3dpZGdldC5jYwotaW5kZXggYjhkYWE1Yy4uYzM1Nzk2MCAxMDA2NDQKK2luZGV4
IDY2OTU1YTYuLmIzNTJjMTEgMTAwNjQ0CiAtLS0gYS9zcmMvd2lkZ2V0LmNjCiArKysgYi9zcmMv
d2lkZ2V0LmNjCiBAQCAtMTYsNiArMTYsMTAgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L3Z0ZS92dGVfMC43Ni4zLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8w
Ljc4LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvdnRlL3Z0ZV8wLjc2LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0
ZS92dGVfMC43OC4wLmJiCmluZGV4IDUxNWZmMjI4ZmQuLjhjOTI5MmU4YTcgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43Ni4zLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L3Z0ZS92dGVfMC43OC4wLmJiCkBAIC0xOSw3ICsxOSw3IEBAIEdJRE9DR0VOX01F
U09OX09QVElPTiA9ICJkb2NzIgogaW5oZXJpdCBnbm9tZWJhc2UgZ2ktZG9jZ2VuIGZlYXR1cmVz
X2NoZWNrIHVwc3RyZWFtLXZlcnNpb24taXMtZXZlbiBnb2JqZWN0LWludHJvc3BlY3Rpb24gc3lz
dGVtZCB2YWxhCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLUFkZC1XX0VYSVRDT0RFLW1hY3Jv
LWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCIKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1d
ID0gImY2NzhlOTRjMDU2ZjM3N2ZkMDAyMTIxNGFkZmY1NDUwY2IxNzJlOWEwOGIxNjA5MTExODFk
ZGZmN2I3ZDVkNjAiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICIwN2YwOWM2MjI4YThi
YjNjMTU5OWRkMGY1YTZlYzc5N2IzMGQzMDEwYzNhYzkxY2YyMWI2OWQ5NjM1ZGZhZjdjIgogCiBB
TllfT0ZfRElTVFJPX0ZFQVRVUkVTID0gIiR7R1RLM0RJU1RST0ZFQVRVUkVTfSIKIAotLSAKMi40
NC4wCgo=

--===============0219765358430410250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1868 targets, 51 skipped, 0 masked, 0 errors.
Removing 125 recipes from the core2-64 sysroot...done.
Removing 125 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-a73c51304774df93549c69f299a355a734380a04"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a73c51304774df93549c69f299a355a734380a04"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 937 Local 922 Mirrors 0 Missed 15 Current 356 (98% match, 98% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 366 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_create_spdx_setscene)
NOTE: Running setscene task 367 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 368 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 369 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 376 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_populate_lic_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk4-4.14.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe vte-0.78.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 487 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk4-4.14.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vte-0.78.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 490 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.5.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 491 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 569 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 575 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_create_spdx_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.14.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.14.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1336 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_recipe_qa)
NOTE: Running task 1367 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_write_config)
NOTE: recipe lz4-1_1.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 608 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_create_spdx_setscene)
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vte-0.78.0-r0: task do_recipe_qa: Started
NOTE: recipe vte-0.78.0-r0: task do_write_config: Started
NOTE: recipe gnutls-3.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.14.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 613 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 614 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 616 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 618 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_populate_sysroot_setscene)
NOTE: recipe vte-0.78.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 623 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vte-0.78.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1442 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_fetch)
NOTE: recipe gnutls-3.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vte-0.78.0-r0: task do_fetch: Started
NOTE: Running setscene task 628 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 630 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 635 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_recipe_qa_setscene)
NOTE: recipe vte-0.78.0-r0: task do_fetch: Succeeded
NOTE: Running task 1448 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 650 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.14.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 657 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 659 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe vte-0.78.0-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 662 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 663 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gi-docgen-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 673 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.14.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vte-0.78.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 675 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.14.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 676 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gi-docgen-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_packagedata_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 684 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 686 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 688 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 689 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_populate_sysroot_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 693 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 695 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 697 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1477 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gi-docgen-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_packagedata_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 701 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe gi-docgen-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 703 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 706 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe vte-0.78.0-r0: task do_patch: Started
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 710 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vte-0.78.0-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1510 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vte-0.78.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.78.0-r0: task do_deploy_source_date_epoch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/at-spi2-core/2.52.0/temp/log.do_packagedata_setscene.3846053
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 719 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_package_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.78.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.78.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 723 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 728 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 730 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 731 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 733 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 734 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 736 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.78-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 737 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 741 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 747 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 748 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.78.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 752 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 755 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb:do_packagedata_setscene)
NOTE: recipe curl-8.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.58.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 760 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 761 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 762 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 763 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 765 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 768 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 770 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 774 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 778 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 784 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 785 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 787 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.58.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 789 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.39-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 795 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 796 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 799 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 802 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.79.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 805 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 809 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 811 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 812 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 814 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 817 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 821 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 822 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 825 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-9.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-9.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 829 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 830 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 831 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 832 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 833 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-9.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 834 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 839 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 840 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 841 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-9.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 842 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 844 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 846 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 847 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 849 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 850 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-9.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 852 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 853 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 854 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 856 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-9.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 859 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 861 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 863 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 865 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 867 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 868 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 870 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 872 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 875 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 876 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 877 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 879 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 880 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 883 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 884 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 885 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 888 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 889 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.123-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 891 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 892 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 894 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 895 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 897 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 898 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 902 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 903 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 904 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 907 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 909 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 913 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 915 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 917 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 919 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 921 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 923 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 924 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 926 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 928 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 930 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 932 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 934 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 936 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 938 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 939 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 941 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 943 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 944 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 945 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 947 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 949 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 950 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 951 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 953 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 956 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 957 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 959 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 960 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 962 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 964 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 966 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 973 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 974 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 976 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 978 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 979 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 981 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 982 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 983 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 985 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 986 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 988 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 990 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 994 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 996 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 998 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1001 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1002 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1004 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1009 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1011 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1012 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 1013 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1014 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1015 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1016 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1017 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1018 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1020 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1022 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1024 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1025 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1026 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1028 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1032 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1033 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1034 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1035 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1036 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1037 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1040 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1043 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1044 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1047 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1050 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1051 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1052 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1054 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1056 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1058 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1059 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1060 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1061 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1062 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1064 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1067 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1069 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1071 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1072 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1074 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1076 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1077 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1079 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1081 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1082 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2001 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1084 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1085 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1089 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1090 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1091 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1092 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1093 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1094 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1096 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1097 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 2035 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 2036 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1099 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1100 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1102 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1105 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2051 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1111 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1113 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1114 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1115 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1116 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1117 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1119 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1120 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1121 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1122 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1123 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1124 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1126 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 2067 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1128 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1132 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1133 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1135 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1137 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1140 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1142 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1143 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1144 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1146 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 2083 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1148 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1149 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 2109 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1153 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1155 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1158 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1159 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1160 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1161 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1162 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1163 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1164 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1166 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1167 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1168 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1169 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1170 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1171 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1172 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1173 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe xz-5.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1175 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1176 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1177 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1178 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running setscene task 1179 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1181 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1183 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1184 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1187 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1188 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1190 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1193 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1195 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1199 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1201 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1203 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1205 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1207 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1208 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1209 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1211 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1214 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1216 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1217 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1219 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1221 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1223 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1225 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2146 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1227 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1230 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1231 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1233 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1235 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1237 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1238 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1240 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1243 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1245 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1246 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1251 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1253 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1255 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1256 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1258 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1260 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1261 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1263 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1264 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1266 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1268 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1269 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1270 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1271 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1272 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1274 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2239 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1282 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running setscene task 1284 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1285 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0914254c7e98c2dcacbf6ad346ab81fe83878306674c5c75a61f3c4e871b47e4
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 687747f0fb1b19d9b8e0977d37bd4db7dd1bfe079312e26a18c556033a4df8c2 to wss://hashserv.yoctoproject.org/ws ({'taskhash': '5a409d8ebaf1c900b7338be4ebf2096a1f8367d3da49a3eeadf740dd86f7eb94', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '687747f0fb1b19d9b8e0977d37bd4db7dd1bfe079312e26a18c556033a4df8c2'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 5a409d8ebaf1c900b7338be4ebf2096a1f8367d3da49a3eeadf740dd86f7eb94 -> 687747f0fb1b19d9b8e0977d37bd4db7dd1bfe079312e26a18c556033a4df8c2 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1289 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1290 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1292 of 1293 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2676 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 7d8822d8e3862bc6cef9f4aed0203172cde09e762318ccd60e1d69c8bb1b94f6
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 687747f0fb1b19d9b8e0977d37bd4db7dd1bfe079312e26a18c556033a4df8c2 to wss://hashserv.yoctoproject.org/ws ({'taskhash': '86dd9283b514dfd8fce6ea2ae4f9888352efeeb52414a0e779019728b8fb20bf', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '687747f0fb1b19d9b8e0977d37bd4db7dd1bfe079312e26a18c556033a4df8c2'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 86dd9283b514dfd8fce6ea2ae4f9888352efeeb52414a0e779019728b8fb20bf -> 687747f0fb1b19d9b8e0977d37bd4db7dd1bfe079312e26a18c556033a4df8c2 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3474 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_packagedata)
NOTE: Running task 3490 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_packagedata: Started
NOTE: recipe vte-0.78.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3508 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_collect_spdx_deps)
NOTE: recipe vte-0.78.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vte-0.78.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3509 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_configure)
NOTE: recipe vte-0.78.0-r0: task do_configure: Started
NOTE: recipe vte-0.78.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vte-0.78.0-r0: task do_configure: Succeeded
NOTE: Running task 3510 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_compile)
NOTE: recipe vte-0.78.0-r0: task do_compile: Started
NOTE: recipe vte-0.78.0-r0: task do_compile: Succeeded
NOTE: Running task 3511 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_install)
NOTE: recipe vte-0.78.0-r0: task do_install: Started
NOTE: recipe vte-0.78.0-r0: task do_install: Succeeded
NOTE: Running task 3512 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_package)
NOTE: Running task 3513 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_populate_sysroot)
NOTE: recipe vte-0.78.0-r0: task do_package: Started
NOTE: recipe vte-0.78.0-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.78.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.78.0-r0: task do_package: Succeeded
NOTE: Running task 3514 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_packagedata)
NOTE: recipe vte-0.78.0-r0: task do_packagedata: Started
NOTE: recipe vte-0.78.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3515 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_create_spdx)
NOTE: Running task 3516 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_package_write_ipk)
NOTE: Running task 3517 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_package_write_deb)
NOTE: Running task 3518 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_package_write_rpm)
NOTE: recipe vte-0.78.0-r0: task do_create_spdx: Started
NOTE: Running task 3519 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_package_qa)
NOTE: recipe vte-0.78.0-r0: task do_package_write_ipk: Started
NOTE: recipe vte-0.78.0-r0: task do_package_write_deb: Started
NOTE: recipe vte-0.78.0-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.78.0-r0: task do_package_qa: Started
NOTE: recipe vte-0.78.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3520 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_create_package_spdx)
NOTE: recipe vte-0.78.0-r0: task do_create_package_spdx: Started
NOTE: recipe vte-0.78.0-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.78.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe vte-0.78.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe vte-0.78.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe vte-0.78.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3521 of 3521 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.78.0.bb:do_build)
NOTE: Tasks Summary: Attempted 3521 tasks of which 3489 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 110 ERROR messages, returning a non-zero exit code.
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ab went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-af went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-am went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ar went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-az went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be+latin went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ckb went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cy went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-dz went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en+shaw went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hy went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-is went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ka went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kab went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ku went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-li went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mai went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mk went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mn went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nn went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ps went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-rw went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-si went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+ije went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-th went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tk went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tt went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-wa went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-xh went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-yi went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zu went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.54.0-r0 to 0:2.52.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.52.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0219765358430410250==--

