Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.12866.1628100184446838861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 11:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o1wmOsF8;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id dw2-20020a17090b0942b0290177cb475142so9931056pjb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 11:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s8Nv6K6DC6b/Ff3gH1MUaYZeVQcpQTOOYAp9z+TYj+w=;
        b=o1wmOsF8Luaxf+ZIxilvJLHu8wcCGIALwW5yLPgNmIJCD5eD/fKpWzIZ6iB6cmrRSQ
         fFxtQlDJsp0GPAtvROPf3UsxaCtoILLmNdfk6mKU+IdYc8sfoSknRqM0ZzmtydeY70iA
         yu6BvJXSh37qbQEdVz4gI7ekqiZfKzQ9gd8IeEDNpMTfpg1TiPvv7RHrubjqKvNVkd17
         n+pBOusQdpKff1XxTHDxIHkhM2MR/ZAgjHTn45a8enDAE1ME2FGpPEp+uUOUZuj3bHWp
         1uZrTrYKTvWaPMpn2bmzljIiTg1pkalediihjMT9Ch+HJrIZSxB2Vs2MV7qBgKqNbSBr
         8rXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s8Nv6K6DC6b/Ff3gH1MUaYZeVQcpQTOOYAp9z+TYj+w=;
        b=kowxTTsxNdPOpYdhYHgg8w0bLMOGEi0zQEUK9JnxKm3HH7/p+a7dITmD075PUfImGD
         9FsV1JzIe2B66Nl7KBOqRoaocx78AwwbdDskuzfxJa9J4UKfP1sZupYFxemdDbiSwefk
         mKJZjYXRqT8CtgY3LgQHuqbePgOvf5lpCNPEU5/f5WUoFk0FKzys+Cgo9bX1BDRAV40+
         FQ3nDqymlvi+SOyERJnj2kAU8Sjy6DrA3IKl6t0CdDul06uaPzbTkVtJelqayqQKLiBl
         GK26jxxmuuoDsU13qlnrDcJzro0tT/MeVlvMITryL44NY7djl8gRcHR6eJUXggXWFSiU
         d4ZA==
X-Gm-Message-State: AOAM530T4aacAOEgH+LLtKZHUu4Pp2/ichHudIj+uGovNrjHI9icqtdd
	dm0N/AX3EazdY8J0CrrhG1VWpWTqRv9y/w==
X-Google-Smtp-Source: ABdhPJx3JwJuxbVXfKkjDkLZ8B6YdluMFo5jS0v5OYfX1TB/U80fKRbD0Nu726nJ+Sm7sqWT54K6mA==
X-Received: by 2002:a05:6a00:1250:b029:3c6:1aab:3f58 with SMTP id u16-20020a056a001250b02903c61aab3f58mr781789pfi.43.1628100183540;
        Wed, 04 Aug 2021 11:03:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id z11sm6753183pjq.13.2021.08.04.11.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 11:03:03 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] devtool.py: Correct override syntax
Date: Wed,  4 Aug 2021 11:03:00 -0700
Message-Id: <20210804180300.1916405-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index c6dbf50e68..6d9cd46bf3 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -373,7 +373,7 @@ class DevtoolAddTests(DevtoolBase):
         recipefile = '%s/recipes/libftdi/libftdi_%s.bb' % (self.workspacedir, version)
         result = runCmd('recipetool setvar %s EXTRA_OECMAKE -- \'-DPYTHON_BINDINGS=OFF -DLIBFTDI_CMAKE_CONFIG_DIR=${datadir}/cmake/Modules\'' % recipefile)
         with open(recipefile, 'a') as f:
-            f.write('\nFILES_${PN}-dev += "${datadir}/cmake/Modules"\n')
+            f.write('\nFILES:${PN}-dev += "${datadir}/cmake/Modules"\n')
             # We don't have the ability to pick up this dependency automatically yet...
             f.write('\nDEPENDS += "libusb1"\n')
             f.write('\nTESTLIBOUTPUT = "${COMPONENTS_DIR}/${TUNE_PKGARCH}/${PN}/${libdir}"\n')
-- 
2.32.0

