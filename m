Received: from 253-16.static.businesstel.hu ([178.210.253.16]
	helo=teledigit.eu) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kgy@teledigit.eu>) id 1RxDYs-00082P-15
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 09:16:30 +0100
X-AuthUser: kgy@teledigit.eu
Received: from linux-oxe9.localnet ([195.228.189.98]:59618)
	by teledigit.eu with [XMail 1.26 ESMTP Server]
	id <S1EA0> for <openembedded-core@lists.openembedded.org> from
	<kgy@teledigit.eu>; Tue, 14 Feb 2012 08:59:57 +0100
From: Gyorgy Kovesdi <kgy@teledigit.eu>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2012 08:59:56 +0100
Message-ID: <2061594.EF8qQeAt5j@linux-oxe9>
Organization: NNG
User-Agent: KMail/4.7.2 (Linux/3.1.9-1.4-desktop; KDE/4.7.2; x86_64; ; )
MIME-Version: 1.0
Subject: tcl modules are missing
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
X-List-Received-Date: Tue, 14 Feb 2012 08:16:30 -0000
X-Groupsio-MsgNum: 17482
Content-Type: multipart/mixed; boundary="nextPart3076198.YG71VQ5DWn"
Content-Transfer-Encoding: 7Bit

--nextPart3076198.YG71VQ5DWn
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

I have problems using tcl: the modules directory (/usr/lib/tcl8) is missing.
I created a patch to solve it:

diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb b/meta/recipes-
devtools/tcltk/tcl_8.5.11.bb
index 146021a..1d28558 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
@@ -60,6 +60,7 @@ do_install() {
 PACKAGES =+ "${PN}-lib"
 FILES_${PN}-lib = "${libdir}/libtcl8.5.so*"
 FILES_${PN} += "${prefix}/lib/tcl8.5"
+FILES_${PN} += "${prefix}/lib/tcl8"
 FILES_${PN}-dev += "${libdir}/tclConfig.sh"
 
 BBCLASSEXTEND = "native"

Regards
Gyorgy Kovesdi

--nextPart3076198.YG71VQ5DWn
Content-Disposition: attachment; filename="add-modules-dir.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="add-modules-dir.patch"

diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
index 146021a..1d28558 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
@@ -60,6 +60,7 @@ do_install() {
 PACKAGES =+ "${PN}-lib"
 FILES_${PN}-lib = "${libdir}/libtcl8.5.so*"
 FILES_${PN} += "${prefix}/lib/tcl8.5"
+FILES_${PN} += "${prefix}/lib/tcl8"
 FILES_${PN}-dev += "${libdir}/tclConfig.sh"
 
 BBCLASSEXTEND = "native"

--nextPart3076198.YG71VQ5DWn--
