Received: from 9.mo5.mail-out.ovh.net ([178.32.96.204]
	helo=mo5.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R4AOW-0003KN-AV
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 13:46:16 +0200
Received: from mail183.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id 880801034965
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 10:46:09 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 15 Sep 2011 10:41:00 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO e6520eb.lan)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 15 Sep 2011 10:40:58 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.5 (mo5.mail-out.ovh.net)
Date: Thu, 15 Sep 2011 10:40:53 +0200
Message-Id: <1316076053-9436-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6
MIME-Version: 1.0
X-Ovh-Tracer-Id: 13410030841938750914
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -10
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrvddtucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdluddtmdenlhhinhhugidvgiculddqvddtmd
Subject: [PATCH] qt4: update to latest version 4.7.4
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
X-List-Received-Date: Thu, 15 Sep 2011 11:46:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- 4.7.4 was release on the 1st of september, the changelog is available
here : http://qt.gitorious.org/+qt-developers/qt/releases/blobs/v4.7.4/di=
st/changes-4.7.4
and mostly contains bug fix.
- this patch provides the right checksum for the qt 4.7.4 archive which
was updated on the 12 of september (no code change, only documentation
update but ... same archive name/version)

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   32 ++++++++++----=
------
 meta/recipes-qt/qt4/{qt-4.7.3.inc =3D> qt-4.7.4.inc} |    4 +-
 .../0001-Added-Openembedded-crossarch-option.patch |    0
 .../recipes-qt/qt4/{qt-4.7.3 =3D> qt-4.7.4}/g++.conf |    0
 .../hack-out-pg2-4.7.0.patch                       |    0
 .../qt4/{qt-4.7.3 =3D> qt-4.7.4}/linux.conf          |    0
 ...qt4-embedded_4.7.3.bb =3D> qt4-embedded_4.7.4.bb} |    0
 .../{qt4-native_4.7.3.bb =3D> qt4-native_4.7.4.bb}   |    4 +-
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb   |    8 -----
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb   |    8 +++++
 ...qt4-x11-free_4.7.3.bb =3D> qt4-x11-free_4.7.4.bb} |    0
 11 files changed, 28 insertions(+), 28 deletions(-)
 rename meta/recipes-qt/qt4/{qt-4.7.3.inc =3D> qt-4.7.4.inc} (93%)
 rename meta/recipes-qt/qt4/{qt-4.7.3 =3D> qt-4.7.4}/0001-Added-Openembed=
ded-crossarch-option.patch (100%)
 rename meta/recipes-qt/qt4/{qt-4.7.3 =3D> qt-4.7.4}/g++.conf (100%)
 rename meta/recipes-qt/qt4/{qt-4.7.3 =3D> qt-4.7.4}/hack-out-pg2-4.7.0.p=
atch (100%)
 rename meta/recipes-qt/qt4/{qt-4.7.3 =3D> qt-4.7.4}/linux.conf (100%)
 rename meta/recipes-qt/qt4/{qt4-embedded_4.7.3.bb =3D> qt4-embedded_4.7.=
4.bb} (100%)
 rename meta/recipes-qt/qt4/{qt4-native_4.7.3.bb =3D> qt4-native_4.7.4.bb=
} (67%)
 delete mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
 rename meta/recipes-qt/qt4/{qt4-x11-free_4.7.3.bb =3D> qt4-x11-free_4.7.=
4.bb} (100%)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/c=
onf/distro/include/distro_tracking_fields.inc
index 6f1a462..599406b 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -3406,32 +3406,32 @@ RECIPE_LAST_UPDATE_pn-imake =3D "Nov 21, 2010"
 RECIPE_MAINTAINER_pn-imake =3D "Yu Ke <ke.yu@intel.com>"
=20
 RECIPE_STATUS_pn-qt4-tools-native =3D "green" # no update needed
-RECIPE_LATEST_VERSION_pn-qt4-tools-native =3D "4.7.3"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-native =3D "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-native =3D "2011/05/04"
-RECIPE_LAST_UPDATE_pn-qt4-tools-native =3D "May 12, 2011"
+RECIPE_LATEST_VERSION_pn-qt4-tools-native =3D "4.7.4"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-native =3D "4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-native =3D "2011/09/01"
+RECIPE_LAST_UPDATE_pn-qt4-tools-native =3D "September 10, 2011"
 RECIPE_MAINTAINER_pn-qt4-tools-native =3D "Paul Eggleton <paul.eggleton@=
