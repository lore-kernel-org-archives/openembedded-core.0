Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1644C04A6A
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 14:49:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.90114.1691592560400499831
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 07:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E79C11FB;
	Wed,  9 Aug 2023 07:50:02 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 891F03F59C;
	Wed,  9 Aug 2023 07:49:19 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/4] meson.bbclass:: update do_write_config vardeps
Date: Wed,  9 Aug 2023 15:49:15 +0100
Message-Id: <20230809144917.3110384-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230809144917.3110384-1-ross.burton@arm.com>
References: <20230809144917.3110384-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 14:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185706

From: Ross Burton <ross.burton@arm.com>

Add OBJCOPY and EXEWRAPPER_ENABLED, remove LD as it isn't used anymore.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/meson.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
index 582b41a91b1..d08a83d555f 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -61,7 +61,7 @@ def rust_tool(d, target_var):
     return "rust =3D %s" % repr(cmd)
=20
 addtask write_config before do_configure
-do_write_config[vardeps] +=3D "CC CXX LD AR NM STRIP READELF CFLAGS CXXF=
LAGS LDFLAGS RUSTC RUSTFLAGS"
+do_write_config[vardeps] +=3D "CC CXX AR NM STRIP READELF OBJCOPY CFLAGS=
 CXXFLAGS LDFLAGS RUSTC RUSTFLAGS EXEWRAPPER_ENABLED"
 do_write_config() {
     # This needs to be Py to split the args into single-element lists
     cat >${WORKDIR}/meson.cross <<EOF
--=20
2.34.1


