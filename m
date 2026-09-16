Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6FEC982C5
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 05:44:58 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8415.1789537492023160758
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 22:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VeNpFD+V;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gzwkPDgi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a0a8bf18b6-cd690a59-d107-477e-8f01-11b00701e5ea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789537491;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hFv3BhDuDAvyZh2pLC6vWF+bOIa3brNcAATouIJyHE4=;
	b=VeNpFD+Vf/9AqZzWZGnt96SEcD+3xQSKmF5NLJK6bdEWHE8sU0RYmgL3P70co0kR
	CO1h9W+3QHfTI51MR/mGtas/YTKU0/C1uu9GYsHkttQ0XXMhK1Q3vOsT5R89hiYmczj
	M07l+Zue+Vo2tgbLoKbIQih4L2qdenIvkQI/MwVs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789537491;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hFv3BhDuDAvyZh2pLC6vWF+bOIa3brNcAATouIJyHE4=;
	b=gzwkPDgikSfqbGDyWT1M+ot8jL6TSIWdOAjkzbBcKFMQj5lAq9FXs1Q9lV+DW+mE
	zNkxby4jsb3Z+nHifSGdIXGEPOc9sulJt0ZyljnFqvBLuDDU/lcrfzk2CCD9reZteqB
	O9+vA3lHqL86pOrY9YT97O7hH0g3Y5CqPIBhQDXg=
Content-Type: multipart/mixed; boundary="===============2383127882095852197=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ppp: upgrading to 2.5.4 SUCCEEDED
Message-ID: <010101a0a8bf18b6-cd690a59-d107-477e-8f01-11b00701e5ea-000000@us-west-2.amazonses.com>
Date: Wed, 16 Sep 2026 05:44:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 05:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245917

--===============2383127882095852197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ppp* to *2.5.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ppp-upgrade-2.5.3-2.5.4.patch
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
From 9ea63038b5edff7af1d4ebdc2129b49313b3fe55 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Sep 2026 05:13:25 +0000
Subject: [PATCH] ppp: upgrade 2.5.3 -> 2.5.4