linux.intel.com>"
 DISTRO_PN_ALIAS_pn-qt4-tools-native =3D "Mandriva=3Dlibqt4-devel Ubuntu=3D=
libqt4-dev"
=20
 RECIPE_STATUS_pn-qt4-tools-nativesdk =3D "green"
-RECIPE_LATEST_VERSION_pn-qt4-tools-nativesdk =3D "4.7.3"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-nativesdk =3D "2 mont=
hs"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-nativesdk =3D "2011/05/04"
-RECIPE_LAST_UPDATE_pn-qt4-tools-nativesdk =3D "May 12, 2011"
+RECIPE_LATEST_VERSION_pn-qt4-tools-nativesdk =3D "4.7.4"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-nativesdk =3D "4 mont=
hs"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-nativesdk =3D "2011/09/01"
+RECIPE_LAST_UPDATE_pn-qt4-tools-nativesdk =3D "September 10, 2011"
 RECIPE_MAINTAINER_pn-qt4-tools-nativesdk =3D "Paul Eggleton <paul.egglet=
on@linux.intel.com>"
=20
 RECIPE_STATUS_pn-qt4-embedded =3D "green"
-RECIPE_LATEST_VERSION_pn-qt4-embedded =3D "4.7.3"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-embedded =3D "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-embedded =3D "2011/05/04"
-RECIPE_LAST_UPDATE_pn-qt4-embedded =3D "May 12, 2011"
+RECIPE_LATEST_VERSION_pn-qt4-embedded =3D "4.7.4"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-embedded =3D "4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-embedded =3D "2011/09/01"
+RECIPE_LAST_UPDATE_pn-qt4-embedded =3D "September 10, 2011"
 RECIPE_MAINTAINER_pn-qt4-embedded =3D "Paul Eggleton <paul.eggleton@linu=
x.intel.com>"
=20
 RECIPE_STATUS_pn-qt4-x11-free =3D "green"
-RECIPE_LATEST_VERSION_pn-qt4-x11-free =3D "4.7.3"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-x11-free =3D "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-x11-free =3D "2011/05/04"
-RECIPE_LAST_UPDATE_pn-qt4-x11-free =3D "May 12, 2011"
+RECIPE_LATEST_VERSION_pn-qt4-x11-free =3D "4.7.4"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-x11-free =3D "4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-x11-free =3D "2011/09/01"
+RECIPE_LAST_UPDATE_pn-qt4-x11-free =3D "September 10, 2011"
 RECIPE_MAINTAINER_pn-qt4-x11-free =3D "Paul Eggleton <paul.eggleton@linu=
x.intel.com"
 DISTRO_PN_ALIAS_pn-qt4-x11-free =3D "Ubuntu=3Dqt-x11-free Debian=3Dqt-x1=
1-free"
=20
diff --git a/meta/recipes-qt/qt4/qt-4.7.3.inc b/meta/recipes-qt/qt4/qt-4.=
7.4.inc
similarity index 93%
rename from meta/recipes-qt/qt4/qt-4.7.3.inc
rename to meta/recipes-qt/qt4/qt-4.7.4.inc
index a5b8b05..6db6b44 100644
--- a/meta/recipes-qt/qt4/qt-4.7.3.inc
+++ b/meta/recipes-qt/qt4/qt-4.7.4.inc
@@ -17,8 +17,8 @@ SRC_URI =3D "http://get.qt.nokia.com/qt/source/qt-every=
where-opensource-src-${PV}.
            file://linux.conf \
            "
=20
-SRC_URI[md5sum] =3D "49b96eefb1224cc529af6fe5608654fe"
-SRC_URI[sha256sum] =3D "d02b6fd69d089c01f4a787aa18175d074ccaecf8980a5956=
e328c2991905937e"
+SRC_URI[md5sum] =3D "9831cf1dfa8d0689a06c2c54c5c65aaf"
+SRC_URI[sha256sum] =3D "97195ebce8a46f9929fb971d9ae58326d011c4d54425389e=
6e936514f540221e"
=20
 S =3D "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
