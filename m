Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id D719E6E367
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 15:49:03 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id u14so465419lbd.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 07:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Qub0k74XI6RBkoYqWtlVIhCcRXv9Rn8xnNzuPj3SNHc=;
	b=TgLIxJwuh9tmEeNFSBo0R2tfouRtytfKpjhz/c7R7FMCwWObBllnW2QYYfSvfeiFhl
	QkCtKiusn5Wjrtcw3qUjYkhHQ9bFFWZ+ktueEMjXCxlMbmi/535oUv3Sf5tP3XzjX80w
	iDTBvMXDdZQmwGAmWXDNXJU/tCSGeQobhfuHGJQm+GYNmQOh08nMhvxPHRTVRS+cSLKJ
	9kEFQ6YhtdQB8mJMM9piuuaqngHkwGlaIZJWOi0YDcj1nKSuMaACtq6ypZTmTH4iAjpg
	lhFKmhdwU5hda+5RNhjwsrftQpym841ugT0Yad0B/wt9YXq6ByZ7UyTdmO6SoJWA8Lxl
	u3vg==
X-Received: by 10.152.26.37 with SMTP id i5mr612464lag.60.1390405743869;
	Wed, 22 Jan 2014 07:49:03 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id m5sm10818053laj.4.2014.01.22.07.49.02
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Jan 2014 07:49:02 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 01E621C61BD; Wed, 22 Jan 2014 16:48:54 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2014 16:48:51 +0100
Message-Id: <1390405731-19334-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] packagegroup-core-standalone-sdk-target: Add qemuwrapper-cross to target sysroot
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
X-List-Received-Date: Wed, 22 Jan 2014 15:49:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some postinstall scripts use the qemuwrapper script, so to be able to
offline install these packages outside of the bitbake environment, this script
needs to be exposed also in the SDK.

This to enable rootfs generation from a package repository using only a
package repository and the toolchain tarball.

See https://github.com/nysan/rootfs-sandbox for examples.

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 .../packagegroups/packagegroup-core-standalone-sdk-target.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 57480b9..3325ef6 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -18,4 +18,5 @@ RDEPENDS_${PN} = "\
     libstdc++ \
     libstdc++-dev \
     ${LIBC_DEPENDENCIES} \
+    qemuwrapper-cross \
     "
-- 
1.8.3.2


