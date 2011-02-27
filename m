Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcxm-0007DK-UR
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:30:50 +0100
Received: by mail-ww0-f43.google.com with SMTP id 15so3168700wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:29:29 -0800 (PST)
Received: by 10.227.53.203 with SMTP id n11mr3366550wbg.120.1298798968818;
	Sun, 27 Feb 2011 01:29:28 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w25sm2267761wbd.23.2011.02.27.01.29.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:29:28 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:02 +0100
Message-Id: <07355d0f04c66f9ea1010750840da5b92abafb71.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 01/50] documentation/yocto-project-qs/yocto-project-qs.xml: [BUGID# 628] - Added note about Python 2.6 bitbake requirement
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
X-List-Received-Date: Sun, 27 Feb 2011 09:30:51 -0000

From: Scott Rifenbark <scott.m.rifenbark@intel.com>

Part of the fix for Bug 628 is to add a note that bitbake requires
python 2.6.  I added this note before the example bitbake command
that builds an image.  I also added a linked reference to the Poky
Reference Manual and mentioned the FAQ appendix.  There will be more
information about the python requirement in the FAQ.

Signed-off-by: Scott Rifenbark <scott.m.rifenbark@intel.com>
---
 .../yocto-project-qs/yocto-project-qs.xml          |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/documentation/yocto-project-qs/yocto-project-qs.xml b/documentation/yocto-project-qs/yocto-project-qs.xml
index 56dafe5..452282f 100644
--- a/documentation/yocto-project-qs/yocto-project-qs.xml
+++ b/documentation/yocto-project-qs/yocto-project-qs.xml
@@ -278,6 +278,12 @@
      $ bitbake poky-image-sato
                  </literallayout>
              </para></note>
+             <note><para>
+                 BitBake requires Python 2.6.  For more information on this requirement, 
+                 see the FAQ appendix in the 
+                 <ulink url='http://www.yoctoproject.org/docs/poky-ref-manual/poky-ref-manual.html'>
+                 Poky Reference Manual</ulink>.
+             </para></note>
              The final command runs the image:
              <literallayout class='monospaced'>
      $ poky-qemu qemux86
-- 
1.6.6.1



