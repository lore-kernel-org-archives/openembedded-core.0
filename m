Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TwhT0-0007e4-Bo
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 00:04:50 +0100
Received: from mail-ea0-f200.google.com ([209.85.215.200])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 19 Jan 2013 14:49:25 -0800
Received: by mail-ea0-f200.google.com with SMTP id d14so5263281eaa.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 14:49:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=YIGDw2OI0E8FhUKtD8ISyNpuyZdiI88fJODDY+bh3qQ=;
	b=AuKNsOzVeAxieLLKR4qq+veAf3FNYoui3UIhhZ/Y+1kTO7NA7H7xQdod9Shk8PJFPC
	Pq32j1PWjQVzxpNyIKE2elWMgQtrQAoOCvF6zXainZ+gTASKsUqVLD2c9fUvCaOjwA9Z
	eLL7Ro5pNyoDDFTA3+f2c68Wq2jBLAJ3bQsC4/t6D8lvZqsrvfmbGzeF7JSswYvqTyY/
	wreWvahreevKuSHNUcMHO+2LOQhJYmJ4X9BptwNkKhO+c4vIEk+mzgppePkK5BcPEAyq
	FP7upkZqI49lcIy9C+L7kIU80lAXBS3zGwSaOdXld2job+IjcyvKw1FJL+tWENxXqxiB
	48dw==
X-Received: by 10.194.48.74 with SMTP id j10mr20005335wjn.36.1358635763875;
	Sat, 19 Jan 2013 14:49:23 -0800 (PST)
X-Received: by 10.194.48.74 with SMTP id j10mr20005332wjn.36.1358635763818;
	Sat, 19 Jan 2013 14:49:23 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id p2sm10967931wic.7.2013.01.19.14.49.22
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 14:49:23 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2013 22:47:11 +0000
Message-Id: <6dc13da20db32190722df18348662e055c237a73.1358635193.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlD3kH4siov3ko9BGjRPQf470Z6zW7y2Szj7sFwAh+7Xe31n6E19wCKgdjz13N4/LoW2r/5rSQKsYgGG4vGUgTSZAoAoSled102K5QkDE+pD+HYboSZ5eotNcv6eKXdO40MiNmfQlI8S+peg1vJPrHo5OKMtJ/GorPKgkCZwsYHQw+88VKkKG/WqPoxhUsvDdiqwbM7
Subject: [PATCH 08/10] base-files: add fstab for systemd based systems
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
X-List-Received-Date: Sat, 19 Jan 2013 23:04:51 -0000

From: Martin Donnelly <martin.donnelly@ge.com>

The default fstab has entries which are not necessary
in systemd based systems so add a simpler default in
this case.

Signed-off-by: Martin Donnelly <martin.donnelly@ge.com>
Signed-off-by: Radu Moisan <radu.moisan@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/base-files/base-files/fstab.systemd |    9 +++++++++
 meta/recipes-core/base-files/base-files_3.0.14.bb     |    7 ++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/base-files/base-files/fstab.systemd

diff --git a/meta/recipes-core/base-files/base-files/fstab.systemd b/meta/recipes-core/base-files/base-files/fstab.systemd
new file mode 100644
index 0000000..cb48a0d
--- /dev/null
+++ b/meta/recipes-core/base-files/base-files/fstab.systemd
@@ -0,0 +1,9 @@
+# stock fstab - you probably want to override this with a machine specific one
+
+rootfs               /                    auto       defaults              1  1
+tmpfs                /var/volatile        tmpfs      defaults              0  0
+tmpfs                /media/ram           tmpfs      defaults              0  0
+
+# uncomment this if your device has a SD/MMC/Transflash slot
+#/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto  0  0
+
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 8ef7195..a90e995 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -18,6 +18,7 @@ SRC_URI = "file://rotation \
            file://profile \
            file://shells \
            file://fstab \
+           file://fstab.systemd \
            file://filesystems \
            file://issue.net \
            file://issue \
@@ -91,7 +92,11 @@ do_install () {
  		install -m 0644 ${WORKDIR}/rotation ${D}${sysconfdir}/rotation
 	fi
 
-	install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
+	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -m 0644 ${WORKDIR}/fstab.systemd ${D}${sysconfdir}/fstab
+	else
+		install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
+	fi
 	install -m 0644 ${WORKDIR}/filesystems ${D}${sysconfdir}/filesystems
 	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
 	sed -i "s#ROOTHOME#${ROOT_HOME}#" ${WORKDIR}/profile
-- 
1.7.10.4



