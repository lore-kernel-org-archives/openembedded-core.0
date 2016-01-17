Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3E2377609A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:49 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id q63so146458545pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=PJdaAs+SSeoDegOScYEGILuyWA4O2UtY625uCm0ic54=;
	b=T6WcCoWL491rgUjrWyl9NCJ9hOMziND83J0jtAECCZiGeyDucXIDzfa+9RXEPxyze8
	cyH1Wq3NGFxmU4o/OVMFrzw5IvtUwWHPYfOd9FfKx9uWv7Gc7So4JmhNMTvVukX32Wec
	vFvQbz3867KB6IN1hCKj4iO7dR8dkpaMM1JXPu8SSJhcYinmTg64QneOv1uQexsHCB4W
	Zamdz5KXPRHHBNrDpBgINctnNHSOQbjqiguMeNglzZOg4mXU1jakckgqBHBgOLJp446w
	tHcW5N19wXRZOO9yYgWi4b9+SWUNMN1dYcSQbEHlOLIzIcSr7L37MqZc1oSmwdxeUlv8
	FN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=PJdaAs+SSeoDegOScYEGILuyWA4O2UtY625uCm0ic54=;
	b=GvghWR08LHyJgT2TGeSz8Ftae+08EBbf8xl9HGsSTV28rMhdL3cr7sExYETDpJEg6M
	OJAfasKUK2UoHJyw0bfwAJ1oXs0HprLRFcBDi8UydGK5HBE60q3Iwp0R56yPHntC7jTy
	a+R8/RUe4YU6syaaNAQZoIMB4NYkXYuDZ8QCryeEvPZUmTn6UtwVRRXLLEnSv2q4reEp
	P2ZINmVR/11Zz9PY/NXmuxddsuEYHMko0AQqBxL2dojWdp8e6nLi2FJlhe1yf9RbWxUK
	ZR07vrF//i67ySdXpt+MwKGEtAce0ZzA6t+iEIx0xoiubEBdSUXPu19JPPa0/adY3V3A
	W7gg==
X-Gm-Message-State: ALoCoQnd3Qc9x9n5EtME32EZTffGepoipaaDXFjrVvANL++Sot2YoRvMy+3iMAE7trV6kAurmMIHQm+0nwiegDRZx1sOG71bYQ==
X-Received: by 10.98.16.65 with SMTP id y62mr28973512pfi.138.1453030670078;
	Sun, 17 Jan 2016 03:37:50 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:29 -0800
Message-Id: <4d13a3c200bdfd78a9469df990271bef89a95f6e.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 56/73] nss: Undefine HAVE_SYS_CDEFS_H
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:49 -0000

nss's build system assumes that cdefs.h is always available on linux
which is not the case with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/nss/nss_3.19.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/nss/nss_3.19.2.bb b/meta/recipes-support/nss/nss_3.19.2.bb
index c51b056..d092b18 100644
--- a/meta/recipes-support/nss/nss_3.19.2.bb
+++ b/meta/recipes-support/nss/nss_3.19.2.bb
@@ -41,6 +41,10 @@ TDS = "${S}/tentative-dist-staging"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+do_configure_prepend_libc-musl () {
+    sed -i -e '/-DHAVE_SYS_CDEFS_H/d' ${S}/nss/lib/dbm/config/config.mk
+}
+
 do_compile_prepend_class-native() {
     export NSPR_INCLUDE_DIR=${STAGING_INCDIR_NATIVE}
     export NSPR_LIB_DIR=${STAGING_LIBDIR_NATIVE}
-- 
2.7.0


