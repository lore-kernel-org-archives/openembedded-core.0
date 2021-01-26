Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.12880.1611672190532485588
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:43:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DQWjGHwJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id u67so10541401pfb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zuKHxFyAZxWN/7CElGhpS1D69I8Pk17xALDjZz4IAEY=;
        b=DQWjGHwJasUdJYuxb1bDAeuFmZFNxYsG67DcRQ+QsJhxw98TsS/41oZDPjrN1M44L2
         6RcJFmZm/rxGjVWsb1vye+GJHIG5W8A02jbGeAzmB46JBf4b/BDL2c2icuLt8lHxkI7U
         uDV+Stfcrl60PcS/plFYvR+VMsFjP8yM46DfocvZN0tmmhki6gERiUOUWvYxfJTUpj7N
         +nopo/0jJLWD0L8EnwzptWawTMvw1cE1f7zfoCH2ZGOg46/S6GfVb90iM8KStajIyABm
         vJ8qfs3Sna9RywUQm007yjDVvnx3kIRZbhZXCcojh/cEijTpLbJgNS9EC/bQ58enprMC
         p1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zuKHxFyAZxWN/7CElGhpS1D69I8Pk17xALDjZz4IAEY=;
        b=kSF6xLGUufCRjxW/oSHBRypiqCCJ0ip+QoC7YkKZvVWhZLittQSelxp8RNRO+Is0Me
         bZ2eCcpqNaF2Lux8GI+MP8fpbZc+XrUxzmxnNQTW3ljzKGxKjj+rrfkM+5vlIy4yN9FF
         oYcOcPTOijXbBJxS4g3G4YDPjM+2DP/mlyOCQ2C200DSh8dGJ8UyZFr6D3YEHt/euNZE
         aNbpz3WiJuXF570LRRwawQ2mvAdACY5jIYnK8lnwCAD81fUaQ4354EtInEca/sPTZFt4
         Z7BwNJbgz7Xtuf7iwglOun3gpr54GisPBY6/llPPORUrl/kezg8o5x51z+24ecPDxsyS
         ucVg==
X-Gm-Message-State: AOAM533C87F7+sNClAy0s4rXcgJhC9KKna+PIC58qN7qtAfLaLtujGXp
	hZVZ7T3wfFIv3Dgg4e+pY81hYywEUrTGMUyMM+I=
X-Google-Smtp-Source: ABdhPJwb3cn9Yg6pA8o5k02FTuoTr1LUT5YQaxL0jlTGNujbqO8aJv/x/J4Tn07u+3f82U0WshsWqg==
X-Received: by 2002:aa7:8c12:0:b029:1b6:e47f:7458 with SMTP id c18-20020aa78c120000b02901b6e47f7458mr5443324pfd.67.1611672189689;
        Tue, 26 Jan 2021 06:43:09 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:09 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 21/46] pseudo: Upgrade to include mkostemp64 wrapper
Date: Tue, 26 Jan 2021 04:41:32 -1000
Message-Id: <6e489b107a53e8440afbd9043f1a89c91bceab24.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Newer systems are using this currently unwrapped glibc function,
add it.

[YOCTO #14080]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cba4f51f0166e2c20e854ee0344be0c58769eaca)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 9b7ee1c18c..2e13fec540 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "07141f919dc8582460f984ed1d2fb73e05f82ef3"
+SRCREV = "cca0d7f15b7197095cd587420d31b187620c3093"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

