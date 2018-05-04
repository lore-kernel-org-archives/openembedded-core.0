Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id A453174BA0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 22:53:02 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id a13-v6so16366135pgu.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 15:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VM1/jxeyhbmjdOLcx7I1hcXvTh0urWEMSTeVd5NcQuI=;
	b=lBa/dhZHlLktFeu7mFtSs/jjNyCI6JLCKmBVdyNABPCAYBhmfbgRzj+XdANbH20yDk
	2uqYx4XL5+MH1rROySStuYOfuW5PEdoOfWb8nzkHXC2KxCR45xjontpk6Vs6DmTVjmoQ
	1658VIzG1qSdj0XcDGKHT43IGXW2wqTh9f0Hd7Ll4DVejrB79iuk5uryu9oUNcnIz5+A
	pi7rtp49H9Mhamfvu401IjPPEtT7esmeUgNDdEMCYpzcRSYsieS2dPUy9MVjGapnL9fl
	ma7gKdgWLGziFW/BXfscgP/gw3unbJylpvNEvTXVuE+z4ZeDcIOpaSl05dwM94dVIQtg
	l+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VM1/jxeyhbmjdOLcx7I1hcXvTh0urWEMSTeVd5NcQuI=;
	b=ceufS0vZEjueYqkLYU3JlNeUzLZZsqpk19Wdtp0B6IuWYabVb/47/xPB4JtjyqL8ew
	buQmBOtEPZd9nfkj4SE1T0VK9uuRvl9NpbCdb/c/PCa4xWr6cJMbuAhO7hdBJYw/f92O
	l3Gy4VBX6SZ8Bx1ZBLBs0HPMvwIej5/Xlzw/W/e1ybZiaUMcwND7Ls+d0L/qEzv2auc1
	dAqeyh9lz8fsVpnpQZPMvf5dJ9KEPRFLxXuUbjSKRxi2zg8EqHbRK2u0Qbv7N64GZxEA
	KEU9045xJ9eDUAYb75Q31ouWubag+YDO1BVkcSguys6HzznXG0Mk2cQt2MouGzvkApF/
	CKkg==
X-Gm-Message-State: ALQs6tBhRLk4YoN725T8Ny8YNjN95MF1RtOkQh0Uy2JvyhMJuOhjibKM
	4NpXDI9+2ZqB5Mg9eKs3N/pWKA==
X-Google-Smtp-Source: AB8JxZqsc9zrqrSH79iiEJVfLn8wbmbM8NupLV0OG9xyoBBxO6HS5bWNsQwBZOXLDmgVPhdLdXWdCg==
X-Received: by 10.98.76.83 with SMTP id z80mr28740210pfa.181.1525474383542;
	Fri, 04 May 2018 15:53:03 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	w26sm41378391pfi.17.2018.05.04.15.53.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 May 2018 15:53:03 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 15:52:47 -0700
Message-Id: <1525474370-7913-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1525474370-7913-1-git-send-email-armccurdy@gmail.com>
References: <1525474370-7913-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 5/8] icu: move ASNEEDED over-ride into icu.inc
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
X-List-Received-Date: Fri, 04 May 2018 22:53:02 -0000

Move the recipe specific over-ride for ASNEEDED into the recipe to
make it more apparent that the over-ride is being applied (and that
it should be re-checked on version updates, etc).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/as-needed.inc | 1 -
 meta/recipes-support/icu/icu.inc       | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
index 94f5b90..305e654 100644
--- a/meta/conf/distro/include/as-needed.inc
+++ b/meta/conf/distro/include/as-needed.inc
@@ -2,7 +2,6 @@
 ASNEEDED = "-Wl,--as-needed"
 
 ASNEEDED_pn-openobex = ""
-ASNEEDED_pn-icu = ""
 ASNEEDED_pn-pciutils = ""
 ASNEEDED_pn-puzzles = ""
 ASNEEDED_pn-rpm = ""
diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index 983118c..f0786ba 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -31,6 +31,8 @@ EXTRA_OECONF_class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
 EXTRA_OECONF_append_class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
 TARGET_CXXFLAGS_append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
 
+ASNEEDED = ""
+
 # strtod_l() is not supported by musl; also xlocale.h is missing
 # It is not possible to disable its use via configure switches or env vars
 # so monkey patching is needed.
-- 
1.9.1


