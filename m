Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web11.15515.1598973762493354400
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 08:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=suhFt7TZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id j11so684037plk.9
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 08:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=LUKp28/dC2yuaucAQYmJA3w5pr5WFsO6oZxwuKWbLcg=;
        b=suhFt7TZFqSc1BwRiz0p8N0QpAU+CIZPa9sLmTPjdm0Wt7JXm+SPu2JbIP95QZYNMJ
         F5wl/RoXyRjrCOSf/4FptA72pxX1eeZN6+eXYW70rOIWBsyKB8wEljUH86IEn1qmLSpZ
         NDATLzU1MVY/VVFhWy7fI50L1lxpfJpKYBu/+l7LCLzVLJPWiLdjHthN49bMIR0hX7NM
         Hx1H5JRxeSshMbmtEPqF3+awspHMnMzNpzCNeav/qbVJAn16ZNwuxAajbjQnrGtYeRen
         DFz40C4fpDPji/R81WSY+40jY9Cau88vgH0tT60WfX9585DyAt4MmocSbhYFftBeATYU
         XPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=LUKp28/dC2yuaucAQYmJA3w5pr5WFsO6oZxwuKWbLcg=;
        b=kIhz8+6KQdR1itp4SMnKovs7VFPE8TeRnkypuW/AcAmeAPLRvNRbAfQXaXnYSWI2OI
         +H/ji5qA/7K61R1Yti7zPXRysZpJP2Nxieyh0bHSwYAbCjY69PJ5wSXwD91pZjFgaLcB
         nZOKzRI/HhKiSPqOd1ZzWVmnN+1h0lolbmRFeutcTlHyK7bgs7DA20VgvxnVDba9VfsZ
         D4RNkXDroHMkWZXc8lD0BnCve5/Qs1qjjwT+xieZ2y2SOYnz1Jj7VTEDF1A4dUBXZqof
         TGEhMh0jD5+L/Y3eeVdZ3cmKjFejlCbztriQyuuvYMjS9/E4HYQpP/Kgaw3ts1R8nMeq
         fqgQ==
X-Gm-Message-State: AOAM531iBupys2PVr7ERrzhOLd2kLaVdMPmIy/4Rmqj4qjJo9rs+vhCE
	XT0LkYzJlF37FrtcGfri0L96MtIQPkI=
X-Google-Smtp-Source: ABdhPJwGhUOJjpg4YjPMjun16hnYXJrsOW+t/XUzpKGOkmis2i0crIrEEjB4WJoQuoS9I2YypFafDw==
X-Received: by 2002:a17:90a:e7cc:: with SMTP id kb12mr2053852pjb.204.1598973761436;
        Tue, 01 Sep 2020 08:22:41 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9dcf:ebf9:1f19:e8a8])
        by smtp.gmail.com with ESMTPSA id u5sm2217917pfm.149.2020.09.01.08.22.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 08:22:40 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] maintainers.inc: Add me as kea & log4plus maintainer.
Date: Tue,  1 Sep 2020 08:22:31 -0700
Message-Id: <20200901152236.9377-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901152236.9377-1-akuster808@gmail.com>
References: <20200901152236.9377-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c3a1f273328..b83be2c5f9e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -287,6 +287,7 @@ RECIPE_MAINTAINER_pn-json-c = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-json-glib = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-jquery = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-kbd = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-kea = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-kern-tools-native = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-kernel-devsrc = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-kexec-tools = "Armin Kuster <akuster808@gmail.com>"
@@ -450,6 +451,7 @@ RECIPE_MAINTAINER_pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>
 RECIPE_MAINTAINER_pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-llvm = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER_pn-log4cplus = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-lrzsz = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-lsb-release = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-lsof = "Ross Burton <ross.burton@arm.com>"
-- 
2.17.1

