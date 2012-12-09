Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1ThgOH-0000uL-Km
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Dec 2012 13:53:53 +0100
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:60625 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ThgAG-0000xk-Us; Sun, 09 Dec 2012 07:39:25 -0500
Date: Sun, 9 Dec 2012 07:39:21 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1212090736560.4965@oneiric>
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
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH] documentation-audit.sh: Add/fix checks for skipped lines.
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
X-List-Received-Date: Sun, 09 Dec 2012 12:53:53 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Have the script skip:

  * "Recipe" lines.
  * Lines with 11 "=", not 12.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  if scott wants to adjust this differently, it's all his.

diff --git a/scripts/contrib/documentation-audit.sh b/scripts/contrib/documentation-audit.sh
index a2c4586..2144aac 100755
--- a/scripts/contrib/documentation-audit.sh
+++ b/scripts/contrib/documentation-audit.sh
@@ -30,9 +30,10 @@ echo " you'll get false positives.  For example, LICENSE_FLAGS_WHITELIST = \"Com

 for pkg in `bitbake -s | awk '{ print \$1 }'`; do
 	if [[ "$pkg" == "Loading" || "$pkg" == "Loaded" ||
+	  "$pkg" == "Recipe"  ||
           "$pkg" == "Parsing" || "$pkg" == "Package" ||
           "$pkg" == "NOTE:"   || "$pkg" == "WARNING:" ||
-          "$pkg" == "done."   || "$pkg" == "============" ]]
+          "$pkg" == "done."   || "$pkg" == "===========" ]]
 	then
 		# Skip initial bitbake output
 		continue

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


