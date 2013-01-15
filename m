Received: from mail-ie0-f173.google.com ([209.85.223.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TvDH5-0000G1-Me
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 21:38:35 +0100
Received: by mail-ie0-f173.google.com with SMTP id e13so1025990iej.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 12:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ni/QduBizobOuLFWqWJ2+bRHraq7EV65plhF4lJMNck=;
	b=sg1FeuaOrsxLU1ikeMjyY+t9hXvcxeX/SN7mowmC2Y1uTgGyLvFwkou3VD2uWFbZv5
	pM3X1097uDfryMdtb5Zqh0ghwYKfie4u24U7pKHqtv4ElSr3IbuC3UQ4bO2Be/AMQ3JX
	QUCIPSKrk+X1Yh3HqZQAjg3K+gV2iAF/ieIFRNQ72f6hErIS2Nq35JG73t5souoYixZh
	lx5qSPGBCsylq8hUTAi+R2TNbEUFFA6JYYU2eEI9Jdv0HbJB9fIxVpoIOMkyH8BD2Fsc
	I2jE4QKs55hyg2RCYw26rJiltrNrkjMLS2h72vCMUOtoPi3ugyN45VODfUe9mY6yL/LH
	1p6A==
X-Received: by 10.50.7.145 with SMTP id j17mr2844080iga.69.1358281382619;
	Tue, 15 Jan 2013 12:23:02 -0800 (PST)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id qn10sm2655187igc.15.2013.01.15.12.22.59
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 12:23:00 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 13:22:47 -0700
Message-Id: <ddbaa7bb90f623c4ee747697380a71aafa0e3e9a.1358281118.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.0.3
In-Reply-To: <cover.1358281118.git.chris_larson@mentor.com>
References: <cover.1358281118.git.chris_larson@mentor.com>
In-Reply-To: <cover.1358281118.git.chris_larson@mentor.com>
References: <cover.1358281118.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/6] license: correct re.search/fnmatch indentation
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
X-List-Received-Date: Tue, 15 Jan 2013 20:38:38 -0000

From: Christopher Larson <chris_larson@mentor.com>

This was causing it to only obey the last of the elements in
INCOMPATIBLE_LICENSE.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/license.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index c8a8c63..cfb816d 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -226,10 +226,10 @@ def incompatible_license(d, dont_want_licenses, package=None):
             # will exclude a trailing '+' character from LICENSE in
             # case INCOMPATIBLE_LICENSE is not a 'X+' license.
             lic = license
-        if not re.search('\+$', dwl):
-            lic = re.sub('\+', '', license)
-        if fnmatch(lic, dwl):
-            return False
+            if not re.search('\+$', dwl):
+                lic = re.sub('\+', '', license)
+            if fnmatch(lic, dwl):
+                return False
         return True
 
     # Handles an "or" or two license sets provided by
-- 
1.8.0.3



