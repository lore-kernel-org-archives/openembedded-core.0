Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.27711.1628536226059490696
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 12:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Dn5WBWPb;
 spf=pass (domain: linaro.org, ip: 209.85.222.176, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qk1-f176.google.com with SMTP id a19so19604670qkg.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 12:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NPMrIXKbCNEwiE/Jr5nkbfN32WNemM4ZQSUmG08zAeQ=;
        b=Dn5WBWPbCI7FnpizxVoNqTov3vbOosWiv60ISDG9/9UPmF6SkGEAza5UZA7AUjTt2G
         hoMwrvyzhDXliDbcYMTundevZPdGL5RJAXMlDVtsZZZGxmLwo+hq+vWv3/n5v1bFguR6
         bBvA7km/M+omlsJo20yN84fgWekU+PdQkVS5g4mOu1/h7hlp1xdtEzqrYtPAjypkKzPv
         nuOFDhmTjIox2WLvvVZ6x8av4VDXTz1jp/JFMDQXTUDoEzZxrjx2rUFJPA5XQRFC6YRG
         PmQoYA9hFR5ourzP8gvASsEs23e4a72bkD83WKZLuzNPdip1Dhy5gfHxTKmkOsAJypOS
         EJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NPMrIXKbCNEwiE/Jr5nkbfN32WNemM4ZQSUmG08zAeQ=;
        b=KgKaeKhAs2XI1nFnqhDKKMwrxm4CltROTSy8RNDOedPbB7Cd5Y+XymP0mR93hAhtFi
         Yrypxnvd4sXv9oH1cWf98xrWkeoAI+j3Fa+s0kdufhHi8VGc7AWoyYgq/E1PNxs2CwcP
         /LGYRrqqVNN992kIPBNdg75KYW5NvZKWTMiYQGMmfCTqvYfe0HUW+smG2xslajsxzrrD
         kQnknfOFTgZ08j984+Ge+G2X6ReIt11mfiF0ZhWo2dePrcFk/uR+ZJ0vm+/9EV2yfyuA
         N8jrVUmF8EjBCiRmRg9b54YQ8eNOplkNvBe9erbZ6ALfDvolthsWgC+HpNaR7qTJnB7o
         dFfg==
X-Gm-Message-State: AOAM533kIPCB8I26bR3ozQKPGHfGLe1BqiHDtTWr4SCAnEJnzqyYXXb4
	x1sjHdeIBdBL21OaKH6e8egzYjkMf3ESQzMw
X-Google-Smtp-Source: ABdhPJw1SCaApR0XiTJVzx++ke1DQmVPCcAPSQuiynx3gKr8bPs7ODlQVpaAEcMg0dce34BFm7vH5A==
X-Received: by 2002:a37:de13:: with SMTP id h19mr8200469qkj.441.1628536225226;
        Mon, 09 Aug 2021 12:10:25 -0700 (PDT)
Return-Path: <ralph.siemsen@linaro.org>
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id d138sm5577439qkg.100.2021.08.09.12.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 12:10:24 -0700 (PDT)
From: "Ralph Siemsen" <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH] glibc: Document and whitelist CVE-2021-35942
Date: Mon,  9 Aug 2021 15:10:17 -0400
Message-Id: <20210809191017.373636-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This CVE is fixed in the upstream glibc-2.31 branch, and dunfell already
includes an update to this version in commit e1e89ff7d75c3d22 ("glibc:
update to lastest 2.31 release HEAD")

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
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

