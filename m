Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0617DC5AC9E
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 05:30:42 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36637.1786080637976950960
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 22:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=oJUeKllj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=yTE4ZDwZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019fdab3b030-b91ec13b-b79d-469f-a83d-55b984d356c5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786080637;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=gHr3abyLWGqJ0aukyRjCSVBmLTo5GLRTt5yFdGiXLIY=;
	b=oJUeKlljzPFGbus4+mT4qvtQEv0xHbA49+htCy+OTXeIgDsVLDt/DU2U6K/qwzh4
	vl2Ktr9nWB4aslakxs34BwhRlIwSey8MiCfaB4+T6VT1OFJHBJMqoXUy4f9rxXavqwF
	TaH0auRElM8pWlN5xzXl1LE6RItzn+MVyJgLwHIY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786080637;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=gHr3abyLWGqJ0aukyRjCSVBmLTo5GLRTt5yFdGiXLIY=;
	b=yTE4ZDwZ3bOtvwgzWk+Zk5AmaNW8QWJKzSLqSYqO4pTt+EYZbK8NnpGA6y9if85h
	n33nJA9s8LMj++4KGRpnGpi+i3WIN3H5OUbf0+sWGY3+GWjkcvNIBDJ35qw052c87rb
	XLI4tA7/4rjMWq+0tkpt6RUevnv6ieD7d4X8T3Ug=
Content-Type: multipart/mixed; boundary="===============5320804208019231011=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] p11-kit: upgrading to 0.26.5 SUCCEEDED
Message-ID: <0101019fdab3b030-b91ec13b-b79d-469f-a83d-55b984d356c5-000000@us-west-2.amazonses.com>
Date: Fri, 7 Aug 2026 05:30:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.07-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 05:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242979

--===============5320804208019231011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *p11-kit* to *0.26.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-p11-kit-upgrade-0.26.4-0.26.5.patch
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

-- >8 --
From 16cf86106f11a029db1c39fdca3919d89b09b8eb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 7 Aug 2026 05:30:30 +0000
Subject: [PATCH] p11-kit: upgrade 0.26.4 -> 0.26.5

Source: NEWS

