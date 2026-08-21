Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686A4C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 05:46:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1355.1787291154413457345
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 22:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=g5squoIP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ywts4j/5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a022dab3c7-36d36ade-55eb-4e67-b50d-32a1c151c1ab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787291153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FacGlE/qCIRGIPpntk4OOO5rqtXBXNgrwLWWJuUDXEo=;
	b=g5squoIP9i0vq23hvfN0FZl8Art57S78hSvNzDi6Bo2aUU7ajHzh/ZvlKFng3A1v
	E3ow1N7SX3muAl0glD026osKdh7XRSAzteYTjJuA1pLkOLvQyVmMonqMDWCOsV32N9b
	2Yl5q+iwvVSq4SLCrriurzfy3Dc2gHVVwsIIOfo0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787291153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FacGlE/qCIRGIPpntk4OOO5rqtXBXNgrwLWWJuUDXEo=;
	b=ywts4j/5mtQVJryVszmlVV/DMZIMDezHGnt0JcjYuDP8kDy1/1LI7+Fhj9LUS7oU
	yrdKe4BPNE29G6eyNIbm9MPzET9hL9thvHmIxkNZKJDGFRg83GlcSqU4GWoNJ0aRAHl
	iI8b8NLQMAI1vvMpgbLnrPNxOGmN4QjqXIDkzPlQ=
Content-Type: multipart/mixed; boundary="===============7675393705713305067=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>, Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap-ng-python,libcap-ng: upgrading to 0.9.5,0.9.5 SUCCEEDED
Message-ID: <010101a022dab3c7-36d36ade-55eb-4e67-b50d-32a1c151c1ab-000000@us-west-2.amazonses.com>
Date: Fri, 21 Aug 2026 05:45:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.21-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 05:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243889

--===============7675393705713305067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libcap-ng-python,libcap-ng* to *0.9.5,0.9.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcap-ng-python-libcap-ng-upgrade-0.9.3-0.9.5-0.9.3.patch
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
From cca830ad3717dfb11dc4c02828342cc1818847dd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 21 Aug 2026 05:44:06 +0000
Subject: [PATCH] libcap-ng-python,libcap-ng: upgrade 0.9.3 -> 0.9.5,0.9.3 ->
 0.9.5

Source: ChangeLog

0.9.5
- Fix broken utility_logic_test when run as a 32 bit app
- Install the cap-audit man page conditionally
- Fix V3 file capability usage
- Preserve existing securebits in capng_lock
- Make python configuration a little more strict

0.9.4
- Add bluetooth collection to netcap --advanced
- Don't drop netcap --advanced if only VSOCK kernel headers are missing
- In cap-audit, verify executable is being passed
- Add a systemd simulator to cap-audit: use --service to test a service file
- Improve cap-audit recommendations by correlating syscall outcomes
- Allow supplying vmlinux.h for reproducible cap-audit builds
- Restore --with-python/--without-python as generic Python configure options
- Fix on-demand bash completion loading for the utilities

Source: ChangeLog

0.9.5
- Fix broken utility_logic_test when run as a 32 bit app
- Install the cap-audit man page conditionally
- Fix V3 file capability usage
- Preserve existing securebits in capng_lock
- Make python configuration a little more strict

0.9.4
- Add bluetooth collection to netcap --advanced
- Don't drop netcap --advanced if only VSOCK kernel headers are missing
- In cap-audit, verify executable is being passed
- Add a systemd simulator to cap-audit: use --service to test a service file
- Improve cap-audit recommendations by correlating syscall outcomes
- Allow supplying vmlinux.h for reproducible cap-audit builds
- Restore --with-python/--without-python as generic Python configure options
- Fix on-demand bash completion loading for the utilities
---
 .../{libcap-ng-python_0.9.3.bb => libcap-ng-python_0.9.5.bb}    | 0
 meta/recipes-support/libcap-ng/libcap-ng.inc                    | 2 +-
 .../libcap-ng/{libcap-ng_0.9.3.bb => libcap-ng_0.9.5.bb}        | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.9.3.bb => libcap-ng-python_0.9.5.bb} (100%)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.9.3.bb => libcap-ng_0.9.5.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.5.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.9.5.bb
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 5c1a7fdfea..2a31be6f4d 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 SRC_URI = "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "0ab44af5a23e8edb69a39c0dc803ce4395ff2086"
+SRCREV = "9ae44402f4c405f08b9dd5ec070127d0d92afee4"
 
 inherit lib_package autotools pkgconfig bash-completion
 
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb
-- 
2.47.1


