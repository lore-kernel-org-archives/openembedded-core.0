Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.26689.1613945840264173589
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 14:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d2YkQAy/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id n4so17144115wrx.1
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 14:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WWOfIfaIAOpEaStL0WPHMqNUYbwwLBK8qegfEbBPLg4=;
        b=d2YkQAy/3XTdupG8UCxfnC+25GuG41HkfBev9C+jxLDaDXXnquSAVQQjRScuQRtzd7
         m5meUotBp0X2XKjqo9PPhwALtH/gpXHGAa0aPjlxXw1kZ64ly1jmkeKEp+PqYtNszOAS
         J+QABujgPInA3KzjWW3kn9wdNPAeO0algYsBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WWOfIfaIAOpEaStL0WPHMqNUYbwwLBK8qegfEbBPLg4=;
        b=qgyAtpKRuYUvxdNwKgVIZdPVNPNJlF3D/F6l0d8JSsu2pr/3p0kX4sxljm4rgfelsU
         EYi+bCcE/USE1WKbEN45uICz0zZz0lyEm/kHrR/Mbr7h7rMTWJNtZ1p1lV20U7+h6nuO
         ZGvr7qeyxjgB501fHs6+WpfDN+Mw4l20KjV97F2KKCc2HAzyO+6pKUaKkc2eCasYASQ5
         V2Tq9G4xAVoSARnA3NxdJ4ycNwcUjE3d184uUfshlscI/LylLYE7Wpn0TFD2y8J4NJqp
         T0vkXnNuMHyP/PzqFl2caWkxej8kQlgzCCUhY/UbcLEivzrjBq6jkLrszKAdgCjtmgIQ
         ycbg==
X-Gm-Message-State: AOAM531vMabHodiu2RvuJTdgOdQmraA5nJ51SaG6UXGr4mtYfCV6opdW
	gQr4TI2mS58+JlajAogW71/02+NshR+avQ==
X-Google-Smtp-Source: ABdhPJyFUjg33TSn9gkilSSAdgfmFFVf62y+ZT3X5GamxlB/iltc3P0vJ65xZq58CAMU4cgulFtFYA==
X-Received: by 2002:a5d:4d0a:: with SMTP id z10mr12218964wrt.69.1613945838724;
        Sun, 21 Feb 2021 14:17:18 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id m4sm10196612wrb.87.2021.02.21.14.17.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 14:17:18 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] selftest/reproducible: git, rsync and groff now reproduce
Date: Sun, 21 Feb 2021 22:17:12 +0000
Message-Id: <20210221221717.3714714-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210221221717.3714714-1-richard.purdie@linuxfoundation.org>
References: <20210221221717.3714714-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

git, rsync and groff have their reproducibility issues fixed, remove
from the exclusion list. Also fix whitespace.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 9785c5ffac2..58704dcdc3b 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -34,13 +34,11 @@ exclude_packages = [
 	'efivar',
 	'epiphany',
 	'gcr',
-	'git',
 	'glide',
 	'go-dep',
 	'go-helloworld',
 	'go-runtime',
 	'go_',
-	'groff',
 	'gst-devtools',
 	'gstreamer1.0-python',
 	'gtk-doc',
@@ -55,14 +53,13 @@ exclude_packages = [
 	'lttng-tools-dbg',
 	'lttng-tools-ptest',
 	'ltp',
-        'meson',
+	'meson',
 	'ovmf-shell-efi',
 	'parted-ptest',
 	'perf',
 	'python3-cython',
 	'qemu',
-	'rsync',
-        'ruby-ri-docs',
+	'ruby-ri-docs',
 	'swig',
 	'syslinux-misc',
 	'systemd-bootchart'
-- 
2.27.0

