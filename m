Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id E150A6E2E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 16:32:45 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id cc10so4337596wib.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 08:32:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=mTHFugA7OPmqWdbnLw04y2qKPgOBkZvI2gdpJPgZZEs=;
	b=HR8y6QU5scmytXn/X4N9gH9CE+5yuf2r014fJEx1FXsio4rGkOqX9jSs10/Xnht5rB
	O+BsTKqmRiHpcP5oFpnNiiXnlm0q73AikkCbh9UOcA8tEDWiE3Ig8Pz4NpYIw82S52O9
	odO7/OmtFqi/thiPUkdSZqwBB3lihq/ngh6mt8G/VkgrTVklUesCN0k5GC2xkcJXo45P
	f8M3++zrm549DUEtk2MA8s0MPzih9CS/HXtyPEnhCDYCfL/T5u6Cc9IUGIYk6063c8M7
	i+jNENbchKXUjyJXuG4dpKf0127Iunumdq02q+xAUTljZZHsO61z7qMhSsc/usOqGrfU
	AOuQ==
X-Gm-Message-State: ALoCoQlMa8JtKU4eV5SRMglE/O9hy3Wif9i2MbCfS+e1VqVaNGDnHecA5M18y0/OaQ1suqjY1vdb
X-Received: by 10.195.12.200 with SMTP id es8mr58710wjd.77.1389803565052;
	Wed, 15 Jan 2014 08:32:45 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id gd5sm29118552wic.0.2014.01.15.08.32.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 08:32:44 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2014 16:32:33 +0000
Message-Id: <1389803553-21768-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] dbus-ptest: fix incorrect option name
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
X-List-Received-Date: Wed, 15 Jan 2014 16:32:47 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/dbus/dbus-ptest_1.6.18.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb b/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
index 567d995..386f561 100644
--- a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
+++ b/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
@@ -39,7 +39,7 @@ EXTRA_OECONF = "--enable-tests \
                 --disable-doxygen-docs \
                 --disable-libaudit \
                 --with-xml=expat \
-                --without-systemd \
+                --disable-systemd \
                 --without-systemdsystemunitdir \
                 --with-dbus-test-dir=${PTEST_PATH} \
                 ${EXTRA_OECONF_X}"
-- 
1.7.10.4


