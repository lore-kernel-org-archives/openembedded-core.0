Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10230.1793510038770422561
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2026 22:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YfPcUNmz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mzWRUjim;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a195875908-e4cd0632-240a-4234-b090-7a95f78897ce-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793510037;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=17zfsnVqZQ8Ha0trHUymllT4kolSMyliHBJkqpZ2G1Y=;
	b=YfPcUNmzqlGs6yKwMfUoql61QBzrqpTCb4labpeps7n951tM+ZEFIPGEKDsbbrdG
	ath9xIRGsubdOleMQssNvyZ4DIVTJ5n5kKBJT5mpLC/yeFd2gGREjfgQ6LX3SUrDbWA
	OsVNJ2S9383cXvffFwFQ8CnGOf7DFYx0b/tjUlYQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793510037;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=17zfsnVqZQ8Ha0trHUymllT4kolSMyliHBJkqpZ2G1Y=;
	b=mzWRUjimwiDfyuXMaYO5IKpje62zVfyHiYxeJsOfLvpb5KEQ2ZkYLoK9NJKKXEkx
	ILdUiKMirli7zAiOpbiHMjePSPfsBBzlVRS7XxWJSrXXuPOxo6w+M+T3RLELpXmNwmg
	mFGKIrUZtCh0afz7MQi0YtbN+10xNaXZpOzn9vuM=
Content-Type: multipart/mixed; boundary="===============8031149242561365328=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ppp: upgrading to 2.5.5 SUCCEEDED
Message-ID: <010101a195875908-e4cd0632-240a-4234-b090-7a95f78897ce-000000@us-west-2.amazonses.com>
Date: Sun, 1 Nov 2026 05:13:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 05:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249149

--===============8031149242561365328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ppp* to *2.5.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ppp-upgrade-2.5.4-2.5.5.patch
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
From e167ec418ca0d3c5cdb0b99acea87bf3f501de70 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Nov 2026 05:09:16 +0000
Subject: [PATCH] ppp: upgrade 2.5.4 -> 2.5.5

