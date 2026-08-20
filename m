Return-Path: <shinucha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C33FC5DF86
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:00:08 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3180.1787216400907803490
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fP7CWyAW;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: shinucha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2092; q=dns/txt;
  s=iport01; t=1787216400; x=1788426000;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oZi2QaNtOuaz41Xh16CbqRUp6cpqOdwASjuMOPv2GT4=;
  b=fP7CWyAWd01KNX5qRKBoLlRt0b75RS6l0TdN3pbUdxbVqTV/foESmbm+
   BMAFlqX8hSE2Z9mpmyVSbL0Dcbs/6zybsdEiN2NUi8ulUr/FbWzSM0aSy
   60S5ckmSMBiU89DXh1TyfEBcyzSA3v38E94OLSjpKSCIcofpM5pxhYaKX
   WoT6rludDaNBqWtwgZfS2Gv4tUqGOE3T5vHA1Hv0pfmqian9Hh23ZrE5/
   weS2zaucvNptBLeMaeAHQuoujtZ28K4Uw01jOLiYKOpFlxDe0xrk5Mece
   0kiylwhBFkKILZCOMQPG78XP5fAWw/6VMTOjrY0GjbWgSWg9DCjVg1Z8A
   g==;
X-CSE-ConnectionGUID: 9Sedt0hdSNGVP+6GMUq4wg==
X-CSE-MsgGUID: Z+CjKpO/TzKJXDpP7rjOHQ==
X-IPAS-Result: =?us-ascii?q?A0BAAgAkwYZq/4wQJK1aglmCV3RfQkmWSp4egX4PAQEBD?=
 =?us-ascii?q?zcaBAEBhQWNbQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4ZPDYZdNgFGgQxEgwIBgnQCAcJUgiyBAYR92UqBZgELFAEFgTOFcYdwhXInG?=
 =?us-ascii?q?4FJRIR+hRCFeASDLoF4UIExj1FIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQ0bBgWBHYEohDcjGTZ8gQlegSsqYQESF4EJggoCgnCCBgIBSUUOCRcLG?=
 =?us-ascii?q?A1IESw3FBkEPm4HjlEggksBgQ6CAgMQHJM3OJItoQ+EKIFmijuVOhozhASBV?=
 =?us-ascii?q?6URmQiCWaIBhGmBaDyBWU0jFYMiCUoZD5hzxWkkNT0CBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:xmM2ja8GN+Ne4nHb/mAEDrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2BOXjzUOfrfYTP8f9p0b42y9BxQscWHn98wGgBs/n9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYjtFs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lnBoAU5r53DVpo2
 sIga24iSy2a2/25lefTpulE3qzPLeHiOIcZ/3UlxjbDALN+GtbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cO3WjOX9PYH46tPyoh3/ieD1RgFmUvqEwpWPUyWSd1ZC9aYCFKoLXHJQ9ckCwl
 CHt/UfhJVYmJv+9+Radyi22hMjvpHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBXS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:k09QIaxmf/JKgy/y1Q3zKrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:izKHZ2870ov6O3p/2NaVvx8vF8w5Kn3R91H/HXf7V0lMdaTJVlDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AsMX1Hw0meLf2lbRa25rBg/2/gjUj0eeFCmMVttI?=
 =?us-ascii?q?6qeqmBQBoA2iHjhOXe9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="812886519"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:00:00 +0000
Received: from sjc-ads-8046.cisco.com (sjc-ads-8046.cisco.com [171.68.208.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id CF613180001FD;
	Thu, 20 Aug 2026 08:59:59 +0000 (GMT)
Received: by sjc-ads-8046.cisco.com (Postfix, from userid 1784405)
	id 669DFCCD9AB; Thu, 20 Aug 2026 01:59:59 -0700 (PDT)
From: Shinu Chandran <shinucha@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Shinu Chandran <shinucha@cisco.com>
Subject: [OE-core] [master] [PATCH] initscripts: avoid service dependency in mountnfs.sh
Date: Thu, 20 Aug 2026 01:59:56 -0700
Message-Id: <20260820085956.3366518-1-shinucha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-8046.cisco.com [171.68.208.84];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.208.84, sjc-ads-8046.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243824

mountnfs.sh uses "service rpcbind status" only to avoid
starting rpcbind twice before mounting remote filesystems. That
pulls init-system-helpers-service into images solely to provide
/usr/sbin/service.

Use start-stop-daemon test mode for the rpcbind status check
instead. The script already uses start-stop-daemon to start rpcbind,
so this keeps the duplicate-start protection without requiring the
Debian service wrapper.

With mountnfs.sh no longer invoking service, drop
init-system-helpers-service from the initscripts runtime dependencies.

Signed-off-by: Shinu Chandran <shinucha@cisco.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh | 3 +--
 meta/recipes-core/initscripts/initscripts_1.0.bb          | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
index c08597e725..53c6cfd457 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
@@ -71,8 +71,7 @@ if test "$rpcbind" = yes
 then
 	if test -x /usr/sbin/rpcbind
 	then
-		service rpcbind status > /dev/null
-		if [ $? != 0 ]; then
+		if ! start-stop-daemon --stop --test --quiet --exec /usr/sbin/rpcbind; then
 			echo -n "Starting rpcbind..."
 			start-stop-daemon --start --quiet --exec /usr/sbin/rpcbind
 			sleep 2
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index ae386a6281..5e154c0a9b 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -45,7 +45,6 @@ DEPENDS:append = " update-rc.d-native"
 PACKAGES =+ "${PN}-functions ${PN}-sushell"
 RDEPENDS:${PN} = "initd-functions \
                   ${@bb.utils.contains('DISTRO_FEATURES','selinux','${PN}-sushell','',d)} \
-                  init-system-helpers-service \
 		 "
 # Recommend pn-functions so that it will be a preferred default provider for initd-functions
 RRECOMMENDS:${PN} = "${PN}-functions"
-- 
2.35.6


