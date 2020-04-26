Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.3970.1587928388066367167
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2020 12:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kt6nNHvQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: jpuhlman@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id e26so22479267otr.2
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2020 12:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zXdjErTljwksmqiCS8AIy6EkeJUhJjCjjurIPFYhcNM=;
        b=kt6nNHvQ8QMoFUbmQzfyE1QTlPhJz4xzgODWuFn68VKZVC7nHjCZs9M39UF7XJfyBr
         fOHbIVZeQmHEVQHKCq/wlSBzv2b5/7Lfwy575OK8bOM/8PFY8Ex2N0+e66F/e6Bhmtvk
         alZvnOBIwZz98p2EXzLcLlKIcPsBMkD/xreY/oZ8Yge+dmA2714yfWbYzhyssVQLYbVc
         pI+RkrQYTCazuhBku7QUEK/fHXPbIrq3KCSYayrOMg44A8FFd6WfBZLyD2LpzWsE1Jhc
         IxPV3eChZ97WVPgXlwrqsUbDhkVqnBX8T4AiF8WAPVLVf4VBPm4hhjAfaSwNG5G8y/Hs
         SSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=zXdjErTljwksmqiCS8AIy6EkeJUhJjCjjurIPFYhcNM=;
        b=LrRpLQr8ZLQ7ylxPvyOyEzbafC4hbVqhQzwHbwvZjJGYyJQFKJwe1n9ylGXZtnbqeC
         12lnXeb4ZIKjMKJsTvlfOHAh1h7kpYC2XyeUNlwEsCiriQvpuGmVrikssCtwLpyuWgOR
         O6Zoch3Fmay4LEG7faIBcv7LPEEID9OtnNre7D4WuqJLBc8Mr8tv/CA8+ijLsDehnk3K
         UXu+tY7I9F/pklc9Zutgw0rKeEp/Jzurn1gWzaR9Iw0tOmWyqj4jPCkVLaA//mTw/Z2d
         d2U6VzCkBCzV204D9q8CEjnGMumlPOf9X6Qr7BXuoo90OHpWiShGwSRXC255fLORImdC
         y4zg==
X-Gm-Message-State: AGi0PubfPWB3YcM3nRb/YYTa6Ac37dob2iWV6i4Ic4rqew/9n+ohhV7x
	TzMr7t2yJtQVr5+ZORZfPpvzADQg
X-Google-Smtp-Source: APiQypKgfcYpl5NEWlc1BLeWaz3Tbtrv0l7fqOneyLdPoYV4NU3X87uwQPEKrVbF378/yBBkQ7SWEQ==
X-Received: by 2002:a05:6830:1c65:: with SMTP id s5mr15543510otg.60.1587928387378;
        Sun, 26 Apr 2020 12:13:07 -0700 (PDT)
Return-Path: <jpuhlman@gmail.com>
Received: from workhorse.localdomain (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id v14sm3444429ooe.10.2020.04.26.12.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2020 12:13:06 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id B2B3D2A01D7; Sun, 26 Apr 2020 12:13:05 -0700 (PDT)
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 3/3] buildtools-extended-tarball: Add libstc++.a
Date: Sun, 26 Apr 2020 12:13:02 -0700
Message-Id: <20200426191302.25782-3-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200426191302.25782-1-jpuhlman@mvista.com>
References: <20200426191302.25782-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

Builds like native-openjdk, really wants a to link
some tools against the static version. Since when
using the extended tarball, its the only place to
get it, add the library.

(From OE-Core rev: 59c4a3fdbbfd5a6aaba7e0a1675dcd5866a7f3a4)

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index dd780c5d57..e38967af3f 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -23,6 +23,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-libgcc \
     nativesdk-libstdc++ \
     nativesdk-libstdc++-dev \
+    nativesdk-libstdc++-staticdev \
     nativesdk-libtool \
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
-- 
2.20.1

