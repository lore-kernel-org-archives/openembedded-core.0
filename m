Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S8xv1-0005I9-FJ
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Mar 2012 18:59:55 +0100
Received: by yenm3 with SMTP id m3so4892314yen.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Mar 2012 10:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=T6IapVw5j/Bn9/aVg894w9CD0WPD3lSAyHYJBcpO4z0=;
	b=GenWJAqPTY9TAgTgLGMeViZOdrAHjVjPgpmVQDU93QZsao+czQPHFbBMKD1WmYLYbF
	1IiHMMm3mUt6RQEiaFFC+Iz8wl9rwciXeZzrLXCheRi8GYn4+zp/xdTf9kI2Ab2Efr5P
	8cRRWfSK9BPWK+5IxO/vGCyigaHbvZvsa7TUWRsBBFktXDWmS4sehD8FfLFqOa0w4mVU
	ylCU3KJcsXwj0JDcs6Wb95G1mwjDBHVKCxA+8hv2YETDzFWgMbzYpA2j+GoTGHncDQFO
	yCn5lKQL4AvZWMjv/Qaborz8q+VlfENqCy24KFNYBQ/9YO6BxpBD8shvzQOG3rS+aA/w
	zPXQ==
Received: by 10.236.186.71 with SMTP id v47mr6868211yhm.115.1332006665903;
	Sat, 17 Mar 2012 10:51:05 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o68sm23194488yhk.16.2012.03.17.10.51.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 17 Mar 2012 10:51:05 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Mar 2012 17:50:57 +0000
Message-Id: <b4527ef9e2fe5d238e512011c667e91ff83ca20f.1332006643.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1332006643.git.otavio@ossystems.com.br>
References: <cover.1332006643.git.otavio@ossystems.com.br>
Subject: [PATCH 1/1] package_rpm.bbclass: fix bashims at rpm_common_comand() method
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
X-List-Received-Date: Sat, 17 Mar 2012 17:59:55 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Cc: Daiane Angolini <daiane.angolini@freescale.com>
---
 meta/classes/package_rpm.bbclass |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 68313ec..80b1619 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -151,7 +151,6 @@ resolve_package_rpm () {
 rpm_common_comand () {
 
     local target_rootfs="${INSTALL_ROOTFS_RPM}"
-    local extra_args="$@"
 
     ${RPM} --root ${target_rootfs} \
         --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
@@ -160,7 +159,7 @@ rpm_common_comand () {
         -D "_dbpath ${rpmlibdir}" \
         --noparentdirs --nolinktos \
         -D "__dbi_txn create nofsync private" \
-        -D "_cross_scriptlet_wrapper ${WORKDIR}/scriptlet_wrapper" $extra_args
+        -D "_cross_scriptlet_wrapper ${WORKDIR}/scriptlet_wrapper" $@
 }
 
 # install or remove the pkg
-- 
1.7.2.5



