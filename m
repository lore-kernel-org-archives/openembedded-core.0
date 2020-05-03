Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.25838.1588523192059616072
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 09:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dmwpkgj4;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id s8so7681011wrt.9
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 09:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rCHcGEteuUuTY/J99PHRo+4Y6epZmscSIxH3JgEFtVI=;
        b=dmwpkgj4DxR0RsesIN8H/Vn2IZpdskC6D/9NmZV1Q5QrjIpKZG0DkaB7ELb8U5+FEf
         391KmIXBoic+5WoqYYJOA/i0qGda8fi8zMQZd6IypkdGWsV2OdUZUvDfGHFiVJzKFrNV
         yrh8P4rLhdzObLdVOysm6ylTX43NO2OfySPyPONnjJmQVPpADPUwH+mS11TwgAK3aRK9
         ND/OvBru7R21eFDjnCCa4KJFDJmbDRPA2UoIZV4PfaoKbBe+iprT4PHsl9GvkFM+tn5R
         uOoV8DYNLTDlgTl3AemFbE/z3glSbxw6QXBii9EDKsi49So1pZ5bBMEqWBSfoukCgfuG
         NGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rCHcGEteuUuTY/J99PHRo+4Y6epZmscSIxH3JgEFtVI=;
        b=TprbE6DgT4CAYJmpcBAX6LlVGvi16lnM7jxBFReXgEH++R/XyWhzCvwSbPpYTtSMNp
         YrBe/9lyehfufdpzRVsz9A4TvTD39dDPeScZ/Dc6nSWfne4Hq/V44R5PbYpe0pFgAl1G
         PgAiTT1Dlvu6OFE22cABPu71chuvVgXtd0dLvwij1f+N2/wmmGjqDEzlgMNfCahIYbU7
         rYMUDMOapyRcZkFGKnD+U0bCbhiHraUgTw8QQoCNZ0csolX+p401fL0hBiTWWJnG9p1v
         jeAqM/n7OKghCqdBg/sVyXKRn6PFclE83WZAeVpN0nk1af8qqqq/N5S/Noj8+RLbpptk
         QLag==
X-Gm-Message-State: AGi0PuYc22uLFEptz/8o12C1PveQRhZ2HSstfHzvg2fE5onYtjn9VHox
	JcILIt/aKp32Vc23Jz7/9A3gYEJ/
X-Google-Smtp-Source: APiQypLMMonAZv9oKcamKXYDnUqPN7E0GInHy0bgPuLC+ubN3tN5BZKep7MSk58z/evH7yUy4nFyjw==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr13088345wrq.211.1588523190400;
        Sun, 03 May 2020 09:26:30 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id q18sm9079532wmj.11.2020.05.03.09.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 09:26:29 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/17] libinput: update 1.15.2 -> 1.15.5
Date: Sun,  3 May 2020 18:25:44 +0200
Message-Id: <20200503162559.946-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200503162559.946-1-alex.kanavin@gmail.com>
References: <20200503162559.946-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../wayland/{libinput_1.15.2.bb => libinput_1.15.5.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.15.2.bb => libinput_1.15.5.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.15.2.bb b/meta/recipes-graphics/wayland/libinput_1.15.5.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/libinput_1.15.2.bb
rename to meta/recipes-graphics/wayland/libinput_1.15.5.bb
index 31652cc342..799e1d20dd 100644
--- a/meta/recipes-graphics/wayland/libinput_1.15.2.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.15.5.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[md5sum] = "eb6bd2907ad33d53954d70dfb881a643"
-SRC_URI[sha256sum] = "971c3fbfb624f95c911adeb2803c372e4e3647d1b98f278f660051f834597747"
+SRC_URI[md5sum] = "c9a1b15bb932eaf22f840efe4c3f84eb"
+SRC_URI[sha256sum] = "a90efc8f423c3094f2f9f372fb92381b2f3aad62e8b5882a8abe333aa8249c97"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.26.1

