Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E65C41535
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:11 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web08.2321.1651434542273153462
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=gmuY3hlh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 01010180812b5032-aaef7348-1f8d-4e7f-b64e-0361f5e1ca7c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434541;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Wa8hb+/+srI3ctRKw9AkDcfQIO/WSmerVwEWQLXTTNI=;
	b=gmuY3hlhSPBtcbK34VqBh8x5fPHhiqLPRm9OS/NYnhJz35BZCdDJwzNgCeOHZBMu
	/XkXsrjz+VCuwkPFm3XfhroClFrMHTyz74moZlFOVGq/Upl0hoIrrL+wPs3ExN/nwQP
	5vSCC1uRp5X8wz4V41djuy5H4StsSqPBgFIdozwM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434541;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Wa8hb+/+srI3ctRKw9AkDcfQIO/WSmerVwEWQLXTTNI=;
	b=BzFJb/TLgP1Sr4eq0Fz+OIJGFy5fXkjS0s3axxUM6cwCA1Peo0G6zzsZD+B5/EhN
	5cm8gN32Jb8L8QdWJq5gKo1RjcFP7eZgJPYsVxZ+/X03/mm2ZPAz/JU4Rr+my5A9nXQ
	VRJqxgP6TPPqelHShlqkOq8rPx4qtsscsgublRNQ=
Content-Type: multipart/mixed; boundary="===============7112639909990201339=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ell: upgrading to 0.50 SUCCEEDED
Message-ID: 
 <01010180812b5032-aaef7348-1f8d-4e7f-b64e-0361f5e1ca7c-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:01 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165095

--===============7112639909990201339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ell* to *0.50* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ell-upgrade-0.49-0.50.patch
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
--===============7112639909990201339==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-ell-upgrade-0.49-0.50.patch"

From bf53d4ff8b046fb0a591a244659e1d0dd3c0d628 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 08:02:53 +0000
Subject: [PATCH] ell: upgrade 0.49 -> 0.50

