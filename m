Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 113BF6DD9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 08:50:22 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id x12so5972289wgg.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 00:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+jUIxUubkKd4m37rMGtEIPSvf/f64ZcUuTK5JJubfLM=;
	b=Brg+1zSMSGvLDxGoT4ZbxE8YTUOAfy9YYduEk+cr6nxHBxPA+kDLi9KvGieyVphKQQ
	aJlfdqbs68XSq4BEDCZTpqlzOm750P6vdg8I5hUrcM0Cun98sEetvOFyPWkNshAIkRsN
	hoUnDXb/d7kYYmqYeDNJ1AxhMCSv3c4fOWqRFDhYmAHyeIthQksowFhXifndRRdJC8Zi
	1+4MAqGFiCgudfxuaQQozoHeI/xJirpjPT91xHtZ/6ECR3inhqovT4wkfGsjaDOrEKvq
	VlIADBorbnSAwlDF8LCVKOhLetqm5ZkL4K0BzCrRZAf9+g6XhLSRxiZV6i/oROz/wfjS
	HwwQ==
X-Gm-Message-State: ALoCoQkcET1YjSFU+I0h79qSWB5O5q0NY2MFj3Qlj7jy163muRwE9ju4fLW/pWrM7nrxC7Y80kcY
X-Received: by 10.194.21.225 with SMTP id y1mr305332wje.60.1386751821653;
	Wed, 11 Dec 2013 00:50:21 -0800 (PST)
Received: from localhost (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id hb7sm7483974wib.6.2013.12.11.00.50.19
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Dec 2013 00:50:20 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2013 09:50:07 +0100
Message-Id: <1386751809-8853-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/3] distutils bbclass: delete site.py*
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
X-List-Received-Date: Wed, 11 Dec 2013 08:50:24 -0000

Multiple recipes package this generated file and will clash during installation with:

| Collected errors:
|  * check_data_file_clashes: Package python-nose wants to install file /build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/work/beaglebone-angstrom-linux-gnueabi/cloud9-gnome-image/1.0-r0/rootfs/usr/lib/python2.7/site-packages/site.pyc
|       But that file is already provided by package  * python-setuptools
|  * check_data_file_clashes: Package python-nose wants to install file /build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/work/beaglebone-angstrom-linux-gnueabi/cloud9-gnome-image/1.0-r0/rootfs/usr/lib/python2.7/site-packages/site.py
|       But that file is already provided by package  * python-setuptools

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/distutils.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 8c3a979..80f6df8 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -64,6 +64,7 @@ distutils_do_install() {
         fi
 
         rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
+        rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.py*
         
         #
         # FIXME: Bandaid against wrong datadir computation
-- 
1.8.4.2


