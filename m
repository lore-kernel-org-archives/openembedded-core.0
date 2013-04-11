Received: from mail-wg0-f42.google.com ([74.125.82.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UQKdG-0000QV-MY
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 18:45:55 +0200
Received: by mail-wg0-f42.google.com with SMTP id k13so741745wgh.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 09:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=Qq17cDfO2qOgHOMRJdoMcRQtbcWpXT1eIEAz+YlI4ek=;
	b=bcXZkbIjQjVrob7ZTyUr356/bt892cCkFuMi9ORk/aOufTnk6NebCYKtskBURdhlrI
	p8XRHykP55zTQY2f4keXL2iXjr6S5S0ozhLxlBW8V/ArPK9R7hz96G3x9FqPh/6RJJ2z
	5KMnvv3xF0jhuFAVjvVOlzBBk0EyFJ7rtAioUUpQhnMcYCAEVMgaBt+kPZZRvkT7cK8k
	t9JuzUceu/oKg1KLS/2AzpQmXgIwKM6yPumEQbBRhQJwgOch9DKPihwVteIEcXhk2LRz
	aIMl+U5n0y2bU64BTKzdjGxC65/hxfbsEHjUI5a0p20yAUq39iwMb9fTeIph6x+EZ52c
	GTMw==
X-Received: by 10.194.81.71 with SMTP id y7mr11999973wjx.19.1365697711564;
	Thu, 11 Apr 2013 09:28:31 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id gl11sm4092039wic.8.2013.04.11.09.28.30
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 09:28:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2013 17:25:40 +0100
Message-Id: <1365697540-618-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1365697540-618-1-git-send-email-ross.burton@intel.com>
References: <1365697540-618-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmJxFjTxBU8t+Av8sZxDnKjcCRdeyo4iYiBB8sjO6KDLO5ugXipUcD8/x5TjM3RGlWcIqAd
Subject: [PATCH 2/2] util-linux: use $PN in SYSTEMD_PACKAGES
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
X-List-Received-Date: Thu, 11 Apr 2013 16:46:06 -0000

Instead of using util-linux-uuidd in SYSTEMD_PACKAGES use ${PN}-uuidd, as in
multilib configurations util-linux-uuidd doesn't exist.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index dd9c546..4f4b770 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -93,7 +93,7 @@ RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-l
 RRECOMMENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-native = ""
 
-SYSTEMD_PACKAGES = "util-linux-uuidd"
+SYSTEMD_PACKAGES = "${PN}-uuidd"
 SYSTEMD_SERVICE_util-linux-uuidd = "uuidd.service"
 
 do_compile () {
-- 
1.7.10.4