---
 meta/recipes-core/ell/{ell_0.49.bb => ell_0.50.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.49.bb => ell_0.50.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.49.bb b/meta/recipes-core/ell/ell_0.50.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.49.bb
rename to meta/recipes-core/ell/ell_0.50.bb
index 9edd6fc92a..243ac01530 100644
--- a/meta/recipes-core/ell/ell_0.49.bb
+++ b/meta/recipes-core/ell/ell_0.50.bb
@@ -16,7 +16,7 @@ inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "a7ff8ecbc76b187d942dd22b61cb489711400897c790319ffb7e944791687c3f"
+SRC_URI[sha256sum] = "0fe51d51c6eddc2a2784092f1dfdd1143a5ef27f15c274ecfbadd680d3a72fd9"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.27.0


--===============7112639909990201339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/ell/ell-dev: FILELIST: added "/usr/include/ell/netconfig.h"
Changes to packages/core2-32-poky-linux/ell (sysroot):
  /usr/include/ell/netconfig.h was added

--===============7112639909990201339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ell/ell-dbg: PKGSIZE changed from 1265720 to 1284188 (+1%)
packages/core2-32-poky-linux/ell/ell-dbg: PV changed from "0.49" to "0.50"
packages/core2-32-poky-linux/ell/ell-dbg: PKGV changed from 0.49 [default] to 0.50 [default]
packages/core2-32-poky-linux/ell/ell-dev: PKGSIZE changed from 142273 to 146552 (+3%)
packages/core2-32-poky-linux/ell/ell-dev: PV changed from "0.49" to "0.50"
packages/core2-32-poky-linux/ell/ell-dev: FILELIST: added "/usr/include/ell/netconfig.h"
packages/core2-32-poky-linux/ell/ell-dev: PKGV changed from 0.49 [default] to 0.50 [default]
packages/core2-32-poky-linux/ell/ell-doc: PV changed from "0.49" to "0.50"
packages/core2-32-poky-linux/ell/ell-doc: PKGV changed from 0.49 [default] to 0.50 [default]
packages/core2-32-poky-linux/ell/ell-locale: PV changed from "0.49" to "0.50"
packages/core2-32-poky-linux/ell/ell-locale: PKGV changed from 0.49 [default] to 0.50 [default]
packages/core2-32-poky-linux/ell/ell-src: PKGSIZE changed from 1325280 to 1349293 (+2%)
packages/core2-32-poky-linux/ell/ell-src: PV changed from "0.49" to "0.50"
packages/core2-32-poky-linux/ell/ell-src: FILELIST: directory renamed /usr/src/debug/ell/0.49-r0/ell-0.49/linux -> /usr/src/debug/ell/0.50-r0/ell-0.50/linux, removed "/usr/src/debug/ell/0.49-r0/ell-0.49/ell/useful.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/checksum.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/key.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/string.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/path.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dhcp-util.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/settings.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/ringbuf.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/siphash.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/tls-suites.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/uuid.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dhcp6-transport.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/main.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/net.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dbus.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/log.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dh
 cp-private.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/pem.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/signal.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/settings.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/file.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/checksum.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dbus-util.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/cert-crypto.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/uintset.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/queue.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/netlink.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/time.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/tls-extensions.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/queue.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/netlink.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/signal.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/hashmap.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/tls-record.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/util.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/icmp6.h /usr/src/debug/ell/0.49-r0/ell-0.49/e
 ll/tls.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/main.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/random.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/cert.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dbus-service.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dhcp-lease.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/gvariant-util.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/tester.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dhcp6.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/tls.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/uuid.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dhcp6-lease.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/net.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/genl.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/ecc-external.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/io.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/tls-private.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/acd.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/tester.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/string.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/strv.c
  /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dhcp.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/hwdb.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/icmp6.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dbus-client.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dbus-service.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dhcp-transport.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/base64.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/cert-private.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/idle.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/hashmap.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/genl.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dbus.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dhcp.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/random.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/ecdh.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/icmp6-private.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/timeout.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/hwdb.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/uintset.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/ecc.h /
 usr/src/debug/ell/0.49-r0/ell-0.49/ell/time.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/idle.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/rtnl.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/time-private.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/main-private.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/utf8.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/cipher.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dbus-name-cache.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dbus-filter.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/util.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/timeout.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dhcp-server.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/ecc.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/ecc-private.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/cert.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dhcp6-private.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dir.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/acd.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/ringbuf.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/str
 v.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/log.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/cipher.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/gvariant-private.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/pem-private.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/io.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/gpio.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/asn1-private.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/ecdh.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dhcp6.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/base64.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dbus-client.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/test.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/utf8.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/key.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/rtnl.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dbus-message.c /usr/src/debug/ell/0.49-r0/ell-0.49/ell/net-private.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dir.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/dbus-private.h /usr/src/debug/ell/0.49-r0/ell-0.49/ell/tes
 t.c", added "/usr/src/debug/ell/0.50-r0/ell-0.50/ell/time.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/useful.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/net.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/uuid.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/tls-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/io.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/netlink.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/hashmap.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/rtnl.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/key.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/icmp6-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/random.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/icmp6.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/icmp6.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/path.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/timeout.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/asn1-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/string.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/netcon
 fig.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/checksum.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/base64.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/cert.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/main-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/ecdh.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/genl.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dbus-message.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/uintset.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/log.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp6-transport.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/ecc.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/signal.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/ecc-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/cipher.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/time-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/tls.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/main.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dbus-filter.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/tls-extensions.c /usr/src/debug/ell/0.50-r0/el
 l-0.50/ell/ringbuf.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/pem.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/settings.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/utf8.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/ecc-external.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/uintset.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/idle.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/acd.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp6.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dbus.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp-util.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/test.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/netconfig.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/main.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/checksum.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/tester.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/time.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/cipher.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dbus-util.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/net-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell
 /uuid.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/queue.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp6-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp6-lease.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/string.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/random.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/strv.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/base64.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dbus-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/utf8.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/io.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dbus.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/cert-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/siphash.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/ringbuf.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/gvariant-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp-transport.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp-server.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dir.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dir.c /usr/src/debug/ell/0.50-r0
 /ell-0.50/ell/dbus-service.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp6.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/tls-record.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dbus-name-cache.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/tls-suites.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/hwdb.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dbus-service.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/key.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/file.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/settings.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/queue.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/tls.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/ecc.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/rtnl.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/signal.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dbus-client.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/tester.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/timeout.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/util.h /usr/src/debug/ell/0.50-r0/
 ell-0.50/ell/acd.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/gvariant-util.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/ecdh.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/gpio.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/cert.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/net.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/pem-private.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/test.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/idle.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/strv.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/log.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dhcp-lease.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/hashmap.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/netlink.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/hwdb.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/genl.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/dbus-client.h /usr/src/debug/ell/0.50-r0/ell-0.50/ell/cert-crypto.c /usr/src/debug/ell/0.50-r0/ell-0.50/ell/util.c"
packages/core2-32-poky-linux/ell/ell-src: PKGV changed from 0.49 [default] to 0.50 [default]
packages/core2-32-poky-linux/ell/ell-staticdev: PV changed from "0.49" to "0.50"
packages/core2-32-poky-linux/ell/ell-staticdev: PKGV changed from 0.49 [default] to 0.50 [default]
packages/core2-32-poky-linux/ell/ell: PKGSIZE changed from 535723 to 548011 (+2%)
packages/core2-32-poky-linux/ell/ell: PV changed from "0.49" to "0.50"
packages/core2-32-poky-linux/ell/ell: PKGV changed from 0.49 [default] to 0.50 [default]
packages/core2-32-poky-linux/ell: SRC_URI changed from "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.49.tar.xz" to "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.50.tar.xz"
packages/core2-32-poky-linux/ell: PV changed from "0.49" to "0.50"
packages/core2-32-poky-linux/ell: PKGV changed from 0.49 [default] to 0.50 [default]
Changes to packages/core2-32-poky-linux/ell (sysroot):
  /usr/include/ell/netconfig.h was added

--===============7112639909990201339==--

