Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.3046.1612316199279742951
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 17:36:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fJ+l/D82;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id r38so16145308pgk.13
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 17:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BczXtvbdp4XRELhAbtsy/zyWvb+SZb3tVCwShyIt1wM=;
        b=fJ+l/D82BfNY0MIre4LhLH8cWQ/wGzqDOEAoPoQqtIUx4nX159Fw/FKoTe2HL7kxvf
         jkzcuKHAuc5Gdd49e/DtfMaaHOINqwwruqVzLnvQj4EmaRUg4fu6ckwB0Ktoa6lEzQjo
         KMESbxWVT/hK6Wu73vSiR1oofVTrVpf+RhEKF2P+Fmv7URE6vxeUbUUwW0cUCbt9/PIq
         ZjoXf8os1Jmrozl3OnX7WNh/3/tT4/Alrz0Y/q8TtjdxGLk5OVXlRJRXRnvGKPF/HhNc
         UxNf3Zipk8OgkSuXpW+I1CC0/+DeZYScXfSVKK39hIH3WHu3v+WobILPXg+ie+I5VSo4
         RL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BczXtvbdp4XRELhAbtsy/zyWvb+SZb3tVCwShyIt1wM=;
        b=bPjQfre5IpZ9O7XPf9sbNlo/utS2YZsJtoOoiYAsPEbL8iuLvBSgZYvXymaDscyc0c
         vrB5WFxPkpcyMzDYbVmq1U/W9yD0pvUxNrD6afe+SN4PpkX8sL0Y+8dSu/6OhyNpZfZv
         gUgDUgqj3dKm8GcJlNeg6/mw3PmEBHWjbsqDFGb9dpF02A2vFQbwhpI4b8LxpRTMhQf3
         Q3c7dlhR/XhUXwHtObDJ97BY5GySx7SNhW2O2idTY2FabOFxQDh7E1HhhkuwNYM7lhs3
         XLU9PKpHJqTmgZKgsHyK0mKSrz+JXCUdURHZXFC3zdvW8Ze9zdkNoHTa7fufn1VwAIvH
         yT6w==
X-Gm-Message-State: AOAM533flaZ/WharkqFq18Gne2s/FqrCOsr14q+iS5lNFZxblWGI5c/0
	92J0jDpqMtwIK44t7r4CXF9jdzzjP8fgWg==
X-Google-Smtp-Source: ABdhPJzjxszFwRFkhqF/pIyDZh2Vip/h+yR6+a57PNM/AyxAXJRYBXlAxypzJWkEd7xnsPL8Dt/0pA==
X-Received: by 2002:a63:5309:: with SMTP id h9mr945623pgb.19.1612316198484;
        Tue, 02 Feb 2021 17:36:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9296])
        by smtp.gmail.com with ESMTPSA id d14sm214013pfo.156.2021.02.02.17.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 17:36:37 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [v2 1/5] binutils: Package libdep linker plugins
Date: Tue,  2 Feb 2021 17:36:31 -0800
Message-Id: <20210203013635.2512741-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this is new plugin added in binutils 2.36

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index e93cd50b20..81891963c8 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -18,6 +18,7 @@ inherit autotools gettext multilib_header texinfo
 FILES_${PN} = " \
 	${bindir}/${TARGET_PREFIX}* \
 	${libdir}/lib*.so.* \
+	${libdir}/bfd-plugins/lib*.so \
 	${libdir}/lib*-${PV}*.so \
 	${prefix}/${TARGET_SYS}/bin/* \
         ${bindir}/embedspu"
-- 
2.30.0

