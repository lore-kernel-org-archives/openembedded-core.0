Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D7EAC44524
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 05:21:27 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17329.1784784079449446822
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 22:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QxWockRr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=S/kUruxt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019f8d6bc5fc-3b1ade11-14e9-4081-b5d9-726c2abf5627-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784784078;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hRRt/pg2r2tZQIrUQUEbMKVkK+3p0T7e++nwakk9u1U=;
	b=QxWockRrJM9JM0iGnfRRnFQ0rfoQu7mzpSyYRB3e0ItFzeG/eZngYNZ8qaSJeJFD
	20nS6gUcjqQrk8T2Hyi515kUZcRzHd/vQBQVweQzv8GmaTg0LoL1VBdQxsIueTqXJnW
	5s6hxLszNJBLBrCwk0/hctM30v6S+mHsWvmW5wkA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784784078;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hRRt/pg2r2tZQIrUQUEbMKVkK+3p0T7e++nwakk9u1U=;
	b=S/kUruxtkvH3sfapcPWLjg3a+wAJvswNwbUUJhFcTGP6uAUawVNzJkY6c3u/h0Nj
	dSA4ArZcuut6VMJAQVgoRd8G++uRxm6oAFbHNOjMrMGHVzxItbQteyQF3sH1IKhcyQv
	Sh+0KFTeuGWJCZwkuix6zC5lRY0eLvyRgA15jwjE=
Content-Type: multipart/mixed; boundary="===============4552735644483298537=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ttyrun: upgrading to 2.43.1 SUCCEEDED
Message-ID: <0101019f8d6bc5fc-3b1ade11-14e9-4081-b5d9-726c2abf5627-000000@us-west-2.amazonses.com>
Date: Thu, 23 Jul 2026 05:21:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.23-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 05:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241766

--===============4552735644483298537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ttyrun* to *2.43.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ttyrun-upgrade-2.43.0-2.43.1.patch
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
From e79323e956857f5c7fe3e054b7a43ffc7cbaa699 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 23 Jul 2026 05:14:52 +0000
Subject: [PATCH] ttyrun: upgrade 2.43.0 -> 2.43.1

Source: CHANGELOG.md

* __v2.43.1 (2026-07-22)__

  For Linux kernel version: 7.1

  Changes of existing tools:
  - dasdfmt: Check disk type before prompting for blocksize
  - iucvterm/ts-shell: Introduce config parameter to specify iucvconn binary
  - iucvterm/ts-shell: Introduce pager config to replace env variable
  - pv: Add root CA organization pinning to certificate verification
  - zdump/ngdump: Use OpenSSL's SHA256 to compute digest of dump image

  Bug Fixes:
  - 95sel-ebc: Add udev-settle dependency
  - 95sel-ebc: Add umount to boot service
  - 95sel-ebc: Harden boot mount service
  - fdasd: Fix memory leak in yes_no() function
  - iucvterm/iucvtty: Ensure PTY and server fd's are closed at exec
  - iucvterm/iucvtty: Prevent connection stalls when receiving TERM env
  - iucvterm/iucvtty: Validate TERM environment name
  - libkmipclient: Protect from symlink-following attacks
  - libkmipclient: Various bugfixes
  - libseckey: Protect from symlink-following attacks
  - libseckey: Various bugfixes
  - mon_procd: Fix possible static buffer overflow
  - osasnmpd: Fix SNMP non-compliance
  - zdev: Harden against invalid udev, import, firmware, or hypervisor data
  - zipl-editenv: Check in-bootmap environment block validity
  - zipl/boot: Check in-bootmap environment block syntax
  - zipl: Check keyword duplications in BLS entries
  - zipl: Fix bugs in mirror support
  - zkey: Protect from symlink-following attacks
