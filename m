Return-Path: <joe@deserted.net>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id D1AE96AC00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 15:29:50 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id r141so4053839ita.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 07:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=ZdT5b1QQiA4znzf0dIBTi1JgalYQYjitZ/gMl3t5Yfk=;
	b=IOkDNGijwJd2Ltrtfu/LRNpcY8Dk4Va9NLX3kbd2NPPWGafeJjV2au7EyhBdex13JB
	QayxMbVaSKhjnPbz8pFDe+jwAkNBTHL2IQdfdGIjW56xNQRtSkmE2VoR5kKhZYwxBa8S
	LKvTwZGBIOfVho1EIMvmD+sS4V8686ZFa6muGNTZhbWStE1qmrW0m7wgT8Ks21SMKC6z
	zBxfaU6mInmK31Tm55SNIWtoGFJVSamdDbh96O8YZd2/RvLF9eaX3WXFGW0KRGdZ5HfL
	y+picCN8FM5kVuVQe6vae0md9nITsbMvKLsAoIX43hcCeYzpFkSjxafa4Yi8ipRzMUJH
	I0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=ZdT5b1QQiA4znzf0dIBTi1JgalYQYjitZ/gMl3t5Yfk=;
	b=mJFQJ7sUGsfmm1OMbSnjA28NtIEAS41dTZ1dZjGNhW+laRylnJl9aWOLTuZ3ticNcb
	eZq8i9J/IqTGbGEYwhA8kVZaGyqCDjHqR7/AH1rkWLjpg7XiakzX5uqTxqgFt9Gsmnp0
	FCr6/VCYn9a4RgloRpaGonmkIs7txjBo4oHrDzB/4AynVn5UJTsRB7+HV/9A8qNE3yi2
	l0nD8Sqz0gp17OOtI4Ek3mEcXW/gITbanOv9kn67bJ4FzSKFq9c70tflleQYSdyyn5dC
	8E9mZq0ZoC89ST56RZ9RNY9oarBszMwSOCy+YUwtLyaJGHd5pditQ98I+hVeMf4ZAMIT
	o4pA==
X-Gm-Message-State: AMke39lhgGND6hB34d66o+jEsEeDkVDEUwyCNrIBac35BJ6kMlYp9btzDgPhVxO4ed8MPQ==
X-Received: by 10.107.17.94 with SMTP id z91mr3401831ioi.37.1487950191653;
	Fri, 24 Feb 2017 07:29:51 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id k6sm3230958ioe.1.2017.02.24.07.29.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Feb 2017 07:29:51 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2017 10:30:15 -0500
Message-Id: <1487950215-8380-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1487908800-18064-1-git-send-email-joe_macdonald@mentor.com>
References: <1487908800-18064-1-git-send-email-joe_macdonald@mentor.com>
Subject: [PATCH v2] deprecated.bbclass: Add a PNDEPRECATED variable for recipes
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
X-List-Received-Date: Fri, 24 Feb 2017 15:29:52 -0000

Based on the blacklist behaviour, recipes can be tagged as deprecated.
Such recipes will produce a warning message when included in a build but
unlike blacklisted recipes, the build will continue.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
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


