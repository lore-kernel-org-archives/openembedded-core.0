Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E953571C7A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 16:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JGDC2I002522; Thu, 19 Jan 2017 16:13:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gGoZpOFYegiG; Thu, 19 Jan 2017 16:13:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JGD68C002500
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Jan 2017 16:13:07 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUFKk-0000kh-62; Thu, 19 Jan 2017 16:13:06 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 16:12:53 +0000
Message-Id: <1484842382-2821-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484842382-2821-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484842382-2821-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 02/11] intltool: Allow nativesdk variant to build
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
X-List-Received-Date: Thu, 19 Jan 2017 16:13:15 -0000

This tool has been missing from the SDKs, the recipe specific sysroot
work highlighted the issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/intltool/intltool_0.51.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/intltool/intltool_0.51.0.bb b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
index a7ea3b7..551bdf0 100644
--- a/meta/recipes-devtools/intltool/intltool_0.51.0.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
@@ -22,6 +22,7 @@ inherit autotools pkgconfig perlnative
 
 export PERL = "${bindir}/env perl"
 PERL_class-native = "/usr/bin/env nativeperl"
+PERL_class-nativesdk = "/usr/bin/env perl"
 
 # gettext is assumed to exist on the host
 RDEPENDS_${PN}_class-native = "libxml-parser-perl-native"
@@ -33,4 +34,4 @@ FILES_${PN} += "${datadir}/aclocal"
 
 INSANE_SKIP_${PN} += "dev-deps"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


