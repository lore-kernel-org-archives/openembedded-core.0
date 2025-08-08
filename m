Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F4CC87FDA
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:49:57 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.17676.1754642987184205044
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jehYeicH;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b34a6d0c9a3so2200648a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754642986; x=1755247786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8p8vzDIdIjcqdEZQlgsyw2egD+F8dLWFbh55pam/sIA=;
        b=jehYeicHw5deq6NCnTfJayj2OdPRIIRl2zD2i02hK7Q6mYuktwzV+A8ZKKFc/fwVwD
         uXThNQxOigmR2C+rC0hNGT69yhQZRsunxsUrk98K7TB4f5QdTM1/eMt1+ZQKFmFR0DzK
         l2j7KMrR08QiWQeWMyCeYUxJrQ0rNDWoINX6xoBPsYvNXqgWPxZ/rbnenPcqDOLF7asl
         TrT6rMRYQHK8WLFgRg8FaFWoRhxuedO4bhslS1VBAmzCBRQTE/dGj9fdY+rNRsy910rr
         4QG3e1blqwryJD87II/LrFUgDV04ZaB6oLIZTQpFCkHusVNcQHhXLuxzQKAbwAdygjx/
         QUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754642986; x=1755247786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8p8vzDIdIjcqdEZQlgsyw2egD+F8dLWFbh55pam/sIA=;
        b=u4+e8Tn20g+qkVE1mSxBuek6tp/2nOvFXvfPKTKk0N5em6Uk1TXMqC3Y4EdZK9bfEM
         Tobg0HY2eD7I8BxVNmI/iDxUbRG+iGt6GWKJW+XFxQ6CuYYWLm2vklw6iT4OeilApTF4
         v9WSzpclZbu8SlPv2tO64r6QZ9VkPaUVaE3+NIoktN2rJD5yZnWCe8+2kpCMjMBh6QtA
         ldnl5XGiyvk/qupgn1v9X/xz1nKI9wfa+LHea8ZIAGNDtN1usM2JVCRVJ7WTfXrmtS76
         d3x0X9dHxhLB6rU90ASap1xQPFBzS1YtH8Nazo1GLhIpnpaCnH+I/X/rbm9oLORB/eJy
         3Pnw==
X-Gm-Message-State: AOJu0YwY2uuTV+EhSvYyVTFr5siZTFRLEJyDxs76fe7V01PSYAoApv8D
	wOTlTSEA/3BzMVkPVkmmogMv3fjwwIjMuUMm5dkelBHNMafUYJ3eTdKcJzjpKw==
X-Gm-Gg: ASbGncveVl9iQMDx++IJnWKKHK2YVAzL1gXSKKrlBQZxOfnlnBZEUtQ9Z4e/oo4VgC/
	axmiYDDY6D/bBOQwzl/G6dHXiK1curvVtd6ufTsh2JsIlwbH3IOxYCzglFTB7K8ykfwcN1g8zd/
	jUk+m1uTbu7Y3HNrQ6JTXN1kxkBaynO4lYN9Dr2O1fFxi4/WleSLl5Stnr/LH1uNKXLKxJuLszd
	HKDrWik+IpkvtkbR6kAqsn2lLeTlBnWQ60ih9HBHI5smwOHMKCyGRmfPoBzX1R9vAiUsftNL9MS
	Lll5e2WgFwLsL9NLTy7c9oNBsyjE7lwGw1s4LGN059G4iqTAoBNSsfNioBZGK9S4B22lUUwr+Gq
	SpomqK1LIYH45VNMrOjzuoVT1ApQwG+aA
X-Google-Smtp-Source: AGHT+IGV1aZIuxIWvJX1qSsFDwN/SyJPq5MmoW+Zib6I8gSNJLeDyDdMZWxGsEXK3CU4yD/tFCLemQ==
X-Received: by 2002:a17:903:2391:b0:234:a139:11f0 with SMTP id d9443c01a7336-242c20703e0mr37580315ad.7.1754642986155;
        Fri, 08 Aug 2025 01:49:46 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:49:45 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yuri D'Elia <wavexx@thregr.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 03/23] bitbake: fetch2/git: Enforce default remote name to "origin"
Date: Fri,  8 Aug 2025 14:19:11 +0530
Message-Id: <20250808084931.2156763-3-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221600

From: Yuri D'Elia <wavexx@thregr.org>

Enforce the default remote name to "origin", as assumed in numerous
places.

This prevents build failures in case the system/user configuration sets
this to a different value.

(Bitbake rev: 1d7360031164f04887c792fb0b2dd86c6ccfcc23)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b698371255799f94861af57c710450e4879af208)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/fetch2/git.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index 2194c839dd..5b678827ed 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -262,7 +262,7 @@ class Git(FetchMethod):
             for name in ud.names:
                 ud.unresolvedrev[name] = 'HEAD'
 
-        ud.basecmd = d.getVar("FETCHCMD_git") or "git -c gc.autoDetach=false -c core.pager=cat -c safe.bareRepository=all"
+        ud.basecmd = d.getVar("FETCHCMD_git") or "git -c gc.autoDetach=false -c core.pager=cat -c safe.bareRepository=all -c clone.defaultRemoteName=origin"
 
         write_tarballs = d.getVar("BB_GENERATE_MIRROR_TARBALLS") or "0"
         ud.write_tarballs = write_tarballs != "0" or ud.rebaseable
-- 
2.25.1


