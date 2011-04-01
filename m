Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W1n-0005EZ-E2
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:32:09 +0200
Received: by pwj9 with SMTP id 9so580329pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=isNz8c/M68YA8Jmw3U4BiwN98HFndoXzrd5pArmYMeY=;
	b=GQFZmKuWUROxHBeR7jFI4+HSpEbZJyCi0/TeBembjz8VjZ1mYbZfLOmYFUYIR4MsDD
	Exm2k1DPTmBiKuArXAohfDWUVEnmaxXsHlcGgPJ1foD3iZeOQNfrQ/LDgZAdHVZClqZw
	hppBdWmJMVE4Gxp7nt4hL4cLueLi8BMZObxhk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=x2AQGvUr+9V2uHeKhAs/lLEzbrlPOUtU4fFZPXm+D1S956//0Z0+OJLxeOtWvPEDHc
	N2meW4GYO9c6OfSBEATOLyYDY2lbPmTomSYUdSDiZsf2UM2Nd7vU9J7cGvvkfOqWMnSd
	LWJZwd5J+Q/fUYbLOKYv7ODYJiFUk7v5FZqpw=
Received: by 10.143.137.4 with SMTP id p4mr2612744wfn.79.1301632206005;
	Thu, 31 Mar 2011 21:30:06 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 25sm2380269wfb.22.2011.03.31.21.30.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:30:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:29:57 -0700
Message-Id: <ebe63d03b55db6d6cf397919c6698a691c4954f8.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 33/46] libzypp_git.bb: inherit gettext class instead of adding gettext to DEPENDS directly
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
X-List-Received-Date: Fri, 01 Apr 2011 04:32:09 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/libzypp/libzypp_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index b473b9f..2e4ef7e 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -4,9 +4,9 @@ DESCRIPTION  = "The ZYpp Linux Software management framework"
 LICENSE  = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=11fccc94d26293d78cb4996cb17e5fa7"
 
-inherit cmake
+inherit cmake gettext
 
-DEPENDS  = "rpm boost gettext curl libxml2 zlib sat-solver expat openssl udev"
+DEPENDS  = "rpm boost curl libxml2 zlib sat-solver expat openssl udev"
 
 # rpmdb2solv from sat-solver is run from libzypp
 RDEPENDS_${PN} = "sat-solver"
-- 
1.7.4.1



