Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.5149.1613233066592861164
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Feb 2021 08:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LrFnz1ty;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id v14so3318408wro.7
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Feb 2021 08:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vr4CWEQdgGfWQwhmn5u74gLxhpT0S/j9ePeVAq/cVuA=;
        b=LrFnz1tyqKWndkTNQnqaW+ho+QLpuasC6yFV9W7JpOTZDEqcmaDstBrn/HY5MMDf7k
         2dqaV+78rYmYhJg1+Uh4jVKcttdfod9KdHrk1UqK4sitTHcY0Tpqr/XEe0Gai5aMSAXg
         ut9wCTJwEmMW6yChnaN+wWKDIKvb5ZHO19BJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vr4CWEQdgGfWQwhmn5u74gLxhpT0S/j9ePeVAq/cVuA=;
        b=UW6JoUeU8bGm1ZiCEgHhFM9eLfqyeCclrycfi44qKzldKatf8EPhDTvkxz+mdxS8pJ
         lpAdq967EZMGcv3uWsC/tJ7I7JekNQHqxMUAjDRe22qRk2LBDBRIurTB5JGQJ4UPVfjg
         GYPpC3N4a5OFLtemstebylR6st3QyfrtGdCA17o8NQF0Hos/gLtl2vQ9+WANkBbyvaZX
         nyd4JhRkWPmxDFyRkKdmn1T77vK8BO5DHiIJnNZIwUnp7vQ/FQDfwL78P59FmMfW+W2f
         Dplh3jAdhhHidhPfub/tLbK5smw7pVopYymaNk4GoC9kUbjLmFP3lBLXsKOTW/vVAmDk
         cXcw==
X-Gm-Message-State: AOAM531ICsPzNJvun6EFV197xkZlHD3dYKumosPDotkCl7cMkkTuXj+r
	Q17/Zxu0vo6C/CULLh4K0kFCCAGi87rXmw==
X-Google-Smtp-Source: ABdhPJx/s3qGj+OcnotwFDcLwwK808XslNEyDPneNOvb7PkivntrTYm1YjBxYdujYbOAYwyonBxRQg==
X-Received: by 2002:adf:e3cd:: with SMTP id k13mr9199018wrm.289.1613233065156;
        Sat, 13 Feb 2021 08:17:45 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:91a5:e7fd:31d5:331])
        by smtp.gmail.com with ESMTPSA id x15sm15705208wro.66.2021.02.13.08.17.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Feb 2021 08:17:45 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] selftest/reproducible: Remove no longer needed exclusions
Date: Sat, 13 Feb 2021 16:17:43 +0000
Message-Id: <20210213161744.1938647-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210213161744.1938647-1-richard.purdie@linuxfoundation.org>
References: <20210213161744.1938647-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It appears these exclusions are no longer needed with master, drop
them and improve our reproducibilty metrics.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 860c8c95886..cb4c59ca6fa 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -29,8 +29,6 @@ exclude_packages = [
 	'babeltrace2-ptest',
 	'bootchart2-doc',
 	'cups',
-	'cwautomacros',
-	'dtc',
 	'efivar',
 	'epiphany',
 	'gcr',
@@ -45,7 +43,6 @@ exclude_packages = [
 	'gstreamer1.0-python',
 	'gtk-doc',
 	'igt-gpu-tools',
-        'kernel-devsrc',
 	'libaprutil',
 	'libcap-ng',
 	'libhandy-1-src',
@@ -56,20 +53,15 @@ exclude_packages = [
 	'lttng-tools-dbg',
 	'lttng-tools-ptest',
 	'ltp',
-	'meson',
 	'ovmf-shell-efi',
 	'parted-ptest',
 	'perf',
 	'python3-cython',
 	'qemu',
-	'quilt-ptest',
 	'rsync',
-	'ruby',
 	'swig',
 	'syslinux-misc',
 	'systemd-bootchart',
-	'valgrind-ptest',
-	'vim',
 	'watchdog',
 	'xmlto',
 	'xorg-minimal-fonts'
-- 
2.27.0

