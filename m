Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web10.68489.1600110287227866385
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 12:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CovtXXlv;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id o20so358218pfp.11
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 12:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rIayEuEHw0P75W1SKgGYYFtcmBG7oWrLrgAAkOY747Y=;
        b=CovtXXlvYfNn2Qw6eo7A2P+rCc7jDcuwa/+NOKCXSV74ND8QFoa3k1kzwaXIcYKObt
         CZFl0tftf3uvORFFh09R7uEsNqpayXEmYo8pqAsEWadhAZp7d87N9NQUQrFfoVsN3UXZ
         5YG8asw1Y7ybBhgrOqmw28yugpjlhPfYwsAFK0ZR37PqffdhI3YLe/EmOR3Loo7srOri
         10Lwcu8qci2ln9hEqrAk4/+v+XWrjeB/AslX2tiKbH4i/HoCPffW6gvPXcRS0gXtqWKi
         GKIW3pHx8V0s3C+2zUo4qLyw5WWRdqVKZZrvG5iq0uJJkVyzp+dT1NSYwmH34QP0x1YW
         QZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rIayEuEHw0P75W1SKgGYYFtcmBG7oWrLrgAAkOY747Y=;
        b=due2k+iRNE6esj+ZJMS5pfiwgCxqu1KmYklqI29R3wZxUtoxyFvQ/NFefVOGtwxqiQ
         HFsrggBhm+HSgpFuv/htoFq+nYDSnaztjTQHVEKYssFeRx/fkzCYimC1XxuttrSausYI
         AUImR/hXOAw514rfTIVRGd4FW8O2ZE8WW81822A0Jq0d7g9/8HnsT6ImfKqyef7GCslb
         7zbj1E/AxftC95QkJGjUymzBNQf1HpBaVgUU/y34d6d+unlwnk9Sz0TjIkwd/c5ddMuu
         qtPs4SfeZBRMZDcTCSut2Pxwlqa5RmO5UZKWuTOs8HK6Q6Sq9DViB12ylLsZDBk0CDgD
         4HNA==
X-Gm-Message-State: AOAM531z/eDdNgzihgr+w7HLkU5F1iF9xh/qLLSKVFUSL02Np9/Pud/N
	6zdionmvsH/7rm9gDpLnosRHizlcan4FRA==
X-Google-Smtp-Source: ABdhPJyXrAOVgU50+JUgeL2DqD4PATghCjx/olc+/cP+oTP6EIuduRPIzcIKXY4QkIkT6XaXGajU9Q==
X-Received: by 2002:a63:6605:: with SMTP id a5mr1256609pgc.252.1600110286055;
        Mon, 14 Sep 2020 12:04:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1759])
        by smtp.gmail.com with ESMTPSA id i187sm8975609pgd.82.2020.09.14.12.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 12:04:45 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Andrey Zhizhikin <andrey.z@gmail.com>
Subject: [PATCH] bind: Inherit update-alternatives
Date: Mon, 14 Sep 2020 12:04:42 -0700
Message-Id: <20200914190442.1742418-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We are setting u-a for nslookup and it won't work unless we inherit this
class

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>
---
 meta/recipes-connectivity/bind/bind_9.16.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.16.5.bb b/meta/recipes-connectivity/bind/bind_9.16.5.bb
index 07efafde70..103192490a 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.5.bb
@@ -25,7 +25,7 @@ UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
 UPSTREAM_CHECK_REGEX = "(?P<pver>9.(16|20|24|28)(\.\d+)+(-P\d+)*)/"
 
-inherit autotools update-rc.d systemd useradd pkgconfig multilib_header
+inherit autotools update-rc.d systemd useradd pkgconfig multilib_header update-alternatives
 
 # PACKAGECONFIGs readline and libedit should NOT be set at same time
 PACKAGECONFIG ?= "readline"
-- 
2.28.0

