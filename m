Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.10531.1594990600378799623
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 05:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pwtm4w6U;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id w27so7485668qtb.7
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 05:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RKL8fV/SAGY7tXX4jK3ysoDF1ID1k4X4a8pj4Ww5Jls=;
        b=Pwtm4w6U1T9qcaMFV9nhYjL0XhM4H9YHzpLUWJXakDVjA/vox7Ako12xPrWNByiCeS
         gt1k0FDnV3BmiBv7PHI6QD+gFI3AOjz3Zg1lyEC3xDyDa2MFkN0VdrxdgKgiiuQ2v9Ar
         EfYbioY9VdDxibClG9Uytkh/hIw7a5JSsLqS2OMpQZdMDPobH5Aqs/5xAbE61rv9zb24
         RFpQ+vqPx71Kbw5pq8ft3Np+jKDx6TqrppmBycmUns6j86uyeducORcowgxlESxEavez
         fOJYTZJG/jNUm3YuNUxlGz2lCowf2oRzkHpNL4p/31lfjjwnrPSqO3Jp8Q9qjfChbRc3
         owGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RKL8fV/SAGY7tXX4jK3ysoDF1ID1k4X4a8pj4Ww5Jls=;
        b=A1XQNKKWwqtr4OPRWXqqBJM4H+6ryKRmmUUsf5EEoHT1G0fsdL6fRg60wnHBUItdz1
         gI4lPpHLEm0HLB4NXTYfzsreSkcTrRw9Txk2XkSEz30hV3gDEDMXrz4SykX52IB6ip0r
         lJjdB/72MdEC18tOVSv1qKjYWTBRNI7K5y1gD7I5dNO/pS0XasubdigBlzqP9fPcIkor
         YehRAFQ8J/bemBQ7jsKy4yT1oOK4IpF4D0FHI475B9pf78mfDdnS/kFIcw0adet7j743
         RlMDKtP4zuxva+TkUbVeFSTTPnNcvhTN54Cy5uXaNepfdUDm8u022O4Iwwx4yMIJoAWY
         F/dw==
X-Gm-Message-State: AOAM532YcbpX/X16BYJQil+JfU0jxLIrCGlwPvv2HDuN+n9Y5G+8x40w
	pH55iBum+fksZ23IlrUahNI=
X-Google-Smtp-Source: ABdhPJzClMX3LepfV6aNaIwzgqVkRCI3JMySCgkE2YMbg6iEFk+xFbSnzBpbkhKcSQkBzoVzst/LvA==
X-Received: by 2002:ac8:6f26:: with SMTP id i6mr10151366qtv.61.1594990599455;
        Fri, 17 Jul 2020 05:56:39 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id 79sm10431808qkd.134.2020.07.17.05.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 05:56:38 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto-rt/5.4: fix mmdrop stress test issues
Date: Fri, 17 Jul 2020 08:56:32 -0400
Message-Id: <fbaf2b8c5dcf738321284c3d643e943c0de0b097.1594989620.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1594989620.git.bruce.ashfield@gmail.com>
References: <cover.1594989620.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

    508b4e6ada7f sched: Remove unexpected mmdrop on RT

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 22a0dc997e..caa5b4ef53 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a1e1e3cbe42d8a08de5a3e3daaa2b389e352fe77"
+SRCREV_machine ?= "508b4e6ada7f78b3ef5a9dbdd182d13dffe00123"
 SRCREV_meta ?= "caafbdfe382bf22a4786d871af097acd49d0867a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.19.1

