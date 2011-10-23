Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RHzAs-00006k-Nl
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 16:37:20 +0200
Received: by gyc15 with SMTP id 15so4846956gyc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2011 07:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=/VfULOLCJCJ/ha/blwf4ehovrDXRl1OY+lrWT9vi0YA=;
	b=p2+WNUdCRTkSbF+WkgrN/xubZK4bfFIdnjGiGuV1D9DJjYiUcjm9Bp4iPZOwBgmCw1
	1NKT2vTmvW8d4HqlgpQsNBGzY5CadH9zXqOos5Mdj+pTsfcgymQvYE7dIirS+8CXqKmx
	dXFRb4q+qVkaB1nnaqlmuvtHrTe8eacaw5Czw=
Received: by 10.68.17.197 with SMTP id q5mr32121098pbd.25.1319380281842;
	Sun, 23 Oct 2011 07:31:21 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id x7sm55741835pbf.5.2011.10.23.07.31.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Oct 2011 07:31:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2011 07:31:07 -0700
Message-Id: <1319380267-29794-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1319380267-29794-1-git-send-email-raj.khem@gmail.com>
References: <1319380267-29794-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] pulseaudio: inherit perlnative
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
X-List-Received-Date: Sun, 23 Oct 2011 14:37:20 -0000

manpage generatition uses xmltoman utility
which inturn uses xml-parser. So we add
libxml-parser-perl-native to DEPENDS and also
inherit perlnative so it does not use the one
from build host

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pulseaudio/pulseaudio_0.9.23.bb                |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
index 33f5e15..9521ab0 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
@@ -1,10 +1,10 @@
 require pulseaudio.inc
 
-PR = "r5"
+PR = "r6"
 
-DEPENDS += "gdbm speex"
+DEPENDS += "gdbm speex libxml-parser-perl-native"
 
-inherit gettext
+inherit gettext perlnative
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.gz \
   file://buildfix.patch \
-- 
1.7.5.4