---
 meta/recipes-connectivity/ppp/{ppp_2.5.3.bb => ppp_2.5.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ppp/{ppp_2.5.3.bb => ppp_2.5.4.bb} (98%)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.3.bb b/meta/recipes-connectivity/ppp/ppp_2.5.4.bb
similarity index 98%
rename from meta/recipes-connectivity/ppp/ppp_2.5.3.bb
rename to meta/recipes-connectivity/ppp/ppp_2.5.4.bb
index 1815782169..6f7977ece3 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.3.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.4.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://ppp@.service \
            "
 
-SRC_URI[sha256sum] = "ddda28dec8aca99a403ab6070d94ffd2b17d63e9a4c5509158e99e148f572d4f"
+SRC_URI[sha256sum] = "379a630a40d858a1347f6592d671791dde12101697a743ef9900012f3765be31"
 
 inherit autotools pkgconfig systemd
 
-- 
2.47.1


--===============2383127882095852197==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ppp-upgrade-2.5.3-2.5.4.patch"

RnJvbSA5ZWE2MzAzOGI1ZWRmZjdhZjFkNGViZGMyMTI5YjQ5MzEzYjNmZTU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgU2VwIDIwMjYgMDU6MTM6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
cHA6IHVwZ3JhZGUgMi41LjMgLT4gMi41LjQKCi0tLQogbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9wcHAve3BwcF8yLjUuMy5iYiA9PiBwcHBfMi41LjQuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9wcHAve3BwcF8yLjUuMy5iYiA9PiBwcHBfMi41LjQuYmJ9ICg5OCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9wcHAvcHBwXzIuNS4zLmJiIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9wcHAvcHBwXzIuNS40LmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvcHBwL3BwcF8yLjUuMy5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9wcHAvcHBwXzIuNS40LmJiCmlu
ZGV4IDE4MTU3ODIxNjkuLjZmNzk3N2VjZTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvcHBwL3BwcF8yLjUuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L3BwcC9wcHBfMi41LjQuYmIKQEAgLTI1LDcgKzI1LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2Rv
d25sb2FkLnNhbWJhLm9yZy9wdWIvJHtCUE59LyR7QlB9LnRhci5neiBcCiAgICAgICAgICAgIGZp
bGU6Ly9wcHBALnNlcnZpY2UgXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJkZGRhMjhkZWM4YWNhOTlhNDAzYWI2MDcwZDk0ZmZkMmIxN2Q2M2U5YTRjNTUwOTE1OGU5OWUx
NDhmNTcyZDRmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM3OWE2MzBhNDBkODU4YTEzNDdmNjU5
MmQ2NzE3OTFkZGUxMjEwMTY5N2E3NDNlZjk5MDAwMTJmMzc2NWJlMzEiCiAKIGluaGVyaXQgYXV0
b3Rvb2xzIHBrZ2NvbmZpZyBzeXN0ZW1kCiAKLS0gCjIuNDcuMQoK

--===============2383127882095852197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ppp/ppp-dhcpv6relay: FILELIST: directory renamed /usr/lib/pppd/2.5.3 -> /usr/lib/pppd/2.5.4
packages/x86-64-v3-poky-linux/ppp/ppp-l2tp: FILELIST: directory renamed /usr/lib/pppd/2.5.3 -> /usr/lib/pppd/2.5.4
packages/x86-64-v3-poky-linux/ppp/ppp-minconn: FILELIST: directory renamed /usr/lib/pppd/2.5.3 -> /usr/lib/pppd/2.5.4
packages/x86-64-v3-poky-linux/ppp/ppp-oa: FILELIST: directory renamed /usr/lib/pppd/2.5.3 -> /usr/lib/pppd/2.5.4
packages/x86-64-v3-poky-linux/ppp/ppp-oe: FILELIST: directory renamed /usr/lib/pppd/2.5.3 -> /usr/lib/pppd/2.5.4
packages/x86-64-v3-poky-linux/ppp/ppp-password: FILELIST: directory renamed /usr/lib/pppd/2.5.3 -> /usr/lib/pppd/2.5.4
packages/x86-64-v3-poky-linux/ppp/ppp-radius: FILELIST: directory renamed /usr/lib/pppd/2.5.3 -> /usr/lib/pppd/2.5.4
packages/x86-64-v3-poky-linux/ppp/ppp-winbind: FILELIST: directory renamed /usr/lib/pppd/2.5.3 -> /usr/lib/pppd/2.5.4
Changes to packages/x86-64-v3-poky-linux/ppp (sysroot):
  /usr/lib/pppd/2.5.3 moved to /usr/lib/pppd/2.5.4

--===============2383127882095852197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ppp: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/ppp: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/ppp: SRC_URI changed from "https://download.samba.org/pub/ppp/ppp-2.5.3.tar.gz file://pon file://poff file://init file://ip-up file://ip-down file://08setupdns file://92removedns file://pap file://ppp_on_boot file://provider file://ppp@.service" to "https://download.samba.org/pub/ppp/ppp-2.5.4.tar.gz file://pon file://poff file://init file://ip-up file://ip-down file://08setupdns file://92removedns file://pap file://ppp_on_boot file://provider file://ppp@.service"
packages/x86-64-v3-poky-linux/ppp/ppp-dbg: FILELIST: directory renamed /usr/lib/pppd/2.5.3/.debug -> /usr/lib/pppd/2.5.4/.debug
packages/x86-64-v3-poky-linux/ppp/ppp-dbg: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/ppp/ppp-dbg: PKGSIZE changed from 1625776 to 1642424 (+1%)
packages/x86-64-v3-poky-linux/ppp/ppp-dbg: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-dev: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/ppp/ppp-dev: PKGSIZE changed from 96140 to 95779 (-0%)
packages/x86-64-v3-poky-linux/ppp/ppp-dev: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-dhcpv6relay: FILELIST: directory renamed /usr/lib/pppd/2.5.3 -> /usr/lib/pppd/2.5.4
packages/x86-64-v3-poky-linux/ppp/ppp-dhcpv6relay: FILES: removed "/usr/lib/pppd/2.5.3/dhcpv6relay.so", added "/usr/lib/pppd/2.5.4/dhcpv6relay.so"
packages/x86-64-v3-poky-linux/ppp/ppp-dhcpv6relay: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/ppp/ppp-dhcpv6relay: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-doc: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/ppp/ppp-doc: PKGSIZE changed from 125194 to 127673 (+2%)
packages/x86-64-v3-poky-linux/ppp/ppp-doc: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-l2tp: FILELIST: directory renamed /usr/lib/pppd/2.5.3 -> /usr/lib/pppd/2.5.4
packages/x86-64-v3-poky-linux/ppp/ppp-l2tp: FILES: removed "/usr/lib/pppd/2.5.3/*l2tp.so", added "/usr/lib/pppd/2.5.4/*l2tp.so"
packages/x86-64-v3-poky-linux/ppp/ppp-l2tp: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/ppp/ppp-l2tp: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-locale: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/ppp/ppp-locale: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-minconn: FILELIST: directory renamed /usr/lib/pppd/2.5.3 -> /usr/lib/pppd/2.5.4
packages/x86-64-v3-poky-linux/ppp/ppp-minconn: FILES: removed "/usr/lib/pppd/2.5.3/minconn.so", added "/usr/lib/pppd/2.5.4/minconn.so"
packages/x86-64-v3-poky-linux/ppp/ppp-minconn: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/ppp/ppp-minconn: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-oa: FILELIST: directory renamed /usr/lib/pppd/2.5.3 -> /usr/lib/pppd/2.5.4
packages/x86-64-v3-poky-linux/ppp/ppp-oa: FILES: removed "/usr/lib/pppd/2.5.3/pppoatm.so", added "/usr/lib/pppd/2.5.4/pppoatm.so"
packages/x86-64-v3-poky-linux/ppp/ppp-oa: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/ppp/ppp-oa: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-oe: FILELIST: directory renamed /usr/lib/pppd/2.5.3 -> /usr/lib/pppd/2.5.4
packages/x86-64-v3-poky-linux/ppp/ppp-oe: FILES: removed "/usr/lib/pppd/2.5.3/*pppoe.so", added "/usr/lib/pppd/2.5.4/*pppoe.so"
packages/x86-64-v3-poky-linux/ppp/ppp-oe: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/ppp/ppp-oe: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-password: FILELIST: directory renamed /usr/lib/pppd/2.5.3 -> /usr/lib/pppd/2.5.4
packages/x86-64-v3-poky-linux/ppp/ppp-password: FILES: removed "/usr/lib/pppd/2.5.3/pass*.so", added "/usr/lib/pppd/2.5.4/pass*.so"
packages/x86-64-v3-poky-linux/ppp/ppp-password: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/ppp/ppp-password: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-radius: FILELIST: directory renamed /usr/lib/pppd/2.5.3 -> /usr/lib/pppd/2.5.4
packages/x86-64-v3-poky-linux/ppp/ppp-radius: FILES: removed "/usr/lib/pppd/2.5.3/radattr.so /usr/lib/pppd/2.5.3/radrealms.so /usr/lib/pppd/2.5.3/radius.so", added "/usr/lib/pppd/2.5.4/radattr.so /usr/lib/pppd/2.5.4/radrealms.so /usr/lib/pppd/2.5.4/radius.so"
packages/x86-64-v3-poky-linux/ppp/ppp-radius: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/ppp/ppp-radius: PKGSIZE changed from 98128 to 106320 (+8%)
packages/x86-64-v3-poky-linux/ppp/ppp-radius: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-src: FILELIST: directory renamed /usr/src/debug/ppp/2.5.3/pppd/plugins/pppol2tp -> /usr/src/debug/ppp/2.5.4/pppd/plugins/pppol2tp, directory renamed /usr/src/debug/ppp/2.5.3/chat -> /usr/src/debug/ppp/2.5.4/chat, directory renamed /usr/src/debug/ppp/2.5.3/pppd/plugins/pppoatm -> /usr/src/debug/ppp/2.5.4/pppd/plugins/pppoatm, directory renamed /usr/src/debug/ppp/2.5.3/pppd/plugins/radius -> /usr/src/debug/ppp/2.5.4/pppd/plugins/radius, directory renamed /usr/src/debug/ppp/2.5.3/pppdump -> /usr/src/debug/ppp/2.5.4/pppdump, directory renamed /usr/src/debug/ppp/2.5.3/pppd/plugins/pppoe -> /usr/src/debug/ppp/2.5.4/pppd/plugins/pppoe, directory renamed /usr/src/debug/ppp/2.5.3/pppd/plugins/dhcpv6relay -> /usr/src/debug/ppp/2.5.4/pppd/plugins/dhcpv6relay, directory renamed /usr/src/debug/ppp/2.5.3/pppd/plugins -> /usr/src/debug/ppp/2.5.4/pppd/plugins, directory renamed /usr/src/debug/ppp/2.5.3/pppstats -> /usr/src/debug/ppp/2.5.4/pppstats, directory ren
 amed /usr/src/debug/ppp/2.5.3/pppd -> /usr/src/debug/ppp/2.5.4/pppd
packages/x86-64-v3-poky-linux/ppp/ppp-src: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/ppp/ppp-src: PKGSIZE changed from 1435148 to 1417444 (-1%)
packages/x86-64-v3-poky-linux/ppp/ppp-src: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-staticdev: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/ppp/ppp-staticdev: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-tools: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/ppp/ppp-tools: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-winbind: FILELIST: directory renamed /usr/lib/pppd/2.5.3 -> /usr/lib/pppd/2.5.4
packages/x86-64-v3-poky-linux/ppp/ppp-winbind: FILES: removed "/usr/lib/pppd/2.5.3/winbind.so", added "/usr/lib/pppd/2.5.4/winbind.so"
packages/x86-64-v3-poky-linux/ppp/ppp-winbind: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/ppp/ppp-winbind: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/x86-64-v3-poky-linux/ppp/ppp: PV changed from "2.5.3" to "2.5.4"
packages/x86-64-v3-poky-linux/ppp/ppp: PKGSIZE changed from 441484 to 449964 (+2%)
packages/x86-64-v3-poky-linux/ppp/ppp: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
Changes to packages/x86-64-v3-poky-linux/ppp (sysroot):
  /usr/lib/pppd/2.5.3 moved to /usr/lib/pppd/2.5.4

--===============2383127882095852197==--

