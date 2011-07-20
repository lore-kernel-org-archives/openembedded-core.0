Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qje2i-000446-HV
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 23:10:56 +0200
Received: by mail-fx0-f51.google.com with SMTP id 10so2396807fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 14:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6fTLEyEIBfrxDs7jEoZaffDGyp3lsX3jXXJ1NOfdDqA=;
	b=S0N2m6IHLlNOYltHCiKtAWu05VZ+CupXp+cW1MHtMgbT5rMK6JVlQuzqRyZRX3DmhH
	gYudTv8wRKlqGOZxUuCq1FbhwmULWnc67AQc9dCvsKUzFPUcXauQaV9K6Obmf4mfoT5E
	QQ4uZoorMMqZcDOAxFWYxoP6Y93omD/yDHsOk=
Received: by 10.223.17.6 with SMTP id q6mr3311891faa.96.1311196012206;
	Wed, 20 Jul 2011 14:06:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 21sm931246fay.45.2011.07.20.14.06.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 14:06:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 23:06:20 +0200
Message-Id: <53e99ac545b7ee871abe9f814e7ea3cc45b5a87f.1311195893.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <7ac4de095ea2d0543c8c665e2cfd1be131781e8c.1311195893.git.Martin.Jansa@gmail.com>
References: <7ac4de095ea2d0543c8c665e2cfd1be131781e8c.1311195893.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1311195893.git.Martin.Jansa@gmail.com>
References: <cover.1311195893.git.Martin.Jansa@gmail.com>
Subject: [PATCH 03/10] intltool: inherit perlnative
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
X-List-Received-Date: Wed, 20 Jul 2011 21:10:57 -0000

* otherwise /usr/bin/env perl will pick perl from host and
  DEPENDS = libxml-parser-perl-native
  doesn't help (and do_configure fails on hosts without libxml-parser-perl installed)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/intltool/intltool.inc |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
index a4bccd3..5f0eb02 100644
--- a/meta/recipes-devtools/intltool/intltool.inc
+++ b/meta/recipes-devtools/intltool/intltool.inc
@@ -10,7 +10,6 @@ DEPENDS = "libxml-parser-perl-native"
 #RDEPENDS_${PN} = "libxml-parser-perl"
 RRECOMMENDS_${PN} = "perl-modules"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig perlnative
 
-export PERL_virtclass-native = "/usr/bin/env perl"
 BBCLASSEXTEND = "native"
-- 
1.7.6



