Return-Path: <jpuhlman@mvista.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id B62E8754A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 18:27:55 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id b14-v6so3981248pls.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 11:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=0qdU7NzAdNIy8jxOYSetxkkvfnnxXWbl+qqIYRHrRgQ=;
	b=tDKn7NrvmDAjArfMSfzuzBMN7RMvNvM/OuUbd02G87wHrg7wjoTmfQRQCz6Buu/nqK
	7Pg80Ypd3+iyHHfCvaFncP9r9ZrpKEvE4fIdGeSIuzgw+FQe/xbnAx36pAeGS1FQEUln
	I7ysqxwGiMLaM82npqvKfTPPtOrKLzKJRYxaiu/Zh6ppT0ypsa0gkwnKCaPOvjf4tlxj
	x29OkgdlWyvCA0ncD8PCj44L9CWs8Oa24no+FZMnsNLLnEmk7suZli4F8hHJv5isIzrn
	S7k2PFwqKXXAqts5mu8Ss/vLTZxwHIz1WbUUnylxnT8/w0nIhqeWWN5Bn2sDztIKYSqn
	9JQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0qdU7NzAdNIy8jxOYSetxkkvfnnxXWbl+qqIYRHrRgQ=;
	b=nBrKl+vR2KZtqA8pbgfrIO5Y9tbUiJI9qTxr76Gpw2OGP35SkvICW7b58YjdVbfCW3
	XOMCu1A7HyaolVsQEM3DiwJnjQmMWSJkLvaaSfefeQuAnE8b02EKuD178S4egBQBETjl
	1ab1jg+ZUo6W63GX20v3wyJfOep+rq6PSnOYF1I3K1VIx4UHesH85daY2zY43JiGFlaP
	d7+b7PkEnhy5mocM4D8sb9mogP9gbVSsgN+TyD1O446nrEnozVfQj4kbLUkXWkxKLDNO
	yxD3TNXiUWxY+k3c4+aUoTZrBx9Oo9xehXzTrURyF3Lw9179cfDZKS060iiwYA5TuNoH
	jVCA==
X-Gm-Message-State: APt69E37ZDsa2G+iIUMChEBrzHUDexPybEqmnLEC5VSI8wa6XjucpwLd
	k3n07zCRl0Hn+r6+NS3d0eUgaOK/U5A=
X-Google-Smtp-Source: ADUXVKIebXJ5AxrQg9prLCGj+xl0JR91juZgHxk5lgKDdklS0zQEZ1z8UkwuNun8HxFqP/NNLRI2zw==
X-Received: by 2002:a17:902:4c:: with SMTP id
	70-v6mr4220593pla.178.1529000876603; 
	Thu, 14 Jun 2018 11:27:56 -0700 (PDT)
Received: from jptest02.mvista.com (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	a23-v6sm4302964pfj.117.2018.06.14.11.27.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jun 2018 11:27:56 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2018 11:25:04 -0700
Message-Id: <20180614182504.23557-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.14.1.459.g238e487
Subject: [PATCH v2] atk: Correct multilib conflict in header.
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
X-List-Received-Date: Thu, 14 Jun 2018 18:27:55 -0000

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 .../0001-Switch-from-filename-to-basename.patch    | 38 ++++++++++++++++++++++
 meta/recipes-support/atk/atk_2.28.1.bb             |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/atk/atk/0001-Switch-from-filename-to-basename.patch

diff --git a/meta/recipes-support/atk/atk/0001-Switch-from-filename-to-basename.patch b/meta/recipes-support/atk/atk/0001-Switch-from-filename-to-basename.patch
new file mode 100644
index 0000000000..047e81fb61
--- /dev/null
+++ b/meta/recipes-support/atk/atk/0001-Switch-from-filename-to-basename.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Submitted
+
+From 0330251715fee908f2f162565d4fa1df5030d0c0 Mon Sep 17 00:00:00 2001
+From: Jeremy Puhlman <jpuhlman@mvista.com>
+Date: Thu, 14 Jun 2018 17:21:49 +0000
+Subject: [PATCH] Switch from filename to basename
+
+When atk-enum-types.h is installed in to a system, the user likely has
+no access to the location where the headers were built, especially if
+the software was built in a sysroot environment. If the headers were
+built for a mulitlib environment, the build pathing may be different.
+Subsequently, if two mulitlib variants of atk are installed together the
+headers conflict for no other reason then they were built in two
+different locations. Switching from filename to basename, still should
+provide sufficient information on the providence of the enums, while not
+conflicting for really no good reason.
+
+Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+---
+ atk/atk-enum-types.h.template | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/atk/atk-enum-types.h.template b/atk/atk-enum-types.h.template
+index 7b4cec4..8321c24 100644
+--- a/atk/atk-enum-types.h.template
++++ b/atk/atk-enum-types.h.template
+@@ -14,7 +14,7 @@ G_BEGIN_DECLS
+ 
+ /*** BEGIN file-production ***/
+ 
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+ 
+ /*** BEGIN value-header ***/
+-- 
+2.14.1.459.g238e487
+
diff --git a/meta/recipes-support/atk/atk_2.28.1.bb b/meta/recipes-support/atk/atk_2.28.1.bb
index 657c69d576..a051247d8f 100644
--- a/meta/recipes-support/atk/atk_2.28.1.bb
+++ b/meta/recipes-support/atk/atk_2.28.1.bb
@@ -27,6 +27,7 @@ EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'Tr
 
 SRC_URI_append = " \
                    file://0001-meson.build-enable-introspection-for-cross-compile.patch \
+                   file://0001-Switch-from-filename-to-basename.patch \
                    "
 SRC_URI[archive.md5sum] = "dfb5e7474220afa3f4ca7e45af9f3a11"
 SRC_URI[archive.sha256sum] = "cd3a1ea6ecc268a2497f0cd018e970860de24a6d42086919d6bf6c8e8d53f4fc"
-- 
2.14.1.459.g238e487


