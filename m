Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web10.1020.1607474172676763264
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 16:36:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Yg6ksfHp;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id 69so25129pgg.8
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 16:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cvpBiRV2nx7Kbu+Styc4pfEADQw1cUPacJnFBKymUMQ=;
        b=Yg6ksfHpYyd8ss8axuq5+fTjMWPr7nLtcpq4PQCtgXc8mAxsN+vAZ25mfD7kWD/gfR
         +Yf7CE89g7htYnHd3OTjcVFeX4McXa+1hasFugR7KgR8oqRmQUKDNHennKLwRNWv/wZ+
         /obyv5w5s2HMsG6YTpY5M0mHGczNW2TJvU4O/4fb3uFyN0IGS7AXzfQAC5msSHKLAQ7l
         FiYVKVzB54PFPiSJ7D0DL/kmVhXn7Brry09+fOFO3gn7EmjQ6beGHW7DJkeDeVOp1UaU
         LZQSyXjatMsymuBzFeQT3mOvDA3Wi3R0YXogSokkT8yoyCFvpSBholRyOqgVIFFk84mT
         c/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cvpBiRV2nx7Kbu+Styc4pfEADQw1cUPacJnFBKymUMQ=;
        b=L+hlFc17tJzjWHp8wPlS4TjpxxdTtS2ALrE+KgXiMIF01Fwio2CNikzdx6SY63Sf4y
         oky9avjYHoEOuVYLwjhbpzy1r6WNU4UlL//GwqIRj/WfARSXuCv3sW25+j0z0Cy4k7Yf
         /bbb61zFi5uqPLm7EeOf31VTUcEzIjBf4UbE9x36MbbUEPcpnCJkXc9LPEcw1R/FgHOu
         fwj+Bk3WiGJkOzEyas6yc2JPhxqkY2F+LdVRHyAEq7N+Qw+cYnaCw96ExStMJcvGjE56
         lPyNEoMoEO5HSkGFMEW4SgoHiA5oqwj4ol+58CInykK+7SvyhQVoVMyZ1kIRQQyGm0TL
         s3Gw==
X-Gm-Message-State: AOAM5336beHzC8rK9Og2bvjkLHy2juoqx4Wz8jbngCR4dlSET5fJTcDx
	9xkNfvPBJpduZNOX1o4Qz9sFJg56z0F+IA==
X-Google-Smtp-Source: ABdhPJysMCz1JRrN7bXoWjgxoXvEG0mYvIxH8MTAu/QTTQ2MP3hn2ajhUc6D+G6+I0PS+/5X5zZVzw==
X-Received: by 2002:a63:6e0d:: with SMTP id j13mr593325pgc.236.1607474172103;
        Tue, 08 Dec 2020 16:36:12 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:183:c5f6:e3c0:185c])
        by smtp.gmail.com with ESMTPSA id v1sm58181pjs.16.2020.12.08.16.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 16:36:11 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH 5/5] python3-setuptools-scm: add python3-toml dep
Date: Tue,  8 Dec 2020 16:35:47 -0800
Message-Id: <b96a710f2cafbdf68ef7c4b3b29036118555a6b6.1607473952.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1607473952.git.timothy.t.orling@linux.intel.com>
References: <cover.1607473952.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Fixes:
pkg_resources.DistributionNotFound: The 'toml' distribution was not
found and is required by setuptools-scm

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb b/meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
index 4ebbac6b652..c4576d3ae29 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
@@ -13,9 +13,11 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-py \
     ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-toml \
 "
 RDEPENDS_${PN}_class-native = "\
     ${PYTHON_PN}-setuptools-native \
+    ${PYTHON_PN}-toml-native \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

