Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FDA6C44508
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 05:30:07 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4505.1783920597800634520
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 22:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Sq6Yy5sq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wZ9svj70;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f59f41722-f4eab664-8c64-4b8f-86a0-51876fdcb346-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783920596;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=azYLzeWVr+dGtcnMDomKjvirJURftfMcTa8Zcg7I+kc=;
	b=Sq6Yy5sq/tlJnNWiPQuzo3GkpbqDJlgWu0mVC9aH1LHOfEH3qxRZ7zMG+TsWAPbz
	IO5GrWNb1/IKdv43W/QgyqonEYKZsGDJ6wt/T3dNSb31T4+5misdUsvXGQSc8hZZTkX
	YSASpSGSHeGN29NakjsjFBwSHv3fVZ+KiwyAjgqs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783920596;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=azYLzeWVr+dGtcnMDomKjvirJURftfMcTa8Zcg7I+kc=;
	b=wZ9svj709d9oXZozb/5ZIjRtbcFqGzh3aJHE3XjWUOQ0/xgb/SFVaIeHGwvIqbmD
	W9d9dR7eed03YVM90XKgrnCOZopiD6eZDlcJqpSemtacfH9V0OK99xZSlZnfOe2ZotP
	IDAVck5Ie9OwEBCUblBQyBqv7VyzsQEDt2UuDxy0=
Content-Type: multipart/mixed; boundary="===============2544292848812661802=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libpsl: upgrading to 0.23.0 SUCCEEDED
Message-ID: <0101019f59f41722-f4eab664-8c64-4b8f-86a0-51876fdcb346-000000@us-west-2.amazonses.com>
Date: Mon, 13 Jul 2026 05:29:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.13-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 05:30:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240822

