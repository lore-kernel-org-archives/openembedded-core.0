Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.17265.1586966181256229030
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2020 08:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o3+YXMt5;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: maxime.roussinbelanger@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id g74so17676471qke.13
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2020 08:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QlsHpiQvFogsdEsyjpTfRBQON2x3huXzhPoR05pNnuo=;
        b=o3+YXMt5+zztHWx/KStN1fcnbrg57dOpRT1P1gHUXpowxbEstRc02xF7MFdUkGplJe
         F+qRPPBFqZu1WxzQ/cl5ar3SuKOhj6TxjHtnYBtE2itkTE7oqtEuKb0sN4iHlQom04i2
         rD2g/ubrvSTn8K1j423+Sw/kCrdODzvcxrKqnkpu1eTvq8Oq/sUk+//8SBYg/XawMOpp
         Bu/DBG8EiWW7VdMO1IxbqBfHAn7YbhBypbEWYaN315L8lPtRbiv4eQIP0W1AL/eV9s9l
         DXnRSSCtdv4sRPTzDv14s+zmNihVBqTXPT6l/1abuh++oW8oopW0qI5YxD+c7CJgAWpN
         15jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QlsHpiQvFogsdEsyjpTfRBQON2x3huXzhPoR05pNnuo=;
        b=HG609WY03qVkxdQ0eYbN04EO4o9uM4ittJHUly60Tjib1WuAJNhlJDMV65DbbyXKb8
         GnrLdmh6dgjJudj3WaNgbkZY60Nk39XnWTJllYHkcnGkOSfQ3+fCz1bJvQ5411stXoQ1
         06xcMSyNhfpE6lQ8PpOizGm5xprVjuXt4NxoIlArQGKqF/E8bQv1LPeh9TP7TBzab0uH
         BodmulbFoqAMRI/Tnfw/zkRSYCvE44wBcqO/EhUmRhIZQ2yzoF9UTpVWrQblgS9CNN85
         aJv+s7okXvNeLguKP7I++2PXlR7DzFo+oXc94rNcXEh/UOD88hH8mJPRcZ6RrF0c8zO7
         o6+A==
X-Gm-Message-State: AGi0PuaU74tVH3nI5HxBRTZ9D5HdSdUaT6y/rC8/vreEgpxg28S8AARx
	PlaE4O3vy1XGGu8kc63WPbNIir18
X-Google-Smtp-Source: APiQypLVo8YSQJXDpJp1S3fSYdPviztebPxfnGWC6FIOVNpLuvN6MuWU7R3mF5Jy9W2ctF62YsCnDw==
X-Received: by 2002:a37:a3d8:: with SMTP id m207mr7347541qke.371.1586966180226;
        Wed, 15 Apr 2020 08:56:20 -0700 (PDT)
Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mbedesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id i2sm5296781qki.54.2020.04.15.08.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 08:56:19 -0700 (PDT)
From: "Maxime Roussin-B?langer" <maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: jeff.dagenais@gmail.com,
	champagne.guillaume.c@gmail.com,
	=?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Subject: [PATCH 1/2] dev-manual: remove postinst false statement
Date: Wed, 15 Apr 2020 11:56:09 -0400
Message-Id: <20200415155610.5579-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This outdated section contradicts the real behavior expressed in the next
paragraph

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 documentation/dev-manual/dev-manual-common-tasks.xml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index 8bb8612e0f..997e4777b0 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -3284,8 +3284,6 @@
                 The script defined in the post-installation function is
                 called when the root filesystem is created.
                 If the script succeeds, the package is marked as installed.
-                If the script fails, the package is marked as unpacked and
-                the script is executed when the image boots again.
                 <note>
                     Any RPM post-installation script that runs on the target
                     should return a 0 exit code.
-- 
2.20.1

