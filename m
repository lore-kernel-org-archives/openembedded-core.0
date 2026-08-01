Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0DAC5516F
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 06:05:28 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.918.1785564319477464355
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 23:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YZLwi1wy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GlAMlij9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019fbbed4b1a-150edd04-3503-40fe-a71e-1feadb12057a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785564318;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=u520+HOZ9UJcpNEjadYylKUoYTJHPNMS4xIdmIWtNVY=;
	b=YZLwi1wyn8t/Gitrft8vGe7gPU0JTS/aja9YFadEi4tQhYmCH6cQFKXs7O95GTF2
	Yt0JRweE9muV6YBPgyxmGaMfOv5E+4kWzW5Dzj3SqhPZxugryhIZZLIlMrbBs7WcQl+
	YCjj75kFYWKO8/MqM2dgvFJWZ7jwVAxVufkndMMg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785564318;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=u520+HOZ9UJcpNEjadYylKUoYTJHPNMS4xIdmIWtNVY=;
	b=GlAMlij91bbJ8rIv6D1rnP5CB/F16KjLObvS547XmBeertjknONze5KaY2nQZavt
	HvKQu0Wv++D8rte1d0KyZuWFUd9IDDur9UfEdyPP6nUdobW2yyDj5Nh+B6JgWDurf1r
	adgCViNIToVSfA8gVLJDj+EZX564ijZj4ZAB5AkY=
Content-Type: multipart/mixed; boundary="===============1299241276855567571=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ttyrun: upgrading to 2.44.0 SUCCEEDED
Message-ID: <0101019fbbed4b1a-150edd04-3503-40fe-a71e-1feadb12057a-000000@us-west-2.amazonses.com>
Date: Sat, 1 Aug 2026 06:05:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 06:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242461

--===============1299241276855567571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ttyrun* to *2.44.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ttyrun-upgrade-2.43.0-2.44.0.patch
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
From bf89a0c9e1a624efee1e445f5ae3a49a61036ddd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Aug 2026 05:28:57 +0000
Subject: [PATCH] ttyrun: upgrade 2.43.0 -> 2.44.0

Source: CHANGELOG.md

