Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web08.8314.1630503937276668991
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gVATpy7R;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id k12-20020a056830150c00b0051abe7f680bso3524170otp.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iwFbyEl+yoXBfZao7PFfuYVcERTUuv36VFDgrSwJcyE=;
        b=gVATpy7RFxNdyW2uzbkPKuwEh/sWe+sW53bqcj0lex11Ckse7GDH/KH+NqDtGewYl0
         iod0iqhSZMjFZY2cSHdHW7wYQdG8mQDcts4Kd1GSaEGA2kUV5iX6XhudeXyXHN+cJUYx
         Piv5Q70EyOeQt72SgKGlctIch3fTK5UAldrF6LgT8SEynq73+mj47Viub+AvU1Ploza0
         NMi947bn3q7Fzl7YvDSUwWGBP3TMK9a37EyHFqdJVVMWAYxQzU8orHDfPrZz0SMO+xnL
         I8+erBhKUWq7bafkNEVB/4YdHZFIcuA9m8Q+CWKbSdNjoCbwrxhNYIOQwplbyQs0DQcN
         adSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iwFbyEl+yoXBfZao7PFfuYVcERTUuv36VFDgrSwJcyE=;
        b=fJlSeisMToNn99ItuZv7Gam4lPs562wnfszXDvHNWHRXcPxRDobLkcP8jPzfM9+CvD
         O296iqb4s1opYZoByVMjiSzIG5aptsxmM8YS+usCThOXXk/uA8e9yFAbn/NsobJmJlu+
         Hs7NtcZw8y0ymthKovvIypG1NDEF1MO7qIF58RKbbED0uv2L6CEW/ThNssi2hPlNkJ7X
         96B4duIi6KQ3YOsXESTEHa4GqknlvfRr2DF6goLRi0BFL1cjkP6nvDSeaD6mw0OzEoyq
         nRezunyW9qoyYDtEVWUc5xsQ4yoTQ0A6cKor4wRDrGvYuHuYBxNfWP79tbiYSYIwQaZ4
         r/iQ==
X-Gm-Message-State: AOAM531RzU3eEYO0n+M4TUMr3YeSHgVp13UHsNijluhMq5fsOUd8xw9R
	4/AVP+jMPSl9LQcEiNuAJw7hfJxz2QE=
X-Google-Smtp-Source: ABdhPJzjLfcAeevoo99o5wJKapuIIVFutE053nv9TzwKgGhMlApaLexKsSV3CKkYlFlFeBQM9NpltA==
X-Received: by 2002:a9d:bf0:: with SMTP id 103mr28618481oth.212.1630503936400;
        Wed, 01 Sep 2021 06:45:36 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:36 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 18/31] conf/licenses: Add FreeType SPDX mapping
Date: Wed,  1 Sep 2021 08:44:57 -0500
Message-Id: <20210901134510.29561-19-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The FreeType license maps to the FTL SPDX identifier

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/licenses.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 1fe5fc6ec1..e2bd58f84a 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -103,6 +103,7 @@ SPDXLICENSEMAP[CDDL-1] = "CDDL-1.0"
 
 #Other variations
 SPDXLICENSEMAP[EPLv1.0] = "EPL-1.0"
+SPDXLICENSEMAP[FreeType] = "FTL"
 
 #Silicon Graphics variations
 SPDXLICENSEMAP[SGIv1] = "SGI-1"
-- 
2.32.0

