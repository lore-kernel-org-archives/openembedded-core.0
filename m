Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 28CEF780A3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 14:53:13 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id f21so19664621wrf.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Aug 2017 07:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wax8lQ1+gMTZ20UI7q7kFiAgZ1Bibfsaeet4HLLtWHY=;
	b=gQA7UtuP1mVWT9nRcpoqtFM8Piy6F9H8EOY3dqDzboO6cQg4C5PZX0kU0VioWxw7Q4
	ZW2O5ASPKRz7VNb6NECYD6hmnqcSSfLcTrl6sTZvL+XDcBd6isaFfQoP0gl1QHyRbkV4
	UpTLxaZTowhfmjXOHmtWywODB04tc4HIdChR6xY2fBsqGxQrJVPHY9oAJowjd5Ez1qvi
	HzCeVUCLLIjnnX6b35A22QNqdXTZGrCFTK+pbxCUvj7QjuYZ1ANIhVoLZUprxOAxDWfP
	51j6dSXsvQew65qxcZvpIH+mpMM2PjICpxjhYFfRe8jY4GZjGHvY33fUuW07BkqFFA8A
	JrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wax8lQ1+gMTZ20UI7q7kFiAgZ1Bibfsaeet4HLLtWHY=;
	b=FFakujjTsUDxFxIG2X0Yw35tvEHMtDH6/43DZOXGleKLuYkQOXeOoRAK0+pDmlgBta
	qK5hMBnZfx1KGlwa+CPFe2GPUTPB0uYFDkGHT5be28bLh5MBSL2dXi2ELzC/KVmuktba
	BOKbnq8Ap50K7G1cW7emRZtDE3f79/tXqbYOOIAdXiz9wiuAtmnd8uD+0sM+u6bkx5CV
	nnd6u7Kx1R87Mz1v2lnPHgVclJ8ZNT3qWDFU3WhcDFMHFgcTVuPjWw4qs2iFHnkYtnur
	+hNae6NsC+6IR6ootyyz3OO5uNGA543geTf1RNoaerXceMcC8nBLS6tNjpR56116cA9F
	ur7A==
X-Gm-Message-State: AIVw111b7iiq5PnhtssM5DUH0c0y6bscZ3f7k4eWMz0dh1KYjgDja7+e
	H0wc32SePtPzTNbOM7M=
X-Received: by 10.223.130.50 with SMTP id 47mr20747814wrb.145.1501685594559;
	Wed, 02 Aug 2017 07:53:14 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	e21sm3203377wme.17.2017.08.02.07.53.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Aug 2017 07:53:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Aug 2017 15:53:07 +0100
Message-Id: <20170802145308.19074-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170802145308.19074-1-ross.burton@intel.com>
References: <20170802145308.19074-1-ross.burton@intel.com>
Subject: [PATCH 2/3] libsoup: use Python 3 instead of Python 2
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
X-List-Received-Date: Wed, 02 Aug 2017 14:53:14 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libsoup/libsoup-2.4/use-py3.patch | 12 ++++++++++++
 meta/recipes-support/libsoup/libsoup-2.4_2.58.1.bb     |  3 ++-
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/use-py3.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/use-py3.patch b/meta/recipes-support/libsoup/libsoup-2.4/use-py3.patch
new file mode 100644
index 00000000000..d0156fe1ad2
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/use-py3.patch
@@ -0,0 +1,12 @@
+Use Python 3 instead of Python 2.
+
+Upstream-Status: Submitted (https://bugzilla.gnome.org/show_bug.cgi?id=785735)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/libsoup/tld-parser.py b/libsoup/tld-parser.py
+index 5d9d2ba..a743471 100755
+--- a/libsoup/tld-parser.py
++++ b/libsoup/tld-parser.py
+@@ -1 +1 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.58.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.58.1.bb
index 5b1273efec2..4bd22b4b1ba 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.58.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.58.1.bb
@@ -9,7 +9,8 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 intltool-native"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
+           file://use-py3.patch"
 
 SRC_URI[md5sum] = "91d7a6bf8785d31f4b154a7612e53e62"
 SRC_URI[sha256sum] = "62c669f557de745b7b20ba9d5b74d839c95e4c9cea1a5ab7f3da5531a1aeefb9"
-- 
2.11.0


