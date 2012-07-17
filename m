Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sr4On-0004YD-7p
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 11:48:58 +0200
Received: by wgbds1 with SMTP id ds1so2888804wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 02:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=US4DBzF/feZXAtDIFInZL/WauI1oBl52ioT6S25MQAA=;
	b=S9jIVn9Rutte729w5JhRs0HmHzhuig5YtjFx5DS7+ADG9o4PPTMSWtmAc8wFFCIGr+
	5TjNDFtJKZjEuSrCaTlBW9rWuVEaYYVIO2bXuJRF2VYUpHZ7D/ZiErRASAjBmZIrtvqK
	Sqw71j2PK8WKUcz1gxuAhLnzVtRKCRvBv9IiwhrJgXpz5+N5O/qIs1PcL9b8s27fOvn0
	0LUiiLd1hRFGslFjFz3EPLLwgqCuPd5QulNNgsMFQfAQjrfQjmXwbA1Pfm6gFViDZFQf
	hLgxvllK5jR8pjTpm3GgOkYJtAf59Rp+5qrOofgXrEofjJ7xzY69Iw8gOSv78Bv5ot12
	WHVQ==
Received: by 10.216.134.169 with SMTP id s41mr967517wei.183.1342517857909;
	Tue, 17 Jul 2012 02:37:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id df4sm26167830wib.4.2012.07.17.02.37.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 02:37:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 11:37:43 +0200
Message-Id: <1342517864-26972-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH 1/2] netbase: remove networkmanager handling for qemu machines
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2012 09:48:59 -0000

* see http://lists.linuxtogo.org/pipermail/openembedded-core/2012-February/018279.html thread

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/netbase/netbase_5.0.bb |    9 ---------
 1 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/netbase/netbase_5.0.bb b/meta/recipes-core/netbase/netbase_5.0.bb
index 3aea874..7c609af 100644
--- a/meta/recipes-core/netbase/netbase_5.0.bb
+++ b/meta/recipes-core/netbase/netbase_5.0.bb
@@ -34,15 +34,6 @@ do_install () {
 	install -m 0644 etc-services ${D}${sysconfdir}/services
 	install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/interfaces
 	install -m 0755 ${WORKDIR}/nfsroot ${D}${sysconfdir}/network/if-pre-up.d
-
-	# Disable network manager on machines that commonly do NFS booting
-	case "${MACHINE}" in
-		"qemuarm*" | "qemux86" | "qemux86-64" | "qemumips*" | "qemuppc" | "qemush*")
-			touch ${D}${sysconfdir}/network/nm-disabled-eth0
-			;;
-		*)
-			;;
-	esac
 }
 
 CONFFILES_${PN} = "${sysconfdir}/hosts ${sysconfdir}/network/interfaces"
-- 
1.7.8.6



