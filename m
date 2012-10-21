Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TPxqx-0003TY-2L
	for openembedded-core@lists.openembedded.org;
	Sun, 21 Oct 2012 17:54:15 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so1000662wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2012 08:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=lJlcRZfX/gLlv3ZIU3lqktzdSLOWGVbWT8sNeWzlUW0=;
	b=Utn673kTwI+VucxORMrl/JVbqNeFqUV5I1jA+tvO6g1aPjD/xgVdEb6mrsOOzTfnTN
	ux+Wc+sCRAD/nYHMvaLuixwsVpdgdk+xQRgMcXd8BDThq2xtXUwd2twsrixnBglAE4aV
	npLR/K2lLfFR1XxG0aOjaG1S8XLAuaUf9zV+uHNxywj4aTMYJzYp+10pqqwIRcKGsHI2
	3XtgUjHziMVcjbqxGKzhzlzWNIeLhBsGsx37tuOilo7BIo4jEIrwVdks5PQNcZmwJCYY
	zFcKNtYQHtXh5KrsuMwhKgct+1+B8JEqi+BAxCjna0AjhgmibmZk9z76rwoRSVeVGHiF
	+RgA==
Received: by 10.180.95.97 with SMTP id dj1mr15436326wib.3.1350834051648;
	Sun, 21 Oct 2012 08:40:51 -0700 (PDT)
Received: from localhost.localdomain (5-13-211-28.residential.rdsnet.ro.
	[5.13.211.28])
	by mx.google.com with ESMTPS id j8sm46423462wiy.9.2012.10.21.08.40.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 21 Oct 2012 08:40:50 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Oct 2012 18:40:39 +0300
Message-Id: <4cebbf1aaeda065954bf8cb6989254f7cce85b7d.1350833713.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1350833713.git.andrei@gherzan.ro>
References: <cover.1350833713.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQn+veZ2rcq/ANE94hu5GJfSY4WwGmhrF9EQvQI8bENyMGIDnYWAUlfqrED8lDtBthZO/z5A
Subject: [PATCH V2 1/5] opkg-utils: Add needed python modules as RDEPENDS
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
X-List-Received-Date: Sun, 21 Oct 2012 15:54:15 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 92e6624..825c927 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "http://wiki.openmoko.org/wiki/Opkg"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
-RDEPENDS_${PN} = "python"
+RDEPENDS_${PN} = "python python-shell python-io python-math python-crypt python-logging python-fcntl python-subprocess python-pickle python-compression python-textutils python-stringold"
 RDEPENDS_${PN}_virtclass-native = ""
 SRCREV = "49cc783d8e0415059d126ae22c892988717ffda7"
 PV = "0.1.8+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
            "
-- 
1.7.9.5



