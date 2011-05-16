Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QM1F0-00041M-Fu for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 19:05:58 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QM0Bb-000456-Ri
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 17:58:23 +0200
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Organization: Phil Blundell Consulting Ltd
Date: Mon, 16 May 2011 17:24:23 +0100
Message-ID: <1305563063.2429.65.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: LIC_FILES_CHKSUM fatal?
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
X-List-Received-Date: Mon, 16 May 2011 17:05:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This change, from commit d2d5456cd3b3bd3e52a5dedccca4d46e3a7986d1:

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 225530a..71ed5b6 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -349,7 +349,7 @@ def package_qa_check_license(workdir, d):
         # just throw a warning now. Once licensing data in entered for enough of the recipes,
         # this will be converted into error and False will be returned.
         bb.error(pn + ": Recipe file does not have license file information (LIC_FILES_CHKSUM)")
-        return True
+        return False

means that, contrary to what the comment says, lack of LIC_FILES_CHKSUM
is now a fatal error.  Was this a deliberate change or an oversight? 

p.





