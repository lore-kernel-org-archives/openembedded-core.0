Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RllMN-0007t0-95
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 18:56:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0DHmfBn024737
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2012 09:48:41 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 13 Jan 2012 09:48:41 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jan 2012 11:53:00 -0600
Message-ID: <45d6910c05f7bf68e2f0c9f6a08103be7d53b5af.1326477036.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1326477036.git.mark.hatle@windriver.com>
References: <cover.1326477036.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] prelink: Update to latest version
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
X-List-Received-Date: Fri, 13 Jan 2012 17:56:15 -0000
Content-Type: text/plain

The latest version of prelink corrects a problem when attempting
to prelink MIPS architectures.

    2012-01-04 Mark Hatle <mark.hatle@windriver.com>
      * exec.c: Check that a section is larger then 0 bytes when
        determining the section to segment mapping. This matches
        the behavior of elfutils - readelf. Otherwise an empty
        PROGBITS section at the end of a segment will cause a
        failure.

[YOCTO #1463]

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    6 +++---
 meta/recipes-devtools/prelink/prelink_git.bb       |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 14eff32..75896f6 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -3093,9 +3093,9 @@ RECIPE_MANUAL_CHECK_DATE_pn-perl = "Nov 16, 2011"
 RECIPE_MAINTAINER_pn-perl = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-prelink="green" 
-RECIPE_LATEST_VERSION_pn-prelink="1.0+git0+0xbb1b660c5e3859b6c5a2ac8d739713e9989a4dd7"
-RECIPE_LAST_UPDATE_pn-prelink = "Dec 15, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-prelink = "Dec 15, 2011"
+RECIPE_LATEST_VERSION_pn-prelink="1.0+git0+0x7b47f2f8a15ed13b7905bc120bb2586f3e164f7d"
+RECIPE_LAST_UPDATE_pn-prelink = "Jan 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-prelink = "Jan 13, 2012"
 RECIPE_MAINTAINER_pn-prelink = "Mark Hatle <mark.hatle@windriver.com>"
 
 RECIPE_STATUS_pn-python-dbus="green" 
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 17141e9..c94bdf5 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -8,9 +8,9 @@ and executables, so that far fewer relocations need to be resolved at \
 runtime and thus programs come up faster."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
-SRCREV = "bb1b660c5e3859b6c5a2ac8d739713e9989a4dd7"
+SRCREV = "7b47f2f8a15ed13b7905bc120bb2586f3e164f7d"
 PV = "1.0+git${SRCPV}"
-PR = "r8"
+PR = "r9"
 
 #
 # The cron script attempts to re-prelink the system daily -- on
-- 
1.7.3.4



