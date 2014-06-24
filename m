Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5D6F260424
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 22:53:14 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5OMrA6E000770 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 23:53:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id a1Jl1v2MHKZc
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 23:53:10 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5OMr5wA000764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 23:53:06 +0100
Message-ID: <1403650378.2104.177.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jun 2014 23:52:58 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gst-openmax: Add missing pkgconfig inherit
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
X-List-Received-Date: Tue, 24 Jun 2014 22:53:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb b/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
index 4e22f46..2e01579 100644
--- a/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gst-openmax/gst-openmax-${PV}.ta
            file://ptr-array.patch \
            "
 
-inherit autotools
+inherit autotools pkgconfig
 
 # Tell configure that this isn't a development snapshot so we don't want
 # -Werror (hopefully fixed in 0.10.2)



