Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T27sE-0003YL-LR
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 23:45:03 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so2503809wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 14:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=Yzh3flTj1GT7YH1n+0mPEkSE3ifZ7/npBhvN8sjrCqY=;
	b=dVaN+iEEGGbNIVcZFGbguW77gEWWepRHIzfP9/i96OCikkqYfu3lQ0ovoTcqNh76D2
	kYuU/6XqckPosi/PGR1hjIn+acCxunJIpK33NLRJ413646H6XCSXPsY6Bf7ZxTF+0vqW
	ePvgSMCJEx3GlZLbYlZ3u3VB+g77ystRyP83+E1ZzCP8goLSe7ML41pV9NSW+GjJ57ls
	bLmwglMzVyxWFd6MjK6TKco5+nXairiRm1FFugT7KkHLsNh0T343TG/aTfasQwi+OynC
	/5Fdn10MrYW0lBWGYqLqRSPy4kvk9XuqTHE/TlFrlCzAdOTvxA93lZRSc2+1S1nAIZEf
	HvMg==
Received: by 10.180.89.235 with SMTP id br11mr6329469wib.3.1345152787191;
	Thu, 16 Aug 2012 14:33:07 -0700 (PDT)
Received: from localhost.localdomain ([79.115.110.29])
	by mx.google.com with ESMTPS id bc2sm8949894wib.0.2012.08.16.14.33.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 14:33:06 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 00:32:50 +0300
Message-Id: <cf12396875257e92a56468c3402b85106528f1bc.1345152235.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <754a26c722091d5922d1ef095def13f1cf57f27f.1345152235.git.andrei@gherzan.ro>
References: <754a26c722091d5922d1ef095def13f1cf57f27f.1345152235.git.andrei@gherzan.ro>
In-Reply-To: <cover.1345152235.git.andrei@gherzan.ro>
References: <cover.1345152235.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQlWyVN0vbpuDPAqXHP67ESdhcc23uZ29TNUUv1aZEBwhmr+LwiEOnOSeTc6AQle8uU41CUc
Subject: [PATCH 7/7] busybox: Package hwclock.sh initscript separately
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
X-List-Received-Date: Thu, 16 Aug 2012 21:45:04 -0000

We package this separately to be able to pull this in only if this makes
sense for the MACHINE.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-core/busybox/busybox.inc |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 78239a2..5a5b383 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -14,15 +14,16 @@ SECTION = "base"
 export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 
-PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev"
+PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
 FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf*"
 FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf"
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
+FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
 
-INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev"
+INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock""
 
 INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
 INITSCRIPT_NAME_${PN}-syslog = "syslog"
-- 
1.7.9.5



