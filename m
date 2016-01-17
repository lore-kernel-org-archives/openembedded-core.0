Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 37EA9762AF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:41 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id q63so146457689pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=zlssQ+ljclRPlhw9ByoE8Xi+4wyQNFopMv0tORzh6RQ=;
	b=FNmafrg46lPeYgnMD8XTQZKbP6oWoIlVYos/Y6ub6YlxU8zh4vIDy0MmAYljeX1WtG
	UE7zmixc7YGxcwttNQuyzT1iXtr1YrDkbcoD2eG7SFp1pFAtU0fWD5xI2FkcpCnyIfQR
	bDwpGtkSPFUE4GCkWrTfKCGXRpwNtAWSKbcKwCRyupDNbioXf2NxI9+dO/wOdscvZPHE
	Zxg/qitZxp1FvEjUV2/7QzDSd/lbkLMB2QZwqkpjQ5PLe/wOJtuuM1enV0w/6hhnP8MI
	qKZPVYcakCiZjddP0l2vQS4NQDYoa7UvrxQQHdrgdCY9rhRvtc5ds3+I7XPBfJ91y/Uh
	9NXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=zlssQ+ljclRPlhw9ByoE8Xi+4wyQNFopMv0tORzh6RQ=;
	b=I+OIV26AjNuU+Pc3fxwigco7oJWgUMC1ePdLKd/p8Z2wY3+9PpqYVPMEX457rOc52+
	eVO865/lIlyGQnRd49BOBqURS1T/l3VxvJ4Cq3b89r7uWxHCYoJrxT57fukT/qbRO2oG
	CrJ0t8G4d+wtb1GAqZZFNO1wW7KM1peBeggBAVCtGtJWDkxUx1XzUFhrZlPp/5vmIzRU
	GZhSUQcWNrmku6MqxN3glmTd12XPmdzDrBtuqvqiRltXyWzRKKdPnhS98R//VEVlmXKP
	Z2Hw6q0Ciylm0bkgP/wyqpMqyVR6dnKR+op/X8JXSjgPtDmch7120M0vqMF2YMi0wAFY
	PJSQ==
X-Gm-Message-State: ALoCoQnMy0O9fJgxHUDORQ+5Rt/NhTnHtqriLdFNO2K7qScLXijWJUdFI4+1DdOMLOP//Hz3eUkQnLauX502w7ZO//+XN17pGQ==
X-Received: by 10.98.71.197 with SMTP id p66mr29056112pfi.166.1453030662897;
	Sun, 17 Jan 2016 03:37:42 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:20 -0800
Message-Id: <a5202ef32cbcf968a858029ca4d81156071e8181.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 47/73] portmap: Point to tirpc headers and libraries on musl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Jan 2016 11:37:42 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/portmap/portmap_6.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/portmap/portmap_6.0.bb b/meta/recipes-connectivity/portmap/portmap_6.0.bb
index e727fe3..999b4a9 100644
--- a/meta/recipes-connectivity/portmap/portmap_6.0.bb
+++ b/meta/recipes-connectivity/portmap/portmap_6.0.bb
@@ -1,5 +1,7 @@
 require portmap.inc
 
+DEPENDS_append_libc-musl = " libtirpc "
+
 PR = "r9"
 
 SRC_URI = "http://www.sourcefiles.org/Networking/Tools/Miscellanenous/portmap-6.0.tgz \
@@ -19,6 +21,8 @@ PACKAGECONFIG[tcp-wrappers] = ",,tcp-wrappers"
 CPPFLAGS += "-DFACILITY=LOG_DAEMON -DENABLE_DNS -DHOSTS_ACCESS"
 CFLAGS += "-Wall -Wstrict-prototypes -fPIC"
 EXTRA_OEMAKE += "'NO_TCP_WRAPPER=${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', '', '1', d)}'"
+CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc "
+LDFLAGS_append_libc-musl = " -ltirpc "
 
 do_install() {
     install -d ${D}${mandir}/man8/ ${D}${base_sbindir} ${D}${sysconfdir}/init.d
-- 
2.7.0


