Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.29.1613667411096012731
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 08:56:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pr2z2xiU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id a4so1521881wro.8
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 08:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CsfZdNOWDSBrEBPLzBnw+9qTvKQ/q5gofaK4uceVh5A=;
        b=Pr2z2xiU9mIChlG/6W8nkKoradzMZf7UdyOB7KnJWfgdiAK8zSH0T8e6uD7aujYceZ
         4orZOEw5ZnwBBngumrrMxXCxa5lEHoozP9hnUnaF8fy8YF6wwP+BJLs0rMd+h4W7/mA7
         wo6w1tftpwEtE6hEGNKVGo+kb7nz1ujU2snzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CsfZdNOWDSBrEBPLzBnw+9qTvKQ/q5gofaK4uceVh5A=;
        b=gK6qNUjh6zyZUU6BEtiNplApmEKIWwnoHDD2hb3HMTjGDaXONXcxEQFlmNNFYVgI6Y
         0aSxX+DwDalBjsazKL2Ec0APrKwTsPT/FM+S/kR2DR2Jp3Yze7SqcQrMjtOEJudABiyV
         /Oo1u8NIgFw8AE3cbSbaHXvQttSq4r84KyzAPPeg5pPn4odl7tRuTeLo/76mIp+YvWB8
         ZiM2xdmAhvS5KMRjM59n68Egmh84Pio0KDRmd3JR5inmdPhEP6Ls+PUie4GwqvNmBLB8
         vxt/eraxqfY/pZ5c2id6dv7NeNngnneSS+P5ckAt3d7qvrz0U3rnepiYKcjt2ufQGSLs
         H9oQ==
X-Gm-Message-State: AOAM531eMKJPk9do1gSAQ7mptf/IpINvB6pV01zbkMbCYgtTovmJ8a50
	aoukZyZDZC+N3ogMPmLZi5qP/zx2nK5whw==
X-Google-Smtp-Source: ABdhPJxCskD5GRR8r9fmaJ9/cV9Ah/ZowIu4rJpsWjEBvKtMO/XhM09ntLkf1FbXf0OeGQfKo+YzIw==
X-Received: by 2002:adf:a1d6:: with SMTP id v22mr5197768wrv.372.1613667409063;
        Thu, 18 Feb 2021 08:56:49 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7504:d16b:192:2652])
        by smtp.gmail.com with ESMTPSA id b13sm9290328wrs.35.2021.02.18.08.56.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 08:56:48 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/11] licenses.conf: Add missing 'or-later' mappings
Date: Thu, 18 Feb 2021 16:56:38 +0000
Message-Id: <20210218165646.2109894-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
References: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If we handle the or-later licences separately (which we should),
we need to add in the missing name mappings for the code to
function correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/licenses.conf | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index a4582b9ae82..5785b0a5b53 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -11,38 +11,55 @@
 
 # AGPL variations
 SPDXLICENSEMAP[AGPL-3] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPL-3+] = "AGPL-3.0-or-later"
 SPDXLICENSEMAP[AGPLv3] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPLv3+] = "AGPL-3.0-or-later"
 SPDXLICENSEMAP[AGPLv3.0] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPLv3.0+] = "AGPL-3.0-or-later"
 SPDXLICENSEMAP[AGPL-3.0] = "AGPL-3.0-only"
 SPDXLICENSEMAP[AGPL-3.0+] = "AGPL-3.0-or-later"
 
 # GPL variations
 SPDXLICENSEMAP[GPL-1] = "GPL-1.0-only"
+SPDXLICENSEMAP[GPL-1+] = "GPL-1.0-or-later"
 SPDXLICENSEMAP[GPLv1] = "GPL-1.0-only"
+SPDXLICENSEMAP[GPLv1+] = "GPL-1.0-or-later"
 SPDXLICENSEMAP[GPLv1.0] = "GPL-1.0-only"
-SPDXLICENSEMAP[GPL-1.0+] = "GPL-1.0-or-later"
+SPDXLICENSEMAP[GPLv1.0+] = "GPL-1.0-or-later"
 SPDXLICENSEMAP[GPL-1.0] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPL-1.0+] = "GPL-2.0-or-later"
 SPDXLICENSEMAP[GPL-2] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPL-2+] = "GPL-2.0-or-later"
 SPDXLICENSEMAP[GPLv2] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPLv2+] = "GPL-2.0-or-later"
 SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPLv2.0+] = "GPL-2.0-or-later"
 SPDXLICENSEMAP[GPL-2.0] = "GPL-2.0-only"
 SPDXLICENSEMAP[GPL-2.0+] = "GPL-2.0-or-later"
 SPDXLICENSEMAP[GPL-3] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPL-3+] = "GPL-3.0-or-later"
 SPDXLICENSEMAP[GPLv3] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPLv3+] = "GPL-3.0-or-later"
 SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPLv3.0+] = "GPL-3.0-or-later"
 SPDXLICENSEMAP[GPL-3.0] = "GPL-3.0-only"
 SPDXLICENSEMAP[GPL-3.0+] = "GPL-3.0-or-later"
 
 #LGPL variations
 SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0-only"
+SPDXLICENSEMAP[LGPLv2+] = "LGPL-2.0-or-later"
 SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0-only"
+SPDXLICENSEMAP[LGPLv2.0+] = "LGPL-2.0-or-later"
 SPDXLICENSEMAP[LGPL-2.0] = "LGPL-2.0-only"
 SPDXLICENSEMAP[LGPL-2.0+] = "LGPL-2.0-or-later"
 SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1-only"
+SPDXLICENSEMAP[LGPL2.1+] = "LGPL-2.1-or-later"
 SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1-only"
+SPDXLICENSEMAP[LGPLv2.1+] = "LGPL-2.1-or-later"
 SPDXLICENSEMAP[LGPL-2.1] = "LGPL-2.1-only"
 SPDXLICENSEMAP[LGPL-2.1+] = "LGPL-2.1-or-later"
 SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0-only"
+SPDXLICENSEMAP[LGPLv3+] = "LGPL-3.0-or-later"
 SPDXLICENSEMAP[LGPL-3.0] = "LGPL-3.0-only"
 SPDXLICENSEMAP[LGPL-3.0+] = "LGPL-3.0-or-later"
 
-- 
2.27.0

