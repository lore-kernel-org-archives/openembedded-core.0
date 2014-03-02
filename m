Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF606F472
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Mar 2014 17:38:51 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s22Hckgu023863 for <openembedded-core@lists.openembedded.org>;
	Sun, 2 Mar 2014 17:38:46 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Kal9p2qGNeJb
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Mar 2014 17:38:46 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s22HcewF023859
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 2 Mar 2014 17:38:42 GMT
Message-ID: <1393781913.22581.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 02 Mar 2014 17:38:33 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: bitbake.conf: Drop -fpermissive
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
X-List-Received-Date: Sun, 02 Mar 2014 17:38:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Drop the -fpermissive C++ compiler flag. We've had this around for years, most
code should have been fixed long ago. Its possible some recipes may fail
however we can (and should) just use the flag where needed.

An OE-Core world build seems to work just fine with this change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f81dea6..4879aa2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -498,9 +498,9 @@ BUILDSDK_CFLAGS = "${BUILDSDK_CPPFLAGS} ${BUILD_OPTIMIZATION}"
 export CFLAGS = "${TARGET_CFLAGS}"
 export TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}"
 
-export BUILD_CXXFLAGS = "${BUILD_CFLAGS} -fpermissive"
+export BUILD_CXXFLAGS = "${BUILD_CFLAGS}"
 export CXXFLAGS = "${TARGET_CXXFLAGS}"
-export TARGET_CXXFLAGS = "${TARGET_CFLAGS} -fpermissive"
+export TARGET_CXXFLAGS = "${TARGET_CFLAGS}"
 
 export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                         -L${STAGING_BASE_LIBDIR_NATIVE} \