* __v2.44.0 (2026-07-31)__

  For Linux kernel version: 7.2

  Changes of existing tools / libraries:
  - create-sehdr: Enable quantum safe keys usage
  - dbginfo.sh: Let zpcimon log both optical module and SMART data
  - libutil/util_fmt: Add util_fmt_type_to_name()
  - nvmemon: Skip SCLP on NVMes with non-IBM subsystem vendor ID
  - opticsmon: zpcimon: Rename opticsmon to zpcimon
  - pvattest: Enable quantum safe keys usage
  - pvimg: Add '--flags <...>' and '--disable-flags <...>' option
  - pvimg: Enable quantum safe keys usage
  - pvsecret: Enable quantum safe keys usage
  - pvverify: Enable quantum safe keys usage
  - zmemtopo: Add CLI option to filter partitions by name
  - zpcimon: Allow setting output format using --format CLI option
  - zpcimon: Monitor for hotplug of NVMes to trigger SMART collection

  Bug Fixes:
  - opticsmon: Fix wrong size check for OPTICS_QSFP28_LOS_IMPLEMENTED_OFFSET
  - opticsmon: Handle error return of ethtool_nl_connect()
  - opticsmon: Fix error path free of struct optics in ethtool_nl_get_optics()
  - opticsmon: Close epoll fd in monitor_wait_loop()
  - opticsmon: Fix wrong JSON print for tx_fault

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
 meta/recipes-core/ttyrun/{ttyrun_2.43.0.bb => ttyrun_2.44.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.43.0.bb => ttyrun_2.44.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.43.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.44.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.43.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.44.0.bb
index 74204013c2..776698e1b6 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.43.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.44.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "f85c8ebba0b482e677de1f2c4d8b67b588fe654d"
+SRCREV = "03f7566436b42c2f1a4ad717dcf610c1f926b8f4"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.47.1


--===============1299241276855567571==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ttyrun-upgrade-2.43.0-2.44.0.patch"

RnJvbSBiZjg5YTBjOWUxYTYyNGVmZWUxZTQ0NWY1YWUzYTQ5YTYxMDM2ZGRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBdWcgMjAyNiAwNToyODo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHR0
eXJ1bjogdXBncmFkZSAyLjQzLjAgLT4gMi40NC4wCgpTb3VyY2U6IENIQU5HRUxPRy5tZAoKKiBf
X3YyLjQ0LjAgKDIwMjYtMDctMzEpX18KCiAgRm9yIExpbnV4IGtlcm5lbCB2ZXJzaW9uOiA3LjIK
CiAgQ2hhbmdlcyBvZiBleGlzdGluZyB0b29scyAvIGxpYnJhcmllczoKICAtIGNyZWF0ZS1zZWhk
cjogRW5hYmxlIHF1YW50dW0gc2FmZSBrZXlzIHVzYWdlCiAgLSBkYmdpbmZvLnNoOiBMZXQgenBj
aW1vbiBsb2cgYm90aCBvcHRpY2FsIG1vZHVsZSBhbmQgU01BUlQgZGF0YQogIC0gbGlidXRpbC91
dGlsX2ZtdDogQWRkIHV0aWxfZm10X3R5cGVfdG9fbmFtZSgpCiAgLSBudm1lbW9uOiBTa2lwIFND
TFAgb24gTlZNZXMgd2l0aCBub24tSUJNIHN1YnN5c3RlbSB2ZW5kb3IgSUQKICAtIG9wdGljc21v
bjogenBjaW1vbjogUmVuYW1lIG9wdGljc21vbiB0byB6cGNpbW9uCiAgLSBwdmF0dGVzdDogRW5h
YmxlIHF1YW50dW0gc2FmZSBrZXlzIHVzYWdlCiAgLSBwdmltZzogQWRkICctLWZsYWdzIDwuLi4+
JyBhbmQgJy0tZGlzYWJsZS1mbGFncyA8Li4uPicgb3B0aW9uCiAgLSBwdmltZzogRW5hYmxlIHF1
YW50dW0gc2FmZSBrZXlzIHVzYWdlCiAgLSBwdnNlY3JldDogRW5hYmxlIHF1YW50dW0gc2FmZSBr
ZXlzIHVzYWdlCiAgLSBwdnZlcmlmeTogRW5hYmxlIHF1YW50dW0gc2FmZSBrZXlzIHVzYWdlCiAg
LSB6bWVtdG9wbzogQWRkIENMSSBvcHRpb24gdG8gZmlsdGVyIHBhcnRpdGlvbnMgYnkgbmFtZQog
IC0genBjaW1vbjogQWxsb3cgc2V0dGluZyBvdXRwdXQgZm9ybWF0IHVzaW5nIC0tZm9ybWF0IENM
SSBvcHRpb24KICAtIHpwY2ltb246IE1vbml0b3IgZm9yIGhvdHBsdWcgb2YgTlZNZXMgdG8gdHJp
Z2dlciBTTUFSVCBjb2xsZWN0aW9uCgogIEJ1ZyBGaXhlczoKICAtIG9wdGljc21vbjogRml4IHdy
b25nIHNpemUgY2hlY2sgZm9yIE9QVElDU19RU0ZQMjhfTE9TX0lNUExFTUVOVEVEX09GRlNFVAog
IC0gb3B0aWNzbW9uOiBIYW5kbGUgZXJyb3IgcmV0dXJuIG9mIGV0aHRvb2xfbmxfY29ubmVjdCgp
CiAgLSBvcHRpY3Ntb246IEZpeCBlcnJvciBwYXRoIGZyZWUgb2Ygc3RydWN0IG9wdGljcyBpbiBl
dGh0b29sX25sX2dldF9vcHRpY3MoKQogIC0gb3B0aWNzbW9uOiBDbG9zZSBlcG9sbCBmZCBpbiBt
b25pdG9yX3dhaXRfbG9vcCgpCiAgLSBvcHRpY3Ntb246IEZpeCB3cm9uZyBKU09OIHByaW50IGZv
ciB0eF9mYXVsdAoKKiBfX3YyLjQzLjEgKDIwMjYtMDctMjIpX18KCiAgRm9yIExpbnV4IGtlcm5l
bCB2ZXJzaW9uOiA3LjEKCiAgQ2hhbmdlcyBvZiBleGlzdGluZyB0b29sczoKICAtIGRhc2RmbXQ6
IENoZWNrIGRpc2sgdHlwZSBiZWZvcmUgcHJvbXB0aW5nIGZvciBibG9ja3NpemUKICAtIGl1Y3Z0
ZXJtL3RzLXNoZWxsOiBJbnRyb2R1Y2UgY29uZmlnIHBhcmFtZXRlciB0byBzcGVjaWZ5IGl1Y3Zj
b25uIGJpbmFyeQogIC0gaXVjdnRlcm0vdHMtc2hlbGw6IEludHJvZHVjZSBwYWdlciBjb25maWcg
dG8gcmVwbGFjZSBlbnYgdmFyaWFibGUKICAtIHB2OiBBZGQgcm9vdCBDQSBvcmdhbml6YXRpb24g
cGlubmluZyB0byBjZXJ0aWZpY2F0ZSB2ZXJpZmljYXRpb24KICAtIHpkdW1wL25nZHVtcDogVXNl
IE9wZW5TU0wncyBTSEEyNTYgdG8gY29tcHV0ZSBkaWdlc3Qgb2YgZHVtcCBpbWFnZQoKICBCdWcg
Rml4ZXM6CiAgLSA5NXNlbC1lYmM6IEFkZCB1ZGV2LXNldHRsZSBkZXBlbmRlbmN5CiAgLSA5NXNl
bC1lYmM6IEFkZCB1bW91bnQgdG8gYm9vdCBzZXJ2aWNlCiAgLSA5NXNlbC1lYmM6IEhhcmRlbiBi
b290IG1vdW50IHNlcnZpY2UKICAtIGZkYXNkOiBGaXggbWVtb3J5IGxlYWsgaW4geWVzX25vKCkg
ZnVuY3Rpb24KICAtIGl1Y3Z0ZXJtL2l1Y3Z0dHk6IEVuc3VyZSBQVFkgYW5kIHNlcnZlciBmZCdz
IGFyZSBjbG9zZWQgYXQgZXhlYwogIC0gaXVjdnRlcm0vaXVjdnR0eTogUHJldmVudCBjb25uZWN0
aW9uIHN0YWxscyB3aGVuIHJlY2VpdmluZyBURVJNIGVudgogIC0gaXVjdnRlcm0vaXVjdnR0eTog
VmFsaWRhdGUgVEVSTSBlbnZpcm9ubWVudCBuYW1lCiAgLSBsaWJrbWlwY2xpZW50OiBQcm90ZWN0
IGZyb20gc3ltbGluay1mb2xsb3dpbmcgYXR0YWNrcwogIC0gbGlia21pcGNsaWVudDogVmFyaW91
cyBidWdmaXhlcwogIC0gbGlic2Vja2V5OiBQcm90ZWN0IGZyb20gc3ltbGluay1mb2xsb3dpbmcg
YXR0YWNrcwogIC0gbGlic2Vja2V5OiBWYXJpb3VzIGJ1Z2ZpeGVzCiAgLSBtb25fcHJvY2Q6IEZp
eCBwb3NzaWJsZSBzdGF0aWMgYnVmZmVyIG92ZXJmbG93CiAgLSBvc2Fzbm1wZDogRml4IFNOTVAg
bm9uLWNvbXBsaWFuY2UKICAtIHpkZXY6IEhhcmRlbiBhZ2FpbnN0IGludmFsaWQgdWRldiwgaW1w
b3J0LCBmaXJtd2FyZSwgb3IgaHlwZXJ2aXNvciBkYXRhCiAgLSB6aXBsLWVkaXRlbnY6IENoZWNr
IGluLWJvb3RtYXAgZW52aXJvbm1lbnQgYmxvY2sgdmFsaWRpdHkKICAtIHppcGwvYm9vdDogQ2hl
Y2sgaW4tYm9vdG1hcCBlbnZpcm9ubWVudCBibG9jayBzeW50YXgKICAtIHppcGw6IENoZWNrIGtl
eXdvcmQgZHVwbGljYXRpb25zIGluIEJMUyBlbnRyaWVzCiAgLSB6aXBsOiBGaXggYnVncyBpbiBt
aXJyb3Igc3VwcG9ydAogIC0gemtleTogUHJvdGVjdCBmcm9tIHN5bWxpbmstZm9sbG93aW5nIGF0
dGFja3MKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS90dHlydW4ve3R0eXJ1bl8yLjQzLjAuYmIgPT4g
dHR5cnVuXzIuNDQuMC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS90dHlydW4ve3R0eXJ1bl8y
LjQzLjAuYmIgPT4gdHR5cnVuXzIuNDQuMC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuNDMuMC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3R0
eXJ1bi90dHlydW5fMi40NC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi40My4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuNDQuMC5iYgppbmRleCA3NDIwNDAxM2MyLi43NzY2
OThlMWI2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuNDMu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuNDQuMC5iYgpAQCAt
Nyw3ICs3LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT1mNTExOGYxNjdiMDU1YmZkN2MzNDUwODAzZjE4NDdhZiIKIAogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL2libS1zMzkwLWxpbnV4L3MzOTAtdG9vbHM7cHJvdG9jb2w9aHR0
cHM7YnJhbmNoPW1hc3Rlcjt0YWc9diR7UFZ9IgotU1JDUkVWID0gImY4NWM4ZWJiYTBiNDgyZTY3
N2RlMWYyYzRkOGI2N2I1ODhmZTY1NGQiCitTUkNSRVYgPSAiMDNmNzU2NjQzNmI0MmMyZjFhNGFk
NzE3ZGNmNjEwYzFmOTI2YjhmNCIKIAogQ1ZFX1BST0RVQ1QgPSAiczM5MC10b29scyIKIAotLSAK
Mi40Ny4xCgo=

--===============1299241276855567571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ttyrun: SRC_URI changed from "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v2.43.0" to "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v2.44.0"
packages/x86-64-v3-poky-linux/ttyrun: PKGV changed from 2.43.0 [default] to 2.44.0 [default]
packages/x86-64-v3-poky-linux/ttyrun: PV changed from "2.43.0" to "2.44.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dbg: PKGV changed from 2.43.0 [default] to 2.44.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dbg: PV changed from "2.43.0" to "2.44.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dev: PKGV changed from 2.43.0 [default] to 2.44.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dev: PV changed from "2.43.0" to "2.44.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-doc: PKGV changed from 2.43.0 [default] to 2.44.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-doc: PV changed from "2.43.0" to "2.44.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-locale: PKGV changed from 2.43.0 [default] to 2.44.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-locale: PV changed from "2.43.0" to "2.44.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: PKGV changed from 2.43.0 [default] to 2.44.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: FILELIST: directory renamed /usr/src/debug/ttyrun/2.43.0/iucvterm/src -> /usr/src/debug/ttyrun/2.44.0/iucvterm/src
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: PV changed from "2.43.0" to "2.44.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-staticdev: PKGV changed from 2.43.0 [default] to 2.44.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-staticdev: PV changed from "2.43.0" to "2.44.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun: PKGV changed from 2.43.0 [default] to 2.44.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun: PV changed from "2.43.0" to "2.44.0"

--===============1299241276855567571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="ttyrun-changelog.txt"

Changelog for ttyrun: 2.43.0 -> 2.44.0
Source: CHANGELOG.md

* __v2.44.0 (2026-07-31)__

  For Linux kernel version: 7.2

  Changes of existing tools / libraries:
  - create-sehdr: Enable quantum safe keys usage
  - dbginfo.sh: Let zpcimon log both optical module and SMART data
  - libutil/util_fmt: Add util_fmt_type_to_name()
  - nvmemon: Skip SCLP on NVMes with non-IBM subsystem vendor ID
  - opticsmon: zpcimon: Rename opticsmon to zpcimon
  - pvattest: Enable quantum safe keys usage
  - pvimg: Add '--flags <...>' and '--disable-flags <...>' option
  - pvimg: Enable quantum safe keys usage
  - pvsecret: Enable quantum safe keys usage
  - pvverify: Enable quantum safe keys usage
  - zmemtopo: Add CLI option to filter partitions by name
  - zpcimon: Allow setting output format using --format CLI option
  - zpcimon: Monitor for hotplug of NVMes to trigger SMART collection

  Bug Fixes:
  - opticsmon: Fix wrong size check for OPTICS_QSFP28_LOS_IMPLEMENTED_OFFSET
  - opticsmon: Handle error return of ethtool_nl_connect()
  - opticsmon: Fix error path free of struct optics in ethtool_nl_get_optics()
  - opticsmon: Close epoll fd in monitor_wait_loop()
  - opticsmon: Fix wrong JSON print for tx_fault

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

--===============1299241276855567571==--

