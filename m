Received: from mail-wg0-f48.google.com ([74.125.82.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2R6j-0004m9-ES
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 19:49:34 +0100
Received: by mail-wg0-f48.google.com with SMTP id 16so4972220wgi.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 10:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=5eC+mAEGn0RVuyz7BCOUZkhZK7UAnnBtAIbhxc6jnas=;
	b=KeEsy6ebxsYaLOYzsIT6Uzse4V51RLIDCM2dLMaGSu8AY5pHl2RttY77If1IJu7aZo
	+X4n0sIwEc13yWL3nW0giKZjzWK2uS9/qewij5tvtK6BwM7DK6obAGydZU/iTlFSaXoS
	t8WQSj4OMXflixCxAI64lR6t5UyGVddEcL75N+y2SgtF0g9EjCCYVdkOqZbiH73ZMtyH
	54ejFf8rSS2tRA7Zg8D1cNOxvQN6ur3fG66DwLM2lzDXpvkXPZXqDv2UIxFyd7+PpSiB
	3prMREj5Ety/SA5s8lYZmQOmJhNtsD1J1qPepAe54gDRgs4seZ7/Tdj2TCpX9VDGqEco
	A/mQ==
X-Received: by 10.180.8.197 with SMTP id t5mr11706314wia.27.1360002824689;
	Mon, 04 Feb 2013 10:33:44 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id m6sm23263723wic.2.2013.02.04.10.33.43
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 10:33:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 19:33:40 +0100
Message-Id: <1360002821-23224-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 1/2] openssh: fix RPROVIDES
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
X-List-Received-Date: Mon, 04 Feb 2013 18:49:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_6.1p1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.1p1.bb b/meta/recipes-connectivity/openssh/openssh_6.1p1.bb
index 71d71e4..32c3b2c 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.1p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.1p1.bb
@@ -12,7 +12,8 @@ PR = "r0"
 DEPENDS = "zlib openssl"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-RPROVIDES = "ssh sshd"
+RPROVIDES_${PN}-ssh = "ssh"
+RPROVIDES_${PN}-sshd = "sshd"
 
 RCONFLICTS_${PN} = "dropbear"
 RCONFLICTS_${PN}-sshd = "dropbear"
-- 
1.8.1.2



