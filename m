Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id AE62060043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 12:39:42 +0000 (UTC)
Received: by wicgk12 with SMTP id gk12so7348882wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 05:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Gvhc9x16SNsl23aoLWSZ4yT1els1tbvKykz2+bG43Ms=;
	b=hUweXZVMdlqtP1foBXUhK2jtBD0mOZp0+EK/5Jv7OgzYRcZemzeqTKDYerHiIiBF4N
	iRQxkZR03GePI0TZO2bKRhsUESxF8QEUqson9VweXevbqqWu5hcp2khzafIwkdtsEsqi
	/CF0tXi2OVsOC9rA/kyIf1+qkJwf+KqTNh+++50FstWJO1d4yXTb5DHm27Vz+tawCUaB
	ElkmD+gfS5RZCpLkN6XxvFkMYYQbUmHe+9v/ISrkdOQmtTIUOYIKGWslYWTdqkba2khg
	N6NVaILasaJ/KbVHEzvn/bZ3Nw/jEqdforQHwp+aiSAaIq4BIAr0jMwMdPZ0k8FIGhfW
	zllw==
X-Received: by 10.194.92.109 with SMTP id cl13mr4582620wjb.156.1440679182173; 
	Thu, 27 Aug 2015 05:39:42 -0700 (PDT)
Received: from localhost.localdomain ([5.147.14.94])
	by smtp.googlemail.com with ESMTPSA id
	o3sm2934900wjx.16.2015.08.27.05.39.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 05:39:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 14:39:05 +0200
Message-Id: <1440679145-18993-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH] libnotify: add (R)PROVIDES/RCONFLICTS/RREPLACES for meta-gnome's libnotify
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
X-List-Received-Date: Thu, 27 Aug 2015 12:39:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Avoid package feed issues caused by removing meta-gnome's libnotify3

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-gnome/libnotify/libnotify_0.7.6.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
index 5d7b4ce..6d9c596 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
@@ -10,3 +10,9 @@ inherit gnomebase distro_features_check gtk-doc
 SRC_URI[archive.md5sum] = "a4997019d08f46f3bf57b78e6f795a59"
 SRC_URI[archive.sha256sum] = "0ef61ca400d30e28217979bfa0e73a7406b19c32dd76150654ec5b2bdf47d837"
 
+# there were times, we had two versions of libnotify (oe-core libnotify:0.6.x /
+# meta-gnome libnotify3: 0.7.x)
+PROVIDES += "libnotify3"
+RPROVIDES_${PN} += "libnotify3"
+RCONFLICTS_${PN} += "libnotify3"
+RREPLACES_${PN} += "libnotify3"
-- 
2.1.0


