Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id D05307857A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 22:03:23 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id p188so4125588ioe.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 14:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=x95EZ5gCM0QtoB7OvPlJFAVId5Vu0BRYODnBjMk53d0=;
	b=ctGMnKlRK2X/tjecldRupS/0oUirC8Hwfv9bEIQThZZ0dpvFg56Dq/MbaDs8kLexKS
	EPVKg+xiT4DBbm+rsud+WuasfKlV5mgpWnTpxmNqERg5awQv1nKrgSTwCA6fYO7Adkjx
	0ow4P3uNbKjcn0rJEXOK2j5H4CFYfTCusot9bLG8ajYL3nCEc5YysJpcdkv3TQXi6tGx
	EYlsQJ24gJIjTASR8Z0TJTGCbHXMOYzZXHyRgl3CfTDGq1xzyB+wdBgsorhR80n54I8a
	3BAgRbTOll29tnJOkQSiLYn/3rztx02o/fRo3v6r6h6t6myBf6N9xs4x2jZkBVRhWD4u
	IY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=x95EZ5gCM0QtoB7OvPlJFAVId5Vu0BRYODnBjMk53d0=;
	b=N1ZBTR7sfICFc71EW/IP1p2HuOCBd+76RQz2VFxSaz08N0FE5VA7hTjBYFa8ze84B0
	1UfbLMEiN2oq9h9vvz+HCJ5yc42YhyUdeHG5B/qr9iaCMsFzcXPKu62I/eA7eKPMzEE8
	O8VqcBbofUuWb+50OUJllgClqZ0z9/UYRfK8UmVkG8Ma4ErUQvnVJF1C/fZjhbT7Sg6Y
	0rHMsidE+Fsyyz9f9ZdAAFJFhlnaYC3wjBcFcWDJ4HYPp196DJO1BJIQBOd9TVq7vKIS
	V0mHcg6zdEZLA+idnPO2JW4PLY0cHhypOGsfEb38WhgF7s47P7VM39Gt/QwoOF2zBI00
	F9pw==
X-Gm-Message-State: APf1xPA0TWGMz8C2SC6KJSNcchR5E7XNrvFASPevO80WR9SZnymkROne
	U2tF/3YflxbFpQnm3L81xPDYZUKb
X-Google-Smtp-Source: AH8x227vFL7cmpfkG5L+88dtZLAGkhJi4fLacMSHm+1DgqcUSWh4aTJRoUaQZdRZiaYVXZno0X+c7A==
X-Received: by 10.107.136.86 with SMTP id k83mr4686228iod.128.1517954605242;
	Tue, 06 Feb 2018 14:03:25 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g69sm294785ita.9.2018.02.06.14.03.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 14:03:24 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue,  6 Feb 2018 16:01:31 -0600
Message-Id: <109e139b058ecc6031300073a4bc3bb19c27a3d0.1517857764.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1517857764.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
Subject: [PATCH 12/14] toolchain-shar-extract: Add post-relocate scripts
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
X-List-Received-Date: Tue, 06 Feb 2018 22:03:24 -0000

Recipes can now install post-relocation scripts which will be run when
the SDK is installed.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/toolchain-scripts.bbclass     | 15 +++++++++++++++
 meta/files/toolchain-shar-extract.sh       |  8 ++++++++
 meta/recipes-core/meta/meta-environment.bb |  2 ++
 3 files changed, 25 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 9bcfe708c7c..eeb320d15a8 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -116,6 +116,21 @@ fi
 EOF
 }
 
+toolchain_create_post_relocate_script() {
+	script=$1
+	rm -f $script
+	touch $script
+
+    cat >> $script <<EOF
+if [ -d "${SDKPATHNATIVE}/post-relocate-setup.d/" ]; then
+    for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*.sh; do
+        \$s "\$1"
+    done
+    rm -rf "${SDKPATHNATIVE}/post-relocate-setup.d"
+fi
+EOF
+}
+
 #we get the cached site config in the runtime
 TOOLCHAIN_CONFIGSITE_NOCACHE = "${@siteinfo_get_files(d)}"
 TOOLCHAIN_CONFIGSITE_SYSROOTCACHE = "${STAGING_DIR}/${MLPREFIX}${MACHINE}/${target_datadir}/${TARGET_SYS}_config_site.d"
diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 91804ec2818..f7ab43066fb 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -259,6 +259,14 @@ if [ $savescripts = 0 ] ; then
 	$SUDO_EXEC rm -f ${env_setup_script%/*}/relocate_sdk.py ${env_setup_script%/*}/relocate_sdk.sh
 fi
 
+# Execute post-relocation script
+post_relocate="$target_sdk_dir/post-relocate-setup.sh"
+if [ -e "$post_relocate" ]; then
+	$SUDO_EXEC sed -e "s:@SDKPATH@:$target_sdk_dir:g" -i $post_relocate
+	$SUDO_EXEC /bin/sh $post_relocate "$target_sdk_dir" "@SDKPATH@"
+	$SUDO_EXEC rm -f $post_relocate
+fi
+
 echo "SDK has been successfully set up and is ready to be used."
 echo "Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g."
 for env_setup_script in `ls $target_sdk_dir/environment-setup-*`; do
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 29da121a3a9..09f757a087c 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -55,6 +55,8 @@ create_sdk_files() {
 
 	# Add version information
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${REAL_MULTIMACH_TARGET_SYS}
+
+	toolchain_create_post_relocate_script ${SDK_OUTPUT}/${SDKPATH}/post-relocate-setup.sh
 }
 
 do_install() {
-- 
2.14.3