--===============2544292848812661802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpsaWJwc2wqIHRvICowLjIzLjAqIGhhcyBTdWNjZWVkZWQuCgpOZXh0IHN0ZXBzOgogICAg
LSBhcHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLWxpYnBzbC11cGdyYWRlLTAuMjIuMC0wLjIz
LjAucGF0Y2gKICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8gdXBzdHJlYW0gcGF0Y2hlcyBhbmQg
c3VtbWFyaXplIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLAogICAgLSBjb21waWxlIGFuIGlt
YWdlIHRoYXQgY29udGFpbnMgdGhlIHBhY2thZ2UKICAgIC0gcGVyZm9ybSBzb21lIGJhc2ljIHNh
bml0eSB0ZXN0cwogICAgLSBhbWVuZCB0aGUgcGF0Y2ggYW5kIHNpZ24gaXQgb2ZmOiBnaXQgY29t
bWl0IC1zIC0tcmVzZXQtYXV0aG9yIC0tYW1lbmQKICAgIC0gc2VuZCBpdCB0byB0aGUgYXBwcm9w
cmlhdGUgbWFpbGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5LCBpZiB5b3UgYmVsaWV2ZSB0aGUgcmVj
aXBlIHNob3VsZCBub3QgYmUgdXBncmFkZWQgYXQgdGhpcyB0aW1lLAp5b3UgY2FuIGZpbGwgUkVD
SVBFX05PX1VQREFURV9SRUFTT04gaW4gcmVzcGVjdGl2ZSByZWNpcGUgZmlsZSBzbyB0aGF0CmF1
dG9tYXRpYyB1cGdyYWRlcyB3b3VsZCBubyBsb25nZXIgYmUgYXR0ZW1wdGVkLgoKUGxlYXNlIHJl
dmlldyB0aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIgaW5mb3JtYXRpb24gYW5kIGJ1aWxk
L3VwZGF0ZSBmYWlsdXJlcy4KQW55IHByb2JsZW0gcGxlYXNlIGZpbGUgYSBidWcgYXQgaHR0cHM6
Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1Zy5jZ2k/cHJvZHVjdD1BdXRvbWF0
ZWQlMjBVcGRhdGUlMjBIYW5kbGVyCgpSZWdhcmRzLApUaGUgVXBncmFkZSBIZWxwZXIKCi0tID44
IC0tCkZyb20gZWJhZDYwNGVmZDQ0NGMwZDBmYzUxYTQ0OWJhODkzMjdlMDk3NDc1OCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxwZXIgPGF1aEB5b2N0b3Byb2plY3Qu
b3JnPgpEYXRlOiBNb24sIDEzIEp1bCAyMDI2IDA1OjI5OjUzICswMDAwClN1YmplY3Q6IFtQQVRD
SF0gbGlicHNsOiB1cGdyYWRlIDAuMjIuMCAtPiAwLjIzLjAKCi0tLQogLi4uL3tsaWJwc2xfMC4y
Mi4wLmJiID0+IGxpYnBzbF8wLjIzLjAuYmJ9ICAgIHwgMzUgKysrKysrKysrKysrKysrKystLQog
MSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHNsL3tsaWJwc2xfMC4yMi4wLmJiID0+IGxpYnBzbF8w
LjIzLjAuYmJ9ICg0MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHNs
L2xpYnBzbF8wLjIyLjAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwc2wvbGlicHNsXzAu
MjMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDQxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJwc2wvbGlicHNsXzAuMjIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGlicHNsL2xpYnBzbF8wLjIzLjAuYmIKaW5kZXggNzQxMDM4ZGRjNS4uN2ZmMWRlZjgwNCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHNsL2xpYnBzbF8wLjIyLjAuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHNsL2xpYnBzbF8wLjIzLjAuYmIKQEAgLTEs
MyArMSwzMiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVl
biB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBk
aWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBs
ZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRo
ZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicg
dGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRl
ZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysrIExJQ0VOU0UK
KyMgQEAgLTEsNCArMSw1IEBACisjIC1Db3B5cmlnaHQgKEMpIDIwMTQtMjAyNCBUaW0gUsO8aHNl
bgorIyArQ29weXJpZ2h0IChDKSBUaW0gUsO8aHNlbiBhbmQgTGlicHNsIENvbnRyaWJ1dG9ycy4K
KyMgK1NlZSBHaXQgaGlzdG9yeSBmb3IgaW5kaXZpZHVhbCBtb2RpZmljYXRpb24geWVhcnMuCisj
ICAKKyMgIFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBh
bnkgcGVyc29uIG9idGFpbmluZyBhCisjICBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29j
aWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLAorIyAtLS0gQ09QWUlO
RworIyArKysgQ09QWUlORworIyBAQCAtMSw0ICsxLDUgQEAKKyMgLUNvcHlyaWdodCAoQykgMjAx
NC0yMDI0IFRpbSBSw7xoc2VuCisjICtDb3B5cmlnaHQgKEMpIFRpbSBSw7xoc2VuIGFuZCBMaWJw
c2wgQ29udHJpYnV0b3JzLgorIyArU2VlIEdpdCBoaXN0b3J5IGZvciBpbmRpdmlkdWFsIG1vZGlm
aWNhdGlvbiB5ZWFycy4KKyMgIAorIyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJl
ZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEKKyMgIGNvcHkgb2YgdGhpcyBz
b2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJl
IiksCisjIAorIworCiBTVU1NQVJZID0gIlB1YmxpYyBTdWZmaXggTGlzdCBsaWJyYXJ5IgogREVT
Q1JJUFRJT04gPSAiVGhlIGxpYnBzbCBwYWNrYWdlIHByb3ZpZGVzIGEgbGlicmFyeSBmb3IgYWNj
ZXNzaW5nIGFuZCBcCiByZXNvbHZpbmcgaW5mb3JtYXRpb24gZnJvbSB0aGUgUHVibGljIFN1ZmZp
eCBMaXN0IChQU0wpLiBUaGUgUFNMIGlzIGEgc2V0IG9mIFwKQEAgLTcsMTMgKzM2LDEzIEBAIEhP
TUVQQUdFID0gImh0dHBzOi8vcm9ja2RhYm9vdC5naXRodWIuaW8vbGlicHNsLyIKIEJVR1RSQUNL
RVIgPSAiaHR0cHM6Ly9naXRodWIuY29tL3JvY2tkYWJvb3QvbGlicHNsL2lzc3VlcyIKIAogTElD
RU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT05Zjll
MzE3MDk2ZGIyYTU5OGZjNDQyMzdjNWI4YTRmNyBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly9DT1BZSU5HO21kNT05ZjllMzE3MDk2ZGIyYTU5OGZjNDQyMzdjNWI4YTRmNyBcCitMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT00OTI5NmMxODA2ZWY5MmMyODI5N2ZiMjY0
MTYzZDgxZSBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9DT1BZSU5HO21kNT00OTI5NmMx
ODA2ZWY5MmMyODI5N2ZiMjY0MTYzZDgxZSBcCiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JD
X1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vJHtCUH0udGFyLmd6IFwK
ICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM0NWMzYWExNzU3NmI5OTg3M2Uw
NWE5YjA5YTQ0MDQxYjA2NWJiZmEzOTBlNmQ0NzRkMDZmYmZhZWI5Yzc3MjIiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiZjM5Yjk2MzFiM2QzNjlhMjEyNTllYTQ2NTRmODg3NWMwZWM2OTk1Y2U5NTUx
YzBlYjVkNDIzZTRjMDExZjkxMSIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHVi
LmNvbS9yb2NrZGFib290L2xpYnBzbC9yZWxlYXNlcyIKIAotLSAKMi40Ny4xCgo=

