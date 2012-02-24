Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0ykZ-0006VG-68
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 18:16:07 +0100
Received: by eekd41 with SMTP id d41so1222521eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 09:07:44 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.104.140 as permitted sender) client-ip=10.213.104.140; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.104.140 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.104.140])
	by 10.213.104.140 with SMTP id p12mr994996ebo.111.1330103264723
	(num_hops = 1); Fri, 24 Feb 2012 09:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=jxvCd9B8aTXs6n+OdI5MfZjoab0KrqSh7Q304v4Xsdc=;
	b=jH/F5Yism4dHV0aYA+pI673M+jbDf8CwKQcv0kpnw5izPwEMj35vM9GQGVG/mIMesu
	DrLJg4+2dgO9i3UikHg6m11FYuvT0CtTYAMEcPMtC6Kg7apgjV0jLpxwMeBPcPf8tLp4
	gc/IuGLGBdhtJmlJ5FX13L6UTphVqFDJGDTGA=
Received: by 10.213.104.140 with SMTP id p12mr745125ebo.111.1330103264647;
	Fri, 24 Feb 2012 09:07:44 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s48sm20170905eem.0.2012.02.24.09.07.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 09:07:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2012 18:06:52 +0100
Message-Id: <87908d3a0218ce7b1f9059704104695d825ff593.1330102968.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <141f227e9201766a9657a41a92a5d5485adcd513.1330102968.git.Martin.Jansa@gmail.com>
References: <141f227e9201766a9657a41a92a5d5485adcd513.1330102968.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330102968.git.Martin.Jansa@gmail.com>
References: <cover.1330102968.git.Martin.Jansa@gmail.com>
Subject: [PATCH 7/7] gst-plugin-bluetooth: upgrade to 4.98 and add checksums
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2012 17:16:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...etooth_4.96.bb => gst-plugin-bluetooth_4.98.bb} |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)
 rename meta/recipes-connectivity/bluez/{gst-plugin-bluetooth_4.96.bb => gst-plugin-bluetooth_4.98.bb} (77%)

diff --git a/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.96.bb b/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.98.bb
similarity index 77%
rename from meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.96.bb
rename to meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.98.bb
index d60827a..fa74d34 100644
--- a/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.96.bb
+++ b/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.98.bb
@@ -1,7 +1,8 @@
 require bluez4.inc
 require recipes-multimedia/gstreamer/gst-plugins-package.inc
 
-PR = "r1"
+SRC_URI[md5sum] = "362864b716950baa04797de735fc237b"
+SRC_URI[sha256sum] = "9a5b655bada7c7a1921cb3bac83b8a32bbe49893e4c7a1377cdc1b0d35f7d233"
 
 DEPENDS = "bluez4 gst-plugins-base"
 
-- 
1.7.8.4



