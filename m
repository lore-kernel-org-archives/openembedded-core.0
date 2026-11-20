Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6329.1795182840367305114
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:54:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GpZfRrQF;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso9123565e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 05:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182839; x=1795787639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dSI+31ZgQbseRx/DeUkISc7ekuIlP5XcIMXf9pbqaEs=;
        b=GpZfRrQFySkAjFbT3/kUV3upfVyZI6kVKBZVReaVPTmf4Bi8gka2E7unnVylRtv5a2
         OldNRwBQmH1YgB77cZFZf/jw3wwPaVwL5oPZnGeF4bsEuHU1vNM9Oicg2DIXC/4RAzXW
         WYDW/nFy2aoX4T7FyVzB7ucrNv6t5InxCYLLW/G9A1/R7EVn9isUsvC3ijFmyoJVsbf7
         HoJVTs5ZnOBIM4LP+07gEi4QK3aBz00zKYZtK3U893LhacDft3EdWl3yH5ymsbLDXAIk
         S6ZM0EBqBaSRUleTu+WLH89AMqY3uzxKFdaYyUJnWw7UQJHq1ePbqAE6EK7lP4HxY0ux
         OYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182839; x=1795787639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dSI+31ZgQbseRx/DeUkISc7ekuIlP5XcIMXf9pbqaEs=;
        b=t8gx3mqKRr9Dm0uIZ9Mvu+bPD3Qgua6F4IjNLW/QDRlR63PcS4ooSEIR+IlKmgewtm
         Ed1kYnUga5qUAWeMg5thnhS4HArD0PHQCmXrw1GaIxmRpJlx4yshoNwPSOR09e+F5AEC
         Xybxk2ABciXLI7nB5TOlJXqslrMOyix/wG531mfjUuAgF3zvzvgiM4YLvVBDqww3qJf4
         yj/dgvOV75n2DEc6yCSKrXUUxuOisZUIGcjln97ntw7o2dPbELROkRSSjt1FztBPZkoC
         6gsLtEtwzXyarbr71jO2UikHuG678CFpfB2tBxMzDiZJylvyOeBcjvas4vE3ZjYc6nQx
         GeIQ==
X-Gm-Message-State: APuU4Z85ZG8cN8aPJV5SDiifA4wjrhDaM0pL3/I5Pm0i230hO1iSKJr3
	RB2T0hGWM06b2ASr6G8Qr2sS6Z/QV+3IJ/4VqVWiCVG7SOF/mzhm2ou5XfEXPGL5
X-Gm-Gg: AYBFou0ulabMu0Tw5qJxJlYSqPeIIGaBrMojVMG2ld1AIiFuckQndkjVjCH5GCJCWJg
	kdr1mayWRRVG+4vmTOS/dEssnpEeCmySPIOkYauGzCke4mSecZnm0Xp5MNKK29JRJO1dTyuXiPS
	dvjsMAZrsQFxtg7dFtqaaiBan9zzIMSnvIBA/fwzm778D6liXuMu0ZFfPceKGV9wEg8YgiHi0lO
	B0DILiq0W/eF2V03Lsf5HNZZDfpn7ugQYKenwz50l81kPFVtyvSjuDBW3Jpvh78xkezJJgNs1K/
	XokGEyDrU8D4ykbDcXjCJsqWottFUxEKxWfgHLObhqYm0Q1mBBPc7D7REkyYCUkcPKF3PpT7mfu
	GXpIwueINbgx6xc5WcZnU+Gt8/QjXGX6BDePxlBimqvuAWoYVSqUTTkhmpDKNYDj/x1bfCrHQ0Q
	tsmvpFTKEiVl0npiDFaJdmd3+wKIk1j0jpm5xltj9QnFHV3SDZ3g9lNrE8kYVA/6YjUTh5cro25
	j/RN6havy0lSu6r6TO/yYyfc7lycOfR2UXeq9eNm5dGnrRcPjlrTB/U4R5l1nMdWPI2d363AnBP
	oBTy2ZIDBeg=
X-Received: by 2002:a05:600c:a09:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4bb88829115mr69268985e9.35.1795182838489;
        Fri, 20 Nov 2026 05:53:58 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f6b6a6sm101009695e9.5.2026.11.20.05.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:53:57 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH 09/10] recipetool: create: Clean the recipe after its tasks
Date: Fri, 20 Nov 2026 14:53:40 +0100
Message-ID: <20261120135342.2628228-10-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120135342.2628228-1-stondo@gmail.com>
References: <20261120135342.2628228-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:54:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250802
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

recipetool can run tasks of the new recipe, as it does for Go. These
tasks leave stamps, for example for do_unpack and do_patch. devtool
then builds the recipe with externalsrc, which uses other stamps, and
its do_clean removes the work directory. The first stamps stay.

A later build of the recipe with the same signatures trusts these
stamps and does not unpack again, so the source is missing. The next
commit runs do_update_npm_deps for npm recipes. Then
test_devtool_add_npm followed by test_recipetool_create_npm fails:
do_update_npm_deps cannot find npm-shrinkwrap.json.

Run do_clean after the tasks.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 scripts/lib/recipetool/create.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 2df17dd6e4..b2cc92c90b 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -955,6 +955,11 @@ def create_recipe(args):
     for task in run_tasks:
         logger.info("Running task %s" % task)
         tinfoil.build_file_sync(outfile, task)
+    if run_tasks:
+        # Remove the work directory and the stamps of these tasks. Else a
+        # later build of the recipe can trust the stamps, also when devtool
+        # has removed the work directory in the meantime.
+        tinfoil.build_file_sync(outfile, "clean")
 
     if tempsrc:
         if args.keep_temp:
-- 
2.56.1

