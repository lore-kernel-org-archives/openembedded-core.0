Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 88F0A65D5E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 20:22:08 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id 10so6403774ykt.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 13:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=58G/UD2Icwp8GnWoUjTpIyD/GhLkmTQltOGAujjRE3c=;
	b=gv0GMXXn4VNsMy1D71JUtBYq3au5k4Y3u309+xCyqzmu4nUS9a5VrLANIc88ZKjM0b
	Pt9WDTJjw+FUnwdxr4Jfp5XaM/yL6zziWutcvwmZwPCHOA3BCVnNY3KNI5i0449zW3Hb
	e3ZsfClreejsWor1UKg9S9I1ntYHEfG9S/QGcMnl7m/J9cYATPlYt0hi8lyzQiERYOTw
	aQVw1J/mkWOzq7nd/SfQUHNfPCU8pPSvZZ/XMrTXKk3wfVoQMdVOBHhlWee8PnvlDAUb
	C6ZQzM1h9mBgNE0/0nxKZXreqvmgvSXEQWCbFr/LtrFD5mnN3rl+V21bqkvf0upblHQR
	B82Q==
X-Received: by 10.236.90.208 with SMTP id e56mr5641736yhf.176.1407788529622;
	Mon, 11 Aug 2014 13:22:09 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id
	k29sm25642983yha.33.2014.08.11.13.22.07 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Aug 2014 13:22:08 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 17:21:42 -0300
Message-Id: <1407788504-27417-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/3] cracklib: Allow use in SDK
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
X-List-Received-Date: Mon, 11 Aug 2014 20:22:12 -0000

This adds 'nativesdk' in the BBCLASSEXTEND.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-extended/cracklib/cracklib_2.9.1.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.1.bb b/meta/recipes-extended/cracklib/cracklib_2.9.1.bb
index d70e76f..99ccde3 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.1.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.1.bb
@@ -18,8 +18,8 @@ SRC_URI[sha256sum] = "408905c2539a97dc8cbbb6d7cd2046cb5647a345b4bda399220d9471be
 
 inherit autotools-brokensep gettext
 
-BBCLASSEXTEND = "native"
-
 do_install_append_class-target() {
 	create-cracklib-dict -o ${D}${datadir}/cracklib/pw_dict ${D}${datadir}/cracklib/cracklib-small
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.10.4


