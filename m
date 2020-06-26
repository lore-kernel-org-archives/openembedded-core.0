Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.2808.1593155973097454762
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AX8r9o7x;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id dg28so6132189edb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q3Preapz2RDx+JAXj56ENR4j5sQQu0XdUsLGRegfXn4=;
        b=AX8r9o7x6q/MnG9IR1FEpg5OUGElsBYaWx2QVQAZ63OjoisrApI0tBTTQxQHh1muWk
         mkjXNT9q+ZtqqXE+pe9djbmevq5dqwFpPQVGJvVUkirvpC+Q0aUWYn2UgUa042GDsSYF
         f+91UN16aIJIgNnyHZD1MwbnSoTt/I3NwnOU/ckT47eosylC13ejgQ2Wpsp1sPykVTO7
         nOpla8WD26qhZ4v4Hn4phjTa4GCzNSCodxE6p9r0KW7fP5m3vVrG3NpX6W40HTdw5KvC
         m7MRvESumCGMvOq5oATmLjHJl5ErznyTOhG6dCMMIQ8QnT7mg74H7UmRlfwodMfF0cgt
         4DDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q3Preapz2RDx+JAXj56ENR4j5sQQu0XdUsLGRegfXn4=;
        b=k7gM73Da/0bpuRZjvEuHXvTXI06tffA9pJlQNgfRkquQ+cERn6WHJZy5uH4kUHnLuw
         Hr1+WWRYtGHZUQl16I3iwqQoGjDMfoopt24d1uPv/Jla/3NnSA9ZzDbxz23e+FsMerDE
         d5gHxgbC3QsbaT37n/v5/FFjzOQMILt/WKi7flhNidWclo8fZi+xRze+sVapUtO/ssZX
         WXEGGb02YIpOeAG4hcbRGcqo890wYFMulPsSiWU+g4Mst2BqNXNxUUoyxNC1hCKyVRBA
         E8HzMDzDFa3q4h4GXgsNzcKywxjkob7sxOJZSFxhBk1B9anva/Dwmh4eYhmQcRIxKorQ
         pcyw==
X-Gm-Message-State: AOAM533hejJaAlXvn3/ILC21X9oOU8fLUkQuf9BmyoQpZonBqXVfQRjC
	94m5KuKG5bsmB1raDp1HiXa5AOEKjrY=
X-Google-Smtp-Source: ABdhPJz4KPxDyypbXfl1MYW3ycnVYrqjyxVg9yOcWt1RrDgfxaFnpOTe4Hi5KjWZKo7l5Eu/Pkebrw==
X-Received: by 2002:aa7:c54e:: with SMTP id s14mr2017225edr.81.1593155971399;
        Fri, 26 Jun 2020 00:19:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:30 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 28/30] go-binary-native: fix upstream version check
Date: Fri, 26 Jun 2020 09:18:42 +0200
Message-Id: <20200626071844.29134-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/go/go-binary-native_1.14.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.14.4.bb b/meta/recipes-devtools/go/go-binary-native_1.14.4.bb
index 3c535e14ce..72c988944f 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.14.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.14.4.bb
@@ -11,6 +11,9 @@ SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz
 SRC_URI[go_linux_amd64.sha256sum] = "aed845e4185a0b2a3c3d5e1d0a35491702c55889192bb9c30e67a3de6849c067"
 SRC_URI[go_linux_arm64.sha256sum] = "05dc46ada4e23a1f58e72349f7c366aae2e9c7a7f1e7653095538bc5bba5e077"
 
+UPSTREAM_CHECK_URI = "https://golang.org/dl/"
+UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
+
 S = "${WORKDIR}/go"
 
 inherit goarch native
-- 
2.27.0

