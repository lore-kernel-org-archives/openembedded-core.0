Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAfuv-0001MI-JU
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 12:10:53 +0100
Received: by mail-wg0-f43.google.com with SMTP id dr12so1103418wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 04:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=m/DQSjvmEzUCY9kGFrQj2OMjtelKGWqKDQXIXkZHZNs=;
	b=sUg6niWF/17NVWB8UIPvL32h+eAOl8yYKUTmjSIbc0DL90mrbNifFvf3iF0bqBbjSb
	xzEoINhu7LomNvEf4QtvMnRn1FIPqWqbMaE5lTnt4IVSwwgMhVFm+DbCY7LVdDBum+2R
	1A19qQvHY/7Q4O3O7R9wXRNZfw/nGSIIvI91UNdShcjX+tnT4ApZXejdY5Z1RmmeAIir
	haRD3rOebWxZ01itF+c+IQKkw3wwSu+sKrZ0AVpzPnmeHh2oNKPY0883c1JNgXTqp/tb
	tEM4OzDtRlJrAkXoew87jxq/Q2cFvmzQPKs7IX9D4cUpwiunzed3FfCna4ycsCrpzLKc
	LQMw==
Received: by 10.216.138.135 with SMTP id a7mr4468861wej.19.1332414121075;
	Thu, 22 Mar 2012 04:02:01 -0700 (PDT)
Received: from localhost.localdomain (p5B0A13EE.dip.t-dialin.net.
	[91.10.19.238])
	by mx.google.com with ESMTPS id fn2sm7546875wib.0.2012.03.22.04.01.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 04:02:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 12:06:02 +0100
Message-Id: <1332414362-6406-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1332414362-6406-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332414362-6406-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] consolekit: use systemd_unitdir
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
X-List-Received-Date: Thu, 22 Mar 2012 11:10:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-support/consolekit/consolekit_0.4.5.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
index 3a4b04f..d1cc037 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "ConsoleKit is a framework for defining and tracking users, login
 HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
 BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
 
-PR = "r8"
+PR = "r9"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
@@ -25,7 +25,7 @@ SRC_URI[sha256sum] = "43e0780c53078e125efcec3f847e484dc3533e49b408ce6a0ab1b22368
 
 S = "${WORKDIR}/ConsoleKit-${PV}"
 
-EXTRA_OECONF = "${POLKITCONF} --with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
+EXTRA_OECONF = "${POLKITCONF} --with-systemdsystemunitdir=${systemd_unitdir}/system/ \
                 ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam-module --with-pam-module-dir=${base_libdir}/security', '--disable-pam-module', d)} \
                "
 
-- 
1.7.4.4



