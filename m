Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 715B06CEE8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 14:33:35 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u57so6728638wes.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 07:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1EI4dn2iSae2dJh2JAs729gWmMPlhrhKTj+5dMH5UBs=;
	b=fcEV0Bz/vsvhtJiViZ3HlzB5M77IUDNDlymQEH34YNh7qhb/v6ev6l2RX7lO3zODqU
	5lpfY5vR7lFY048ts3avGoYv6d8AVDXXDCV1YcfB+UAgEAbS0kAekRJbO+VXA+dg3EfQ
	CQ5ZQB7XWVQ4B2UkyNYoirYS1zPDh37qF0HXewaY0xOIIUTyFARwZzdeU4Tq52+bObcg
	xwQbJeZKV9Re35Td1K0UK3uAPAATuJXIFLx3jzAeTfrga/ScOQarIFnlp5Kz7XGfW926
	wifWJwrP13GUuQaX/UL2MQxj238qASTOcUDPTz05n9QxIMwyMbB6ZPFd1bCgSjJQJ+Ww
	LZlg==
X-Gm-Message-State: ALoCoQmjlxl4QMryT7MQ/xzVfcAA0z0D70JcelGZo3HXCRfAATE3zUTGTy2OqIs+D9qO9Dg/Njy1
X-Received: by 10.194.104.66 with SMTP id gc2mr1580320wjb.75.1382970816900;
	Mon, 28 Oct 2013 07:33:36 -0700 (PDT)
Received: from flashheart.burtonini.com (188.29.164.71.threembb.co.uk.
	[188.29.164.71])
	by mx.google.com with ESMTPSA id fr4sm36349149wib.0.2013.10.28.07.33.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Oct 2013 07:33:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 14:33:14 +0000
Message-Id: <1382970798-13574-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/5] gnome: set UNKNOWN_CONFIGURE_WHITELIST
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
X-List-Received-Date: Mon, 28 Oct 2013 14:33:35 -0000

This class passes --disable-introspection to everything that inherits it but not
all GNOME modules support introspection, so add that option to the
unknown-configure-options sanity test whitelist.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gnome.bbclass |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/gnome.bbclass b/meta/classes/gnome.bbclass
index a19dd17..0de22dd 100644
--- a/meta/classes/gnome.bbclass
+++ b/meta/classes/gnome.bbclass
@@ -1,3 +1,5 @@
 inherit gnomebase gtk-icon-cache gconf mime
 
-EXTRA_OECONF += "--enable-introspection=no"
+EXTRA_OECONF += "--disable-introspection"
+
+UNKNOWN_CONFIGURE_WHITELIST += "--disable-introspection"
-- 
1.7.10.4


