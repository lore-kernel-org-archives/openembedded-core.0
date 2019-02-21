Return-Path: <tanuk@iki.fi>
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
	[64.147.123.25])
	by mail.openembedded.org (Postfix) with ESMTP id C0A4C7CB9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 20:13:14 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 1866532BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 15:13:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Thu, 21 Feb 2019 15:13:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=FFCjdBGUxkwP8VhhceBBAYgVEbgwPSt+dyfNzYZTwOU=; b=kBlO7AVB
	tpQ0jw+d1c8MFFipAIwsVhZmEmXVn4Hy6KMxOnpwsHPmmsdBfzgOIZOSS6u6uIni
	U/TfPuuB8jm0mz4q9qhV5UeG1MVusmqmkOReOGgHL6E0gCjWAFEK4ozhXXKWIGIc
	hm8KhCqX/IIw2jaQucOI8l3cY87q5AEW4CZ/cF5FhF32stg2pzt+T6YbrYdb7j0A
	rTv3N2X4btKc4659Ti6LFjkCH3p4Qvtp0aJA5aBog8eyLZPaN6Tz4date/57l+Nb
	vYW/fXSYv3wVXx9HXFWt0CywLYR/pB/ho5ZiALw48BIYm4rcoz+YY8QI0iUfEfKx
	QTMUjCpj1ZflCQ==
X-ME-Sender: <xms:WwZvXD0S5_ya9VsIsRL6MXTx0RqgR7R7e3eWIFUOsx2-JQf99qHYiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdekgddufeejucdltddurdegtdelrddttd
	dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhht
	necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
	ertdertddtnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhk
	ihdrfhhiqeenucffohhmrghinheprghlshgrqdhprhhojhgvtghtrdhorhhgnecukfhppe
	ekkedruddufedrvdduuddrjedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhk
	sehikhhirdhfihenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:WwZvXGig3lISULU5sxO9t6Cm6F-PmM3U3UKLXCJU28jqRrReaiZ5yA>
	<xmx:WwZvXPPQADkyok2ANV22SCHpyT9KnTqdT9MkKEdrZtMNs52Ut7Mkgg>
	<xmx:WwZvXGL1uz2LrQBBrmvJRhxeA7NBEOypErN1lOoIrLs57HgECb27wQ>
	<xmx:WwZvXIx2Aa64I4rXra05hbbXt7lzc0Q01df9kDbjJaBmqcbjMjjJvA>
Received: from localhost.localdomain (88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 32536E4519
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 15:13:15 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 22:13:03 +0200
Message-Id: <95ee8e9b49c65559e96214fd89531d0e8ea87bc9.1550779769.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1550779769.git.tanuk@iki.fi>
References: <cover.1550779769.git.tanuk@iki.fi>
MIME-Version: 1.0
Subject: [PATCH v2 1/3] alsa-lib: 1.1.6 -> 1.1.8
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
X-List-Received-Date: Thu, 21 Feb 2019 20:13:14 -0000
Content-Transfer-Encoding: 8bit

Changelogs:
http://alsa-project.org/main/index.php/Changes_v1.1.6_v1.1.7
http://alsa-project.org/main/index.php/Changes_v1.1.7_v1.1.8

One significant change was that the search path of add-on configuration
files was changed from /usr/share/alsa/alsa.conf.d to /etc/alsa/conf.d.
Packages that install such files should still use the /usr/share
location, though. Symlinks need to be created from /etc to /usr/share.
The rationale for using /etc is that the system administrator can better
control the configuration that way, and the rationale for installing
files under /usr/share is that configuration snippets that are installed
by packages are not meant to be directly edited by the administrator.

alsa-plugins had to be modified to add symlinks for the configuration
snippets that it installs. I also added FILES_${PN} = "", because the
alsa-plugins package is supposed to be empty, but also because for some
reason that I don't understand the symlinks would otherwise go to the
alsa-plugins package rather than alsa-plugins-pulseaudio-conf.

SRC_URI was changed to a more reliable source (at least currently the
ftp server is flaky).

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../alsa/{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb}   |  6 +++---
 meta/recipes-multimedia/alsa/alsa-plugins_1.1.6.bb  | 13 ++++++++++++-
 2 files changed, 15 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb} (83%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.8.bb
similarity index 83%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.1.8.bb
index 25e7a3c6b7..76cc9627e5 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.8.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     file://src/socket.c;md5=dd1bc7f44872690224d89c1a9806e495;beginline=1;endline=26 \
                     "
 
-SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2"
-SRC_URI[md5sum] = "2f981a8f7897c59ec2ddc44916d33788"
-SRC_URI[sha256sum] = "5f2cd274b272cae0d0d111e8a9e363f08783329157e8dd68b3de0c096de6d724"
+SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI[md5sum] = "0eec0d657a07927795809c8f87fb76ca"
+SRC_URI[sha256sum] = "3cdc3a93a6427a26d8efab4ada2152e64dd89140d981f6ffa003e85be707aedf"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.6.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.6.bb
index 7ede8be98a..ee06191ea9 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.6.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.6.bb
@@ -47,14 +47,23 @@ PACKAGES_DYNAMIC = "^libasound-module-.*"
 
 # The alsa-plugins package doesn't itself contain anything, it just depends on
 # all built plugins.
+FILES_${PN} = ""
 ALLOW_EMPTY_${PN} = "1"
 
 do_install_append() {
 	rm ${D}${libdir}/alsa-lib/*.la
 
-	# We use the example as is, so just drop the .example suffix.
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'yes', 'no', d)}" = "yes" ]; then
+		# We use the example as is, so just drop the .example suffix.
 		mv ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf.example ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf
+
+		# The conf.d files are installed in datadir, but alsa-lib
+		# searches for conf.d files only in sysconfdir. Distributions
+		# are expected to create symlinks in sysconfdir, so that's what
+		# we do here.
+		mkdir -p ${D}${sysconfdir}/alsa/conf.d
+		ln -s ${datadir}/alsa/alsa.conf.d/50-pulseaudio.conf ${D}${sysconfdir}/alsa/conf.d/50-pulseaudio.conf
+		ln -s ${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf ${D}${sysconfdir}/alsa/conf.d/99-pulseaudio-default.conf
 	fi
 }
 
@@ -94,6 +103,8 @@ INSANE_SKIP_${MLPREFIX}libasound-module-rate-speexrate = "dev-so"
 FILES_${PN}-pulseaudio-conf += "\
         ${datadir}/alsa/alsa.conf.d/50-pulseaudio.conf \
         ${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf \
+        ${sysconfdir}/alsa/conf.d/50-pulseaudio.conf \
+        ${sysconfdir}/alsa/conf.d/99-pulseaudio-default.conf \
 "
 
 RDEPENDS_${PN}-pulseaudio-conf += "\
-- 
2.20.1


