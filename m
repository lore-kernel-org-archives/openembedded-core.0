Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.1201.1604335825561453477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RfKGzht4;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id ay21so1656238edb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5NNx0iE73+wgrCngDspa+rOy7ctkdHlSFEDqo6iFBwo=;
        b=RfKGzht4RPTlIkEJU8kgeEt0w6S08Ep2y9O2pb1+zAkwFE+HRyjQNhmw8SsIwh6o2M
         hdMoxs02UaryK5UmbMUdiIduUingopuWWNpw+xDlz0pLml0p2WX7wy/NJnGu2JyJFhc0
         LBvVCLB4jIOqI2OmGuILompjXxvNVTQkfCnkLpSY4nKYCfrirS4fJj7Tl3i6oO13hHp5
         2JeHEAtFVoECIztRu0X9PenrAEhnQFfQOSBbBamXeoFe2wZ2VVPHt9qOtiW3TXGGln6w
         7opl3uVjIEycP4Q5v9BXcUBjabraz589FlsCXx/eR9KUs3MFeadLtgBttik8hXmTLkcp
         1r4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5NNx0iE73+wgrCngDspa+rOy7ctkdHlSFEDqo6iFBwo=;
        b=qmUsTZOaBw2oQvt2FAfKs2CjfDEmxJxWV2mtZJGeS8MH65p1Pm4jP+XSnX9eAnB5EH
         JNlOVzgbMW8q6PqCSfZU2GzjpCAsAdPukNUGuU0dxKO/55jaCTmg/KB/4UoNoDrvs/Fv
         K/mhjn1I6R6Lm+lgfbbcpBeWK7Bbq4SJKM8jgtkurcV2rtFHfWlE1zom7oomzGT8gU1P
         aBncnEmJAaON/ltj7O03VeWWiplcjrt6LSrpxo5D9cL2vrYDXYRZ9rYiO3DUh+4QN48i
         UsCJnYumSOdvXWK8dJrR2vldRtmRMSbZFT/VRkxPS8dlaPyhA8II+WLZdcb0HyDVWk+t
         L+Gg==
X-Gm-Message-State: AOAM533eE5KJAFu0bu3SAmq94Ky39fC1J+xZQ6s7M1Hfwpmw3kPJSHoa
	lRnbxYvF9P/BI6xNFjeROtlkLTQwS/JuFQ==
X-Google-Smtp-Source: ABdhPJz5PbPXwqCRyt1K0+fS7TNWdFGh+m4VcfZHMumJMY1tX9Ba+gW+2VfDtY5Nl5DXlxQPAvY0HA==
X-Received: by 2002:a05:6402:1691:: with SMTP id a17mr17055363edv.264.1604335823991;
        Mon, 02 Nov 2020 08:50:23 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:23 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 75/80] libcap-ng: upgrade 0.7.11 -> 0.8
Date: Mon,  2 Nov 2020 17:49:02 +0100
Message-Id: <20201102164907.27572-75-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{libcap-ng-python_0.7.11.bb => libcap-ng-python_0.8.bb}    | 0
 meta/recipes-support/libcap-ng/libcap-ng.inc                   | 3 +--
 .../libcap-ng/{libcap-ng_0.7.11.bb => libcap-ng_0.8.bb}        | 0
 3 files changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.7.11.bb => libcap-ng-python_0.8.bb} (100%)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.7.11.bb => libcap-ng_0.8.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.7.11.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.7.11.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.8.bb
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 6d6fa644aa..3d25b4cbd9 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -11,7 +11,6 @@ SRC_URI = "http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
            file://python.patch \
 "
 
-SRC_URI[md5sum] = "5883ed10b621c87e29a05cff36d2928e"
-SRC_URI[sha256sum] = "85815c711862d01a440db471f12fba462c9949e923966f5859607e652d9c0ae9"
+SRC_URI[sha256sum] = "f14d23b60ae1465b032e4e8cbd4112006572c69a6017d55d5d3c6aad622a9e21"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.8.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.8.bb
-- 
2.29.0

