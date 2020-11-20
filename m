Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.640.1605893396525059326
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:29:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BvT/F0Iq;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id x15so5207188pll.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=67ukrktebSLodjsYZNQKijmgx+mwHkjafFSS6oSlFFQ=;
        b=BvT/F0IqVxpPnEqiVE+PLuISGjimmDEOVJkHU287cDMUUQubArQGVBIvIUExTCrnzu
         i03MdIg3CJx2vLAKLbPlFrzx/4I6ZFcM05oyf1Zlz5Q9pI5gvQ7azLnrNDUR/zFjr86Z
         KRaaPw53bfXdyzkG+Gv0dUgwG/J5VfxcUxF8jv8ht7gTzadC+BXAjwwK95bt4zP45RjS
         YHLz7AfrAQZ7kV8GZGbdXnkX33fKDbsK4I2FHoltLU9eX3wRPGTNswPfjzovpKd6JpVp
         uafaaB2RJt9jkSG74Rza0L7DlBZIt77nTtr7SpcoqdvoJtQ0bRdSpIQ/TsvrNRchV4Pa
         2lsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=67ukrktebSLodjsYZNQKijmgx+mwHkjafFSS6oSlFFQ=;
        b=iXjXILVV+5xpE6/OaBwIzAvbqIHQnhSkLvPyBQ3ufKbdgdwcdjxRiOnZNNHg1sn1CG
         Br6LZYshsATQAlhqM3oyqMqnrXbNNWVgo3j17mKkfJNLU6y7JD0+u/im2l1nZ6iiWM8w
         XmIqJ75jZetUd3nobrf8m+UIWlKSu/X+glSrFP/A0bZuqMEMFT5WBY5LG58Y7IZexC6I
         deEukDhO5j7AgmQ2aGR0SPSZ9rjmoGDmsifg7XBL/hZO/cqGzi19ybgX4nQsUsbyMsOH
         lqWR3xYxmUUbVT8T+hRzgtdu1CEyiMpt2lnIwV9bi04pkjiQf4oqc6E22f1DazvFAl4X
         m4gw==
X-Gm-Message-State: AOAM533XtEevIlFh+nhN+QN1P7NbRedq+2PLMxgC/JHexG8fEspd2LdP
	Ow2fIxLaj9t5wYP1cIE84GKj9eYEHM6Big==
X-Google-Smtp-Source: ABdhPJykECKzIsCbkjUJYss1DcqaVxK8Mw1QcwvkKCMxXXq5dYDM3weKjEL5FBLsiYvpRIIRiAV1uw==
X-Received: by 2002:a17:902:10e:b029:d8:d11d:9613 with SMTP id 14-20020a170902010eb02900d8d11d9613mr13931544plb.26.1605893395684;
        Fri, 20 Nov 2020 09:29:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id x61sm4855684pjj.4.2020.11.20.09.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 09:29:55 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 2/8] python3-hypothesis: Add recipe
Date: Fri, 20 Nov 2020 09:29:44 -0800
Message-Id: <20201120172950.1619754-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120172950.1619754-1-raj.khem@gmail.com>
References: <20201120172950.1619754-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Its used in many python packages for testing eg. numpy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-hypothesis_5.41.2.bb            | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-hypothesis_5.41.2.bb

diff --git a/meta/recipes-devtools/python/python3-hypothesis_5.41.2.bb b/meta/recipes-devtools/python/python3-hypothesis_5.41.2.bb
new file mode 100644
index 0000000000..d6b85089d2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-hypothesis_5.41.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "A library for property-based testing"
+HOMEPAGE = "https://github.com/HypothesisWorks/hypothesis/tree/master/hypothesis-python"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4ee62c16ebd0f4f99d906f36b7de8c3c"
+
+PYPI_PACKAGE = "hypothesis"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "f8c281355aaba1da696e40f1488c2bb47c42660424f5750daea45a85e2d047b3"
+
+RDEPENDS_${PN} += "python3-core"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

