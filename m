Return-Path: <joe@deserted.net>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 565CD6093F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 13:58:06 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id v13so5992149iov.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 05:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=LIkPpfWMxnaEHAaIpl2vHu3GjosiKikKHpuAnumNpDg=;
	b=kJ/8K7bDuqmam8GM9VhexApOunHPsQGjugRGiKRUxg7ccAqMjOa0O76LvWonIk/76h
	wBbJp2sSRdQoZ17xK5mEWVYBxbSLyN0nVAeTUx5nr6P5S0a8LF8V0PTPiDgED12O6u9q
	EQ/rFJ0IJxB0VggU95sCVDxb3iSNySqbB/+uG0PcvbHVNIVJjtjHr0hcmS6HN+wDEQL0
	hd+tspmKX9Xa1L1wBUX9HgIwWPx5A5ggh4bCYRfvNP8YcFAF0H4AzRAnNrSwXppwlU9M
	M1JcV4QpqJaJhJ1yEVH3fwM9NCTIFIZMINKc/ZT8Gl9Fln4YS5XOitknMTt9c6LbKWmM
	7Thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=LIkPpfWMxnaEHAaIpl2vHu3GjosiKikKHpuAnumNpDg=;
	b=HlTzNgEQCRLDKQlMe8w7TKM4hjgQ5Axg9rl1LT5c8iieRCb3BIFP4keDhhlELJaVgK
	pjY5zn/agcKXH+GbEqEr2keFBvgHNKuFLrNQrhzZ9nsj2wJQc8sv7Bhedtd3mnIK0zvJ
	8oHfUL72A6kNV9S7sQzp0WUjFu6aMZ4GuNLnBsjVRoTOshxSdyYufjnok5zFdRrMgvzV
	SMXfKT7sYaHG1X5Zc/j8yzOT9PI34JbEAT96qQQtyVIaJA7o/+SHUX7sSWip4A/BQgZX
	WtoUcbLzqhPx0nrdAU3yRPNeQBX/WtYBJgfRlVbHTYclL6kF4GVL6av+FZRCnariVAx9
	yCSA==
X-Gm-Message-State: AMke39ljgs1s5VvE0t5jwhcMPfae7HE2bGXVSFvSJIT6gVTMTQh9nWErBJZdGvfSq+2Wog==
X-Received: by 10.107.38.202 with SMTP id m193mr15907130iom.185.1488203887032; 
	Mon, 27 Feb 2017 05:58:07 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	r184sm2639755ita.14.2017.02.27.05.58.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Feb 2017 05:58:06 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2017 08:59:07 -0500
Message-Id: <1488203947-5539-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1487908800-18064-1-git-send-email-joe_macdonald@mentor.com>
References: <1487908800-18064-1-git-send-email-joe_macdonald@mentor.com>
Subject: [PATCH v3] deprecated.bbclass: Add a PNDEPRECATED variable for recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Feb 2017 13:58:07 -0000

Based on the blacklist behaviour, recipes can be tagged as deprecated.
Such recipes will produce a warning message when included in a build but
unlike blacklisted recipes, the build will continue.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---

v2: Included documentation for new variable

v3: Refreshed to address patchwork scolding

 documentation/ref-manual/ref-classes.xml   | 28 ++++++++++++++++++++++++++++
 documentation/ref-manual/ref-variables.xml | 28 ++++++++++++++++++++++++++++
 meta/classes/deprecated.bbclass            | 16 ++++++++++++++++
 meta/conf/distro/defaultsetup.conf         |  3 ++-
 4 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/deprecated.bbclass

diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
index f7b1126..6088b44 100644
--- a/documentation/ref-manual/ref-classes.xml
+++ b/documentation/ref-manual/ref-classes.xml
@@ -632,6 +632,34 @@
     </para>
 </section>
 
