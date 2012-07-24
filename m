Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Stchv-0007ws-4U
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 12:51:15 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:34212 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1StcWo-0006fD-54 for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 06:39:46 -0400
Date: Tue, 24 Jul 2012 06:39:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207240636450.21023@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: xinit_1.3.2: Remove broken, superfluous 'FILES_${PN} += "${libdir}X11/xinit"'
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
X-List-Received-Date: Tue, 24 Jul 2012 10:51:15 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Besides being clearly broken, that line is unnecessary as that file is
already being picked up from this line in xorg-app-common.inc:

FILES_${PN} += " ${libdir}/X11/${BPN} ${datadir}/X11/app-defaults/"

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb b/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
index 2008e79..5a97c3b 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
@@ -19,5 +19,3 @@ SRC_URI[sha256sum] = "a1867fdaa83f68750b12ba4305c3c62f5992d0f52cfeb98e96c27a8e69
 EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"

 RDEPENDS_${PN} += "util-linux-mcookie"
-
-FILES_${PN} += "${libdir}X11/xinit"

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


