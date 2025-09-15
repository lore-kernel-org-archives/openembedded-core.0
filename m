Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7A3CCD190
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:55:01 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.30914.1757937299444562349
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=roRQ+qL1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=aGp05ARf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101994d3a6da8-89187379-5423-4927-a976-a540ef3f5c87-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EokWBbxTLiq0dvMzm3w9KBBxDPLgVTOngFqQFaG+l08=;
	b=roRQ+qL10mDVIvOYlI73/k137gj/1Qys848kDE4IrRFMIu6n6WmnCJHKTERoBeE2
	oTBfFxiWjdowgT3fKJfBxCFhI74cDC3/rM5gamNNmiK0p12q04WAiK3wsIH+QaUYnc6
	pjfAqODdXfR3r/KMEB0lHMK/zMZ78/c58qIDHZyU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EokWBbxTLiq0dvMzm3w9KBBxDPLgVTOngFqQFaG+l08=;
	b=aGp05ARfogWvaA4+6MNyhWHwcYI6oDlzBEaJZww4RJUkwgicRXu/nUFYY5rFwMkC
	/fLc32NBFpk1Y044RUAxROiQkH0YFls6FoV7AiqPh5yGeQWjnttrSYptNZwzX16qLsQ
	yjGzkSeb3gNGSZoo6Es/Wk5d3jWTElQ8zAoVo28U=
Content-Type: multipart/mixed; boundary="===============8990519191110300394=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.82.0 SUCCEEDED
Message-ID: <010101994d3a6da8-89187379-5423-4927-a976-a540ef3f5c87-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223484

--===============8990519191110300394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICp2dGUqIHRvICowLjgyLjAqIGhhcyBTdWNjZWVkZWQuCgpOZXh0IHN0ZXBzOgogICAgLSBh
cHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLXZ0ZS11cGdyYWRlLTAuODAuMy0wLjgyLjAucGF0
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
b20gZDNmY2M4ZGEyMWE4NDY3YjlkZDRmMmEwOTBiZDUxMTM2ZTA3MTE1ZCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxwZXIgPGF1aEB5b2N0b3Byb2plY3Qub3JnPgpE
YXRlOiBNb24sIDE1IFNlcCAyMDI1IDExOjU0OjI4ICswMDAwClN1YmplY3Q6IFtQQVRDSF0gdnRl
OiB1cGdyYWRlIDAuODAuMyAtPiAwLjgyLjAKCi0tLQogLi4uL3Z0ZS8wMDAxLUFkZC1XX0VYSVRD
T0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCB8IDQgKystLQogbWV0YS9yZWNp
cGVzLXN1cHBvcnQvdnRlL3t2dGVfMC44MC4zLmJiID0+IHZ0ZV8wLjgyLjAuYmJ9ICAgICB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS97dnRlXzAuODAuMy5iYiA9PiB2dGVfMC44Mi4w
LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAw
MS1BZGQtV19FWElUQ09ERS1tYWNyby1mb3Itbm9uLWdsaWJjLXN5c3RlbXMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlLzAwMDEtQWRkLVdfRVhJVENPREUtbWFjcm8tZm9yLW5v
bi1nbGliYy1zeXN0ZW1zLnBhdGNoCmluZGV4IGUyY2ZmNmNmNzYuLjYwNDNmODA0NTkgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS1BZGQtV19FWElUQ09ERS1t
YWNyby1mb3Itbm9uLWdsaWJjLXN5c3RlbXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvdnRlL3Z0ZS8wMDAxLUFkZC1XX0VYSVRDT0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVt
cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjg3OTVkZGE2Mjk2MTRjZDg0MmZjYmExYzRi
NTBiZTc1OWMyMGRhNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTgwYzhlZTU5MWY5
MTkwNjM4N2VkN2FmYjAzZjMyMTFiNWU5ZmU0MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IERhbmlsbyBTcGluZWxsYSA8ZGFueXNwaW45N0Bwcm90b25tYWlsLmNvbT4KIERhdGU6IFRo
dSwgMjEgTWFyIDIwMTkgMTQ6MTk6MjYgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gQWRkIFdfRVhJ
VENPREUgbWFjcm8gZm9yIG5vbi1nbGliYyBzeXN0ZW1zCkBAIC0xNiw3ICsxNiw3IEBAIFNpZ25l
ZC1vZmYtYnk6IEFuZHJlYXMgTcO8bGxlciA8c2Nobml0emVsdG9ueUBnbWFpbC5jb20+CiAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvc3JjL3dpZGdldC5j
YyBiL3NyYy93aWRnZXQuY2MKLWluZGV4IGI4ZGFhNWMuLmMzNTc5NjAgMTAwNjQ0CitpbmRleCA3
OTRlYzg4Li5lOTFlYzcwIDEwMDY0NAogLS0tIGEvc3JjL3dpZGdldC5jYwogKysrIGIvc3JjL3dp
ZGdldC5jYwogQEAgLTE2LDYgKzE2LDEwIEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC92dGUvdnRlXzAuODAuMy5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC44
Mi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L3Z0ZS92dGVfMC44MC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUv
dnRlXzAuODIuMC5iYgppbmRleCAxZWI5NWRkODI3Li43NWI4NjBhODA1IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlXzAuODAuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC92dGUvdnRlXzAuODIuMC5iYgpAQCAtMTksNyArMTksNyBAQCBpbmhlcml0IGdub21l
YmFzZSBnaS1kb2NnZW4gZmVhdHVyZXNfY2hlY2sgdXBzdHJlYW0tdmVyc2lvbi1pcy1ldmVuIGdv
YmplY3QtaW50cgogCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1BZGQtV19FWElUQ09ERS1tYWNy
by1mb3Itbm9uLWdsaWJjLXN5c3RlbXMucGF0Y2giCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZz
dW1dID0gIjJlNTk2ZmQzZmJlYWJiNzE1MzE2NjIyMjRlNzFmNmEyYzM3ZjY4NDQyNjEzNmQ2Mjg1
NDYyNzI3NmVmNGY2OTkiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJiMDcxOGRiMzI1
NDczMDcwMWI0M2JmNWUxMTNjYmY4Y2RiMmMxNDcxNWQzMmVlMWU4YTcwN2RjNmViNzA1MzVmIgog
CiBBTllfT0ZfRElTVFJPX0ZFQVRVUkVTID0gIiR7R1RLM0RJU1RST0ZFQVRVUkVTfSIKIAotLSAK
Mi40Ny4xCgo=

