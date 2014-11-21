Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E03EF72165
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 10:21:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sALALwWC020507
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 02:21:58 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 21 Nov 2014 02:21:57 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Nov 2014 18:22:02 +0800
Message-ID: <f049ff844b4bc4590b8fead39006bf8a4b1d6624.1416565190.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1416565190.git.Qi.Chen@windriver.com>
References: <cover.1416565190.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] busybox: enable 'resize' in defconfig
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
X-List-Received-Date: Fri, 21 Nov 2014 10:22:04 -0000
Content-Type: text/plain

Previously, if we have 'bash' installed in our image, we would have the
problem of long command rewriting on the same line which is really annoying.
For example, we might get the following output.

g commandx86:~# echo this is a very very very very long long long long lon

In fact, we are just trying to execute:
root@qemux86:~# echo this is a very very very very long long long long long command

/etc/profile would execute '/usr/bin/resize' if it's available. We need
this command so that we wouldn't get obscure output.

The 'resize' command can be provided by 'xterm' (in meta-oe) or busybox.
So we enable 'resize' in defconfig of busybox to make things work.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 8394067..0ebe83d 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -327,7 +327,7 @@ CONFIG_LOADFONT=y
 CONFIG_LOADKMAP=y
 CONFIG_OPENVT=y
 CONFIG_RESET=y
-# CONFIG_RESIZE is not set
+CONFIG_RESIZE=y
 # CONFIG_FEATURE_RESIZE_PRINT is not set
 CONFIG_SETCONSOLE=y
 # CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
-- 
1.9.1


