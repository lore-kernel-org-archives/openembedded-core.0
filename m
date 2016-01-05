Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 717FA60667
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 13:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u05DsiWs026397 for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jan 2016 13:55:52 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Qp74wNXkbfyq
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 13:55:52 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u05DtmVV026430
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jan 2016 13:55:50 GMT
Message-ID: <1452002148.7598.34.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 05 Jan 2016 13:55:48 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] orc: Add missing PACKAGES_DYNAMIC
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
X-List-Received-Date: Tue, 05 Jan 2016 13:55:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Recipes should always indicate the packages they build, this corresponds to 
the do_split_packages() call.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/orc/orc_0.4.24.bb b/meta/recipes-devtools/orc/orc_0.4.24.bb
index 4fa311f..9e70d55 100644
--- a/meta/recipes-devtools/orc/orc_0.4.24.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.24.bb
@@ -12,6 +12,7 @@ inherit autotools pkgconfig
 BBCLASSEXTEND = "native nativesdk"
 
 PACKAGES =+ "orc-examples"
+PACKAGES_DYNAMIC += "^liborc-.*"
 FILES_orc-examples = "${libdir}/orc/*"
 FILES_${PN} = "${bindir}/*"
 