--===============8990519191110300394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/vte: SRC_URI changed from "https://download.gnome.org/sources//vte/0.80/vte-0.80.3.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch" to "https://download.gnome.org/sources//vte/0.82/vte-0.82.0.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
packages/x86-64-v3-poky-linux/vte: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte: PACKAGES: added "vte-locale-ia"
packages/x86-64-v3-poky-linux/vte/libvte-gtk4: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/libvte-gtk4: PKGSIZE changed from 873044 to 1152192 (+32%)
packages/x86-64-v3-poky-linux/vte/libvte-gtk4: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.8000.3", added "/usr/lib/libvte-2.91.so.0.8200.0"
packages/x86-64-v3-poky-linux/vte/libvte: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/libvte: PKGSIZE changed from 866423 to 1141475 (+32%)
packages/x86-64-v3-poky-linux/vte/libvte: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
Changes to packages/x86-64-v3-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.8000.3 to libvte-2.91.so.0.8200.0
  /usr/lib/libvte-2.91.so.0.8000.3 moved to /usr/lib/libvte-2.91.so.0.8200.0
packages/x86-64-v3-poky-linux/vte/vte-dbg: FILELIST: removed "/usr/lib/.debug/libvte-2.91.so.0.8000.3", added "/usr/lib/.debug/libvte-2.91.so.0.8200.0"
packages/x86-64-v3-poky-linux/vte/vte-dbg: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-dbg: PKGSIZE changed from 22525176 to 47271632 (+110%)
packages/x86-64-v3-poky-linux/vte/vte-dbg: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-dev: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-dev: PKGSIZE changed from 591518 to 608766 (+3%)
packages/x86-64-v3-poky-linux/vte/vte-dev: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-doc: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-doc: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-gtk4-dev: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-gtk4-dev: PKGSIZE changed from 570358 to 587606 (+3%)
packages/x86-64-v3-poky-linux/vte/vte-gtk4-dev: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-gtk4: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-gtk4: PKGSIZE changed from 125800 to 244584 (+94%)
packages/x86-64-v3-poky-linux/vte/vte-gtk4: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-ab: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-ab: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-am: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-am: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-an: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-an: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-ang: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-ang: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-ar: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-ar: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-as: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-as: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-ast: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-ast: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-az: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-az: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-be+latin: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-be+latin: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-be: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-be: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-bg: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-bg: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-bn-in: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-bn-in: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-bn: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-bn: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-bs: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-bs: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-ca+valencia: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-ca+valencia: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-ca: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-ca: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-ckb: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-ckb: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-cs: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-cs: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-cy: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-cy: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-da: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-da: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-de: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-de: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-dz: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-dz: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-el: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-el: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-en+shaw: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-en+shaw: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-en-ca: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-en-ca: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-en-gb: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-en-gb: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-eo: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-eo: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-es: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-es: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-et: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-et: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-eu: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-eu: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-fa: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-fa: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-fi: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-fi: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-fr: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-fr: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-fur: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-fur: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-ga: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-ga: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-gd: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-gd: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-gl: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-gl: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-gu: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-gu: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-he: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-he: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-hi: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-hi: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-hr: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-hr: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-hu: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-hu: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-id: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-id: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-is: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-is: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-it: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-it: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-ja: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-ja: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-ka: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-ka: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-kab: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-kab: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-kk: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-kk: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-kn: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-kn: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-ko: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-ko: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-ku: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-ku: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-ky: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-ky: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-li: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-li: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-lt: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-lt: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-lv: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-lv: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-mai: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-mai: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-mi: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-mi: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-mjw: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-mjw: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-mk: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-mk: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-ml: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-ml: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-mn: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-mn: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-mr: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-mr: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-ms: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-ms: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-nb: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-nb: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-nds: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-nds: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-ne: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-ne: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-nl: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-nl: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-nn: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-nn: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-oc: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-oc: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-or: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-or: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-pa: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-pa: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-pl: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-pl: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-pt-br: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-pt-br: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-pt: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-pt: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-ro: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-ro: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-ru: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-ru: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-rw: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-rw: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-si: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-si: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-sk: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-sk: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-sl: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-sl: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-sq: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-sq: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-sr+latin: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-sr+latin: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-sr: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-sr: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-sv: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-sv: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-ta: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-ta: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-te: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-te: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-tg: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-tg: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-th: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-th: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-tr: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-tr: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-ug: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-ug: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-uk: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-uk: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-uz+cyrillic: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-uz+cyrillic: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-uz: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-uz: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-vi: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-vi: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-wa: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-wa: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-xh: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-xh: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-zh-cn: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-zh-cn: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-zh-hk: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-zh-hk: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-locale-zh-tw: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-locale-zh-tw: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-prompt: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-prompt: PKGSIZE changed from 20409 to 20413 (+0%)
packages/x86-64-v3-poky-linux/vte/vte-prompt: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-src: FILELIST: directory renamed /usr/src/debug/vte/0.80.3/src/app -> /usr/src/debug/vte/0.82.0/src/app, directory renamed /usr/src/debug/vte/0.80.3/src/vte -> /usr/src/debug/vte/0.82.0/src/vte, removed "/usr/src/debug/vte/0.80.3/src/parser-cmd-handlers.hh /usr/src/debug/vte/0.80.3/src/vteresources.c /usr/src/debug/vte/0.80.3/src/parser-dcs.hh /usr/src/debug/vte/0.80.3/src/parser-csi.hh /usr/src/debug/vte/0.80.3/src/parser-cmd.hh /usr/src/debug/vte/0.80.3/src/parser-esc.hh /usr/src/debug/vte/0.80.3/src/minifont-coverage-gtk4.inc /usr/src/debug/vte/0.80.3/src/minifont-coverage-gtk3.inc /usr/src/debug/vte/0.80.3/src/modes-ecma.hh /usr/src/debug/vte/0.80.3/src/marshal.h /usr/src/debug/vte/0.80.3/src/modes-dec.hh /usr/src/debug/vte/0.80.3/src/vteresources-gtk4.cc.c /usr/src/debug/vte/0.80.3/src/marshal.c", added "/usr/src/debug/vte/0.82.0/src/parser-csi.hh /usr/src/debug/vte/0.82.0/src/parser-cmd-handlers.hh /usr/src/debug/vte/0.82.0/src/parser-dcs.h
 h /usr/src/debug/vte/0.82.0/subprojects/simdutf/simdutf.h /usr/src/debug/vte/0.82.0/src/parser-esc.hh /usr/src/debug/vte/0.82.0/src/vteresources.c /usr/src/debug/vte/0.82.0/src/minifont-coverage-gtk3.inc /usr/src/debug/vte/0.82.0/src/vteresources-gtk4.cc.c /usr/src/debug/vte/0.82.0/src/minifont-coverage-gtk4.inc /usr/src/debug/vte/0.82.0/src/modes-dec.hh /usr/src/debug/vte/0.82.0/src/marshal.h /usr/src/debug/vte/0.82.0/subprojects/simdutf/simdutf.cpp /usr/src/debug/vte/0.82.0/src/marshal.c /usr/src/debug/vte/0.82.0/src/modes-ecma.hh"
