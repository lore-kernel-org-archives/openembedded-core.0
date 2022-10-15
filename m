Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EA9C677C4
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:21 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.24350.1665871392812409001
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cGQYliin;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010183ddac2bdf-98e77225-6bff-450c-a97d-44985ffb531d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pAuoTFJ0Anfr3a7nbPb0+GtcNIYK7KkkOoRH/BIlc8E=;
	b=cGQYliinTFIeVZZ6dym5+ah71I7OJvnC0P7eqDueFW20h8ENhzP504rvENU+ctyD
	m4+7U64N8qzeYjGKH22YIeDKv0cyXbX/nZF6bmtgbaoMySgBJlGk0t3Ypcgv/lICS2E
	nb4iW5+WRzJ8Rd+vZyOSMSs1y6OH2hrsR1FbCyTA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pAuoTFJ0Anfr3a7nbPb0+GtcNIYK7KkkOoRH/BIlc8E=;
	b=iZWMtDydWnOry/JEAQBw/JiFaHEEPR9dciL4ij5FYnv0TcBciHy/jcIiSsRA9YfW
	0KQFXd7NpwaVjryJdE74KLnhmB9IaqCfoItpT3BYb5ciPYetPOsD8LLisqzKPn6gU8K
	HCufmh2ei3Kx26GiuvZpZXkCAf8hGP5kISBltd38=
Content-Type: multipart/mixed; boundary="===============8864456986117484646=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dbus: upgrading to 1.14.4 SUCCEEDED
Message-ID: <01010183ddac2bdf-98e77225-6bff-450c-a97d-44985ffb531d-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171750

--===============8864456986117484646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dbus* to *1.14.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dbus-upgrade-1.14.0-1.14.4.patch
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
--===============8864456986117484646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/dbus/dbus-lib: FILELIST: removed "/usr/lib/libdbus-1.so.3.32.0", added "/usr/lib/libdbus-1.so.3.32.1"
packages/core2-32-poky-linux/dbus/dbus-ptest: FILELIST: added "/usr/libexec/installed-tests/dbus/data/invalid-messages/zero-length-variant-sig.message-raw.hex /usr/libexec/installed-tests/dbus/data/invalid-messages/mis-nested-sig.message-raw.hex /usr/libexec/installed-tests/dbus/data/valid-messages/minimal.message-raw.hex /usr/libexec/installed-tests/dbus/data/invalid-messages/mis-nested-sig.message-raw /usr/libexec/installed-tests/dbus/data/invalid-messages/truncated-variant-sig.message-raw.hex /usr/libexec/installed-tests/dbus/data/valid-messages/byteswap-fd-index.message-raw.hex /usr/libexec/installed-tests/dbus/data/invalid-messages/fixed-array-not-divisible.message-raw /usr/libexec/installed-tests/dbus/data/valid-messages/minimal.message-raw /usr/libexec/installed-tests/dbus/data/invalid-messages/truncated-variant-sig.message-raw /usr/libexec/installed-tests/dbus/data/invalid-messages/zero-length-variant-sig.message-raw /usr/libexec/installed-tests/dbus/data/invalid-messages/fix
 ed-array-not-divisible.message-raw.hex /usr/libexec/installed-tests/dbus/data/invalid-messages/issue418.message-raw /usr/libexec/installed-tests/dbus/data/invalid-messages/issue418.message-raw.hex /usr/libexec/installed-tests/dbus/data/valid-messages/byteswap-fd-index.message-raw"
Changes to packages/core2-32-poky-linux/dbus (sysroot):
  /usr/lib/libdbus-1.so.3 changed symlink target from libdbus-1.so.3.32.0 to libdbus-1.so.3.32.1
  /usr/lib/libdbus-1.so changed symlink target from libdbus-1.so.3.32.0 to libdbus-1.so.3.32.1
  /usr/lib/libdbus-1.so.3.32.0 moved to /usr/lib/libdbus-1.so.3.32.1

--===============8864456986117484646==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dbus-upgrade-1.14.0-1.14.4.patch"

