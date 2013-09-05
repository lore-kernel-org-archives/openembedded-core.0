Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E4FC56157A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 21:14:13 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r85LRNkW029811 for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Sep 2013 22:27:23 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mqQuloC3QpWp
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 22:27:23 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r85LRHde029808
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Sep 2013 22:27:19 +0100
Message-ID: <1378415641.32427.80.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 05 Sep 2013 22:14:01 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] local.conf.sample.extended: Add an example of how to enable fortran
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
X-List-Received-Date: Thu, 05 Sep 2013 21:14:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Add an example of how to enable FORTRAN from local.conf. Make
it clear this is not officially supported.

[YOCTO #5091]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -229,3 +229,11 @@
 #groupmod -g 1020 developers; \
 #usermod -s /bin/sh tester; \
 #"
+
+# Enabling FORTRAN
+# Note this is not officially supported and is just illustrated here to
+# show an example of how it can be done
+FORTRAN_forcevariable = ",fortran"
+RUNTIMETARGET_append_pn-gcc-runtime = " libquadmath libgfortran"
+export BUILD_FC = "${CCACHE}${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH}"
+export FC = "${CCACHE}${HOST_PREFIX}gfortran ${HOST_CC_ARCH}"



