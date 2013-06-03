Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0A57561EBD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 16:54:06 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id ih17so1953191qab.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2013 09:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=9nCZeqvPs1wpvXGCPDJcetuQsUguBlTLdhinEinxYH8=;
	b=ZcNz4aiPgsPF66v7cyCH1nvOfMgXvM2dF7eHvrrFcTMid1HN9J3CZHXGUkhQcPI0u9
	p05dbOSEti4wGC0tg+dDELqAZ+fWr6E9yHgsnemjRfCgeDI/Z5lswrGGtcPFHsWzVHwL
	b7g1fw+FYwS6QlLxwcRYbpfELV3Wx8e8vG0Pu/D9Ncrwyl2lYqpKvQxJIF3yJixFyAlU
	0QqUqAlhpajvvCPYNAnmrImK0lb6juYtgqsap+n3R7mI3vGXLAsw2wMxdxeKVxXDJNYV
	xXL/dPYaHoLkr+lZNZVj65yvJRkA0Sw2S/ZXBAF4GJZsafBVdZqshYuVJk5737yN/17s
	0TFQ==
X-Received: by 10.224.198.194 with SMTP id ep2mr19455185qab.51.1370278447940; 
	Mon, 03 Jun 2013 09:54:07 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.194.146])
	by mx.google.com with ESMTPSA id r8sm14428828qaq.11.2013.06.03.09.54.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 03 Jun 2013 09:54:07 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  3 Jun 2013 13:53:45 -0300
Message-Id: <1370278425-22062-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] gst-plugins-package.inc: Allow ${PN}-apps and ${PN}-glib to be empty
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
X-List-Received-Date: Mon, 03 Jun 2013 16:54:07 -0000

The ${PN}-meta package rdepends on ${PN}-apps and ${PN}-glib so we
need to have them available or the installation of the meta package
will fail.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
This patch is need to make the meta packages work. This should also be
applied in dylan branch as currently ${PN}-meta packages are not
installable.

 meta/recipes-multimedia/gstreamer/gst-plugins-package.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index 7ae3ef6..b768094 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -28,6 +28,8 @@ python populate_packages_prepend () {
 # each plugin depends on PN, plugin-dev on PN-dev and plugin-staticdev on PN-staticdev
 # so we need them even when empty (like in gst-plugins-good case)
 ALLOW_EMPTY_${PN} = "1"
+ALLOW_EMPTY_${PN}-apps = "1"
+ALLOW_EMPTY_${PN}-glib = "1"
 ALLOW_EMPTY_${PN}-dev = "1"
 ALLOW_EMPTY_${PN}-staticdev = "1"
 
-- 
1.8.1


