Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TJvLl-0000aC-J5
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 02:01:05 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so992558pad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 16:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/LqVbDZRSKfLYUBK4qH8sxbOTZp758Pwb65ol8FBcEo=;
	b=d6CxYOIDN7004tJRehaHfy8VnPT5sGNj+Y9D7CRjX+/LBWCtZeWR06sBjPptEv91+C
	VJ1ZGh1eE31HaH+I7vNh8+InOXWKzAQqXEMQ4izBGrr58B6XNNp8VjhZ/wXXBQbjyS7J
	A5tsqfxXw77tPHogJl/H+upjZf9qhqbYc/xujR9iVrPUt4AmsWtLdkP0yRvM/6Mf9h5H
	ra1983FZtLja2lMAdTa7bMfAETKf24GdSBWfCNoBsbxhngzoMyuTHnEvMwWFEHJD9MW0
	Wo9oX3sseMiyiAVvYQZBpKy1/NA8CbUwRgNQM7b9qVlxNkbWN6F+8e4mZbNmGQLnbBQU
	8S0Q==
Received: by 10.66.75.233 with SMTP id f9mr17132472paw.21.1349394483023;
	Thu, 04 Oct 2012 16:48:03 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id sz4sm5053178pbc.22.2012.10.04.16.48.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 16:48:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2012 16:47:39 -0700
Message-Id: <1349394459-26860-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] toolchain-scripts.bbclass: Export M4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Oct 2012 00:01:05 -0000

some packages use M4 variable from environment and sometimes
its hardcoded to /usr/bin/m4 if not found in environment. Lets
define it such that it is picked from path

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/toolchain-scripts.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 44284c3..6d8623c 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -26,6 +26,7 @@ toolchain_create_sdk_env_script () {
 	echo 'export OBJDUMP=${TARGET_PREFIX}objdump' >> $script
 	echo 'export AR=${TARGET_PREFIX}ar' >> $script
 	echo 'export NM=${TARGET_PREFIX}nm' >> $script
+	echo 'export M4=m4' >> $script
 	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
 	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${SDK_ARCH}-linux --with-libtool-sysroot=${SDKTARGETSYSROOT}"' >> $script
 	if [ "${TARGET_OS}" = "darwin8" ]; then
-- 
1.7.9.5