---
 meta/recipes-core/ttyrun/{ttyrun_2.43.0.bb => ttyrun_2.43.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.43.0.bb => ttyrun_2.43.1.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.43.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.43.1.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.43.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.43.1.bb
index 74204013c2..e259583907 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.43.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.43.1.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "f85c8ebba0b482e677de1f2c4d8b67b588fe654d"
+SRCREV = "2a6657dfd15bfa05c43bc956292b27cf4a3b39d3"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.47.1


--===============4552735644483298537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ttyrun: SRC_URI changed from "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v2.43.0" to "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v2.43.1"
packages/x86-64-v3-poky-linux/ttyrun: PKGV changed from 2.43.0 [default] to 2.43.1 [default]
packages/x86-64-v3-poky-linux/ttyrun: PV changed from "2.43.0" to "2.43.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dbg: PKGV changed from 2.43.0 [default] to 2.43.1 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dbg: PV changed from "2.43.0" to "2.43.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dev: PKGV changed from 2.43.0 [default] to 2.43.1 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dev: PV changed from "2.43.0" to "2.43.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-doc: PKGV changed from 2.43.0 [default] to 2.43.1 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-doc: PV changed from "2.43.0" to "2.43.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-locale: PKGV changed from 2.43.0 [default] to 2.43.1 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-locale: PV changed from "2.43.0" to "2.43.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: FILELIST: directory renamed /usr/src/debug/ttyrun/2.43.0/iucvterm/src -> /usr/src/debug/ttyrun/2.43.1/iucvterm/src
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: PKGV changed from 2.43.0 [default] to 2.43.1 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: PV changed from "2.43.0" to "2.43.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-staticdev: PKGV changed from 2.43.0 [default] to 2.43.1 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-staticdev: PV changed from "2.43.0" to "2.43.1"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun: PKGV changed from 2.43.0 [default] to 2.43.1 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun: PV changed from "2.43.0" to "2.43.1"

--===============4552735644483298537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="ttyrun-changelog.txt"

Changelog for ttyrun: 2.43.0 -> 2.43.1
Source: CHANGELOG.md

* __v2.43.1 (2026-07-22)__

  For Linux kernel version: 7.1

  Changes of existing tools:
  - dasdfmt: Check disk type before prompting for blocksize
  - iucvterm/ts-shell: Introduce config parameter to specify iucvconn binary
  - iucvterm/ts-shell: Introduce pager config to replace env variable
  - pv: Add root CA organization pinning to certificate verification
  - zdump/ngdump: Use OpenSSL's SHA256 to compute digest of dump image

  Bug Fixes:
  - 95sel-ebc: Add udev-settle dependency
  - 95sel-ebc: Add umount to boot service
  - 95sel-ebc: Harden boot mount service
  - fdasd: Fix memory leak in yes_no() function
  - iucvterm/iucvtty: Ensure PTY and server fd's are closed at exec
  - iucvterm/iucvtty: Prevent connection stalls when receiving TERM env
  - iucvterm/iucvtty: Validate TERM environment name
  - libkmipclient: Protect from symlink-following attacks
  - libkmipclient: Various bugfixes
  - libseckey: Protect from symlink-following attacks
  - libseckey: Various bugfixes
  - mon_procd: Fix possible static buffer overflow
  - osasnmpd: Fix SNMP non-compliance
  - zdev: Harden against invalid udev, import, firmware, or hypervisor data
  - zipl-editenv: Check in-bootmap environment block validity
  - zipl/boot: Check in-bootmap environment block syntax
  - zipl: Check keyword duplications in BLS entries
  - zipl: Fix bugs in mirror support
  - zkey: Protect from symlink-following attacks

--===============4552735644483298537==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ttyrun-upgrade-2.43.0-2.43.1.patch"

RnJvbSBlNzkzMjNlOTU2ODU3ZjVjN2ZlM2UwNTRiN2E0M2ZmYzdjYmFhNjk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjMgSnVsIDIwMjYgMDU6MTQ6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
dHlydW46IHVwZ3JhZGUgMi40My4wIC0+IDIuNDMuMQoKU291cmNlOiBDSEFOR0VMT0cubWQKCiog
X192Mi40My4xICgyMDI2LTA3LTIyKV9fCgogIEZvciBMaW51eCBrZXJuZWwgdmVyc2lvbjogNy4x
CgogIENoYW5nZXMgb2YgZXhpc3RpbmcgdG9vbHM6CiAgLSBkYXNkZm10OiBDaGVjayBkaXNrIHR5
cGUgYmVmb3JlIHByb21wdGluZyBmb3IgYmxvY2tzaXplCiAgLSBpdWN2dGVybS90cy1zaGVsbDog
SW50cm9kdWNlIGNvbmZpZyBwYXJhbWV0ZXIgdG8gc3BlY2lmeSBpdWN2Y29ubiBiaW5hcnkKICAt
IGl1Y3Z0ZXJtL3RzLXNoZWxsOiBJbnRyb2R1Y2UgcGFnZXIgY29uZmlnIHRvIHJlcGxhY2UgZW52
IHZhcmlhYmxlCiAgLSBwdjogQWRkIHJvb3QgQ0Egb3JnYW5pemF0aW9uIHBpbm5pbmcgdG8gY2Vy
dGlmaWNhdGUgdmVyaWZpY2F0aW9uCiAgLSB6ZHVtcC9uZ2R1bXA6IFVzZSBPcGVuU1NMJ3MgU0hB
MjU2IHRvIGNvbXB1dGUgZGlnZXN0IG9mIGR1bXAgaW1hZ2UKCiAgQnVnIEZpeGVzOgogIC0gOTVz
ZWwtZWJjOiBBZGQgdWRldi1zZXR0bGUgZGVwZW5kZW5jeQogIC0gOTVzZWwtZWJjOiBBZGQgdW1v
dW50IHRvIGJvb3Qgc2VydmljZQogIC0gOTVzZWwtZWJjOiBIYXJkZW4gYm9vdCBtb3VudCBzZXJ2
aWNlCiAgLSBmZGFzZDogRml4IG1lbW9yeSBsZWFrIGluIHllc19ubygpIGZ1bmN0aW9uCiAgLSBp
dWN2dGVybS9pdWN2dHR5OiBFbnN1cmUgUFRZIGFuZCBzZXJ2ZXIgZmQncyBhcmUgY2xvc2VkIGF0
IGV4ZWMKICAtIGl1Y3Z0ZXJtL2l1Y3Z0dHk6IFByZXZlbnQgY29ubmVjdGlvbiBzdGFsbHMgd2hl
biByZWNlaXZpbmcgVEVSTSBlbnYKICAtIGl1Y3Z0ZXJtL2l1Y3Z0dHk6IFZhbGlkYXRlIFRFUk0g
ZW52aXJvbm1lbnQgbmFtZQogIC0gbGlia21pcGNsaWVudDogUHJvdGVjdCBmcm9tIHN5bWxpbmst
Zm9sbG93aW5nIGF0dGFja3MKICAtIGxpYmttaXBjbGllbnQ6IFZhcmlvdXMgYnVnZml4ZXMKICAt
IGxpYnNlY2tleTogUHJvdGVjdCBmcm9tIHN5bWxpbmstZm9sbG93aW5nIGF0dGFja3MKICAtIGxp
YnNlY2tleTogVmFyaW91cyBidWdmaXhlcwogIC0gbW9uX3Byb2NkOiBGaXggcG9zc2libGUgc3Rh
dGljIGJ1ZmZlciBvdmVyZmxvdwogIC0gb3Nhc25tcGQ6IEZpeCBTTk1QIG5vbi1jb21wbGlhbmNl
CiAgLSB6ZGV2OiBIYXJkZW4gYWdhaW5zdCBpbnZhbGlkIHVkZXYsIGltcG9ydCwgZmlybXdhcmUs
IG9yIGh5cGVydmlzb3IgZGF0YQogIC0gemlwbC1lZGl0ZW52OiBDaGVjayBpbi1ib290bWFwIGVu
dmlyb25tZW50IGJsb2NrIHZhbGlkaXR5CiAgLSB6aXBsL2Jvb3Q6IENoZWNrIGluLWJvb3RtYXAg
ZW52aXJvbm1lbnQgYmxvY2sgc3ludGF4CiAgLSB6aXBsOiBDaGVjayBrZXl3b3JkIGR1cGxpY2F0
aW9ucyBpbiBCTFMgZW50cmllcwogIC0gemlwbDogRml4IGJ1Z3MgaW4gbWlycm9yIHN1cHBvcnQK
ICAtIHprZXk6IFByb3RlY3QgZnJvbSBzeW1saW5rLWZvbGxvd2luZyBhdHRhY2tzCi0tLQogbWV0
YS9yZWNpcGVzLWNvcmUvdHR5cnVuL3t0dHlydW5fMi40My4wLmJiID0+IHR0eXJ1bl8yLjQzLjEu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvdHR5cnVuL3t0dHlydW5fMi40My4wLmJiID0+IHR0
eXJ1bl8yLjQzLjEuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdHR5
cnVuL3R0eXJ1bl8yLjQzLjAuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIu
NDMuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29y
ZS90dHlydW4vdHR5cnVuXzIuNDMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvdHR5
cnVuL3R0eXJ1bl8yLjQzLjEuYmIKaW5kZXggNzQyMDQwMTNjMi4uZTI1OTU4MzkwNyAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdHR5cnVuL3R0eXJ1bl8yLjQzLjAuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWNvcmUvdHR5cnVuL3R0eXJ1bl8yLjQzLjEuYmIKQEAgLTcsNyArNyw3IEBAIExJ
Q0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZjUx
MThmMTY3YjA1NWJmZDdjMzQ1MDgwM2YxODQ3YWYiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHVi
LmNvbS9pYm0tczM5MC1saW51eC9zMzkwLXRvb2xzO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0
ZXI7dGFnPXYke1BWfSIKLVNSQ1JFViA9ICJmODVjOGViYmEwYjQ4MmU2NzdkZTFmMmM0ZDhiNjdi
NTg4ZmU2NTRkIgorU1JDUkVWID0gIjJhNjY1N2RmZDE1YmZhMDVjNDNiYzk1NjI5MmIyN2NmNGEz
YjM5ZDMiCiAKIENWRV9QUk9EVUNUID0gInMzOTAtdG9vbHMiCiAKLS0gCjIuNDcuMQoK

--===============4552735644483298537==--

