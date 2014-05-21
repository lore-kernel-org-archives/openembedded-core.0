Return-Path: <philip.balister@gmail.com>
X-Greylist: delayed 1161 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 May 2014 13:25:02 UTC
Received: from mail-qc0-f172.google.com (unknown [209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 65C4F65DCD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 13:25:02 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id l6so3170868qcy.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 06:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=LWj657ThQtZz5iRhVFKgL/26CtvxjjusbYlzTjxkiZA=;
	b=Kbs8oLzqndrmiv9mHwNCxo/bK9m40T8nlC6b9I2D4bZu/yun9IRgggDMCTThjQf4Ba
	nXGnXcOnZBFPfPPlSZLmEAydM8prCcBhMsjIl5Va6NBXjyEDEvNycxYiV18WcYwRJ6Jg
	EAC6ykgjFvEcha0KWBbJ82J4N4E/8wwBrG9EsIKhGGF52Nqxg0B7EIynhH057e1Vhjl5
	spbkDUZtMqWZBxxL5SMZNZXjBi4OTQQlr6p7xeUfKQimIkU0uyHhpWYG1wkooMJLasTS
	E1SozpLH/jfvVSryor0fE6AWGRnodkUVcaHlT5GbeSoJbdzpL83zfwPwkR5DIKx6fEBI
	wTVA==
X-Received: by 10.140.101.78 with SMTP id t72mr46425520qge.79.1400677048719;
	Wed, 21 May 2014 05:57:28 -0700 (PDT)
Received: from localhost.localdomain
	(pool-108-44-91-50.ronkva.east.verizon.net. [108.44.91.50])
	by mx.google.com with ESMTPSA id c90sm685573qgd.3.2014.05.21.05.57.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 May 2014 05:57:27 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 May 2014 08:57:12 -0400
Message-Id: <1400677032-25755-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] python-native : Add patch to fix configure error with gcc 4.8.
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
X-List-Received-Date: Wed, 21 May 2014 13:25:03 -0000

We apply this patch to the python recipe already. Without this patch
the zeroc-ice-native recipe will not build.

See: http://bugs.python.org/issue17547 for more details.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/recipes-devtools/python/python-native_2.7.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/recipes-devtools/python/python-native_2.7.3.bb
index b2a36b4..0571d3a 100644
--- a/meta/recipes-devtools/python/python-native_2.7.3.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
@@ -18,6 +18,7 @@ SRC_URI += "\
            file://builddir.patch \
            file://parallel-makeinst-create-bindir.patch \
            file://python-fix-build-error-with-Readline-6.3.patch \
+           file://gcc-4.8-fix-configure-Wformat.patch \
            "
 S = "${WORKDIR}/Python-${PV}"
 
-- 
1.8.3.1


