Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.443.1623703897276664948
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 13:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vU8Yg5nj;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id u24so48233461edy.11
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 13:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KwQMvijhX3AAy1np+ytdsMCNjVD2bRQfg7BTJJMd1eU=;
        b=vU8Yg5njttsktaS3muB4sMc+yKXHesqNH3MQ6eA0Y6iKuHvDoMdL0diINjz//d8Sb3
         CfZ0I7o7pH9rvF9mx8fZZk96oeK/z0ThoIcr8rpc+1Gid5ouyaLIEIyoODZWd2X1QUXV
         ZI+3ecH29HLa8vTlr3x5+TtTowE3edQnAHwpkF6WxE41bmAk9xkrr5A45J8eTFY+B8rs
         nQdr5+5H2lNn5n1mjWdgFmvydnA9VYdA8JqW84vsTZYn0B7EWZiTQ39GZrWOxGz5R2LD
         4psjSwK/9l4kt4GS6WpGkk6YAX1RcdqFBXAOfFrnPTHxHittPhu7oJhivh5o4XxLvY2N
         3o6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KwQMvijhX3AAy1np+ytdsMCNjVD2bRQfg7BTJJMd1eU=;
        b=arJ6ZItr46oRJ4gTDZcQ3sXJhQWFLTQmZiIFk23bLUXic8aa4Wq4rt4B8lzh+CiG4u
         fYFN3IgT57MoDGc1yAZGGEFSValJ8ki9smaI/Vf52XQXLsdAL1mhzYlAIqIkAR8SEc/5
         inGOllOYy0t6UM+JJttwtBZUggcTlLyKzJ8RKTJN5VGs1G58LfPy57Baoh/b3Riz8viY
         GnkdEyBqEu2VMKW3w8KOaWcigzwrNtd9WGvh1dlauFFXOiodv5+Uq6A5nEwNml8AgWfs
         ERLV5Wpg56FQaJM5RmAdYfontqOL6LYZ0k8J29VVcXLGhUyiwvKJru7Lt8vB+QUNdTZz
         WQAQ==
X-Gm-Message-State: AOAM530uqpoteUfFzUnB7cyX3BbDTZaseKNNKCY1fuBNMGiTJJVHXOHf
	s9nYF1KonQmIaQTBRaQPgfdJXmqoHwt8oA==
X-Google-Smtp-Source: ABdhPJxIHOHHEwlf/QRhMLpIH7KrE260MWdP+coUom5hxOTh/g4u3uzYr6gW36ZeGfjqHSjGwyQo4w==
X-Received: by 2002:a50:eb92:: with SMTP id y18mr19191073edr.249.1623703895676;
        Mon, 14 Jun 2021 13:51:35 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f10ae4125962954aa99f170.dip0.t-ipconnect.de. [2003:f0:7f10:ae41:2596:2954:aa99:f170])
        by smtp.gmail.com with ESMTPSA id s10sm8074357ejf.54.2021.06.14.13.51.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 13:51:35 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] libx11: upgrade 1.7.1 -> 1.7.2
Date: Mon, 14 Jun 2021 22:51:23 +0200
Message-Id: <20210614205126.1680546-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614205126.1680546-1-schnitzeltony@gmail.com>
References: <20210614205126.1680546-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Version 1.1.2 - This is a bug fix release, correcting a regression [1] introduced by and
improving the checks from the fix for CVE-2021-31535.

[1] https://gitlab.freedesktop.org/xorg/lib/libx11/-/issues/133
Alan Coopersmith (1):
      libX11 1.7.2
Matthieu Herrb (2):
      include <limits.h> always, not if HAVE_CONFIG_H is set.
      Check for NULL strings before getting their lengths
Tobias Stoeckmann (1):
      Protect against overly long strings

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../xorg-lib/{libx11_1.7.1.bb => libx11_1.7.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.7.1.bb => libx11_1.7.2.bb} (93%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb b/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
similarity index 93%
rename from meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
index b5f0445e12..383860409f 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
@@ -14,7 +14,7 @@ SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
            file://disable_tests.patch \
            "
 
-SRC_URI[sha256sum] = "e64e43deaa562cbfb0d5ada64670ec09c6fac7935262dcd77bbc6d984a535d47"
+SRC_URI[sha256sum] = "1cfa35e37aaabbe4792e9bb690468efefbfbf6b147d9c69d6f90d13c3092ea6c"
 
 PROVIDES = "virtual/libx11"
 
-- 
2.31.1

