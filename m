Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6Fgw-0006Kp-L9
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 08:54:26 +0200
Received: by mail-ey0-f175.google.com with SMTP id d12so1156736eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2012 23:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=FGCnX9dItfAUaR6Jguu3MspnwhJS1h0pKk57xEMbZsw=;
	b=MQKuFnKL3QOspvpaNfLeycJynTkOPGOuuiHV1jov6qEFlI3s6jGCdBcuoeuT+9XlcH
	XlV2FIBRAVgIriTMviMx5XH8KAIZ3PiYet7oXHGGy6Bq0CzL6nHVBRcDtZMc7LAOoTwp
	aJzaflkWwntlJ4uuB0IUZFzIF/d+4W23utu3+MJc9JdXnJLPPDaQqKORmMIpYkgjrbpI
	0Xs0DVyNMXTT0Y5xUlp/Y4UGuGqNNeo9GAbk8bXh4gSAfvDKHQZzVGXzwE/i97WwMrbK
	8b54Hfmblr8d9URBXeKKR7zosdwxm1eisbnlJE4OBSpzXlQTnHSbWNAHBAuOJoddDN/S
	BYuw==
Received: by 10.14.225.200 with SMTP id z48mr20495127eep.39.1346136136586;
	Mon, 27 Aug 2012 23:42:16 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id c6sm58243256eep.7.2012.08.27.23.42.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 23:42:15 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2012 08:41:41 +0200
Message-Id: <1346136108-13062-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
References: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQk0Oov5ZMzGSddeApNzlqekqA/4058d6pcwP1K6ITBsCh8CE2BW+2wF6Sgj8Mxf8Z9hy4SZ
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][meta-oe][PATCH 04/11] opkg-utils: UPdate to version with python 2.6 fix
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
X-List-Received-Date: Tue, 28 Aug 2012 06:54:27 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index b193ba4..92e6624 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
-SRCREV = "423ecd36b4782327c16f516885d1248249c7724a"
+SRCREV = "49cc783d8e0415059d126ae22c892988717ffda7"
 PV = "0.1.8+git${SRCPV}"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
            "
-- 
1.7.7.6



