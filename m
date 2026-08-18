Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DAFC5DF74
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:28:49 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2753.1787030922726474063
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:28:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jsYtxp3w;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Y+yXuAzv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a01357e224-0fa6c02d-69b6-4cc7-b8e4-eec55957244f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787030921;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=MrKxugtMdZIqMY4bO3Yhr0+zBUHS/hKV4Z+FV9yY03c=;
	b=jsYtxp3ww5Ha/Bw6ex6XRq0ty3LrXfCLOoRv0g6KPa/7cPqgmbsmM+6vd6/re66B
	BdO6V50SeD0gCGj+KSYqxjtiOtdXueOR78iEyM/H2/k+qXm4j5wSc/h6jP/S6g6qIYp
	KCyaPVmJ9PQ1TOMKTjolGLbVb6X5KYoisYyH4aFU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787030921;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=MrKxugtMdZIqMY4bO3Yhr0+zBUHS/hKV4Z+FV9yY03c=;
	b=Y+yXuAzvHUUmGx+OxidT53kVt7U7ZDH3rMjMbN9zkj9JTJv14wukjgoStSNw8qwB
	zGOklsjrKtQtAHDl5UmgeS2KBINmSCUPnvc7HUqCtiXVW4gvrh5wL6nbK9eFI3O/VUi
	5NEk0ps1pPpcHVtURCdEqFTSXfX05e9vHPBzavwY=
Content-Type: multipart/mixed; boundary="===============3626964565826267874=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] dhcpcd: upgrading to 10.5.2 SUCCEEDED
Message-ID: <010101a01357e224-0fa6c02d-69b6-4cc7-b8e4-eec55957244f-000000@us-west-2.amazonses.com>
Date: Tue, 18 Aug 2026 05:28:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 05:28:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243643

--===============3626964565826267874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dhcpcd* to *10.5.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dhcpcd-upgrade-10.5.0-10.5.2.patch
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
From 1e999a70c29695e3658f905406c3d6abc744a622 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 18 Aug 2026 05:12:51 +0000
Subject: [PATCH] dhcpcd: upgrade 10.5.0 -> 10.5.2

7c50b51a Release dhcpcd-10.5.2
c8887d0d IPv6: Allocate the interface state before adding a static address
03091088 Fix build
2bb381e9 Release dhcpcd-10.5.1
b19746fd configure: Generate .clangd
23b6790d privsep: Fix capsicum support on the control socket
a14857d1 privsep: re-enable capsicum and pledge
50857dd2 hooks: Document that new_delegated_dhcp6_prefix contains addresses
f6dabfe2 control: Harden the socket the the fs level
97b50d2e Improve the IDE experience
9cd9d2df DHCP: script reason should be RELEASE on RELEASE, not STOP
79936c28 linux: workaround a gcc compile warning issue
dfaaa5ea remove accidental debug
737091d2 ipv4: clear added state if we didn't delete the address
b83fe28c compat: define __STDC_WANT_LIB_EXT1__ 1 before including config
0c1f4074 ipv6nd: don't leave a carrier expiry timeout on a freed interface
fadc4ed6 compat: call setprogname during early init
7c87dfdf privsep: Allow __NR__llseek as well as __NR_llseek on linux
8d499db1 route: keep acquisition timestamp when matched route isn't updated
c5605040 DHCP6: Mirror the prior DHCP rapid commit fix to DHCPv6
0406dd87 DHCP: Only send the rapid commit option when configured to
eb9fd7df control: Fix non privsep builds
---
 .../dhcpcd/{dhcpcd_10.5.0.bb => dhcpcd_10.5.2.bb}             | 2 +-
 ...20-resolv.conf-improve-the-sitation-of-working-with-.patch | 2 +-
 ...001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch | 2 +-
 .../0001-remove-INCLUDEDIR-to-prevent-build-issues.patch      | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.5.0.bb => dhcpcd_10.5.2.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.5.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.5.2.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.5.0.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.5.2.bb
