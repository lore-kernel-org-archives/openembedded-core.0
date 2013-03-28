Received: from mail-qc0-f172.google.com ([209.85.216.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1ULGKO-0000yh-Id
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 18:09:28 +0100
Received: by mail-qc0-f172.google.com with SMTP id b25so4343955qca.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 09:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=oOG6Gl5Hg/+TfmuSP3r5OPjn1PyExkf2iI44p28iSGk=;
	b=pzgnOAg0F2+ZI2CKuV6HeyOaZXpk3E8WvRbg2cwprWoa//Qg7WTSNSdR8BJEYJpGeL
	34RAWngDt6EMnD/5V/kF0zlL61YAgK/o8Qv2ePqpdUkjyjRUh07jW0Ex9GHBsD+uaCXg
	1FB5O5brmfJkIvYr/+D7+GPhBMvMdWWapuVaSU5SB2+MB09c7dxDZWSUWDTFS/UncPpG
	iZs3b2et78Wmpa/3QCXDfbteVYPMSlcwULkQy7othqXkLu5D2cWrJMr24eiqB9QujV7H
	3f721kiqA+hLb1AJGcy1DBx76QvKWshkhffcm02bbK/x06vtsB2lh7U97KE3MfZyQ8hx
	LHog==
X-Received: by 10.229.105.158 with SMTP id t30mr1700005qco.73.1364489545200;
	Thu, 28 Mar 2013 09:52:25 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id eb7sm27757987qab.11.2013.03.28.09.52.22
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 09:52:24 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Mar 2013 13:58:12 -0300
Message-Id: <1364489896-25975-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/5] linux-firmware: Remove 'Makefile' from packages
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
X-List-Received-Date: Thu, 28 Mar 2013 17:09:31 -0000
X-List-Received-Date: Thu, 28 Mar 2013 17:09:31 -0000

The 'Makefile' should not be deployed in the packages as it is of no
use for target and end user.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index b9e00fc..2b05172 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -38,6 +38,9 @@ do_install() {
 	install -d  ${D}/lib/firmware/
 	cp -r * ${D}/lib/firmware/
 
+	# Avoid Makefile to be deplyed
+	rm ${D}/lib/firmware/Makefile
+
 	# Libertas sd8686
 	ln -sf libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
 	ln -sf libertas/sd8686_v9_helper.bin ${D}/lib/firmware/sd8686_helper.bin
-- 
1.8.1



