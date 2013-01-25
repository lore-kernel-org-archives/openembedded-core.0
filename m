Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TysbL-0006ku-RN
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Jan 2013 00:22:28 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so525187pad.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 15:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=x-received:sender:from:to:subject:date:message-id:x-mailer;
	bh=SJcgfEspbkuLfYxJ2uRx5NaFU/fQGnDKi8NNy984nxA=;
	b=ISmtw7XBOfjfJcYKAEAK4GzPL5pDVrPBlxKPRDb2UAFkCHKJf5T/ywW+bDtIgYZxYr
	Daj/TfQFNXqEbKNTHnz0cyEWnDHu3Rb5t9WjMaD7m36+YRILRHUsDTLKQg7+EZby6MK+
	TXSmhjVExBNJTJg/tC8PPK8h5U81MXor0T9qE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=SJcgfEspbkuLfYxJ2uRx5NaFU/fQGnDKi8NNy984nxA=;
	b=ncZglA4Mi0AdBoUBQTBL5xicT9RhsAZsvFtLiecHfC2MoZwdNSHmhziT7aWaAYJ+qV
	NlwQl8VtckJWOYIba4nAO2aDEbT8wIwq9S3sEuojpbXNer5/zl9fCmySHNTCx0+qmfM8
	gWYs6atvvEkxMQOwON0dIxtqUCA5dM985pvggQcSspuN2eBU7/DRYAbrgIfEybMUEUfZ
	QdSP4fQIeax0hRGeU4+JevH8pyC8+7FJSbjqmay0StsY2c99uA13FD7HnoeNTqGCUnGC
	9Y7DD1pu90UBv6wKYpyPTYn0j9xU/4QbykyTgW2vQg459OT3GCdLIUrWtG1t5MwalVh6
	lCdg==
X-Received: by 10.68.237.42 with SMTP id uz10mr18009645pbc.118.1359155211983; 
	Fri, 25 Jan 2013 15:06:51 -0800 (PST)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id x2sm1660048paw.8.2013.01.25.15.06.49
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 15:06:50 -0800 (PST)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	dvhart@linux.intel.com
Date: Fri, 25 Jan 2013 15:05:39 -0800
Message-Id: <1359155139-947-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQnBafbtAzF8uKcPSfIBR5m1vRw5d9GmaPce916Cljg3I/+NZDf9G+8Qlib2huzUJnAOWNAZ
Subject: [PATCH] poky-tiny: Update for DISTRO_FEATURES_INITMAN
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
X-List-Received-Date: Fri, 25 Jan 2013 23:22:28 -0000

This patch accounts for the addition of DISTRO_FEATURES_INITMAN which
sets the VIRTUAL_RUNTIME_init_manager, so that does not need to be set.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta-yocto/conf/distro/poky-tiny.conf |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-yocto/conf/distro/poky-tiny.conf b/meta-yocto/conf/distro/poky-tiny.conf
index 347280a..761844f 100644
--- a/meta-yocto/conf/distro/poky-tiny.conf
+++ b/meta-yocto/conf/distro/poky-tiny.conf
@@ -84,6 +84,8 @@ DISTRO_FEATURES_NET = "ipv4"
 DISTRO_FEATURES_USB = "usbhost"
 #DISTRO_FEATURES_USBGADGET = "usbgadget"
 #DISTRO_FEATURES_WIFI = "wifi"
+# This is needed for DISTRO_FEATURES_BACKFILL
+DISTRO_FEATURES_INITMAN = "tiny-init"
 
 DISTRO_FEATURES = "${DISTRO_FEATURES_TINY} \
                    ${DISTRO_FEATURES_NET} \
@@ -96,7 +98,6 @@ DISTRO_FEATURES = "${DISTRO_FEATURES_TINY} \
 # Use tmpdevfs and the busybox runtime services
 VIRTUAL-RUNTIME_dev_manager = ""
 VIRTUAL-RUNTIME_login_manager = ""
-VIRTUAL-RUNTIME_init_manager = "tiny-init"
 VIRTUAL-RUNTIME_keymaps = ""
 
 # FIXME: Consider adding "modules" to MACHINE_FEATURES and using that in
-- 
1.7.9.5



