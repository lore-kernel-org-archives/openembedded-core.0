Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12144.1795239544754632530
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 21:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=BPq8HLma;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-382f4710a17so2675766eec.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 21:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795239544; x=1795844344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1Pljw0Nhsqtr7xrFg8s2EayLSrxLCYz2LrcfW/QIX4=;
        b=BPq8HLmawEkj5YGv+xXh5rEKJ6+ISp8GlK1k34Gel5dTtuNzTQCpwe4FbP+hZn8Bt8
         PcpnXTNLdfQKodYjmWzQfVrUTujFMyMkSso1yZGFnpi5C3aIpWjMpCuFXxdRNiRkaPCY
         HxRLrJvHbgpvl+Jv5FIL4kA9iUJK28tv3U1aD6xy9Ec9tKuI0kCTQHvQmd3Gip/hkOJX
         5JUFKLi49+sJftCBSCl3fxM45DxITDikg6PsVp9/7ee0KAUr3uLHN4UPSjW61fXVHEux
         fNac479lJL5agAyH62r2NtMGu+MPDM7qNNrgP9gF2Mv/c8Cs0DUmM5DJGYdwzSppAqYJ
         L0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795239544; x=1795844344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e1Pljw0Nhsqtr7xrFg8s2EayLSrxLCYz2LrcfW/QIX4=;
        b=a2srfT0R9NlxdDBJPpCl1g8GM2h5/tafuKo0qEil7/QYt4/1NBCXXaIol0/ZqdQQ4K
         6QllpU/aju/Tuqxz2e5pCqCq3ITZZ4VOLZXve/U9NvqSNi/slMBF/4ASIRtRNuBeg7u9
         qscoD1SL6na+LQXXy8r4HlP30NCvcmq2znGPFa62wM858BSk3EFYWmS8Ehc9sxqsm9Co
         JbbTi6SsQfsoIc9uUp7JySfMEd/pS/wfs0FUHk5KA4utSvNuPlWDyQHI9VMDFHdWoTHr
         C7WjfAY68fw9HgOSxnLr3hpG6D8ZQEOHOlcjMRuFTFZxDXpMCCdQmCe3r1n7fATMjVCK
         3vVQ==
X-Gm-Message-State: APuU4Z/kctoVXPAFW4Hrp+xY9qxGhGAgQc9tEm7jVpzQSz9KTlhSHNkj
	Z45H2BN2PIorL9c1vXS5TEuOf9oWYsyRPTYn2HgZpkNo2qxNanVIatk6LArI7A==
X-Gm-Gg: AZFdTZcrQjXyJZWg/dboxqfC0XxnvWj83I4cTegLRgrl5fHa/AYeZmYVlFWcwMnWnBi
	6xKfeVGhTpm2DrjLDa+xsdn8yo2uwhdxDuZKPSsspqDM1rPRQ+JYqrzNDiMNFMOVlqGqGCycG+c
	H4wccxddNUsxDmxKjg4b/+yx05EQyTFaDEK6x1G4dsCIcJ8Xi1RZC5GmBdqllk9YNOdimQxrqzJ
	+fc/OQgukPcvYFJRvIH0Ugl98cMXMgtKxhZc1WWJxSveoR9Raf9mv3DH4sGIh7l6tUVoWHrpHT2
	YvGjTsSmGGLgcN38YoZPB5buIEbIVt3FaV94oANlcAtTOBXrRxcsQhllWWbD6RGY/4rvcMFoGkA
	ccAZdLAaLsGbq613J+CEif5VNpecPHMcz+pQbSnw/MtCldqGKB0hAd1ogcR3iNul2ks0+a/pdu2
	fQ2CgC87Bs01vy5Da1EWXK+dTGydEz1umE84uIC+KrrjKMx8AafEf+FTCTPyP1rPozuWVfUljvt
	XNzDFBg7kAV89/13ZwDFe125eTRMvNjgd3OnkhtcvvEE4Cs2aV9ct5M3kDyI+muCoV4XJwBhpKf
	alHty4dzJd9sVuaJWCpp6MZP92ZD+BH7oNnOMtyae+TQvFVGyJURE69b7p2d5CbtlelnLUQ4gzC
	wcuCKy8s4vg==
X-Received: by 2002:a05:7300:e60c:b0:386:636f:c25e with SMTP id 5a478bee46e88-386636fc6f9mr4579250eec.12.1795239543961;
        Fri, 20 Nov 2026 21:39:03 -0800 (PST)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm13340308eec.9.2026.11.20.21.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 21:39:03 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Prasanth R <ragaprasanth@gmail.com>
Subject: [PATCH 2/3] resulttool: fix NameError in filter_resultsdata()
Date: Sat, 21 Nov 2026 14:38:45 +0900
Message-Id: <20261121053846.3614417-2-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261121053846.3614417-1-ragaprasanth@gmail.com>
References: <20261121053846.3614417-1-ragaprasanth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 05:39:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250840
Content-Type: text/plain; charset="utf-8"

filter_resultsdata() takes resultid but compares against resultsid, so
resulttool regression with --base-result-id or --target-result-id fails
with:

  NameError: name 'resultsid' is not defined

Use the parameter name.

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 scripts/lib/resulttool/resultutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 53980f8007..13321a75f0 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -119,7 +119,7 @@ def filter_resultsdata(results, resultid):
     newresults = {}
     for r in results:
         for i in results[r]:
-            if i == resultsid:
+            if i == resultid:
                  newresults[r] = {}
                  newresults[r][i] = results[r][i]
     return newresults
-- 
2.43.0

