Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4789.1793755553487540236
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 17:25:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=B2IxcG9f;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so688942a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 17:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793755553; x=1794360353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BwwsVpukaYS7YM+WUmYpdYGlhp++acwu59WpbPIoCQM=;
        b=B2IxcG9fyDlQb6x81B7pScfw++TY2OUvZ9WxdnWxT3dAgFBEIaaj5/peGEK+kRLQ7C
         twYjR0DKljKcAKZ4Ih4S0cQN+K+OsSwGRLJiKgTT4/UUSqp2/Ng9HlMt5KSIDPphoCT/
         iW2C7CSwdIaQwHZH4KA/bszfOLgMJxO0+DPC26HUCrzw23rqsg7mO/PSPAa1cMU94SH0
         NY7PSAhmVv4hsFvRg7Zv+LYmbW6X3qcEPHs0wrJtCnkolYA/Jkke8DAnkhN3jV5bxu4z
         L/0MFff1F0FUe7wszqP4DkSX5QNWFWHI7reqhyyiPOk7SRbQaAzNo1IKP8dI34g7he3H
         Ccsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793755553; x=1794360353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwwsVpukaYS7YM+WUmYpdYGlhp++acwu59WpbPIoCQM=;
        b=qTzThZWBW5BvEuAExWkN8IiV66FNEbgsKnGjnV/7DcFTj+ZYyP3TZO94lgbBXMDbF0
         wzYb1jzMIHCU/w0HSOyX1L8Gh9SttpvoWKhuWu8qUEDqkFKKs8OXarCjP8B28ahVaVCW
         8Vq2NByvjpcQMKUTflvKcNJGQliDd7/2fQ4VVNh+CkMl6KH6Wn2YSWEum+cA7UJtXcGb
         KBHu2IJRBryXK280LfgbdgLcxonbDejjt9/XBP325dNZkxpcIog/qgcseN9jtWQr7o0G
         FmaTfIK7i3L0exYA2RQ4rMQVfb8KJrluuAm9RbEr04BfnN7QxEnQlSJGSCPXyQXWYMvj
         QmrA==
X-Gm-Message-State: APuU4Z8pJIi5fM6HFtmg+MlxIXd5aAgTDRn8go0h2OiKieZwu9Tk8lwu
	awmWc4r5bwesOEOFyB3QLpw0n6RCxoWuJTfJ0hkgvvhjISXG3Qn0DPh4b8giMw==
X-Gm-Gg: AYBFou1EOV1yNsGHRtEyEMrTnye/X11pErz2Dg/2O+jL/L96TWk40KUPlsV7waHewTr
	oFftVLvzKrg4giBDeUUE8J4me3dGjaz8hJBhKPgXCg87XM33iofMvAzs9eFPY7yRHCmVcjc7549
	nOyIQ0eqvusq6CxZ+Vhp43yO7AlHrEJIiL+FIQY6m9MpG7V0wr/M+7NhlJdmxIf9jhS64XKiFU7
	X5Cw+d02qA7g6mOe++GhXWX7pSz9lrGQJ6eN0Knn77D5scpuL5p8ui8Di1KVnoLkPnSh/U+tGko
	KHAB3jQedqkFe7sOGDqXL+lNXiEPDxQwmjeJneiINhPwLzixD/KrvfXj3uECiMuXLA4jaf8KIuj
	GRJfOnEFlwhX9hJn7l0oI3WLKTt5du/Ha8iVXDKxYx/JpFrgDrpFNFKpRXNWfOua0n8zWOPkZHz
	5s+7FX8cllZgH/LzxbAqFVosl6hJKsRIwKwR1r/AflTNQZMGKEvhD3TV3ZWjXwJRUnJ55f7YZ/2
	4mVJU00QQkt6xI6UcmT7rKvCbfjkcBXvCJmI1yZ6B6oA0Hg+LYnhWtNPzKlqSkigJcE9weU0sMq
	z2H7Pjp7WnK8eu0l11gXQcoIhlHDR05e34wHqE6pd88dEWrGBoi2MV8aYV3oUQ==
X-Received: by 2002:a17:90b:4b8f:b0:3ac:b6eb:e0de with SMTP id 98e67ed59e1d1-3ae8955a23amr7559145a91.4.1793755552706;
        Tue, 03 Nov 2026 17:25:52 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b096b52911sm388556a91.3.2026.11.03.17.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:25:52 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][blacksail][PATCH 1/3] tzdata/tzcode-native: upgrade 2026e -> 2026f
Date: Wed,  4 Nov 2026 14:25:39 +1300
Message-ID: <20261104012541.1429500-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 01:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249315
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://www.iana.org/time-zones/releases/2026f

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5c5781d51df60bbb3d9945c9b3ad89f4d9502f4)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 44872c3637..d8dd7a3bce 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause AND LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026e"
+PV = "2026f"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -14,5 +14,5 @@ SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 S = "${UNPACKDIR}/tz"
 
-SRC_URI[tzcode.sha256sum] = "cc3d27ca2a0d8399504551b920970d80af83bfb9c216e8082a15491921935d54"
-SRC_URI[tzdata.sha256sum] = "b26882805f26aac59d5b222978e6580484b834ccdc98be89df2f05a6dc53a652"
+SRC_URI[tzcode.sha256sum] = "5a18da01393679ef2559214dc687563f7f3d05691f6f58b7fbc0166f3e796cd6"
+SRC_URI[tzdata.sha256sum] = "01b4a91cec5167ed48c11e8ab78f2048cead78ce94b0cafcad0ae8c5a3044d3d"