---
 meta/recipes-connectivity/ppp/{ppp_2.5.4.bb => ppp_2.5.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ppp/{ppp_2.5.4.bb => ppp_2.5.5.bb} (98%)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.4.bb b/meta/recipes-connectivity/ppp/ppp_2.5.5.bb
similarity index 98%
rename from meta/recipes-connectivity/ppp/ppp_2.5.4.bb
rename to meta/recipes-connectivity/ppp/ppp_2.5.5.bb
index 6f7977ece3..4a21b94907 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.4.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.5.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://ppp@.service \
            "
 
-SRC_URI[sha256sum] = "379a630a40d858a1347f6592d671791dde12101697a743ef9900012f3765be31"
+SRC_URI[sha256sum] = "0ebbcfef906d16cfbb9cbdd19c0d92aa3df2fd8fdd29731f614c58d16a279aa5"
 
 inherit autotools pkgconfig systemd
 
-- 
2.47.1


--===============8031149242561365328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ppp: SRC_URI changed from "https://download.samba.org/pub/ppp/ppp-2.5.4.tar.gz file://pon file://poff file://init file://ip-up file://ip-down file://08setupdns file://92removedns file://pap file://ppp_on_boot file://provider file://ppp@.service" to "https://download.samba.org/pub/ppp/ppp-2.5.5.tar.gz file://pon file://poff file://init file://ip-up file://ip-down file://08setupdns file://92removedns file://pap file://ppp_on_boot file://provider file://ppp@.service"
packages/x86-64-v3-poky-linux/ppp: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/ppp: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-dbg: FILELIST: directory renamed /usr/lib/pppd/2.5.4/.debug -> /usr/lib/pppd/2.5.5/.debug
packages/x86-64-v3-poky-linux/ppp/ppp-dbg: PKGSIZE changed from 1642424 to 1630752 (-1%)
packages/x86-64-v3-poky-linux/ppp/ppp-dbg: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/ppp/ppp-dbg: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-dev: PKGSIZE changed from 95779 to 95781 (+0%)
packages/x86-64-v3-poky-linux/ppp/ppp-dev: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/ppp/ppp-dev: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-dhcpv6relay: FILES: removed "/usr/lib/pppd/2.5.4/dhcpv6relay.so", added "/usr/lib/pppd/2.5.5/dhcpv6relay.so"
packages/x86-64-v3-poky-linux/ppp/ppp-dhcpv6relay: FILELIST: directory renamed /usr/lib/pppd/2.5.4 -> /usr/lib/pppd/2.5.5
packages/x86-64-v3-poky-linux/ppp/ppp-dhcpv6relay: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/ppp/ppp-dhcpv6relay: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-doc: PKGSIZE changed from 127673 to 127868 (+0%)
packages/x86-64-v3-poky-linux/ppp/ppp-doc: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/ppp/ppp-doc: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-l2tp: FILES: removed "/usr/lib/pppd/2.5.4/*l2tp.so", added "/usr/lib/pppd/2.5.5/*l2tp.so"
packages/x86-64-v3-poky-linux/ppp/ppp-l2tp: FILELIST: directory renamed /usr/lib/pppd/2.5.4 -> /usr/lib/pppd/2.5.5
packages/x86-64-v3-poky-linux/ppp/ppp-l2tp: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/ppp/ppp-l2tp: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-locale: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/ppp/ppp-locale: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-minconn: FILES: removed "/usr/lib/pppd/2.5.4/minconn.so", added "/usr/lib/pppd/2.5.5/minconn.so"
packages/x86-64-v3-poky-linux/ppp/ppp-minconn: FILELIST: directory renamed /usr/lib/pppd/2.5.4 -> /usr/lib/pppd/2.5.5
packages/x86-64-v3-poky-linux/ppp/ppp-minconn: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/ppp/ppp-minconn: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-oa: FILES: removed "/usr/lib/pppd/2.5.4/pppoatm.so", added "/usr/lib/pppd/2.5.5/pppoatm.so"
packages/x86-64-v3-poky-linux/ppp/ppp-oa: FILELIST: directory renamed /usr/lib/pppd/2.5.4 -> /usr/lib/pppd/2.5.5
packages/x86-64-v3-poky-linux/ppp/ppp-oa: PKGSIZE changed from 22912 to 18816 (-18%)
packages/x86-64-v3-poky-linux/ppp/ppp-oa: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/ppp/ppp-oa: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-oe: FILES: removed "/usr/lib/pppd/2.5.4/*pppoe.so", added "/usr/lib/pppd/2.5.5/*pppoe.so"
packages/x86-64-v3-poky-linux/ppp/ppp-oe: FILELIST: directory renamed /usr/lib/pppd/2.5.4 -> /usr/lib/pppd/2.5.5
packages/x86-64-v3-poky-linux/ppp/ppp-oe: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/ppp/ppp-oe: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-password: FILES: removed "/usr/lib/pppd/2.5.4/pass*.so", added "/usr/lib/pppd/2.5.5/pass*.so"
packages/x86-64-v3-poky-linux/ppp/ppp-password: FILELIST: directory renamed /usr/lib/pppd/2.5.4 -> /usr/lib/pppd/2.5.5
packages/x86-64-v3-poky-linux/ppp/ppp-password: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/ppp/ppp-password: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-radius: FILES: removed "/usr/lib/pppd/2.5.4/radattr.so /usr/lib/pppd/2.5.4/radrealms.so /usr/lib/pppd/2.5.4/radius.so", added "/usr/lib/pppd/2.5.5/radattr.so /usr/lib/pppd/2.5.5/radrealms.so /usr/lib/pppd/2.5.5/radius.so"
packages/x86-64-v3-poky-linux/ppp/ppp-radius: FILELIST: directory renamed /usr/lib/pppd/2.5.4 -> /usr/lib/pppd/2.5.5
packages/x86-64-v3-poky-linux/ppp/ppp-radius: PKGSIZE changed from 106320 to 102224 (-4%)
packages/x86-64-v3-poky-linux/ppp/ppp-radius: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/ppp/ppp-radius: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-src: FILELIST: directory renamed /usr/src/debug/ppp/2.5.4/pppd/plugins/pppoe -> /usr/src/debug/ppp/2.5.5/pppd/plugins/pppoe, directory renamed /usr/src/debug/ppp/2.5.4/chat -> /usr/src/debug/ppp/2.5.5/chat, directory renamed /usr/src/debug/ppp/2.5.4/pppstats -> /usr/src/debug/ppp/2.5.5/pppstats, directory renamed /usr/src/debug/ppp/2.5.4/pppd/plugins/pppol2tp -> /usr/src/debug/ppp/2.5.5/pppd/plugins/pppol2tp, directory renamed /usr/src/debug/ppp/2.5.4/pppdump -> /usr/src/debug/ppp/2.5.5/pppdump, directory renamed /usr/src/debug/ppp/2.5.4/pppd/plugins -> /usr/src/debug/ppp/2.5.5/pppd/plugins, directory renamed /usr/src/debug/ppp/2.5.4/pppd/plugins/dhcpv6relay -> /usr/src/debug/ppp/2.5.5/pppd/plugins/dhcpv6relay, directory renamed /usr/src/debug/ppp/2.5.4/pppd -> /usr/src/debug/ppp/2.5.5/pppd, removed "/usr/src/debug/ppp/2.5.4/pppd/plugins/pppoatm/atm.h /usr/src/debug/ppp/2.5.4/pppd/plugins/radius/options.h /usr/src/debug/ppp/2.5.4/pppd/plugins/ppp
 oatm/ans.c /usr/src/debug/ppp/2.5.4/pppd/plugins/radius/lock.c /usr/src/debug/ppp/2.5.4/pppd/plugins/pppoatm/text2atm.c /usr/src/debug/ppp/2.5.4/pppd/plugins/radius/radius.c /usr/src/debug/ppp/2.5.4/pppd/plugins/pppoatm/misc.c /usr/src/debug/ppp/2.5.4/pppd/plugins/pppoatm/atmres.h /usr/src/debug/ppp/2.5.4/pppd/plugins/radius/ip_util.c /usr/src/debug/ppp/2.5.4/pppd/plugins/radius/dict.c /usr/src/debug/ppp/2.5.4/pppd/plugins/pppoatm/pppoatm.c /usr/src/debug/ppp/2.5.4/pppd/plugins/radius/radrealms.c /usr/src/debug/ppp/2.5.4/pppd/plugins/radius/config.c /usr/src/debug/ppp/2.5.4/pppd/plugins/radius/md5.c /usr/src/debug/ppp/2.5.4/pppd/plugins/pppoatm/text2qos.c /usr/src/debug/ppp/2.5.4/pppd/plugins/radius/buildreq.c /usr/src/debug/ppp/2.5.4/pppd/plugins/radius/radiusclient.h /usr/src/debug/ppp/2.5.4/pppd/plugins/radius/radattr.c /usr/src/debug/ppp/2.5.4/pppd/plugins/radius/clientid.c /usr/src/debug/ppp/2.5.4/pppd/plugins/radius/includes.h /usr/src/debug/ppp/2.5.4/pppd/plugins/radius/avpai
 r.c /usr/src/debug/ppp/2.5.4/pppd/plugins/radius/util.c /usr/src/debug/ppp/2.5.4/pppd/plugins/radius/sendserver.c", added "/usr/src/debug/ppp/2.5.5/pppd/plugins/pppoatm/atm.h /usr/src/debug/ppp/2.5.5/pppd/plugins/radius/options.h /usr/src/debug/ppp/2.5.5/pppd/plugins/radius/lock.c /usr/src/debug/ppp/2.5.5/pppd/plugins/pppoatm/text2atm.c /usr/src/debug/ppp/2.5.5/pppd/plugins/radius/radius.c /usr/src/debug/ppp/2.5.5/pppd/plugins/pppoatm/misc.c /usr/src/debug/ppp/2.5.5/pppd/plugins/radius/ip_util.c /usr/src/debug/ppp/2.5.5/pppd/plugins/radius/dict.c /usr/src/debug/ppp/2.5.5/pppd/plugins/pppoatm/pppoatm.c /usr/src/debug/ppp/2.5.5/pppd/plugins/radius/radrealms.c /usr/src/debug/ppp/2.5.5/pppd/plugins/radius/config.c /usr/src/debug/ppp/2.5.5/pppd/plugins/pppoatm/text2qos.c /usr/src/debug/ppp/2.5.5/pppd/plugins/radius/buildreq.c /usr/src/debug/ppp/2.5.5/pppd/plugins/radius/radiusclient.h /usr/src/debug/ppp/2.5.5/pppd/plugins/radius/radattr.c /usr/src/debug/ppp/2.5.5/pppd/plugins/radius/clie
 ntid.c /usr/src/debug/ppp/2.5.5/pppd/plugins/radius/includes.h /usr/src/debug/ppp/2.5.5/pppd/plugins/radius/avpair.c /usr/src/debug/ppp/2.5.5/pppd/plugins/radius/util.c /usr/src/debug/ppp/2.5.5/pppd/plugins/radius/sendserver.c"
packages/x86-64-v3-poky-linux/ppp/ppp-src: PKGSIZE changed from 1417444 to 1410777 (-0%)
packages/x86-64-v3-poky-linux/ppp/ppp-src: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/ppp/ppp-src: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-staticdev: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/ppp/ppp-staticdev: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-tools: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/ppp/ppp-tools: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/ppp/ppp-winbind: FILES: removed "/usr/lib/pppd/2.5.4/winbind.so", added "/usr/lib/pppd/2.5.5/winbind.so"
packages/x86-64-v3-poky-linux/ppp/ppp-winbind: FILELIST: directory renamed /usr/lib/pppd/2.5.4 -> /usr/lib/pppd/2.5.5
packages/x86-64-v3-poky-linux/ppp/ppp-winbind: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/ppp/ppp-winbind: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/ppp/ppp: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/ppp/ppp: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
Changes to packages/x86-64-v3-poky-linux/ppp (sysroot):
  /usr/lib/pppd/2.5.4 moved to /usr/lib/pppd/2.5.5

--===============8031149242561365328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ppp/ppp-dhcpv6relay: FILELIST: directory renamed /usr/lib/pppd/2.5.4 -> /usr/lib/pppd/2.5.5
packages/x86-64-v3-poky-linux/ppp/ppp-l2tp: FILELIST: directory renamed /usr/lib/pppd/2.5.4 -> /usr/lib/pppd/2.5.5
packages/x86-64-v3-poky-linux/ppp/ppp-minconn: FILELIST: directory renamed /usr/lib/pppd/2.5.4 -> /usr/lib/pppd/2.5.5
packages/x86-64-v3-poky-linux/ppp/ppp-oa: FILELIST: directory renamed /usr/lib/pppd/2.5.4 -> /usr/lib/pppd/2.5.5
packages/x86-64-v3-poky-linux/ppp/ppp-oa: PKGSIZE changed from 22912 to 18816 (-18%)
packages/x86-64-v3-poky-linux/ppp/ppp-oe: FILELIST: directory renamed /usr/lib/pppd/2.5.4 -> /usr/lib/pppd/2.5.5
packages/x86-64-v3-poky-linux/ppp/ppp-password: FILELIST: directory renamed /usr/lib/pppd/2.5.4 -> /usr/lib/pppd/2.5.5
packages/x86-64-v3-poky-linux/ppp/ppp-radius: FILELIST: directory renamed /usr/lib/pppd/2.5.4 -> /usr/lib/pppd/2.5.5
packages/x86-64-v3-poky-linux/ppp/ppp-winbind: FILELIST: directory renamed /usr/lib/pppd/2.5.4 -> /usr/lib/pppd/2.5.5
Changes to packages/x86-64-v3-poky-linux/ppp (sysroot):
  /usr/lib/pppd/2.5.4 moved to /usr/lib/pppd/2.5.5

--===============8031149242561365328==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ppp-upgrade-2.5.4-2.5.5.patch"

RnJvbSBlMTY3ZWM0MThjYTBkM2M1Y2RiMGI5OWFjZWE4N2JmM2Y1MDFkZTcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBOb3YgMjAyNiAwNTowOToxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBw
cDogdXBncmFkZSAyLjUuNCAtPiAyLjUuNQoKLS0tCiBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L3BwcC97cHBwXzIuNS40LmJiID0+IHBwcF8yLjUuNS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L3BwcC97cHBwXzIuNS40LmJiID0+IHBwcF8yLjUuNS5iYn0gKDk4JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3BwcC9wcHBfMi41LjQuYmIgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L3BwcC9wcHBfMi41LjUuYmIKc2ltaWxhcml0eSBpbmRleCA5
OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9wcHAvcHBwXzIuNS40LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3BwcC9wcHBfMi41LjUuYmIKaW5k
ZXggNmY3OTc3ZWNlMy4uNGEyMWI5NDkwNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9wcHAvcHBwXzIuNS40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
cHBwL3BwcF8yLjUuNS5iYgpAQCAtMjUsNyArMjUsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZG93
bmxvYWQuc2FtYmEub3JnL3B1Yi8ke0JQTn0vJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgZmls
ZTovL3BwcEAuc2VydmljZSBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjM3OWE2MzBhNDBkODU4YTEzNDdmNjU5MmQ2NzE3OTFkZGUxMjEwMTY5N2E3NDNlZjk5MDAwMTJm
Mzc2NWJlMzEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGViYmNmZWY5MDZkMTZjZmJiOWNiZGQx
OWMwZDkyYWEzZGYyZmQ4ZmRkMjk3MzFmNjE0YzU4ZDE2YTI3OWFhNSIKIAogaW5oZXJpdCBhdXRv
dG9vbHMgcGtnY29uZmlnIHN5c3RlbWQKIAotLSAKMi40Ny4xCgo=

--===============8031149242561365328==--