=20
diff --git a/meta/recipes-qt/qt4/qt-4.7.3/0001-Added-Openembedded-crossar=
ch-option.patch b/meta/recipes-qt/qt4/qt-4.7.4/0001-Added-Openembedded-cr=
ossarch-option.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.7.3/0001-Added-Openembedded-crossarc=
h-option.patch
rename to meta/recipes-qt/qt4/qt-4.7.4/0001-Added-Openembedded-crossarch-=
option.patch
diff --git a/meta/recipes-qt/qt4/qt-4.7.3/g++.conf b/meta/recipes-qt/qt4/=
qt-4.7.4/g++.conf
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.7.3/g++.conf
rename to meta/recipes-qt/qt4/qt-4.7.4/g++.conf
diff --git a/meta/recipes-qt/qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch b/meta=
/recipes-qt/qt4/qt-4.7.4/hack-out-pg2-4.7.0.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch
rename to meta/recipes-qt/qt4/qt-4.7.4/hack-out-pg2-4.7.0.patch
diff --git a/meta/recipes-qt/qt4/qt-4.7.3/linux.conf b/meta/recipes-qt/qt=
4/qt-4.7.4/linux.conf
similarity index 100%
rename from meta/recipes-qt/qt4/qt-4.7.3/linux.conf
rename to meta/recipes-qt/qt4/qt-4.7.4/linux.conf
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb b/meta/recipes-qt/=
qt4/qt4-embedded_4.7.4.bb
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb
rename to meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
diff --git a/meta/recipes-qt/qt4/qt4-native_4.7.3.bb b/meta/recipes-qt/qt=
4/qt4-native_4.7.4.bb
similarity index 67%
rename from meta/recipes-qt/qt4/qt4-native_4.7.3.bb
rename to meta/recipes-qt/qt4/qt4-native_4.7.4.bb
index e90a7ba..9c680f6 100644
--- a/meta/recipes-qt/qt4/qt4-native_4.7.3.bb
+++ b/meta/recipes-qt/qt4/qt4-native_4.7.4.bb
@@ -11,5 +11,5 @@ EXTRA_OECONF +=3D " -no-fast -silent -no-rpath"
=20
 TOBUILD :=3D "src/tools/bootstrap ${TOBUILD}"
=20
-SRC_URI[md5sum] =3D "49b96eefb1224cc529af6fe5608654fe"
-SRC_URI[sha256sum] =3D "d02b6fd69d089c01f4a787aa18175d074ccaecf8980a5956=
e328c2991905937e"
+SRC_URI[md5sum] =3D "9831cf1dfa8d0689a06c2c54c5c65aaf"
+SRC_URI[sha256sum] =3D "97195ebce8a46f9929fb971d9ae58326d011c4d54425389e=
6e936514f540221e"
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb b/meta/reci=
pes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb
deleted file mode 100644
index e2a4539..0000000
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require qt4-tools-nativesdk.inc
-
-PR =3D "${INC_PR}.0"
-
-SRC_URI +=3D "file://blacklist-diginotar-certs.diff"
-
-SRC_URI[md5sum] =3D "49b96eefb1224cc529af6fe5608654fe"
-SRC_URI[sha256sum] =3D "d02b6fd69d089c01f4a787aa18175d074ccaecf8980a5956=
e328c2991905937e"
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb b/meta/reci=
pes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
new file mode 100644
index 0000000..cbf6db5
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
@@ -0,0 +1,8 @@
+require qt4-tools-nativesdk.inc
+
+PR =3D "${INC_PR}.0"
+
+SRC_URI +=3D "file://blacklist-diginotar-certs.diff"
+
+SRC_URI[md5sum] =3D "9831cf1dfa8d0689a06c2c54c5c65aaf"
+SRC_URI[sha256sum] =3D "97195ebce8a46f9929fb971d9ae58326d011c4d54425389e=
6e936514f540221e"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb b/meta/recipes-qt/=
qt4/qt4-x11-free_4.7.4.bb
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb
rename to meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
--=20
1.7.6



