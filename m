Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T28kU-0005E4-J5
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 00:41:07 +0200
Received: by wgbdr1 with SMTP id dr1so2533029wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 15:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=Yzh3flTj1GT7YH1n+0mPEkSE3ifZ7/npBhvN8sjrCqY=;
	b=RfO6dqmL4Ay9T95t1oRYmUO4P4ba1SoDtkAP6gGmK920n4LrmmYo8OYYoPgL4Try+l
	6fSiKRT1bzHbTQtVK2llaczf7I9aqPkMJozHk2Q+sNe32dzE2vFi4x0L/XbjIa9yMj9A
	/Ryd4sxUoCft2QiATVoePjPv2g4+ClTeYpndlRCXfnHNsBoO7tuCm90jMOtvveqmVv+u
	bc03tpTn19XHWdqrF3yo3uVLRCx2RYXexLxkHlneYwyZmO6LGTFH/n2FmppA++YVROtc
	rvnc1WDocLRd77WPS/8QbO1k4+nOoCIicau+F3z4O8975Tq1oqkcR7Am5VK9ObNLBL7z
	mEBQ==
Received: by 10.180.79.69 with SMTP id h5mr6641396wix.6.1345156148994;
	Thu, 16 Aug 2012 15:29:08 -0700 (PDT)
Received: from localhost.localdomain ([79.115.110.29])
	by mx.google.com with ESMTPS id cu1sm6321240wib.6.2012.08.16.15.29.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 15:29:08 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 01:28:52 +0300
Message-Id: <31b13351bd60c8d0c6a813747bd19df09b52e0e8.1345155936.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <754a26c722091d5922d1ef095def13f1cf57f27f.1345155936.git.andrei@gherzan.ro>
References: <754a26c722091d5922d1ef095def13f1cf57f27f.1345155936.git.andrei@gherzan.ro>
In-Reply-To: <cover.1345155936.git.andrei@gherzan.ro>
References: <cover.1345155936.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQm85MrkhI6cyZHau9P/UZa9lsaYK9SuN7CdLQXRRoUopEHk6MBlB32xq+x57VBR/R+XtNW1
Subject: [V2 PATCH 6/6] busybox: Package hwclock.sh initscript separately
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
X-List-Received-Date: Thu, 16 Aug 2012 22:41:07 -0000

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