packages/x86-64-v3-poky-linux/vte/vte-src: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-src: PKGSIZE changed from 190156 to 1428770 (+651%)
packages/x86-64-v3-poky-linux/vte/vte-src: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte-staticdev: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte-staticdev: PKGV changed from 0.80.3 [default] to 0.82.0 [default]
packages/x86-64-v3-poky-linux/vte/vte: PV changed from "0.80.3" to "0.82.0"
packages/x86-64-v3-poky-linux/vte/vte: PKGSIZE changed from 135330 to 250018 (+85%)
packages/x86-64-v3-poky-linux/vte/vte: PKGV changed from 0.80.3 [default] to 0.82.0 [default]

--===============8990519191110300394==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vte-upgrade-0.80.3-0.82.0.patch"

RnJvbSBkM2ZjYzhkYTIxYTg0NjdiOWRkNGYyYTA5MGJkNTExMzZlMDcxMTVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMTE6NTQ6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dGU6IHVwZ3JhZGUgMC44MC4zIC0+IDAuODIuMAoKLS0tCiAuLi4vdnRlLzAwMDEtQWRkLVdfRVhJ
VENPREUtbWFjcm8tZm9yLW5vbi1nbGliYy1zeXN0ZW1zLnBhdGNoIHwgNCArKy0tCiBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC92dGUve3Z0ZV8wLjgwLjMuYmIgPT4gdnRlXzAuODIuMC5iYn0gICAgIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3t2dGVfMC44MC4zLmJiID0+IHZ0ZV8wLjgy
LjAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8w
MDAxLUFkZC1XX0VYSVRDT0RFLW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGUvMDAwMS1BZGQtV19FWElUQ09ERS1tYWNyby1mb3It
bm9uLWdsaWJjLXN5c3RlbXMucGF0Y2gKaW5kZXggZTJjZmY2Y2Y3Ni4uNjA0M2Y4MDQ1OSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZS8wMDAxLUFkZC1XX0VYSVRDT0RF
LW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC92dGUvdnRlLzAwMDEtQWRkLVdfRVhJVENPREUtbWFjcm8tZm9yLW5vbi1nbGliYy1zeXN0
ZW1zLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiODc5NWRkYTYyOTYxNGNkODQyZmNiYTFj
NGI1MGJlNzU5YzIwZGE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlODBjOGVlNTkx
ZjkxOTA2Mzg3ZWQ3YWZiMDNmMzIxMWI1ZTlmZTQwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogRGFuaWxvIFNwaW5lbGxhIDxkYW55c3Bpbjk3QHByb3Rvbm1haWwuY29tPgogRGF0ZTog
VGh1LCAyMSBNYXIgMjAxOSAxNDoxOToyNiArMDEwMAogU3ViamVjdDogW1BBVENIXSBBZGQgV19F
WElUQ09ERSBtYWNybyBmb3Igbm9uLWdsaWJjIHN5c3RlbXMKQEAgLTE2LDcgKzE2LDcgQEAgU2ln
bmVkLW9mZi1ieTogQW5kcmVhcyBNw7xsbGVyIDxzY2huaXR6ZWx0b255QGdtYWlsLmNvbT4KICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9zcmMvd2lkZ2V0
LmNjIGIvc3JjL3dpZGdldC5jYwotaW5kZXggYjhkYWE1Yy4uYzM1Nzk2MCAxMDA2NDQKK2luZGV4
IDc5NGVjODguLmU5MWVjNzAgMTAwNjQ0CiAtLS0gYS9zcmMvd2lkZ2V0LmNjCiArKysgYi9zcmMv
d2lkZ2V0LmNjCiBAQCAtMTYsNiArMTYsMTAgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L3Z0ZS92dGVfMC44MC4zLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8w
LjgyLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvdnRlL3Z0ZV8wLjgwLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0
ZS92dGVfMC44Mi4wLmJiCmluZGV4IDFlYjk1ZGQ4MjcuLjc1Yjg2MGE4MDUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC44MC4zLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L3Z0ZS92dGVfMC44Mi4wLmJiCkBAIC0xOSw3ICsxOSw3IEBAIGluaGVyaXQgZ25v
bWViYXNlIGdpLWRvY2dlbiBmZWF0dXJlc19jaGVjayB1cHN0cmVhbS12ZXJzaW9uLWlzLWV2ZW4g
Z29iamVjdC1pbnRyCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLUFkZC1XX0VYSVRDT0RFLW1h
Y3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1
NnN1bV0gPSAiMmU1OTZmZDNmYmVhYmI3MTUzMTY2MjIyNGU3MWY2YTJjMzdmNjg0NDI2MTM2ZDYy
ODU0NjI3Mjc2ZWY0ZjY5OSIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImIwNzE4ZGIz
MjU0NzMwNzAxYjQzYmY1ZTExM2NiZjhjZGIyYzE0NzE1ZDMyZWUxZThhNzA3ZGM2ZWI3MDUzNWYi
CiAKIEFOWV9PRl9ESVNUUk9fRkVBVFVSRVMgPSAiJHtHVEszRElTVFJPRkVBVFVSRVN9IgogCi0t
IAoyLjQ3LjEKCg==

