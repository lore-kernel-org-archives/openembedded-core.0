Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 70745734E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 10:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2OAvbKg018886 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 10:57:37 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id srTviviC3k7j
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 10:57:37 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2OAvP5K018870
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 10:57:36 GMT
Message-ID: <1427194645.14020.28.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Mar 2015 10:57:25 +0000
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] image: Ensure manifests end with a newline
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
X-List-Received-Date: Tue, 24 Mar 2015 10:57:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Manifests should end with a newline character but don't currently. This
is the easiest fix for now, the alternative would be a rewrite of the
internal code which is something to consider in due course.

[YOCTO #7427]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 89eb5f3..cd17837 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -396,6 +396,7 @@ python write_image_manifest () {
     from oe.rootfs import image_list_installed_packages
     with open(d.getVar('IMAGE_MANIFEST', True), 'w+') as image_manifest:
         image_manifest.write(image_list_installed_packages(d, 'ver'))
+        image_manifest.write("\n")
 }
 
 # Can be use to create /etc/timestamp during image construction to give a reasonably 



