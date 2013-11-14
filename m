Return-Path: <dominik.holland@pelagicore.com>
Received: from mail-bk0-f49.google.com (mail-bk0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 117386D747
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 16:15:59 +0000 (UTC)
Received: by mail-bk0-f49.google.com with SMTP id w14so1357056bkz.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 08:16:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JdvvUfRWneQYunCz3VHmGkbV6NrrV3NbJmjPmiNxmBA=;
	b=Jzl+TjuGzL2tSZ2pwYQ9NtvKnD1zyeq8e/q6ztB7QsFZdPryAFwig0LQaauf3p9wTn
	G7ehUgLpproD3enmjlDnf9VAaXrp/H7PCIU8TEEt7Az4hvq1Ilf2rYBnZXaKYAcbvtnU
	qSsZort8KrPU1lCPtYqJASeL+HJDNy3GS2vgDgrsTMboGDuPXQCgvSGvRbxVt0ef7Lkc
	zLNeIgTFRrCN55rcNbf2wDyTdEUlZRE8rl9gMRs5RWUaW3RvkMolKL4FFoy2Z0N52VTH
	wyebO9wHGkzQjYDmNFfigEAPmppTDO4rjQh5s8LjNpFVQOYIm73oVOXOBrX4QYTFgxNq
	lVCg==
X-Gm-Message-State: ALoCoQk2wUkiyIUelYkfGlPv4haD42/71VdHj492GW/J7sNs/EY5BwbyTL2pJi+EkG2tRevJ2jWa
X-Received: by 10.204.107.6 with SMTP id z6mr150428bko.124.1384445760898;
	Thu, 14 Nov 2013 08:16:00 -0800 (PST)
Received: from magrathea.pelagicore.de
	(ppp-82-135-65-185.dynamic.mnet-online.de. [82.135.65.185])
	by mx.google.com with ESMTPSA id l5sm3932266bko.7.2013.11.14.08.15.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Nov 2013 08:16:00 -0800 (PST)
From: Dominik Holland <dominik.holland@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Nov 2013 17:15:51 +0100
Message-Id: <1384445751-1226-1-git-send-email-dominik.holland@pelagicore.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [PATCH V2] dbus: Don't depend on dbus-ptest-ptest for the nativesdk-dbus package
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
X-List-Received-Date: Thu, 14 Nov 2013 16:16:01 -0000


I also changed RDEPENDS_class-native to RDEPENDS_dbus_class-native now

---
 meta/recipes-core/dbus/dbus.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 5864643..6612184 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -10,7 +10,8 @@ DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X
 DEPENDS_class-native = "expat-native virtual/libintl-native"
 DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl"
 RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest', '', d)}"
-RDEPENDS_class-native = ""
+RDEPENDS_dbus_class-native = ""
+RDEPENDS_dbus_class-nativesdk = ""
 
 INC_PR = "r6"
 
-- 
1.8.4.3


