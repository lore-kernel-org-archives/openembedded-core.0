Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA031C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:32 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.46760.1669908625001742040
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bpFw5+gu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010184ce4f7305-06d72aa9-80a0-49a3-ad41-121a926a8d6b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908624;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9y8W2O4R9dEWRPB8LrCfuP2Ztd1Pf9HTiLRP1WO+l/A=;
	b=bpFw5+gumlSzLEiN7fA7bh6eOtSQwf3wCh+C6JqZS3U3KJqlgCD2oBKpO3HYyJ7g
	Oi8+1lVYY7+9+eRrkPFGexuvjWrRIC5NQctfC9+33Uxd2K/qSugYx9Psn8wm4VJfVyS
	Ts9Jp0Q9Aaav0G7HaAAkeciGkscVgLmeqQyxPQk4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908624;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9y8W2O4R9dEWRPB8LrCfuP2Ztd1Pf9HTiLRP1WO+l/A=;
	b=RaUFZuyXo8v8h++vVIOlDkd+xegpa6On7vLg04V0iGMbzTciNiFzvPgi18DBpgGj
	xQKgwYTIYdTQ1KOuzfeX0E3LWxosh5gWGOWppTNaRlJSewvscnxOX3fy/VMDHJyNBsv
	iE7m5sYbo2WNmqZW91ALkvPsRCPgjjBUCIgMhc6A=
Content-Type: multipart/mixed; boundary="===============8940836642260272399=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pciutils: upgrading to 3.9.0 SUCCEEDED
Message-ID: <01010184ce4f7305-06d72aa9-80a0-49a3-ad41-121a926a8d6b-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174121

