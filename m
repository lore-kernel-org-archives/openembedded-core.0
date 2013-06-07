Return-Path: <net147@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 06F186A543
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 05:33:12 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id xb12so4182991pbc.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 22:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=DMcqVlWTFhCQfBEhaKrxdWayjujfzqi0EmJZmx4bN4A=;
	b=vXaUnOEPNyfH/9xxfOS0+1poWllQFOdQH8w8jIp/xPncb0jgCMLWdMyEcN+ezyeIKQ
	pHT6OIqxESIH0/A2nDPpfzRfXojtyVVnPRQAFe/ho1iDAQkYKLEGEpEclnrtOyqL5aam
	qzPsgISy0v/QIl8AeDq8H4QrMz6hXogYGNtRzk3EMNq0wF+UQ3C4JGT0zGE8r/hkHWFy
	QV8tDqtNU+di5vBaV9Kn1fskLV33ZmW9ClvSs2q23FwFGElMzQb1mdp95ofMQPd239+U
	PTt+XFZGbDpdGm0ONzqXb+qtfzB5jxyMEPWkpKCvrwUtXgDUdvRmd39CvPP+AIBm85/j
	j0Gg==
X-Received: by 10.68.162.163 with SMTP id yb3mr41419700pbb.212.1370583193442; 
	Thu, 06 Jun 2013 22:33:13 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id ra4sm1439400pab.9.2013.06.06.22.33.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Jun 2013 22:33:11 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2013 15:46:50 +1000
Message-Id: <1370584012-28002-4-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <1370584012-28002-1-git-send-email-net147@gmail.com>
References: <1370584012-28002-1-git-send-email-net147@gmail.com>
Subject: [PATCH 3/5] qt4-embedded: update HOMEPAGE
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
X-List-Received-Date: Fri, 07 Jun 2013 05:33:12 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/qt4/qt4-embedded.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 7c8876b..cbdda5f 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is the embedded version."
 SECTION = "libs"
-HOMEPAGE = "http://qt.nokia.com"
+HOMEPAGE = "http://qt-project.org/"
 DEPENDS += "directfb tslib"
 INC_PR = "r52"
 
-- 
1.8.2.3