RnJvbSA0YWQ0ZWVlZDgxMzk1YmY0NGI1MzZmM2JlYzU2YWRlNTM3MzdkZmI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMDc6MTY6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
YnVzOiB1cGdyYWRlIDEuMTQuMCAtPiAxLjE0LjQKCi0tLQogLi4uL2RidXMve2RidXNfMS4xNC4w
LmJiID0+IGRidXNfMS4xNC40LmJifSAgIHwgMjYgKysrKysrKysrKysrKysrKy0tLQogMSBmaWxl
IGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWNvcmUvZGJ1cy97ZGJ1c18xLjE0LjAuYmIgPT4gZGJ1c18xLjE0LjQuYmJ9ICg4OCUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZGJ1cy9kYnVzXzEuMTQuMC5iYiBiL21l
dGEvcmVjaXBlcy1jb3JlL2RidXMvZGJ1c18xLjE0LjQuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvZGJ1cy9kYnVzXzEuMTQuMC5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWNvcmUvZGJ1cy9kYnVzXzEuMTQuNC5iYgppbmRleCAwMDQ2YjlmZGEy
Li41MDUzZGMwNGRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9kYnVzL2RidXNfMS4x
NC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2RidXMvZGJ1c18xLjE0LjQuYmIKQEAgLTEs
MyArMSwyMiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVl
biB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBk
aWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBs
ZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRo
ZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicg
dGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRl
ZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcKKyMgKysrIENPUFlJTkcK
KyMgQEAgLTEsNCArMSw0IEBACisjIC1ELUJ1cyBpcyBsaWNlbnNlZCB0byB5b3UgdW5kZXIgeW91
ciBjaG9pY2Ugb2YgdGhlIEFjYWRlbWljIEZyZWUKKyMgK2RidXMgaXMgbGljZW5zZWQgdG8geW91
IHVuZGVyIHlvdXIgY2hvaWNlIG9mIHRoZSBBY2FkZW1pYyBGcmVlCisjICBMaWNlbnNlIHZlcnNp
b24gMi4xLCBvciB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgdmVyc2lvbiAyCisjICAo
b3IsIGF0IHlvdXIgb3B0aW9uIGFueSBsYXRlciB2ZXJzaW9uKS4KKyMgIAorIyAKKyMKKwogU1VN
TUFSWSA9ICJELUJ1cyBtZXNzYWdlIGJ1cyIKIERFU0NSSVBUSU9OID0gIkQtQnVzIGlzIGEgbWVz
c2FnZSBidXMgc3lzdGVtLCBhIHNpbXBsZSB3YXkgZm9yIGFwcGxpY2F0aW9ucyB0byB0YWxrIHRv
IG9uZSBhbm90aGVyLiBJbiBhZGRpdGlvbiB0byBpbnRlcnByb2Nlc3MgY29tbXVuaWNhdGlvbiwg
RC1CdXMgaGVscHMgY29vcmRpbmF0ZSBwcm9jZXNzIGxpZmVjeWNsZTsgaXQgbWFrZXMgaXQgc2lt
cGxlIGFuZCByZWxpYWJsZSB0byBjb2RlIGEgXCJzaW5nbGUgaW5zdGFuY2VcIiBhcHBsaWNhdGlv
biBvciBkYWVtb24sIGFuZCB0byBsYXVuY2ggYXBwbGljYXRpb25zIGFuZCBkYWVtb25zIG9uIGRl
bWFuZCB3aGVuIHRoZWlyIHNlcnZpY2VzIGFyZSBuZWVkZWQuIgogSE9NRVBBR0UgPSAiaHR0cHM6
Ly9kYnVzLmZyZWVkZXNrdG9wLm9yZyIKQEAgLTYsOCArMjUsOSBAQCBTRUNUSU9OID0gImJhc2Ui
CiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcgZ2V0dGV4dCB1cHN0cmVhbS12ZXJzaW9uLWlz
LWV2ZW4gcHRlc3QtZ25vbWUKIAogTElDRU5TRSA9ICJBRkwtMi4xIHwgR1BMLTIuMC1vci1sYXRl
ciIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTEwZGRlZDNiNTgxNDhm
M2YxZmQ4MDRiMjYzNTRhZjNlIFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL2RidXMvZGJ1
cy5oO2JlZ2lubGluZT02O2VuZGxpbmU9MjA7bWQ1PTg2NjczOTgzN2NjZDgzNTM1MGFmOTRkY2Nk
NjQ1N2Q4IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NjQyM2RjZDc0
ZDdiZTk3MTViMGRiMjQ3ZmQ4ODlkYTMgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vZGJ1
cy9kYnVzLmg7YmVnaW5saW5lPTY7ZW5kbGluZT0yMDttZDU9ODY2NzM5ODM3Y2NkODM1MzUwYWY5
NGRjY2Q2NDU3ZDggXAorICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6
Ly9kYnVzLmZyZWVkZXNrdG9wLm9yZy9yZWxlYXNlcy9kYnVzL2RidXMtJHtQVn0udGFyLnh6IFwK
ICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCkBAIC0xNSw3ICszNSw3IEBAIFNSQ19VUkkg
PSAiaHR0cHM6Ly9kYnVzLmZyZWVkZXNrdG9wLm9yZy9yZWxlYXNlcy9kYnVzL2RidXMtJHtQVn0u
dGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovL2RidXMtMS5pbml0IFwKICIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImNjZDdjY2UzNzU5NmUwYTE5NTU4ZmQ2NjQ4ZDEyNzJhYjQzZjAxMWQ4MGM4
NjM1YWVhOGZkMGJhZDU4YWViZDQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2MwZjliOGU1ZWMw
ZmYyNDc5MzgzZTYyYzAwODRhM2EyOWFmOTllZGYxNTE0ZTlmNjU5YjgxYjMwZDRlMzUzZSIKIAog
RVhUUkFfT0VDT05GID0gIi0tZGlzYWJsZS14bWwtZG9jcyBcCiAgICAgICAgICAgICAgICAgLS1k
aXNhYmxlLWRveHlnZW4tZG9jcyBcCi0tIAoyLjMxLjEKCg==

