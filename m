Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49798C71135
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 07:38:12 +0000 (UTC)
Received: from h4.cmg1.smtp.forpsi.com (h4.cmg1.smtp.forpsi.com [185.129.138.163])
 by mx.groups.io with SMTP id smtpd.web11.25020.1750059483828344273
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 00:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=HIqb3s4w;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=HIqb3s4w;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.163, mailfrom: andrej.v@skyrain.eu)
Received: from localhost.localdomain ([178.143.45.236])
	by cmgsmtp with ESMTPSA
	id R4PXuVHP2wQNXR4PouNx3H; Mon, 16 Jun 2025 09:38:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1750059481; bh=+b1i77pujX5aAOa2t0U5vHREy65qO2Z9bhe6csTyOzE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=HIqb3s4w7hqz40zHYEHlPSMhQYrpAqQZjJlWccRWvRLkzqN4JiMXUagLfn2ylV+DZ
	 ptEKu49/glFmQ1MWCyeLm9K82HpR4yic3XG/INbzcNTdjkGRNhzj3wfPsEOiU7iOfC
	 W9g5+uaMlxJ4IoAiXUCin24nBH0KoE7Wr99c0syZz+ZTHQDHm8vuZR9fyUEZpsgIXZ
	 gpOVSz6TJwYGNAzdoKcXG5BM55qr77MJko4sdmvXesfKq881ejYMGsWbfzHJCcWj/z
	 w4KZ6mP4p7CKMwHgnnyo8nWomgeTmkcuktpynVGzHqsr13EfiHWzmPldgTyFB/kn3e
	 nidNjK1FxPEkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1750059481; bh=+b1i77pujX5aAOa2t0U5vHREy65qO2Z9bhe6csTyOzE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=HIqb3s4w7hqz40zHYEHlPSMhQYrpAqQZjJlWccRWvRLkzqN4JiMXUagLfn2ylV+DZ
	 ptEKu49/glFmQ1MWCyeLm9K82HpR4yic3XG/INbzcNTdjkGRNhzj3wfPsEOiU7iOfC
	 W9g5+uaMlxJ4IoAiXUCin24nBH0KoE7Wr99c0syZz+ZTHQDHm8vuZR9fyUEZpsgIXZ
	 gpOVSz6TJwYGNAzdoKcXG5BM55qr77MJko4sdmvXesfKq881ejYMGsWbfzHJCcWj/z
	 w4KZ6mP4p7CKMwHgnnyo8nWomgeTmkcuktpynVGzHqsr13EfiHWzmPldgTyFB/kn3e
	 nidNjK1FxPEkQ==
From: Andrej Valek <andrej.v@skyrain.eu>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	Andrej Valek <andrej.v@skyrain.eu>
Subject: [OE-core][meta][PATCH v2] dropbear: add xauth runtime recommends dependency on x11 DISTRO_FEATURE
Date: Mon, 16 Jun 2025 09:37:42 +0200
Message-Id: <20250616073742.47439-1-andrej.v@skyrain.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605091828.50442-1-andrej.v@skyrain.eu>
References: <20250605091828.50442-1-andrej.v@skyrain.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfOa4zY4Vx11IK/StEkPuthAxQ3i8wut2NnDeOVarH8zwr+o5WnPp4D7K8mJmBuyojjTXUfhPGryi4lypcJISYpMIpeNtNgS03oQqdJVmnogpqqkJsAur
 Zd4yqF8gQeQVNBkm3k1VdkaC0a3ATk7O58fE/K97yR0EukoQqmxPMibzKgB1nMGHFAOupIVIxAei4LjyO5JKZ8oWdOA+qK4+4jdmpO9qETTG6GDfwhaPt3C9
 9XXMlLCFstxu4r4lGQ5ZnrSnJClV/QygUrojn/3wF7hjMF9UGJ9gB4PFMP83UjND
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 07:38:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218770

Change enable-x11-forwarding PACKAGECONFIG to x11, while we can rely
directly on X11 DISTRO_FEATURE. Previously when enable-x11-forwarding was
used, the XAUTH_COMMAND failed due to missing xauth. So add xauth to
runtime recommends dependency and enable this behavior as default.

Signed-off-by: Andrej Valek <andrej.v@skyrain.eu>
---
 meta/recipes-core/dropbear/dropbear_2025.88.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear_2025.88.bb b/meta/recipes-core/dropbear/dropbear_2025.88.bb
index a1317d3b73..72a886d907 100644
--- a/meta/recipes-core/dropbear/dropbear_2025.88.bb
+++ b/meta/recipes-core/dropbear/dropbear_2025.88.bb
@@ -48,10 +48,10 @@ SBINCOMMANDS = "dropbear dropbearkey dropbearconvert"
 BINCOMMANDS = "dbclient ssh scp"
 EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
 
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam x11', d)}"
 PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[system-libtom] = "--disable-bundled-libtom,--enable-bundled-libtom,libtommath libtomcrypt"
-PACKAGECONFIG[enable-x11-forwarding] = ",,,xauth"
+PACKAGECONFIG[x11] = ",,,,xauth"
 
 # This option appends to CFLAGS and LDFLAGS from OE
 # This is causing [textrel] QA warning
@@ -62,7 +62,7 @@ EXTRA_OECONF:append:libc-musl = " --disable-wtmp --disable-lastlog"
 
 do_configure:append() {
 	echo "/* Dropbear features */" > ${B}/localoptions.h
-	if ${@bb.utils.contains('PACKAGECONFIG', 'enable-x11-forwarding', 'true', 'false', d)}; then
+	if ${@bb.utils.contains('PACKAGECONFIG', 'x11', 'true', 'false', d)}; then
 		echo "#define DROPBEAR_X11FWD 1" >> ${B}/localoptions.h
 	fi
 }
-- 
2.34.1


