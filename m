Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SrBPM-0003LX-ET
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 19:18:00 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so511967bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 10:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=HV1TS/9Pr9pOSxBoZhMrkDLjo96A5X0rzmUjrcpN+/I=;
	b=D5Jn9A2RkWjswqA1SkLO77l5ZY96/Uy2WWgRLHg9p0aBi4M5D03ckAjVgxq7wXKHwD
	uHtYf7yqR3NvTOSIq7224mK6ey2FcSBZ7+sFvg8G0eB1zGufMYsczXTOTvgFuVpUU4yQ
	8u+IxiFhouAOMN0jlBdmqo4jDTr1VTaBeU5fVw91xUz762QT5tHRXJvSCl7aDwRX30RL
	JrdMmqNMCQiEcP/jf8bKOHuAq8Ie9GoP//zfqfJj4DvsIXF5xWDrQ+e4KIPDyk+Iu/8h
	0xVLfbeSSXpaKK/mlwW0Q8PIUQygaqaunKAKV5/lNOGqhZHwBA+pZcWW/5oEoWJiLoRY
	qp0A==
Received: by 10.205.122.134 with SMTP id gg6mr1695454bkc.102.1342544802529;
	Tue, 17 Jul 2012 10:06:42 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id t23sm10438506bks.4.2012.07.17.10.06.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 10:06:41 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 20:06:30 +0300
Message-Id: <eb7f8d63b38012eff32b77de87606c460e0772a8.1342544558.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8afb1ea6ef0d40d68203d164a6ad1d0cf45793fd.1342544558.git.andrei@gherzan.ro>
References: <8afb1ea6ef0d40d68203d164a6ad1d0cf45793fd.1342544558.git.andrei@gherzan.ro>
In-Reply-To: <cover.1342544558.git.andrei@gherzan.ro>
References: <cover.1342544558.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQmr7Zyw3f9CGtCQ+Et/bF3vWkjnnziMnPiNsdm1f+zb/x/N+QD2lZAccdi81w4Vgaqaz7Jd
Subject: [PATCH V4 2/4] connman.inc: Add missing dependencies needed by some tests
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
X-List-Received-Date: Tue, 17 Jul 2012 17:18:00 -0000

From: Andrei Gherzan <andrei.gherzan@windriver.com>

Some tests need:
* gobject and optparse module (ex: test-session)
* subprocess and fnctl module (ex: backtrace)
* urllib module (ex: get-proxy-autoconfig)

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 meta/recipes-connectivity/connman/connman.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 12378e9..58cac0b 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r11"
+INC_PR = "r12"
 
 TIST = "--enable-tist"
 TIST_powerpc = ""
@@ -113,7 +113,7 @@ PACKAGES =+ "${PN}-tools ${PN}-tests"
 FILES_${PN}-tools = "${bindir}/wispr"
 
 FILES_${PN}-tests = "${bindir}/*-test ${libdir}/${BPN}/test/*"
-RDEPENDS_${PN}-tests = "python-dbus"
+RDEPENDS_${PN}-tests = "python-dbus python-pygobject python-textutils python-subprocess python-fcntl python-netclient"
 
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
             ${libdir}/connman/plugins \
-- 
1.7.9.5



