Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1443377071
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 15:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1TF7haa013780 for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 15:07:43 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jsdr5nIChqTt
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 15:07:43 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1TF7clv013776
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 15:07:39 GMT
Message-ID: <1456758458.11498.176.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Feb 2016 15:07:38 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] layer.conf: Whitelist cantarell-fonts fontconfig dependency
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
X-List-Received-Date: Mon, 29 Feb 2016 15:07:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

fontconfig is a stable API dependency and allarch fonts are desirable.
This matches the other fonts.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 8ee61aa..90d71d2 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -51,6 +51,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   initramfs-framework->systemd \
   initramfs-framework->udev \
   liberation-fonts->fontconfig \
+  cantarell-fonts->fontconfig \
   gnome-icon-theme->librsvg \
   font-alias->font-util \
   weston-init->weston \


