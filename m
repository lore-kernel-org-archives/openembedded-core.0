Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3518E73177
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 17:19:43 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p65so553252wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 10:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EbvCjJuB5UHC34eTT0uqDFzLb6Bz22ntAdL+TDkm8XI=;
	b=dEpXsEud4bdZWolVHv2DrYmXfIUhS28O6uOe92sadDYIQ9/rcllvkf/OfV9XgW6jsb
	PUrWGqTqWpFJO0jVauE2ftPIvLoNleHURH1wj0AK96zhopE6cXbZoDAHFUVLNudGPWiR
	WJ9J/tJWtjmbS/W7LzwiSJ4AWuKS78x6kAvLxfXvtCDosBan7e7jB7h0dbbW/IRd9qxD
	2XpJvFOJR8gGQkX8g6F6NowuL8HGcZPv7JVAyO3yxW3HL77tLTHbcNRjhOUCmlX5UBej
	GNuV/XcGktK7/JXh3RtovZBSgYU0Ho2rrIlIe3MtOu51UA2z/oYlhZCbsfzpdoDih/+X
	zdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EbvCjJuB5UHC34eTT0uqDFzLb6Bz22ntAdL+TDkm8XI=;
	b=bgbFQuYg9DEO7sSYCH2r9X22EHgpr3TJSC3+WbI2Mu8IMzEjaDOWQgS6jtaBgNJ7LC
	stOVmK3iPyinJC+5ZqOz1JqZqbeQwpPJJG4NSqesL97OmYE9pc9bw6S+AraemzoCtk7N
	QZ+zyI+LWtaOHNkTlSeW63wU1tUiEvozc/t76zKW1jYqKEQMovQz2DcAsZlFcaXz9bgU
	s6huPN8Mh6bdMhJsjjB7i6q1T5H06cURRdV2NuKCdb4oKMA6N2cJXbCZsDFCXX/nQq5a
	0wLeaD/II7+Xi1lUuvQDod3ptSLLiako53+AoX4gsflzXF/zm+eOiMddLPPljFVL0gmN
	0ong==
X-Gm-Message-State: AD7BkJI3j60T3hrtBhY0+mfEgrD0bq86cScc1JEt47E2Smv20KWElmO+R0GMz0rmF0Xr3w==
X-Received: by 10.194.5.36 with SMTP id p4mr11299295wjp.167.1458235183822;
	Thu, 17 Mar 2016 10:19:43 -0700 (PDT)
Received: from localhost.localdomain
	(LPuteaux-656-1-252-235.w82-127.abo.wanadoo.fr. [82.127.113.235])
	by smtp.gmail.com with ESMTPSA id
	e25sm31066139wmi.21.2016.03.17.10.19.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Mar 2016 10:19:43 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 10:19:25 -0700
Message-Id: <1458235169-9267-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
References: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/8] arch-x86.inc: disable gobject introspection for x86-64 x32 builds
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
X-List-Received-Date: Thu, 17 Mar 2016 17:19:43 -0000

Since gobject introspection is no longer backfilled into existing
machine configurations, it needs to be removed from MACHINE_FEATURES
directly when building for x86-64 x32.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/x86/arch-x86.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/x86/arch-x86.inc b/meta/conf/machine/include/x86/arch-x86.inc
index ba7be8a..665da89 100644
--- a/meta/conf/machine/include/x86/arch-x86.inc
+++ b/meta/conf/machine/include/x86/arch-x86.inc
@@ -25,7 +25,7 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mx32', ' -mx32', '', d)}"
 TUNE_LDARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-m elf32_x86_64', '', d)}"
 TUNE_ASARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-x32', '', d)}"
 # user mode qemu doesn't support x32
-MACHINE_FEATURES_BACKFILL_CONSIDERED_append = " ${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'gobject-introspection-data', '', d)}"
+MACHINE_FEATURES_remove = "${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'gobject-introspection-data', '', d)}"
 
 # ELF64 ABI
 TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
-- 
1.9.1


