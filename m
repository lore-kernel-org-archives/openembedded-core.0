Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C451EED630
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:38:00 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.103051.1767267469213645959
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JJRwJaBB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rEVnqJYR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019b79598489-10c53b12-c769-4d73-8092-0cd54396ee9d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267468;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=COoeLWC0eGJn25ZxoBLjId+2ppJ5N8xVvo4g7S+pw34=;
	b=JJRwJaBBo7/jzqID05gEEgWWMtqXGTfH1IeAMPA3ZVAqVZ9jji25xkV6Q/MowR9R
	Ayu4WEpiIoFmFxvLRHVogM1kjYybt94w8Oy2EVc9P8q3+uKfUJ40mT1RL6e5DXKmhFq
	uo6hqi30Gm70HUF6qdE+Lx4Dj45QzeTJGIout0Wc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267468;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=COoeLWC0eGJn25ZxoBLjId+2ppJ5N8xVvo4g7S+pw34=;
	b=rEVnqJYRGM9ZRCafOO6YfoSMGkgYsgXCyc9Awi061J9wjoJ/Pn2xDaq+YUddCItB
	bgdDWeSHBgri5Lt6FtV2dkHb7/5WamdXSUh2VhzljGhCMxcQ3fy/EriQrGa+iFgnpsG
	SoJqHyMBjXTrv/VIa/m4tmBNai8dJ/MjoOe7z1qU=
Content-Type: multipart/mixed; boundary="===============7314824152147678694=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libpcap: upgrading to 1.10.6 SUCCEEDED
Message-ID: <0101019b79598489-10c53b12-c769-4d73-8092-0cd54396ee9d-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228758

--===============7314824152147678694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpcap* to *1.10.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpcap-upgrade-1.10.5-1.10.6.patch
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
From 73363e3362a0043b7d91643ec81f8b8630afa9a3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 06:06:03 +0000
Subject: [PATCH] libpcap: upgrade 1.10.5 -> 1.10.6