+<section id='ref-classes-deprecated'>
+    <title><filename>deprecated.bbclass</filename></title>
+
+    <para>
+        The <filename>deprecated</filename> class identifies recipes
+        that for one reason or another are being considered for removal
+        from their current layer. It may be due to persistent, known
+        issues with the package, that there are newer, more feature-rich
+        alternatives available in the same layer or that the recipe is
+        no longer needed.  The recipe should provide a reason for the
+        depercation and a suggestion to consumers of the recipe as to how
+        to proceed.
+        To use this class, inherit the class globally and set
+        <link linkend='var-PNDEPRECATED'><filename>PNDEPRECATED</filename></link>
+        for each recipe you intend to deprecate.
+        Specify the <link linkend='var-PN'><filename>PN</filename></link>
+        value as a variable flag (varflag) and provide a reason, which is
+        reported, if the package is requested to be built as the value.
+        For example, if you want to deprecate a recipe called "exoticware",
+        you add the following to your <filename>local.conf</filename>
+        or distribution configuration:
+        <literallayout class='monospaced'>
+     INHERIT += "deprecated"
+     PNDEPRECATED[exoticware] = "'exoticware' is considered obsolete and has been replaced by 'standardware'.  'exoticware' may not appear in future releases."
+        </literallayout>
+    </para>
+</section>
+
 <section id='ref-classes-devshell'>
     <title><filename>devshell.bbclass</filename></title>
 
diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index f79cdd2..629d167 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -9920,6 +9920,34 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
             </glossdef>
         </glossentry>
 
+        <glossentry id='var-PNDEPRECATED'><glossterm>PNDEPRECATED</glossterm>
+            <info>
+                PNDEPRECATED[doc] = "Lists recipes that may be removed in a future release or have more actively maintained alternatives."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
+                    Lists recipes that may be removed in a future release or
+                    have more actively maintained alternatives.
+                    This variable works in conjunction with the
+                    <link linkend='ref-classes-deprecated'><filename>deprecated</filename></link>
+                    class, which the recipe must inherit globally.
+                </para>
+
+                <para>
+                    To identify a recipe as deprecated, inherit the class
+                    globally and use the variable in your
+                    <filename>local.conf</filename> file.
+                    Here is an example that will show a warning when
+                    <filename>myrecipe</filename> is included in a project:
+                    <literallayout class='monospaced'>
+     INHERIT += "deprecated"
+     PNDEPRECATED[myrecipe] = "Recipe is no longer actively maintained, you should consider using 'mynewrecipe' as an alternative."
+                    </literallayout>
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-POPULATE_SDK_POST_HOST_COMMAND'><glossterm>POPULATE_SDK_POST_HOST_COMMAND</glossterm>
             <info>
                 POPULATE_SDK_POST_HOST_COMMAND[doc] = "Specifies a list of functions to call once the OpenEmbedded build system has created host part of the SDK."
diff --git a/meta/classes/deprecated.bbclass b/meta/classes/deprecated.bbclass
new file mode 100644
index 0000000..3dcdadb
--- /dev/null
+++ b/meta/classes/deprecated.bbclass
@@ -0,0 +1,16 @@
+# To use the deprecated recipe check, a distribution should
+# include this class in the INHERIT_DISTRO
+#
+# Features:
+#
+# * To add a package to the deprecated list, set:
+#   PNDEPRECATED[pn] = "message"
+#
+
+addtask check_deprecated before do_fetch
+python do_check_deprecated () {
+    deprecated = d.getVarFlag('PNDEPRECATED', d.getVar('PN', True), False)
+
+    if deprecated:
+        bb.warn("Recipe is deprecated: ", (deprecated))
+}
diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index ca2f917..16ece3a 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -20,5 +20,6 @@ CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'
 USER_CLASSES ?= ""
 PACKAGE_CLASSES ?= "package_ipk"
 INHERIT_BLACKLIST = "blacklist"
+INHERIT_DEPRECATED = "deprecated"
 INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool"
-INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST}"
+INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST} ${INHERIT_DEPRECATED}"
-- 
1.9.1


