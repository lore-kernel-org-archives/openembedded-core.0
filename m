Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcxw-0007Da-R0
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:01 +0100
Received: by wyb38 with SMTP id 38so2800543wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:29:34 -0800 (PST)
Received: by 10.216.184.139 with SMTP id s11mr1146518wem.13.1298798972341;
	Sun, 27 Feb 2011 01:29:32 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 16sm990066wet.32.2011.02.27.01.29.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:29:32 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:06 +0100
Message-Id: <5b78689f48def034daa870fa5bce49f0cfdf91c5.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 02/50] documentation/poky-ref-manual/faq.xml: [BUGID# 628] - Added new question for Python 2.6 requirement.
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
X-List-Received-Date: Sun, 27 Feb 2011 09:31:01 -0000

From: Scott Rifenbark <scott.m.rifenbark@intel.com>

As part of the fix for #628 I added a new question to the FAQ for use
of Poky when you do not have Python 2.6.

Signed-off-by: Scott Rifenbark <scott.m.rifenbark@intel.com>
---
 documentation/poky-ref-manual/faq.xml |   41 +++++++++++++++++++++++++++++++++
 1 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/documentation/poky-ref-manual/faq.xml b/documentation/poky-ref-manual/faq.xml
index b209fff..7a891b0 100644
--- a/documentation/poky-ref-manual/faq.xml
+++ b/documentation/poky-ref-manual/faq.xml
@@ -20,6 +20,47 @@
             </para>
         </answer>
     </qandaentry>
+
+
+
+
+
+    <qandaentry>
+        <question>
+            <para>
+                I only have Python 2.4 or 2.5 but BitBake requires Python 2.6.
+                Can I still use Poky?
+            </para>
+        </question>
+        <answer>
+            <para>
+                You can use a stand-alone tarball to provide Python 2.6.
+                You can find pre-built 32 and 64-bit versions of Python 2.6 at the following locations:
+                <itemizedlist>
+                    <listitem><para><ulink url='http://autobuilder.yoctoproject.org/downloads/miscsupport/python-nativesdk-standalone-i586.tar.bz2'></ulink></para></listitem>
+                    <listitem><para><ulink url='http://autobuilder.yoctoproject.org/downloads/miscsupport/python-nativesdk-standalone-x86_64.tar.bz2'></ulink></para></listitem>
+                </itemizedlist>
+            </para>
+            <para>
+                These tarballs are self-contained with all required libraries and should work 
+                on most Linux systems.  
+                To use the tarballs extract them into the root 
+                directory and run the appropriate command:
+                <literallayout class='monospaced'>
+     $ export PATH=/opt/poky/sysroots/i586-pokysdk-linux/usr/bin/:$PATH
+     $ export PATH=/opt/poky/sysroots/x86_64-pokysdk-linux/usr/bin/:$PATH
+                </literallayout>
+            </para>
+            <para>
+                Once you run the command, BitBake uses Python 2.6.
+            </para>
+        </answer>
+    </qandaentry>
+
+
+
+
+
     <qandaentry>
         <question>
             <para>
-- 
1.6.6.1



