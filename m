Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A703C25B59
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:15:00 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.22194.1701436491934048854
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eXvEBkpK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qugja3Ke;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018c25847ff4-dc9b1646-1c60-4f99-b461-53151f80e2ba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436489;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=3iHy3d+uTruIughjkDHRnX9Z7IkV/2bd+GpevOIWNqw=;
	b=eXvEBkpKtAM5sL7LiO1N/r65IyzL9Nwuy5inD/02bd7udAk+NbPtugxhQpxl0EPF
	d/nwfIR+tNRYAPQutYrfEwfNYVLp8DqpfohYB6qKiZJdCgRufiQsnZgVJyvpYHXEunK
	homDRGelanEgvQsD2CtzrgEcbRtK/6FX7o7ILYMI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436489;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=3iHy3d+uTruIughjkDHRnX9Z7IkV/2bd+GpevOIWNqw=;
	b=qugja3KeEWX2OPVtqJvMTv7KWr7LtnkDgTegWS0Vrm3Sto+J3vmnmupceZ/YgDNi
	pgLG+A4iuokslUg6bYtvIut81svpnrI1e5XvOE8WgqThLqqCWoXYdPa/4lMPtwj8izP
	j2sbkuFO/mPvMiVDcSERmJX+2tulmRqo1fKYGMqY=
Content-Type: multipart/mixed; boundary="===============3534656873985913116=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] kea: upgrading to 2.4.1 SUCCEEDED
Message-ID: <0101018c25847ff4-dc9b1646-1c60-4f99-b461-53151f80e2ba-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191600

--===============3534656873985913116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kea* to *2.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kea-upgrade-2.4.0-2.4.1.patch
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
From e95ecd76a88bb2bc09295c0334a4260e1698fc75 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 05:29:47 +0000
Subject: [PATCH] kea: upgrade 2.4.0 -> 2.4.1

