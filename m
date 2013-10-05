Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id A70BA6CC42
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2013 12:23:08 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so2273381eek.39
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Oct 2013 05:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=YlhrubB6+IP2xnRXxfbZs6Ie71h8e007vZRS0cQGqTk=;
	b=xk3QX7fVFgQFDCPIrZLIuT92XxXtGNGVsvNMP1QzPzjETU9UOHcnl8/m9vkSSI2wTq
	xyAZdWAMB4T6ZKzP7VEvB1INGsPPm+acp/cODC9kzsqR84JCuo9esTBFq85tTYEioAX3
	nr2GaSQKMDltLHfzqhtxrs26GHNYjVCOQ63m4PSlQFihd4MxAhpeoPv1A3uEP3Eh5Aaz
	8HnP22Bs/oJrzBVUImxN+k81whBoLJHRUwybHwCVXKyJaJ5OMIW8/KiJekZSnxItwn+q
	ovDmw8RBcMcL4uRIe9hzeJyxUjwZn7VN3T8aX4n+EmGuymrENyw+Vd2D7ilT1UcW2+d6
	dTnw==
X-Received: by 10.14.181.194 with SMTP id l42mr142747eem.63.1380975790239;
	Sat, 05 Oct 2013 05:23:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a43sm39205435eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 05 Oct 2013 05:23:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Oct 2013 14:23:01 +0200
Message-Id: <3b1cca5d0415c32e50b050cb339bd2995daf239f.1380975568.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 04/14] xf86-input-synaptics: Add dependency on libxtst
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
X-List-Received-Date: Sat, 05 Oct 2013 12:23:09 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.1.bb | 2 +-
 meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.1.bb
index 9125613..f678e8b 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.1.bb
@@ -15,6 +15,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55aacd3535a741824955c5eb8f061398"
 SRC_URI[md5sum] = "6505de717972b6a24b8eb13e69eb996c"
 SRC_URI[sha256sum] = "db5825660e1fb23190697f609bf75d4450fe707344a14298e1c9b47039bbb58e"
 
-DEPENDS += "libxi mtdev"
+DEPENDS += "libxi mtdev libxtst"
 
 FILES_${PN} += "${datadir}/X11/xorg.conf.d"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
index 6dc5f8a..140f633 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
@@ -15,4 +15,4 @@ PR = "${INC_PR}.1"
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-input-synaptics"
 S = "${WORKDIR}/git"
 
-DEPENDS += "libxi mtdev"
+DEPENDS += "libxi mtdev libxtst"
-- 
1.8.3.2


