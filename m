Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0899169E
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:02 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id u131so3900996pgc.10
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dO7FUY/qNImEbG5G24GzqFNlVmMKmBPyoai96VQxmQ4=;
	b=nAQUi8XceK+2P/04xBxLfLT7w3DSl3Lyqddp8xR0c0v++RKyXNf8hqreAQrDVcU0bK
	7MOV2Pap1SK9fOFKYVslFv52MO+mNaOYCVUrRjCfsYf+SNPOsKYghqDt+KBIB18At/1+
	tLlLUsFTzIEI/ausw2NwdmJNhp8GtkYY2669LtbZopMx0D07iisCw8gH+kcQOcLRiQuG
	9YYILYU2GAl0agSacValLvNh7xkK7Zp8+GguGzD39qRSPbFCismJpCOad3zhs3yKzJcN
	N7Q900ru36mwD+qFQndDojWNGkVm+ceCNlqEZlW8rSI0wU9NchPm5Yuwmea9k/15Sm1b
	lo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dO7FUY/qNImEbG5G24GzqFNlVmMKmBPyoai96VQxmQ4=;
	b=lb2iJMRMJ4+LDM0KyMd05Bfl453WaTUn0Lc49r91exjYoPyU04JADfzSQO5wz+30QU
	1ZFBv1OUVqCezj180peZU7FlAoEEGQOAlt8Iw0y7WL/qpy+bBvsavS+xyOsRf4IOb05u
	rhAeglCeaSFw280j4XEr4H4pQ6lc8oTqLPyl193bhz9rPMjNaIY6RctarV/O8XH1rP0M
	Frjprwm50IKlCRY9bsg8xIonT7a2DFG56BAA3+iD775zXNW4cBMcMrKGHDhpBnxRx7nq
	9lzDbiyjJo9fKoJDtlYG1K8ijKI34x6KMHyFr4QchawhZZShDa9qsjnrdLDE8lumyKoB
	90Vg==
X-Gm-Message-State: APjAAAU2j2a6EBFPhiHsEaO0MothiN18c++vvq/ZxX6Fejq3/7NN1D4L
	IWbYu8x09HKenWhkJj6kQacuTc33
X-Google-Smtp-Source: APXvYqxICSNUHK1XlF8kDIkSDt0pgsDuXh8AMfN5LfHd8BIV5xV9xVcWAz+uH7VoRj6AkfEPrUkhtg==
X-Received: by 2002:a63:5fce:: with SMTP id
	t197mr15245359pgb.173.1580055903621; 
	Sun, 26 Jan 2020 08:25:03 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.03
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:33 -0800
Message-Id: <a45f9d2047d7d1156fafc44554c4908a0c7d2647.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 08/29] bind: Whitelist CVE-2019-6470
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:02 -0000

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/bind/bind_9.11.5-P4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
index 4fc0f19875..5d52b696c8 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
@@ -37,6 +37,10 @@ UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
 RECIPE_NO_UPDATE_REASON = "9.11 is LTS 2021"
 
+# BIND >= 9.11.2 need dhcpd >= 4.4.0,
+# don't report it here since dhcpd is already recent enough.
+CVE_CHECK_WHITELIST += "CVE-2019-6470"
+
 inherit autotools update-rc.d systemd useradd pkgconfig multilib_script
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/bind9-config ${PN}:${bindir}/isc-config.sh"
-- 
2.17.1