--===============8940836642260272399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pciutils* to *3.9.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pciutils-upgrade-3.8.0-3.9.0.patch
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
--===============8940836642260272399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pciutils: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/pciutils: SRC_URI changed from "https://cdn.kernel.org/pub/software/utils/pciutils/pciutils-3.8.0.tar.xz file://configure.patch" to "https://cdn.kernel.org/pub/software/utils/pciutils/pciutils-3.9.0.tar.xz file://configure.patch"
packages/core2-32-poky-linux/pciutils: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/pciutils/libpci: PKGSIZE changed from 63203 to 71523 (+13%)
packages/core2-32-poky-linux/pciutils/libpci: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/pciutils/libpci: FILELIST: removed "/usr/lib/libpci.so.3.8.0", added "/usr/lib/libpci.so.3.9.0"
packages/core2-32-poky-linux/pciutils/libpci: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/pciutils/pciutils-dbg: PKGSIZE changed from 445708 to 479588 (+8%)
packages/core2-32-poky-linux/pciutils/pciutils-dbg: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/pciutils/pciutils-dbg: FILELIST: removed "/usr/lib/.debug/libpci.so.3.8.0", added "/usr/lib/.debug/libpci.so.3.9.0"
packages/core2-32-poky-linux/pciutils/pciutils-dbg: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/pciutils/pciutils-dev: PKGSIZE changed from 91407 to 98810 (+8%)
packages/core2-32-poky-linux/pciutils/pciutils-dev: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/pciutils/pciutils-dev: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/pciutils/pciutils-doc: PKGSIZE changed from 26078 to 28911 (+11%)
packages/core2-32-poky-linux/pciutils/pciutils-doc: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/pciutils/pciutils-doc: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/pciutils/pciutils-ids: PKGSIZE changed from 302559 to 308957 (+2%)
packages/core2-32-poky-linux/pciutils/pciutils-ids: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/pciutils/pciutils-ids: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/pciutils/pciutils-locale: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/pciutils/pciutils-locale: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/pciutils/pciutils-src: PKGSIZE changed from 292763 to 320917 (+10%)
packages/core2-32-poky-linux/pciutils/pciutils-src: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/pciutils/pciutils-src: FILELIST: directory renamed /usr/src/debug/pciutils/3.8.0-r0 -> /usr/src/debug/pciutils/3.9.0-r0, removed "/usr/src/debug/pciutils/3.8.0-r0/lib/names-parse.c /usr/src/debug/pciutils/3.8.0-r0/lib/proc.c /usr/src/debug/pciutils/3.8.0-r0/lib/dump.c /usr/src/debug/pciutils/3.8.0-r0/lib/names-net.c /usr/src/debug/pciutils/3.8.0-r0/lib/generic.c /usr/src/debug/pciutils/3.8.0-r0/lib/init.c /usr/src/debug/pciutils/3.8.0-r0/lib/internal.h /usr/src/debug/pciutils/3.8.0-r0/lib/names-hash.c /usr/src/debug/pciutils/3.8.0-r0/lib/access.c /usr/src/debug/pciutils/3.8.0-r0/lib/i386-ports.c /usr/src/debug/pciutils/3.8.0-r0/lib/names.h /usr/src/debug/pciutils/3.8.0-r0/lib/filter.c /usr/src/debug/pciutils/3.8.0-r0/lib/names-hwdb.c /usr/src/debug/pciutils/3.8.0-r0/lib/i386-io-linux.h /usr/src/debug/pciutils/3.8.0-r0/lib/names-cache.c /usr/src/debug/pciutils/3.8.0-r0/lib/names.c /usr/src/debug/pciutils/3.8.0-r0/lib/pci.h /usr/src/debug/pciutils/3.8.0-r0/
 lib/sysdep.h /usr/src/debug/pciutils/3.8.0-r0/lib/params.c /usr/src/debug/pciutils/3.8.0-r0/lib/sysfs.c /usr/src/debug/pciutils/3.8.0-r0/lib/caps.c /usr/src/debug/pciutils/3.8.0-r0/lib/types.h", added "/usr/src/debug/pciutils/3.9.0-r0/lib/init.c /usr/src/debug/pciutils/3.9.0-r0/lib/names-parse.c /usr/src/debug/pciutils/3.9.0-r0/lib/types.h /usr/src/debug/pciutils/3.9.0-r0/lib/pci.h /usr/src/debug/pciutils/3.9.0-r0/lib/names-cache.c /usr/src/debug/pciutils/3.9.0-r0/lib/sysfs.c /usr/src/debug/pciutils/3.9.0-r0/lib/names.c /usr/src/debug/pciutils/3.9.0-r0/lib/generic.c /usr/src/debug/pciutils/3.9.0-r0/lib/i386-io-linux.h /usr/src/debug/pciutils/3.9.0-r0/lib/sysdep.h /usr/src/debug/pciutils/3.9.0-r0/lib/names-net.c /usr/src/debug/pciutils/3.9.0-r0/lib/mmio-ports.c /usr/src/debug/pciutils/3.9.0-r0/lib/caps.c /usr/src/debug/pciutils/3.9.0-r0/lib/access.c /usr/src/debug/pciutils/3.9.0-r0/lib/internal.h /usr/src/debug/pciutils/3.9.0-r0/lib/dump.c /usr/src/debug/pciutils/3.9.0-r0/lib/names-h
 wdb.c /usr/src/debug/pciutils/3.9.0-r0/lib/proc.c /usr/src/debug/pciutils/3.9.0-r0/lib/names.h /usr/src/debug/pciutils/3.9.0-r0/lib/params.c /usr/src/debug/pciutils/3.9.0-r0/lib/filter.c /usr/src/debug/pciutils/3.9.0-r0/lib/i386-ports.c /usr/src/debug/pciutils/3.9.0-r0/lib/names-hash.c"
packages/core2-32-poky-linux/pciutils/pciutils-src: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/pciutils/pciutils-staticdev: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/pciutils/pciutils-staticdev: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/pciutils/pciutils: PKGSIZE changed from 141571 to 149763 (+6%)
packages/core2-32-poky-linux/pciutils/pciutils: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/pciutils/pciutils: PV changed from "3.8.0" to "3.9.0"
Changes to packages/core2-32-poky-linux/pciutils (sysroot):
  /usr/lib/libpci.so.3 changed symlink target from libpci.so.3.8.0 to libpci.so.3.9.0
  /usr/lib/libpci.so.3.8.0 moved to /usr/lib/libpci.so.3.9.0

