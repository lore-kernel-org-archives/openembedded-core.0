Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T27sC-0003ab-EI
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 23:45:00 +0200
Received: by weyr6 with SMTP id r6so2132419wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 14:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=+RjAu/Yh5WepmCSzxFthjjAdvkfzkaMVFPwvCbywCGE=;
	b=VOt3QMSbY8hOFziN/LMiC/Tksra1xJBp/IZxiny24kL9ao3/WEDmxOqWaE+ouO47m/
	k0PH+5Q0G6SF6ZVQe4FOKtrjO72tUODISOFb/7qzK2718k/Ypn0K95O/N+Cjarjjyn0L
	X1bVvlRxt+2Q8OaIHXm3l1CmjN5L/+TpGulQ2D1yXvkAjJ4VX/DUdQIqy6XFKMSMAe/Y
	XZD2LrPa7on2HzI4B1/iBaVVyZH3Al7ZGuGYXAr5CIv4mqdJI8khfhUXCoziGg4L2XqF
	IoMC3Tg3T1SzYsPq84t2T3YXzf3c2foCkXxHCQOt9gF/T8dKxEFlFn1l4usQGfvm3UyS
	gI6A==
Received: by 10.216.214.208 with SMTP id c58mr1292374wep.148.1345152782896;
	Thu, 16 Aug 2012 14:33:02 -0700 (PDT)
Received: from localhost.localdomain ([79.115.110.29])
	by mx.google.com with ESMTPS id bc2sm8949894wib.0.2012.08.16.14.33.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 14:33:02 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 00:32:47 +0300
Message-Id: <9a29343d541a95400e26f8c37da38b961ab42bd5.1345152235.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <754a26c722091d5922d1ef095def13f1cf57f27f.1345152235.git.andrei@gherzan.ro>
References: <754a26c722091d5922d1ef095def13f1cf57f27f.1345152235.git.andrei@gherzan.ro>
In-Reply-To: <cover.1345152235.git.andrei@gherzan.ro>
References: <cover.1345152235.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQknD7sSWqUjQL1PivblvkyVqHEAsf/UJnkHv2uqKMInjj6HdJFK0iYrGnFIkhljo8h6UFoc
Subject: [PATCH 4/7] bitbake.conf: Add rtc to MACHINE_FEATURES_BACKFILL
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2012 21:45:00 -0000

This was done this way so that the current machine configuration
would remain unaffected.
The rtc MACHINE_FEATURE will specify if a real time clock is avalaible.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/conf/bitbake.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 4773d50..bc2d47d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -724,7 +724,7 @@ IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 DISTRO_FEATURES_BACKFILL = "pulseaudio"
 DISTRO_FEATURES_append = "${@oe.utils.features_backfill("DISTRO_FEATURES",d)}"
 
-MACHINE_FEATURES_BACKFILL = ""
+MACHINE_FEATURES_BACKFILL = "rtc"
 MACHINE_FEATURES_append = "${@oe.utils.features_backfill("MACHINE_FEATURES",d)}"
 
 COMBINED_FEATURES = "\
-- 
1.7.9.5



