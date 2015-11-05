Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 310D97709E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 10:31:09 +0000 (UTC)
Received: by wmll128 with SMTP id l128so9329093wml.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 02:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HuMBTP4e6NTmca5gWJX8ke0ZqS03n2JLk+7SxFcJR1Q=;
	b=MuwJhtpuzJjvijbf9bj0Oc6Uhiocg5Ap8BWyYmaVa4YDm9Ca8W4U95+5byNCY+0z8S
	vmMdZBMQTabNYeJFmSCyX+gZUOEMjfptmYrCvvqqqlezd2PxW5TBTmNRWIHGldHm/HCI
	MTj77UC1BKppYbkHPA3PXjcGRvLuDbcMuUTwTtbjJ0Jn2bXkhQhvY1EWCnMPmpmwX5AY
	DfI333cuJWp6SpeZsRIkayr1eQxRYesUc9sXW3k6DFPDGMvBso3uzrJuuvbG4E4MJ2H3
	m4NIzSKhEhJV3j0R+NWq8+pLXgI4PyPHbjpO5HiBRPiuKlXzNT6FWi8TLXmlAdiR/5HT
	cSRg==
X-Received: by 10.28.92.203 with SMTP id q194mr2518403wmb.37.1446719469255;
	Thu, 05 Nov 2015 02:31:09 -0800 (PST)
Received: from chl500346.neratec.local (mail.neratec.com. [46.140.151.2])
	by smtp.gmail.com with ESMTPSA id
	jh4sm6197148wjb.33.2015.11.05.02.31.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Nov 2015 02:31:08 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Nov 2015 11:29:58 +0100
Message-Id: <1446719398-14391-1-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
Subject: [PATCH] libqmi: update to 1.12.6
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
X-List-Received-Date: Thu, 05 Nov 2015 10:31:11 -0000

Building ModemManager fails with previous version of libqmi.
---
 .../libqmi/{libqmi_1.12.2.bb => libqmi_1.12.6.bb}                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.12.2.bb => libqmi_1.12.6.bb} (80%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb
similarity index 80%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb
index 789692b..7a15527 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb
@@ -12,5 +12,5 @@ DEPENDS = "glib-2.0"
 inherit autotools pkgconfig
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "5b3b6b37a57e2fa828fd4cb6f86d7a9f"
-SRC_URI[sha256sum] = "d1661d73b510482b29b93b7e396756c433d35360b3d44c72afa7921339a98624"
+SRC_URI[md5sum] = "24c9eb300662ba6cff0152de89bd9ec0"
+SRC_URI[sha256sum] = "0857bffece4e8ddfa7f721dd9ca63b4c78de345ac9ae2faebf04062cacba3780"
-- 
2.4.3


