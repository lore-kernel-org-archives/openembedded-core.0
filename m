Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6F18361000
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 14:00:07 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id w7so1935082lbi.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 07:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=PSWnI08/verH3uKZ1o07w+NSeXM+MOQDSnmEsjmkFh0=;
	b=yGcYFoihR7sbzg3w2B/Z37sFs+Zc21ioxk07RJdbuZpA2jFVq5Dw5gVhWbrwGMtFFU
	j2viEl3/kZ/1u1GrGNiNouHSgfEMD9rl1dFbV7j9ZAJy/43VZm29bw4v/O2qVs60RK08
	sA+8KsPgkbexeVWlQWT+yO3TVFsZ3f0qLgoddNpZLBrJX2vsshNiyEjzmczgWF8NsomW
	6VSdtJRlGjP4DAmn7y9TFIj7B3OFKbDtjmoRrqALI+qKbghZEb6Pr7plbPb6rXgE8wI/
	OhuK3qa9edjVabjq+JtplZaqoooceg/dFgY8iel/9aPKwN5A0Rs4qrNLvKXTRFqbLVZT
	NFbQ==
X-Received: by 10.152.30.74 with SMTP id q10mr7436623lah.27.1382018408650;
	Thu, 17 Oct 2013 07:00:08 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id 8sm4375781laq.5.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 07:00:07 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 182FD400F88; Thu, 17 Oct 2013 15:59:57 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 15:59:42 +0200
Message-Id: <1382018386-25389-8-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
References: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 07/11] smartpm: Add nativesdk in BBCLASSEXTEND
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
X-List-Received-Date: Thu, 17 Oct 2013 14:00:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-devtools/python/python-smartpm_1.4.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index f349469..464c5c5 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -49,6 +49,10 @@ RPM_RDEP_class-native = ""
 QT_RDEP_class-native = ""
 GTK_RDEP_class-native = ""
 
+RPM_RDEP_class-nativesdk = ""
+QT_RDEP_class-nativesdk = ""
+GTK_RDEP_class-nativesdk = ""
+
 PACKAGECONFIG[rpm] = ",,rpm,${RPM_RDEP}"
 PACKAGECONFIG[qt4] = ",,qt4-x11,${QT_RDEP}"
 PACKAGECONFIG[gtk] = ",,gtk+,${GTK_RDEP}"
@@ -138,5 +142,5 @@ FILES_${PN}-interface-qt4 = "${libdir}/python*/site-packages/smart/interfaces/qt
 FILES_${PN}-interface-gtk = "${libdir}/python*/site-packages/smart/interfaces/gtk"
 FILES_${PN}-interface-images = "${datadir}/${baselib}/python*/site-packages/smart/interfaces/images"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
-- 
1.8.3.2