--===============2544292848812661802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libpsl/libpsl: FILELIST: removed "/usr/lib/libpsl.so.5.3.6", added "/usr/lib/libpsl.so.5.3.7"
Changes to packages/x86-64-v3-poky-linux/libpsl (sysroot):
  /usr/lib/libpsl.so.5 changed symlink target from libpsl.so.5.3.6 to libpsl.so.5.3.7
  /usr/lib/libpsl.so changed symlink target from libpsl.so.5.3.6 to libpsl.so.5.3.7
  /usr/lib/libpsl.so.5.3.6 moved to /usr/lib/libpsl.so.5.3.7
Changes to packages/x86_64-linux/pkgconf-native (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.8.0.0 to libpkgconf.so.7.0.0
  /usr/lib/libpkgconf.so.8.0.0 moved to /usr/lib/libpkgconf.so.7.0.0
  /usr/lib/libpkgconf.so.8 moved to /usr/lib/libpkgconf.so.7
  /usr/bin/pccritic was removed
  /usr/bin/spdxtool was removed

--===============2544292848812661802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libpsl: PKGV changed from 0.22.0 [default] to 0.23.0 [default]
packages/x86-64-v3-poky-linux/libpsl: PV changed from "0.22.0" to "0.23.0"
packages/x86-64-v3-poky-linux/libpsl: SRC_URI changed from "https://github.com/rockdaboot/libpsl/releases/download/0.22.0/libpsl-0.22.0.tar.gz" to "https://github.com/rockdaboot/libpsl/releases/download/0.23.0/libpsl-0.23.0.tar.gz"
packages/x86-64-v3-poky-linux/libpsl/libpsl-bin: PKGV changed from 0.22.0 [default] to 0.23.0 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-bin: PV changed from "0.22.0" to "0.23.0"
packages/x86-64-v3-poky-linux/libpsl/libpsl-dbg: PKGV changed from 0.22.0 [default] to 0.23.0 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-dbg: PV changed from "0.22.0" to "0.23.0"
packages/x86-64-v3-poky-linux/libpsl/libpsl-dbg: PKGSIZE changed from 157664 to 157864 (+0%)
packages/x86-64-v3-poky-linux/libpsl/libpsl-dbg: FILELIST: removed "/usr/lib/.debug/libpsl.so.5.3.6", added "/usr/lib/.debug/libpsl.so.5.3.7"
packages/x86-64-v3-poky-linux/libpsl/libpsl-dev: PKGV changed from 0.22.0 [default] to 0.23.0 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-dev: PV changed from "0.22.0" to "0.23.0"
packages/x86-64-v3-poky-linux/libpsl/libpsl-dev: PKGSIZE changed from 6093 to 6067 (-0%)
packages/x86-64-v3-poky-linux/libpsl/libpsl-doc: PKGV changed from 0.22.0 [default] to 0.23.0 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-doc: PV changed from "0.22.0" to "0.23.0"
packages/x86-64-v3-poky-linux/libpsl/libpsl-doc: PKGSIZE changed from 3914 to 3927 (+0%)
packages/x86-64-v3-poky-linux/libpsl/libpsl-locale: PKGV changed from 0.22.0 [default] to 0.23.0 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-locale: PV changed from "0.22.0" to "0.23.0"
packages/x86-64-v3-poky-linux/libpsl/libpsl-src: PKGV changed from 0.22.0 [default] to 0.23.0 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-src: PV changed from "0.22.0" to "0.23.0"
packages/x86-64-v3-poky-linux/libpsl/libpsl-src: PKGSIZE changed from 428970 to 427096 (-0%)
packages/x86-64-v3-poky-linux/libpsl/libpsl-src: FILELIST: directory renamed /usr/src/debug/libpsl/0.22.0/tools -> /usr/src/debug/libpsl/0.23.0/tools, directory renamed /usr/src/debug/libpsl/0.22.0/include -> /usr/src/debug/libpsl/0.23.0/include, directory renamed /usr/src/debug/libpsl/0.22.0/src -> /usr/src/debug/libpsl/0.23.0/src
packages/x86-64-v3-poky-linux/libpsl/libpsl-staticdev: PKGV changed from 0.22.0 [default] to 0.23.0 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-staticdev: PV changed from "0.22.0" to "0.23.0"
packages/x86-64-v3-poky-linux/libpsl/libpsl: PKGV changed from 0.22.0 [default] to 0.23.0 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl: PV changed from "0.22.0" to "0.23.0"
packages/x86-64-v3-poky-linux/libpsl/libpsl: FILELIST: removed "/usr/lib/libpsl.so.5.3.6", added "/usr/lib/libpsl.so.5.3.7"
Changes to packages/x86-64-v3-poky-linux/libpsl (sysroot):
  /usr/lib/libpsl.so.5 changed symlink target from libpsl.so.5.3.6 to libpsl.so.5.3.7
  /usr/lib/libpsl.so changed symlink target from libpsl.so.5.3.6 to libpsl.so.5.3.7
  /usr/lib/libpsl.so.5.3.6 moved to /usr/lib/libpsl.so.5.3.7
Changes to packages/x86_64-linux/pkgconf-native (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.8.0.0 to libpkgconf.so.7.0.0
  /usr/lib/libpkgconf.so.8.0.0 moved to /usr/lib/libpkgconf.so.7.0.0
  /usr/lib/libpkgconf.so.8 moved to /usr/lib/libpkgconf.so.7
  /usr/bin/pccritic was removed
  /usr/bin/spdxtool was removed

--===============2544292848812661802==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpsl-upgrade-0.22.0-0.23.0.patch"

RnJvbSBlYmFkNjA0ZWZkNDQ0YzBkMGZjNTFhNDQ5YmE4OTMyN2UwOTc0NzU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTMgSnVsIDIwMjYgMDU6Mjk6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwc2w6IHVwZ3JhZGUgMC4yMi4wIC0+IDAuMjMuMAoKLS0tCiAuLi4ve2xpYnBzbF8wLjIyLjAu
YmIgPT4gbGlicHNsXzAuMjMuMC5iYn0gICAgfCAzNSArKysrKysrKysrKysrKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9saWJwc2wve2xpYnBzbF8wLjIyLjAuYmIgPT4gbGlicHNsXzAuMjMu
MC5iYn0gKDQxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwc2wvbGli
cHNsXzAuMjIuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBzbC9saWJwc2xfMC4yMy4w
LmJiCnNpbWlsYXJpdHkgaW5kZXggNDElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYnBzbC9saWJwc2xfMC4yMi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJwc2wvbGlicHNsXzAuMjMuMC5iYgppbmRleCA3NDEwMzhkZGM1Li43ZmYxZGVmODA0IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwc2wvbGlicHNsXzAuMjIuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwc2wvbGlicHNsXzAuMjMuMC5iYgpAQCAtMSwzICsx
LDMyIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVw
ZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZl
cmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNl
IHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNo
YW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcu
CisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicp
CisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQorIyArKysgTElDRU5TRQorIyBA
QCAtMSw0ICsxLDUgQEAKKyMgLUNvcHlyaWdodCAoQykgMjAxNC0yMDI0IFRpbSBSw7xoc2VuCisj
ICtDb3B5cmlnaHQgKEMpIFRpbSBSw7xoc2VuIGFuZCBMaWJwc2wgQ29udHJpYnV0b3JzLgorIyAr
U2VlIEdpdCBoaXN0b3J5IGZvciBpbmRpdmlkdWFsIG1vZGlmaWNhdGlvbiB5ZWFycy4KKyMgIAor
IyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBw
ZXJzb24gb2J0YWluaW5nIGEKKyMgIGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRl
ZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksCisjIC0tLSBDT1BZSU5HCisj
ICsrKyBDT1BZSU5HCisjIEBAIC0xLDQgKzEsNSBAQAorIyAtQ29weXJpZ2h0IChDKSAyMDE0LTIw
MjQgVGltIFLDvGhzZW4KKyMgK0NvcHlyaWdodCAoQykgVGltIFLDvGhzZW4gYW5kIExpYnBzbCBD
b250cmlidXRvcnMuCisjICtTZWUgR2l0IGhpc3RvcnkgZm9yIGluZGl2aWR1YWwgbW9kaWZpY2F0
aW9uIHllYXJzLgorIyAgCisjICBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9m
IGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYQorIyAgY29weSBvZiB0aGlzIHNvZnR3
YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwK
KyMgCisjCisKIFNVTU1BUlkgPSAiUHVibGljIFN1ZmZpeCBMaXN0IGxpYnJhcnkiCiBERVNDUklQ
VElPTiA9ICJUaGUgbGlicHNsIHBhY2thZ2UgcHJvdmlkZXMgYSBsaWJyYXJ5IGZvciBhY2Nlc3Np
bmcgYW5kIFwKIHJlc29sdmluZyBpbmZvcm1hdGlvbiBmcm9tIHRoZSBQdWJsaWMgU3VmZml4IExp
c3QgKFBTTCkuIFRoZSBQU0wgaXMgYSBzZXQgb2YgXApAQCAtNywxMyArMzYsMTMgQEAgSE9NRVBB
R0UgPSAiaHR0cHM6Ly9yb2NrZGFib290LmdpdGh1Yi5pby9saWJwc2wvIgogQlVHVFJBQ0tFUiA9
ICJodHRwczovL2dpdGh1Yi5jb20vcm9ja2RhYm9vdC9saWJwc2wvaXNzdWVzIgogCiBMSUNFTlNF
ID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTlmOWUzMTcw
OTZkYjJhNTk4ZmM0NDIzN2M1YjhhNGY3IFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL0NP
UFlJTkc7bWQ1PTlmOWUzMTcwOTZkYjJhNTk4ZmM0NDIzN2M1YjhhNGY3IFwKK0xJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTQ5Mjk2YzE4MDZlZjkyYzI4Mjk3ZmIyNjQxNjNk
ODFlIFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL0NPUFlJTkc7bWQ1PTQ5Mjk2YzE4MDZl
ZjkyYzI4Mjk3ZmIyNjQxNjNkODFlIFwKICAgICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJ
ID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS8ke0JQfS50YXIuZ3ogXAogICAg
ICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzQ1YzNhYTE3NTc2Yjk5ODczZTA1YTli
MDlhNDQwNDFiMDY1YmJmYTM5MGU2ZDQ3NGQwNmZiZmFlYjljNzcyMiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJmMzliOTYzMWIzZDM2OWEyMTI1OWVhNDY1NGY4ODc1YzBlYzY5OTVjZTk1NTFjMGVi
NWQ0MjNlNGMwMTFmOTExIgogCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29t
L3JvY2tkYWJvb3QvbGlicHNsL3JlbGVhc2VzIgogCi0tIAoyLjQ3LjEKCg==

--===============2544292848812661802==--