--===============8864456986117484646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dbus/dbus-common: PKGV changed from 1.14.0 [default] to 1.14.4 [default]
packages/core2-32-poky-linux/dbus/dbus-common: PV changed from "1.14.0" to "1.14.4"
packages/core2-32-poky-linux/dbus/dbus-dbg: PKGV changed from 1.14.0 [default] to 1.14.4 [default]
packages/core2-32-poky-linux/dbus/dbus-dbg: PV changed from "1.14.0" to "1.14.4"
packages/core2-32-poky-linux/dbus/dbus-dbg: FILELIST: removed "/usr/lib/.debug/libdbus-1.so.3.32.0", added "/usr/lib/.debug/libdbus-1.so.3.32.1"
packages/core2-32-poky-linux/dbus/dbus-dbg: PKGSIZE changed from 7184180 to 7240268 (+1%)
packages/core2-32-poky-linux/dbus/dbus-dev: PKGV changed from 1.14.0 [default] to 1.14.4 [default]
packages/core2-32-poky-linux/dbus/dbus-dev: PV changed from "1.14.0" to "1.14.4"
packages/core2-32-poky-linux/dbus/dbus-dev: PKGSIZE changed from 154794 to 155003 (+0%)
packages/core2-32-poky-linux/dbus/dbus-doc: PKGV changed from 1.14.0 [default] to 1.14.4 [default]
packages/core2-32-poky-linux/dbus/dbus-doc: PV changed from "1.14.0" to "1.14.4"
packages/core2-32-poky-linux/dbus/dbus-lib: PKGV changed from 1.14.0 [default] to 1.14.4 [default]
packages/core2-32-poky-linux/dbus/dbus-lib: PV changed from "1.14.0" to "1.14.4"
packages/core2-32-poky-linux/dbus/dbus-lib: FILELIST: removed "/usr/lib/libdbus-1.so.3.32.0", added "/usr/lib/libdbus-1.so.3.32.1"
packages/core2-32-poky-linux/dbus/dbus-lib: PKGSIZE changed from 645315 to 649411 (+1%)
packages/core2-32-poky-linux/dbus/dbus-locale: PKGV changed from 1.14.0 [default] to 1.14.4 [default]
packages/core2-32-poky-linux/dbus/dbus-locale: PV changed from "1.14.0" to "1.14.4"
packages/core2-32-poky-linux/dbus/dbus-ptest: PKGV changed from 1.14.0 [default] to 1.14.4 [default]
packages/core2-32-poky-linux/dbus/dbus-ptest: PV changed from "1.14.0" to "1.14.4"
packages/core2-32-poky-linux/dbus/dbus-ptest: FILELIST: added "/usr/libexec/installed-tests/dbus/data/invalid-messages/truncated-variant-sig.message-raw.hex /usr/libexec/installed-tests/dbus/data/valid-messages/byteswap-fd-index.message-raw /usr/libexec/installed-tests/dbus/data/invalid-messages/zero-length-variant-sig.message-raw.hex /usr/libexec/installed-tests/dbus/data/invalid-messages/fixed-array-not-divisible.message-raw /usr/libexec/installed-tests/dbus/data/valid-messages/minimal.message-raw.hex /usr/libexec/installed-tests/dbus/data/invalid-messages/issue418.message-raw /usr/libexec/installed-tests/dbus/data/valid-messages/byteswap-fd-index.message-raw.hex /usr/libexec/installed-tests/dbus/data/invalid-messages/mis-nested-sig.message-raw.hex /usr/libexec/installed-tests/dbus/data/invalid-messages/mis-nested-sig.message-raw /usr/libexec/installed-tests/dbus/data/invalid-messages/fixed-array-not-divisible.message-raw.hex /usr/libexec/installed-tests/dbus/data/valid-messages/mi
 nimal.message-raw /usr/libexec/installed-tests/dbus/data/invalid-messages/truncated-variant-sig.message-raw /usr/libexec/installed-tests/dbus/data/invalid-messages/zero-length-variant-sig.message-raw /usr/libexec/installed-tests/dbus/data/invalid-messages/issue418.message-raw.hex"
