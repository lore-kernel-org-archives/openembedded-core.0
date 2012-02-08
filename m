Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rv6ha-0007F5-SS
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 13:32:47 +0100
Received: by yhfq46 with SMTP id q46so169822yhf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 04:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=SPZGb9N2jYZUsf9pf9vO8TtAFR3eHFop2l3nJHJlRCg=;
	b=GPoSKDwNq4lI4oxi1q0bdLVfw5ZKywTO9AWQnt2CvDVwRBpusyD9zHZ8Ruk5xMwNLN
	BkSNeh38KZqAhE8I/Kc5SjtunDpS6lFGCxkoLqNorcps5WBQa61bhsCJHT5PE2ltp7BS
	Ts1NuUTgBbyOgyem6IrdlaFoDp+S4j+p/fwVU=
Received: by 10.236.161.103 with SMTP id v67mr36265394yhk.87.1328703777794;
	Wed, 08 Feb 2012 04:22:57 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id b12sm1695032yhj.4.2012.02.08.04.22.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Feb 2012 04:22:57 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2012 12:22:45 +0000
Message-Id: <bc276cb5a459c130387d0cb2154d34e5864cbdd1.1328703672.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1328703672.git.otavio@ossystems.com.br>
References: <cover.1328703672.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1328703672.git.otavio@ossystems.com.br>
References: <cover.1328703672.git.otavio@ossystems.com.br>
Subject: [PATCH 2/2] useradd.bbclass: skip processing on virtclass-cross extended packages
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
X-List-Received-Date: Wed, 08 Feb 2012 12:32:47 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/useradd.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 8eb6444..1fed755 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -3,6 +3,7 @@
 # and support files needed to add and modify user and group accounts
 DEPENDS_append = "${USERADDDEPENDS}"
 USERADDDEPENDS = " base-passwd shadow-native shadow-sysroot shadow"
+USERADDDEPENDS_virtclass-cross = ""
 USERADDDEPENDS_virtclass-native = ""
 USERADDDEPENDS_virtclass-nativesdk = ""
 
@@ -104,10 +105,12 @@ useradd_sysroot_sstate () {
 
 do_install[prefuncs] += "${SYSROOTFUNC}"
 SYSROOTFUNC = "useradd_sysroot"
+SYSROOTFUNC_virtclass-cross = ""
 SYSROOTFUNC_virtclass-native = ""
 SYSROOTFUNC_virtclass-nativesdk = ""
 SSTATEPREINSTFUNCS += "${SYSROOTPOSTFUNC}"
 SYSROOTPOSTFUNC = "useradd_sysroot_sstate"
+SYSROOTPOSTFUNC_virtclass-cross = ""
 SYSROOTPOSTFUNC_virtclass-native = ""
 SYSROOTPOSTFUNC_virtclass-nativesdk = ""
 
-- 
1.7.2.5