index 73f55969cd..d8017693e7 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.5.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.5.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "1d608519abb398006b77f11c7b720147adf4cfcc"
+SRCREV = "7c50b51a142ca5e8cbbf8f65cd8111d6f200608a"
 
 # Doesn't use automake so we can't do out-of-tree builds
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
index 04c1d92897..e5483c747d 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
@@ -1,4 +1,4 @@
-From a3e397d3764fdb779e2f995b690ba365956612f5 Mon Sep 17 00:00:00 2001
+From 5f9b3c4aa7965cf9edf7d6adc8626f50462ad979 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 9 Nov 2022 16:33:18 +0800
 Subject: [PATCH] 20-resolv.conf: improve the sitation of working with systemd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
index c2afb83b54..17d5685334 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
@@ -1,4 +1,4 @@
-From d3e517be04e660d72233cde91b44c3cf705126e2 Mon Sep 17 00:00:00 2001
+From e9b462a5b3fe875effc05a246948533da1c5baaf Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Fri, 10 Mar 2023 03:48:46 +0000
 Subject: [PATCH] dhcpcd.8: Fix conflict error when enable multilib.
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
index 69ebc6026f..ed412c3d94 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
@@ -1,4 +1,4 @@
-From 278ef78e007ab74c701961e108262d9d733a3975 Mon Sep 17 00:00:00 2001
+From ab9ae52e0b7cf53266c99fd00d23d9c2f9cb308e Mon Sep 17 00:00:00 2001
 From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
 Date: Sun, 13 Jan 2019 01:50:52 +0100
 Subject: [PATCH] remove INCLUDEDIR to prevent build issues
@@ -11,7 +11,7 @@ Signed-off-by: Stefano Cappa <stefano.cappa.ks89@gmail.com>
  1 file changed, 5 deletions(-)
 
 diff --git a/configure b/configure
-index 32bf96ef..ab4aa901 100755
+index 43a40a7d..71707073 100755
 --- a/configure
 +++ b/configure
 @@ -29,7 +29,6 @@ BUILD=
-- 
2.47.1


--===============3626964565826267874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dbg: PKGSIZE changed from 1422328 to 1423120 (+0%)
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dbg: PKGV changed from 10.5.0 [default] to 10.5.2 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dbg: PV changed from "10.5.0" to "10.5.2"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dev: PKGV changed from 10.5.0 [default] to 10.5.2 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dev: PV changed from "10.5.0" to "10.5.2"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-doc: PKGSIZE changed from 68511 to 68535 (+0%)
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-doc: PKGV changed from 10.5.0 [default] to 10.5.2 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-doc: PV changed from "10.5.0" to "10.5.2"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-locale: PKGV changed from 10.5.0 [default] to 10.5.2 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-locale: PV changed from "10.5.0" to "10.5.2"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-src: PKGSIZE changed from 1153555 to 1155889 (+0%)
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-src: FILELIST: directory renamed /usr/src/debug/dhcpcd/10.5.0/src/dev -> /usr/src/debug/dhcpcd/10.5.2/src/dev, directory renamed /usr/src/debug/dhcpcd/10.5.0/compat/crypt_openssl -> /usr/src/debug/dhcpcd/10.5.2/compat/crypt_openssl, directory renamed /usr/src/debug/dhcpcd/10.5.0/src -> /usr/src/debug/dhcpcd/10.5.2/src, directory renamed /usr/src/debug/dhcpcd/10.5.0/vendor -> /usr/src/debug/dhcpcd/10.5.2/vendor, removed "/usr/src/debug/dhcpcd/10.5.0/compat/getpeereid.h /usr/src/debug/dhcpcd/10.5.0/compat/pidfile.h /usr/src/debug/dhcpcd/10.5.0/compat/pidfile.c /usr/src/debug/dhcpcd/10.5.0/compat/getpeereid.c /usr/src/debug/dhcpcd/10.5.0/compat/endian.h /usr/src/debug/dhcpcd/10.5.0/compat/consttime_memequal.h /usr/src/debug/dhcpcd/10.5.0/compat/setproctitle.c /usr/src/debug/dhcpcd/10.5.0/compat/_strtoi.h /usr/src/debug/dhcpcd/10.5.0/compat/getprogname.h /usr/src/debug/dhcpcd/10.5.0/compat/strtoi.h /usr/src/debug/dhcpcd/10.5.0/compat/getprognam
 e.c /usr/src/debug/dhcpcd/10.5.0/compat/setproctitle.h /usr/src/debug/dhcpcd/10.5.0/compat/bitops.h", added "/usr/src/debug/dhcpcd/10.5.2/compat/progname.c /usr/src/debug/dhcpcd/10.5.2/compat/getpeereid.h /usr/src/debug/dhcpcd/10.5.2/compat/pidfile.h /usr/src/debug/dhcpcd/10.5.2/compat/progname.h /usr/src/debug/dhcpcd/10.5.2/compat/pidfile.c /usr/src/debug/dhcpcd/10.5.2/compat/endian.h /usr/src/debug/dhcpcd/10.5.2/compat/getpeereid.c /usr/src/debug/dhcpcd/10.5.2/compat/consttime_memequal.h /usr/src/debug/dhcpcd/10.5.2/compat/setproctitle.c /usr/src/debug/dhcpcd/10.5.2/compat/_strtoi.h /usr/src/debug/dhcpcd/10.5.2/compat/strtoi.h /usr/src/debug/dhcpcd/10.5.2/compat/setproctitle.h /usr/src/debug/dhcpcd/10.5.2/compat/bitops.h"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-src: PKGV changed from 10.5.0 [default] to 10.5.2 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-src: PV changed from "10.5.0" to "10.5.2"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-staticdev: PKGV changed from 10.5.0 [default] to 10.5.2 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-staticdev: PV changed from "10.5.0" to "10.5.2"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd: PKGV changed from 10.5.0 [default] to 10.5.2 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd: PV changed from "10.5.0" to "10.5.2"
