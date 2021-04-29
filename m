Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web09.8846.1619710663544263183
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 08:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ke7NNxLV;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id u20so35413440qku.10
        for <Openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 08:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VxmTeIwqKnmggE/3U+L5aIYrwI3JAgAWt5rJtMR+vYc=;
        b=ke7NNxLV2nZTeob+dK4TqQqrdtQn/UPQ6iWmSGQF6eYradou7lBQzujR1gkGx4eF/L
         w6E+ycNQ41OmZ+ST8NY998KHAZ84IrQlG5KEOhACfCV4iFI+X+G4w5Tj+87Upaid16q8
         RqahjlexdAwwrwyGrfJI05PJuVcFS7e783JWMa1U3pfyZi7GSNoHwiOXWS17znYrXfRz
         MCMQw4T6SEaO/HlsNzevh4yI2jH+ujScF62GCuaoLI6F9RVGJdv3pLDQv+wf22AE/Tw0
         WToWKjexezYOTMBD9icouGdtXLqL6BNTvSugih0GQU0UzKSsdVTfq07wPbXqyVS3wVkD
         2GcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VxmTeIwqKnmggE/3U+L5aIYrwI3JAgAWt5rJtMR+vYc=;
        b=Rof0zBmzclOV83EQMWcj1Mp2XuqDEMTTvMjuU01IIfeDMUy/PXE/hcIGAE9qZSf/i5
         lS59TYQnZ4cyMrXmj3whNEcITKlVmEN7mGeXLVQ/YhDWrG0f4G9liMwesfSTcQLB52R+
         +sqfGRmt1TswosmL5HBlpFfCCJy19UVzUsSyWM5EhhnwOvIxgGftdJKikndXVGM3nyJE
         jQQQUzJAMsRs4VN9UA1GkcNSGWM9hdRHKYI6AaByKrMsqjyF+u2lOwWsOlwOvAWhyg9S
         wDyKXLkjeFP7TjgLYvbiXInR+2hKBZpcA5yb9j5Iw45b8Lo+JjeO0HcGUYX/b3IpQeAE
         A2oA==
X-Gm-Message-State: AOAM531qnnlgY6rvY3DBOA3Bnp16s/o5RC+mI1lpVcBnW11MtrycXvEp
	vDhXbGymFBfO+3qoIWUzmOODKdgJuHc=
X-Google-Smtp-Source: ABdhPJyhGw7oW7VaiUlXMODqlld17ii4bwLuazUzONBlVYaGjNPthoCtWYBcHfjSIjtVIJtVtzlxVA==
X-Received: by 2002:a37:44d3:: with SMTP id r202mr228542qka.399.1619710662505;
        Thu, 29 Apr 2021 08:37:42 -0700 (PDT)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (modemcable249.105-163-184.mc.videotron.ca. [184.163.105.249])
        by smtp.gmail.com with ESMTPSA id m124sm2411278qkc.70.2021.04.29.08.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 08:37:42 -0700 (PDT)
From: "Vivien Didelot" <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: Openembedded-core@lists.openembedded.org
Cc: paul.eggleton@linux.intel.com,
	akuster808@gmail.com,
	a.kikin@tano-systems.com
Subject: [PATCH] sshpass: add package recipe
Date: Thu, 29 Apr 2021 11:36:38 -0400
Message-Id: <20210429153638.1077559-1-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster808@gmail.com>

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 .../recipes-connectivity/sshpass/sshpass_1.06.bb   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/sshpass/sshpass_1.06.bb

diff --git a/meta-networking/recipes-connectivity/sshpass/sshpass_1.06.bb b/meta-networking/recipes-connectivity/sshpass/sshpass_1.06.bb
new file mode 100644
index 000000000..707a41879
--- /dev/null
+++ b/meta-networking/recipes-connectivity/sshpass/sshpass_1.06.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Non-interactive ssh password auth"
+HOMEPAGE = "http://sshpass.sourceforge.net/"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/sshpass/sshpass-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "f59695e3b9761fb51be7d795819421f9"
+SRC_URI[sha256sum] = "c6324fcee608b99a58f9870157dfa754837f8c48be3df0f5e2f3accf145dee60"
+
+inherit autotools
+
+BBCLASSEXTEND += "native nativesdk"
-- 
2.31.1

