Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U78bQ-00076i-PK
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 19:04:43 +0100
Received: by mail-gh0-f175.google.com with SMTP id g18so440202ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=CcIq1WFSFkHCZl7NYl14JmWCoALACLF1pHtb9w0m9e4=;
	b=NI2BkdEmTycC7lyEifPfrySrL9ufjQKuXRp1C46iVULwPkeiudecLBgPSTD1tSDrrW
	jUybvuarN4hFEeIvtX5Pn03mMMTyfuVr5vkBS6ibq7YrkOuTdIjDsKeq+DlmcsjdqTHb
	IhBNDOGxfV2fmjrkIGxpvlv9EWlP2SWDyfEoVjFEYzOSPHHyTXusr6bnN8vaQbVPUVB1
	F4vbveAdZnFxXvGqcG6wYbzXqSCNid0CdTupBHsjY6HkfSv8qjKW37KCzx76dbxqrhSE
	QKVfRsiO83TG+9tiiM3+AvWItKTmL0bJbDu3M0VkZbx+hKZQgbQrgLAf70Fh4x1BqoCb
	QAPg==
X-Received: by 10.236.121.133 with SMTP id r5mr15309717yhh.86.1361123313556;
	Sun, 17 Feb 2013 09:48:33 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id j1sm108579298yhn.3.2013.02.17.09.48.31
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 09:48:32 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Feb 2013 14:53:08 -0300
Message-Id: <1361123592-32572-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/5] perl: Add auto/XS/Typemap in perl-doc package
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
X-List-Received-Date: Sun, 17 Feb 2013 18:04:44 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/perl/perl_5.14.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/perl_5.14.3.bb b/meta/recipes-devtools/perl/perl_5.14.3.bb
index 2e33e66..6a3a170 100644
--- a/meta/recipes-devtools/perl/perl_5.14.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.3.bb
@@ -269,6 +269,7 @@ FILES_${PN}-dbg += "${libdir}/perl/${PV}/auto/*/.debug \
                     ${libdir}/perl/${PV}/*/*/*/.debug "
 FILES_${PN}-doc = "${libdir}/perl/${PV}/*/*.txt \
                    ${libdir}/perl/${PV}/*/*/*.txt \
+                   ${libdir}/perl/${PV}/auto/XS/Typemap \
                    ${libdir}/perl/${PV}/B/assemble \
                    ${libdir}/perl/${PV}/B/cc_harness \
                    ${libdir}/perl/${PV}/B/disassemble \
-- 
1.8.1



