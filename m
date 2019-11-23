Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3F8DD7FCDE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 16:11:31 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id 193so5141391pfc.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 08:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=907LQXxsoJPewJqDNUbLSNwlkJMVSud6CJ0MnJvb53A=;
	b=aiT6USRuXMpJkwWENSUyuAQicvYG4FJ/TtcyNGy9DZoFRJHW3BRmmADPHCAK3kYt6Q
	pUBYckmdlUokbmvDCZMNQl5gJRLDI6sViZ15RJKgoPBxZq6lo+B0fdovXYVqQnSQI2J2
	cFBD/wBLsgclL6QQjACTZShwpFKOek4vGlUtabHfBpkK/jDUxIgFWXfNzU8LeB5Qh6Lv
	nFQ430C75FbWZqIPjG9eYkZ3A4NV9FecpWSdZ8elOaFEWsSj+rUesYvY/VjXvzCtLak+
	UJ8gkwfFIif+z88jmDWApivaf0mnf7JPWwYaXr0NXntFaKzkH60JRc3NIRjg9nwQGBcR
	/DMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=907LQXxsoJPewJqDNUbLSNwlkJMVSud6CJ0MnJvb53A=;
	b=K1x5mGYEpuLszcH34C3DEDGPcCvXpReN8k+jQ+ul/dlChMCbu9jjslbUlB8OXDTEKD
	X4b/dddPfPwYNfqZDELE387x8+EC2qw/NRmWtypl5bZP6TjCPF62a/CMM0jtNx4YWZEI
	CG+dE4zgs8f2Z1u5NoS1eOUHB4ldtn68Hqc3g00vFoEy/3GxmWOqQqj10I4b0kUrx+K0
	s3E2VOugWf32k/SpSktDPcz18bzY7NX54wbmbmR7tH0KfKgtYu1+XyGBxzdzgLwHUpqu
	A5UZFvkC3gPoI7BQamG2S6A1P9qnfTxZd9bPYVIYno7XLPaaEVnVDVo6ycK0U870OiaN
	MYeA==
X-Gm-Message-State: APjAAAXl354EEwE6TEZX+17B48gdcQaCax2VLyDGlEA0jT0eByMUJQcV
	d42VYbSazvLivhUnAcrQ8rFO3n0i
X-Google-Smtp-Source: APXvYqzStKQPApa20WuKSrn69MZwY65JBWAafsmX82H95puiT+LuMSu9HDVjyIY4V8BAt+DabNRMBg==
X-Received: by 2002:a63:3cd:: with SMTP id 196mr22426169pgd.150.1574525492195; 
	Sat, 23 Nov 2019 08:11:32 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d5a1:4623:137e:d439])
	by smtp.gmail.com with ESMTPSA id
	199sm2091943pfz.186.2019.11.23.08.11.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Nov 2019 08:11:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 08:11:20 -0800
Message-Id: <1574525485-20450-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574525485-20450-1-git-send-email-akuster808@gmail.com>
References: <1574525485-20450-1-git-send-email-akuster808@gmail.com>
Subject: [zeus][PATCH 06/11] gstreamer1.0-vaapi: upgrade to version 1.16.1
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
X-List-Received-Date: Sat, 23 Nov 2019 16:11:31 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{gstreamer1.0-vaapi_1.16.0.bb => gstreamer1.0-vaapi_1.16.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.16.0.bb => gstreamer1.0-vaapi_1.16.1.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb
index e5dfb61..61cf705 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb
@@ -13,8 +13,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.x
            file://0001-vaapsink-downgrade-to-marginal.patch \
            "
 
-SRC_URI[md5sum] = "8c3f9ee3e47cbdb75a94f7183460b721"
-SRC_URI[sha256sum] = "4e7fce626ee0590dca74b5a8341d25bac76307945131a970b414fc5895f5171f"
+SRC_URI[md5sum] = "15b08f76777359d87b0b4a561db05f1f"
+SRC_URI[sha256sum] = "cb570f6f1e78cb364fbe3c4fb8751824ee9db0c942ba61b62380b9b5abb7603a"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.7.4


