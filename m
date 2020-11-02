Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.1199.1604335760762016361
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=itTbCxsI;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id l24so15010093edj.8
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wjYoigC34P8qLqD3oOGT7/7pf13xq+/aFFBcFQryc8M=;
        b=itTbCxsI8o++82uUM3BMvYUakwfgetPhBUacyvSnLQa9b+vRa5r9NA14jAhdpFGdy2
         L2lbsMyDVFHIlAfqmIF3NXX5syCVazqqrfhO9VH6uApIz9lpLPgg7QhwHN5MhR73FbcH
         fpdAUT5HIkZ4YgHkd6Tloo91FJTjURV2PinO8YA4AsXGUX40Fi+x9UE0AGaqntWiknDJ
         9n5OCKgC+A9UcT/vTiJm9ev34p0kPLMGfSUV4vb8y3xBefqSv5HX7+L8JRrL6ULEDIfr
         VVYK3aj3EfcDX4wN3Al4xOtyJNi6d16uG4yxhm6OKC96GN9aD2obKHHLnlchznYeMyCQ
         kYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wjYoigC34P8qLqD3oOGT7/7pf13xq+/aFFBcFQryc8M=;
        b=Sd2yvYhOiKgyCX9rRZz2cHbM9+ChjPDcGt1kHHotn7ChkZjP50B8MZ0/Z6JGd0Nyl4
         aTK0HiCDHQcbhSjsTRpnzmhDDXm3m/Bs4G/EwhlZrV72WCqmOm/cKgas8SGV5JPeb8ea
         UPS1b1/hChcXr9hk6a3sZzrLDxTXMom+uJ6eM2MIPpVr3z9Kvez6LpIuMZzFYkXZw1On
         rRBsgTNziBvtKA4VSllU0RabtsFO03jfzXIZ9zlUgkalpYIWdAomOJlqKeD7zxrmaw+m
         i9a7SdW0QXpxHnhIsoK5r8FVUnlX5no0dd6WPXCfZAMNbEJIfZTa5RELkn1EvMLEqlzU
         7Low==
X-Gm-Message-State: AOAM533OmFIaV8JSQhUt0uSBbFNo+eezNAu7J3UZbrHBf6dxJMZJQ++k
	rG/vIGorV2KFUctQT86OlBP2JUI7qUYCdQ==
X-Google-Smtp-Source: ABdhPJxaiXKQM1BPowFHSQSko5ARg835xpF6IJFCrOVdtJsqbZPiBfvV9BOhyjhIj4ZqA9kv9UkLjA==
X-Received: by 2002:a05:6402:c8d:: with SMTP id cm13mr15082395edb.340.1604335759013;
        Mon, 02 Nov 2020 08:49:19 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:18 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/80] spirv-tools: correctly set PV
Date: Mon,  2 Nov 2020 17:47:48 +0100
Message-Id: <20201102164907.27572-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../spir/{spirv-tools_git.bb => spirv-tools_2019.5.bb}            | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-tools_git.bb => spirv-tools_2019.5.bb} (100%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_git.bb b/meta/recipes-graphics/spir/spirv-tools_2019.5.bb
similarity index 100%
rename from meta/recipes-graphics/spir/spirv-tools_git.bb
rename to meta/recipes-graphics/spir/spirv-tools_2019.5.bb
-- 
2.29.0

