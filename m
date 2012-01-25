Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.ferland@gmail.com>) id 1RqANl-0004JF-5C
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 22:28:12 +0100
Received: by qcha6 with SMTP id a6so1025114qch.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 13:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=BNknSrjo6KYMtgGNEcs3PlyoJ0pBUwcLrIFlgx/cli8=;
	b=expauGrZygDw9LdMwsAa875u0DOzVeiVsPejSWFAYkVi3bQr+qWtbS6yW4waUYJcOh
	DN3c4NZYkg+IEdn+WITDqcmtR+Kiu39A3xIei4p3XhMYQiT1lNCsq6UUmKm5SVSkBh+U
	QpsrNRTDJXgJtsvwCO6y2KzCWMspLR9qQi6iA=
Received: by 10.229.135.203 with SMTP id o11mr7037937qct.101.1327526320420;
	Wed, 25 Jan 2012 13:18:40 -0800 (PST)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPS id d5sm3981456qaj.18.2012.01.25.13.18.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 13:18:39 -0800 (PST)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Wed, 25 Jan 2012 16:18:48 -0500
From: Marc Ferland <ferlandm@sonatest.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2012 16:18:48 -0500
Message-Id: <1327526328-26365-1-git-send-email-ferlandm@sonatest.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] pm-utils: Add grep to RDEPENDS to avoid command failures.
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
X-List-Received-Date: Wed, 25 Jan 2012 21:28:12 -0000

Second version of the patch that adds grep to RDEPENDS.

Fixes [YOCTO #1887]

Signed-off-by: Marc Ferland <ferlandm@sonatest.com>
---
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
index a4ac230..92d65c1 100644
--- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
+++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
@@ -1,12 +1,13 @@
 SECTION = "base"
 SUMMARY = "Utilities and scripts for power management"
-DESCRIPTION = "Simple shell command line toos to suspect and hibernate."
+DESCRIPTION = "Simple shell command line tools to suspend and hibernate."
 HOMEPAGE = "http://pm-utils.freedesktop.org/wiki/"
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/pm-pmu.c;beginline=1;endline=22;md5=3c1ddbc54e735fb4a0386e14c78a3147"
 
-PR = "r0"
+PR = "r1"
+RDEPENDS_${PN} = "grep"
 
 SRC_URI = "http://pm-utils.freedesktop.org/releases/pm-utils-${PV}.tar.gz"
 
-- 
1.7.5.4



