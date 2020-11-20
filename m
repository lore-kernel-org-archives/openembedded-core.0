Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.631.1605893269881745931
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:27:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OEuD0o6A;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id i13so7838666pgm.9
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1c909Pz8J3NKd+H82C27mQJFSyiCj/LEVJVRj79zpH4=;
        b=OEuD0o6An6wJKkdjTkYfKbv0qWCoqHrh8NG3w60ZtKi8dNnFe6zeKou++Oiizpjv0+
         t+rfwEaroWEkQ3NbIcefuZyaPVKlghJtabft+R5mz8qfSrwo7Jd4YfCJYmV+VTtonjtK
         krVw2+trtfnsNBWCpghCXucWMmecKW1S5wQS66Mm+74jWvVxXkj3lWE6HzVkNt9cajq9
         tAxjlZJh2qFVZZCenPEjyHrxHJr9iI/iSKGrEQxtU95xlMrlqSWayh+dnyQYekV1J7qH
         88jrlJSezQPAW8RU/4MUjp8EZNkSl95NAtAPtHpBGMnnq8I08hrOH0AfS1xwudcuKddg
         DqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1c909Pz8J3NKd+H82C27mQJFSyiCj/LEVJVRj79zpH4=;
        b=trv6Q/Zv7T1NFhv4gopH77MLNvf3aZ7xRZEhBvLq4HBwelZbyCtx2FTOUCqagYawUg
         uxzYCkIS/b8VREGtDPLlUT+VFr3mgv6lqT0B7JZsRUbQacN0lfVOcB0KsxXPyMQlXd+J
         04GO2JKM8X4zxsJduXmPngU0jdIF/O15eL4VrNuxSkDVzW5ZjP1q35HSONFo/lFQ2MvP
         K9CZ3HEDk6zeHEf2ZmsJXFhhImRi5FEINN1/JI7MEMOt4YC8fjTPLSB7WfRdXhKoz+1t
         Tf0SXDr+8FZ5J0+hoo2AsdocoC2+qPIC/PNdtJwtiaXzt8R1wmTivHkL5yxPjPCYwfMH
         KA7Q==
X-Gm-Message-State: AOAM532s1HDNV924h9pHeUIvp2AsJ1kzL65scYSiymwDMRyYLDrpSiV+
	lMw2K4OctFcORltukkK21xfWKNow9aWAYQ==
X-Google-Smtp-Source: ABdhPJycgvuJW70qeCIRgWy/IXHnOCcAP1qFcQyFMrpJneMiFeWtdhELGjeTnJ8LbLMzPGozgmq8Vg==
X-Received: by 2002:a62:256:0:b029:18c:6905:d18d with SMTP id 83-20020a6202560000b029018c6905d18dmr14782828pfc.67.1605893269178;
        Fri, 20 Nov 2020 09:27:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id a23sm4398696pfl.29.2020.11.20.09.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 09:27:48 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 3/7] python3-sortedcontainers: Add recipe
Date: Fri, 20 Nov 2020 09:27:38 -0800
Message-Id: <20201120172742.1594854-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120172742.1594854-1-raj.khem@gmail.com>
References: <20201120172742.1594854-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Used in some python package testing infrastructures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-sortedcontainers_2.3.0.bb             | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb

diff --git a/meta/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb b/meta/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
new file mode 100644
index 0000000000..6060c03723
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Sorted Containers is an Apache2 licensed sorted collections library, written in pure-Python, and fast as C-extensions."
+HOMEPAGE = "http://www.grantjenks.com/docs/sortedcontainers/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7c7c6a1a12ec816da16c1839137d53ae"
+
+inherit pypi setuptools3
+SRC_URI[sha256sum] = "59cc937650cf60d677c16775597c89a960658a09cf7c1a668f86e1e4464b10a1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

