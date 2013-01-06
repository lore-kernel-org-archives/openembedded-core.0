Received: from mail-la0-f44.google.com ([209.85.215.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Ts0DH-0006nN-9g
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 01:05:12 +0100
Received: by mail-la0-f44.google.com with SMTP id fr10so13959211lab.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 15:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=YvzvByjFRRakiG2l9E8gS0bilHB1ynge+WFY5rBv+9Q=;
	b=XhnZknv0VV7Xo/Jg7mADJw1eq3nI3j4BWkxDGhaUYo2rurnO43gDGglMFD5HJf6kqn
	Ea86zvFzBgQ5+azJm83Q4yUyl+zlVsV4WCru4oM2TNA4zHV81dQ7k4qKCX0o/W7A1VQO
	kZ8hfEvbKm7omW9Foq2oZrvEzz2eIwouDVM8VDv42EZKv1jQZa4X7lArhXRorRa4JeNe
	n9JLQ5Ezn4p16OfokHi2tufJr58iTt4HNfzP8mzZF2TM2AxfhAVgBn96pCN/JST/fnfK
	ivJgv/0EA+zVpt4GSidn9zTa9uVR30AZTmaXZLgGzSxJCjB30qqe1PU/AB2ytAqbBkQe
	wmiA==
X-Received: by 10.152.148.40 with SMTP id tp8mr56276365lab.30.1357516202680;
	Sun, 06 Jan 2013 15:50:02 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ox6sm21994961lab.16.2013.01.06.15.49.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 15:50:01 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TrzyU-0001Q3-H3; Mon, 07 Jan 2013 01:49:54 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 01:49:37 +0200
Message-Id: <1357516181-5358-12-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357516181-5358-11-git-send-email-cazfi74@gmail.com>
References: <1357516181-5358-1-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-2-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-3-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-4-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-5-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-6-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-7-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-8-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-9-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-10-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-11-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v2 11/15] libid3tag: replace obsolete automake macros with working ones
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 00:05:12 -0000

Add obsolete-automake-macros.patch that replaces automake macros
no longer supported by automake-1.13 with modern constructs.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../libid3tag/libid3tag/obsolete_automake_macros.patch   |   14 ++++++++++++++
 meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb   |    6 ++++--
 2 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch

diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch b/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
new file mode 100644
index 0000000..2ecd478
--- /dev/null
+++ b/meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Submitted (https://sourceforge.net/tracker/?func=detail&aid=3599280&group_id=12349&atid=112349)
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd libid3tag-0.15.1b/configure.ac libid3tag-0.15.1b/configure.ac
+--- libid3tag-0.15.1b/configure.ac	2004-01-24 01:22:46.000000000 +0200
++++ libid3tag-0.15.1b/configure.ac	2013-01-03 06:41:02.734835014 +0200
+@@ -28,7 +28,7 @@
+
+ AM_INIT_AUTOMAKE
+
+-AM_CONFIG_HEADER([config.h])
++AC_CONFIG_HEADERS([config.h])
+
+ dnl System type.
diff --git a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
index dbcf2da..d81f58b 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
+++ b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -7,10 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 			file://version.h;beginline=1;endline=8;md5=86ac68b67f054b7afde9e149bbc3fe63"
 SECTION = "libs"
 DEPENDS = "zlib gperf-native"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libid3tag-${PV}.tar.gz \
-           file://addpkgconfig.patch"
+           file://addpkgconfig.patch \
+           file://obsolete_automake_macros.patch \
+"
 
 SRC_URI[md5sum] = "e5808ad997ba32c498803822078748c3"
 SRC_URI[sha256sum] = "63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610e26151"
-- 
1.7.10.4



