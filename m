Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web12.6725.1604421048725893134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 08:30:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nh5BbD1S;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: toertel@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id p93so18952478edd.7
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 08:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HkwAkZp2JY4of3AfmncRchfscPy7W83p75p9a1GO9O8=;
        b=nh5BbD1SmV0q/uzD7VRHSzmHRpHU0VrnyPDVmAhGyMq9fIucCrRdyFyMLGOF2vhA+D
         7SREqLFkuiIHXLyAkevbacIS9a3TcTMdLaJiXjrKpzg1vtEfyXEI8wJR4z4FRTQKT8Kw
         8uN3FPtkOPzJDmElMJnGOLxBSYFSt3v1qDVoy+TbtXqqSh25I+GV6ChRV+S02AqSbhUQ
         RvOiHaybFJnOOu1hXpSqIDu8cbbUsUrtdthxJ0IP2HEdu+BwiMLBNx89iAyHQRnrRp/z
         klHwy9XDK71+9APQXAUt6NeNths75+PB+8YjWWn9kO3iesG8PHpqnQjyz5xf0V8JbjE8
         xqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HkwAkZp2JY4of3AfmncRchfscPy7W83p75p9a1GO9O8=;
        b=VGebKJN2GrJw0mU6c6mPsoibS60k0XnB7FIhDrtQlM2pHs2pU5KtVnFdih2ZsNkCnF
         XngpWN44dpPUnEOqnIIWOPvumS8Aa9nwfgKB1rL3EOXdr6MdirBu19C59J+eiETjTSvG
         yETpBsYcm4iIC1mga9Yxr9tuAkw2E+LrbB5FsmEJnZb2nezHsS4c1gciR/ixRKMWDkZK
         8e47tPAA2H6/wPlm7NUQ0F4o1bxWhDoKFkfAXurSITxr1eugKv+ETqebUw/BzG5C6sKQ
         8oy9j3OQ/bnsfcIPnA2yQ0s8BM4BZ0n0rs2iYLcqQONdP2BgQzqPbHLNSNf/8kLM6+4T
         gsgg==
X-Gm-Message-State: AOAM530kwoQ/ceCZOFuOVA99f5kZrApU4c4WAkIhuN0zWaiLJpeJtbmh
	80Mui2YAaiu33GIGuSKoW7LVZa61ueWi4w==
X-Google-Smtp-Source: ABdhPJwdtRK1Z3E4EUwAoaYfJNS7+rI+im0SbKNUnsLNg/apWOLPXi5YNXokXpzpGPOfvQ1fE6JaOA==
X-Received: by 2002:a05:6402:495:: with SMTP id k21mr22875439edv.232.1604421046859;
        Tue, 03 Nov 2020 08:30:46 -0800 (PST)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf1974008871fa142a03af31.dip0.t-ipconnect.de. [2003:cf:af19:7400:8871:fa14:2a03:af31])
        by smtp.gmail.com with ESMTPSA id b24sm10662599eja.30.2020.11.03.08.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 08:30:46 -0800 (PST)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mark Jonas <toertel@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 2/2] Map license names PSF and PSFv2 to PSF-2.0
Date: Tue,  3 Nov 2020 17:30:27 +0100
Message-Id: <20201103163027.442585-2-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103163027.442585-1-toertel@gmail.com>
References: <20201103163027.442585-1-toertel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to SDPX.org "Python License 2.0" is the overall Python
license, which is comprised of several licenses. "Python Software
Foundation License 2.0" is part of the complete Python license, but is
also used independently by some projects.

So far the license names PSF and PSFv2 found in LICENSE are mapped to
to Python-2.0. This patch maps PSF and PSFv2 to PSF-2.0 und thus
corrects the impression that Python-2.0 and PSF-2.0 are synonymous.

Signed-off-by: Mark Jonas <toertel@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/licenses.conf | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 751424d1b6..5b309eb385 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -45,9 +45,11 @@ SPDXLICENSEMAP[MIT-style] = "MIT"
 #Openssl variations
 SPDXLICENSEMAP[openssl] = "OpenSSL"
 
+#PSF variations
+SPDXLICENSEMAP[PSF] = "PSF-2.0"
+SPDXLICENSEMAP[PSFv2] = "PSF-2.0"
+
 #Python variations
-SPDXLICENSEMAP[PSF] = "Python-2.0"
-SPDXLICENSEMAP[PSFv2] = "Python-2.0"
 SPDXLICENSEMAP[Python-2] = "Python-2.0"
 
 #Apache variations
-- 
2.25.1

