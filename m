Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12908.1794282764614198972
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 19:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=g08hRTy9;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so681317a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 19:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794282764; x=1794887564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cc6GL+vexyEj64QsVR1Jasi1xFXhGTMqHyRJmgz3o5U=;
        b=g08hRTy9BgSFxxu77tIGQkyQYepue6eQIayH1SJAeHQ/xPgwo5YXsp8U95R+hN/1kQ
         vkBpHl/+wQb0UE7+h9Zk9uuV6z5xxkF2sX6tlfAYWxPxzZ4K3v9tMRtPhhgbSh/VZP8c
         ev3UiQj9JsverdhLfiTAtzryuIZjxWh6sD3OT9kusTv1DvzRw2DXRj/3ldkW/jQRDrTQ
         /W4aAlqSzDX6hJbqSbCBf/nDzWRGYh1GkdbmFd13KICgw6Nm3TeM3EnrMZa2Vv91UQsz
         L50c7QVKz4fMeXKDoAXeV+rh22WKzGHhSuFsZ7BDAlZKYTgbueO8IPKr5J/9adqML2Ix
         xLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794282764; x=1794887564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cc6GL+vexyEj64QsVR1Jasi1xFXhGTMqHyRJmgz3o5U=;
        b=a1JdSySnAPTfeYgcip4cFMSMUfikZ+1yWufNaOmntWiTXAY1Jwwp5Zz9Y/kpyT1uZk
         P59bn7GDQA63D25nlABZ2Fq8S729f8lSfFuIiXe6rkXMIGZVRJkR7f0RWIfVswKE+hjz
         uGugRb6qLwmRr7jItlPgcLMB9LTpoee57q0THCqG3pv0NwYHepdLyeTLDIO6mjXJatd+
         gtiMfQqw56Vn6mqFXa6oGWxKpOS8BxDLznvAVuCCW0vnLRz9I/4cEb76cN06cAxsH2N/
         ePeQV1a71qLGSWbnRbbK9/ZY6v3xjQCv9b7hwvRhaZTZQsj8uG8hHgoLydIhOA7GFF6m
         ryHw==
X-Gm-Message-State: APuU4Z/gMXLqgrCFCEDLDEErCkclQIc6GVJ5+gEtg4QixyaaNNh5XtNF
	DfP2hPTWmFuHO6ghfJJf2BYtiiPIvdsvyADRauHCOTGydR/2nuBsrZdFIaOK3y20
X-Gm-Gg: AYBFou0G7RxZmmzG2s6xCMifRqHGV+W9YBuVcFQ0gV6ClwvV+OfkdVXplelbsRDXR3p
	4ea/pGqFg53yXMpxP+ZjYzuzOv5qI8U0Xw2MkJvcQx8S0mxeyh8y+9yozVOLUO8uJTwQ0mDlP4x
	TRyJ+5hYRTabUe1sgea08DwpZ1wxvRZtdc4LFVjY/rMxiz8OZSwOgDAjrh8GB8+MduBKSOJ0LXw
	eb8K0UJF+NfTagM9xfhG39G13/73VMKknEeQo7D/1SzdSrA2vrWBwFKmB/Q0Q2ffRiuwlTVzY7v
	MGGRU0IKt83niLl/oevz/jkUvJcArKgE3qNy4w6CW7uNVUZ06QmfcggC17zepIbtzvkFuK6TF8f
	wbO3NwK6f/uOvYMEvGbbDKKd31npur3d2avP7uYgyZnsdkWUQtiFlbTspBBWfM1SlzcBj8TfwDZ
	XwYkPqQkgd7K4YyR4FgKga9uI8c2KVP6RYqFyBiKG2IqvJ3we9BOIACjrJwdZYVJDGJugYve5wh
	NF+loH1ylNr6PFcNnHbrxDH0W8QAFcXr4TS0iTaDT8a6oPPzo7V29s2wediXyxOEDr4AhDeLzyb
	VmT1Q4JvntAufrKDlr8YVlnLjY8AwTm4RRaFRF1XOKLZEa8w5V93oIOh1mbXkw==
X-Received: by 2002:a17:90a:ee91:b0:3ac:6fcf:81a2 with SMTP id 98e67ed59e1d1-3b166d3609dmr1134100a91.57.1794282763910;
        Mon, 09 Nov 2026 19:52:43 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16708f963sm2077346a91.1.2026.11.09.19.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:52:43 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 4/7] ccache: upgrade 4.14.2 -> 4.14.3
Date: Tue, 10 Nov 2026 16:52:26 +1300
Message-ID: <20261110035229.2940188-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110035229.2940188-1-ankur.tyagi85@gmail.com>
References: <20261110035229.2940188-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 03:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249891
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://ccache.dev/releasenotes.html#_ccache_4_14_3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ccache/{ccache_4.14.2.bb => ccache_4.14.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.14.2.bb => ccache_4.14.3.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.14.2.bb b/meta/recipes-devtools/ccache/ccache_4.14.3.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.14.2.bb
rename to meta/recipes-devtools/ccache/ccache_4.14.3.bb
index eae9a335361..b05058b20cc 100644
--- a/meta/recipes-devtools/ccache/ccache_4.14.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.14.3.bb
@@ -16,7 +16,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "35921f80a93d6453a874525f2e4bd97264c46ddc349d87aacc1032cde4dd2924"
+SRC_URI[sha256sum] = "d50587abd5b787a7ba48cb1d76f7a4f09036e0181e742fc7383a8b154d73f0ba"
 
 inherit cmake github-releases
 
