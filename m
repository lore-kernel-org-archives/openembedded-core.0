Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web08.20404.1607112469212105167
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:07:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iN4/RaZG;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id jx16so10420208ejb.10
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1iunyz3/GvkWVYIMFRaB7lKyB5m7UkICdNICL9Ik5ak=;
        b=iN4/RaZGI8+esFEMqFBgFGjdG1FV2lB0U1IxMJBw1CKDXkW02JHiECsVb6F5gjT9h/
         pRIvufdbJxYY9NlgR1y3oLDrmJmnN6n+DucFvXbnSqSscFeip6nHPtxKzpemNgjlX39B
         qS5r7QI9X4rTEgrSZ14tMPXzhrAi2+CiMePo3hIbWVfe7fqNLXdUNe6wqhNJRTi2aHzN
         jBEO91D+pvKO5xwlD9yUEFOyOFDct5LwxjDIfMdViADT4rqWNHHsZ+CBabz+oshB6SYe
         XIpUDB6fv0U67wQ4KxTkeXS/8eiPqmH6aue1wG/+3lmFSNh3ymWBp18MlCowaaGiBLET
         IaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1iunyz3/GvkWVYIMFRaB7lKyB5m7UkICdNICL9Ik5ak=;
        b=EZAzRb6y+OjgPIqZslcWbjuUqyVNkP+XBV6R7PfJ01uvPBdsW/1CMGRjrfXI/YQBYU
         LN7H0z0HHkhHBp9FZxZBJf3Nv5ABZnoH9Aevbe6yOSl6mcNftmsEba3OGWlnKei8jmuk
         rtOqzGyuPjCPBhhfh/S8KX4TEnD3EWZrzLM290AqfyNxbZx3TCmjzV5qHIvkEwltiVcY
         5wMynRacI4uArXUWjClCJTC92tIn3H5JAgq2v4mspQlr1NF2zYjqIYlK6eBM8WsrZFzs
         Eu03p72hl0D75xgKrkleMeWcoEmrT7PAKCCPQiX3PLjr10+IqAS4QuHjhYjf/HmzeCnD
         Gc3Q==
X-Gm-Message-State: AOAM531CKYFvFa9Ouep1HgTFKlNfIDKijYROfz7U6aPIPM0sJOs+sYWn
	P4jpsIW7N2FPtFGO3+M2G6NEilSxE7Vw7g==
X-Google-Smtp-Source: ABdhPJzZLmXCL/npiMc+HHpkimnW/3jzmlDOYBbceXiC3cwsmMzu1N/xDJvfRXKEoB06AX9lG5ZUpg==
X-Received: by 2002:a17:906:82ce:: with SMTP id a14mr8787144ejy.421.1607112467565;
        Fri, 04 Dec 2020 12:07:47 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:07:46 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/23] vulkan-samples: update to latest revision
Date: Fri,  4 Dec 2020 21:07:16 +0100
Message-Id: <20201204200737.7072-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 980557a3b9..3785723232 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "f52361d3cd6ac8c30fc3365a464b4e220c32cfd6"
+SRCREV = "b4fe3addff337f3c264a6f7dd62be60c726fcc03"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.29.2

