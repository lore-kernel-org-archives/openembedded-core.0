Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web08.639.1605893406909027594
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:30:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d9BUPp3C;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id q10so8527022pfn.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8KToqGiQHO6tB29HaJC05Ngd3ur4iZRzRyp6NTxnHmE=;
        b=d9BUPp3CC3VqBwRiQTm/0pT3g/104hIeQqenJTOzZjHhZbkYDcJ7j9PawOhG0x3my3
         EFpIS4Lfortyj84quDHspjLh8BJ0sglZq3MlQFc6nuu1jtsBsR2P41zbbPDRiApbSy3x
         apdPXEZspuYXuqEAJifqcqS/tVUo1T/biJ+n7s6xtB/76nazcV0LCJQJszmrSaAAMJUN
         ZWz9Wk6pd8MLjMToxQmBvuF8jLggoZ+T7MYx8mvIEtpi7uv9UC9itjN1t+WU6EnP69FO
         owV9onfpjfjoh/6PyuUYZWvLYA4vdH08bQ6EyI1lR8J+GTdzAE+8gd7L5A6q36ACkmuF
         uu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8KToqGiQHO6tB29HaJC05Ngd3ur4iZRzRyp6NTxnHmE=;
        b=SST8mCVuuu4MBYUXxWStRbmP7iHXiAO+mKHQs1JGDeu37UylfFTkJ9fIkxbuHfhOx6
         KaWkDe/lSkEPAMYUdHQy5uEhUanH2awpRldRSYlUl9hsTVCYFG9JN9y6yYPCaJ00a5MO
         nS7uHeGTG9y0JRr8k3xnOmrwGNl0VXqxx2/ukpz1hnCV9oQn75ETC3mLfxjpBffR7Pek
         MvpQDjo1dURf5/dQuxgInSXli8oSGXfo1BkBA8JrzmrlfPlQSBUpVD6pK8vldvQNv540
         I/Mz8SchRi1ycVPRukC3QDwz76e/Rm65p0rh/YYzntubSXUGTEi3Ha9gaGghfedO7LJT
         jEuA==
X-Gm-Message-State: AOAM532HheaDV6i0a0h5kyX5vLp1buO9JbS2OYEyDjF9m0dNdBvLK7U1
	Ek1JJPPxzKLq/zFWwVHk39funSncEX/iWw==
X-Google-Smtp-Source: ABdhPJxqAKoJPNFxc47M2L8V60nytr3tg58pPlsNLbhM3xDZqFHSH6m0VfNst/pU3UZc2OpGN8Lj5Q==
X-Received: by 2002:a63:1d16:: with SMTP id d22mr18355750pgd.335.1605893405747;
        Fri, 20 Nov 2020 09:30:05 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id x61sm4855684pjj.4.2020.11.20.09.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 09:30:04 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 8/8] python3-pytest: Upgrade to 6.1.2
Date: Fri, 20 Nov 2020 09:29:50 -0800
Message-Id: <20201120172950.1619754-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120172950.1619754-1-raj.khem@gmail.com>
References: <20201120172950.1619754-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-pytest_6.1.0.bb => python3-pytest_6.1.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pytest_6.1.0.bb => python3-pytest_6.1.2.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-pytest_6.1.0.bb b/meta/recipes-devtools/python/python3-pytest_6.1.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-pytest_6.1.0.bb
rename to meta/recipes-devtools/python/python3-pytest_6.1.2.bb
index e3e65986db..1b5139ddee 100644
--- a/meta/recipes-devtools/python/python3-pytest_6.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest_6.1.2.bb
@@ -3,10 +3,10 @@ SUMMARY = "Simple powerful testing with python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
 
-SRC_URI[sha256sum] = "d010e24666435b39a4cf48740b039885642b6c273a3f77be3e7e03554d2806b7"
-
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
 
+SRC_URI[sha256sum] = "c0a7e94a8cdbc5422a51ccdad8e6f1024795939cc89159a0ae7f0b316ad3823e"
+
 inherit update-alternatives pypi setuptools3
 
 RDEPENDS_${PN}_append_class-target = " \
-- 
2.29.2

