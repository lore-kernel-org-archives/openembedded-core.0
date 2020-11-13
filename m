Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.610.1605296946763374662
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 11:49:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eHMUxgwk;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id o21so15313001ejb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 11:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8YqsW/xhqc+J7WEOaanGHK+Rxo3+G9TPAjbjXRKJVK4=;
        b=eHMUxgwk/zx/WC8zhnN2WqYjM369cWL0Lsx63g/iqEnpgLyI3n58WrKIh0nEZFYYVX
         t4ZlWQiHUetvJzhPnUvPYY8L84rD4N08tApNOlS6UIY023dhAtBHvsZUhJbW5pXZEGC5
         A4TBacvS4zpdpTKUUwsitJ9BsK3X+v22tEQdbbSJOWc5Z9hzus/lQ3ly8IjCbG7MD/pJ
         QmKoTTuQrIUDzgYwkaAWGsDgsE1fAtZZbV/8FhhpXUAXsFgkGh+7GWRXNmikOYM7mFRF
         vMjrIh4vBHZsBAeC9eyA1IowjCzfoJ280kzxiCGYLFyxPdyEDwSxnGgXZ0Hkal2XT7gP
         d0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8YqsW/xhqc+J7WEOaanGHK+Rxo3+G9TPAjbjXRKJVK4=;
        b=O3aXQRwNbG17IJ0EzuyjFmUi1skJMSOt5gDAK1kna6oq+mWZFOf7HwDEnh8sTZOYWO
         /ZZn5aXnI4RqhVKRqgLSn89kRH0K9BpRUtBD2Mtr8/9yCgoLQcwEns5c9sYBI947Eguq
         Xo1XWAJtVfscdPlOXJtfqsgVebmVEHSyvNTE7Y60zZIyVamNIuCT6k3jDf0QYCwo4MDw
         bH0akmxWnQR+o+FB0D1ex9+d5eEOrx4PKoqhb11zu7RqPgLwB00dDFCzt8K0MXvhcT4N
         NhcJIsyAJF7ejiyeXvJDEuoDYdq7L9/WZL2Vd+vDIVgiM9LtiGkc6VMCyvW3OBv7s6HX
         XUbg==
X-Gm-Message-State: AOAM532Lk7f/z/5rZOHaBRs5J9/niE6eKS2s9YF70qhWVwaXj6FBdA0E
	j/N4D66iZdp5BQD1WwpXgm+dyfJNyI2dXw==
X-Google-Smtp-Source: ABdhPJwj5PxPpq7RG2afA675oIY6i3GwIeS2jNdGvQSB0ekHyshHP/i4iaoVHA8KmJqJhUk+46+93A==
X-Received: by 2002:a17:906:934d:: with SMTP id p13mr3430172ejw.245.1605296945107;
        Fri, 13 Nov 2020 11:49:05 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id lz27sm4499287ejb.39.2020.11.13.11.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 11:49:04 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 5/5] gpgme: use python3targetconfig
Date: Fri, 13 Nov 2020 20:48:54 +0100
Message-Id: <20201113194854.21266-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201113194854.21266-1-alex.kanavin@gmail.com>
References: <20201113194854.21266-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/gpgme/gpgme_1.14.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.14.0.bb b/meta/recipes-support/gpgme/gpgme_1.14.0.bb
index 9fa8212808..fb7215381c 100644
--- a/meta/recipes-support/gpgme/gpgme_1.14.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.14.0.bb
@@ -48,7 +48,7 @@ DEFAULT_LANGUAGES_class-target = "cpp"
 LANGUAGES ?= "${DEFAULT_LANGUAGES} python"
 
 PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', 'pythonnative', '', d)}"
-PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)}"
+PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native python3targetconfig', '', d)}"
 
 EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-gpgconf-test \
-- 
2.29.2

