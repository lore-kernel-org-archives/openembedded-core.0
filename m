Received: from mail-da0-f53.google.com ([209.85.210.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TypQ9-00083j-Fc
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 20:58:41 +0100
Received: by mail-da0-f53.google.com with SMTP id x6so316119dac.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 11:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=5X9O9tqqK+QUAHfgplHp8kEzn27kaWD4ciBVdp5j0gQ=;
	b=uuFZd0m9iN0bYk+fAmJkNjDdCECZCehHeC4oR+XXwTizEhblRfI9DTSFJ+34LcjfSN
	dWW3VARP57qfyFzKSd0liyQr7+iMarj8/hWLT+CxG16rVjltU45l21r+uyYoBoUOCRcT
	ef5XLRPnmH+UAcGFJOG+vmp2OUXVaBFVyNtr196Bq/ZJnN1RSiB7GSseCCM9sq+GHtlY
	hYcVR8V356yEMP9sv3T4k2nzvnXkfDxEOCClwblJIVpzO41GLRn6kRxXPql9v5XwdMAd
	TCFLiw49Nmp5Ka4kvDATKfx20QAWmk0fqnmEAv7JwJ3LS9mPDmqoP/2Gbcf0uzyX4hXa
	PyGg==
X-Received: by 10.68.211.42 with SMTP id mz10mr16965349pbc.100.1359142986081; 
	Fri, 25 Jan 2013 11:43:06 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id wh8sm1165117pbc.75.2013.01.25.11.43.03
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 11:43:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 20:42:48 +0100
Message-Id: <fc8d128abb05a6b40066fa1438843100888e2be8.1359142768.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
In-Reply-To: <cover.1359142768.git.Martin.Jansa@gmail.com>
References: <cover.1359142768.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1359142768.git.Martin.Jansa@gmail.com>
References: <cover.1359142768.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/7] console-tools, kbd: add RREPLACES/RPROVIDES/RCONFLICTS combo between PN-dbg
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
X-List-Received-Date: Fri, 25 Jan 2013 19:58:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/console-tools/console-tools_0.3.2.bb | 7 +++++++
 meta/recipes-core/kbd/kbd_1.15.2.bb                    | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index a46e44d..40de13a 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -15,6 +15,13 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
            file://lcmessage.m4 \
            file://Makevars"
 
+RREPLACES_${PN}-dbg = "kbd-dbg"
+RPROVIDES_${PN}-dbg = "kbd-dbg"
+RCONFLICTS_${PN}-dbg = "kbd-dbg"
+RREPLACES_${PN} = "kbd"
+RPROVIDES_${PN} = "kbd"
+RCONFLICTS_${PN} = "kbd"
+
 SRC_URI[md5sum] = "bf21564fc38b3af853ef724babddbacd"
 SRC_URI[sha256sum] = "eea6b441672dacd251079fc85ed322e196282e0e66c16303ec64c3a2b1c126c2"
 
diff --git a/meta/recipes-core/kbd/kbd_1.15.2.bb b/meta/recipes-core/kbd/kbd_1.15.2.bb
index 79ea468..f650b80 100644
--- a/meta/recipes-core/kbd/kbd_1.15.2.bb
+++ b/meta/recipes-core/kbd/kbd_1.15.2.bb
@@ -6,6 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=587ce626d15bd61699a64a6b8a5afefb"
 inherit autotools gettext
 
 BBCLASSEXTEND = "native"
+RREPLACES_${PN}-dbg = "console-tools-dbg"
+RPROVIDES_${PN}-dbg = "console-tools-dbg"
+RCONFLICTS_${PN}-dbg = "console-tools-dbg"
 RREPLACES_${PN} = "console-tools"
 RPROVIDES_${PN} = "console-tools"
 RCONFLICTS_${PN} = "console-tools"
-- 
1.8.1.1



