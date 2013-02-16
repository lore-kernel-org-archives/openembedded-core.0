Received: from mail-ye0-f169.google.com ([209.85.213.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U6pMv-0002K9-Ei
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 22:32:28 +0100
Received: by mail-ye0-f169.google.com with SMTP id l13so781535yen.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2013 13:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=CcIq1WFSFkHCZl7NYl14JmWCoALACLF1pHtb9w0m9e4=;
	b=XJxjHy9/GzJ6L/mj2SBtEj8LZb1OqJy6/iAuhhk2qOx5rnzeJJAokxwgdwSXvAnflW
	W3C5sHslFr8VZOe9gnV+4QIDS9f112HSJFP+LG/BscuygMxdk94089X6HDlEH4VE2+/6
	UYrjoL7KwsrrpVbIxPf+WgoJjbGpn4j02KviPLaBYHntFF5oJI+eLPM9T5PB1GVWRmBe
	m+HAkXQnOTwBvMfnc03gfQr4HGEGZPCU0yIR9WvxnUaKX/7KAjHI/pGWyIFeARdG/9tw
	66bGEKW0Os6K11O3M9Gff1ixG/I4iJpGsR45Is4gRE5OLN0D1L1ZWM++cGAfhQBTbdMQ
	zDWQ==
X-Received: by 10.236.183.8 with SMTP id p8mr10731556yhm.32.1361049379611;
	Sat, 16 Feb 2013 13:16:19 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id x16sm100839942yhj.6.2013.02.16.13.16.17
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 16 Feb 2013 13:16:18 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 16 Feb 2013 19:20:41 -0200
Message-Id: <1361049644-27904-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/4] perl: Add auto/XS/Typemap in perl-doc package
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
X-List-Received-Date: Sat, 16 Feb 2013 21:32:31 -0000
X-List-Received-Date: Sat, 16 Feb 2013 21:32:31 -0000

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



