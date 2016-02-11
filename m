Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CE24B73178
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 12:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1BCC6wc025394; Thu, 11 Feb 2016 12:12:06 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kUihprpJmvb0; Thu, 11 Feb 2016 12:12:05 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1BCC2vT025389
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 11 Feb 2016 12:12:03 GMT
Message-ID: <1455192722.16142.256.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Thu, 11 Feb 2016 12:12:02 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] ptest-runner2: Explicitly set EXTRA_OEMAKE as required
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
X-List-Received-Date: Thu, 11 Feb 2016 12:12:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This recipe currently relies on EXTRA_OEMAKE having been set to
"-e MAKEFLAGS=" in bitbake.conf to operate. It is necessary to make this
explicit so that the default in bitbake.conf can be change

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-support/ptest-runner2/ptest-runner2_0.1.bb b/meta/recipes-support/ptest-runner2/ptest-runner2_0.1.bb
index 97c640c..8f9a170 100644
--- a/meta/recipes-support/ptest-runner2/ptest-runner2_0.1.bb
+++ b/meta/recipes-support/ptest-runner2/ptest-runner2_0.1.bb
@@ -15,6 +15,8 @@ FILES_${PN} = "${bindir}/ptest-runner"
 
 RCONFLICTS_${PN} = "ptest-runner"
 
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
 do_compile () {
 	oe_runmake
 }



