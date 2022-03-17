Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B04C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:09 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.9377.1647518228425926221
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BvaaddNm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id t11so7035876wrm.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ljM4OsPYc0Qe5XePt3Stx62q8/omkOAj7KLzQ9vAHP0=;
        b=BvaaddNmzyaRIAwrZNmlLd6g6+CvLqzW+Fr76kvilcP0MWWgOXTG47rrM/Kc30nS6P
         zr37aMoPXYl2Dg9HS6vJ/e85j+G5ZhEZaKb7viCYHQdB2TAROWMDucF9EWD0oDBII8RM
         03bH60cT3B1BP2H03d9FPHaUG1FWldwj79PsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ljM4OsPYc0Qe5XePt3Stx62q8/omkOAj7KLzQ9vAHP0=;
        b=WfDxIEfEZqFbySfCeTsqnf94gyxNTgpMYeL92xtj9AtwaRYHuRJIVhA+NtyaD+lvuA
         9CDY5sJ6I2tn0pjPQci8hXzeHIZ8wQN376cDbLTyIC5t0SnV08HvOB+z921HTr8PGUEi
         gzDR7p4qHgc/rPkVHaioF79u3NpRImOZ9R5qcYbdcXiNh+8DyRoPVXmmb4H67YMC0qKx
         xZvS+QWFA89SRmOF6bcSrJxev5oP3lxIZQZdIJgVfLHyl8pq1p+i3l+NFID9Ubxnnpbj
         JD4z8cAnupoebCAuP+8hgK3Lj8biOqfhzA6clJHnQUDbeO0ezSbZmS8aF0yfeFzK3SDW
         L4kw==
X-Gm-Message-State: AOAM532A8+Zv12Q3T7adZXO09YwpwwN1YhBC0Sgl5/iUak6G3A5kLYxU
	PFo40xEWWerodvD7IQv0PCV9ig4iX45vyi9S
X-Google-Smtp-Source: 
 ABdhPJybEpjXDMUv8TgnWQQfMT8g/tT+O27HcvBJxlwigavwGZfv+n/RPnpPC9nzH6NmcIbOqfFhAQ==
X-Received: by 2002:adf:fb4e:0:b0:1e3:3e66:d5f6 with SMTP id
 c14-20020adffb4e000000b001e33e66d5f6mr3824784wrs.615.1647518226718;
        Thu, 17 Mar 2022 04:57:06 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/26] python3-certifi: Add from meta-oe/meta-python
Date: Thu, 17 Mar 2022 11:56:40 +0000
Message-Id: <20220317115700.993924-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163392

---
 .../python/python3-certifi_2021.10.8.bb            | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-certifi_2021.10.8.bb

diff --git a/meta/recipes-devtools/python/python3-certifi_2021.10.8.bb b/meta/recipes-devtools/python/python3-certifi_2021.10.8.bb
new file mode 100644
index 00000000000..4c376da8972
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-certifi_2021.10.8.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Python package for providing Mozilla's CA Bundle."
+DESCRIPTION = "This installable Python package contains a CA Bundle that you can reference in your \
+Python code. This is useful for verifying HTTP requests, for example.  This is the same CA Bundle \
+which ships with the Requests codebase, and is derived from Mozilla Firefox's canonical set."
+HOMEPAGE = " http://certifi.io/"
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=67da0714c3f9471067b729eca6c9fbe8"
+
+SRC_URI[sha256sum] = "78884e7c1d4b00ce3cea67b44566851c4343c120abd683433ce934a68ea58872"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


