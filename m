Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 448C26B102
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 09:36:12 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id 10so4996993lbf.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 02:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ta8SD5IpEDWTRIVCqqOxnjJOF2hkCaJC2KzOpbjtZVo=;
	b=LRFtg5yQvIM8hzNqdLW/CtpCmRdGSvWbSzOYbNRmR9Mh9/8d0EX4hL1bg3ZgECtQR7
	KTM95ck+F8VcP03X/vRkc2LuG1C1mh3UmUt0Ro7c2dZOqMj3GVlw5gKQkSOSywCT1qGk
	+enOHL3+VQ31VJDQz9TuxgwBMmq5S+RhBeguAJMJtjBIiHl5sDMUtRNKVcepb3ioG6pM
	BpWsPHjrQg9m54oV2X3ApTeux9xbRnEvlkZFBTze8rZ51VpkpWmbFtcpfpHGbUjzAEIt
	QRBcFiXTD8N5y8EwFQYq+yyvEGCoAm73JVjOErstQbEP/zdIiVe2ROCxVEznJEPFCA4K
	Nmqw==
X-Received: by 10.112.51.16 with SMTP id g16mr11841597lbo.0.1374485772315;
	Mon, 22 Jul 2013 02:36:12 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id i9sm10800637lai.4.2013.07.22.02.36.11
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 22 Jul 2013 02:36:11 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2013 12:35:50 +0300
Message-Id: <1374485750-5711-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
X-Gm-Message-State: ALoCoQkWQ7wWJEtliYp7xJdHTga8D/RKqU+AkDnw8+qEQkbA3V7v2BNEEjY1UaKlFsBJUX9Ofg7h
Subject: [PATCH] dmidecode: add aarch64 and arm to compatible host
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
X-List-Received-Date: Mon, 22 Jul 2013 09:36:12 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/recipes-devtools/dmidecode/dmidecode_2.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
index 000d2cd..fb2c62a 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
@@ -6,7 +6,7 @@ PR = "r0"
 
 SRC_URI = "http://savannah.nongnu.org/download/dmidecode/${BP}.tar.bz2"
 
-COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm).*-linux"
 
 do_install() {
 	oe_runmake DESTDIR="${D}" install
-- 
1.8.1.2


