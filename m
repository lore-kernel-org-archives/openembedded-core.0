Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8CAFB60962
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 17:04:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5HH4iao006095
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 10:04:45 -0700 (PDT)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 17 Jun 2015 10:04:44 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jun 2015 12:04:41 -0500
Message-ID: <1434560682-89221-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1434560682-89221-1-git-send-email-mark.hatle@windriver.com>
References: <1434560682-89221-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] rpm: Rebrand rpm custom macro paths to be distro specific
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jun 2015 17:04:43 -0000
Content-Type: text/plain

RPM was previously hard coded to use the 'poky' directory.  We really want
the directory name to be distribution specific.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.14.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index eac3b8f..fb81f12 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -108,9 +108,9 @@ inherit autotools gettext
 acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
 
 # Specify the default rpm macros in terms of adjustable variables
-rpm_macros = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:%{_etcrpm}/macros.*:%{_etcrpm}/macros:%{_etcrpm}/%{_target}/macros:~/.oerpmmacros"
-rpm_macros_class-native = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros"
-rpm_macros_class-nativesdk = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros"
+rpm_macros = "%{_usrlibrpm}/macros:%{_usrlibrpm}/${DISTRO}/macros:%{_usrlibrpm}/${DISTRO}/%{_target}/macros:%{_etcrpm}/macros.*:%{_etcrpm}/macros:%{_etcrpm}/%{_target}/macros:~/.oerpmmacros"
+rpm_macros_class-native = "%{_usrlibrpm}/macros:%{_usrlibrpm}/${DISTRO}/macros:%{_usrlibrpm}/${DISTRO}/%{_target}/macros:~/.oerpmmacros"
+rpm_macros_class-nativesdk = "%{_usrlibrpm}/macros:%{_usrlibrpm}/${DISTRO}/macros:%{_usrlibrpm}/${DISTRO}/%{_target}/macros:~/.oerpmmacros"
 
 # sqlite lua tcl augeas nss gcrypt neon xz xar keyutils perl selinux
 
-- 
1.9.3


