Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E30617E6F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 19:51:47 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id 31so105678531wrm.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 12:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zkHX3k4O/tHQkqAQN19PPgS+0lTOGvRMbc2KZkJ1Nzw=;
	b=qatokfS4XWsmspk3xDoWJss7XDsPKCQEJx7DBfz7LeeykGEsMQndYS5PPaUJ5hYGhw
	U54Avo5ToeW8KjWnphbC6uUNs8q3A77c3LW1KlOM0ifYW6phL/y64xhot5Be44cqlT9p
	2V3aeWviFK+VDpLi7QI0g7veTpTvj++M7bL7dgUVC9T7riwdCioC4NIRzoo80dePjkKW
	cF1vAeb2JiPW1ywGNVqVOFtR8ZWqfqjNoo+I6iK1tAvL6nPkDrrsJYOogcvmSnrgXbcu
	lJaFQGP2RyPPyCAPu99W9eI1BEl9RccqoXz+sp/Gg5wB75yC4y5B1meOI3PNhp4if3v5
	tI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zkHX3k4O/tHQkqAQN19PPgS+0lTOGvRMbc2KZkJ1Nzw=;
	b=fkW4uqkRAtrQPDmbEAFx9U5jadE5k4vtS6rHqPI9z4fWm1d/fJtV6eqKDyDY2t5enM
	ZhhP99jHgEyNGfM57lDEqnIU1u/GOY3z+fhBLXMlGYBoXh/HmvjCdhczfIWIcmGgNMnl
	38IamjPIamw/+K+VTdkPH7hKFhDXIy2RlETbJwTP1AzAmgmb+FVv744s6waxszUPZmyF
	g5LpmTch9lyGPmCzfnxOkgKn4pe+GR9f70wHOt2fHtruDFeX1/ICdZeuRjvAUUEslQXM
	PplISD3RGnKrlrcSAQR17lVSVJS7Qly66eaFZEzxJGesHKp7B0jbAcvwPDjcKPwvZM4N
	WNvw==
X-Gm-Message-State: APjAAAWlDPa2kfrgRX7r2K91oDp8jJlBebqVNNNDgPtE5tGCkHzIJjsz
	ikN/sRoj1tI1RbHO9AXZmAE=
X-Google-Smtp-Source: APXvYqy2HmE+IdZwzpNUQa/rSlpMfqf8liZ6hU6JVBuAyMWKg+QrYWg/Wi3rz6HHSzkB72BvKx0wIQ==
X-Received: by 2002:a05:6000:1284:: with SMTP id
	f4mr10184766wrx.89.1565639508612; 
	Mon, 12 Aug 2019 12:51:48 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id r190sm968768wmf.0.2019.08.12.12.51.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Aug 2019 12:51:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Date: Mon, 12 Aug 2019 19:51:40 +0000
Message-Id: <20190812195140.900-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: herb.kuta@lge.com
Subject: [yocto-docs][PATCH] ref-manual: mention PREPROCESS_RELOCATE_DIRS variable
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
X-List-Received-Date: Mon, 12 Aug 2019 19:51:48 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 documentation/ref-manual/ref-classes.xml   |  5 ++++-
 documentation/ref-manual/ref-variables.xml | 21 +++++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
index ece47e757..159efb3b1 100644
--- a/documentation/ref-manual/ref-classes.xml
+++ b/documentation/ref-manual/ref-classes.xml
@@ -413,7 +413,10 @@
         <filename>cross</filename>, and
         <filename>cross-canadian</filename> recipes to change
         <filename>RPATH</filename> records within binaries in order to make
-        them relocatable.
+        them relocatable. To extend the list of directories where it searches
+        for binaries to relocate, you can set
+        <link linkend='var-PREPROCESS_RELOCATE_DIRS'><filename>PREPROCESS_RELOCATE_DIRS</filename></link>
+        variable in your recipe.
     </para>
 </section>
 
diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 9470a780a..5ac766658 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -11424,6 +11424,27 @@
             </glossdef>
         </glossentry>
 
+        <glossentry id='var-PREPROCESS_RELOCATE_DIRS'><glossterm>PREPROCESS_RELOCATE_DIRS</glossterm>
+            <info>
+                PREPROCESS_RELOCATE_DIRS[doc] = "List of extra directories where to search for binaries which should be relocatable."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
+                    List of extra directories with binaries.
+                </para>
+
+                <para>
+                    <filename>PREPROCESS_RELOCATE_DIRS</filename> is used by
+                    chrpath.bbclass to allow extending the list where it searches
+                    for binaries. By default it searches in:
+                    ${bindir} ${sbindir} ${base_sbindir} ${base_bindir} ${libdir} ${base_libdir} ${libexecdir}
+                    Thus, <filename>PREPROCESS_RELOCATE_DIRS</filename> usually doesn't
+                    need to be set withing recipes.
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-PRIORITY'><glossterm>PRIORITY</glossterm>
             <info>
                 PRIORITY[doc] = "Indicates the importance of a package.  The default value is 'optional'.  Other standard values are 'required', 'standard', and 'extra'."
-- 
2.17.1


