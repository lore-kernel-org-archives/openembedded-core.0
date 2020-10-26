Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.11251.1603712359512111837
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2020 04:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vEeYR2Vj;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id y12so12022516wrp.6
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 04:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zGSpFnQvsV+UjN3Rx6Wfssdb+7EGvglnkxP2Mwen8DQ=;
        b=vEeYR2Vj/5Mv/LwiETj2fv+Ru66qDAPlqm9AZz0fzHDH/bQysEhPeRPZIvQdH4odLR
         CTzuTVsynlq8sO6rpUAnd+AEEHCyMMggk6i4jhmoK6HNRtLC9QmPyP6/Etbf68+sOpng
         K3Yo1d3/B/t8zgOxqvXuCr4tGogjDq88YeZxB8AxdYghHyLqr4Jqrbz6/0lgDKSgWABY
         Kc7j3xcaWRB10yFWOksHFmPOqZ1NA6ollZmelkqQs7EndvYBT7AwUTQks7+5+homumHq
         2F5VuvM05HmjwCCiyOBZkCSnxKFdCQ1+UqZ1Sfz1Wm57nUDIPGS+m9n+JbccajRQ9kQd
         l5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zGSpFnQvsV+UjN3Rx6Wfssdb+7EGvglnkxP2Mwen8DQ=;
        b=lvn5OCvIqdx0vOkhktRXqrFNrfq3FBwLHz6JaonTmpoKzEAtuwP+UNnYmidINm6iVv
         3NSZ3wt5Wf1ELqJCj6CGX2i7+/0G84Ht3RmBYgX6mSuVzQV5Eij6zk/GRdJZyYMzwdeB
         o74I3OUrqGviuGn7LQi1uUqHys1ljSPPmO7M5hrhq1smdbywu8gfDWl7GbRrPRTcj/V4
         uvXtoWSPijUYRiYmAmJGnmJG1k0cAJt77bumzjumh7kYCejbn2rGLQSrUryRWUWGz5TN
         +Q7Hs0nyZrQhCJncaLFI15QHqPZLceWW03G97NN+sbC+6ClbEXcSIVI8vuYQTjRielY3
         MH6w==
X-Gm-Message-State: AOAM532mvY7PjMC4WzWdWJasC8xSw0lpxkomSRDXIHgHoHgsyBHxuk3V
	aW1DC2lI3UsNtWUaXPrkqaLDNXhk+bknH7S/
X-Google-Smtp-Source: ABdhPJyGfADkP7qE0QT5dFZFWltAJwLCe6wSzha93qA/R1LDOhmtnk0QJh5oJYQk20yRFVn7Jlezcg==
X-Received: by 2002:adf:ecc1:: with SMTP id s1mr16919115wro.120.1603712357923;
        Mon, 26 Oct 2020 04:39:17 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id d129sm20348493wmf.19.2020.10.26.04.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 04:39:16 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 5/6] spirv-tools: fix identation and cleanup install append
Date: Mon, 26 Oct 2020 11:39:05 +0000
Message-Id: <20201026113906.2217226-5-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201026113906.2217226-1-quaresma.jose@gmail.com>
References: <20201026113906.2217226-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- replace tabs with spaces and remove extra spaces
- remove extra slash from '${D}/' on install append

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/spir/spirv-tools_git.bb | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_git.bb b/meta/recipes-graphics/spir/spirv-tools_git.bb
index d1c2436cd9..0b54706974 100644
--- a/meta/recipes-graphics/spir/spirv-tools_git.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_git.bb
@@ -9,12 +9,12 @@ SECTION = "graphics"
 S = "${WORKDIR}/git"
 DEST_DIR = "${S}/external" 
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;name=spirv-tools \
-	git://github.com/KhronosGroup/SPIRV-Headers.git;name=spirv-headers;destsuffix=${DEST_DIR}/spirv-headers \
-	git://github.com/google/effcee.git;name=effcee;destsuffix=${DEST_DIR}/effcee \
-	git://github.com/google/re2.git;name=re2;destsuffix=${DEST_DIR}/re2 \
-	git://github.com/google/googletest.git;name=googletest;destsuffix=${DEST_DIR}/googletest \
-        file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch \
-        file://0001-Avoid-pessimizing-std-move-3124.patch \
+           git://github.com/KhronosGroup/SPIRV-Headers.git;name=spirv-headers;destsuffix=${DEST_DIR}/spirv-headers \
+           git://github.com/google/effcee.git;name=effcee;destsuffix=${DEST_DIR}/effcee \
+           git://github.com/google/re2.git;name=re2;destsuffix=${DEST_DIR}/re2 \
+           git://github.com/google/googletest.git;name=googletest;destsuffix=${DEST_DIR}/googletest \
+           file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch;destsuffix=${DEST_DIR}/effcee \
+           file://0001-Avoid-pessimizing-std-move-3124.patch \
 "
 SRCREV_spirv-tools = "c413b982c316b14e784f50d941814fc737b55b4a"
 SRCREV_spirv-headers = "af64a9e826bf5bb5fcd2434dd71be1e41e922563"
@@ -28,9 +28,9 @@ EXTRA_OECMAKE += "-DSPIRV_WERROR=OFF"
 
 do_install_append() {
 	install -d ${D}/${includedir}/spirv
-	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}/${includedir}/spirv	
+	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}${includedir}/spirv
 	install -d ${D}/${includedir}/spirv/unified1
-	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/unified1/* ${D}/${includedir}/spirv/unified1
+	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/unified1/* ${D}${includedir}/spirv/unified1
 }
 
 FILES_SOLIBSDEV = ""
-- 
2.29.0

