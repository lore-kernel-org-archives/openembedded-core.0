Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Sm9lu-0006Ed-1B
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 22:32:30 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:37158 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Sm9bF-0002O7-9s for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 16:21:29 -0400
Date: Tue, 3 Jul 2012 16:21:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207031620150.30734@oneiric>
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
Subject: prexport.bbclass: Fix typo in warning: "AUROPR" -> "AUTOPR".
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
X-List-Received-Date: Tue, 03 Jul 2012 20:32:30 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  i'm *assuming* this is the correct fix.

diff --git a/meta/classes/prexport.bbclass b/meta/classes/prexport.bbclass
index 2b16a66..b990c2b 100644
--- a/meta/classes/prexport.bbclass
+++ b/meta/classes/prexport.bbclass
@@ -21,7 +21,7 @@ python prexport_handler () {
             bb.fatal("prexport_handler: export failed!")
         (metainfo, datainfo) = retval
         if not datainfo:
-            bb.warn("prexport_handler: No AUROPR values found for %s" % ver)
+            bb.warn("prexport_handler: No AUTOPR values found for %s" % ver)
             return
         oe.prservice.prserv_export_tofile(e.data, None, datainfo, False)
     elif isinstance(e, bb.event.ParseStarted):

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


