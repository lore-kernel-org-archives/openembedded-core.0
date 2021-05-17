Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.19514.1621260859103205552
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XVlroknD;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id q15so4721380pgg.12
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CTtxDynO2Nibj8utovv8To1WxtLpK9eEQEAtv+ioqsU=;
        b=XVlroknDf/D689WW4kWkm95b0Q+OxsXTfF9DM7f8/96j2u/gWKK7RaSonjXijJdXpQ
         gpQ27TlYT9yeBtPgod8EgM+8HlTD/qc79v36zuUPVevJDdDezQyeWT3k4X9aGmkSyyQ7
         kf5uO3oTbY4W7vuijRXLZvfo6ttQRdihjjkWb8xNXxt+5sdo8HrFb/ZYSrc2OlzRBBZD
         /xBM3Pjb/oNAVVp/4CjtvvUpM4oWk3XbAgQC3nLsSBEMLR3jhd+TfhxZKsK8Q8XSNPNR
         cdSlo9iGjwr67m6YP2Cqg5Sh4jqGExe0xdhsTXrSNkZPj/T9zSOMYqC5L7Uy/pekNWNX
         gw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CTtxDynO2Nibj8utovv8To1WxtLpK9eEQEAtv+ioqsU=;
        b=iB6EGg9+b7bXc9R4SRDZIBmKaGNlWqKZ2skR9m++M88J0Hl+GvxjiiU3S+mwYsOAH5
         fKm0X7Btn4+BbDRpPSAf+J7Ais3ngtgjp2kaSusk1UVMUrRY6QU+b7K0JmdIpEA95mOx
         y5UpwYeA+FMFNqnU4buoCuI2SGyzJsiauqWquHoOXqAoTvVLHHexQcWcAKkReV6JcYEy
         fYiBGBD5A8HnOC3yeheaQRFGO611TF03Ib88G1zihDd5vIzRrdKtqDCVJxKnf+Nte6eQ
         eCnEJ6MMg/X+f9Hvq9rftCIKDsqlgQjRY9WHkUxxHYqU1MSIr7TDXwVawm6XqiMJauBs
         jHpw==
X-Gm-Message-State: AOAM533OirfwGzUY0AXHwZHRw5ooHPiD5u7dXyLexr50C6HVGcoDi7Qt
	sb1X6mgtf0ShqzjyfNrivLjjiFyfCkeAvIzclvc=
X-Google-Smtp-Source: ABdhPJzzapemXzfMiFYmzaz8FpDo2QgEJnH089dQtpiK4yF6hJAsuGrRpLu3Ysy3NDJTkLm4RS5ELQ==
X-Received: by 2002:a63:cc43:: with SMTP id q3mr61682728pgi.50.1621260858245;
        Mon, 17 May 2021 07:14:18 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:17 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/35] builder: whitelist CVE-2008-4178 (a different builder)
Date: Mon, 17 May 2021 04:13:14 -1000
Message-Id: <095535506951172e6f1812506a14fc3400f8b96e.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 107987b342a834badfad286474b03543b4764d23)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/builder/builder_0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 0a64c31ab3..9d5cd8cde6 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -29,3 +29,5 @@ do_install () {
 	chown  builder.builder ${D}${sysconfdir}/mini_x/session.d/builder_session.sh
 }
 
+# -4178 is an unrelated 'builder'
+CVE_CHECK_WHITELIST = "CVE-2008-4178"
-- 
2.25.1

