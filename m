Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 549CB6B1C6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 14:57:16 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id k10so2958948eaj.25
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 07:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Kzn6HczwcUzwo8RlhPr8JwPMyUzcPVk7GPSmDSeFz6Y=;
	b=C7Jllqeh30RExeJ6JJqIE9jeUnleZj91IJ9OMgqYu8ePFoFQG8ZVF2LVFLxY5azaoj
	+39kIsV0qjTbO/fpInHNJcd/BN40bL2Ee45emIneG/nI/DQhHTlglw/8t2wigMbiZcKI
	7McGnj7BxdM0nq2/JgJP+RIsdxVlH+SlX1yRxay3OjAf+I0Od9ZEfIeg0AEAwLWoVjBe
	SPe7f1RkwKvuY53GrK/KCSCgbHaLQ8kHIkf2e6QqMmtw1KY+HH9ja+E4ZjXnuQvZIVoh
	TQWggnxAzfDKeITHqkJSs6pDenfqWhHB7+o6dkswZLJ3Rba2aA9Ia4vhYHViRgnwXi1I
	Csuw==
X-Received: by 10.14.211.67 with SMTP id v43mr20630570eeo.55.1374332236736;
	Sat, 20 Jul 2013 07:57:16 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l42sm35795589eeo.14.2013.07.20.07.57.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 20 Jul 2013 07:57:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Jul 2013 16:57:24 +0200
Message-Id: <5755df0bccd9127a2a4dda72d1b7b04410435f91.1374332196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <f9f54ff35b3525909ee1986053c8d6a687858a21.1374332196.git.Martin.Jansa@gmail.com>
References: <f9f54ff35b3525909ee1986053c8d6a687858a21.1374332196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374332196.git.Martin.Jansa@gmail.com>
References: <cover.1374332196.git.Martin.Jansa@gmail.com>
Subject: [PATCH 7/8] cups: add PACKAGECONFIG for avahi
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
X-List-Received-Date: Sat, 20 Jul 2013 14:57:16 -0000

* it's autodetected from sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/cups/cups16.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/cups/cups16.inc b/meta/recipes-extended/cups/cups16.inc
index f12c2cc..bf155a1 100644
--- a/meta/recipes-extended/cups/cups16.inc
+++ b/meta/recipes-extended/cups/cups16.inc
@@ -11,6 +11,9 @@ LEAD_SONAME = "libcupsdriver.so"
 
 inherit autotools binconfig
 
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}"
+PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
+
 EXTRA_OECONF = " \
                --enable-gnutls \
                --enable-dbus \
-- 
1.8.3.2


