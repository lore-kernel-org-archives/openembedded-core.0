Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.7072.1588683743400680534
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bBMK5Afq;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id k1so2661249wrx.4
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AE/2OZWPQEsWc4/ipw+xMJ17ev2xEUsKwKIRUCbKTtU=;
        b=bBMK5Afqjf2itOJZOkVllqEdRD779/XMUQfsw/lHeclyt7lHtzP5YUkaLkYZJw6Z3W
         1NF0FethNXUk852czB8oY6E79GYxNkH0ch6LfVIrPDMYNQjKn7wzxn/87MmpOYvcXvYP
         R1FmsTbYCagvCndzzEnfwxmgBnodp0JL2+1cAJDZrJkgTQe6VQqpjd3ROdGouOTIgJGP
         RO8psX2OL6/Cnxe818bU1xBS4gucc4YuQsHHYXesOJalUyHDXbo3NDfl5D0i+fIhscla
         tnBTkx5SS+tOBTgSykfiD5ofvW97GHzAa+AHAjxm09kpQVYoKXYIb1EueKpgU8puARip
         1EwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AE/2OZWPQEsWc4/ipw+xMJ17ev2xEUsKwKIRUCbKTtU=;
        b=T8xHmaK99yv/+3K7QJWO1FFM8sLBrfdInKNliGCnyTO1wQW+ZuUG8PoYt5vPSzjVoK
         rGRDkd+5dmigOoFx1OMTq7W6w/r5PqTL15OQ8dSWfV4vg0tZ9Ky4R3mx1egR1JETor58
         s0CJRidv7P/1QwnyY8t8T0goLLGEn8uuR879Em2XEFJrgXVhBEene6OEGKlWufbpWcnH
         NQwWZi3su1CSTt7oRK9q/z+a5vq7NGO30WkafofbhP9fLQLZtkHteiMZi4rf6Ya61g3F
         elrlMPzRDmXpYOQEj9njTkrKeFmhrSXbtel24PplCFPeUD54o2batkjoavhI8iQQWUDp
         1iLQ==
X-Gm-Message-State: AGi0PubjsX1Rcn4zIC3xXr8FHeBwggq45+K/BX2zdMdXY+u6z6rBu5/K
	J0HshKNZ0aCeM6CaHJP61tscrfv8
X-Google-Smtp-Source: APiQypIpBzFpbYMYaPu/CpR5+BuhEfYtJBkYi6Yv2UcuUUUkegqQWtZVYLR5RZwkOkR6Zukge6g4Ew==
X-Received: by 2002:a5d:6a85:: with SMTP id s5mr3608103wru.122.1588683741846;
        Tue, 05 May 2020 06:02:21 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:21 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/24] cdrtools-native: fix upstream version check
Date: Tue,  5 May 2020 15:01:31 +0200
Message-Id: <20200505130133.24930-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index b568bb39f6..c08da6cdca 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -11,7 +11,6 @@ SRC_URI = " \
 	${SOURCEFORGE_MIRROR}/project/cdrtools/cdrtools-${PV}.tar.bz2 \
 	file://0001-Don-t-set-uid-gid-during-install.patch \
 	"
-UPSTREAM_VERSION_UNKNOWN = "1"
 
 SRC_URI[md5sum] = "7d45c5b7e1f78d85d1583b361aee6e8b"
 SRC_URI[sha256sum] = "ed282eb6276c4154ce6a0b5dee0bdb81940d0cbbfc7d03f769c4735ef5f5860f"
-- 
2.26.1