---
 meta/recipes-connectivity/kea/{kea_2.4.0.bb => kea_2.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/kea/{kea_2.4.0.bb => kea_2.4.1.bb} (97%)

diff --git a/meta/recipes-connectivity/kea/kea_2.4.0.bb b/meta/recipes-connectivity/kea/kea_2.4.1.bb
similarity index 97%
rename from meta/recipes-connectivity/kea/kea_2.4.0.bb
rename to meta/recipes-connectivity/kea/kea_2.4.1.bb
index 316468754e..c3aa4dc8f0 100644
--- a/meta/recipes-connectivity/kea/kea_2.4.0.bb
+++ b/meta/recipes-connectivity/kea/kea_2.4.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            file://0001-kea-fix-reproducible-build-failure.patch \
            "
-SRC_URI[sha256sum] = "3a33cd08dc3319ff544e6bbf2c0429042106f4051ebe115dc1bb2625c95003f7"
+SRC_URI[sha256sum] = "815c61f5c271caa4a1db31dd656eb50a7f6ea973da3690f7c8581408e180131a"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.39.2


--===============3534656873985913116==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kea-upgrade-2.4.0-2.4.1.patch"

RnJvbSBlOTVlY2Q3NmE4OGJiMmJjMDkyOTVjMDMzNGE0MjYwZTE2OThmYzc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAwNToyOTo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtl
YTogdXBncmFkZSAyLjQuMCAtPiAyLjQuMQoKLS0tCiBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2tlYS97a2VhXzIuNC4wLmJiID0+IGtlYV8yLjQuMS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2tlYS97a2VhXzIuNC4wLmJiID0+IGtlYV8yLjQuMS5iYn0gKDk3JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9rZWFfMi40LjAuYmIgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9rZWFfMi40LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5
NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rZWEva2VhXzIuNC4wLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tlYS9rZWFfMi40LjEuYmIKaW5k
ZXggMzE2NDY4NzU0ZS4uYzNhYTRkYzhmMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9rZWEva2VhXzIuNC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
a2VhL2tlYV8yLjQuMS5iYgpAQCAtMTksNyArMTksNyBAQCBTUkNfVVJJID0gImh0dHA6Ly9mdHAu
aXNjLm9yZy9pc2Mva2VhLyR7UFZ9LyR7QlB9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly8w
MDAxLXNyYy1saWItbG9nLWxvZ2dlcl91bml0dGVzdF9zdXBwb3J0LmNjLWRvLW5vdC13cml0ZS0u
cGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1rZWEtZml4LXJlcHJvZHVjaWJsZS1idWls
ZC1mYWlsdXJlLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNh
MzNjZDA4ZGMzMzE5ZmY1NDRlNmJiZjJjMDQyOTA0MjEwNmY0MDUxZWJlMTE1ZGMxYmIyNjI1Yzk1
MDAzZjciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODE1YzYxZjVjMjcxY2FhNGExZGIzMWRkNjU2
ZWI1MGE3ZjZlYTk3M2RhMzY5MGY3Yzg1ODE0MDhlMTgwMTMxYSIKIAogaW5oZXJpdCBhdXRvdG9v
bHMgc3lzdGVtZCB1cGRhdGUtcmMuZCB1cHN0cmVhbS12ZXJzaW9uLWlzLWV2ZW4KIAotLSAKMi4z
OS4yCgo=

--===============3534656873985913116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/kea/kea-dbg: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-64-poky-linux/kea/kea-dbg: PKGSIZE changed from 322286912 to 322259896 (-0%)
packages/core2-64-poky-linux/kea/kea-dbg: PV changed from "2.4.0" to "2.4.1"
packages/core2-64-poky-linux/kea/kea-dbg: FILELIST: removed "/usr/lib/.debug/libkea-dhcp++.so.73.0.0 /usr/lib/.debug/libkea-hooks.so.77.0.0 /usr/lib/.debug/libkea-dhcpsrv.so.89.0.0", added "/usr/lib/.debug/libkea-dhcp++.so.74.0.0 /usr/lib/.debug/libkea-dhcpsrv.so.90.0.0 /usr/lib/.debug/libkea-hooks.so.78.0.0"
packages/core2-64-poky-linux/kea/kea-dev: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-64-poky-linux/kea/kea-dev: PKGSIZE changed from 3983647 to 3983538 (-0%)
packages/core2-64-poky-linux/kea/kea-dev: PV changed from "2.4.0" to "2.4.1"
packages/core2-64-poky-linux/kea/kea-doc: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-64-poky-linux/kea/kea-doc: PKGSIZE changed from 1322079 to 1322472 (+0%)
packages/core2-64-poky-linux/kea/kea-doc: PV changed from "2.4.0" to "2.4.1"
packages/core2-64-poky-linux/kea/kea-locale: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-64-poky-linux/kea/kea-locale: PV changed from "2.4.0" to "2.4.1"
packages/core2-64-poky-linux/kea/kea-src: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-64-poky-linux/kea/kea-src: PKGSIZE changed from 12452496 to 12450507 (-0%)
packages/core2-64-poky-linux/kea/kea-src: PV changed from "2.4.0" to "2.4.1"
packages/core2-64-poky-linux/kea/kea-staticdev: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-64-poky-linux/kea/kea-staticdev: PV changed from "2.4.0" to "2.4.1"
packages/core2-64-poky-linux/kea/kea: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-64-poky-linux/kea/kea: PKGSIZE changed from 17838191 to 17842287 (+0%)
packages/core2-64-poky-linux/kea/kea: PV changed from "2.4.0" to "2.4.1"
packages/core2-64-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-hooks.so.77.0.0 /usr/lib/libkea-dhcpsrv.so.89.0.0 /usr/lib/libkea-dhcp++.so.73.0.0 /usr/lib/libkea-dhcpsrv.so.89 /usr/lib/libkea-dhcp++.so.73 /usr/lib/libkea-hooks.so.77", added "/usr/lib/libkea-hooks.so.78.0.0 /usr/lib/libkea-dhcpsrv.so.90.0.0 /usr/lib/libkea-dhcp++.so.74.0.0 /usr/lib/libkea-hooks.so.78 /usr/lib/libkea-dhcpsrv.so.90 /usr/lib/libkea-dhcp++.so.74"
packages/core2-64-poky-linux/kea: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-64-poky-linux/kea: PV changed from "2.4.0" to "2.4.1"
packages/core2-64-poky-linux/kea: SRC_URI changed from "http://ftp.isc.org/isc/kea/2.4.0/kea-2.4.0.tar.gz file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://fix-multilib-conflict.patch file://fix_pid_keactrl.patch file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch file://0001-kea-fix-reproducible-build-failure.patch" to "http://ftp.isc.org/isc/kea/2.4.1/kea-2.4.1.tar.gz file://kea-dhcp4.service file://kea-dhcp6.service file://kea-dhcp-ddns.service file://kea-dhcp4-server file://kea-dhcp6-server file://kea-dhcp-ddns-server file://fix-multilib-conflict.patch file://fix_pid_keactrl.patch file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch file://0001-kea-fix-reproducible-build-failure.patch"
Changes to packages/core2-64-poky-linux/kea (sysroot):
  /usr/lib/libkea-dhcp++.so changed symlink target from libkea-dhcp++.so.73.0.0 to libkea-dhcp++.so.74.0.0
  /usr/lib/libkea-dhcpsrv.so changed symlink target from libkea-dhcpsrv.so.89.0.0 to libkea-dhcpsrv.so.90.0.0
  /usr/lib/libkea-hooks.so changed symlink target from libkea-hooks.so.77.0.0 to libkea-hooks.so.78.0.0
  /usr/lib/libkea-dhcp++.so.73.0.0 moved to /usr/lib/libkea-dhcp++.so.74.0.0
  /usr/lib/libkea-dhcp++.so.73 moved to /usr/lib/libkea-dhcp++.so.74
  /usr/lib/libkea-dhcpsrv.so.89.0.0 moved to /usr/lib/libkea-dhcpsrv.so.90.0.0
  /usr/lib/libkea-dhcpsrv.so.89 moved to /usr/lib/libkea-dhcpsrv.so.90
  /usr/lib/libkea-hooks.so.77.0.0 moved to /usr/lib/libkea-hooks.so.78.0.0
  /usr/lib/libkea-hooks.so.77 moved to /usr/lib/libkea-hooks.so.78

--===============3534656873985913116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/kea/kea: FILELIST: removed "/usr/lib/libkea-dhcp++.so.73 /usr/lib/libkea-dhcpsrv.so.89 /usr/lib/libkea-hooks.so.77 /usr/lib/libkea-dhcp++.so.73.0.0 /usr/lib/libkea-dhcpsrv.so.89.0.0 /usr/lib/libkea-hooks.so.77.0.0", added "/usr/lib/libkea-dhcp++.so.74 /usr/lib/libkea-hooks.so.78 /usr/lib/libkea-dhcp++.so.74.0.0 /usr/lib/libkea-dhcpsrv.so.90 /usr/lib/libkea-hooks.so.78.0.0 /usr/lib/libkea-dhcpsrv.so.90.0.0"
Changes to packages/core2-64-poky-linux/kea (sysroot):
  /usr/lib/libkea-dhcp++.so changed symlink target from libkea-dhcp++.so.73.0.0 to libkea-dhcp++.so.74.0.0
  /usr/lib/libkea-dhcpsrv.so changed symlink target from libkea-dhcpsrv.so.89.0.0 to libkea-dhcpsrv.so.90.0.0
  /usr/lib/libkea-hooks.so changed symlink target from libkea-hooks.so.77.0.0 to libkea-hooks.so.78.0.0
  /usr/lib/libkea-dhcp++.so.73.0.0 moved to /usr/lib/libkea-dhcp++.so.74.0.0
  /usr/lib/libkea-dhcp++.so.73 moved to /usr/lib/libkea-dhcp++.so.74
  /usr/lib/libkea-dhcpsrv.so.89.0.0 moved to /usr/lib/libkea-dhcpsrv.so.90.0.0
  /usr/lib/libkea-dhcpsrv.so.89 moved to /usr/lib/libkea-dhcpsrv.so.90
  /usr/lib/libkea-hooks.so.77.0.0 moved to /usr/lib/libkea-hooks.so.78.0.0
  /usr/lib/libkea-hooks.so.77 moved to /usr/lib/libkea-hooks.so.78

--===============3534656873985913116==--

