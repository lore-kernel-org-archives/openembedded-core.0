Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.1169.1604335803444302364
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oNzYtyrL;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id k3so19760130ejj.10
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lu7p/ve6arHapqUwrPQUAhJQcs+JH0EFXtveE+/BhRU=;
        b=oNzYtyrLx1dyFj60VmVdIS44Bbj17veUPFX1pI4OYNZAREa/cJd8m39uQgfwbjEHCt
         hmPK/8mZdA4ms62C28IUe+MJk/diXxtlN6VYcrhpGa6sbRjGsFZQi3YxLT8/c0YuuW/o
         cOhWMOqo6oTqpy4IZug4ytTyWDQ6r0eLpbpD186GESxwdW7KhUefQeXibaZX0lMIYOkQ
         oorR8RZesMudCGO5PbLCpV7ky3/4US+IISycOtx0toFPtcYhUqRDF2KB0s9mMsQyifAF
         UphZFALNQs9zPmpSauWbBOWwyEu9yjiGlP4cf4DMo3eTFd7gPaf60aOMri1eQmUiOq/l
         OA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lu7p/ve6arHapqUwrPQUAhJQcs+JH0EFXtveE+/BhRU=;
        b=MeuR1qxVlRibu6Rt4/b173ywFZ5dWcWQfgTWb+KN3/xIM9L/enzX0SwzY1Rc4hA0kk
         A/foMGFojS14haXlwnx1fuzOI9UZngjMliwJvK69isS2Geuuhy9d5O05CLlCKQY8BC8O
         nNjhr0OMeAXzKkSS2aZcGztRXMT7tgQvZGMR6E4oCSDMHkBeLgdOORAJTqSWTKur3xlv
         XbsTs2J/tzJzdyYxqpzP191/ZgZGlCHo5O95dD/4GtYQVf+UfQRw0PaC/c9hhQPnjGav
         sa2X99mOLZ0dq/U/Gabz4hCg/SmTQ5zccn/QnmxZ0fc/1y28T0awls5dGDhnUD9ya0ID
         q3mA==
X-Gm-Message-State: AOAM5324m8Eqf/rIlxawW5Rp2A2h+TP09RzDkdpLr1eh5+5X3Q9kAK+K
	FrgBFSp2QuSMHIE05kd3DJos6gGhTGcnZA==
X-Google-Smtp-Source: ABdhPJzc0B1+3UFoZdDO4GrxuQgg5cULcwNZ47+nYaPiCAYnbzUsjvDKDDgQma9osi1x892olk10gg==
X-Received: by 2002:a17:906:a891:: with SMTP id ha17mr1506966ejb.116.1604335801714;
        Mon, 02 Nov 2020 08:50:01 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:01 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 50/80] dropbear: upgrade 2020.80 -> 2020.81
Date: Mon,  2 Nov 2020 17:48:37 +0100
Message-Id: <20201102164907.27572-50-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/dropbear/dropbear_2020.80.bb | 3 ---
 meta/recipes-core/dropbear/dropbear_2020.81.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2020.80.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2020.81.bb

diff --git a/meta/recipes-core/dropbear/dropbear_2020.80.bb b/meta/recipes-core/dropbear/dropbear_2020.80.bb
deleted file mode 100644
index 088c71cb99..0000000000
--- a/meta/recipes-core/dropbear/dropbear_2020.80.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require dropbear.inc
-
-SRC_URI[sha256sum] = "d927941b91f2da150b2033f1a88b6a47999bf0afb1493a73e9216cffdb5d7949"
diff --git a/meta/recipes-core/dropbear/dropbear_2020.81.bb b/meta/recipes-core/dropbear/dropbear_2020.81.bb
new file mode 100644
index 0000000000..c7edea84f8
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2020.81.bb
@@ -0,0 +1,3 @@
+require dropbear.inc
+
+SRC_URI[sha256sum] = "48235d10b37775dbda59341ac0c4b239b82ad6318c31568b985730c788aac53b"
-- 
2.29.0

