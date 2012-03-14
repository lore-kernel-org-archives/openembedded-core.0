Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1S7kG8-00064V-Bx
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 10:12:41 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2E93srd024794
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 02:03:54 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.241) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Wed, 14 Mar 2012 02:03:54 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 17:03:40 +0800
Message-ID: <8e34c071af55fbd1bf52da1c78337ee9ea23e9e5.1331713107.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331713107.git.kai.kang@windriver.com>
References: <cover.1331713107.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.241]
Subject: [PATCH 5/8] alsa-utils: update to 1.0.25
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
X-List-Received-Date: Wed, 14 Mar 2012 09:12:41 -0000
Content-Type: text/plain

Update to version 1.0.25, and update patch
0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
because rejected when apply it.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 ...-t-let-systemd-unit-restore-the-volume-wh.patch |    4 ++--
 .../ncursesfix.patch                               |    0
 .../uclibc-exp10-replacement.patch                 |    0
 ...alsa-utils_1.0.24.2.bb => alsa-utils_1.0.25.bb} |    8 ++++----
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-1.0.24.2 => alsa-utils-1.0.25}/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch (87%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-1.0.24.2 => alsa-utils-1.0.25}/ncursesfix.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-1.0.24.2 => alsa-utils-1.0.25}/uclibc-exp10-replacement.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.0.24.2.bb => alsa-utils_1.0.25.bb} (93%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch b/meta/recipes-multimedia/alsa/alsa-utils-1.0.25/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
similarity index 87%
rename from meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
rename to meta/recipes-multimedia/alsa/alsa-utils-1.0.25/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
index 55e180a..1690ca5 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
+++ b/meta/recipes-multimedia/alsa/alsa-utils-1.0.25/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
@@ -24,8 +24,8 @@ index 5cfc415..c3768c4 100644
  endif
  
  edit = \
--	sed $(SED) -r 's,@sbindir\@,$(sbindir),g' < $< > $@ || rm $@
-+	sed $(SED) -e 's,@localstatedir\@,$(localstatedir),g' -e 's,@sbindir\@,$(sbindir),g' < $< > $@ || rm $@
+-	$(SED) -r 's,@sbindir\@,$(sbindir),g' < $< > $@ || rm $@
++	$(SED) -e 's,@localstatedir\@,$(localstatedir),g' -e 's,@sbindir\@,$(sbindir),g' < $< > $@ || rm $@
  
  alsa-store.service: alsa-store.service.in
  	$(edit)
diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/ncursesfix.patch b/meta/recipes-multimedia/alsa/alsa-utils-1.0.25/ncursesfix.patch
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/ncursesfix.patch
rename to meta/recipes-multimedia/alsa/alsa-utils-1.0.25/ncursesfix.patch
diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/uclibc-exp10-replacement.patch b/meta/recipes-multimedia/alsa/alsa-utils-1.0.25/uclibc-exp10-replacement.patch
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/uclibc-exp10-replacement.patch
rename to meta/recipes-multimedia/alsa/alsa-utils-1.0.25/uclibc-exp10-replacement.patch
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
similarity index 93%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
index e62a0f3..e8ebef1 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
 SECTION = "console/utils"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
 DEPENDS = "alsa-lib ncurses libsamplerate0"
-PR = "r5"
+PR = "r0"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://ncursesfix.patch \
@@ -14,8 +14,8 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
           "
 
-SRC_URI[md5sum] = "8238cd57cb301d1c36bcf0ecb59ce6b2"
-SRC_URI[sha256sum] = "95127f740291086486c06c28118cabca0814bde48fd14dac041a9812a5ac1be2"
+SRC_URI[md5sum] = "f81f9dcb9a014fd32cb3a70066a5b9a9"
+SRC_URI[sha256sum] = "2e676a2f634bbfe279b260e10a96f617cb72ee63c5bbf6c5f96bb615705b302c"
 
 # lazy hack. needs proper fixing in gettext.m4, see
 # http://bugs.openembedded.org/show_bug.cgi?id=2348
-- 
1.7.5.4



