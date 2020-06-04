Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.20020.1591291996752902770
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 10:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=J15eerBB;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id f185so6537589wmf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 10:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fCfQn5MMy3/IAM9jNArsmg72+ow3q7t+pgjZYqZlHzY=;
        b=J15eerBBqiCeGvCbaBhYmAt2pXmFBm9G4jfl21bWPPs29snXLTT114K7O8lmqaLF1D
         8AXzvraLkVyiav9wUPllkCscrwORVHm2lGp6+iMEJI916O0Zvt6scsujcXBUbPzMCocp
         z/7G86VC9FRkGvyrLAtZP7tXyYPY19yTC9jF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fCfQn5MMy3/IAM9jNArsmg72+ow3q7t+pgjZYqZlHzY=;
        b=baHA5uI6n//l+VDXhjKeoOuOtELyfqugE277msyyEGpieP4W/VzckYhtmtvDnkxhvg
         qtlWm73bP+IX7NLc/3zZAipU5v2FstDhT96m4d5xAt1ycMgw1u3J1Bjba8oZv6epKUk6
         skyNN96jgJniotrI8U4uVZCXMfs67MVuuTj/uzblai5axhgceFHTj6GXp3qorB50YzPs
         NYdztrAGtS/yvIW6dnWEqnLzuiey+1oWNZOKCKJu1JyutsxQQr5Un2LuteVQl71FE5Jg
         PBro0YOTv9lMg4bn0539MiXIwXzrWdmA21k237LiKdAGIUznJHz9FR1y/JcqW2lsC82K
         YY2A==
X-Gm-Message-State: AOAM531ue4/OJ5x9s4b5+cipnnjsG6WychybJ2qxhtgB9+i7QdLTG7Vv
	nUISx/ObLWpbKAuXCyf9N9GLEFBxeYH+rQ==
X-Google-Smtp-Source: ABdhPJwmP7yxaqn8WYSYSqYeEK/RiCCsO5EC21F+ZWO8GyyPcJ79k3ArDH35EUb9osvMxJAqVMkyTQ==
X-Received: by 2002:a1c:9ec5:: with SMTP id h188mr4942567wme.9.1591291994973;
        Thu, 04 Jun 2020 10:33:14 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id o10sm8868339wrj.37.2020.06.04.10.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 10:33:14 -0700 (PDT)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 1/2] selftest: git-submodule-test: New recipe for testing a gitsm SRC_URI
Date: Thu,  4 Jun 2020 18:33:00 +0100
Message-Id: <20200604173301.12364-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604173301.12364-1-pbarker@konsulko.com>
References: <20200604173301.12364-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 .../recipes-test/git-submodule-test/git-submodule-test.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb

diff --git a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
new file mode 100644
index 0000000000..08089b4186
--- /dev/null
+++ b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Test recipe for fetching git submodules"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test"
+SRCREV = "a2885dd7d25380d23627e7544b7bbb55014b16ee"
-- 
2.26.2

