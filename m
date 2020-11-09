Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web09.8728.1604910710205844985
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 00:31:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t+HNL57w;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id s25so10995954ejy.6
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 00:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EQA3iAY5I3Xru8IfWqNsOJse8SNHZAOQmcjbnyCnLtw=;
        b=t+HNL57wCavATDn2VZJwWhb5tAu/Amibd/A4e2mn3gJgHmN2UwM6v0A9K0LbISzphc
         wGRibz2SkTEc5jmtwVhK3jjtGnVNwQZfI4yuCbzNfoCEfjJP4wE2tb1P4OZbcYojFcrK
         qT+MAGrXrFUolih+5LQRcZQG/1YW08zof8Vwtdl8reywAghscfk+mlXnaq0Aoip1Zm4H
         101h7oJ3lryKQAhqmi88tThS5BCuhHI7qHVdiYsyP68rlURR1MU2Kbsu10uYamnfRdKz
         i8zb00dsVrWDWcSmNtWonFVvBfkt8qQSMX94hVUhMs9Qb9XtfWg55rQuPNMqhzN7FldQ
         fdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EQA3iAY5I3Xru8IfWqNsOJse8SNHZAOQmcjbnyCnLtw=;
        b=QdJnhpEhxjDPmTeYctaEgKpuasXi8RueyqQg3ykcee4sq/35OmD1pVHiuV/KJjwDfe
         RzJsmLvFEvckokMG+FEiBi+abywtHS0iszz1MWgoVeelykcnbB/tpmsf0srrqucJ301u
         /GtyVmEiaS8lEjpBWGMqCr7UyFq5+Y6Wp5aN+jrrA5SemsoQMLJyeJ6EOrNJ95QapDuC
         LpSMKPUS2qbdCwXRNyK/hxWMjnJ5gcL1eJeG4OHY3Y24/BLgkfkZGHEPnoPJS3vLJds3
         4us6w/dghiA6SWp13t4IrSRbVdAsFnU2DFo2EwlmWRqRBnESJfwgbsKrswkj+sfZO/ET
         6lYA==
X-Gm-Message-State: AOAM5323cpBZW/R/5gEwvAOfrhZnzXsylN8MChQIHVda7YZykXD1anFH
	a5ERtel3wiake9BQIxzhk4mdyxzn/4ns0w==
X-Google-Smtp-Source: ABdhPJxmRO6siNdgX9KX/BtuZR8lpU2vfKb7CeWRAc5Mmkx9N9sOZI7niCPfylhkf0ftwd2d3tDziQ==
X-Received: by 2002:a17:906:cc8c:: with SMTP id oq12mr14409651ejb.177.1604910708570;
        Mon, 09 Nov 2020 00:31:48 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id sa23sm8187691ejb.80.2020.11.09.00.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 00:31:48 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 07/12] conf-notes.txt: mention more important images than just sato
Date: Mon,  9 Nov 2020 09:31:28 +0100
Message-Id: <20201109083133.16503-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109083133.16503-1-alex.kanavin@gmail.com>
References: <20201109083133.16503-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/conf-notes.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/conf-notes.txt b/meta/conf/conf-notes.txt
index 5af13a8357..1a9414a040 100644
--- a/meta/conf/conf-notes.txt
+++ b/meta/conf/conf-notes.txt
@@ -5,7 +5,9 @@ You can now run 'bitbake <target>'
 
 Common targets are:
     core-image-minimal
+    core-image-full-cmdline
     core-image-sato
+    core-image-weston
     meta-toolchain
     meta-ide-support
 
-- 
2.29.1

