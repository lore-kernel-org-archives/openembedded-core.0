Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UHNsW-0003E1-Mg for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 01:24:45 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I0GsGI018699 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 00:16:54 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7aIvupZobLZV
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 00:16:54 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2I0GmiG018695
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 00:16:51 GMT
Message-ID: <1363565258.4315.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Mar 2013 00:07:38 +0000
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] image.bbclass: Drop legacy export of IMAGE_BASENAME
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
X-List-Received-Date: Mon, 18 Mar 2013 00:24:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We used to export this in the days an external script handled the image
generation. This is no longer the case and hence we no longer need this
export.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 9345bf8..b718805 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -63,10 +63,8 @@ IMAGE_INSTALL_COMPLEMENTARY = '${@complementary_globs("IMAGE_FEATURES", d)}'
 SDKIMAGE_FEATURES ??= "dev-pkgs dbg-pkgs"
 SDKIMAGE_INSTALL_COMPLEMENTARY = '${@complementary_globs("SDKIMAGE_FEATURES", d)}'
 
-# "export IMAGE_BASENAME" not supported at this time
 IMAGE_INSTALL ?= ""
 IMAGE_INSTALL[type] = "list"
-IMAGE_BASENAME[export] = "1"
 export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL} ${FEATURE_INSTALL}"
 PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
 




