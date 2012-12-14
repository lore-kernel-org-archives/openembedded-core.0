Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TjWrg-0001An-0S
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 16:07:53 +0100
Received: from mail-lb0-f197.google.com ([209.85.217.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 14 Dec 2012 06:53:13 -0800
Received: by mail-lb0-f197.google.com with SMTP id go10so2391514lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 06:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=2i/YwqdhMcWxwCSztC3atC0c7jIaR78ZHsfILSnOSE4=;
	b=Sf9VyZyCLS4EYOXwD3rlbAwKglaOD8T4z8CpHvPQFk4r8gIZKwSWEwxIZKlPeqvtQX
	FZ+hIiLXEPshCroBm6xlWWP5hIXPRsvJ22p8ew6VddjAgNDsoQs/V8HBP/sIeNrBhIF4
	tjJwRiJs4Fwu70X3CJLo2628/HlBC9JQ8rwXgLEXwiyy2lB4YlZ0oCPohGepSAsnV5lM
	W1CosGmCNcVpSruj13LHLcfbxaMtclnl5JpMq+ArLIj3OMuBo0bxz90eD3MlVT6+koBa
	jS9tpqOSCc2BO/nXswgiVzPsavKzK0KCE6kx9VEeiZ+szqn2TOELXFDTXXOdGhqpI3hs
	LjvA==
Received: by 10.180.7.199 with SMTP id l7mr3086592wia.15.1355496791354;
	Fri, 14 Dec 2012 06:53:11 -0800 (PST)
Received: by 10.180.7.199 with SMTP id l7mr3086586wia.15.1355496791291;
	Fri, 14 Dec 2012 06:53:11 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm3sm12612555wib.9.2012.12.14.06.53.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 06:53:10 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2012 14:51:18 +0000
Message-Id: <1355496684-1498-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1355496684-1498-1-git-send-email-ross.burton@intel.com>
References: <1355496684-1498-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn1eh2O6UJsB6M1h0fnCzOhE0bstt0S+jY9z/Opcm68B7UpfA4tWBoQkarZyJU7N43L/cgbz8TgVShsNvFekk1vWLi+rQVITzGtnlZJxcgNkZyPb56P1WpukNSGns1wm0NBXb9pzTKPj6OIvAo4JDVabrcHnk8+FXgfRe49KlLXmcx4PvHI3GFyo+RBrsDsxn+K2zJD
Subject: [PATCH 3/9] pkgconfig: fix out-of-tree builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 15:08:23 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig.inc b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
index 27d4071..c54e325 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig.inc
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
@@ -27,7 +27,8 @@ EXTRA_OECONF_class-nativesdk = "--disable-legacy-scripts"
 
 acpaths = "-I ."
 do_configure_prepend () {
-	install -m 0644 ${WORKDIR}/glibconfig-sysdefs.h glib-1.2.10/
+	mkdir --parents ${B}/glib-1.2.10
+	install -m 0644 ${WORKDIR}/glibconfig-sysdefs.h ${B}/glib-1.2.10/
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.10



