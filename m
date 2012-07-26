Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SuVHG-0004md-HD
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 23:07:22 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:43852 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SuV68-0006Yb-SN for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 16:55:52 -0400
Date: Thu, 26 Jul 2012 16:55:43 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207261653110.20795@oneiric>
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
Subject: image.bbclass: Fix a couple innocuous typoes, should cause no functional change
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
X-List-Received-Date: Thu, 26 Jul 2012 21:07:22 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


"error_promt" -> "error_prompt" changed in both places
"subfolers" -> "subfolders" since it's not referenced anyway

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 1799bf1..0a380f1 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -266,12 +266,12 @@ import sys, os, os.path
 import re,filecmp

 allow_rep=re.compile(re.sub("\|$","","${MULTILIBRE_ALLOW_REP}"))
-error_promt="Multilib check error:"
+error_prompt="Multilib check error:"

 files={}
 dirs=raw_input()
 for dir in dirs.split():
-  for root, subfolers, subfiles in os.walk(dir):
+  for root, subfolders, subfiles in os.walk(dir):
     for file in subfiles:
       item=os.path.join(root,file)
       key=str(os.path.join("/",os.path.relpath(item,dir)))
@@ -284,7 +284,7 @@ for dir in dirs.split():
         else:
           if not filecmp.cmp(files[key],item):
              valid=False
-             print("%s duplicate files %s %s is not the same\n" % (error_promt, item, files[key]))
+             print("%s duplicate files %s %s is not the same\n" % (error_prompt, item, files[key]))
              sys.exit(1)

       #pass the check, add to list

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


