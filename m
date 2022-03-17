Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86298C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:26 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.9301.1647518245985108974
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DkDgGWFp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id x15so6986939wru.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QzNwbOj8y4yij3esdcuUXxD4IJm9n0BzpXwQgRW2lyQ=;
        b=DkDgGWFpmVJrEjE+9mlDG+uo+srYSuqKvBN8SuziHB1N1N0GDtqYpXg53BJizQF7tt
         n0nNaqdd+u4k0AlzgU66fvQFy2ee/SsnK+pxJS19pdlk4e6dkSkxGcCrzdnA/hz/kTzh
         kr2wVRJhUUgDSOw55Qbzd1DEIrg1jwQqP3j1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QzNwbOj8y4yij3esdcuUXxD4IJm9n0BzpXwQgRW2lyQ=;
        b=QVK5og0NrOrbpJNqo01f3FPDLT1HE7Fp6oO6Rpz3qdpToz+kZmN3gcGg1oJbWnTJ4q
         tqV1lkLBhxPbfnAXTEhyS31yE5nG5gQxZE9UYFX945o3O9oKW0YVCfgHCKRHpzhL8Px/
         gRvwwBcWlxB/hBl44+M73iOQbN5vV+ZsAPacQtjoZicgd14/Ei9ejblbaK5Dc0DqE2vh
         fBE3W6Zom2JCv9qHGXdP2VP0DM+c/DV6XqWX72Cth7Q9vYtjkrX9bnsNCVQIVhs6IEgD
         YahmK8+0tHLt6g8jAcJgHGpvZmRlsghCTN7M2pwVKtIMJlQx7kjc2iD4Y+S2K9LFlXxa
         SReA==
X-Gm-Message-State: AOAM532fR2EtNTibHeCug+ZjghUyZ5MTYPNzipb7EJYOnik4PDnRbOwW
	hOSHlKkd2Wu2y/xlYLgovb3wT2rxSTu6RGwg
X-Google-Smtp-Source: 
 ABdhPJxcHjauDvRz/vwyKoz/X1BYzQZMCFG1rSiH0L1c4qDJmDv31fOzUmb12DFx9Vba2E/3OO83Yw==
X-Received: by 2002:a5d:598b:0:b0:203:95c0:7b72 with SMTP id
 n11-20020a5d598b000000b0020395c07b72mr3843923wri.172.1647518244313;
        Thu, 17 Mar 2022 04:57:24 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/26] python3-sphinxcontrib-serializinghtml: Add new recipe
Date: Thu, 17 Mar 2022 11:56:52 +0000
Message-Id: <20220317115700.993924-19-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163404

Based on a patch from Armin Kuster <akuster808@gmail.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python3-sphinxcontrib-serializinghtml_1.1.5.bb   | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb
new file mode 100644
index 00000000000..71dde37593f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = 'sphinxcontrib-serializinghtml is a sphinx extension which outputs "serialized" HTML files (json and pickle).'
+HOMEPAGE = "https://www.sphinx-doc.org"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=32a84ac5cd3bbd10c4d479233ad588b6"
+
+SRC_URI[sha256sum] = "aa5f6de5dfdf809ef505c4895e51ef5c9eac17d0f287933eb49ec495280b6952"
+
+PYPI_PACKAGE = "sphinxcontrib-serializinghtml"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


