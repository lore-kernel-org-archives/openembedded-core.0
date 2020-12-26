Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.19197.1608974896851215926
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TnxYkch4;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id jx16so8271298ejb.10
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NBdoJmyrUbj9yjP/91TGekk4oN05DVInkOLSk4wSMBI=;
        b=TnxYkch4t0cwwPM5oMqb7r5xFeCRBDHZRF4fX1wQvgdY0XBKrlhJcsUtCNC3oSt6jO
         rEuIqsuNCrffBhp0NZMrx0FJIDSKrS1/BvYj97+RvHv3Ls+TOIYN6bJVhvOn/Hi99MwT
         WVBMHP5Q+5RxyTqH4L41b9fBsi54IQ5rig5+YrelTGv817zLHLoJRNA+ZkMqZjY4XDLl
         sbQ53ihqYjB+55qJU3XHQEqmVrX6ogMc1Y9ZgpWLGxHz7JPnxbXAF8eI8h0VCy9APdo6
         TdgFtTKHDlIjgzn/owhk+eUtExuH7wkeuMzpAX4/PoWwKykwXJRyIJ2/XRoJ5UZoqovy
         ykpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NBdoJmyrUbj9yjP/91TGekk4oN05DVInkOLSk4wSMBI=;
        b=cZWAR8K5PQtWsn4NvtdtMOw+/kgtZcaJlTDi6XIWICz5ydStCl0iMMnUzSxwqTJGbj
         PRhmb06trqUfU1hW5WLdSsyi6f/TOcSAj/CZn4LMytpXICubQyZuqGkNf6A/IBqXHl7i
         887C+4cNvf65bjGSpS7ZUFQcfMbNb8ReA3cr8xJMcpsHjfYjzqoIdFemmuPu879DKZ01
         JT4EVTTbxZclEF3II5Nx8BaCazfFxXR50aWew8RNnZ0AMlDhcmdLJQWanyjC+wACFyA+
         faKfEjdWORgoYTTs5S5vr54K2ZMgUfriKi8P7MyvAdefLW8zzuzS98fRgAZ8xIvhqtBH
         iyng==
X-Gm-Message-State: AOAM5309s17ruEKFDGMOzfiaDpeqW0ns5myIH4b/F8h8H1mzbzUWGMsV
	uhAxZE4/zV8zmZZwtHRqcg8tAm2mV3s=
X-Google-Smtp-Source: ABdhPJyr8L84CjRMR1eub/M6BNr+UUIeHvZsTYchXvr83BFfE9lp8oj2xf8RKczd/b/xaUWP9mcH8A==
X-Received: by 2002:a17:907:a8a:: with SMTP id by10mr33712297ejc.423.1608974895508;
        Sat, 26 Dec 2020 01:28:15 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:15 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 42/48] python3-importlib-metadata: update 3.1.1 -> 3.3.0
Date: Sat, 26 Dec 2020 10:27:26 +0100
Message-Id: <20201226092732.52323-42-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct SRC_URI and upstream regex to enable automatic version upgrades.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...etadata_3.1.1.bb => python3-importlib-metadata_3.3.0.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_3.1.1.bb => python3-importlib-metadata_3.3.0.bb} (68%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_3.1.1.bb b/meta/recipes-devtools/python/python3-importlib-metadata_3.3.0.bb
similarity index 68%
rename from meta/recipes-devtools/python/python3-importlib-metadata_3.1.1.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_3.3.0.bb
index 56b57cc32a..23f2e2dbaf 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_3.1.1.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_3.3.0.bb
@@ -5,8 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e"
 
 inherit pypi setuptools3
 
-SRC_URI = "https://files.pythonhosted.org/packages/3f/a8/16dc098b0addd1c20719c18a86e985be851b3ec1e103e703297169bb22cc/importlib_metadata-3.1.1.tar.gz"
-SRC_URI[sha256sum] = "b0c2d3b226157ae4517d9625decf63591461c66b3a808c2666d538946519d170"
+PYPI_PACKAGE = "importlib_metadata"
+UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
+
+SRC_URI[sha256sum] = "5c5a2720817414a6c41f0a49993908068243ae02c1635a228126519b509c8aed"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.29.2