--===============8940836642260272399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/pciutils/libpci: PKGSIZE changed from 63203 to 71523 (+13%)
packages/core2-32-poky-linux/pciutils/libpci: FILELIST: removed "/usr/lib/libpci.so.3.8.0", added "/usr/lib/libpci.so.3.9.0"
packages/core2-32-poky-linux/pciutils/pciutils-doc: PKGSIZE changed from 26078 to 28911 (+11%)
Changes to packages/core2-32-poky-linux/pciutils (sysroot):
  /usr/lib/libpci.so.3 changed symlink target from libpci.so.3.8.0 to libpci.so.3.9.0
  /usr/lib/libpci.so.3.8.0 moved to /usr/lib/libpci.so.3.9.0

--===============8940836642260272399==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pciutils-upgrade-3.8.0-3.9.0.patch"

RnJvbSA4ZTJjMWQ5MWVlZDdlMjY0MjU5NmZlODhjNGU5MWEwMjAyNWMzMWEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAwNjoxNjowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBj
aXV0aWxzOiB1cGdyYWRlIDMuOC4wIC0+IDMuOS4wCgotLS0KIG1ldGEvcmVjaXBlcy1ic3AvcGNp
dXRpbHMvcGNpdXRpbHMvY29uZmlndXJlLnBhdGNoICAgfCAxMiArKysrKystLS0tLS0KIC4uLi97
cGNpdXRpbHNfMy44LjAuYmIgPT4gcGNpdXRpbHNfMy45LjAuYmJ9ICAgICAgICAgfCAgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWJzcC9wY2l1dGlscy97cGNpdXRpbHNfMy44LjAuYmIgPT4gcGNpdXRpbHNf
My45LjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWJzcC9wY2l1dGlscy9w
Y2l1dGlscy9jb25maWd1cmUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtYnNwL3BjaXV0aWxzL3BjaXV0
aWxzL2NvbmZpZ3VyZS5wYXRjaAppbmRleCBjZjU1Yjk0ODA4Li42ODYwYWEyZGQxIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtYnNwL3BjaXV0aWxzL3BjaXV0aWxzL2NvbmZpZ3VyZS5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtYnNwL3BjaXV0aWxzL3BjaXV0aWxzL2NvbmZpZ3VyZS5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gNTAyYzAxZTE4MGQ5MDg1ZmNiZWFmMmZiNDYyMzk5OTljNGYz
MzVkMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTJiNWU5OTExZWJhODA4MDRiMjNl
MDZhMzZmZTk4MmI0Nzc3NGZiMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hh
cmQgUHVyZGllIDxycHVyZGllQGxpbnV4LmludGVsLmNvbT4KIERhdGU6IFdlZCwgMzEgRGVjIDIw
MDggMTc6MjA6MzggKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gcGNpdXRpbHM6IFVwZ2FyZGUgMi4y
LjQgLT4gMy4wLjMKQEAgLTI0LDIwICsyNCwyMCBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9w
cmlhdGUgW2VtYmVkZGVkIHNwZWNpZmljXQogIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUK
LWluZGV4IDkzMTliYjQuLjc4YTJkNTQgMTAwNjQ0CitpbmRleCAzZGYwNzZkLi45YjI0N2QzIDEw
MDY0NAogLS0tIGEvTWFrZWZpbGUKICsrKyBiL01ha2VmaWxlCi1AQCAtMTA4LDcgKzEwOCw3IEBA
IGV4YW1wbGUkKEVYRUVYVCk6IGV4YW1wbGUubyBsaWIvJChQQ0lMSUIpCitAQCAtMTEwLDcgKzEx
MCw3IEBAIGV4YW1wbGUkKEVYRUVYVCk6IGV4YW1wbGUubyBsaWIvJChQQ0lJTVBMSUIpCiAgZXhh
bXBsZS5vOiBleGFtcGxlLmMgJChQQ0lJTkMpCiAgCiAgJSQoRVhFRVhUKTogJS5vCiAtCSQoQ0Mp
ICQoTERGTEFHUykgJChUQVJHRVRfQVJDSCkgJF4gJChMRExJQlMpIC1vICRACiArCSQoQ0MpICQo
TERGTEFHUykgJChUQVJHRVRfQVJDSCkgJF4gJChMSUJfTERMSUJTKSAkKExETElCUykgLW8gJEAK
ICAKLSAlLjggJS43ICUuNTogJS5tYW4KLSAJTT1gZWNobyAkKERBVEUpIHwgc2VkICdzLy0wMS0v
LUphbnVhcnktLztzLy0wMi0vLUZlYnJ1YXJ5LS87cy8tMDMtLy1NYXJjaC0vO3MvLTA0LS8tQXBy
aWwtLztzLy0wNS0vLU1heS0vO3MvLTA2LS8tSnVuZS0vO3MvLTA3LS8tSnVseS0vO3MvLTA4LS8t
QXVndXN0LS87cy8tMDktLy1TZXB0ZW1iZXItLztzLy0xMC0vLU9jdG9iZXItLztzLy0xMS0vLU5v
dmVtYmVyLS87cy8tMTItLy1EZWNlbWJlci0vO3MvXCguKlwpLVwoLipcKS1cKC4qXCkvXDMgXDIg
XDEvJ2AgOyBzZWQgPCQ8ID4kQCAicy9AVE9EQVlALyQkTS87cy9AVkVSU0lPTkAvcGNpdXRpbHMt
JChWRVJTSU9OKS87cyNASURTRElSQCMkKElEU0RJUikjO3MjQFBDSV9JRFNAIyQoUENJX0lEUykj
IgorIGlmZGVmIFBDSV9PU19XSU5ET1dTCisgY29tbWEgOj0gLAogZGlmZiAtLWdpdCBhL2xpYi9j
b25maWd1cmUgYi9saWIvY29uZmlndXJlCi1pbmRleCA0NWE0MTZhLi4xYWZkYWE2IDEwMDc1NQor
aW5kZXggNTdiMDY0Yi4uYjI2OTMzMiAxMDA3NTUKIC0tLSBhL2xpYi9jb25maWd1cmUKICsrKyBi
L2xpYi9jb25maWd1cmUKIEBAIC05LDYgKzksMTAgQEAgZWNob19uKCkgewpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWJzcC9wY2l1dGlscy9wY2l1dGlsc18zLjguMC5iYiBiL21ldGEvcmVjaXBl
cy1ic3AvcGNpdXRpbHMvcGNpdXRpbHNfMy45LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWJzcC9wY2l1dGlscy9wY2l1dGlsc18zLjguMC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWJzcC9wY2l1dGlscy9wY2l1dGlsc18zLjkuMC5iYgppbmRleCA0
ZjU3MzQyZTFlLi5mOWZlN2FhNzZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL3BjaXV0
aWxzL3BjaXV0aWxzXzMuOC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ic3AvcGNpdXRpbHMvcGNp
dXRpbHNfMy45LjAuYmIKQEAgLTE0LDcgKzE0LDcgQEAgREVQRU5EUyA9ICJ6bGliIGttb2QgbWFr
ZS1uYXRpdmUiCiBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vc29mdHdhcmUvdXRpbHMv
cGNpdXRpbHMvcGNpdXRpbHMtJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovL2NvbmZp
Z3VyZS5wYXRjaCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjkxZWRiZDA0MjlhODQ3MDVjOWFk
MTU2ZDRmZjM4Y2NjNzI0ZDQxZWE1NGM0YzViODhlMzhlOTk2ZjhhMzRmMDUiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiY2RlYTdhZTk3MjM5ZGVlMjMyNDlhMDljNjhhMTlhMjg3YTNmMTA5ZmJlYjJj
MjMyZWJiNjE2Y2IzODU5OTAxMiIKIAogaW5oZXJpdCBtdWx0aWxpYl9oZWFkZXIgcGtnY29uZmln
IHVwZGF0ZS1hbHRlcm5hdGl2ZXMKIAotLSAKMi4zMS4xCgo=

--===============8940836642260272399==--

