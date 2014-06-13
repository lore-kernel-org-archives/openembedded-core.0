Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB9A6FE32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 13:06:46 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5DD6gft013364 for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 14:06:42 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Exr89Bv6_iAl
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 14:06:42 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5DD6bbl013352
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 14:06:39 +0100
Message-ID: <1402664791.12440.479.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jun 2014 14:06:31 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] bitbake.conf: Add QEMU_OPTION for ppc7400 as used by qemuppc
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
X-List-Received-Date: Fri, 13 Jun 2014 13:06:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently, qemuppc prints warnings about gdk-pixbuf postinstalls
not working due to illegal instructions. This is due to qemu
running with the wrong cpu type. Add an option for ppc7400 so
that qemuppc works correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index caae02b..1d0e00c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -155,6 +155,7 @@ QEMU_OPTIONS_e5500     = "-cpu e5500"
 QEMU_OPTIONS_e5500-64b = "-cpu e5500"
 QEMU_OPTIONS_e6500     = "-cpu e6500"
 QEMU_OPTIONS_e6500-64b = "-cpu e6500"
+QEMU_OPTIONS_ppc7400 = "-cpu 7400"
 
 ##################################################################
 # Date/time variables.



