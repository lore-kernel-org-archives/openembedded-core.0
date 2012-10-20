Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TPdBm-0006W2-T0
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Oct 2012 19:50:23 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so1043686wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Oct 2012 10:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=lJlcRZfX/gLlv3ZIU3lqktzdSLOWGVbWT8sNeWzlUW0=;
	b=fxbFlXzvBVngZujwBifUHf7ithUhRuR+MWe6jisA5lTleqbNIUKkLO+eRGSyV4uifu
	AY/WslKSl0zgXpbunCwsfGh+C8XTytqi3QHatJu+ilVGFvUkj7835M6D9yCDA3PFboEH
	k6zw6wkvPAmY87yspmKrOpwau5kpDaztJwZW3xRWJAsZZW206pST3bepVbqc9pHkgpGL
	xHceJXKvLnmaMU2YDHQOkrmZcpVWXxEHL3yEAuSrFF0TT3Sy+1SFsprUIVqhmK81WzWW
	3mluIhvwH7NrP6BSnvaAkvnRQWAxqr0nKv4zRMjH37zuvPS4eKrnqCbga+mPwt1Ii4XW
	tMmQ==
Received: by 10.180.90.78 with SMTP id bu14mr10488097wib.21.1350754620514;
	Sat, 20 Oct 2012 10:37:00 -0700 (PDT)
Received: from otp-agherzan-l1.wrs.com (5-13-211-28.residential.rdsnet.ro.
	[5.13.211.28])
	by mx.google.com with ESMTPS id k20sm41460536wiv.11.2012.10.20.10.36.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 20 Oct 2012 10:36:59 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Oct 2012 20:36:52 +0300
Message-Id: <1350754612-28948-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQnZgBXNTpbetH2RfUkd5FLOKS2oXN2fWYwH26sjGe/8wnV+5GeLTOmCaQ0HvqEoUKn2annY
Subject: [PATCH] opkg-utils: Add needed python modules as RDEPENDS
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
X-List-Received-Date: Sat, 20 Oct 2012 17:50:23 -0000

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