--===============7675393705713305067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libcap-ng-python: PKGV changed from 0.9.3 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python: SRC_URI changed from "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v0.9.3" to "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng-python: PV changed from "0.9.3" to "0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-bash-completion: PKGV changed from 0.9.3 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-bash-completion: PV changed from "0.9.3" to "0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-bin: PKGV changed from 0.9.3 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-bin: PV changed from "0.9.3" to "0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dbg: PKGSIZE changed from 234128 to 235264 (+0%)
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dbg: PKGV changed from 0.9.3 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dbg: PV changed from "0.9.3" to "0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dev: PKGV changed from 0.9.3 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dev: PV changed from "0.9.3" to "0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-doc: PKGV changed from 0.9.3 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-doc: PV changed from "0.9.3" to "0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-locale: PKGV changed from 0.9.3 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-locale: PV changed from "0.9.3" to "0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-src: PKGSIZE changed from 182134 to 182345 (+0%)
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-src: FILELIST: directory renamed /usr/src/debug/libcap-ng-python/0.9.3/bindings/python3 -> /usr/src/debug/libcap-ng-python/0.9.5/bindings/python3
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-src: PKGV changed from 0.9.3 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-src: PV changed from "0.9.3" to "0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-staticdev: PKGV changed from 0.9.3 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-staticdev: PV changed from "0.9.3" to "0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python: PKGV changed from 0.9.3 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python: PV changed from "0.9.3" to "0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng: PKGV changed from 0.9.3 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/libcap-ng: SRC_URI changed from "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v0.9.3" to "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng: PV changed from "0.9.3" to "0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bash-completion: PKGSIZE changed from 1637 to 1923 (+17%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bash-completion: FILELIST: added "/usr/share/bash-completion/completions/netcap /usr/share/bash-completion/completions/pscap /usr/share/bash-completion/completions/filecap /usr/share/bash-completion/completions/cap-audit"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bash-completion: PKGV changed from 0.9.3 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bash-completion: PV changed from "0.9.3" to "0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bin: PKGV changed from 0.9.3 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bin: PV changed from "0.9.3" to "0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dbg: PKGSIZE changed from 341928 to 367088 (+7%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dbg: PKGV changed from 0.9.3 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dbg: PV changed from "0.9.3" to "0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dev: PKGSIZE changed from 5352 to 5296 (-1%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dev: PKGV changed from 0.9.3 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dev: PV changed from "0.9.3" to "0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-doc: PKGSIZE changed from 40975 to 43133 (+5%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-doc: PKGV changed from 0.9.3 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-doc: PV changed from "0.9.3" to "0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-locale: PKGV changed from 0.9.3 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-locale: PV changed from "0.9.3" to "0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-src: PKGSIZE changed from 197446 to 224012 (+13%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-src: FILELIST: directory renamed /usr/src/debug/libcap-ng/0.9.3/src -> /usr/src/debug/libcap-ng/0.9.5/src, removed "/usr/src/debug/libcap-ng/0.9.3/utils/netcap.c /usr/src/debug/libcap-ng/0.9.3/utils/proc-sanitize.h /usr/src/debug/libcap-ng/0.9.3/utils/proc-llist.c /usr/src/debug/libcap-ng/0.9.3/utils/proc-llist.h /usr/src/debug/libcap-ng/0.9.3/utils/proc-sanitize.c /usr/src/debug/libcap-ng/0.9.3/utils/netcap-advanced.c /usr/src/debug/libcap-ng/0.9.3/utils/pscap.c /usr/src/debug/libcap-ng/0.9.3/utils/netcap-advanced.h /usr/src/debug/libcap-ng/0.9.3/utils/filecap.c", added "/usr/src/debug/libcap-ng/0.9.5/utils/netcap.c /usr/src/debug/libcap-ng/0.9.5/utils/proc-sanitize.h /usr/src/debug/libcap-ng/0.9.5/utils/proc-llist.c /usr/src/debug/libcap-ng/0.9.5/utils/proc-account.c /usr/src/debug/libcap-ng/0.9.5/utils/proc-account.h /usr/src/debug/libcap-ng/0.9.5/utils/proc-llist.h /usr/src/debug/libcap-ng/0.9.5/utils/proc-sanitize.c /usr/src/debu
 g/libcap-ng/0.9.5/utils/netcap-advanced.c /usr/src/debug/libcap-ng/0.9.5/utils/proc-output.h /usr/src/debug/libcap-ng/0.9.5/utils/proc-status.h /usr/src/debug/libcap-ng/0.9.5/utils/filecap-path.h /usr/src/debug/libcap-ng/0.9.5/utils/pscap.c /usr/src/debug/libcap-ng/0.9.5/utils/proc-output.c /usr/src/debug/libcap-ng/0.9.5/utils/netcap-advanced.h /usr/src/debug/libcap-ng/0.9.5/utils/filecap.c /usr/src/debug/libcap-ng/0.9.5/utils/filecap-path.c /usr/src/debug/libcap-ng/0.9.5/utils/proc-status.c"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-src: PKGV changed from 0.9.3 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-src: PV changed from "0.9.3" to "0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-staticdev: PKGV changed from 0.9.3 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-staticdev: PV changed from "0.9.3" to "0.9.5"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng: PKGV changed from 0.9.3 [default] to 0.9.5 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng: PV changed from "0.9.3" to "0.9.5"

--===============7675393705713305067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libcap-ng-changelog.txt"

Changelog for libcap-ng: 0.9.3 -> 0.9.5
Source: ChangeLog

0.9.5
- Fix broken utility_logic_test when run as a 32 bit app
- Install the cap-audit man page conditionally
- Fix V3 file capability usage
- Preserve existing securebits in capng_lock
- Make python configuration a little more strict

0.9.4
- Add bluetooth collection to netcap --advanced
- Don't drop netcap --advanced if only VSOCK kernel headers are missing
- In cap-audit, verify executable is being passed
- Add a systemd simulator to cap-audit: use --service to test a service file
- Improve cap-audit recommendations by correlating syscall outcomes
- Allow supplying vmlinux.h for reproducible cap-audit builds
- Restore --with-python/--without-python as generic Python configure options
- Fix on-demand bash completion loading for the utilities

--===============7675393705713305067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bash-completion: PKGSIZE changed from 1637 to 1923 (+17%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bash-completion: FILELIST: added "/usr/share/bash-completion/completions/pscap /usr/share/bash-completion/completions/netcap /usr/share/bash-completion/completions/filecap /usr/share/bash-completion/completions/cap-audit"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-src: PKGSIZE changed from 197446 to 224012 (+13%)

--===============7675393705713305067==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcap-ng-python-libcap-ng-upgrade-0.9.3-0.9.5-0.9.3.patch"

RnJvbSBjY2E4MzBhZDM3MTdkZmIxMWRjNGMwMjgyODM0MmNjMTgxODg0N2RkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjEgQXVnIDIwMjYgMDU6NDQ6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJjYXAtbmctcHl0aG9uLGxpYmNhcC1uZzogdXBncmFkZSAwLjkuMyAtPiAwLjkuNSwwLjkuMyAt
PgogMC45LjUKClNvdXJjZTogQ2hhbmdlTG9nCgowLjkuNQotIEZpeCBicm9rZW4gdXRpbGl0eV9s
b2dpY190ZXN0IHdoZW4gcnVuIGFzIGEgMzIgYml0IGFwcAotIEluc3RhbGwgdGhlIGNhcC1hdWRp
dCBtYW4gcGFnZSBjb25kaXRpb25hbGx5Ci0gRml4IFYzIGZpbGUgY2FwYWJpbGl0eSB1c2FnZQot
IFByZXNlcnZlIGV4aXN0aW5nIHNlY3VyZWJpdHMgaW4gY2FwbmdfbG9jawotIE1ha2UgcHl0aG9u
IGNvbmZpZ3VyYXRpb24gYSBsaXR0bGUgbW9yZSBzdHJpY3QKCjAuOS40Ci0gQWRkIGJsdWV0b290
aCBjb2xsZWN0aW9uIHRvIG5ldGNhcCAtLWFkdmFuY2VkCi0gRG9uJ3QgZHJvcCBuZXRjYXAgLS1h
ZHZhbmNlZCBpZiBvbmx5IFZTT0NLIGtlcm5lbCBoZWFkZXJzIGFyZSBtaXNzaW5nCi0gSW4gY2Fw
LWF1ZGl0LCB2ZXJpZnkgZXhlY3V0YWJsZSBpcyBiZWluZyBwYXNzZWQKLSBBZGQgYSBzeXN0ZW1k
IHNpbXVsYXRvciB0byBjYXAtYXVkaXQ6IHVzZSAtLXNlcnZpY2UgdG8gdGVzdCBhIHNlcnZpY2Ug
ZmlsZQotIEltcHJvdmUgY2FwLWF1ZGl0IHJlY29tbWVuZGF0aW9ucyBieSBjb3JyZWxhdGluZyBz
eXNjYWxsIG91dGNvbWVzCi0gQWxsb3cgc3VwcGx5aW5nIHZtbGludXguaCBmb3IgcmVwcm9kdWNp
YmxlIGNhcC1hdWRpdCBidWlsZHMKLSBSZXN0b3JlIC0td2l0aC1weXRob24vLS13aXRob3V0LXB5
dGhvbiBhcyBnZW5lcmljIFB5dGhvbiBjb25maWd1cmUgb3B0aW9ucwotIEZpeCBvbi1kZW1hbmQg
YmFzaCBjb21wbGV0aW9uIGxvYWRpbmcgZm9yIHRoZSB1dGlsaXRpZXMKClNvdXJjZTogQ2hhbmdl
TG9nCgowLjkuNQotIEZpeCBicm9rZW4gdXRpbGl0eV9sb2dpY190ZXN0IHdoZW4gcnVuIGFzIGEg
MzIgYml0IGFwcAotIEluc3RhbGwgdGhlIGNhcC1hdWRpdCBtYW4gcGFnZSBjb25kaXRpb25hbGx5
Ci0gRml4IFYzIGZpbGUgY2FwYWJpbGl0eSB1c2FnZQotIFByZXNlcnZlIGV4aXN0aW5nIHNlY3Vy
ZWJpdHMgaW4gY2FwbmdfbG9jawotIE1ha2UgcHl0aG9uIGNvbmZpZ3VyYXRpb24gYSBsaXR0bGUg
bW9yZSBzdHJpY3QKCjAuOS40Ci0gQWRkIGJsdWV0b290aCBjb2xsZWN0aW9uIHRvIG5ldGNhcCAt
LWFkdmFuY2VkCi0gRG9uJ3QgZHJvcCBuZXRjYXAgLS1hZHZhbmNlZCBpZiBvbmx5IFZTT0NLIGtl
cm5lbCBoZWFkZXJzIGFyZSBtaXNzaW5nCi0gSW4gY2FwLWF1ZGl0LCB2ZXJpZnkgZXhlY3V0YWJs
ZSBpcyBiZWluZyBwYXNzZWQKLSBBZGQgYSBzeXN0ZW1kIHNpbXVsYXRvciB0byBjYXAtYXVkaXQ6
IHVzZSAtLXNlcnZpY2UgdG8gdGVzdCBhIHNlcnZpY2UgZmlsZQotIEltcHJvdmUgY2FwLWF1ZGl0
IHJlY29tbWVuZGF0aW9ucyBieSBjb3JyZWxhdGluZyBzeXNjYWxsIG91dGNvbWVzCi0gQWxsb3cg
c3VwcGx5aW5nIHZtbGludXguaCBmb3IgcmVwcm9kdWNpYmxlIGNhcC1hdWRpdCBidWlsZHMKLSBS
ZXN0b3JlIC0td2l0aC1weXRob24vLS13aXRob3V0LXB5dGhvbiBhcyBnZW5lcmljIFB5dGhvbiBj
b25maWd1cmUgb3B0aW9ucwotIEZpeCBvbi1kZW1hbmQgYmFzaCBjb21wbGV0aW9uIGxvYWRpbmcg
Zm9yIHRoZSB1dGlsaXRpZXMKLS0tCiAuLi4ve2xpYmNhcC1uZy1weXRob25fMC45LjMuYmIgPT4g
bGliY2FwLW5nLXB5dGhvbl8wLjkuNS5iYn0gICAgfCAwCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJjYXAtbmcvbGliY2FwLW5nLmluYyAgICAgICAgICAgICAgICAgICAgfCAyICstCiAuLi4vbGli
Y2FwLW5nL3tsaWJjYXAtbmdfMC45LjMuYmIgPT4gbGliY2FwLW5nXzAuOS41LmJifSAgICAgICAg
fCAwCiAzIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL3tsaWJjYXAtbmctcHl0aG9uXzAuOS4z
LmJiID0+IGxpYmNhcC1uZy1weXRob25fMC45LjUuYmJ9ICgxMDAlKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmNhcC1uZy97bGliY2FwLW5nXzAuOS4zLmJiID0+IGxpYmNhcC1uZ18w
LjkuNS5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2Fw
LW5nL2xpYmNhcC1uZy1weXRob25fMC45LjMuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJj
YXAtbmcvbGliY2FwLW5nLXB5dGhvbl8wLjkuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZy1weXRob25f
MC45LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAt
bmctcHl0aG9uXzAuOS41LmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJj
YXAtbmcvbGliY2FwLW5nLmluYyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJj
YXAtbmcuaW5jCmluZGV4IDVjMWE3ZmRmZWEuLjJhMzFiZTZmNGQgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmcuaW5jCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmcuaW5jCkBAIC04LDcgKzgsNyBAQCBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT05NGQ1NWQ1MTJhOWJhMzZjYWE5YjdkZjA3
OWJhZTE5ZiBcCiAJCSAgICBmaWxlOi8vQ09QWUlORy5MSUI7bWQ1PWUzZWRhMDFkOTgxNWY4ZDI0
YWFlMmRiZDg5YjY4YjA2IgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vc3RldmVncnVi
Yi9saWJjYXAtbmcuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXI7dGFnPXYke1BWfSIK
LVNSQ1JFViA9ICIwYWI0NGFmNWEyM2U4ZWRiNjlhMzljMGRjODAzY2U0Mzk1ZmYyMDg2IgorU1JD
UkVWID0gIjlhZTQ0NDAyZjRjNDA1ZjA4YjlkZDVlYzA3MDEyN2QwZDkyYWZlZTQiCiAKIGluaGVy
aXQgbGliX3BhY2thZ2UgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBiYXNoLWNvbXBsZXRpb24KIApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZ18wLjkuMy5i
YiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmdfMC45LjUuYmIKc2lt
aWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNh
cC1uZy9saWJjYXAtbmdfMC45LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmNhcC1uZy9saWJjYXAtbmdfMC45LjUuYmIKLS0gCjIuNDcuMQoK

--===============7675393705713305067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libcap-ng-python-changelog.txt"

Changelog for libcap-ng-python: 0.9.3 -> 0.9.5
Source: ChangeLog

0.9.5
- Fix broken utility_logic_test when run as a 32 bit app
- Install the cap-audit man page conditionally
- Fix V3 file capability usage
- Preserve existing securebits in capng_lock
- Make python configuration a little more strict

0.9.4
- Add bluetooth collection to netcap --advanced
- Don't drop netcap --advanced if only VSOCK kernel headers are missing
- In cap-audit, verify executable is being passed
- Add a systemd simulator to cap-audit: use --service to test a service file
- Improve cap-audit recommendations by correlating syscall outcomes
- Allow supplying vmlinux.h for reproducible cap-audit builds
- Restore --with-python/--without-python as generic Python configure options
- Fix on-demand bash completion loading for the utilities

--===============7675393705713305067==--

