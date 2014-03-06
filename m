Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1EBF46ED4C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 10:59:14 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s26AxAfn004434 for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Mar 2014 10:59:10 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qhaqwIZz0wsq
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 10:59:10 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s26Ax61U004419
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Mar 2014 10:59:07 GMT
Message-ID: <1394103538.8531.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 06 Mar 2014 10:58:58 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gstreamer: Fix valgrind determism problem in the same way as gstreamer 0.10
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
X-List-Received-Date: Thu, 06 Mar 2014 10:59:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
index 4282f07..99eee81 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
@@ -27,6 +27,8 @@ EXTRA_OECONF = "--disable-docbook --disable-gtk-doc \
             --disable-valgrind ${GSTREAMER_DEBUG} \
             "
 
+CACHED_CONFIGUREVARS += "ac_cv_header_valgrind_valgrind_h=no"
+
 # apply gstreamer hack after Makefile.in.in in source is replaced by our version from
 # ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in, but before configure is executed
 # http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/032233.html



