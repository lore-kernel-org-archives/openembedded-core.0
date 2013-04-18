Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1USqBI-0005Fx-8x
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 16:51:31 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3IEYJA0009827; Thu, 18 Apr 2013 15:34:19 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id arneaxb3Fxse; Thu, 18 Apr 2013 15:34:19 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3IEYE1H009802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 18 Apr 2013 15:34:15 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1USpu2-0001Dl-Kt; Thu, 18 Apr 2013 15:33:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2013 15:33:29 +0100
Message-Id: <1366295611-4646-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1366295611-4646-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1366295611-4646-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/6] package_ipk: Ensure the status file exists
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
X-List-Received-Date: Thu, 18 Apr 2013 14:52:09 -0000

The postinstall for the opkg run-postinst hook checks for the existence of this
file. We therefore ensure it always exists during image generation.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_ipk.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index d003ae7..5873f71 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -85,6 +85,7 @@ package_install_internal_ipk() {
 	local package_multilib="${INSTALL_PACKAGES_MULTILIB_IPK}"
 
 	mkdir -p ${target_rootfs}${OPKGLIBDIR}/opkg
+	touch ${target_rootfs}${OPKGLIBDIR}/opkg/status
 
 	local ipkg_args="${OPKG_ARGS}"
 
-- 
1.7.10.4



