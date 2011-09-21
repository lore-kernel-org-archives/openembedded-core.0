Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R6Rnb-0001GH-TM
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 20:45:35 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so2123662bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 11:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=UBWITVqTW2X9sw8DmbBjPtya1OiI6zGRtxh9oUhOYnQ=;
	b=T3SE+9K5v5KiI1CNjXKVnyAVQfvbGk6MNmzA9t2NZRhCP2E1hgVOROKLJO1aM1xQFT
	wLG+Sij9qvKfuQQcYP+D2aTlVWdpWJIGfRQUKx/c2Q3hue3mQ5aVjoXt09nw6J+ZX0wr
	+aOeZpBQWdrCTrLh13+2v8vm46Hf0wAuK+Krw=
Received: by 10.204.147.155 with SMTP id l27mr919180bkv.86.1316630419446;
	Wed, 21 Sep 2011 11:40:19 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id t16sm5806554bkv.11.2011.09.21.11.40.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 11:40:18 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 22:39:51 +0400
Message-Id: <1316630404-10336-4-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 04/17] avahi: include dbus interfaces definitions into daemon package
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
X-List-Received-Date: Wed, 21 Sep 2011 18:45:36 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-connectivity/avahi/avahi.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index a847394..c3c9c71 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -14,7 +14,7 @@ SECTION = "network"
 # python scripts are under GPLv2+
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 DEPENDS = "expat libcap libdaemon dbus glib-2.0"
 
@@ -67,6 +67,7 @@ FILES_avahi-daemon = "${sbindir}/avahi-daemon \
                       ${datadir}/avahi/introspection/*.introspect \
                       ${datadir}/avahi/avahi-service.dtd \
                       ${datadir}/avahi/service-types \
+                      ${datadir}/dbus-1/interfaces \
                       ${datadir}/dbus-1/system-services"
 FILES_libavahi-client = "${libdir}/libavahi-client.so.*"
 FILES_libavahi-ui = "${libdir}/libavahi-ui.so.*"
-- 
1.7.2.5



