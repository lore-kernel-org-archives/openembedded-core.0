Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.39153.1615222057425486823
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 08:47:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wZhnPi/R;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id w34so5690895pga.8
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 08:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Fl8GoUJqReQJ0j7Tl3ms6AjGh/X1Ojfj5JuDwlNHLLw=;
        b=wZhnPi/RiPbX6TPapGJt1JhUq6sokRR/3ek0xqlmYgCj+GpcP4WPCBSeCHPmCPkzi3
         xxdVFzcHOlTO/v+iw0g4Qf/cWflw14pg98LlvjmjDv7NBBDw+p2OjetrP6gUrP/QhPjo
         TfUvGqYoH4hUOoDpOpiBxEylL87zMaiiyjYisQZIuJkksuM6oeE5Lxp8DRhQfHSDOJuH
         06BpjDPTD8sIp1G8zl7+vg0W9A4VcZM9/JHRA+ii0670T3UVHtaz79k6mJURn/oFowgu
         QcYM1gxuSUr3QYX0fSWynECpXEtTNVTI+Tx7VVlnuHKDac1Myh3uUJvxRgSGcK7YzV+V
         Bvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fl8GoUJqReQJ0j7Tl3ms6AjGh/X1Ojfj5JuDwlNHLLw=;
        b=rMMIbRudcmXGrF4OaLRuStemIjEEO+FjubxBlytc6HRj7HrrSTe3KCTa5PBWRG34mW
         7IFk4Pz6Gc8xC/P8ZyULnFGM3pPasBAvTGFYk8a7likaYuybqLjkVpZdyYRrSDVwNFkj
         EGA0AhU/yb90TWBbihhSkD62s7ncz0GQh/BHLGEKqOo6CrNXj4oZuWTL6odxrjyayaBu
         Vif4zMbkspgVQyC3lIhmzcvnJhdKQl4lkvW7P/4DdBIW0QZ3FNuz/Gsoq7skKQu5aPHm
         A1Rt50j9ibcDxKWEohemzMuzvLJtApGHxzpu30Eokye3d0pr8FL1wc/BtCstAIIDS8oN
         sDmg==
X-Gm-Message-State: AOAM533eVuQLA3yI3H7PDop9fdTX8Z9KjVt9CSbSAPsSYHOpX5RrhOOj
	ciVCirWKglxRrhKIgyVkiCCHB3WGderbepO8w1k=
X-Google-Smtp-Source: ABdhPJwwe1e6zy0Xu6NQJhdH02Jmf7X4OKnziktJsdIYZjQMP2kBiN7HxO2gqIauqfcosOM9cDdgyQ==
X-Received: by 2002:a62:3503:0:b029:1aa:6f15:b9fe with SMTP id c3-20020a6235030000b02901aa6f15b9femr22019202pfa.65.1615222056305;
        Mon, 08 Mar 2021 08:47:36 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e12sm11256506pjj.23.2021.03.08.08.47.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 08:47:35 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/2] yocto-uninative.inc: version 2.11 updates glibc to 2.33
Date: Mon,  8 Mar 2021 06:47:17 -1000
Message-Id: <df5a8b0f25d7f8c2f80e9f91f7d23cc48a996912.1615221849.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615221849.git.steve@sakoman.com>
References: <cover.1615221849.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Halstead <mhalstead@linuxfoundation.org>

Support glibc 2.33.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5c7f963d395aa4a94d78c37883488baac471ea43)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 85336014b1..bc47083978 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,9 +6,9 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.32"
+UNINATIVE_MAXGLIBCVERSION = "2.33"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.10/"
-UNINATIVE_CHECKSUM[aarch64] ?= "645e5c50b2b48aabb8b10f783a9f94b4b7c5ddc7cfceb5386d43b86d30253202"
-UNINATIVE_CHECKSUM[i686] ?= "233e09b5ff30e15341232a0c16fa8448ff31dccb8f3f3e2ad3948cdac8c4a598"
-UNINATIVE_CHECKSUM[x86_64] ?= "04333677f81990ce2cf55c3bc256cd84a66085d18fc95ccddfab8581e4aec014"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.11/"
+UNINATIVE_CHECKSUM[aarch64] ?= "fa703e25c26eaebb1afd895337b92a24cc5077818e093af74912e53846a117fe"
+UNINATIVE_CHECKSUM[i686] ?= "638901c990ffbe716a34400134a2ad49a1c3104e3b48cdafd6fcd28e9b133294"
+UNINATIVE_CHECKSUM[x86_64] ?= "047ddd78d6b5cabd2a102120e27755a9eaa1d5724c6a8f4007daa3f10ecb6871"
-- 
2.25.1

