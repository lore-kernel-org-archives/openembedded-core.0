Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.5907.1622798106389319572
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BpmlAn5w;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id jt22so13428363ejb.7
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 02:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WHdromoc0gL77eEEVm/314/RA2BS7AEFqX07nUCH0VM=;
        b=BpmlAn5wJSL+rJIUjKwI6ODb/6NICrKQXbEDoPdBjL0+PWa+5gt/MDF0V2JJPW1CD0
         aeysnAWC74C7jbnnE1deqlpeJCorTyl+8J4V3ZO9wTn6kPXX2TqCB7nWnAPJz4R0ep4T
         qet0b/0ciGJ3FyyXQxZMEvIbHp5XrNYdElnGebtJgXd+EhnqldZeY7uVw3S2DS/6Vp9t
         PV1pRL6mAT4YmvgWHWMmqhvAqqEmcxeOcALNQc3QSuemWVZ67uDt0GFsGqSKarY4PpWa
         HxzWZZ2h/ORwHKf9tWPDLj95Y8WsF1iQXuipXaE/WObFoqUh2reeIUADuHww6zL2xFvk
         0RBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WHdromoc0gL77eEEVm/314/RA2BS7AEFqX07nUCH0VM=;
        b=tTg+DjSbzKUDpkZ06vYPixlcSnh7Dp1OqdcRtrLJnOV92wbLItQjEJRtZ9qZVzXGr9
         f/jWHGIyStEC39i7ZVkdoLqSpW2PYGr/sGsvIy0MxA3G7itcjn0QrgtLjPwqeF/1BPT8
         EJGEFqZ8VLA9mJgczbUMWU5CXPTBj6orwTJzRXScm/MTGQTKRNBnxrpiRVob1OiQNQzU
         hOPyRf6i3Wzt8/XhvlqolMlCK5Cx8oMH5vPraX7lXTRBUrToQ7xn7WhtNwZUuM6OOk5B
         eEBbkVqoSxIGXWJJYtTakOCEILix0mEAkvUbPe+ZdS1rud59q5FUMLXK0SLg328BSDHP
         qNjQ==
X-Gm-Message-State: AOAM530GGav3UPXbpj2KdFaYqeu3a99V53FHzenc9Om2XGdstIRS0Crv
	diCe52cW+TaV76NmgXSTC7kjlaJR8QcCbQ==
X-Google-Smtp-Source: ABdhPJzAFnUyhNa8i5vpKa6PbqIxQRwAKCL+oTE7iE5IKdUUBoD0Uxqu09md+0Xm5yxcYc98BmOHPw==
X-Received: by 2002:a17:906:5d0a:: with SMTP id g10mr3222408ejt.349.1622798105018;
        Fri, 04 Jun 2021 02:15:05 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id br24sm2508544ejb.55.2021.06.04.02.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:15:04 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
Date: Fri,  4 Jun 2021 11:14:52 +0200
Message-Id: <20210604091458.1381144-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604091458.1381144-1-alex.kanavin@gmail.com>
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../cmake/{cmake-native_3.20.2.bb => cmake-native_3.20.3.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.20.2.bb => cmake_3.20.3.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.20.2.bb => cmake-native_3.20.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.20.2.bb => cmake_3.20.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.20.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.20.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.20.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.20.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index be43760628..0987c01c87 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "aecf6ecb975179eb3bb6a4a50cae192d41e92b9372b02300f9e8f1d5f559544e"
+SRC_URI[sha256sum] = "4d008ac3461e271fcfac26a05936f77fc7ab64402156fb371d41284851a651b8"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.20.2.bb b/meta/recipes-devtools/cmake/cmake_3.20.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.20.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.20.3.bb
-- 
2.31.1

