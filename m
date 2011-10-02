Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RAQfk-0003aP-HQ
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Oct 2011 20:21:56 +0200
Received: by ywf7 with SMTP id 7so2747745ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Oct 2011 11:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=QxfIYwSGmuD8TupG6EtDYoH1BihHeSSkA8XXU3tIdcg=;
	b=gqdsuLsmtEuOZPEm2ugkkKqPNeFVJSAf+wHrndTR9jXUfwPHS0OZN2n/8hZ7qY+fhl
	TAt4G/aEnUeWt2Dm23gYYJFMASvzMfU7dfcqO010t3nlKlrfspV7XtRyNkkcH62ni1Fc
	H0IrtyZzgkfu52455c7oz+Wr3FszAiISgI/+o=
Received: by 10.236.152.105 with SMTP id c69mr59071473yhk.93.1317579374349;
	Sun, 02 Oct 2011 11:16:14 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id r30sm13093379yhj.20.2011.10.02.11.16.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 02 Oct 2011 11:16:13 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Oct 2011 18:15:55 +0000
Message-Id: <ff706c0eb048b648d1a48f32f1e97eb58cb742f1.1317579313.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1317579313.git.otavio@ossystems.com.br>
References: <cover.1317579313.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1317579313.git.otavio@ossystems.com.br>
References: <cover.1317579313.git.otavio@ossystems.com.br>
Subject: [PATCH 1/3] image.bbclass: improve comments regarding exported functions
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
X-List-Received-Date: Sun, 02 Oct 2011 18:21:57 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/image.bbclass |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index f17e989..0b75dce 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -254,9 +254,8 @@ multilib_sanity_check() {
   echo $@ | python ${MULTILIB_CHECK_FILE}
 }
 
-# set '*' as the rootpassword so the images
+# set '*' as the root password so the images
 # can decide if they want it or not
-
 zap_root_password () {
 	sed 's%^root:[^:]*:%root:*:%' < ${IMAGE_ROOTFS}/etc/passwd >${IMAGE_ROOTFS}/etc/passwd.new
 	mv ${IMAGE_ROOTFS}/etc/passwd.new ${IMAGE_ROOTFS}/etc/passwd
@@ -314,8 +313,6 @@ rootfs_trim_schemas () {
 	done
 }
 
-
-# export the zap_root_password, and remote_init_link
 EXPORT_FUNCTIONS zap_root_password remove_init_link do_rootfs make_zimage_symlink_relative set_image_autologin rootfs_update_timestamp rootfs_no_x_startup
 
 addtask rootfs before do_build after do_install
-- 
1.7.2.5



