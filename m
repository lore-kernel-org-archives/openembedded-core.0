Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1814CA100C
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:13 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.5661.1693650551600107115
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RqHiGcl7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nRCWxbSb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018a55707f5b-2cf9491b-421c-41e3-b30d-1aea2e290b8c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650550;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FgPlnk5h2wQ88OVxq+w+jlFrBe1G/KnoYL4I7fnqdsM=;
	b=RqHiGcl7lU+rZEzn+ooeDk9vwv7bJoPz54H02P0wjQtCrRJBJNFO1OfPvVV2FEJp
	CohN36EZn556NiFipex6JKcpwQjJiW+TgGChUcq97PnkLzAqscRp33yic2uE6GcxtBv
	y2hJFn8/kXYNOn6hH5R21t2znXJHFnJ2EaIOXj74=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650550;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FgPlnk5h2wQ88OVxq+w+jlFrBe1G/KnoYL4I7fnqdsM=;
	b=nRCWxbSbjrGpmyB2TkCvc1ME0r/SLL8gv2Sy7uGSkADrphQR3DZo89Hie+jtOEC5
	3T1isC6iqHlGwF0P3J6VWb1HZ28p30oLc9pUjzO855aLs95PxL7zYsOh36vBE4aH7FA
	ha2TGQ0G1SYIaq+j36ddy6ljHCDGIPu6dH2FHFak=
Content-Type: multipart/mixed; boundary="===============5391211200196460978=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bluez5: upgrading to 5.69 SUCCEEDED
Message-ID: <0101018a55707f5b-2cf9491b-421c-41e3-b30d-1aea2e290b8c-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187029

--===============5391211200196460978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bluez5* to *5.69* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bluez5-upgrade-5.68-5.69.patch
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
From dc67dc3358f876abb98af3fe53c1a2f27468be0b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 07:27:07 +0000
Subject: [PATCH] bluez5: upgrade 5.68 -> 5.69

