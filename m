Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.14539.1615317826517776550
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 11:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ay8bnr+4;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id d9so6998852qvo.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 11:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rVehS/mcp+Ak7jJS8Khav18MGC2hQhXEgigjahUmJFU=;
        b=Ay8bnr+4KDdSDnGRLTwcV5w6sWB72Vzy9jAf3uDaypEa+HKze4ABRCTtYRNIluoM6F
         yxFdZZdf1nxVjapMrD2BuC97bLIZaS57w57JAkNNQ/kXWNHUagPxXep4/IZ+NjFdfES9
         xhWl1+hgkR9flKPXU2FuvRA0PX7HMBkS+ez4MUBbN4h3UNfhvHR4UkTKoqGtq9rZGtYK
         225fD8+r4vgecoRda6jpPJUFZxPL5DmAjIwwAHquj2x6rGFRqK8LK0T0Jd7Ykib+YsnC
         dkeSYBgQFP+7b1hRnTWyYxN8t3aOTcgvn1STGH5RZodm7XfaX6xvTeOWKifHeiH3aSu3
         Kzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rVehS/mcp+Ak7jJS8Khav18MGC2hQhXEgigjahUmJFU=;
        b=HnKT5WvJPDW33PMIqeYSU2K1/r3L5Y2ibEgw0gJl092RbAm9Yy1ub6Odf/PxXnQ3mS
         xyc61GkIjG14SdcSiT7pkv19gVd0dQ6B1KmyrIRrWItjfU30oAT1yvaPxOulQmeBzYah
         Ds12Y1Y/3FFmmF8gzNtTS0xJnSujRVdusBxDruNaZ7wbb2XtI4RIj7kTGvX9W0qWd/iC
         1OqXGJRLsDL9fbUEr3A6O8PPR2vIi0p5u7nswh5IsliQzYwferoPHHrbr54N+T7t/kJh
         gCiSoHIGT7i+Qak5/Rlx7U9err/1TB9AUqOnvlqqp6ycO8BOF5BaQ8lVoGugwYQzQMY3
         X7Jw==
X-Gm-Message-State: AOAM530ASy8IYFibWB/N5+i5N3dfrnHXr4CT/+/PPaOVpA7WBeUJUgAQ
	B7bjkAloY+YaLAPVG8BAOJ0=
X-Google-Smtp-Source: ABdhPJwoRaesNRw31j94nYqRE8UMUdKLWhzfPRthfSzLeBkO8uBYVr/AyPVuIMrF46bSvd53nFlBmg==
X-Received: by 2002:a0c:e944:: with SMTP id n4mr5218187qvo.21.1615317825616;
        Tue, 09 Mar 2021 11:23:45 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id f13sm5713377qtf.57.2021.03.09.11.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 11:23:45 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] reproducibile: remove perf from exclusions
Date: Tue,  9 Mar 2021 14:23:37 -0500
Message-Id: <d30604303763138aeec2743647b93037afb046c2.1615317549.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1615317549.git.bruce.ashfield@gmail.com>
References: <cover.1615317549.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We have fixes for perf reproducibility, so we can drop it from the
exclusion list.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 0d0259477e..86cf6c5daa 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -36,7 +36,6 @@ exclude_packages = [
 	'go-',
 	'meson',
 	'ovmf-shell-efi',
-	'perf',
 	'ruby-ri-docs'
 	]
 
-- 
2.19.1

