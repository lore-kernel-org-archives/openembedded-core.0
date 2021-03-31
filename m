Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.1156.1617231055689781449
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 15:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EIjAep0o;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id l123so61733pfl.8
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 15:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tp/Ar5qeRlB4hjlvHoTllE+unGhJw0lc7WbQY7mXk/0=;
        b=EIjAep0oS1nH8PuadM1/m1H/KQeDGXsMurGgpnfGOmyGjH9U9Az3mApfR15mySfvbV
         40iyBOJUuy44HuwGR5nuhQXF+lErXdU2ZhxFQcTsotW4o4+oU5sHOgj0SIZc9rxakXBa
         mX+0yg96Okf6M+NG2aadFj7K9yrL69COFN6HUXODtIRcOXURAVgch7qoNncUmhq143MK
         Gmbps8fJFqn7F/aMwi32526IPingzxyL56LHf7LhvcFsceYD7vLRRmT1WaBb+UZgYJgP
         SjAGYX9ACjWNt5MQxx6imz0bS7u7qo+My0Qx61hVtrYmedTfjxeXM3+TGwteUBuidw0O
         M0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tp/Ar5qeRlB4hjlvHoTllE+unGhJw0lc7WbQY7mXk/0=;
        b=EWZl3ZCSj+TL0q87uGxO+nXd2884aCw51AoQbTll/EueLaFq3guo/mul5CDFy73Qg1
         KeV3a6oxk8gEnVwqrmzi651bxk9fzjmUDgvcj9HbXdflV+OkXDunir83cFww501Alznt
         i+9XWBhBVpviNG9S4+vNtUE2ymICOhRcuqzBnBEtjvmFuL3xTpoSQG99TvMPjuGZI6Lo
         f774W3OASBs+3VdSFzWmYeT0l5tgwl6cfAATeEpE4qkbU78Q5yg2CpBiWXKcFYWDUgXO
         WC7rd716q2Q1qQB7219KT3quBlYJfrDzoWaTij+GMGeqf0xKSb+sxqpQokClRRQKeINV
         FZ5w==
X-Gm-Message-State: AOAM533M6mfn7RNzMjRuYia9mdH1KVddsCmkPjRcynWnuCpydJo/u9Fr
	/Gs4cGY3q5M3qfeudNF7JYBaSDGtA+qqDg==
X-Google-Smtp-Source: ABdhPJzq7vxbdSuqLalH059Th/Kij4AZFemnlBEiSqFb0ZIjO2pJkNEeNpJ3gFYP7hGVUC6nC/GT/g==
X-Received: by 2002:aa7:9910:0:b029:1f1:b41b:f95c with SMTP id z16-20020aa799100000b02901f1b41bf95cmr5000222pff.5.1617231054467;
        Wed, 31 Mar 2021 15:50:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ae20])
        by smtp.gmail.com with ESMTPSA id j188sm3388480pfd.64.2021.03.31.15.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 15:50:53 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] mesa-gl: Use swrast gallium driver
Date: Wed, 31 Mar 2021 15:50:51 -0700
Message-Id: <20210331225051.3823769-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
../mesa-21.0.0/meson.build:21:0: ERROR: Options "swrast" are not in allowed choices: "auto, i915, i965, r100, r200, nouveau"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
index e50782be1c..fc8b4f7504 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
@@ -12,4 +12,4 @@ PACKAGECONFIG ??= "opengl dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x1
 PACKAGECONFIG_class-target = "opengl dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
 
 # When NOT using X11, we need to make sure we have swrast available.
-DRIDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', ',swrast', d)}"
+GALLIUMDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', ',swrast', d)}"
-- 
2.31.1

