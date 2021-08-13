Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.37286.1628865086038185910
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 07:31:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NNBHaVED;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id oa17so15533909pjb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 07:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=F18XJ5xEtk0pyD9L5dMofoMZz63iRRIVz3xpSo2VjQ8=;
        b=NNBHaVEDFwq9OGHlUAZE7e9g/YSgalKKkO4RoegkiFRpGO4x+O5xB97mO53t56u7/S
         5VUj8CYgnEYQFEg4xwng0WVkYhDvVXqfy6Gbxs8yJ3OxYPjU2baSSF9WUp1SwD6/pilc
         zYFHCruvP9gmbqGn3OJDX2p+QgaLztktog5gRjcN59fM10E3wVBfKglApcrfE6BDXNg1
         riLpBdk7kyMKyynZwDAO3sQNgHlArC/7fARs9FGJP2IUqo6VtDxqBeVecYuYVS2y6mip
         rl74/aj2g9+G/z96ym+RpeF86jLw5Pk5/ZPNQsJQPcL/5Yti+gxPVSWZ67lXOlSheyRr
         89Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F18XJ5xEtk0pyD9L5dMofoMZz63iRRIVz3xpSo2VjQ8=;
        b=BWxXYFXEG1bj54Cen4m6jA7q6gBcTNsBxI6YfeOHnOiwQ5JXjW8GeY7B0maz0t3+Xh
         26NI+SSyYFK4R8FY/f0yfcLuHJj19zevNfVoXj0uzxeX1+asvZnNB/NCdHHXQ8DNbCza
         yYpXPR7ZFInqrk6KRdfiOMO+tfmug/JgnunK1yjhQssjGSLD1maRD89T0XaatlI79Wee
         DNIMw1EHHyGBoWNwbF/xv+PlqSiNfzTla5ZKE786okaA+1RJ2/Hz0PbaboeIej9x2cU0
         zZzgCp/QWbRLYRvZevctmu561Ui1lg94f8tkALKDadkJYcKorWOofwy50COC/o3+kmCi
         UtYg==
X-Gm-Message-State: AOAM530FhuRhOkNpiQaIvWtczSrPpMSBX+j7rQxFBDqjNXnGW3PHxWGB
	h7CYeGzmhQZqXPj55v13DmvIKQm8comhJCOy
X-Google-Smtp-Source: ABdhPJxiDWlAMhBi51Jm7D436DQGgdJQYgHpFJzZLMbuVVl+al+L4KkqOmwFdoklnqh2of9YVhCQtw==
X-Received: by 2002:a17:903:3109:b029:12d:3160:a815 with SMTP id w9-20020a1709033109b029012d3160a815mr2240716plc.45.1628865085188;
        Fri, 13 Aug 2021 07:31:25 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id nl9sm2113182pjb.33.2021.08.13.07.31.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 07:31:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/17] glibc: Document and whitelist CVE-2021-35942
Date: Fri, 13 Aug 2021 04:29:45 -1000
Message-Id: <c1d49cee0a3a7391708b19647889f48036d7e4e8.1628863869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628863869.git.steve@sakoman.com>
References: <cover.1628863869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ralph Siemsen <ralph.siemsen@linaro.org>

This CVE is fixed in the upstream glibc-2.31 branch, and dunfell already
includes an update to this version in commit e1e89ff7d75c3d22 ("glibc:
update to lastest 2.31 release HEAD")

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc_2.31.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 23242fff76..8742efc36f 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -18,6 +18,16 @@ CVE_CHECK_WHITELIST += "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-1010024"
 # Potential patch at https://sourceware.org/bugzilla/show_bug.cgi?id=22853
 CVE_CHECK_WHITELIST += "CVE-2019-1010025"
 
+# glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35942
+# The wordexp function in the GNU C Library (aka glibc) through 2.33 may crash
+# or read arbitrary memory in parse_param (in posix/wordexp.c) when called with
+# an untrusted, crafted pattern, potentially resulting in a denial of service
+# or disclosure of information. Patch was backported to 2.31 branch already:
+# https://sourceware.org/git/?p=glibc.git;a=commit;h=4f0a61f75385c9a5879cbe7202042e88f692a3c8
+# which is already included in the dunfell branch of poky:
+# https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=dunfell&id=e1e89ff7d75c3d2223f9e3bd875b9b0c5e15836b
+CVE_CHECK_WHITELIST += "CVE-2021-35942"
+
 DEPENDS += "gperf-native bison-native make-native"
 
 NATIVESDKFIXES ?= ""
-- 
2.25.1

