Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.1297.1625540588692405901
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 20:03:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fjTcxIm8;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso866410pjx.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 20:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZEOX2I1PydozsEUV1BcJH+fCbCKGNmOtXNfBjW35iiw=;
        b=fjTcxIm8fw4QDVrmFK8EmenuJHIgtBt2LK2lyYuDHZwEkM/TNy6VqPSgKZKQZeSQBM
         YW+7pS8SzOPyryRB7C4/IcSYh8hwjh512b6YsiPEbXuYHEvbkzNbQPNtkZLzswXtSESZ
         5ZszFJlw0lY/BSTablH5b8PtDl5qx+aq6uMm3zuh8DwikCrojBwvxMD6j5s5/JAaem9o
         jrn5TLxJ5JuP/TpnhcVpQcgRxsAsUshyQHvn6hW7vpsGbHypjoMqJrnf6r02SXoElbNg
         e8BXgl9VBr5RxIAK4SCJkFUONdxPuaAIF5nVazghNDrTt9DY4X17OSk5O5SJlagtb0a3
         qQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZEOX2I1PydozsEUV1BcJH+fCbCKGNmOtXNfBjW35iiw=;
        b=unE3BtdxbznHHvEbe0MEwHN/QcxgS0j01o5wSDLVZ7UNYu4VBUobW+O8mH5RChUSj7
         GvCY6gYF55U9YpbrGriN2h0tpQZy5FKRjGmQv9ysMQC8Y737nh9BqWIbn9QbZjkLcvwf
         Z0lxjB5cMuLWYKrT1gnpc5vlKWVV0Nkep4XH1o7LpAZjEpp2CTir/JfXjTDbP5ASZWKg
         ievv9QDNaDitO2QWgRcC5+sWt2pxmBgI4GjPE9b/8j4TdjTDvAOmo0HhjUTPJiz9u3Jd
         5GmIWbDK3OZxuXiqnLL6J9/hm0ade4MgdZMQe8K+bHQNgSAiAoM1zyGMydBxOTA7a/pE
         a3Bg==
X-Gm-Message-State: AOAM531cg1tAoHmoTy/6XfnY2ANNPA81d1i83QFVYrRv796fhDOvSlYR
	y7ckz0LN60k4yPrBmEmkLgi9iM6ygHXiWQ==
X-Google-Smtp-Source: ABdhPJydqtwOY06uHNKygem0C/hkZT0TNRUkkcWk+W3wDTIgiWA4m2iV0VxOGGTofjYjYwmsYIXmBw==
X-Received: by 2002:a17:902:9a02:b029:118:307e:a9dd with SMTP id v2-20020a1709029a02b0290118307ea9ddmr14900230plp.47.1625540588090;
        Mon, 05 Jul 2021 20:03:08 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:4baa:c5cf:22ae:7c01])
        by smtp.gmail.com with ESMTPSA id o20sm16000395pgv.80.2021.07.05.20.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 20:03:07 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 3/3] python3-zipp: upgrade 3.4.1 -> 3.5.0
Date: Mon,  5 Jul 2021 20:02:37 -0700
Message-Id: <20210706030237.307204-3-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706030237.307204-1-timothy.t.orling@intel.com>
References: <20210706030237.307204-1-timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v3.5.0
Issue 74 and bpo-44095: Added .suffix, .suffixes, and .stem properties.

References:
https://github.com/jaraco/zipp/issues/74
https://bugs.python.org/issue44095
https://github.com/python/cpython/pull/26129

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../python/{python3-zipp_3.4.1.bb => python3-zipp_3.5.0.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.4.1.bb => python3-zipp_3.5.0.bb} (77%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.4.1.bb b/meta/recipes-devtools/python/python3-zipp_3.5.0.bb
similarity index 77%
rename from meta/recipes-devtools/python/python3-zipp_3.4.1.bb
rename to meta/recipes-devtools/python/python3-zipp_3.5.0.bb
index 191d3b38ad6..ab12601e4e9 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.4.1.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.5.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[md5sum] = "3d91c7ab73b62ac3674210df94df600a"
-SRC_URI[sha256sum] = "3607921face881ba3e026887d8150cca609d517579abe052ac81fc5aeffdbd76"
+SRC_URI[sha256sum] = "f5812b1e007e48cff63449a5e9f4e7ebea716b4111f9c4f9a645f91d579bf0c4"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.30.2

