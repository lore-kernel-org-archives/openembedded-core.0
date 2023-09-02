Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F5ACA100D
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:13 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.5662.1693650551660838941
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PDbJIqZg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PRqwv2eu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018a55707faf-d516e15d-ad56-4d12-8375-29d742b8db94-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650550;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=A9zpCUeZFzZibnxJJpvg90kEmAR3XnItiTXBrJvaBBQ=;
	b=PDbJIqZgba5m6e9oIwVQdORUHsT8AzUL5K7fWXvfErwSzT3xdfB77KdmSYodTLe2
	aYkxgCCXWs/utn4EgJO53eCSlhXzpGJyWpQXEtb+yoINcoLO+gSQSze3ksrkt1y2J4q
	4jQ9yT2mppf8KWkcC/JD2ETid/LfqTmpzfidLykE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650550;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=A9zpCUeZFzZibnxJJpvg90kEmAR3XnItiTXBrJvaBBQ=;
	b=PRqwv2eudjRdriklrYOxmz35FjUZ4TUdON4pMeoqbhwa9Q15jHN0OSvQnpbFlmDl
	mGz7ehkIFc8VUbmyhh1/I5xvILw+hmL5YIX0JkFPD6YU5lN4bYzKxbQjTbHIll8FIlH
	znZOVKmwXHodYtycmiTPTusZKaMOe0kaXvSoueQ4=
Content-Type: multipart/mixed; boundary="===============0766988083324461095=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.18.18 SUCCEEDED
Message-ID: <0101018a55707faf-d516e15d-ad56-4d12-8375-29d742b8db94-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187030

--===============0766988083324461095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bind* to *9.18.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.18.17-9.18.18.patch
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
From 8ce120fe5faf5de0a595d248d5dc68f000394681 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 06:18:21 +0000
Subject: [PATCH] bind: upgrade 9.18.17 -> 9.18.18

