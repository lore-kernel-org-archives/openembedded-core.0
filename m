Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3D2D976F9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDrKaT007784 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:53:32 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2S4ZNsHUPICb
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:53:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDrKoW007787
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:53:31 +0100
Message-ID: <1443621200.5162.93.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 14:53:20 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] lttng-tools: Drop KERNELDIR reference
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
X-List-Received-Date: Wed, 30 Sep 2015 13:53:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The source makes no reference to KERNELDIR any more and this make the recipe
machine specific. Simply drop the unused reference.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
index cf72154..ada44a6 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
@@ -38,8 +38,6 @@ inherit autotools-brokensep ptest pkgconfig useradd
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "tracing"
 
-export KERNELDIR="${STAGING_KERNEL_DIR}"
-
 FILES_${PN} += "${libdir}/lttng/libexec/* ${datadir}/xml/lttng \
                 ${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
 FILES_${PN}-staticdev += "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.a"



