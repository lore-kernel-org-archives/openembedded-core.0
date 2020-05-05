Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.7175.1588683739179337915
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cdi0oHAA;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id k1so2605126wro.12
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xzuaiS+RojZbNti6JArOdAdVqdRvco7D/wSlN8KbUoQ=;
        b=cdi0oHAAnf6IoL1oXObLyRYgLqVhb8r5/vScRpnv+gwiEy/+awBUFmcqIS9VfoPfX3
         Je+aqBVdYLx3D4XfJGsHOWObvclkq5sUUaaV/RqcMWUgk0uIsGCu5oxXk2mBZZ3j5PqR
         mQ8HvCHflZ2XrE8p4OW0umAu6aUJS2ub6fIxkoVNnoAApqfAkpxjXTLp3vXLwGKgPQsf
         LIhvAv/zOmfHimo6OcRXHPqAnTmLdUkOc7w5PgJqE3fEY3hZlfvccHyQyGDnjcH//Gx4
         VmVZGgQUK4QIRQXXOq3z608Kv7oVYfLmZ4XVH0qBEFUhOFes1KmPfkP5emM2KqenR3TY
         b1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xzuaiS+RojZbNti6JArOdAdVqdRvco7D/wSlN8KbUoQ=;
        b=nP7/5VLTRXt7IaGFfjaiF3RXazs5c9P2AcpPNt9cJ9Tbj04eHZG/v/Kc7IE3zLD8SF
         RGP8BJx6QVIpBCeR8aCDdRMEbIGgAvj6mCavg/5RmU83P5oIav5c6C/HBZeygslbjB1z
         quQ281sVn15KAU/Rbk5cfbbN5fJvDbQxr0RAjqVl71CYxeiyjABgdHnzWP7ShtZqAQKn
         O9YWz8e6vXdTVzZ9ePv0FAsKPWJ5l27/p81PjCKWpLFwgEyFK+dZ6AtSP5OqjEM4PDln
         p7NS77MyFJUFjOkLpwmphDYPyXkPWdnugjVldTDumZaOGxeDkmwlSmwcA4E2rqpxDL3H
         PxCw==
X-Gm-Message-State: AGi0PuboPghbX0eDWghjRbEMlwDa4zIjPgI/Ruw4N/SuiACBeQZxvUPV
	A+hHXPSokifglx2ZSAb0p6Yt+Mo+
X-Google-Smtp-Source: APiQypKg7SckAdC70YjRRFRwglwdoqV2HyYu1VwFrwc/UpBqABk5Fs5cRwMgzADw1akpBURXQsuqTQ==
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr3463700wrk.232.1588683737590;
        Tue, 05 May 2020 06:02:17 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/24] vulkan-tools: upgrade 1.1.126.0 -> 1.2.135.0
Date: Tue,  5 May 2020 15:01:26 +0200
Message-Id: <20200505130133.24930-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{vulkan-tools_1.1.126.0.bb => vulkan-tools_1.2.135.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.1.126.0.bb => vulkan-tools_1.2.135.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.1.126.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.135.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.1.126.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.2.135.0.bb
index 2fd61c989a..085c0e27e9 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.1.126.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.135.0.bb
@@ -5,8 +5,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.1.126"
-SRCREV = "09695dfc5dbe54f869aeaff8db93bb7bb6a220e0"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.135"
+SRCREV = "6d8197fd6c91d352a601587ffdde28f4cd7bc399"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.1

