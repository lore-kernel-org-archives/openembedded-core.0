Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.20372.1607112487553247237
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:08:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MSFCgGly;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id f23so10467739ejk.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ALIxdPw8c20po6QyOiQfOtRJmcNVT8nk4F0lhamPjZE=;
        b=MSFCgGlyh0q2sIHY3o+VptQpMw9YP+aED9j0IcGU03EmMNOELoMuTRVNP89fuyYWy7
         Zw+ozwE7kx9XjfTVul2cmzyhQG4mRDHjro6Mw/mOlyNBCeZP0puCtNMSc8iykgvSh44I
         /hqbhOe6lO2DB4adnaRwj+w7MYiBJxB+A4HrO+oSuBHJhdODEIUFAeNfsRCtmFRKHSdC
         z/xJaIm1CYuL3ImJ99NDNLIDCWffsAPDTzk/iJ0pPHll2petPYojqdI5zZYQuskS1C3S
         bcWrxpE575G6AgUcp1g4Q+0O1Ysr0x5kMsnhCQ+Ay63mvdwk6YfzIuUwcXX07feXme7f
         fWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ALIxdPw8c20po6QyOiQfOtRJmcNVT8nk4F0lhamPjZE=;
        b=Raya4hvutAzEHWNx5NvCG1oy5n2AorSsvYonxYjvG2dFbO1fMhPR3EWfSserlM0Nfq
         TZ4WZBrua9pRd7YkIM7iwgMxjRBgeQ+CxV8HwTtM/7yMSsFBlJSmxBfDFeQ/TeHYnB1N
         kDHgcHKsjb5NmjKWviYIHm7IzAKRFg20Pi+zndmie7Ta30mQcll5RgTXv+7HRZgEF5q7
         IZfKUTG0GO+CbTzM6AjOLygkEcHLQZX+Mn4JSJoZd3Y/tgjkv2xb3Xh1ClqWCJBfOwVa
         Gkw3cKaACqEeTv9EBiJqU4izEhpUvvHD8FqW9fIfN+2C69L6ghhhsomNoIqKAkJQaT2z
         g23w==
X-Gm-Message-State: AOAM531WBJXtDqc4HA5YzolvNag1zg/cvDy4eqlN78Hi196v+/tNEUE/
	f7f4EV+aNyjCI7xzfQ9MW3yzucy/UcmI5g==
X-Google-Smtp-Source: ABdhPJwbQIz0NqHOhTm/Vl13THkvtVcwpKQg+3FN11fNUztz4vkCadIjD3/bvggq51o/Bic+uRGtsw==
X-Received: by 2002:a17:906:178b:: with SMTP id t11mr8354940eje.152.1607112485907;
        Fri, 04 Dec 2020 12:08:05 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:08:05 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 23/23] ptest-packagelists.inc: exclude lttng-tools-ptest
Date: Fri,  4 Dec 2020 21:07:36 +0100
Message-Id: <20201204200737.7072-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These tests have been failing for a long time (and even more failing
tests are already patched out); no one in YP has the
expertise to fix the issues, so until upstream steps in, let's take
them out, and try to reach the goal of hard ptest failures so that
ptest regressions are caught as they happen.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index ce13368c2e..90272a70af 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -60,6 +60,7 @@ PTESTS_FAST_remove_mips64 = "qemu-ptest"
 #    bash-ptest \ # Test outcomes are non-deterministic by design
 #    ifupdown-ptest \ # Tested separately in lib/oeqa/selftest/cases/imagefeatures.py
 #    mdadm-ptest \ # Tests rely on non-deterministic sleep() amounts
+#    lttng-tools-ptest \ # multiple sporadic failures, lack of expertise in the project to look into them
 #"
 
 PTESTS_SLOW = "\
@@ -73,7 +74,6 @@ PTESTS_SLOW = "\
     gstreamer1.0-ptest \
     libevent-ptest \
     libinput-ptest \
-    lttng-tools-ptest \
     openssh-ptest \
     openssl-ptest \
     perl-ptest \
-- 
2.29.2

