Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A0BCCFA13
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 17:34:18 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29309.1762709653680959365
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Nov 2025 09:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JDe0cDc8;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-378e0f355b9so15205371fa.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Nov 2025 09:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762709651; x=1763314451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jXvzxCHp3QJ24rsZ4UwsdKvA4dvV9socs9FrQLc19RQ=;
        b=JDe0cDc88F1bD+NLwhdt+Z2L4OIg8q55bsVmlslzcWtJn8aUvEcypWjdHPiA+7Vik7
         qCP46ljwiC357DrU3yeBXPgATKHzOocmEZw2jz5OCOhFwYzhObhC4oov9I6o/ubROekJ
         IHroVMetGUaYVKy2lD+xmuAYeST3U1m0e/jw8Ri1lCgoNP1clflhqIXIlqUAgyeKZd4C
         zNuoJuezqH7AQvTwRTl2Np4In9twRlSE4wDpw3l8jOjb725okRfg7TJqgdO6iHxskRqt
         0EF6eyJ/W85XDhcyeSM5PW9C4eIwaRi+48pl/W+OG0aqGAaEzDYV5YAxw/YG0PoLRmd4
         /A6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762709651; x=1763314451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXvzxCHp3QJ24rsZ4UwsdKvA4dvV9socs9FrQLc19RQ=;
        b=OAW12EDO78506jr2p14+IXky+iyFDFOQn4+cSMkUjq5UentnZ/jWxMth6lV06icmqd
         aTpfPKRNCTnJdSdh7Y53nl20cqko2rPPR5uIfErLY+ChcV4OYYB6lzQAca/9E8rnlzwc
         c9ojRt8cbj1uEv0pdOra1VIi+5bfZZ7uERnk2vzv20HqDmZVsXjDH2/989GQr/qgczBP
         l5+9PgS0/hP52BpCVFAUzDgtP82IGg726Q7M/c7fJw1TmK+pkDIKyP/6uD2MZky4R+uU
         aKuLyWE9FszFHZX1nEV+w5S1aHPliCZCnJGuLuXFFIoqMGord1/iCSGVrXOlgnWjWsMv
         bE6Q==
X-Gm-Message-State: AOJu0YxNlJ0R84+1jN6gzWUNTWF3Y3n324er7i9dTl7WMbe3aJORJssz
	9elJ+TvE9xqZajnD78jn3kxD3vncSbdxTstuUGlDLD4DiCmLfPSGypJLDT8Ajg==
X-Gm-Gg: ASbGncu7YzYeqZ4GuP9KbMa54lqicGYzxV+cPB0STvB5aQdgrffXxdFUEWtmqNZFXp5
	VgB+K0s1oBY0btRgk28eK28AVUe26m2PuX9oeTVoTJhq8wnPtvhLF2lyb+tquTUCj/Y0RpzsJhv
	b+tX5D9FiNLXdOghuBoyI88QMd8+Vt+pKRqRNw7hiILFgkONg2+uJG5cNdwKUU2v9pRXlZIoaGp
	AbvUkidPOYt1tS322kXB3BUhbwItynXxhdzu1uH5UEj2teCSU8ZwLt2C26I3xivLvdECQYQMFhn
	BFjVRpWB1aOVF/Ol50DWnMWldo9Dn/7APjy8H4GilEX3nyNDOUx0e3uk+B3p3tLqjbGzOgP6IyK
	bk2qMppoLkkhjurTu5D6IFFE7lCMlkAwA2ylnYWuf0sNU40RVGeDscUsdiJpltniv5BnH/rCtCv
	9w8G3DOcaPugs3LGicCr0z2WNyMXGmrVREWqqSNMsaPDblNXoirjpvRz5Z0jH8HD6GXhPyFOnvN
	ePeazxBJ3QGQJAVDddOwom9JEJ1
X-Google-Smtp-Source: AGHT+IHjyhJ9fXJX1ZJar1RE3ppInee4o8qcdFrcNEm7YzlG595lrRph7Lcle+zPzQ7ghr/l4AEv0Q==
X-Received: by 2002:a05:6512:130b:b0:594:2cfe:368f with SMTP id 2adb3069b0e04-5945f186762mr1521420e87.11.1762709651058;
        Sun, 09 Nov 2025 09:34:11 -0800 (PST)
Received: from peterliu-Precision-5680.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a2a71d6sm3246713e87.79.2025.11.09.09.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 09:34:10 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V2] bash-completion.bbclass: prepend bash-completion to PACKAGES
Date: Sun,  9 Nov 2025 18:34:07 +0100
Message-ID: <20251109173407.1320188-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Nov 2025 17:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226098

It was observed when FILES:${PN} contains "${sysconfdir}" or
"${datadir}", the bash-completion files wont be installed to
bash-completion package.

Fix it by prepending bash-completion package to PACKAGES, this
ensures bash-completion package get the files packaged before PN.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes-recipe/bash-completion.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/bash-completion.bbclass b/meta/classes-recipe/bash-completion.bbclass
index b656e76c09..e337c2045d 100644
--- a/meta/classes-recipe/bash-completion.bbclass
+++ b/meta/classes-recipe/bash-completion.bbclass
@@ -6,7 +6,7 @@
 
 DEPENDS:append:class-target = " bash-completion"
 
-PACKAGES += "${PN}-bash-completion"
+PACKAGES:prepend = "${PN}-bash-completion "
 
 FILES:${PN}-bash-completion = "${datadir}/bash-completion ${sysconfdir}/bash_completion.d"
 
-- 
2.43.0


