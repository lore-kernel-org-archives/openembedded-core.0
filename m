Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAfuq-0001Lv-OB
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 12:10:48 +0100
Received: by wera1 with SMTP id a1so1696240wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 04:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=7gopItEngyJHdREhzaxLVodUVd+Pl63buS8hFlbEahk=;
	b=eCz68EXHBAG32f5oXjGJEQftf5GbkkPS4muY3cOnr3udFev8Gt56iJwdvsSa0hcUsU
	18D3bbJauaAHBwRi31/WH2hUrMpLsk6xm+RQEuDAEE1vWe3U/HN0jA43mt5o6E1cTn9k
	70FxXqsXLJG0dqjZ+mFArp0l8Xqm8VMEzeqV/K2WFJOT5U2Z1CXn9FtGTZxKIBiqfiDk
	MdYYqveiFON3lg5GYsJC7LMySRabZhHqJ2WY5hw1T2pzhYd6AXL8khyHaGbvbKanuvof
	GlHWoP6rGC15Stv4yoMcnbWwmWxoWM0I8jOIvC0eSzb+rv8jVIEE/nyGw3fGseC0upqH
	7w0w==
Received: by 10.180.79.72 with SMTP id h8mr4038556wix.1.1332414113607;
	Thu, 22 Mar 2012 04:01:53 -0700 (PDT)
Received: from localhost.localdomain (p5B0A13EE.dip.t-dialin.net.
	[91.10.19.238])
	by mx.google.com with ESMTPS id fn2sm7546875wib.0.2012.03.22.04.01.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 04:01:52 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 12:05:57 +0100
Message-Id: <1332414362-6406-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1332414362-6406-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332414362-6406-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] avahi.inc: use systemd_unitdir
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
X-List-Received-Date: Thu, 22 Mar 2012 11:10:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-connectivity/avahi/avahi.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 0308095..731ad9a 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -14,7 +14,7 @@ SECTION = "network"
 # python scripts are under GPLv2+
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 DEPENDS = "expat libcap libdaemon dbus glib-2.0"
 
@@ -41,7 +41,7 @@ EXTRA_OECONF = "--with-distro=debian \
              --disable-qt4 \
              --disable-python \
              --disable-doxygen-doc \
-             --with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
+             --with-systemdsystemunitdir=${systemd_unitdir}/system/ \
              ${AVAHI_GTK} \
            "
 
@@ -57,7 +57,7 @@ do_configure_prepend() {
 
 PACKAGES =+ "avahi-systemd avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avahi-utils"
 
-FILES_avahi-systemd = "${base_libdir}/systemd"
+FILES_avahi-systemd = "${systemd_unitdir}"
 FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
                        ${sysconfdir}/avahi/avahi-autoipd.action \
                        ${sysconfdir}/dhcp3/*/avahi-autoipd"
-- 
1.7.4.4



