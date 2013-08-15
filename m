Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id E68B76B82D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:17 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so183136eek.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=cwrCgGHJ+yazldjUew2uj4KIpA/keRNJo0KiJ8RpowU=;
	b=WXfCcdTJq3FQrVforscjuLU1762O1lGxH9sBns3+rrneltEEbn+2EYAQANv/kh96De
	+h918GDaiRPaWLQBZ/8SyTYfxKnDKJduG1IEG/ArpgljuydJipI2Kz6JAhpQFEhP1NAN
	4jdVchlooIRl3/Z90ukpqMEMJLq2Va2GtaDeGe7vOiBcmPWh33Xyjyw6BiZXio7IjWkA
	r8S9KrJ/1LsdLMwlro89yxJUmmxtq5LAt2E6vWtdYrsFFXpXO4vP+ogiR5JGIZhgOL8p
	s41Om0Vit2wPmj4YfXlA0UIFrJQmtHcBynM5u6ySeV/v6Vpoztb/vTbUQ8KqSFBvNtaB
	acnA==
X-Received: by 10.15.22.69 with SMTP id e45mr2449881eeu.59.1376551398379;
	Thu, 15 Aug 2013 00:23:18 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm81961633eem.1.2013.08.15.00.23.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:31 +0200
Message-Id: <8396e12ec42d763565f3b4305e52c004b270a19a.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 20/33] distcc: add PACKAGECONFIG for popt
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:18 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/distcc/distcc_3.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/distcc/distcc_3.1.bb b/meta/recipes-devtools/distcc/distcc_3.1.bb
index cb5d696..3571732 100644
--- a/meta/recipes-devtools/distcc/distcc_3.1.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.1.bb
@@ -11,8 +11,10 @@ DEPENDS = "avahi"
 GTKCONFIG = "gtk"
 GTKCONFIG_libc-uclibc = ""
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', '${GTKCONFIG}', '', d)}"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', '${GTKCONFIG}', '', d)} popt"
 PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk --without-gnome,gtk+"
+# use system popt by default
+PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
 
 RRECOMMENDS_${PN} = "avahi-daemon"
 
-- 
1.8.3.2


