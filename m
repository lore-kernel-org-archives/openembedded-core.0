Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1US4fZ-0004qn-58
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 14:07:47 +0200
Received: by mail-ea0-f181.google.com with SMTP id z10so183712ead.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 04:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=YLP2UAbLUIfirLpSgh6N+Fqk9BY0k1mCaTaYRDHbgyU=;
	b=nwtm2rj4nismaTjq0bA6KbCVvyu8+049KsCeutAESzctL+NB4ELWz8qkJBSOg2AyZJ
	DVl7y7+vuQhgIM+xfaHpgDPWhQVMGdaerMUjaJYoam51ht8T02r3QG7/PbM03chHeg6Q
	8RZAoCHTsoXbFHdBRGwcc6iiue6e1lD6REd0OaEQS8sq7AEzVu4jw5TpLEXE8Ox+Hmq0
	/vvRDdn4HJvwdYlEBwGsJpa4J4AFu40fsP+ZzK1/NaTrahJU63005h23JTyuJVUEm035
	WFyzmWZqwJ19yOhpmdADfmGY84y0Ut8KIENTVXx6LC+6oC1yJhcwHV8XOUYper2p0Mss
	qaQQ==
X-Received: by 10.15.98.141 with SMTP id bj13mr5577990eeb.29.1366112982145;
	Tue, 16 Apr 2013 04:49:42 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id j44sm2411576eeu.10.2013.04.16.04.49.39
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 04:49:40 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2013 13:49:31 +0200
Message-Id: <1366112971-3644-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQkRm0RKDK4V5AZ/nj+Hm+xZ5vSX2nevlQJAo/FvsRNxM/kqAOTl++VJgKPctBOxKCOGz7n5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] seperatebuilddir.inc: disable seperate build dir for consolekit
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
X-List-Received-Date: Tue, 16 Apr 2013 12:07:50 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/conf/distro/include/seperatebuilddir.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
index a9ca240..f60dc5c 100644
--- a/meta/conf/distro/include/seperatebuilddir.inc
+++ b/meta/conf/distro/include/seperatebuilddir.inc
@@ -78,7 +78,9 @@ B_pn-compositeproto = "${SEPB}"
 B_pn-compositeproto-native = "${SEPB}"
 #B_pn-connman = "${SEPB}"
 #B_pn-connman-gnome = "${SEPB}"
-B_pn-consolekit = "${SEPB}"
+#B_pn-consolekit = "${SEPB}"
+#| /build/setup-scripts/build/tmp-angstrom_next-eglibc/work/cortexa8hf-vfp-neon-angstrom-linux-gnueabi/consolekit/0.4.5-r10/ConsoleKit-0.4.5/pam-ck-connector/pam-ck-connector.c:64:26: fatal error: ck-connector.h: No such file or directory
+#| compilation terminated.
 B_pn-console-tools = "${SEPB}"
 B_pn-coreutils = "${SEPB}"
 B_pn-coreutils-native = "${SEPB}"
-- 
1.8.1.4



