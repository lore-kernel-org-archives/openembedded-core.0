Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.501.1621543752458015384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HNqdh3mD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id x8so18955424wrq.9
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QO9n9p7zpnzL1iQd4KW4POEdWi+eNPUb1xbLi2k8nb0=;
        b=HNqdh3mDjQUcDy8J5tdey179PbfcMm+beG7epp9nLqrv9+TrKpIziF+0aBTfag4QPA
         sCupc60zj528/7W323+5faCmeoQWzunw+66g8HNpGbxxvKaTs5Ylu4ML/aSOwqz4807x
         ijmg2VJvXzbl3Rop4Ij7gwG5sy3wVpCqy1u+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QO9n9p7zpnzL1iQd4KW4POEdWi+eNPUb1xbLi2k8nb0=;
        b=Yo8Rw9/SxAEYBmLNWw2NWfGFnfBFvGdXsNhe4Xof7CfQ35fRNjn7tUFkvVNyZxYvv/
         oJEQnTAUIvPlDw68CRo0BqCVCsw2wwfD4w5AOYna6VifnvjAk8+ebpRrXWd+V+gWvfmZ
         sb7mMXhaCdCuLuGU2PDBSSEi00d67En6HOny/LgdJKS8s/ze5HJZXy0XkgrK96JW5UHH
         mgzmJHcIdxx98AO/KKLGwHbRjcXIdYLY0+54uqSb4hk7VETxIxM/T3ymxXKY/rs0EW6Y
         uq6pnzNy2NJFBTts6GG8tYswRxLTazP6rGTwLZTwgAAYAP2quciesyt2DgqsLKw3+rcd
         t2Qw==
X-Gm-Message-State: AOAM533MlNSEOTyDCq5LWn2oZts5KFmPONe1s3a36ULQNWw2tz30WzKH
	jLc0hcScTNtrwJXZ6yno47LXT0PibFCi1w==
X-Google-Smtp-Source: ABdhPJxHEFmBfoovPgAVDe9vu8DDbb+BW7E1EHIm8Vng0ErztFUIyoVW3T+wofAEDyZh/HpOeH8+UQ==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr6040655wrn.337.1621543750992;
        Thu, 20 May 2021 13:49:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:10 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 14/28] qemu: Exclude CVE-2018-18438 from cve-check
Date: Thu, 20 May 2021 21:48:48 +0100
Message-Id: <20210520204902.2527687-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The issues were investigated and found not to be an issue therefore
exclude from checks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c56f341a5e1..fbda0c91741 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -72,6 +72,10 @@ CVE_CHECK_WHITELIST += "CVE-2017-5957"
 # enable it by default.
 CVE_CHECK_WHITELIST += "CVE-2007-0998"
 
+# 'The issues identified by this CVE were determined to not constitute a vulnerability.'
+# https://bugzilla.redhat.com/show_bug.cgi?id=1609015#c11
+CVE_CHECK_WHITELIST += "CVE-2018-18438"
+
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 
-- 
2.30.2