---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 -
 .../bluez5/bluez5/fix-check-ell-path.patch    | 39 -------------------
 .../bluez5/{bluez5_5.68.bb => bluez5_5.69.bb} |  2 +-
 3 files changed, 1 insertion(+), 41 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/fix-check-ell-path.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.68.bb => bluez5_5.69.bb} (94%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index d2ee2b4f12..e10158a6e5 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -55,7 +55,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://0004-src-shared-util.c-include-linux-limits.h.patch \
-           file://fix-check-ell-path.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/fix-check-ell-path.patch b/meta/recipes-connectivity/bluez5/bluez5/fix-check-ell-path.patch
deleted file mode 100644
index 7afa63962d..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/fix-check-ell-path.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Submitted [https://marc.info/?l=linux-bluetooth&m=168818474411163&w=2]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-
-From linux-bluetooth  Sat Jul 01 04:12:52 2023
-From: Rudi Heitbaum <rudi () heitbaum ! com>
-Date: Sat, 01 Jul 2023 04:12:52 +0000
-To: linux-bluetooth
-Subject: [PATCH] configure: Fix check ell path for cross compiling
-Message-Id: <20230701041252.139338-1-rudi () heitbaum ! com>
-X-MARC-Message: https://marc.info/?l=linux-bluetooth&m=168818474411163
-
-Use of AC_CHECK_FILE prevents cross compilation.
-Instead use test to support cross compiling.
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
----
- configure.ac | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index eff297960..bc7edfcd3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -298,9 +298,10 @@ if (test "${enable_external_ell}" = "yes"); then
- 	AC_SUBST(ELL_LIBS)
- fi
- if (test "${enable_external_ell}" != "yes"); then
--	AC_CHECK_FILE(${srcdir}/ell/ell.h, dummy=yes,
--			AC_CHECK_FILE(${srcdir}/../ell/ell/ell.h, dummy=yes,
--				AC_MSG_ERROR(ELL source is required or use --enable-external-ell)))
-+	if (test ! -f ${srcdir}/ell/ell.h) &&
-+			(test ! -f ${srcdir}/../ell/ell/ell.h); then
-+				AC_MSG_ERROR(ELL source is required or use --enable-external-ell)
-+	fi
- fi
- AM_CONDITIONAL(EXTERNAL_ELL, test "${enable_external_ell}" = "yes" ||
- 				(test "${enable_btpclient}" != "yes" &&
--- 
-2.34.1
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.68.bb b/meta/recipes-connectivity/bluez5/bluez5_5.69.bb
similarity index 94%
rename from meta/recipes-connectivity/bluez5/bluez5_5.68.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.69.bb
index 7c7ad75ed8..4673000f60 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.68.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.69.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "fc505e6445cb579a55cacee6821fe70d633921522043d322b696de0a175ff933"
+SRC_URI[sha256sum] = "bc5a35ddc7c72d0d3999a0d7b2175c8b7d57ab670774f8b5b4900ff38a2627fc"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
-- 
2.39.2


--===============5391211200196460978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bluez5/bluez5-dbg: PKGSIZE changed from 26853580 to 27566888 (+3%)
packages/core2-32-poky-linux/bluez5/bluez5-dbg: PKGV changed from 5.68 [default] to 5.69 [default]
packages/core2-32-poky-linux/bluez5/bluez5-dbg: PV changed from "5.68" to "5.69"
packages/core2-32-poky-linux/bluez5/bluez5-dbg: FILELIST: removed "/usr/lib/.debug/libbluetooth.so.3.19.9", added "/usr/lib/.debug/libbluetooth.so.3.19.10"
packages/core2-32-poky-linux/bluez5/bluez5-dev: PKGSIZE changed from 137082 to 137083 (+0%)
packages/core2-32-poky-linux/bluez5/bluez5-dev: PKGV changed from 5.68 [default] to 5.69 [default]
packages/core2-32-poky-linux/bluez5/bluez5-dev: PV changed from "5.68" to "5.69"
packages/core2-32-poky-linux/bluez5/bluez5-doc: PKGV changed from 5.68 [default] to 5.69 [default]
packages/core2-32-poky-linux/bluez5/bluez5-doc: PV changed from "5.68" to "5.69"
packages/core2-32-poky-linux/bluez5/bluez5-locale: PKGV changed from 5.68 [default] to 5.69 [default]
packages/core2-32-poky-linux/bluez5/bluez5-locale: PV changed from "5.68" to "5.69"
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: PKGSIZE changed from 4769496 to 4773688 (+0%)
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: PKGV changed from 5.68 [default] to 5.69 [default]
packages/core2-32-poky-linux/bluez5/bluez5-noinst-tools: PV changed from "5.68" to "5.69"
packages/core2-32-poky-linux/bluez5/bluez5-obex: PKGSIZE changed from 610081 to 614177 (+1%)
packages/core2-32-poky-linux/bluez5/bluez5-obex: PKGV changed from 5.68 [default] to 5.69 [default]
packages/core2-32-poky-linux/bluez5/bluez5-obex: PV changed from "5.68" to "5.69"
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PKGSIZE changed from 4787619 to 4926915 (+3%)
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PKGV changed from 5.68 [default] to 5.69 [default]
packages/core2-32-poky-linux/bluez5/bluez5-ptest: PV changed from "5.68" to "5.69"
packages/core2-32-poky-linux/bluez5/bluez5-src: PKGSIZE changed from 8035117 to 8107931 (+1%)
packages/core2-32-poky-linux/bluez5/bluez5-src: PKGV changed from 5.68 [default] to 5.69 [default]
packages/core2-32-poky-linux/bluez5/bluez5-src: PV changed from "5.68" to "5.69"
packages/core2-32-poky-linux/bluez5/bluez5-src: FILELIST: directory renamed /usr/src/debug/bluez5/5.68-r0/profiles/gap -> /usr/src/debug/bluez5/5.69-r0/profiles/gap, directory renamed /usr/src/debug/bluez5/5.68-r0/profiles/iap -> /usr/src/debug/bluez5/5.69-r0/profiles/iap, directory renamed /usr/src/debug/bluez5/5.68-r0/btio -> /usr/src/debug/bluez5/5.69-r0/btio, directory renamed /usr/src/debug/bluez5/5.68-r0/profiles/deviceinfo -> /usr/src/debug/bluez5/5.69-r0/profiles/deviceinfo, directory renamed /usr/src/debug/bluez5/5.68-r0/profiles/scanparam -> /usr/src/debug/bluez5/5.69-r0/profiles/scanparam, directory renamed /usr/src/debug/bluez5/5.68-r0/profiles/health -> /usr/src/debug/bluez5/5.69-r0/profiles/health, directory renamed /usr/src/debug/bluez5/5.68-r0/tools/parser -> /usr/src/debug/bluez5/5.69-r0/tools/parser, directory renamed /usr/src/debug/bluez5/5.68-r0/obexd/plugins -> /usr/src/debug/bluez5/5.69-r0/obexd/plugins, directory renamed /usr/src/debug/bluez5/5.68-r0/gobex -> /
 usr/src/debug/bluez5/5.69-r0/gobex, directory renamed /usr/src/debug/bluez5/5.68-r0/unit -> /usr/src/debug/bluez5/5.69-r0/unit, directory renamed /usr/src/debug/bluez5/5.68-r0/android -> /usr/src/debug/bluez5/5.69-r0/android, directory renamed /usr/src/debug/bluez5/5.68-r0/profiles/audio -> /usr/src/debug/bluez5/5.69-r0/profiles/audio, directory renamed /usr/src/debug/bluez5/5.68-r0/obexd/src -> /usr/src/debug/bluez5/5.69-r0/obexd/src, directory renamed /usr/src/debug/bluez5/5.68-r0/src -> /usr/src/debug/bluez5/5.69-r0/src, directory renamed /usr/src/debug/bluez5/5.68-r0/lib -> /usr/src/debug/bluez5/5.69-r0/lib, directory renamed /usr/src/debug/bluez5/5.68-r0/src/shared -> /usr/src/debug/bluez5/5.69-r0/src/shared, directory renamed /usr/src/debug/bluez5/5.68-r0/profiles/battery -> /usr/src/debug/bluez5/5.69-r0/profiles/battery, directory renamed /usr/src/debug/bluez5/5.68-r0/gdbus -> /usr/src/debug/bluez5/5.69-r0/gdbus, directory renamed /usr/src/debug/bluez5/5.68-r0/profiles/input 
 -> /usr/src/debug/bluez5/5.69-r0/profiles/input, directory renamed /usr/src/debug/bluez5/5.68-r0/attrib -> /usr/src/debug/bluez5/5.69-r0/attrib, directory renamed /usr/src/debug/bluez5/5.68-r0/profiles/network -> /usr/src/debug/bluez5/5.69-r0/profiles/network, directory renamed /usr/src/debug/bluez5/5.68-r0/obexd/client -> /usr/src/debug/bluez5/5.69-r0/obexd/client, directory renamed /usr/src/debug/bluez5/5.68-r0/monitor -> /usr/src/debug/bluez5/5.69-r0/monitor, directory renamed /usr/src/debug/bluez5/5.68-r0/plugins -> /usr/src/debug/bluez5/5.69-r0/plugins, directory renamed /usr/src/debug/bluez5/5.68-r0/tools -> /usr/src/debug/bluez5/5.69-r0/tools, removed "/usr/src/debug/bluez5/5.68-r0/client/adv_monitor.c /usr/src/debug/bluez5/5.68-r0/client/player.c /usr/src/debug/bluez5/5.68-r0/client/advertising.c /usr/src/debug/bluez5/5.68-r0/client/gatt.h /usr/src/debug/bluez5/5.68-r0/client/main.c /usr/src/debug/bluez5/5.68-r0/client/print.c /usr/src/debug/bluez5/5.68-r0/client/adv_monitor
 .h /usr/src/debug/bluez5/5.68-r0/client/player.h /usr/src/debug/bluez5/5.68-r0/client/admin.h /usr/src/debug/bluez5/5.68-r0/client/gatt.c /usr/src/debug/bluez5/5.68-r0/client/advertising.h /usr/src/debug/bluez5/5.68-r0/client/display.c /usr/src/debug/bluez5/5.68-r0/client/admin.c /usr/src/debug/bluez5/5.68-r0/client/agent.h /usr/src/debug/bluez5/5.68-r0/client/print.h /usr/src/debug/bluez5/5.68-r0/client/display.h /usr/src/debug/bluez5/5.68-r0/client/agent.c", added "/usr/src/debug/bluez5/5.69-r0/client/adv_monitor.c /usr/src/debug/bluez5/5.69-r0/client/adv_monitor.h /usr/src/debug/bluez5/5.69-r0/client/display.c /usr/src/debug/bluez5/5.69-r0/client/display.h /usr/src/debug/bluez5/5.69-r0/client/player.c /usr/src/debug/bluez5/5.69-r0/client/main.c /usr/src/debug/bluez5/5.69-r0/client/player.h /usr/src/debug/bluez5/5.69-r0/client/gatt.h /usr/src/debug/bluez5/5.69-r0/client/mgmt.h /usr/src/debug/bluez5/5.69-r0/client/print.c /usr/src/debug/bluez5/5.69-r0/client/gatt.c /usr/src/debug/b
 luez5/5.69-r0/client/advertising.h /usr/src/debug/bluez5/5.69-r0/client/mgmt.c /usr/src/debug/bluez5/5.69-r0/client/admin.h /usr/src/debug/bluez5/5.69-r0/client/advertising.c /usr/src/debug/bluez5/5.69-r0/client/admin.c /usr/src/debug/bluez5/5.69-r0/client/agent.h /usr/src/debug/bluez5/5.69-r0/client/print.h /usr/src/debug/bluez5/5.69-r0/client/agent.c"
packages/core2-32-poky-linux/bluez5/bluez5-staticdev: PKGV changed from 5.68 [default] to 5.69 [default]
packages/core2-32-poky-linux/bluez5/bluez5-staticdev: PV changed from "5.68" to "5.69"
packages/core2-32-poky-linux/bluez5/bluez5-testtools: PKGV changed from 5.68 [default] to 5.69 [default]
packages/core2-32-poky-linux/bluez5/bluez5-testtools: PV changed from "5.68" to "5.69"
packages/core2-32-poky-linux/bluez5/bluez5: PKGSIZE changed from 5871628 to 6151957 (+5%)
packages/core2-32-poky-linux/bluez5/bluez5: PKGV changed from 5.68 [default] to 5.69 [default]
packages/core2-32-poky-linux/bluez5/bluez5: PV changed from "5.68" to "5.69"
packages/core2-32-poky-linux/bluez5/bluez5: FILELIST: directory renamed /etc/dbus-1/system.d -> /usr/share/dbus-1/system.d, removed "/usr/lib/libbluetooth.so.3.19.9", added "/usr/lib/libbluetooth.so.3.19.10"
packages/core2-32-poky-linux/bluez5: PKGV changed from 5.68 [default] to 5.69 [default]
packages/core2-32-poky-linux/bluez5: PV changed from "5.68" to "5.69"
packages/core2-32-poky-linux/bluez5: SRC_URI changed from "https://cdn.kernel.org/pub/linux/bluetooth/bluez-5.68.tar.xz file://init file://run-ptest file://0001-tests-add-a-target-for-building-tests-without-runnin.patch file://0001-test-gatt-Fix-hung-issue.patch file://0004-src-shared-util.c-include-linux-limits.h.patch file://fix-check-ell-path.patch" to "https://cdn.kernel.org/pub/linux/bluetooth/bluez-5.69.tar.xz file://init file://run-ptest file://0001-tests-add-a-target-for-building-tests-without-runnin.patch file://0001-test-gatt-Fix-hung-issue.patch file://0004-src-shared-util.c-include-linux-limits.h.patch"
Changes to packages/core2-32-poky-linux/bluez5 (sysroot):
  /usr/lib/libbluetooth.so.3 changed symlink target from libbluetooth.so.3.19.9 to libbluetooth.so.3.19.10
  /usr/lib/libbluetooth.so changed symlink target from libbluetooth.so.3.19.9 to libbluetooth.so.3.19.10
  /usr/lib/libbluetooth.so.3.19.10 was added
  /usr/share/dbus-1/system.d was added
  /usr/share/dbus-1/system.d/bluetooth.conf was added
  /usr/lib/libbluetooth.so.3.19.9 was removed

--===============5391211200196460978==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bluez5-upgrade-5.68-5.69.patch"

RnJvbSBkYzY3ZGMzMzU4Zjg3NmFiYjk4YWYzZmU1M2MxYTJmMjc0NjhiZTBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAwNzoyNzowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJs
dWV6NTogdXBncmFkZSA1LjY4IC0+IDUuNjkKCi0tLQogbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9ibHVlejUvYmx1ZXo1LmluYyAgIHwgIDEgLQogLi4uL2JsdWV6NS9ibHVlejUvZml4LWNoZWNr
LWVsbC1wYXRoLnBhdGNoICAgIHwgMzkgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL2JsdWV6NS97
Ymx1ZXo1XzUuNjguYmIgPT4gYmx1ZXo1XzUuNjkuYmJ9IHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDQxIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS9maXgtY2hlY2stZWxsLXBhdGgu
cGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS97Ymx1ZXo1XzUu
NjguYmIgPT4gYmx1ZXo1XzUuNjkuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LmluYyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvYmx1ZXo1L2JsdWV6NS5pbmMKaW5kZXggZDJlZTJiNGYxMi4uZTEwMTU4YTZlNSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LmluYworKysgYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUuaW5jCkBAIC01NSw3ICs1NSw2
IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC9ibHVldG9vdGgvYmx1ZXot
JHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtdGVzdHMtYWRkLWEtdGFyZ2V0
LWZvci1idWlsZGluZy10ZXN0cy13aXRob3V0LXJ1bm5pbi5wYXRjaCBcCiAgICAgICAgICAgIGZp
bGU6Ly8wMDAxLXRlc3QtZ2F0dC1GaXgtaHVuZy1pc3N1ZS5wYXRjaCBcCiAgICAgICAgICAgIGZp
bGU6Ly8wMDA0LXNyYy1zaGFyZWQtdXRpbC5jLWluY2x1ZGUtbGludXgtbGltaXRzLmgucGF0Y2gg
XAotICAgICAgICAgICBmaWxlOi8vZml4LWNoZWNrLWVsbC1wYXRoLnBhdGNoIFwKICAgICAgICAg
ICAgIgogUyA9ICIke1dPUktESVJ9L2JsdWV6LSR7UFZ9IgogCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvZml4LWNoZWNrLWVsbC1wYXRoLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1L2ZpeC1jaGVjay1lbGwt
cGF0aC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggN2FmYTYzOTYyZC4uMDAw
MDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUvZml4
LWNoZWNrLWVsbC1wYXRoLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzkgKzAsMCBAQAotVXBz
dHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vbWFyYy5pbmZvLz9sPWxpbnV4LWJsdWV0
b290aCZtPTE2ODgxODQ3NDQxMTE2MyZ3PTJdCi1TaWduZWQtb2ZmLWJ5OiBBbnVqIE1pdHRhbCA8
YW51ai5taXR0YWxAaW50ZWwuY29tPgotCi1Gcm9tIGxpbnV4LWJsdWV0b290aCAgU2F0IEp1bCAw
MSAwNDoxMjo1MiAyMDIzCi1Gcm9tOiBSdWRpIEhlaXRiYXVtIDxydWRpICgpIGhlaXRiYXVtICEg
Y29tPgotRGF0ZTogU2F0LCAwMSBKdWwgMjAyMyAwNDoxMjo1MiArMDAwMAotVG86IGxpbnV4LWJs
dWV0b290aAotU3ViamVjdDogW1BBVENIXSBjb25maWd1cmU6IEZpeCBjaGVjayBlbGwgcGF0aCBm
b3IgY3Jvc3MgY29tcGlsaW5nCi1NZXNzYWdlLUlkOiA8MjAyMzA3MDEwNDEyNTIuMTM5MzM4LTEt
cnVkaSAoKSBoZWl0YmF1bSAhIGNvbT4KLVgtTUFSQy1NZXNzYWdlOiBodHRwczovL21hcmMuaW5m
by8/bD1saW51eC1ibHVldG9vdGgmbT0xNjg4MTg0NzQ0MTExNjMKLQotVXNlIG9mIEFDX0NIRUNL
X0ZJTEUgcHJldmVudHMgY3Jvc3MgY29tcGlsYXRpb24uCi1JbnN0ZWFkIHVzZSB0ZXN0IHRvIHN1
cHBvcnQgY3Jvc3MgY29tcGlsaW5nLgotCi1TaWduZWQtb2ZmLWJ5OiBSdWRpIEhlaXRiYXVtIDxy
dWRpQGhlaXRiYXVtLmNvbT4KLS0tLQotIGNvbmZpZ3VyZS5hYyB8IDcgKysrKy0tLQotIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQg
YS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGVmZjI5Nzk2MC4uYmM3ZWRmY2Qz
IDEwMDY0NAotLS0tIGEvY29uZmlndXJlLmFjCi0rKysgYi9jb25maWd1cmUuYWMKLUBAIC0yOTgs
OSArMjk4LDEwIEBAIGlmICh0ZXN0ICIke2VuYWJsZV9leHRlcm5hbF9lbGx9IiA9ICJ5ZXMiKTsg
dGhlbgotIAlBQ19TVUJTVChFTExfTElCUykKLSBmaQotIGlmICh0ZXN0ICIke2VuYWJsZV9leHRl
cm5hbF9lbGx9IiAhPSAieWVzIik7IHRoZW4KLS0JQUNfQ0hFQ0tfRklMRSgke3NyY2Rpcn0vZWxs
L2VsbC5oLCBkdW1teT15ZXMsCi0tCQkJQUNfQ0hFQ0tfRklMRSgke3NyY2Rpcn0vLi4vZWxsL2Vs
bC9lbGwuaCwgZHVtbXk9eWVzLAotLQkJCQlBQ19NU0dfRVJST1IoRUxMIHNvdXJjZSBpcyByZXF1
aXJlZCBvciB1c2UgLS1lbmFibGUtZXh0ZXJuYWwtZWxsKSkpCi0rCWlmICh0ZXN0ICEgLWYgJHtz
cmNkaXJ9L2VsbC9lbGwuaCkgJiYKLSsJCQkodGVzdCAhIC1mICR7c3JjZGlyfS8uLi9lbGwvZWxs
L2VsbC5oKTsgdGhlbgotKwkJCQlBQ19NU0dfRVJST1IoRUxMIHNvdXJjZSBpcyByZXF1aXJlZCBv
ciB1c2UgLS1lbmFibGUtZXh0ZXJuYWwtZWxsKQotKwlmaQotIGZpCi0gQU1fQ09ORElUSU9OQUwo
RVhURVJOQUxfRUxMLCB0ZXN0ICIke2VuYWJsZV9leHRlcm5hbF9lbGx9IiA9ICJ5ZXMiIHx8Ci0g
CQkJCSh0ZXN0ICIke2VuYWJsZV9idHBjbGllbnR9IiAhPSAieWVzIiAmJgotLS0gCi0yLjM0LjEK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NV81LjY4
LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1XzUuNjkuYmIKc2lt
aWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
bHVlejUvYmx1ZXo1XzUuNjguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
Ymx1ZXo1L2JsdWV6NV81LjY5LmJiCmluZGV4IDdjN2FkNzVlZDguLjQ2NzMwMDBmNjAgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NV81LjY4LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NV81LjY5LmJiCkBAIC0x
LDYgKzEsNiBAQAogcmVxdWlyZSBibHVlejUuaW5jCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJm
YzUwNWU2NDQ1Y2I1NzlhNTVjYWNlZTY4MjFmZTcwZDYzMzkyMTUyMjA0M2QzMjJiNjk2ZGUwYTE3
NWZmOTMzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImJjNWEzNWRkYzdjNzJkMGQzOTk5YTBkN2Iy
MTc1YzhiN2Q1N2FiNjcwNzc0ZjhiNWI0OTAwZmYzOGEyNjI3ZmMiCiAKIENWRV9TVEFUVVNbQ1ZF
LTIwMjAtMjQ0OTBdID0gImNwZS1pbmNvcnJlY3Q6IFRoaXMgaXNzdWUgaGFzIGtlcm5lbCBmaXhl
cyByYXRoZXIgdGhhbiBibHVleiBmaXhlcyIKIAotLSAKMi4zOS4yCgo=

--===============5391211200196460978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/bluez5/bluez5: FILELIST: directory renamed /etc/dbus-1/system.d -> /usr/share/dbus-1/system.d, removed "/usr/lib/libbluetooth.so.3.19.9", added "/usr/lib/libbluetooth.so.3.19.10"
Changes to packages/core2-32-poky-linux/bluez5 (sysroot):
  /usr/lib/libbluetooth.so.3 changed symlink target from libbluetooth.so.3.19.9 to libbluetooth.so.3.19.10
  /usr/lib/libbluetooth.so changed symlink target from libbluetooth.so.3.19.9 to libbluetooth.so.3.19.10
  /usr/lib/libbluetooth.so.3.19.10 was added
  /usr/share/dbus-1/system.d was added
  /usr/share/dbus-1/system.d/bluetooth.conf was added
  /usr/lib/libbluetooth.so.3.19.9 was removed

--===============5391211200196460978==--

