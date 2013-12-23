Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id E30F76B1FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 17:33:01 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id x12so5064661wgg.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 09:33:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SCALDqXtXj6Rv1Xzt9nPfvY2QDcJTwaWAJLi0S9dRSY=;
	b=kn39J5S54dhNxjk74iUHriejDaqsdRCO+hhM84gQe9D/vyn0a5xs3kal6A8AFmwwL9
	PLMTQbT0rUI6GwghbB65OvU3sBuTsYNt9TMB3A3EDCq5MC9ouDJMusyJg5noH68GsuZo
	wXigS7tlAYrvca9hvwnWeu7qpfPINLwGybioALeHSeSuRo2DlB4ydDvTmj4N0Yt3onK2
	fE3mCLOUSHOp2C7p+KEVC4Annxy9w8FAmqmkyPS/UWs/o0AP2/Kc953WNw4IFJN2TX5c
	l1TKmENtqsvbfbv7wbXXHOZ6enov/fKdXfzWGVGoeMAK+0vdcSSOCgom94W9Jq3y6zcC
	EPnw==
X-Gm-Message-State: ALoCoQnGI9wBOIRLAZLjAPztUHFOvZFDocsK5xpQgnb05RfeFkL0B1ow5tbVqfg8eKcFN5X3vIJZ
X-Received: by 10.180.79.106 with SMTP id i10mr8993256wix.23.1387819981568;
	Mon, 23 Dec 2013 09:33:01 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id c1sm10460870wje.4.2013.12.23.09.33.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Dec 2013 09:33:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Dec 2013 17:32:56 +0000
Message-Id: <1387819976-28691-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1387819976-28691-1-git-send-email-ross.burton@intel.com>
References: <1387819976-28691-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] dbus: enable API entry point checks
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
X-List-Received-Date: Mon, 23 Dec 2013 17:33:02 -0000

We were disabling API entry point sanity checking which should only be done if
the performance gain is prefereable to correctness.  Instead don't disable
checks explicitly as the default is enabled, allowing distributions to append
--disable-checks if required.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/dbus/dbus.inc |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 625e975..ae80cb0 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -68,7 +68,6 @@ pkg_postinst_dbus() {
 }
 
 EXTRA_OECONF = "--disable-tests \
-                --disable-checks \
                 --disable-xml-docs \
                 --disable-doxygen-docs \
                 --disable-libaudit \
-- 
1.7.10.4