---
 .../bind/{bind_9.18.17.bb => bind_9.18.18.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.17.bb => bind_9.18.18.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.17.bb b/meta/recipes-connectivity/bind/bind_9.18.18.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.17.bb
rename to meta/recipes-connectivity/bind/bind_9.18.18.bb
index 9e7973ecbf..e74e685fe8 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.17.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.18.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "bde1c5017b81d1d79c69eb8f537f2e5032fd3623acdd5ee830d4f74bc2483458"
+SRC_URI[sha256sum] = "d735cdc127a6c5709bde475b5bf16fa2133f36fdba202f7c3c37d134e5192160"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.39.2


--===============0766988083324461095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bind/bind-dbg: PV changed from "9.18.17" to "9.18.18"
packages/core2-32-poky-linux/bind/bind-dbg: PKGSIZE changed from 10822536 to 10822872 (+0%)
packages/core2-32-poky-linux/bind/bind-dbg: PKGV changed from 9.18.17 [default] to 9.18.18 [default]
packages/core2-32-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libisccfg-9.18.17.so /usr/lib/.debug/libdns-9.18.17.so /usr/lib/.debug/libbind9-9.18.17.so /usr/lib/.debug/libisccc-9.18.17.so /usr/lib/.debug/libirs-9.18.17.so /usr/lib/.debug/libisc-9.18.17.so /usr/lib/.debug/libns-9.18.17.so", added "/usr/lib/.debug/libisccfg-9.18.18.so /usr/lib/.debug/libdns-9.18.18.so /usr/lib/.debug/libbind9-9.18.18.so /usr/lib/.debug/libisccc-9.18.18.so /usr/lib/.debug/libirs-9.18.18.so /usr/lib/.debug/libisc-9.18.18.so /usr/lib/.debug/libns-9.18.18.so"
packages/core2-32-poky-linux/bind/bind-dev: PV changed from "9.18.17" to "9.18.18"
packages/core2-32-poky-linux/bind/bind-dev: PKGSIZE changed from 1456812 to 1457012 (+0%)
packages/core2-32-poky-linux/bind/bind-dev: PKGV changed from 9.18.17 [default] to 9.18.18 [default]
packages/core2-32-poky-linux/bind/bind-doc: PV changed from "9.18.17" to "9.18.18"
packages/core2-32-poky-linux/bind/bind-doc: PKGV changed from 9.18.17 [default] to 9.18.18 [default]
packages/core2-32-poky-linux/bind/bind-libs: PV changed from "9.18.17" to "9.18.18"
packages/core2-32-poky-linux/bind/bind-libs: PKGV changed from 9.18.17 [default] to 9.18.18 [default]
packages/core2-32-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.18.17.so", added "/usr/lib/*-9.18.18.so"
packages/core2-32-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libirs-9.18.17.so /usr/lib/libdns-9.18.17.so /usr/lib/libisccfg-9.18.17.so /usr/lib/libns-9.18.17.so /usr/lib/libbind9-9.18.17.so /usr/lib/libisccc-9.18.17.so /usr/lib/libisc-9.18.17.so", added "/usr/lib/libirs-9.18.18.so /usr/lib/libisccc-9.18.18.so /usr/lib/libbind9-9.18.18.so /usr/lib/libns-9.18.18.so /usr/lib/libdns-9.18.18.so /usr/lib/libisccfg-9.18.18.so /usr/lib/libisc-9.18.18.so"
packages/core2-32-poky-linux/bind/bind-locale: PV changed from "9.18.17" to "9.18.18"
packages/core2-32-poky-linux/bind/bind-locale: PKGV changed from 9.18.17 [default] to 9.18.18 [default]
packages/core2-32-poky-linux/bind/bind-src: PV changed from "9.18.17" to "9.18.18"
packages/core2-32-poky-linux/bind/bind-src: PKGSIZE changed from 9602755 to 9603653 (+0%)
packages/core2-32-poky-linux/bind/bind-src: PKGV changed from 9.18.17 [default] to 9.18.18 [default]
packages/core2-32-poky-linux/bind/bind-staticdev: PV changed from "9.18.17" to "9.18.18"
packages/core2-32-poky-linux/bind/bind-staticdev: PKGV changed from 9.18.17 [default] to 9.18.18 [default]
packages/core2-32-poky-linux/bind/bind-utils: PV changed from "9.18.17" to "9.18.18"
packages/core2-32-poky-linux/bind/bind-utils: PKGV changed from 9.18.17 [default] to 9.18.18 [default]
packages/core2-32-poky-linux/bind/bind: PV changed from "9.18.17" to "9.18.18"
packages/core2-32-poky-linux/bind/bind: PKGV changed from 9.18.17 [default] to 9.18.18 [default]
packages/core2-32-poky-linux/bind: PV changed from "9.18.17" to "9.18.18"
packages/core2-32-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.18.17/bind-9.18.17.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch" to "https://ftp.isc.org/isc/bind9/9.18.18/bind-9.18.18.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch"
packages/core2-32-poky-linux/bind: PKGV changed from 9.18.17 [default] to 9.18.18 [default]
Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.17.so to libbind9-9.18.18.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.17.so to libdns-9.18.18.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.17.so to libirs-9.18.18.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.17.so to libisccc-9.18.18.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.17.so to libisccfg-9.18.18.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.17.so to libisc-9.18.18.so
  /usr/lib/libns.so changed symlink target from libns-9.18.17.so to libns-9.18.18.so
  /usr/lib/libbind9-9.18.17.so moved to /usr/lib/libbind9-9.18.18.so
  /usr/lib/libdns-9.18.17.so moved to /usr/lib/libdns-9.18.18.so
  /usr/lib/libirs-9.18.17.so moved to /usr/lib/libirs-9.18.18.so
  /usr/lib/libisc-9.18.17.so moved to /usr/lib/libisc-9.18.18.so
  /usr/lib/libisccc-9.18.17.so moved to /usr/lib/libisccc-9.18.18.so
  /usr/lib/libisccfg-9.18.17.so moved to /usr/lib/libisccfg-9.18.18.so
  /usr/lib/libns-9.18.17.so moved to /usr/lib/libns-9.18.18.so

--===============0766988083324461095==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.18.17-9.18.18.patch"

RnJvbSA4Y2UxMjBmZTVmYWY1ZGUwYTU5NWQyNDhkNWRjNjhmMDAwMzk0NjgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAwNjoxODoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJp
bmQ6IHVwZ3JhZGUgOS4xOC4xNyAtPiA5LjE4LjE4CgotLS0KIC4uLi9iaW5kL3tiaW5kXzkuMTgu
MTcuYmIgPT4gYmluZF85LjE4LjE4LmJifSAgICAgICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC97YmluZF85LjE4LjE3LmJiID0+IGJpbmRfOS4xOC4xOC5i
Yn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmlu
ZF85LjE4LjE3LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4xOC4x
OC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2JpbmQvYmluZF85LjE4LjE3LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2JpbmQvYmluZF85LjE4LjE4LmJiCmluZGV4IDllNzk3M2VjYmYuLmU3NGU2ODVmZTgg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMTguMTcu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4xOC4xOC5iYgpA
QCAtMjAsNyArMjAsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZnRwLmlzYy5vcmcvaXNjL2JpbmQ5
LyR7UFZ9LyR7QlBOfS0ke1BWfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1hdm9p
ZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYmRlMWM1MDE3YjgxZDFkNzljNjllYjhmNTM3ZjJlNTAzMmZk
MzYyM2FjZGQ1ZWU4MzBkNGY3NGJjMjQ4MzQ1OCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkNzM1
Y2RjMTI3YTZjNTcwOWJkZTQ3NWI1YmYxNmZhMjEzM2YzNmZkYmEyMDJmN2MzYzM3ZDEzNGU1MTky
MTYwIgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9mdHAuaXNjLm9yZy9pc2MvYmlu
ZDkvIgogIyBmb2xsb3cgdGhlIEVTViB2ZXJzaW9ucyBkaXZpc2libGUgYnkgMgotLSAKMi4zOS4y
Cgo=

--===============0766988083324461095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libns-9.18.17.so /usr/lib/libisccfg-9.18.17.so /usr/lib/libdns-9.18.17.so /usr/lib/libirs-9.18.17.so /usr/lib/libisc-9.18.17.so /usr/lib/libbind9-9.18.17.so /usr/lib/libisccc-9.18.17.so", added "/usr/lib/libns-9.18.18.so /usr/lib/libisc-9.18.18.so /usr/lib/libisccfg-9.18.18.so /usr/lib/libirs-9.18.18.so /usr/lib/libdns-9.18.18.so /usr/lib/libisccc-9.18.18.so /usr/lib/libbind9-9.18.18.so"
Changes to packages/core2-32-poky-linux/bind (sysroot):
  /usr/lib/libbind9.so changed symlink target from libbind9-9.18.17.so to libbind9-9.18.18.so
  /usr/lib/libdns.so changed symlink target from libdns-9.18.17.so to libdns-9.18.18.so
  /usr/lib/libirs.so changed symlink target from libirs-9.18.17.so to libirs-9.18.18.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.18.17.so to libisccc-9.18.18.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.18.17.so to libisccfg-9.18.18.so
  /usr/lib/libisc.so changed symlink target from libisc-9.18.17.so to libisc-9.18.18.so
  /usr/lib/libns.so changed symlink target from libns-9.18.17.so to libns-9.18.18.so
  /usr/lib/libbind9-9.18.17.so moved to /usr/lib/libbind9-9.18.18.so
  /usr/lib/libdns-9.18.17.so moved to /usr/lib/libdns-9.18.18.so
  /usr/lib/libirs-9.18.17.so moved to /usr/lib/libirs-9.18.18.so
  /usr/lib/libisc-9.18.17.so moved to /usr/lib/libisc-9.18.18.so
  /usr/lib/libisccc-9.18.17.so moved to /usr/lib/libisccc-9.18.18.so
  /usr/lib/libisccfg-9.18.17.so moved to /usr/lib/libisccfg-9.18.18.so
  /usr/lib/libns-9.18.17.so moved to /usr/lib/libns-9.18.18.so

--===============0766988083324461095==--

