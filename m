Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TuKya-0002T1-1e
	for openembedded-core@lists.openembedded.org;
	Sun, 13 Jan 2013 11:39:42 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:56245 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TuKjn-0002AW-Ls for openembedded-core@lists.openembedded.org;
	Sun, 13 Jan 2013 05:24:23 -0500
Date: Sun, 13 Jan 2013 05:24:19 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1301130522480.22425@oneiric>
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
Subject: [PATCH] image_types.bbclass: Add and update comments regarding image types.
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
X-List-Received-Date: Sun, 13 Jan 2013 10:39:42 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Explain the elf/cpio.gz snippet of code, and update a comment to
reflect the correct variable name.  No functional change.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index bdb67b4..6bb113d 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -7,13 +7,16 @@ def get_imagecmds(d):
     ctypes = d.getVar('COMPRESSIONTYPES', True).split()
     cimages = {}

+    # The elf image depends on the cpio.gz image already having
+    # been created, so we add that explicit ordering here.
+
     if "elf" in alltypes:
         alltypes.remove("elf")
         if "cpio.gz" not in alltypes:
                 alltypes.append("cpio.gz")
         alltypes.append("elf")

-    # Filter out all the compressed images from types
+    # Filter out all the compressed images from alltypes
     for type in alltypes:
         basetype = None
         for ctype in ctypes:

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


