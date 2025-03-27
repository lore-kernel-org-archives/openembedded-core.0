Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76C1C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 19:44:28 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.5462.1743104667297152157
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 12:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xlEvnKRK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223f4c06e9fso27554285ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743104666; x=1743709466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zH852jpgzzlbcznKEWymn2jkDxLZ++SiZ/5aMCcV6rc=;
        b=xlEvnKRK9TZEOppfsertUXxPCLYJ15y346HjKsZE8o+8n1YcZnF3c32go+xY9oPSaO
         ueSA/dqADZxXh6zgcDzKax9OYlm897aDoiE63RsAb48dQ41fZxMzWuDgt8WPZxA83wKd
         vs19gt+PXePLoegSl5UzQE5okQmAuB3ssxvnXjaWzzbVs9cRT71VCJ3TBy6IF/HL3gjz
         IaRDZQxVBpHRgIe3baCNWg7Y4djf+xgVLlC3IqsSTUMIMA6e+1R7jllaf93lvFfoHukZ
         +eM5aKcUiHnI5dmsaqgpRUfk/ZTA9VutsBfDjgkb/8+2YjtmSlemodrx+6ZlDtFYo5YY
         b1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104666; x=1743709466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zH852jpgzzlbcznKEWymn2jkDxLZ++SiZ/5aMCcV6rc=;
        b=QoTD3/shA83Hrtq8gp+zqcFIT1yXaIcLF6Oln9ByozEz0nmLBU7WeoT/g0c4bK6Z9F
         lZbQLLA0eZmSeYYOqtbgv6mfv0rZxmMde5GnCvoW2guwfhoYTl00FAcbvqhCCRKoLP3L
         lUVKfkLw8R1Shidh/HnUZwAEXamnT1EeaIeJxTWMS9Jr/KU5qPfLGDncaQCIIQE5dxi5
         jAeu5rVTNzntMs6T8Rn8nbxGwYD59ap1BvorJs8d9M452fxqiiYYuk2wsKnE2FyL/5L5
         +rjWcDR0qDamN+gquR/uTpFiZxA1Pa4tOtSANI7wS9XJ77Avaze5OGr7vx6liY+gMmH1
         djjg==
X-Gm-Message-State: AOJu0YxSLsGi5DLL1JsI7T14zuDRziIVjHlFmhcwEUtXzYHt7uLSj05s
	VUeneeNRyBwHkb5i7C4m93fJWLY1pkBvSf2B5vzrJm8YQSB0m/BzNy/1DOFueIlgm9JhnWu06Np
	p
X-Gm-Gg: ASbGnctP1FulAT4KF2JqYCdYEIxYJfZJAROTEHKvUCL3UIsPSyP5xyjmrUX0GrUEEYF
	xzRBXTng5VfvXja8JWefoddAtMAMqPyiQt/cgyyKEBx4wWV6BmfejYS74Tprb50Ou0pJU79CgAa
	99u6FkrHRVYl82yvK+OK4Iah4VX+3Fj4UaU7xSRpk60ieIN5nwK3SbwVKqgCkuEXMfIye+oTExB
	PKS4BMoYwvpXBc8NWpiIz7hDa+5CpLWXfjjqh1rNaaYlWcB8ukRD9BuPNE0nYrnSOZbM8ppjtR7
	91Tul7tAgt0mfHp6+8JPFfScTRq7WqIPXzW0Vr262d1czA==
X-Google-Smtp-Source: AGHT+IGsAdr/vP4dnUS60hosVRXosK+J9xHpk4FZNuHRNvVcVJk93zWiZK1ZPV4uA0dod3msQwhP8Q==
X-Received: by 2002:a17:902:e744:b0:21f:98fc:8414 with SMTP id d9443c01a7336-22921d733b6mr841365ad.26.1743104666297;
        Thu, 27 Mar 2025 12:44:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:811c:968e:2c1:6363])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee0882sm3865875ad.75.2025.03.27.12.44.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:44:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/10] qemu 8.2.7: ignore CVE-2023-1386
Date: Thu, 27 Mar 2025 12:44:06 -0700
Message-ID: <6a5d9e3821246c39ec57fa483802e1bb74fca724.1743104524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743104524.git.steve@sakoman.com>
References: <cover.1743104524.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 19:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213777

From: Madhu Marri <madmarri@cisco.com>

Upstream Repository: https://gitlab.com/qemu-project/qemu.git

Bug Details:  https://nvd.nist.gov/vuln/detail/CVE-2023-1386
Type: Security Advisory
CVE: CVE-2023-1386
Score: 3.3

Analysis:
- According to redhat[1] this CVE has closed as not a bug.

Reference:
[1] https://bugzilla.redhat.com/show_bug.cgi?id=2223985

Signed-off-by: Madhu Marri <madmarri@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c3401533cf..38ed637b93 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -82,6 +82,8 @@ CVE_STATUS[CVE-2023-6693] = "cpe-incorrect: Applies only against version 8.2.0 a
 # NVD DB has this CVE as version-less (with "-")
 CVE_STATUS[CVE-2024-6505] = "fixed-version: this CVE is fixed since 9.1.0"
 
+CVE_STATUS[CVE-2023-1386] = "disputed: not an issue as per https://bugzilla.redhat.com/show_bug.cgi?id=2223985"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.43.0