packages/x86-64-v3-poky-linux/dhcpcd: SRC_URI changed from "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master;tag=v10.5.0 file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch file://dhcpcd.service file://dhcpcd@.service file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch" to "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master;tag=v10.5.2 file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch file://dhcpcd.service file://dhcpcd@.service file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch"
packages/x86-64-v3-poky-linux/dhcpcd: PKGV changed from 10.5.0 [default] to 10.5.2 [default]
packages/x86-64-v3-poky-linux/dhcpcd: PV changed from "10.5.0" to "10.5.2"

--===============3626964565826267874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="dhcpcd-changelog.txt"

Changelog for dhcpcd: 10.5.0 -> 10.5.2

7c50b51a Release dhcpcd-10.5.2
c8887d0d IPv6: Allocate the interface state before adding a static address
03091088 Fix build
2bb381e9 Release dhcpcd-10.5.1
b19746fd configure: Generate .clangd
23b6790d privsep: Fix capsicum support on the control socket
a14857d1 privsep: re-enable capsicum and pledge
50857dd2 hooks: Document that new_delegated_dhcp6_prefix contains addresses
f6dabfe2 control: Harden the socket the the fs level
97b50d2e Improve the IDE experience
9cd9d2df DHCP: script reason should be RELEASE on RELEASE, not STOP
79936c28 linux: workaround a gcc compile warning issue
dfaaa5ea remove accidental debug
737091d2 ipv4: clear added state if we didn't delete the address
b83fe28c compat: define __STDC_WANT_LIB_EXT1__ 1 before including config
0c1f4074 ipv6nd: don't leave a carrier expiry timeout on a freed interface
fadc4ed6 compat: call setprogname during early init
7c87dfdf privsep: Allow __NR__llseek as well as __NR_llseek on linux
8d499db1 route: keep acquisition timestamp when matched route isn't updated
c5605040 DHCP6: Mirror the prior DHCP rapid commit fix to DHCPv6
0406dd87 DHCP: Only send the rapid commit option when configured to
eb9fd7df control: Fix non privsep builds

