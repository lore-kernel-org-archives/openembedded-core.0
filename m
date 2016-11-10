Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id F243C719B5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 14:44:07 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id g23so3616656wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 06:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=AWoUoL5KRO9l28Pp+eXWT0jsxCZFyU/ITOxBg5KMtEw=;
	b=gvap1pkFGAxSHfAkoJiM35J2Qrdj5/Z0O36C44SIM4Avwj8DM9U0Ij2HvkBi2fL0gE
	y59OCyENdQpcQAEtHpnZb/cKwZZJo7tpG+jcOz6N2KdybYDHYp5MFX1OJAXJPOPTb2iO
	zkBMUYDsp4ndHgwVkt5jCv6ddZJpKGpzmqQ8P9gQd1ToiXSt6p4jbSTU+1hRvB//VOfK
	Pimb+BTUYvahYsMwNtM/ET/IPYulu/WSP4uWntck2wj/SuW0d18n7uNNtQM4KGKdhmLX
	exxAq5ocNO2Iad8ZOxhdiSGexBFMW4654LkXVsUDDwJLn0OC+pbFysm5nWGi+G5YLrvR
	w2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AWoUoL5KRO9l28Pp+eXWT0jsxCZFyU/ITOxBg5KMtEw=;
	b=PaTy0WJUk+8b70lUL/IEJ/znhvP7Cci7CtedQEoaJ6RKfc9J6kMgf5m4UNq7KygFPP
	TbGcpHstADQM5HcNPAAyIMj1GN8emYtXN7DCEPBLU+B/3g8KM6meLm2otLNClu6awy4C
	rxVb55o55es9X9Ub+rkkXAhMZqCAW8XnrIzt63eZ2GtpYnMhkNmyj3VadI0zYCeqcSEu
	AZnQP0ccJDk1VWI/XmtsVmEPRAsiaJd5Ab+AtIiKXVATiqsp2pIFDxJiFMQqc5GmrpWp
	919PXykQEF75e97kIooK0J5P63vA9EZjRfPWuy/bkcT+7emNkt05zdentGoB4FzCJJJj
	3S/Q==
X-Gm-Message-State: ABUngvewWJ4uF4CzA7bVXSZuaV+coZSbnphTORP89+w1XT5gq/H3pcsiOd/RrPTW5Lfcew==
X-Received: by 10.28.173.4 with SMTP id w4mr6074194wme.70.1478789048738;
	Thu, 10 Nov 2016 06:44:08 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id n3sm5799513wjq.34.2016.11.10.06.44.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Nov 2016 06:44:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 15:44:09 +0100
Message-Id: <20161110144409.8940-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.2
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [krogoth][PATCH] gstreamer1.0-libav: Add 'valgrind' config option
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
X-List-Received-Date: Thu, 10 Nov 2016 14:44:10 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

This fixes following error:

,----
| src/libavutil/log.c:51:31: fatal error: valgrind/valgrind.h: No such file or directory
|  #include <valgrind/valgrind.h>
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
index 363101e..2814a58 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
@@ -18,6 +18,7 @@ PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl,"
 PACKAGECONFIG[libav] = "--with-system-libav,,libav"
 PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
 PACKAGECONFIG[yasm] = "--enable-yasm,--disable-yasm,yasm-native"
+PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind"
 
 GSTREAMER_1_0_DEBUG ?= "--disable-debug"
 
-- 
2.10.2


