Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9043CF428FF
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:54:20 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7105.1776318856077009431
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Wc6eAW6f;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b4520f6b32so8500999eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 22:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318855; x=1776923655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+NnsjPmcTNCn4c9JhVzJEF5ydyRcAPMQ2z/BP+Nv7g=;
        b=Wc6eAW6fILpsSgiWI3kqPGaf5/lNGH7SoTjWrUXQLEazkMGoCFQQ1xYMFpPaEo4hAL
         sywSBSY7DhYXt8VqjjDYNdBz7eU1kNK4kvzDKBXTSKKPPRqS3c2CogGE3zQaq+3C8A6+
         YW7zRQT0y/SXFyFhgzzNZQ5igiJX6yaRd8zVFDNXpAhWQEohAKMW4WBlilkgePUBRU/k
         o9LlyI6B4A+dd7ka6RpYXXQLgsdxUxc+Cjq1yPjyqmd22yOafgkcQzE3hz2EcViFGjzl
         uAJqu2KRxxmhyvIKuxivjTa6hSxMFT/Njylwp72xd3y7HqPTnybUaYAMJpIXclqK3njY
         wgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318855; x=1776923655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W+NnsjPmcTNCn4c9JhVzJEF5ydyRcAPMQ2z/BP+Nv7g=;
        b=f0MHucRu9lSB+xW8cnOBhp9xOage2IkXFSPMJ8cV27ebpNGEOI+wj6drVPBXRLIQYO
         VCBZvUF1px6wBtMDsa7pGty9DKlXjIdHXangT5PEd+M2eAB1HsmXI33TXymfTevhaiKX
         5RoNdRXMtKIb2FbuZl+u7GpvtVV1KvJ9ousa6qeY6OrGRDMKKQenVXxcQB6254I6AHXK
         tT5ou2o2cn5FSpQ5IZCjIZcUvj05ktDld3UYldSeAklRmLWyvOw2e21zq9H/+U6cIF9T
         hLAjwZ5AWBvrq6KKDBjMfOIIJRF5mdvf56lITjyr0F1lyyuOzjtTZ0jnr77S2R17/dmD
         9X+g==
X-Gm-Message-State: AOJu0YxR+oF/sewYXFsjalubsYA0o1FMIE6R2ehAJIXSwlXXGNnuQIz5
	wCeZ6eisKVklLD5+4sAmiAGipyaF+FFCGdqC8sRB3dr8RBOYdMt6RQLXwc+eL/nl
X-Gm-Gg: AeBDieuwUzSW2JFP7noWM+GGc5VS6mWzShOcbuIcUGxYBNjN0iz55rIfEQUzICS3JtD
	rQt5aIv+Cec+vnAsca4GM1+TLJ2FNg8nNgsUSX9KlmfVfH43DAlDmmVgBu0Dh5JWhGa1Xt5ex1F
	Pt9mgGMhNPdQqzINvq6z1Ud+mqiYORGeK12cqtYsfTkQ9y39HqVFoeV1IXg7kAA//qIRIXW3FRD
	s2cbVCpHFXw9PJnFo1odP+QokGL+MFjt5DB6XDC7pwXPX4/Yub914FaZPwjgrdZ/D0N/nWCckIk
	NEOJajE6pFUFIsL/wPNNRH7UVxjY7WJn47tmthpP+e1yDWmo8LMGZ1hDCT/djFgzeQXj/KyIyD2
	uVSnXlN6U7Npd0QNBx3BCwi5GwCxQBL7xj6q9gkqJJHyJHaXTDI7WzTFEECMsdwr8Im+CR9lbxU
	m8FOn1PcRSGEko9h4f2vbPQeBmlz0eIjHYzsdrcUaNd+kVCVP0gCTV9YO/NssD314t/gv2UKAOG
	H2xcYM0yiuzuf7pvf9ax/XyaAIN1dV1Uly8SHnQi6Ao9kHpDAgG14PuO9LPRj/NhEmXL5nXidpe
	ZGQuPFE/UF67dAFnSVXO8H9hXyiPg6HvlpH4bKMaO2oLVYqyraE=
X-Received: by 2002:a05:7300:6d05:b0:2dd:8ac2:9f7a with SMTP id 5a478bee46e88-2dd8ac2d269mr4919857eec.11.1776318855135;
        Wed, 15 Apr 2026 22:54:15 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb8443csm6060212eec.14.2026.04.15.22.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:54:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 5/7] python3-lxml: upgrade 6.0.2 -> 6.0.4
Date: Wed, 15 Apr 2026 22:54:05 -0700
Message-ID: <20260416055407.795016-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055407.795016-1-khem.raj@oss.qualcomm.com>
References: <20260416055407.795016-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 05:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235337

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/{python3-lxml_6.0.2.bb => python3-lxml_6.0.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_6.0.2.bb => python3-lxml_6.0.4.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_6.0.2.bb b/meta/recipes-devtools/python/python3-lxml_6.0.4.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_6.0.2.bb
rename to meta/recipes-devtools/python/python3-lxml_6.0.4.bb
index 876fda93b6..1257534c0f 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.0.2.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.0.4.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "cd79f3367bd74b317dda655dc8fcfa304d9eb6e4fb06b7168c5cf27f96e0cd62"
+SRC_URI[sha256sum] = "4137516be2a90775f99d8ef80ec0283f8d78b5d8bd4630ff20163b72e7e9abf2"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3