--===============3626964565826267874==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dhcpcd-upgrade-10.5.0-10.5.2.patch"

RnJvbSAxZTk5OWE3MGMyOTY5NWUzNjU4ZjkwNTQwNmMzZDZhYmM3NDRhNjIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTggQXVnIDIwMjYgMDU6MTI6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aGNwY2Q6IHVwZ3JhZGUgMTAuNS4wIC0+IDEwLjUuMgoKN2M1MGI1MWEgUmVsZWFzZSBkaGNwY2Qt
MTAuNS4yCmM4ODg3ZDBkIElQdjY6IEFsbG9jYXRlIHRoZSBpbnRlcmZhY2Ugc3RhdGUgYmVmb3Jl
IGFkZGluZyBhIHN0YXRpYyBhZGRyZXNzCjAzMDkxMDg4IEZpeCBidWlsZAoyYmIzODFlOSBSZWxl
YXNlIGRoY3BjZC0xMC41LjEKYjE5NzQ2ZmQgY29uZmlndXJlOiBHZW5lcmF0ZSAuY2xhbmdkCjIz
YjY3OTBkIHByaXZzZXA6IEZpeCBjYXBzaWN1bSBzdXBwb3J0IG9uIHRoZSBjb250cm9sIHNvY2tl
dAphMTQ4NTdkMSBwcml2c2VwOiByZS1lbmFibGUgY2Fwc2ljdW0gYW5kIHBsZWRnZQo1MDg1N2Rk
MiBob29rczogRG9jdW1lbnQgdGhhdCBuZXdfZGVsZWdhdGVkX2RoY3A2X3ByZWZpeCBjb250YWlu
cyBhZGRyZXNzZXMKZjZkYWJmZTIgY29udHJvbDogSGFyZGVuIHRoZSBzb2NrZXQgdGhlIHRoZSBm
cyBsZXZlbAo5N2I1MGQyZSBJbXByb3ZlIHRoZSBJREUgZXhwZXJpZW5jZQo5Y2Q5ZDJkZiBESENQ
OiBzY3JpcHQgcmVhc29uIHNob3VsZCBiZSBSRUxFQVNFIG9uIFJFTEVBU0UsIG5vdCBTVE9QCjc5
OTM2YzI4IGxpbnV4OiB3b3JrYXJvdW5kIGEgZ2NjIGNvbXBpbGUgd2FybmluZyBpc3N1ZQpkZmFh
YTVlYSByZW1vdmUgYWNjaWRlbnRhbCBkZWJ1Zwo3MzcwOTFkMiBpcHY0OiBjbGVhciBhZGRlZCBz
dGF0ZSBpZiB3ZSBkaWRuJ3QgZGVsZXRlIHRoZSBhZGRyZXNzCmI4M2ZlMjhjIGNvbXBhdDogZGVm
aW5lIF9fU1REQ19XQU5UX0xJQl9FWFQxX18gMSBiZWZvcmUgaW5jbHVkaW5nIGNvbmZpZwowYzFm
NDA3NCBpcHY2bmQ6IGRvbid0IGxlYXZlIGEgY2FycmllciBleHBpcnkgdGltZW91dCBvbiBhIGZy
ZWVkIGludGVyZmFjZQpmYWRjNGVkNiBjb21wYXQ6IGNhbGwgc2V0cHJvZ25hbWUgZHVyaW5nIGVh
cmx5IGluaXQKN2M4N2RmZGYgcHJpdnNlcDogQWxsb3cgX19OUl9fbGxzZWVrIGFzIHdlbGwgYXMg
X19OUl9sbHNlZWsgb24gbGludXgKOGQ0OTlkYjEgcm91dGU6IGtlZXAgYWNxdWlzaXRpb24gdGlt
ZXN0YW1wIHdoZW4gbWF0Y2hlZCByb3V0ZSBpc24ndCB1cGRhdGVkCmM1NjA1MDQwIERIQ1A2OiBN
aXJyb3IgdGhlIHByaW9yIERIQ1AgcmFwaWQgY29tbWl0IGZpeCB0byBESENQdjYKMDQwNmRkODcg
REhDUDogT25seSBzZW5kIHRoZSByYXBpZCBjb21taXQgb3B0aW9uIHdoZW4gY29uZmlndXJlZCB0
bwplYjlmZDdkZiBjb250cm9sOiBGaXggbm9uIHByaXZzZXAgYnVpbGRzCi0tLQogLi4uL2RoY3Bj
ZC97ZGhjcGNkXzEwLjUuMC5iYiA9PiBkaGNwY2RfMTAuNS4yLmJifSAgICAgICAgICAgICB8IDIg
Ky0KIC4uLjIwLXJlc29sdi5jb25mLWltcHJvdmUtdGhlLXNpdGF0aW9uLW9mLXdvcmtpbmctd2l0
aC0ucGF0Y2ggfCAyICstCiAuLi4wMDEtZGhjcGNkLjgtRml4LWNvbmZsaWN0LWVycm9yLXdoZW4t
ZW5hYmxlLW11bHRpbGliLnBhdGNoIHwgMiArLQogLi4uLzAwMDEtcmVtb3ZlLUlOQ0xVREVESVIt
dG8tcHJldmVudC1idWlsZC1pc3N1ZXMucGF0Y2ggICAgICB8IDQgKystLQogNCBmaWxlcyBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9kaGNwY2Qve2RoY3BjZF8xMC41LjAuYmIgPT4gZGhjcGNkXzEwLjUuMi5i
Yn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9k
aGNwY2RfMTAuNS4wLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZGhjcGNk
XzEwLjUuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2RoY3BjZC9kaGNwY2RfMTAuNS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9kaGNwY2RfMTAuNS4yLmJiCmluZGV4IDczZjU1OTY5Y2Qu
LmQ4MDE3NjkzZTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNk
L2RoY3BjZF8xMC41LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2Qv
ZGhjcGNkXzEwLjUuMi5iYgpAQCAtMTcsNyArMTcsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1
Yi5jb20vTmV0d29ya0NvbmZpZ3VyYXRpb24vZGhjcGNkO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1t
YQogICAgICAgICAgICBmaWxlOi8vMDAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hl
bi1lbmFibGUtbXVsdGlsaWIucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICIxZDYw
ODUxOWFiYjM5ODAwNmI3N2YxMWM3YjcyMDE0N2FkZjRjZmNjIgorU1JDUkVWID0gIjdjNTBiNTFh
MTQyY2E1ZThjYmJmOGY2NWNkODExMWQ2ZjIwMDYwOGEiCiAKICMgRG9lc24ndCB1c2UgYXV0b21h
a2Ugc28gd2UgY2FuJ3QgZG8gb3V0LW9mLXRyZWUgYnVpbGRzCiBpbmhlcml0IHBrZ2NvbmZpZyBh
dXRvdG9vbHMtYnJva2Vuc2VwIHN5c3RlbWQgdXNlcmFkZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS0yMC1yZXNvbHYuY29uZi1pbXByb3Zl
LXRoZS1zaXRhdGlvbi1vZi13b3JraW5nLXdpdGgtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS0yMC1yZXNvbHYuY29uZi1pbXByb3ZlLXRoZS1zaXRh
dGlvbi1vZi13b3JraW5nLXdpdGgtLnBhdGNoCmluZGV4IDA0YzFkOTI4OTcuLmU1NDgzYzc0N2Qg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEt
MjAtcmVzb2x2LmNvbmYtaW1wcm92ZS10aGUtc2l0YXRpb24tb2Ytd29ya2luZy13aXRoLS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLTIwLXJl
c29sdi5jb25mLWltcHJvdmUtdGhlLXNpdGF0aW9uLW9mLXdvcmtpbmctd2l0aC0ucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGEzZTM5N2QzNzY0ZmRiNzc5ZTJmOTk1YjY5MGJhMzY1OTU2NjEy
ZjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDVmOWIzYzRhYTc5NjVjZjllZGY3ZDZh
ZGM4NjI2ZjUwNDYyYWQ5NzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFp
IDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDkgTm92IDIwMjIgMTY6MzM6MTgg
KzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gMjAtcmVzb2x2LmNvbmY6IGltcHJvdmUgdGhlIHNpdGF0
aW9uIG9mIHdvcmtpbmcgd2l0aCBzeXN0ZW1kCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLWRoY3BjZC44LUZpeC1jb25mbGljdC1lcnJvci13
aGVuLWVuYWJsZS1tdWx0aWxpYi5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhj
cGNkL2ZpbGVzLzAwMDEtZGhjcGNkLjgtRml4LWNvbmZsaWN0LWVycm9yLXdoZW4tZW5hYmxlLW11
bHRpbGliLnBhdGNoCmluZGV4IGMyYWZiODNiNTQuLjE3ZDU2ODUzMzQgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtZGhjcGNkLjgtRml4LWNv
bmZsaWN0LWVycm9yLXdoZW4tZW5hYmxlLW11bHRpbGliLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtZGhjcGNkLjgtRml4LWNvbmZsaWN0LWVy
cm9yLXdoZW4tZW5hYmxlLW11bHRpbGliLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkM2U1
MTdiZTA0ZTY2MGQ3MjIzM2NkZTkxYjQ0YzNjZjcwNTEyNmUyIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBlOWI0NjJhNWIzZmU4NzVlZmZjMDVhMjQ2OTQ4NTMzZGExYzViYWFmIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3Uu
Y29tPgogRGF0ZTogRnJpLCAxMCBNYXIgMjAyMyAwMzo0ODo0NiArMDAwMAogU3ViamVjdDogW1BB
VENIXSBkaGNwY2QuODogRml4IGNvbmZsaWN0IGVycm9yIHdoZW4gZW5hYmxlIG11bHRpbGliLgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1y
ZW1vdmUtSU5DTFVERURJUi10by1wcmV2ZW50LWJ1aWxkLWlzc3Vlcy5wYXRjaCBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtcmVtb3ZlLUlOQ0xVREVESVItdG8t
cHJldmVudC1idWlsZC1pc3N1ZXMucGF0Y2gKaW5kZXggNjllYmM2MDI2Zi4uZWQ0MTJjM2Q5NCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1y
ZW1vdmUtSU5DTFVERURJUi10by1wcmV2ZW50LWJ1aWxkLWlzc3Vlcy5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLXJlbW92ZS1JTkNMVURFRElS
LXRvLXByZXZlbnQtYnVpbGQtaXNzdWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyNzhl
Zjc4ZTAwN2FiNzRjNzAxOTYxZTEwODI2MmQ5ZDczM2EzOTc1IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBhYjlhZTUyZTBiN2NmNTMyNjZjOTlmZDAwZDIzZDljMmY5Y2IzMDhlIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogU3RlZmFubyBDYXBwYSA8c3RlZmFuby5jYXBwYS5r
czg5QGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMTMgSmFuIDIwMTkgMDE6NTA6NTIgKzAxMDAKIFN1
YmplY3Q6IFtQQVRDSF0gcmVtb3ZlIElOQ0xVREVESVIgdG8gcHJldmVudCBidWlsZCBpc3N1ZXMK
QEAgLTExLDcgKzExLDcgQEAgU2lnbmVkLW9mZi1ieTogU3RlZmFubyBDYXBwYSA8c3RlZmFuby5j
YXBwYS5rczg5QGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKIAog
ZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZSBiL2NvbmZpZ3VyZQotaW5kZXggMzJiZjk2ZWYuLmFiNGFh
OTAxIDEwMDc1NQoraW5kZXggNDNhNDBhN2QuLjcxNzA3MDczIDEwMDc1NQogLS0tIGEvY29uZmln
dXJlCiArKysgYi9jb25maWd1cmUKIEBAIC0yOSw3ICsyOSw2IEBAIEJVSUxEPQotLSAKMi40Ny4x
Cgo=

--===============3626964565826267874==--

