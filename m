Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.12137.1620737502230525286
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 05:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V9xEOWV3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 82-20020a1c01550000b0290142562ff7c9so1170519wmb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 05:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fydSEZhZAEJ6dmHWaKDKEEV1n5TIkUCsECA/mNQCYQc=;
        b=V9xEOWV3JYAX/PMjztiP+tMg3uc2I7308+nw2+RtFnodsq5Qx7s7AamE8I1clnmqjh
         nMslRRIr+R6LuGKw4jUqgDjOd0oInP+7NBZ+dldA/A4qD4eyD7RDd6cGGka4AtUMNxEA
         1f+bykV4RF5GQdxSQdyyVMA5FbFEoHWkX+zOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fydSEZhZAEJ6dmHWaKDKEEV1n5TIkUCsECA/mNQCYQc=;
        b=ccKprfw4l616w//fiaHQkcBG/0Wk0iPE3S+fnh+bYyZFjC6LPUPj5lJkjfJvtI4AO9
         ptw3tiW6s9L+ClK7g0hKFMXkRvytYfY1LG5IdEuSwI4Tt82VpMp1i7LbC4poECBeJUlH
         FUGmueLkixfu89VNIOc3EQgzzH330mv6g9ul3Vm4ZqgxaUWFspxM5JEMe3aHIKbdedPH
         hbXginq6wcAiiPcgbdrIsMa7OsVj+V4gFQzLxfkf7p691y9GeZVHsDBQAWUU9JFTsFao
         eoOyffj9Ccj4ZXkZ4TN/sK8qE7fdJZ+5CXlXncLyGpWIteSO64KEk1aAsObgPsKF8WAa
         Hbhg==
X-Gm-Message-State: AOAM533pHLSVQ+nznN2GMdhrfKC8t9oL6mAzeKtIbhKxIH67HUOkF51C
	fIZpLn8DTzN8KrXozXrAZliFvaxqk3VvPA==
X-Google-Smtp-Source: ABdhPJwnuFenIvL6NKI9x8eC9nyOzfgehI83hJbh/tR041uQkuncNOLIooti/nK3eg51uR7Nt1VOJw==
X-Received: by 2002:a1c:f404:: with SMTP id z4mr5433064wma.39.1620737500812;
        Tue, 11 May 2021 05:51:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:29c0:3873:464b:b647])
        by smtp.gmail.com with ESMTPSA id y14sm27119099wrs.64.2021.05.11.05.51.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 05:51:40 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] openssh: Exclude CVE-2008-3844 from cve-check
Date: Tue, 11 May 2021 13:51:32 +0100
Message-Id: <20210511125138.2232637-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511125138.2232637-1-richard.purdie@linuxfoundation.org>
References: <20210511125138.2232637-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CVE only applies to some distributed RHEL binaries so irrelavent to us.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssh/openssh_8.6p1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.6p1.bb b/meta/recipes-connectivity/openssh/openssh_8.6p1.bb
index 57ad5e841ca..e8f041c58c1 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.6p1.bb
@@ -34,6 +34,9 @@ CVE_CHECK_WHITELIST += "CVE-2007-2768"
 # and when running in a Kerberos environment. As such it is not relevant to OpenEmbedded
 CVE_CHECK_WHITELIST += "CVE-2014-9278"
 
+# CVE only applies to some distributed RHEL binaries
+CVE_CHECK_WHITELIST += "CVE-2008-3844"
+
 PAM_SRC_URI = "file://sshd"
 
 inherit manpages useradd update-rc.d update-alternatives systemd
-- 
2.30.2

