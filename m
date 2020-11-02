Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.1212.1604335786514830934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jvGHVeBw;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id l24so15011460edj.8
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TshHhws/igemFSAYKkUSc4sx0ixnNbtJOTQEPzZ7zSE=;
        b=jvGHVeBw6eHjuQHksVQSBEKwa38nZEOlqRpQMAe1aG6G5Yr1m38GVIsaZ6vumRpHTh
         ZWPQMstr7in+HGYeb/ovgUhjdq1Txb8H/2dneOPcSUmK2go/ZNc4dLtwlZMDYKcy66mG
         p6mVyBtR4s9KVJOrAv1bg6lVVzGdX1c88blYuMFCuaju+teteHRQ+F8THiOkGESXob6E
         am6WqgxYaB2Qlg+m3kvGL64jT7LkebaEYqVfdZ+x0k5fUAgJyUG+3+LO8pHba4MxFzl7
         HRICTdiZl29uI3D401OlEhLoeNfppsYc8aQKesvPXwrAXpP4KvgFNWKLGgqpkJ3RJZpN
         tCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TshHhws/igemFSAYKkUSc4sx0ixnNbtJOTQEPzZ7zSE=;
        b=EdU0GEnM6iEjBwg03IzOAqgj7Aqm/DoR75WZHDVHlASfr0IlUfHOBppj0xVqdToe8h
         9s7D0azopyOv0u3QLzMLL6TSFYcqeDWNHh0aVVhw498orluL81I8R9mzwYKAhcCF3o3E
         mrob8qdeDNI7l6FY5r6C+bopkozbx+4cdGQgMrjHzX4kyK1Oa22PWqjbQeCSKYlo+uWn
         DXu4uY8PMN1tb1e5Btdbo7WB1ruyG4/0f35G1Eh8iZlRPT5s1IPLxov5oVTMeXb+2u7J
         bNB2JpWHeVmHXk2huIGgFdg20QLR8d21yDZC47Ok7jg8kNNizWm2UMe5VFJ7KKR8SBf9
         73gQ==
X-Gm-Message-State: AOAM532ClOF9/d7xW/LgS3vWpgWst6p/wqbs337XcVoPVCpu1IOZlzFk
	Ee9SR8bmi/DJ1G0Kir9yA6bQGE26gotO/w==
X-Google-Smtp-Source: ABdhPJzbC+6MZ3MoojrhrlOOVbuoOkzs0RP/7hw59ZFO/2Bd+T7cuUSpNaYrqpSVuf02Z8XYlOgWEQ==
X-Received: by 2002:a50:baea:: with SMTP id x97mr17559619ede.81.1604335784784;
        Mon, 02 Nov 2020 08:49:44 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:44 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 31/80] libdnf: upgrade 0.48.0 -> 0.54.2
Date: Mon,  2 Nov 2020 17:48:18 +0100
Message-Id: <20201102164907.27572-31-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libdnf/{libdnf_0.48.0.bb => libdnf_0.54.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.48.0.bb => libdnf_0.54.2.bb} (96%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.48.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.54.2.bb
similarity index 96%
rename from meta/recipes-devtools/libdnf/libdnf_0.48.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.54.2.bb
index 37991e6d80..2a05b9f534 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.48.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.54.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
            file://enable_test_data_dir_set.patch \
            "
 
-SRCREV = "46a28d0cf09277fffc11392e5e362a2eda0d53a8"
+SRCREV = "c5f20d4f306f4d0f9d479be228bdc474968c8b60"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.29.0

