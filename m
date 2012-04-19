Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SKzaL-0004Wz-7b for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 00:12:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3JM2mMr019072
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2012 23:02:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18528-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2012 23:02:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3JM2cnj019066
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2012 23:02:39 +0100
Message-ID: <1334872962.3028.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Apr 2012 23:02:42 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] bootimg.bbclass: Tweak iso images to become hybrid images
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
X-List-Received-Date: Thu, 19 Apr 2012 22:12:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From: Damien Lespiau <damien.lespiau@intel.com>

This allows iso images to be written to usb keys and booted on systems which
have a BIOS which support this. There is no real down side to tweaking the iso
images in this way.

[YOCTO #1763 partial]

Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index f4981d8..370b378 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -103,6 +103,8 @@ build_iso() {
 			-r ${ISODIR}
 	fi
 
+	isohybrid ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso
+
 	cd ${DEPLOY_DIR_IMAGE}
 	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.iso
 	ln -s ${IMAGE_NAME}.iso ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.iso