0.26.5 (stable)
* rpc: guard against overflow when decoding nested attributes (CVE-2026-18938) [PR#777]
---
 .../p11-kit/{p11-kit_0.26.4.bb => p11-kit_0.26.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.26.4.bb => p11-kit_0.26.5.bb} (97%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb b/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
similarity index 97%
rename from meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
index 4828d6f942..722f2d876e 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
@@ -11,7 +11,7 @@ DEPENDS = "libffi"
 DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=${PV}"
-SRCREV = "a14788849d1ef44422d679534a13821eab5bb5f4"
+SRCREV = "120050e353e8f43d7c40bbcc047f667f903f4de5"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} trust"
 PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
-- 
2.47.1


--===============5320804208019231011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/p11-kit/p11-kit: FILELIST: removed "/usr/lib/libp11-kit.so.0.4.10", added "/usr/lib/libp11-kit.so.0.4.11"
Changes to packages/x86-64-v3-poky-linux/p11-kit (sysroot):
  /usr/lib/libp11-kit.so.0 changed symlink target from libp11-kit.so.0.4.10 to libp11-kit.so.0.4.11
  /usr/lib/libp11-kit.so.0.4.10 moved to /usr/lib/libp11-kit.so.0.4.11
Changes to packages/x86_64-linux/p11-kit-native (sysroot):
  /usr/lib/libp11-kit.so.0 changed symlink target from libp11-kit.so.0.4.10 to libp11-kit.so.0.4.11
  /usr/lib/libp11-kit.so.0.4.10 moved to /usr/lib/libp11-kit.so.0.4.11

--===============5320804208019231011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="p11-kit-changelog.txt"

Changelog for p11-kit: 0.26.4 -> 0.26.5
Source: NEWS

0.26.5 (stable)
* rpc: guard against overflow when decoding nested attributes (CVE-2026-18938) [PR#777]

--===============5320804208019231011==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-p11-kit-upgrade-0.26.4-0.26.5.patch"

RnJvbSAxNmNmODYxMDZmMTFhMDI5ZGIxYzM5ZmRjYTM5MTlkODliMDliOGViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNyBBdWcgMjAyNiAwNTozMDozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHAx
MS1raXQ6IHVwZ3JhZGUgMC4yNi40IC0+IDAuMjYuNQoKU291cmNlOiBORVdTCgowLjI2LjUgKHN0
YWJsZSkKKiBycGM6IGd1YXJkIGFnYWluc3Qgb3ZlcmZsb3cgd2hlbiBkZWNvZGluZyBuZXN0ZWQg
YXR0cmlidXRlcyAoQ1ZFLTIwMjYtMTg5MzgpIFtQUiM3NzddCi0tLQogLi4uL3AxMS1raXQve3Ax
MS1raXRfMC4yNi40LmJiID0+IHAxMS1raXRfMC4yNi41LmJifSAgICAgICAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLXN1cHBvcnQvcDExLWtpdC97cDExLWtpdF8wLjI2LjQuYmIgPT4gcDExLWtpdF8w
LjI2LjUuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcDExLWtp
dC9wMTEta2l0XzAuMjYuNC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQvcDExLWtp
dF8wLjI2LjUuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvcDExLWtpdC9wMTEta2l0XzAuMjYuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvcDExLWtpdC9wMTEta2l0XzAuMjYuNS5iYgppbmRleCA0ODI4ZDZmOTQyLi43MjJm
MmQ4NzZlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9wMTEta2l0L3AxMS1raXRf
MC4yNi40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3AxMS1raXQvcDExLWtpdF8wLjI2
LjUuYmIKQEAgLTExLDcgKzExLDcgQEAgREVQRU5EUyA9ICJsaWJmZmkiCiBERVBFTkRTOmFwcGVu
ZCA9ICIke0AnIGdsaWItMi4wJyBpZiBkLmdldFZhcignR1RLRE9DX0VOQUJMRUQnKSA9PSAnVHJ1
ZScgZWxzZSAnJ30iCiAKIFNSQ19VUkkgPSAiZ2l0c206Ly9naXRodWIuY29tL3AxMS1nbHVlL3Ax
MS1raXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwczt0YWc9JHtQVn0iCi1TUkNSRVYgPSAi
YTE0Nzg4ODQ5ZDFlZjQ0NDIyZDY3OTUzNGExMzgyMWVhYjViYjVmNCIKK1NSQ1JFViA9ICIxMjAw
NTBlMzUzZThmNDNkN2M0MGJiY2MwNDdmNjY3ZjkwM2Y0ZGU1IgogCiBQQUNLQUdFQ09ORklHID8/
PSAiJHtAYmIudXRpbHMuZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLCAnc3lzdGVtZCcsIGQpfSB0
cnVzdCIKIFBBQ0tBR0VDT05GSUdbc3lzdGVtZF0gPSAiLURzeXN0ZW1kPWVuYWJsZWQsLURzeXN0
ZW1kPWRpc2FibGVkLHN5c3RlbWQiCi0tIAoyLjQ3LjEKCg==

--===============5320804208019231011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/p11-kit: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit: SRC_URI changed from "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=0.26.4" to "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=0.26.5"
packages/x86-64-v3-poky-linux/p11-kit: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-bash-completion: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-bash-completion: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-bin: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-bin: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dbg: FILELIST: removed "/usr/lib/.debug/libp11-kit.so.0.4.10", added "/usr/lib/.debug/libp11-kit.so.0.4.11"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dbg: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dbg: PKGSIZE changed from 18070152 to 18070176 (+0%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dbg: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dev: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-dev: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-doc: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-doc: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ar: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ar: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-as: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-as: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ast: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ast: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-az: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-az: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-bg: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-bg: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-bn-in: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-bn-in: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ca+valencia: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ca+valencia: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ca: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ca: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-cs: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-cs: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-cy: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-cy: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-da: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-da: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-de: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-de: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-el: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-el: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-en-gb: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-en-gb: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-eo: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-eo: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-es: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-es: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-et: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-et: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-eu: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-eu: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fa: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fa: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fi: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fi: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fo: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fo: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fr: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fr: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fur: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-fur: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ga: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ga: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-gl: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-gl: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-gu: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-gu: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-he: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-he: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hi: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hi: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hr: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hr: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hu: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-hu: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ia: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ia: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-id: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-id: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-it: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-it: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ja: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ja: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ka: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ka: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-kk: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-kk: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-kn: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-kn: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ko: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ko: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-lt: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-lt: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-lv: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-lv: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ml: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ml: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-mr: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-mr: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ms: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ms: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nb: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nb: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nl: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nl: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nn: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-nn: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-oc: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-oc: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-or: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-or: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pa: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pa: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pl: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pl: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pt-br: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pt-br: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pt: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-pt: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ro: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ro: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ru: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ru: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-si: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-si: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sk: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sk: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sl: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sl: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sq: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sq: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sr+latin: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sr+latin: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sr: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sr: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sv: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-sv: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ta: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-ta: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-te: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-te: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-th: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-th: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-tr: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-tr: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-uk: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-uk: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-vi: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-vi: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-wa: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-wa: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-cn: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-cn: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-hk: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-hk: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-tw: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-locale-zh-tw: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-modules: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-modules: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-remote: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-remote: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-src: FILELIST: directory renamed /usr/src/debug/p11-kit/0.26.4/common -> /usr/src/debug/p11-kit/0.26.5/common, directory renamed /usr/src/debug/p11-kit/0.26.4/p11-kit -> /usr/src/debug/p11-kit/0.26.5/p11-kit, directory renamed /usr/src/debug/p11-kit/0.26.4/trust -> /usr/src/debug/p11-kit/0.26.5/trust
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-src: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-src: PKGSIZE changed from 2033023 to 2033248 (+0%)
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-src: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-staticdev: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit-staticdev: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
packages/x86-64-v3-poky-linux/p11-kit/p11-kit: FILELIST: removed "/usr/lib/libp11-kit.so.0.4.10", added "/usr/lib/libp11-kit.so.0.4.11"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit: PV changed from "0.26.4" to "0.26.5"
packages/x86-64-v3-poky-linux/p11-kit/p11-kit: PKGV changed from 0.26.4 [default] to 0.26.5 [default]
Changes to packages/x86-64-v3-poky-linux/p11-kit (sysroot):
  /usr/lib/libp11-kit.so.0 changed symlink target from libp11-kit.so.0.4.10 to libp11-kit.so.0.4.11
  /usr/lib/libp11-kit.so.0.4.10 moved to /usr/lib/libp11-kit.so.0.4.11
Changes to packages/x86_64-linux/p11-kit-native (sysroot):
  /usr/lib/libp11-kit.so.0 changed symlink target from libp11-kit.so.0.4.10 to libp11-kit.so.0.4.11
  /usr/lib/libp11-kit.so.0.4.10 moved to /usr/lib/libp11-kit.so.0.4.11

--===============5320804208019231011==--

