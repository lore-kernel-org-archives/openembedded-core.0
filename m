Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 590037826D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 16:52:32 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id v186so2058864itc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 08:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=x95EZ5gCM0QtoB7OvPlJFAVId5Vu0BRYODnBjMk53d0=;
	b=k7nWaRn/R58BuicaJPZUuaXqlQplt4VbOp1RFqjxmc0EDdeLzZwUPItetXRpuTNflh
	ZZFS02igH2dOpEVjPhxRrKzReus4vFwAJ9+R+Ns00+u2B7kRd3P9lEGFngiZGNv68sob
	Mq25wL1kE8QRvX0N25jHeyx7PDLrw+yuprruRdqjCB2EbnG/6v57+vkTSWM2VfP7uny6
	t4F7n6lUgq3lbrVKzHy/d65gcQRlA2+RLrb//UFV4Pmjp7srxPVCy4qlamGcLxv73ZEa
	5W+FNIMvO0jkjFK/c/S6T9xOkdbS6vfwh45gcpR2XyoZh/lkvANMlkPFewNGNWhBrlex
	OcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=x95EZ5gCM0QtoB7OvPlJFAVId5Vu0BRYODnBjMk53d0=;
	b=syZQAqYwDCXkJOCrBpyesFLAc6S7NAF31zT9QxaNXqEq89nbVfmtgWW0TuG0l/+9zU
	zMPNYyaFyNNdHTy3XUk3PtFQi1+W+MPtr7ipw5yolw/wc1HlD28DeoTg6MClreVEyUT3
	OD6lICRZ49DS5bLjoInRnvFI/EPqjED7cKxX+raSUvGPNF8yugnsZ0oiOB4Hpyc23tT3
	PGk1GX0jIWwlNnRRqOXRbeGtxY73qoEjAi3wbV+nI+7L2Rw1wCLo5IkILKToD+1uX7U0
	Q8aiGHxa49xvzyVJv5gajstVuwe6wysmfDJkz81VaVxFbwztX42JFS3j+puiwSy8jGp1
	oxqw==
X-Gm-Message-State: APf1xPDv2AR5VVQBi47qk6UiVTfGsN6G9oqA4TJ6du3pmirbgJb9g+Bp
	gMiyZLa8+RtyLh5QIeoopwfPfjBz
X-Google-Smtp-Source: AH8x2271NwWEsimJwDk4rq0JAA73zDJM5F/ThODWtQAZVKrazsJnvGNmiy623Y8pOPFHdtVJxLWHfQ==
X-Received: by 10.36.111.66 with SMTP id x63mr5747428itb.12.1518454353756;
	Mon, 12 Feb 2018 08:52:33 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	w132sm12206760iow.51.2018.02.12.08.52.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Feb 2018 08:52:33 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Feb 2018 10:52:07 -0600
Message-Id: <f23460b2232463bac2d07d7decddd85af35eae64.1518453683.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1518453683.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
	<cover.1518453683.git.JPEWhacker@gmail.com>
Cc: Tomas Novotny <tomas@novotny.cz>
Subject: [PATCH v2 12/17] toolchain-shar-extract: Add post-relocate scripts
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
X-List-Received-Date: Mon, 12 Feb 2018 16:52:32 -0000

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