---
 .../libpcap/{libpcap_1.10.5.bb => libpcap_1.10.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.10.5.bb => libpcap_1.10.6.bb} (95%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
similarity index 95%
rename from meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
index 7ad52acd06..1b10001035 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.5.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
 DEPENDS = "flex-native bison-native"
 
 SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.xz"
-SRC_URI[sha256sum] = "84fa89ac6d303028c1c5b754abff77224f45eca0a94eb1a34ff0aa9ceece3925"
+SRC_URI[sha256sum] = "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd7c7b5f834d5dfc"
 
 inherit autotools binconfig-disabled pkgconfig
 
-- 
2.47.1


--===============7314824152147678694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libpcap: SRC_URI changed from "https://www.tcpdump.org/release/libpcap-1.10.5.tar.xz" to "https://www.tcpdump.org/release/libpcap-1.10.6.tar.xz"
packages/x86-64-v3-poky-linux/libpcap: PV changed from "1.10.5" to "1.10.6"
packages/x86-64-v3-poky-linux/libpcap: PKGV changed from 1.10.5 [default] to 1.10.6 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap-dbg: FILELIST: removed "/usr/lib/.debug/libpcap.so.1.10.5", added "/usr/lib/.debug/libpcap.so.1.10.6"
packages/x86-64-v3-poky-linux/libpcap/libpcap-dbg: PV changed from "1.10.5" to "1.10.6"
packages/x86-64-v3-poky-linux/libpcap/libpcap-dbg: PKGSIZE changed from 948672 to 970464 (+2%)
packages/x86-64-v3-poky-linux/libpcap/libpcap-dbg: PKGV changed from 1.10.5 [default] to 1.10.6 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap-dev: PV changed from "1.10.5" to "1.10.6"
packages/x86-64-v3-poky-linux/libpcap/libpcap-dev: PKGSIZE changed from 172278 to 175091 (+2%)
packages/x86-64-v3-poky-linux/libpcap/libpcap-dev: PKGV changed from 1.10.5 [default] to 1.10.6 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap-doc: PV changed from "1.10.5" to "1.10.6"
packages/x86-64-v3-poky-linux/libpcap/libpcap-doc: PKGSIZE changed from 250482 to 251195 (+0%)
packages/x86-64-v3-poky-linux/libpcap/libpcap-doc: PKGV changed from 1.10.5 [default] to 1.10.6 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap-locale: PV changed from "1.10.5" to "1.10.6"
packages/x86-64-v3-poky-linux/libpcap/libpcap-locale: PKGV changed from 1.10.5 [default] to 1.10.6 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap-src: FILELIST: directory renamed /usr/src/debug/libpcap/1.10.5/pcap -> /usr/src/debug/libpcap/1.10.6/pcap, directory renamed /usr/src/debug/libpcap/1.10.5 -> /usr/src/debug/libpcap/1.10.6
packages/x86-64-v3-poky-linux/libpcap/libpcap-src: PV changed from "1.10.5" to "1.10.6"
packages/x86-64-v3-poky-linux/libpcap/libpcap-src: PKGSIZE changed from 1528159 to 1558151 (+2%)
packages/x86-64-v3-poky-linux/libpcap/libpcap-src: PKGV changed from 1.10.5 [default] to 1.10.6 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap-staticdev: PV changed from "1.10.5" to "1.10.6"
packages/x86-64-v3-poky-linux/libpcap/libpcap-staticdev: PKGSIZE changed from 1912922 to 1952900 (+2%)
packages/x86-64-v3-poky-linux/libpcap/libpcap-staticdev: PKGV changed from 1.10.5 [default] to 1.10.6 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap: FILELIST: removed "/usr/lib/libpcap.so.1.10.5", added "/usr/lib/libpcap.so.1.10.6"
packages/x86-64-v3-poky-linux/libpcap/libpcap: PV changed from "1.10.5" to "1.10.6"
packages/x86-64-v3-poky-linux/libpcap/libpcap: PKGSIZE changed from 309665 to 321953 (+4%)
packages/x86-64-v3-poky-linux/libpcap/libpcap: PKGV changed from 1.10.5 [default] to 1.10.6 [default]
Changes to packages/x86-64-v3-poky-linux/libpcap (sysroot):
  /usr/lib/libpcap.so.1 changed symlink target from libpcap.so.1.10.5 to libpcap.so.1.10.6
  /usr/lib/libpcap.so.1.10.5 moved to /usr/lib/libpcap.so.1.10.6

--===============7314824152147678694==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpcap-upgrade-1.10.5-1.10.6.patch"

RnJvbSA3MzM2M2UzMzYyYTAwNDNiN2Q5MTY0M2VjODFmOGI4NjMwYWZhOWEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwNjowNjowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnBjYXA6IHVwZ3JhZGUgMS4xMC41IC0+IDEuMTAuNgoKLS0tCiAuLi4vbGlicGNhcC97bGlicGNh
cF8xLjEwLjUuYmIgPT4gbGlicGNhcF8xLjEwLjYuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2xpYnBjYXAve2xpYnBjYXBfMS4xMC41LmJiID0+IGxpYnBjYXBf
MS4xMC42LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
bGlicGNhcC9saWJwY2FwXzEuMTAuNS5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGli
cGNhcC9saWJwY2FwXzEuMTAuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYnBjYXAvbGlicGNhcF8xLjEwLjUuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlicGNhcC9saWJwY2FwXzEuMTAuNi5iYgpp
bmRleCA3YWQ1MmFjZDA2Li4xYjEwMDAxMDM1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2xpYnBjYXAvbGlicGNhcF8xLjEwLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9saWJwY2FwL2xpYnBjYXBfMS4xMC42LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTVlYjI4OTIxN2MxNjBlMjkyMGQy
ZTM1YmRkYzM2NDUzIFwKIERFUEVORFMgPSAiZmxleC1uYXRpdmUgYmlzb24tbmF0aXZlIgogCiBT
UkNfVVJJID0gImh0dHBzOi8vd3d3LnRjcGR1bXAub3JnL3JlbGVhc2UvJHtCUH0udGFyLnh6Igot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjg0ZmE4OWFjNmQzMDMwMjhjMWM1Yjc1NGFiZmY3NzIyNGY0
NWVjYTBhOTRlYjFhMzRmZjBhYTljZWVjZTM5MjUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWM5
N2QxMjA2YmRkMTljYjZiZGQwNDNlYWE5ZjAwMzdhYTczMjI2MmVjNjhlMDcwZmQ3YzdiNWY4MzRk
NWRmYyIKIAogaW5oZXJpdCBhdXRvdG9vbHMgYmluY29uZmlnLWRpc2FibGVkIHBrZ2NvbmZpZwog
Ci0tIAoyLjQ3LjEKCg==

--===============7314824152147678694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libpcap/libpcap: FILELIST: removed "/usr/lib/libpcap.so.1.10.5", added "/usr/lib/libpcap.so.1.10.6"
Changes to packages/x86-64-v3-poky-linux/libpcap (sysroot):
  /usr/lib/libpcap.so.1 changed symlink target from libpcap.so.1.10.5 to libpcap.so.1.10.6
  /usr/lib/libpcap.so.1.10.5 moved to /usr/lib/libpcap.so.1.10.6

--===============7314824152147678694==--

