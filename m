Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.294.1626714857476441309
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jul 2021 10:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xi8nn/kS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id r11so22935063wro.9
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jul 2021 10:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ssw2/L2ZOpSKsud1vCuPkDy4gfjtEljgnQVspy/N6Qk=;
        b=Xi8nn/kSiSDK85Cuh7HnXjy3xITmvEdpM153t8w1oab0y3bPxqw6uSwpmlaFE1Q1sM
         FJQsZwMoq0ogz8exzYu+eI/6sk/h4Ov4FwtDZIOFbT+eVv+KjucWGqQW5KypcGqByt/v
         bT3e1wQvSRxLrG733bAJxWqDFTpqX0BqimIBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ssw2/L2ZOpSKsud1vCuPkDy4gfjtEljgnQVspy/N6Qk=;
        b=VXDJY62pqc314YgNHCd+DTzPiBfGPiWpiesmsOAqpN5rsEpvOLdhqz5pxNlMEGjoJV
         ELYyhO+nIz9NS33thbY+DXBgcWW1eIilkE5SwwgKFxRUWqDdrMb1LnbFihn0XpiNL6Nc
         Qo4AAcyuayYGG7NHSmdkKxHRpvVWGP+bBtI0o6H2D6bVLFBewfKdlnVqrAoDTNyf1dDh
         K1FK/ukXJnLOQJ5fPLeaYYQgG3kGJqpfD27xfsVKYT960MndTXQhLk4jRI+dQNrFRei6
         egl4qA2rP4/loNW6RK/x1FJj/NQZePVxC3Vg4aydorJAIdvLMuPjccUtcqmTTXt3v6p0
         QKEw==
X-Gm-Message-State: AOAM531kpx44mo38MfBxJnSSc7hcBzPem9QqvdHB+5yc7ciFn7zHzzIu
	+T9G8PX54M8veEefEpJfQYlNUfZA6gqQZQ==
X-Google-Smtp-Source: ABdhPJz3mdbkkiFFoFnv10wH2ka4JLPs1aRVrZaPif8aTi2/MmO2LrUtc+EXLD9DW7cueqvaDYHZFA==
X-Received: by 2002:a05:6000:1844:: with SMTP id c4mr31192550wri.38.1626714855669;
        Mon, 19 Jul 2021 10:14:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7b26:3bea:6cc:da6])
        by smtp.gmail.com with ESMTPSA id 129sm17704161wmz.26.2021.07.19.10.14.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 10:14:15 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] README.OE-Core/README.qemu: Move to markdown format
Date: Mon, 19 Jul 2021 18:14:13 +0100
Message-Id: <20210719171414.3009854-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The READMEs are often viewed from websites so switch to markdown format which is
much as readable as text and much better from html in broswers.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 README.OE-Core => README.OE-Core.md | 0
 README.qemu => README.qemu.md       | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename README.OE-Core => README.OE-Core.md (100%)
 rename README.qemu => README.qemu.md (100%)

diff --git a/README.OE-Core b/README.OE-Core.md
similarity index 100%
rename from README.OE-Core
rename to README.OE-Core.md
diff --git a/README.qemu b/README.qemu.md
similarity index 100%
rename from README.qemu
rename to README.qemu.md
-- 
2.30.2

