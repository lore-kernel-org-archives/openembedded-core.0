Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.600.1605893271965933498
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QRs21S01;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id m9so7859305pgb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rnx3opB6AdqYB6opDQBDWMWAXC6zY1yaZc7/6vQ68FM=;
        b=QRs21S01kFJtcAWGDpjEovTlUnFmPy0r+4Z/dRJ9jsRE+U0QYjf7m0FcYTqYhEDUGL
         tqs9gUOk88EaJGbQgRdRrjLmg9mCC2gS/GiKGyNUi47HK0Z01ktjA4FvXSkSPowJehFV
         HPHmSS9M2rOwsKBDqWmAf3gGzWuzaSFs3jSieNDkUy+CbFkS265+1WcoltdZMbfSDjES
         +rSf7DqF7SmqV17cy4xSTva/Y8TGV3sFxMJ6T60YMR5nOTW+YBU2X3to4VYLWpnTaLrR
         c84O77T+jj6iM4co+qDpOPexhUQmEe/mBlKpfcIrS+gxwAv4FedvK5KzPjakg9illyzx
         IVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rnx3opB6AdqYB6opDQBDWMWAXC6zY1yaZc7/6vQ68FM=;
        b=Jx2C3jlg44MwCzP0M7Mn3u6eb8qKsysxOZJYVZ6R3RK3cFE+E07oTVB1z8NDN33YeD
         sPWn7VaeO/qx+61k2L7fCuJyO4bQxs3FwhUURi9KoIpqK2ySsuBvvCcTuiHAC+AAqCRG
         odcB5KNncn88NVQuu++3TkSurOQWddm+XyNsqtJl8hcbeQ/08SQnnGJwtdGigTRTTt3Z
         IE/ujbDWXn/2ZHOXC5X6M3x97FHEmtVnbF0f/HJ2ux72j3n0tslWeu7QaQ4wqhqoatlo
         5tLM3uoL3klGXsQKTh3tP8/Omhf4264nbAR/e49x+M/L4w1eW3ozl5GGfFf6RONR9lsZ
         Uhzw==
X-Gm-Message-State: AOAM531VmxOUNN7T8H/xayOmQ7XfIfmXDw+lP5SfGDalFzkQ7snpyber
	MuB6ZIHyhFK45HjjQ0+NR15CBD9S8Kl7BQ==
X-Google-Smtp-Source: ABdhPJzVMo0kvAEbcS4AQC+3EPyYxFyXflKC4tEaHfXeI6vh11C3si+TnM6GgF7JzAYnE8SPN2wCzg==
X-Received: by 2002:a17:90a:6004:: with SMTP id y4mr11679580pji.162.1605893271246;
        Fri, 20 Nov 2020 09:27:51 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id a23sm4398696pfl.29.2020.11.20.09.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 09:27:50 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 5/7] python3-numpy: Add ldd runtime dependency on ptest package
Date: Fri, 20 Nov 2020 09:27:40 -0800
Message-Id: <20201120172742.1594854-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120172742.1594854-1-raj.khem@gmail.com>
References: <20201120172742.1594854-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
E           RuntimeError: command ['ldd'] cannot be run

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
index b484e7cddc..e59ea752cc 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
@@ -49,6 +49,7 @@ RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
                   ${PYTHON_PN}-threading \
                   ${PYTHON_PN}-multiprocessing \
 "
+RDEPENDS_${PN}-ptest += "ldd"
 
 RDEPENDS_${PN}_class-native = ""
 
-- 
2.29.2

