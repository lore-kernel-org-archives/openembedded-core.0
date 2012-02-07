Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RusQT-0001tq-Ce
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 22:18:09 +0100
Received: by mail-gy0-f175.google.com with SMTP id f19so3355799ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 13:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=SPZGb9N2jYZUsf9pf9vO8TtAFR3eHFop2l3nJHJlRCg=;
	b=xAFIntesvBHdFPQpn8W7BvB1YrQRhRo/shhapldqqi5Hcbgvtyekk7ViYcUNdHbkpP
	KLDxCeSsdsq/Rn7Fh3PztdrxO9z+RoFY/bACyCKknBLoH4bKjJ1nq2ZjEzOK7EVY28lt
	JtllXqZNxbiebrXSQS4SWXhaKhPDcsrf+3cM4=
Received: by 10.236.197.33 with SMTP id s21mr11774685yhn.40.1328649008868;
	Tue, 07 Feb 2012 13:10:08 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id f47sm30150280yhh.8.2012.02.07.13.10.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 13:10:07 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 21:09:51 +0000
Message-Id: <981ec1c0249fee08b2536b2bdf4a3bc93c0f3171.1328648562.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1328648562.git.otavio@ossystems.com.br>
References: <cover.1328648562.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1328648562.git.otavio@ossystems.com.br>
References: <cover.1328648562.git.otavio@ossystems.com.br>
Subject: [PATCH 4/4] useradd.bbclass: skip processing on virtclass-cross extended packages
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
X-List-Received-Date: Tue, 07 Feb 2012 21:18:09 -0000

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



