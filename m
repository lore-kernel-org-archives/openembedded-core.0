Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1217.1794944086500644110
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 11:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=RzVRJhQV;
 spf=pass (domain: baylibre.com, ip: 209.85.221.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eae12762c9so62034e0c.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 11:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794944085; x=1795548885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uh9BI5wBslvPajt5An1RXw3lAhvrQX4yp0m+6MVsizo=;
        b=RzVRJhQV8qgnvsYHZOuSThR44KoBu5EckEmN9XcxJU8DbF5TQA19Y9BDgVGQHRo2hF
         yM2+Z1W8NB7MCUgoM2h4DG8jbbD+auUjJFUXoeEKXGddrcg4XzcuPEVjXfgyCZYVaH+p
         z0i6Yk6he1x1AmpN9Mp4B+FNusEiUNj74slwfXgA1u70jth9MvjWaxsaWfbfw+8JDdak
         zM8kQiA5oLu440KB5a6chmLNgjHaiVSbitDZAPXD7LYRZKil+mR7X5rPdrqETUqscQCh
         P6AeYD9Q6vPKZNtSXbJzkfFcliKTCgIxb3bbEVh6Mqev90Ono4/N90OMuZtFP/I4T/sg
         K/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944085; x=1795548885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uh9BI5wBslvPajt5An1RXw3lAhvrQX4yp0m+6MVsizo=;
        b=0/2VwknCeo2uYWYC14Z9bmFXfmPlMMw2Vtwu+Z0lEtuNyHyoYV1YvqtYRSWyOpHuej
         yt6r0KLIQ7p/RsOKUjRUeipz1KGmR9+zaZBFMAULsDHNmd50rQhdalolMPYOvL9q9p+l
         dEiS57ps4cGnxWfjoz0KfeE/hnY/hVlvplMpUeG4dOTQdURZCoRtgArcXJNVUX78foTj
         OJli5VgRye3VaYCByYsXCSuLJxBru2tZ9LCwTOVT+le7lsGwZ4WGuheDj2ZEwT51MPvI
         2kqJV/SRqjfyb2TD3N0JyaeY/wWnQGWkDF2psz6T2GsX3BRy4tgLAQsfiGSIJf2igoQy
         q/Aw==
X-Gm-Message-State: APuU4Z+3fY2py1sBxZQ65cbkjhFpujYKk2W7idA0QTBJTnSC/jcHzu/O
	eiNXq+os9A5X3C6qf9g87ejhAA9CLRaMLG2JC5xcSFP6YrLKRGjEURPQINGzA23xR2EbGow+scr
	eErbF
X-Gm-Gg: AYBFou14pD30tsW9IJXCsNt+Xq12FamOYjF6EkipYQtK5xw2Er91JaFoA93Hs1cBRvq
	nD4M/dVr60RJ8DEbT7BYsPynAwmowdjlkZHGy3JDXLuKNhFmRHIkOh0kSVdNz5D+L3CuB8/pPPR
	48HZ0WdiY3KKRYHeXiZIkaibMVxs52nCQotVfZyY6Z1rO62HDJlaJDtgZj2XiqQ3042CYq69mFW
	tHtSZqmg7GflhigD/BjUdDBvqZE9vONA+wWimIG2vGM0Wx/hrkdFNbzFEF5xxiRiS2OUk84opnn
	L3GdfDSod9gABptSSiHwZ5gmWd6ko1/ZF9tuf4thuTFawVWGmz6Ji+SecgjYJevSB8wPjh1bfxc
	KeUva4IOP+4+db/nZYSG+ghJe6GiQYMVcQbZ+gnpdib7vsN0GHvFO6+QCc/P5Agm+Sm820eAufX
	8FEJixs9aGtDPOYMnWGcJxmlgb4bStGhvTbuO0BFNXqDsNJ04QJdpdVJmyOo9d1FpsqyWLD8EHj
	ynpfNrCBxvtCJ00mbVFQb3t+sYUEsApVVPo5bcvrH82S9thW/wXfWqMDJenpOM9Wsvz2OAOzfU4
	VWKL6TrmUzJpq8y1HSzm/S+6yHcFgSAQLUZjb+QseTVTCZrVHTOhnr1G7HCHKSePQ6WDZS8eSTp
	JGNlu
X-Received: by 2002:a05:6122:490d:b0:5ec:41df:f110 with SMTP id 71dfb90a1353d-5ee64cc7e8emr266478e0c.23.1794944085202;
        Tue, 17 Nov 2026 11:34:45 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.cgocable.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee64eaf281sm257643e0c.12.2026.11.17.11.34.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:34:44 -0800 (PST)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] arch-riscv.inc: fix TUNE_CCARGS:tune-<name> being ignored
Date: Tue, 17 Nov 2026 14:34:39 -0500
Message-ID: <20261117193439.3120583-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117193439.3120583-1-tgamblin@baylibre.com>
References: <20261117193439.3120583-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 20:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250489
Content-Type: text/plain; charset="utf-8"

When a tune set TUNE_CCARGS:tune-<name>, TUNE_CCARGS evaluated to the
literal string 'TUNE_CCARGS:tune-<name>' rather than to the expected
value. Use d.getVar() for it, falling back to the '-march' and '-mabi'
options generated from TUNE_FEATURES as before. Update the README to
match.

TUNE_CCARGS doesn't change for tunes that don't set
TUNE_CCARGS:tune-<name>.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/README         | 2 +-
 meta/conf/machine/include/riscv/arch-riscv.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/riscv/README b/meta/conf/machine/include/riscv/README
index beef68f523..4f043eb355 100644
--- a/meta/conf/machine/include/riscv/README
+++ b/meta/conf/machine/include/riscv/README
@@ -91,7 +91,7 @@ TUNE_RISCV_PKGARCH - This is the generated PKGARCH value.
 
 The standard variables are defined as:
 
-TUNE_CCARGS = "${@ '-march=${TUNE_RISCV_MARCH} -mabi=${TUNE_RISCV_ABI}' if not d.getVar('TUNE_CCARGS:tune-${DEFAULTTUNE}') else 'TUNE_CCARGS:tune-${DEFAULTTUNE}'}"
+TUNE_CCARGS = "${@d.getVar('TUNE_CCARGS:tune-${DEFAULTTUNE}') or '-march=${TUNE_RISCV_MARCH} -mabi=${TUNE_RISCV_ABI}'}"
 
 The above will allow the user to specify an implementation specific
 TUNE_CCARGS for a given processor tune if the default implementtion is
diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index 6f9b74974d..625b60a7b8 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -113,7 +113,7 @@ TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zbs", "_zbs"
 # Construct TUNE_CCARGS
 # This should result in a CCARG similar to:
 #   -march=rv32imac -mabi=ilp32
-TUNE_CCARGS = "${@ '-march=${TUNE_RISCV_MARCH} -mabi=${TUNE_RISCV_ABI}' if not d.getVar('TUNE_CCARGS:tune-${DEFAULTTUNE}') else 'TUNE_CCARGS:tune-${DEFAULTTUNE}'}"
+TUNE_CCARGS = "${@d.getVar('TUNE_CCARGS:tune-${DEFAULTTUNE}') or '-march=${TUNE_RISCV_MARCH} -mabi=${TUNE_RISCV_ABI}'}"
 
 # Construct TUNE_ARCH
 # This should result in an arch string similar to:
-- 
2.56.0

