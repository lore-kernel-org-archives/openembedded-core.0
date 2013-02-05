Received: from mail-bk0-f48.google.com ([209.85.214.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U2l7f-0003zs-JZ
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 17:11:53 +0100
Received: by mail-bk0-f48.google.com with SMTP id jf20so155923bkc.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 07:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=YPNzyvlmXsujlJJPI+F4bJXuR0vYza50BTu6l1b3Qzc=;
	b=xH8Q1ndw6CF27bSamZ/C/pdoO/pj9c9TK+hRMZ1xSWyN89gHG3QyN/hDr2vt/tEYez
	qL1q7xCoZWTbTXGnvSIPJaGSWp0vOLJ5d9Bc/oR4n8ELd4oB/LhBEVExZIpX9fWDzD6H
	Bj1O0ZrwiqO7zciYOhTia01LksgUDUeS5zq+z/dYcqyRZgGyFlQo3BzJ3z78/7SuDCSf
	XBCG5b8sGmmE6Bj/GgZp47dOZ/VOb38eysdy4Jq/LwAh6DVqcN2qT6ZFXRhLA4wGOeDF
	uY3b4qcSEC/U4JpTEoLVRpGK2xVhZ6fSi6wSGdwPkXMH3dLXw/SLje6mCY1r6HS94NxF
	FNag==
X-Received: by 10.204.149.11 with SMTP id r11mr6591186bkv.93.1360079762076;
	Tue, 05 Feb 2013 07:56:02 -0800 (PST)
Received: from s42.loc (91-119-139-175.dynamic.xdsl-line.inode.at.
	[91.119.139.175])
	by mx.google.com with ESMTPS id k4sm6742737bkv.18.2013.02.05.07.55.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 07:55:59 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.80)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1U2ksG-0004XK-JR; Tue, 05 Feb 2013 16:55:56 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 16:55:42 +0100
Message-Id: <a5703c77727c296dcd331787653f4cdc61fb6079.1360079373.git.rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360079373.git.rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
In-Reply-To: <cover.1360079373.git.rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
Subject: [PATCH 2/8] uclibc: add c6x arch
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
X-List-Received-Date: Tue, 05 Feb 2013 16:12:00 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-config.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/uclibc/uclibc-config.inc b/meta/recipes-core/uclibc/uclibc-config.inc
index fd36fa5..0c7a0ce 100644
--- a/meta/recipes-core/uclibc/uclibc-config.inc
+++ b/meta/recipes-core/uclibc/uclibc-config.inc
@@ -9,6 +9,7 @@ alpha \
 arm \
 avr32 \
 bfin \
+c6x \
 cris \
 e1 \
 frv \
-- 
1.7.10.4



