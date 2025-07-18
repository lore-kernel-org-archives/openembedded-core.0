Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAADC83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 07:18:10 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.15348.1752823075625091823
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 00:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YfpgSRH3;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-73972a54919so1864388b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 00:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752823075; x=1753427875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QIBuzJbLB1HhQBcmAcgKUmOmawI77GANObAGlBJg9+U=;
        b=YfpgSRH33ZTi0wH3vUZHfXvhdA9JHXxHbqccfERB/ERFOzJwsCe0oZCeRKxjLlop4D
         QU5Y64CQu3/mo4VubNUAseZ5s0cOUdiIyqiaAxlA8eCB4AuAuEZybYMlB+ozb/6kCEXj
         sYjIPNHS+xJHDKTcEhGIEYpTBDYqZL7zf/Btdyv/Xr75NgSZzBfeggvAOs8r/25ritKw
         kjJGGgYXcL+UkY5akNKwXVnsy6FYlmQXDBCnZCkrQqd5q2bq1URylEkv4EWVXlVYfuFT
         vFEhw66F9v0QGYtdZLmRsHN4ZfhXD/SPtzTptUcKVWajm/4NcW97koiWX3wMj6HpxdL5
         NzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752823075; x=1753427875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QIBuzJbLB1HhQBcmAcgKUmOmawI77GANObAGlBJg9+U=;
        b=FfvjCxd9rDv0EqHz9HTg22pQ6FXeq97OiVGKoukm/hVj9tWTsOwyHScPjndbBAMWMO
         L/l8t+lWBSSHvWa8fpvSBR+KTRcXDv/XAzVBPX8Zk2N3oxutM9gOBYCA7jd15SLHayfb
         idGH+fhk4X40XPrBO7DqJMlcEP1xn6OxePJRlfT2difs/PBigOYcpIegzFLB8ej5ZbS8
         3nzHkQgvDEB7ltnGLjesX5xfbwB8UgRhIyGAC4+mya/Ce3gOAKWlPTBs088P36Zhluc0
         gmPaj5rwTjX+EuL/gPVkRaW0NiCZx8ft8TORT6U+OHBfO5JHi3z7OvOvnSs0CU+zSY0r
         CSJA==
X-Gm-Message-State: AOJu0Yz6VImYQG63EOzaJk5E/sfXXAp4aaE49SQP01vL1zc2EqvF/yxh
	Y7dmPE+DYZ5+CXOXj74oDXmOTOCNuczu572DdQvEcCYLHCU3peb9C99wVHL9la95IpQ=
X-Gm-Gg: ASbGncupQJdOOptdOnVbfvXdZOUwuDmZ+ba3gZKly67ld62H+sTN+3AFWJ6tTpNlvlE
	YMaDI693s14tKBYRi3Pye1qFP3ZRfmXC/6S3rvnX9J/brbR41gI/pTZl42cEBVHBcEPyryuYFs4
	M8PmjKLGRM5Kn9RtzCCJR/8QLssJZJzktJpm/1h6+MwfCut5pf4wBWSG9Ho9QwdpPfijnFFu088
	Nnq56wZnMD+aKo1jhq3CzimW8D3e5H5bCxoa94khujv4uo62fG/PVTuUrlp87AhbZ6CkTp2lETD
	hX45Dk0yqTQLOudf0fytMcV96M7gKG9EOchTm9anPnhsAd9Cd13Q9oV8Dob/aoB1UAO01yRMX/q
	cTDs7HhiJApXkWQ==
X-Google-Smtp-Source: AGHT+IHLg9PoI40M2uwz/GZZHiOJxwOFWs++NtCbihRU2S92SWRA6eoAPdIM9Z10Iu5v18Waz30Wbg==
X-Received: by 2002:a05:6a00:4b0a:b0:748:f854:b765 with SMTP id d2e1a72fcca58-7572267a620mr14925187b3a.4.1752823074467;
        Fri, 18 Jul 2025 00:17:54 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::519c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e2706sm651893b3a.31.2025.07.18.00.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:17:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] clang.bbclass: Add libcxx to default base dependencies
Date: Fri, 18 Jul 2025 00:17:51 -0700
Message-ID: <20250718071751.2410023-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 07:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220578

When TC_CXX_RUNTIME is set to be 'llvm' then clang looks for
libcxx to provide C++ runtime and unwinding library

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/toolchain/clang.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchain/clang.bbclass
index 221653e145d..d729182d2a8 100644
--- a/meta/classes/toolchain/clang.bbclass
+++ b/meta/classes/toolchain/clang.bbclass
@@ -27,7 +27,7 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-cross-canadian = "clang-cros
 PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-canadian = "clang-crosssdk-${SDK_SYS}"
 
 
-BASE_DEFAULT_DEPS:append:class-target = " compiler-rt"
+BASE_DEFAULT_DEPS:append:class-target = " compiler-rt libcxx"
 
 TUNE_CCARGS += "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " --dyld-prefix=/usr", "", d)}"
 

