Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.26556.1621876575397000785
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 10:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LmJX4dfa;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id m1so23890901ilg.10
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 10:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0+QZehCLD0cxturYQTyBuZnGddCpLtbbc5aH3vmJTgc=;
        b=LmJX4dfapDhzcLQhzx8liFwr2o/rXgJvk3TzuSjji6Pd4MfZnAtrbsqXYN5aAjdd5l
         7e1vaOJNmfEB7Yzd7N90S69m/jrMXEqCpP9t3VFOjkR10oTg3Wa4dp5HT8lbPiz91xoB
         WMeIXHcUXczGpQMIsvTIYWo3FPXhcZQ5lAkZDzfIvpWYL06kkgR8jAe0cmHmXVXSf/cX
         4y65n4wKoHdj5LL5s6wfmU8crXHZgGy6ZITGAYjTIuydXKYsu0EMGeX/3E5bCdYWflL6
         8yC4nWLS+rPE9Jh3R9bVQku5lp61WaEgrej40Dt4jC4iP1fHL6EIJPnkXkSBbIsNUcAt
         YvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0+QZehCLD0cxturYQTyBuZnGddCpLtbbc5aH3vmJTgc=;
        b=Mdgj+ac6rJmnRwXBAB5VYfBuzkSjSZGR37Ylo4KQG+5gOiXjRVLpEGx79TnlO6SLfb
         d+q6M7I8Pf+lWbjyC0mxCsv2Uhly7dVBGIiI4drgvaMQw54y0nUsNM0gBeqwqpfUBXvf
         0anJA0khFLvF/X0T5IGIZKwocV4NcCB/m1He7od+v5Q9X9dvy/6c388vosD/S+wsJKMh
         yP2z2AHYb/2CppdNZ7gdpmMDWZMB8GUj+KWdkTG1/HP5MKh+n63sxr/VeIdQyIqIsoOe
         +Z3IZJ8QjzrM/iYBDtBkWRE6NZzz0cuhR4oclBH07NR1OzWuSikNLUVD0p+Yn3mQFNVq
         DeVg==
X-Gm-Message-State: AOAM530MHA+7nxLY8MUJNFuj4yqNuGR8Wqng3Ax4QVjQqF0zorge3ywI
	mTz4Ptrl7ccTDRU2oul+KiFJ1QcWUbOOD9My
X-Google-Smtp-Source: ABdhPJweIf1RJVrMhAP2T2anXlDkEWAuM4raqnBHRxA/G0RH7vhapNtUUkUKB0cF6AMm2yGoc99N8Q==
X-Received: by 2002:a05:6e02:1b8f:: with SMTP id h15mr17193008ili.151.1621876574498;
        Mon, 24 May 2021 10:16:14 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id j2sm11424103ioj.20.2021.05.24.10.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 10:16:14 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v4 2/5] Add rust testsuite for 1.46.0
Date: Mon, 24 May 2021 10:15:56 -0700
Message-Id: <20210524171559.190239-2-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210524171559.190239-1-vinay.m.engg@gmail.com>
References: <CANNYZj-v-hcO19SSkYgYKSeOBj7f1u4zvSRkfcx5UAm=ndye_A@mail.gmail.com>
 <20210524171559.190239-1-vinay.m.engg@gmail.com>

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/recipes-devtools/rust/rust-testsuite_1.46.0.bb | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.46.0.bb

diff --git a/meta/recipes-devtools/rust/rust-testsuite_1.46.0.bb b/meta/recipes-devtools/rust/rust-testsuite_1.46.0.bb
new file mode 100644
index 0000000000..ad758b71f4
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-testsuite_1.46.0.bb
@@ -0,0 +1,3 @@
+require rust-testsuite.inc
+require rust-source-${PV}.inc
+require rust-snapshot-${PV}.inc
-- 
2.17.1

