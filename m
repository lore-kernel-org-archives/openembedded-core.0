Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 872F860144
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 23:43:14 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so4255973eek.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 15:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=E3WyGXQ7LYLT8NPt6Uq/uw+37uUSEABmToJNTerK6L8=;
	b=dUeMtRSbhY3Rw6bt1SD9vbkDTMPuXrpKbn0qwWD0oM0nTxC0inOhyPlwkyn8CTpfjA
	9574w0PlGZU/dYvpy6QCy/R1h32yeMoiN15zAGiwgsbJeJtuEHXeLUq6A4FMMg1yGb5x
	gmAuynjgWJ+8w8OPkXkVrBjnYEWflgJBaxuX45YFyejzdXMPXd73M+q7SeSBl2UmoLwi
	/+UF3YzGosjC/ZNSi6QNV4tYm7Qsb5nsP2jTYPeHxZ48toZroCZccL8Zil1INsSOX7nM
	RHxKlIL0asmNDtOxnQR3buwcAOYCdDfVqFU/kJs2nF9FyLAOa5UTs8oSG/Hzb5tCgFOX
	2wRw==
X-Received: by 10.15.35.194 with SMTP id g42mr26246916eev.20.1390347794942;
	Tue, 21 Jan 2014 15:43:14 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id n7sm20233748eef.5.2014.01.21.15.43.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 15:43:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2014 00:43:11 +0100
Message-Id: <1390347792-24649-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH 1/2] opkg-utils: Add RPROVIDES/RREPLACES/RCONFLICTS to fix upgrade-path
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
X-List-Received-Date: Tue, 21 Jan 2014 23:43:15 -0000

* now with update-alternatives-cworth completely gone should correctly
  replace it on target as well

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 80efa8f..c2509c4 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -28,6 +28,8 @@ do_install() {
 
 PACKAGES =+ "update-alternatives-opkg"
 FILES_update-alternatives-opkg = "${bindir}/update-alternatives"
-RPROVIDES_update-alternatives-opkg = "update-alternatives"
+RPROVIDES_update-alternatives-opkg = "update-alternatives update-alternatives-cworth"
+RREPLACES_update-alternatives-opkg = "update-alternatives-cworth"
+RCONFLICTS_update-alternatives-opkg = "update-alternatives-cworth"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.8.5.3