--===============8990519191110300394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1940 targets, 51 skipped, 0 masked, 0 errors.
Removing 137 recipes from the qemux86_64 sysroot...done.
Removing 138 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-4f445f31d9a7da22f3d00ec8b6f50e2f92928366"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4f445f31d9a7da22f3d00ec8b6f50e2f92928366"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1080 Local 1055 Mirrors 0 Missed 25 Current 430 (97% match, 98% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 548 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 558 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 560 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_create_spdx_setscene)
NOTE: Running setscene task 563 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fastfloat/fastfloat_8.0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 568 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_create_spdx_setscene)
NOTE: Running setscene task 576 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 578 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 582 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 585 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.61.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 588 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 590 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 591 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx_setscene)
NOTE: Running setscene task 609 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 611 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 618 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe fastfloat-8.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.83-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.5-r0: task do_packagedata_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk4-4.18.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 619 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe fastfloat-8.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe librsvg-2.61.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 621 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 622 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.83-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 623 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fastfloat/fastfloat_8.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 624 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 626 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fastfloat/fastfloat_8.0.2.bb:do_packagedata_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk4-4.18.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 628 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 630 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 633 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 635 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 637 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.4.bb:do_create_spdx_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.61.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 639 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_packagedata_setscene)
NOTE: recipe fastfloat-8.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fastfloat-8.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.18.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.56.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 642 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_create_spdx_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_create_spdx_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 644 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_create_spdx_setscene)
NOTE: recipe gtk4-4.18.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 645 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 647 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fastfloat-8.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_populate_sysroot_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb:do_create_spdx_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.56.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 652 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx_setscene)
NOTE: recipe fastfloat-8.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 669 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 670 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 672 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fastfloat/fastfloat_8.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 677 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe tiff-4.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.56.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fastfloat-8.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.56.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fastfloat-8.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 681 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 683 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: Running setscene task 684 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 685 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_25.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-11.4.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 688 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 689 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_25.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 691 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 693 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 695 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 696 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_create_spdx_setscene)
NOTE: Running setscene task 720 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 724 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 734 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb:do_package_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-77-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 735 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 736 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 737 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 741 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 745 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 748 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 752 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 753 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.56.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.56.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 763 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_create_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 764 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 765 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 766 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 767 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 774 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.56.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.48-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 780 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 782 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_create_spdx_setscene)
NOTE: Running setscene task 793 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.5-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 801 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 803 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.56.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 809 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.56.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 816 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.56.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 819 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 822 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1581 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1639 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_fetch)
NOTE: Running task 1655 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 1656 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_recipe_qa)
NOTE: Running task 1667 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_write_config)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 823 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1710 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_write_config)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 1775 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk4-4.18.6-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe vte-0.82.0-r0: task do_recipe_qa: Started
NOTE: recipe gtk4-4.18.6-r0: task do_write_config: Started
NOTE: recipe gtk4-4.18.6-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1781 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_unpack)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe vte-0.82.0-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.18.6-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 828 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe vte-0.82.0-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.18.6-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 1787 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vte-0.82.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1788 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_fetch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vte-0.82.0-r0: task do_fetch: Started
NOTE: recipe vte-0.82.0-r0: task do_fetch: Succeeded
NOTE: Running task 1844 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_unpack)
NOTE: recipe vte-0.82.0-r0: task do_unpack: Started
NOTE: recipe vte-0.82.0-r0: task do_unpack: Succeeded
NOTE: Running task 1845 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_patch)
NOTE: recipe gtk4-4.18.6-r0: task do_unpack: Succeeded
NOTE: recipe vte-0.82.0-r0: task do_patch: Started
NOTE: Running task 1846 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_patch)
NOTE: recipe gtk4-4.18.6-r0: task do_patch: Started
NOTE: recipe vte-0.82.0-r0: task do_patch: Succeeded
NOTE: Running task 1847 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1848 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_populate_lic)
NOTE: recipe gtk4-4.18.6-r0: task do_patch: Succeeded
NOTE: recipe vte-0.82.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.82.0-r0: task do_populate_lic: Started
NOTE: recipe vte-0.82.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_populate_lic unihash changed to aad547ffd111ccf618028344aee6cb81bc2bbd757dd29485d000fe852054692c
NOTE: recipe vte-0.82.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 841 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 843 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 845 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: Running setscene task 846 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 847 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 848 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 849 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 850 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 852 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 853 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.61.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 854 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 855 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 856 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.61.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.83-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.83-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 857 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.61.0-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.61.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 860 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 861 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb:do_recipe_qa_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.83-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 867 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 868 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 869 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 870 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 875 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.83-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 877 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 878 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 879 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.61.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 881 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.61.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 882 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 883 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 884 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 886 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 887 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 889 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 892 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 894 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 895 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.89.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 896 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 897 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.89.0.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.83-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 898 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.61.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 899 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.83-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 900 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.89.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.89.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 903 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 907 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 909 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 910 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 913 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 914 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 915 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 917 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.61.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 918 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.89.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 919 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 920 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.56.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.61.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 921 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 922 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 923 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 924 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 926 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 929 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 930 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 931 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iso-codes-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 932 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.56.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 935 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 936 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 938 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 939 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 940 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 941 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 943 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 944 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 947 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 951 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 953 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 957 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.56.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 958 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.89.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 959 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 961 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 963 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 964 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 966 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 967 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 970 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.56.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 973 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 975 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 976 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 978 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 979 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 982 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 986 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 987 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/gstreamer1.0/1.26.5/temp/log.do_packagedata_setscene.2910287
NOTE: recipe mesa-2_25.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 988 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 990 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 992 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 993 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 994 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 996 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1000 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb:do_package_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_25.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1001 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1002 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.89.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1003 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1004 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1005 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1006 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1007 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1008 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1009 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1012 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1015 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.89.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.56.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_package_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1016 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-11.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1017 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.89.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-11.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.56.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1019 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1021 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1022 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1023 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1026 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1027 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1028 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1029 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1030 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1031 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1032 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1035 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1036 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1038 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1040 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1042 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1044 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_packagedata_setscene)
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1047 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata_setscene)
NOTE: Running setscene task 1048 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libclc-21.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1049 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1050 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libclc-21.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_25.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1051 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1053 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1054 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1057 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1058 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1059 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1063 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libclc-21.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1064 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1065 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1067 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1068 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1071 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1075 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1076 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1078 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1079 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libclc-21.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1082 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1086 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1087 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1088 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1089 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1091 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1095 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1096 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1099 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1100 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1101 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1102 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1103 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1104 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1105 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_packagedata_setscene)
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1109 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1110 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_packagedata_setscene)
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1111 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libclc-21.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1112 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1115 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1116 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1117 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libclc-21.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe clang-21.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1119 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1120 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1121 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1122 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1126 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-21.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1127 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1129 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1130 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1131 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1133 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1136 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_recipe_qa_setscene)
NOTE: recipe clang-21.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1138 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1140 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1143 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1144 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1147 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1148 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1150 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1151 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1152 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1153 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1156 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1157 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1159 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1162 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1163 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1166 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1168 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: Running task 1903 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1170 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1172 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2029 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running setscene task 1173 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1175 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running task 2030 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.48-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1177 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1178 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1179 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1181 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1183 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2204 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb:do_fetch)
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2238 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1186 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1187 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1189 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1191 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.5-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1192 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1194 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1195 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1196 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb:do_recipe_qa_setscene)
NOTE: Running task 2241 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb:do_unpack)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1198 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1199 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1200 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1201 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1203 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running setscene task 1204 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1205 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.5-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1206 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1207 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1209 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1210 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1211 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1214 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1215 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1217 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1218 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1222 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1223 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1224 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2253 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1231 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 1232 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1233 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1234 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1236 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1238 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1242 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1243 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1244 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1245 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1247 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2269 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1250 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.5-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1251 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 1253 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 1254 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/curl/8.15.0/temp/log.do_packagedata_setscene.2914517
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1255 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_package_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1257 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1258 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1259 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1260 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 1261 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1263 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1265 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1267 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1268 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1269 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe curl-8.15.0-r0: task do_package_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1273 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1275 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running task 2294 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1278 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1281 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1284 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1285 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1292 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1294 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1296 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1299 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1302 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1303 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1304 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1305 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1306 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1307 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1309 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1310 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1311 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1312 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1313 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1314 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1315 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1316 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1321 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1322 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1325 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.15.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1333 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1334 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1335 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe clang-21.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1337 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1339 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1340 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe clang-21.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe clang-21.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1345 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1347 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1348 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1351 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1352 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1353 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1356 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1357 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1358 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1359 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1360 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1361 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1362 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1363 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1365 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1367 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1369 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1370 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1371 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1372 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1373 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1374 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1375 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1378 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1379 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1380 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1383 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1384 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1386 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1388 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1389 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1390 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1392 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1395 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1396 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1397 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1399 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1402 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1405 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1406 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1407 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1408 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1410 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1412 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1414 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1416 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1417 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1418 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1419 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1420 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1421 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1422 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1424 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1426 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1427 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 1428 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1429 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1430 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1431 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1434 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1435 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1436 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1437 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1438 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1439 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1441 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1444 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1445 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1448 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1450 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1451 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1453 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1456 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1457 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1458 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1462 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1463 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1464 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1466 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1469 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1471 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1473 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1477 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1479 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1481 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running task 2624 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1483 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1484 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1485 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1486 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1488 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1490 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1491 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1492 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1497 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1500 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1501 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1502 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2690 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1505 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 7926fb138180c8dbd093d44bdd60f35bbf210be5180876250a5a1bb125e81a5e to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '509fecb11c4451898c6de890be9645fa823471e0b14fe21cfd3789f0840a9c5e', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '7926fb138180c8dbd093d44bdd60f35bbf210be5180876250a5a1bb125e81a5e'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 509fecb11c4451898c6de890be9645fa823471e0b14fe21cfd3789f0840a9c5e -> 7926fb138180c8dbd093d44bdd60f35bbf210be5180876250a5a1bb125e81a5e as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1507 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1509 of 1510 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3276 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3424 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe curl-8.15.0-r0: task do_packagedata: Started
NOTE: Running task 3797 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3811 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb:do_packagedata)
NOTE: Running task 4003 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.15.0-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b56557924a2f51d1c2bf9f435dbc817a7459e44001d90ee2c59bd6678c20a36a
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 7926fb138180c8dbd093d44bdd60f35bbf210be5180876250a5a1bb125e81a5e to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'a04192ffbaae793aa2a03caa0f0dd425c5d2ac8e6dd950b4e4c214287f997715', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '7926fb138180c8dbd093d44bdd60f35bbf210be5180876250a5a1bb125e81a5e'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed a04192ffbaae793aa2a03caa0f0dd425c5d2ac8e6dd950b4e4c214287f997715 -> 7926fb138180c8dbd093d44bdd60f35bbf210be5180876250a5a1bb125e81a5e as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_packagedata: Succeeded
NOTE: Running task 4098 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4099 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4100 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.5-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 4101 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 4102 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 4103 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 4104 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4105 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.18.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 4106 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe gtk4-4.18.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4107 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.18.6-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to 632b4f6bc1ab4cf53cd6be50850d47bebf632dc243b9e4e7187214f6019d6e85
NOTE: Setscene tasks completed
NOTE: Running task 4108 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 4109 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.18.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.18.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.18.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4110 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_compile)
NOTE: recipe gtk4-4.18.6-r0: task do_compile: Started
NOTE: recipe gtk4-4.18.6-r0: task do_compile: Succeeded
NOTE: Running task 4111 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_install)
NOTE: recipe gtk4-4.18.6-r0: task do_install: Started
NOTE: recipe gtk4-4.18.6-r0: task do_install: Succeeded
NOTE: Running task 4112 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_package)
NOTE: Running task 4113 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.18.6-r0: task do_package: Started
NOTE: recipe gtk4-4.18.6-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.18.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4114 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.82.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.82.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4115 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_configure)
NOTE: recipe vte-0.82.0-r0: task do_configure: Started
NOTE: recipe vte-0.82.0-r0: task do_configure: Succeeded
NOTE: Running task 4116 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_compile)
NOTE: recipe vte-0.82.0-r0: task do_compile: Started
NOTE: recipe gtk4-4.18.6-r0: task do_package: Succeeded
NOTE: Running task 4117 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_packagedata)
NOTE: recipe gtk4-4.18.6-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.18.6-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_packagedata unihash changed to 28d445fd18a8a715e3864b7344507d4af71c3feeda5c00f5dbfc4e6442f12cd0
NOTE: Setscene tasks completed
NOTE: Running task 4118 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_create_spdx)
NOTE: recipe gtk4-4.18.6-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.18.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 4119 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_collect_spdx_deps)
NOTE: recipe vte-0.82.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vte-0.82.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vte-0.82.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4120 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_install)
NOTE: recipe vte-0.82.0-r0: task do_install: Started
NOTE: recipe vte-0.82.0-r0: task do_install: Succeeded
NOTE: Running task 4121 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_package)
NOTE: Running task 4122 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_populate_sysroot)
NOTE: recipe vte-0.82.0-r0: task do_package: Started
NOTE: recipe vte-0.82.0-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.82.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.82.0-r0: task do_package: Succeeded
NOTE: Running task 4123 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_packagedata)
NOTE: recipe vte-0.82.0-r0: task do_packagedata: Started
NOTE: recipe vte-0.82.0-r0: task do_packagedata: Succeeded
NOTE: Running task 4124 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_create_spdx)
NOTE: Running task 4125 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_package_write_ipk)
NOTE: Running task 4126 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_package_write_deb)
NOTE: Running task 4127 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_package_write_rpm)
NOTE: recipe vte-0.82.0-r0: task do_create_spdx: Started
NOTE: Running task 4128 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_package_qa)
NOTE: recipe vte-0.82.0-r0: task do_package_write_ipk: Started
NOTE: recipe vte-0.82.0-r0: task do_package_write_deb: Started
NOTE: recipe vte-0.82.0-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.82.0-r0: task do_package_qa: Started
NOTE: recipe vte-0.82.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4129 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_create_package_spdx)
NOTE: recipe vte-0.82.0-r0: task do_create_package_spdx: Started
NOTE: recipe vte-0.82.0-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.82.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe vte-0.82.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe vte-0.82.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vte-0.82.0-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 4130 of 4130 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/vte/vte_0.82.0.bb:do_build)
NOTE: Tasks Summary: Attempted 4130 tasks of which 4066 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 63 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-src went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-dbg went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-ptest went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-staticdev went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-dev went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-doc went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-af went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ast went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-az went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-be went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-bg went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ca went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-cs went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-da went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-de went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-el went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-en-gb went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-eo went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-es went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-eu went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-fi went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-fr went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-fur went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-gl went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-hr went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-hu went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-id went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-it went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ja went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ka went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ko went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-lt went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-lv went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-nb went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-nl went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-pl went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-pt-br went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ro went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-ru went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-rw went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-sk went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-sl went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-sq went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-sr went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-sv went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-tr went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-uk went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-vi went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-zh-cn went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-locale-zh-tw went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0 went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-bash-completion went backwards which would break package feeds (from 0:1.26.6-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-1.26.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: curl-8.15.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:8.16.0-r0 to 0:8.15.0-r0) [version-going-backwards]
ERROR: curl-8.15.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:8.16.0-r0 to 0:8.15.0-r0) [version-going-backwards]
ERROR: curl-8.15.0-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:8.16.0-r0 to 0:8.15.0-r0) [version-going-backwards]
ERROR: curl-8.15.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-ptest went backwards which would break package feeds (from 0:8.16.0-r0 to 0:8.15.0-r0) [version-going-backwards]
ERROR: curl-8.15.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:8.16.0-r0 to 0:8.15.0-r0) [version-going-backwards]
ERROR: curl-8.15.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:8.16.0-r0 to 0:8.15.0-r0) [version-going-backwards]
ERROR: curl-8.15.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:8.16.0-r0 to 0:8.15.0-r0) [version-going-backwards]
ERROR: curl-8.15.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:8.16.0-r0 to 0:8.15.0-r0) [version-going-backwards]
ERROR: curl-8.15.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:8.16.0-r0 to 0:8.15.0-r0) [version-going-backwards]
ERROR: curl-8.15.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8990519191110300394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/vte: PACKAGES: added "vte-locale-ia"
packages/x86-64-v3-poky-linux/vte/libvte-gtk4: PKGSIZE changed from 873044 to 1152192 (+32%)
packages/x86-64-v3-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.8000.3", added "/usr/lib/libvte-2.91.so.0.8200.0"
packages/x86-64-v3-poky-linux/vte/libvte: PKGSIZE changed from 866423 to 1141475 (+32%)
Changes to packages/x86-64-v3-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.8000.3 to libvte-2.91.so.0.8200.0
  /usr/lib/libvte-2.91.so.0.8000.3 moved to /usr/lib/libvte-2.91.so.0.8200.0
packages/x86-64-v3-poky-linux/vte/vte-dbg: PKGSIZE changed from 22525176 to 47271632 (+110%)
packages/x86-64-v3-poky-linux/vte/vte-gtk4: PKGSIZE changed from 125800 to 244584 (+94%)
packages/x86-64-v3-poky-linux/vte/vte-src: PKGSIZE changed from 190156 to 1428770 (+651%)
packages/x86-64-v3-poky-linux/vte/vte: PKGSIZE changed from 135330 to 250018 (+85%)

--===============8990519191110300394==--

