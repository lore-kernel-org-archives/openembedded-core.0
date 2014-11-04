Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6780970A8B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 13:40:55 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id a1so13559446wgh.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Nov 2014 05:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Gh83LMvrVNTylZm5hOVrt2BOstxGnO6lLWzj1i1tBUg=;
	b=llBwQRzR8CkuFjyO+h6QHKqXF9tf6erkTaMq+ZLdGZPP7ebnLX9HFXwJNwyrqOd4NT
	YpSO4wWySHGKfvep2XjHybKN2dqCc4QXgwfniQ8Q7irOr4acfx9vDE+FXviIQ37IlZZO
	//Z78rXHWw2m2E8YcWbds7By+ItDkD5KnL9OgYTz8Vay9tIxXIf3zNuRj8C/We/stLnh
	0pZo9Hf1QKslZnUHtdFJO2sYNg9miMOPCVTuzCW/QRRwRqkA0Dml7Bd7YvdeuaU8WgQT
	87kUedWC0T2kDAEbr1Nu+5NEUyyBtRsLo9/0FFD0jfxwV32cqx0QmCOv7zb8Eruu9/nx
	LISQ==
X-Gm-Message-State: ALoCoQlbLIAOTU0tBEi69i4JciOeAI8mUlKC8AgVwppwCgkds1f4mZ3WiO+JkRZPY6Fh/1oBIGr2
X-Received: by 10.180.80.39 with SMTP id o7mr23403415wix.37.1415108454639;
	Tue, 04 Nov 2014 05:40:54 -0800 (PST)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id ci9sm1066128wid.24.2014.11.04.05.40.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Nov 2014 05:40:54 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Nov 2014 14:40:47 +0100
Message-Id: <1415108447-16821-3-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1415108447-16821-1-git-send-email-koen.kooi@linaro.org>
References: <1415108447-16821-1-git-send-email-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 3/3] lsb 4.1: fix indentation
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
X-List-Received-Date: Tue, 04 Nov 2014 13:41:02 -0000

Shell methods use tabs, variables use spaces.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-extended/lsb/lsb_4.1.bb | 96 ++++++++++++++++++------------------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index 897520a..b35796d 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar
            file://lsb_log_message \
            file://lsb_pidofproc \
            file://lsb_start_daemon \
-           "
+          "
 
 SRC_URI[md5sum] = "30537ef5a01e0ca94b7b8eb6a36bb1e4"
 SRC_URI[sha256sum] = "99321288f8d62e7a1d485b7c6bdccf06766fb8ca603c6195806e4457fdf17172"
@@ -73,54 +73,54 @@ do_install(){
 		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-ppc64
 	fi
 
-       install -d ${D}${sysconfdir}/core-lsb
-       install -d ${D}/${baselib}/lsb
-       for i in lsb_killproc lsb_log_message lsb_pidofproc lsb_start_daemon
-       do
-           install -m 0755 ${WORKDIR}/${i} ${D}${sysconfdir}/core-lsb
-       done
-       install -m 0755 ${WORKDIR}/init-functions ${D}/${baselib}/lsb
-
-       # creat links for LSB test
-       install -d ${D}${libdir}/lsb
-       ln -sf ${sbindir}/chkconfig ${D}${libdir}/lsb/install_initd
-       ln -sf ${sbindir}/chkconfig ${D}${libdir}/lsb/remove_initd
-       install -d ${D}/${libdir}
-       ln -sf ${sbindir}/sendmail ${D}/${libdir}/sendmail
-
-       if [ "${TARGET_ARCH}" = "x86_64" ];then
-	       cd ${D}
-               if [ "${baselib}" != "lib64" ]; then
-                   ln -sf ${baselib} lib64
-               fi
-	       cd ${D}/${baselib}
-               ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.2
-               ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.3
-       fi
-       if [ "${TARGET_ARCH}" = "i586" ];then
-	       cd ${D}/${baselib}
-               ln -sf ld-linux.so.2 ld-lsb.so.2
-               ln -sf ld-linux.so.2 ld-lsb.so.3
-       fi
-
-       if [ "${TARGET_ARCH}" = "powerpc64" ];then
-               cd ${D}
-               if [ "${baselib}" != "lib64" ]; then
-                   ln -sf ${baselib} lib64
-               fi
-               cd ${D}/${baselib}
-               ln -sf ld64.so.1 ld-lsb-ppc64.so.2
-               ln -sf ld64.so.1 ld-lsb-ppc64.so.3
-       fi
-       if [ "${TARGET_ARCH}" = "powerpc" ];then
-	       cd ${D}/${baselib}
-               ln -sf ld.so.1 ld-lsb-ppc32.so.2
-               ln -sf ld.so.1 ld-lsb-ppc32.so.3
-       fi
+	install -d ${D}${sysconfdir}/core-lsb
+	install -d ${D}/${baselib}/lsb
+	for i in lsb_killproc lsb_log_message lsb_pidofproc lsb_start_daemon
+	do
+	    install -m 0755 ${WORKDIR}/${i} ${D}${sysconfdir}/core-lsb
+	done
+	install -m 0755 ${WORKDIR}/init-functions ${D}/${baselib}/lsb
+
+	# creat links for LSB test
+	install -d ${D}${libdir}/lsb
+	ln -sf ${sbindir}/chkconfig ${D}${libdir}/lsb/install_initd
+	ln -sf ${sbindir}/chkconfig ${D}${libdir}/lsb/remove_initd
+	install -d ${D}/${libdir}
+	ln -sf ${sbindir}/sendmail ${D}/${libdir}/sendmail
+
+	if [ "${TARGET_ARCH}" = "x86_64" ];then
+		cd ${D}
+		 if [ "${baselib}" != "lib64" ]; then
+		     ln -sf ${baselib} lib64
+		 fi
+		cd ${D}/${baselib}
+		 ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.2
+		 ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.3
+	fi
+	if [ "${TARGET_ARCH}" = "i586" ];then
+		cd ${D}/${baselib}
+		 ln -sf ld-linux.so.2 ld-lsb.so.2
+		 ln -sf ld-linux.so.2 ld-lsb.so.3
+	fi
+
+	if [ "${TARGET_ARCH}" = "powerpc64" ];then
+		 cd ${D}
+		 if [ "${baselib}" != "lib64" ]; then
+		     ln -sf ${baselib} lib64
+		 fi
+		 cd ${D}/${baselib}
+		 ln -sf ld64.so.1 ld-lsb-ppc64.so.2
+		 ln -sf ld64.so.1 ld-lsb-ppc64.so.3
+	fi
+	if [ "${TARGET_ARCH}" = "powerpc" ];then
+		cd ${D}/${baselib}
+		 ln -sf ld.so.1 ld-lsb-ppc32.so.2
+		 ln -sf ld.so.1 ld-lsb-ppc32.so.3
+	fi
 }
 
 FILES_${PN} += "/lib64 \
-		${libdir}/lsb \
+                ${libdir}/lsb \
                 ${base_libdir}/lsb/* \
-		${libdir}/sendmail \
-               "
+                ${libdir}/sendmail \
+ "
-- 
1.9.3


