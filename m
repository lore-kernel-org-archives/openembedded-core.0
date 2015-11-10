Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id B4DC576E3F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 00:12:28 +0000 (UTC)
Received: by wmww144 with SMTP id w144so97468506wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Nov 2015 16:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=XmKjix2mMFo8QyUrKkhg/rVwCduayIdijBU4WtyYKH0=;
	b=kZ5jsi2ycafuafbJZDO9FtDWtee5ns/0vhX8EIYval3hZKLgTVbF3PCU4JaoLXXser
	myqMXxjQVQlOEylOLiQA18b5SOa0yvpgd2uwGQa33MzGdJoXQCYMw9pnPKPpAl9XdyId
	cJUXhmtIlkDwl+ad9OBuxs21rpD21lni4dM6CUJFW6rWgGo1osncj0PbHjLzKITAEFKz
	kKDBnRG1M0pPTG2LtF+lv8ZGis+KFYACZ6bowt1y9zvFdnIRlk24I5NtK3GbXhcF0AvR
	+CZX928gaIt0imk1II+22VpRY1y3QzpEh/mh15Klpl3341IcSNikWgO1ZIVs/pAvFZfa
	jm1Q==
X-Received: by 10.28.139.143 with SMTP id n137mr1179485wmd.8.1447114348301;
	Mon, 09 Nov 2015 16:12:28 -0800 (PST)
Received: from localhost.localdomain (p4FDF01E7.dip0.t-ipconnect.de.
	[79.223.1.231]) by smtp.googlemail.com with ESMTPSA id
	j4sm1103469wmg.18.2015.11.09.16.12.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Nov 2015 16:12:27 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Nov 2015 01:12:15 +0100
Message-Id: <1447114335-32437-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH] glew: set correct version in our configuration
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
X-List-Received-Date: Tue, 10 Nov 2015 00:12:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This error came up during libreoffice implementation failing for wron version
reported by pkg-config:

| configure: error: Package requirements (glew >= 1.10.0) were not met:
|
| Requested 'glew >= 1.10.0' but version of glew is 1.9.0

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-graphics/glew/glew/autotools.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/glew/glew/autotools.patch b/meta/recipes-graphics/glew/glew/autotools.patch
index 7dfe087..89737dc 100644
--- a/meta/recipes-graphics/glew/glew/autotools.patch
+++ b/meta/recipes-graphics/glew/glew/autotools.patch
@@ -20,7 +20,7 @@ Index: glew/configure.ac
 +# Process this file with autoconf to produce a configure script.
 +
 +AC_PREREQ([2.62])
-+AC_INIT([glew], [1.9.0], [BUG-REPORT-ADDRESS])
++AC_INIT([glew], [1.12.0], [BUG-REPORT-ADDRESS])
 +AC_CONFIG_SRCDIR([src/glew.c])
 +AC_CONFIG_HEADERS([config.h])
 +AM_INIT_AUTOMAKE([-Wall -Werror foreign])
-- 
2.1.0


