Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TjWre-0001Ai-Kf
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 16:07:53 +0100
Received: from mail-we0-f197.google.com ([74.125.82.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 14 Dec 2012 06:53:15 -0800
Received: by mail-we0-f197.google.com with SMTP id t11so2422390wey.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 06:53:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=9j9xLirX5RyLsejYkxZQqoGrb73B0b5jHIU5e0+sdWY=;
	b=BDeTDrWAjyLdFsVpv2yxbt2c0aGt2VgnTEQoRveiA/wB7RL0CWt+/5enP6DeQdRm/P
	43P5KH9dZvnrHEAMEsVRnI3FLJzLQ+9KlWubRmUFF/vB2PxMiw+5cjuFRERESUlhvsEr
	9C0HiIycwuSjGv+7PPqABzjfz1RNgiHfxSwppOhEAqEyHhhKWqV1XBLDOeJrXo/5xHBT
	M91MXW+lZIPIPI6JfGzrXEFAA+vteGMH3YF3bg/vivdt4QXbREvKHQIJP1Aary2cm0WE
	AnOB5OsvBeSa5/Z17QETC6eH1RWlVMbLCRNr8LHuUh4KDrLQmFD0a8lPzVKBxxNbhS0w
	655w==
X-Received: by 10.180.107.130 with SMTP id hc2mr3118826wib.12.1355496794255;
	Fri, 14 Dec 2012 06:53:14 -0800 (PST)
X-Received: by 10.180.107.130 with SMTP id hc2mr3118820wib.12.1355496794199;
	Fri, 14 Dec 2012 06:53:14 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm3sm12612555wib.9.2012.12.14.06.53.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 06:53:13 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2012 14:51:20 +0000
Message-Id: <1355496684-1498-6-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1355496684-1498-1-git-send-email-ross.burton@intel.com>
References: <1355496684-1498-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkSqpvr9OOxH9Li7jqlDQlbKJ1Mf9HLDhbcrJUV09WdbhTL24kEyAqp55x0jENeDPMuPi4cmcBzGpv5nbo7MG6g+Npa3PO80CWYN2WrxREynlN1OXzS/PWOKqELi1pJjrsD5cB4a/juG9zVX8N4Ed7jhNaPJll/ZayeuttHty1wHoHXOXLgBFhkSA2wrFE2ilgpYqlC
Subject: [PATCH 5/9] gperf: fix out-of-tree builds
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
 meta/recipes-extended/gperf/gperf.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/gperf/gperf.inc b/meta/recipes-extended/gperf/gperf.inc
index a521e09..10ee912 100644
--- a/meta/recipes-extended/gperf/gperf.inc
+++ b/meta/recipes-extended/gperf/gperf.inc
@@ -14,8 +14,8 @@ inherit autotools
 EXTRA_AUTORECONF += " -I ${S}"
 
 do_configure_prepend() {
-        if [ ! -e acinclude.m4 ]; then
-                cat aclocal.m4 > acinclude.m4
+        if [ ! -e ${S}/acinclude.m4 ]; then
+                cat ${S}/aclocal.m4 > ${S}/acinclude.m4
         fi
 }
 
-- 
1.7.10