packages/core2-32-poky-linux/dbus/dbus-ptest: PKGSIZE changed from 3545916 to 3582925 (+1%)
packages/core2-32-poky-linux/dbus/dbus-src: PKGV changed from 1.14.0 [default] to 1.14.4 [default]
packages/core2-32-poky-linux/dbus/dbus-src: PV changed from "1.14.0" to "1.14.4"
packages/core2-32-poky-linux/dbus/dbus-src: PKGSIZE changed from 4331669 to 4343015 (+0%)
packages/core2-32-poky-linux/dbus/dbus-staticdev: PKGV changed from 1.14.0 [default] to 1.14.4 [default]
packages/core2-32-poky-linux/dbus/dbus-staticdev: PV changed from "1.14.0" to "1.14.4"
packages/core2-32-poky-linux/dbus/dbus-tools: PKGV changed from 1.14.0 [default] to 1.14.4 [default]
packages/core2-32-poky-linux/dbus/dbus-tools: PV changed from "1.14.0" to "1.14.4"
packages/core2-32-poky-linux/dbus/dbus: PKGV changed from 1.14.0 [default] to 1.14.4 [default]
packages/core2-32-poky-linux/dbus/dbus: PV changed from "1.14.0" to "1.14.4"
packages/core2-32-poky-linux/dbus: PV changed from "1.14.0" to "1.14.4"
packages/core2-32-poky-linux/dbus: SRC_URI changed from "https://dbus.freedesktop.org/releases/dbus/dbus-1.14.0.tar.xz file://run-ptest file://tmpdir.patch file://dbus-1.init" to "https://dbus.freedesktop.org/releases/dbus/dbus-1.14.4.tar.xz file://run-ptest file://tmpdir.patch file://dbus-1.init"
packages/core2-32-poky-linux/dbus: PKGV changed from 1.14.0 [default] to 1.14.4 [default]
Changes to packages/core2-32-poky-linux/dbus (sysroot):
  /usr/lib/libdbus-1.so.3 changed symlink target from libdbus-1.so.3.32.0 to libdbus-1.so.3.32.1
  /usr/lib/libdbus-1.so changed symlink target from libdbus-1.so.3.32.0 to libdbus-1.so.3.32.1
  /usr/lib/libdbus-1.so.3.32.0 moved to /usr/lib/libdbus-1.so.3.32.1

--===============8864456986117484646==--

