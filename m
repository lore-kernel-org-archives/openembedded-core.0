Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtZo-0004t0-OM
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:27:45 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:16:07 -0700
Received: by wibhr14 with SMTP id hr14so2259215wib.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=yRFJeFq3rEqgi5zjJV/qPnNEiEWmkIDLahqfAIxSczw=;
	b=jCd3q/dbS/KI9e3p4tDLF3Q3RVTi5MV+GL8ReT6navJ+IZmhWxWmFYd4feIbx08C8f
	SQQpjY8bE+EbsEwf7xKSvB5/jjxsAzd+LDIuDCFF6oR4H4OHJeuKco4/U5M/ZaoIvgNx
	kGV4LsyipsTlZVzaEjdSHi/W4CNeY8GcVQfrPWUrKp5kE1c2zFfC/iNRWJdXEy70cLkN
	p0ihswBHqhoty9UH9my9I7B6231/U6UyvcYrVdma6iDU9pd3GkpXSKlaTL1t0j1mfIq4
	BH2zTEr845LB3SxOpuc4N9bMTSCDUOAWWBWS8QviQC2zMfCsyQ41JxXmwQEdSolG3TpM
	V7cQ==
Received: by 10.216.199.167 with SMTP id x39mr1546401wen.148.1342714548854;
	Thu, 19 Jul 2012 09:15:48 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ex20sm7103056wid.7.2012.07.19.09.15.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:15:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:15:34 +0100
Message-Id: <1342714534-7032-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkUg1E5/EY7tlaZP6/IGeiYzGqrBTSSfjvzNJkcC5toIO95E4p9aLsPwkM6pW15Ql+2b9I6
Subject: [PATCH] sanity: display the parsed BBPATH when complaining about CWD elements
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
X-List-Received-Date: Thu, 19 Jul 2012 16:27:46 -0000

Many people don't understand the nuances of PATH/BBPATH, so help them by clarifying
the warning and displaying the parsed list element-by-element.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 6ef5450..575ce15 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -400,6 +400,7 @@ def check_sanity(sanity_data):
                 "Please check your layer.conf files and other BBPATH "        \
                 "settings to remove the current working directory "           \
                 "references.");
+        bb.warn("Parsed BBPATH is" + str(bbpaths));
 
     if sanity_data.getVar('TARGET_ARCH', True) == "arm":
         # This path is no longer user-readable in modern (very recent) Linux
-- 
1.7.10



