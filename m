Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006A7C83F05
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 05:32:32 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.16674.1751434347803395171
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 22:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hvp0TyX8;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234bfe37cccso77663645ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 22:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751434347; x=1752039147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0E8k7MUW5DLV2e+UwVZb4eOkEsYVEyQ3UiSk6gs6Bmw=;
        b=hvp0TyX8fPvqI0/9Nmpp9vhqIdynyvQfD9sxnNBLRcG/RP/J/AyuN0WVcJakmSBzdy
         surjie9HFVix/sfYo2ZeWKpetP+NUnOWjGImogcsHSh0DWqvoWJX54YTWri0auXFUcht
         fcIJqOLSiE4/KeratRTQcadtOWe9TPUOMT6BGXrfNzCdKA9LHjLJVxw0lJApSAg/RAyh
         pssBhss7ODX/gYxEadJ32wCes2xxLkQsDP93AiM48Ikc87vUQ5aCfv/WFz4LAmjRGQtg
         2q3byHt/Yrkhq4Mc3DWfsMfOZDFcetB0U5o9gq+Drua/cBsOsZtNWMRPebdSvFLV3aYy
         8rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751434347; x=1752039147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0E8k7MUW5DLV2e+UwVZb4eOkEsYVEyQ3UiSk6gs6Bmw=;
        b=Q3c3G+6Kl6pqaoHbVegjqC/WwIVZVymAycUJKGIoScvmtQvv2ajXTYtC18d7KZw4Fj
         Joj4re7XZ4aJJk5lqv36KimCqA5JzOvZFIqZl00+kZtoiRO/nvo2xCUm5Z2QHvMu7jfN
         CQpmiPhK350JDTygiAgv/8oLpW3j4mBdWtgLWCuWDU8LSivhYFOjTHq6tKn805vsD4fC
         IT6L0R8Frx9S3M3kyBZ0Z4QGk8RAgRFx7Md9BdqJBHMXvYRjQ1ckZmW2OO/dUAHSW1DJ
         Tuea7MFij/zwcYtiw96TGcI51vQNc8OcK/jvBIm4d6klkspC+QdBMlKJSTa9Bm11Xn5h
         //RA==
X-Gm-Message-State: AOJu0YwSIuZnvBtE7W5rHcAl77/gLAtU8YXIkj8K2aY0XJCBQUnQyEcb
	8QKRfWv1+yEa6ESGJMCpJuO1H3UdNdbmopedi/Pt5eEbwinBKOeGbM4hIftj8LKR
X-Gm-Gg: ASbGncvytC4/DVVaZaZPASyAPllXjJviUL8mHXwpv7mT5quoIF7PYvub9LmpGpkpycE
	fJuhqDtB5sFlpfhv7O3zYVco/HWFEc02RHBz7v8h/tU1z415YUa48Ew8cM84LR+OyvE/w6IEkkr
	aw2Ho9JZwO9iWV7HmHWYzgBG7/FGzThSP077XIZDGQr8uTvlWowwiAQ93cLbkvcbDto7x5LEcJj
	BJJrIRlLFog/e2I9f5dfhHzRYeBZ+ZvSmr+MC1v54RrnstnII1IukeWSP5Kcw0xVgi4YjhCYT2v
	XOmh8jPmlVhc2UsSZEFI0u142xi0XFzVYX5cW5q83RSH7pFbavlJqg==
X-Google-Smtp-Source: AGHT+IEkPvJV8L87pI5uCd8lc5uBFKFGio6bLCHkONaagTilE7otuhNIKxo/ozpW81cta6nQaPQ32A==
X-Received: by 2002:a17:903:19c5:b0:234:8a4a:adb4 with SMTP id d9443c01a7336-23c6e583883mr25445375ad.21.1751434346897;
        Tue, 01 Jul 2025 22:32:26 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e2423sm120125985ad.37.2025.07.01.22.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:32:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 5/5] sanity/utils: Directly use gcc instead of BUILD_CC in host_gcc_version
Date: Tue,  1 Jul 2025 22:32:20 -0700
Message-ID: <20250702053220.4104358-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702053220.4104358-1-raj.khem@gmail.com>
References: <20250702053220.4104358-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 05:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219778

This assumes GCC compiler, so feed it one, BUILD_CC might point to
clang as well in that case it fails.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oe/utils.py | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 27d304ec72d..d31f8c3db36 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -446,21 +446,17 @@ def host_gcc_version(d, taskcontextonly=False):
     if taskcontextonly and d.getVar('BB_WORKERCONTEXT') != '1':
         return
 
-    compiler = d.getVar("BUILD_CC")
-    # Get rid of ccache since it is not present when parsing.
-    if compiler.startswith('ccache '):
-        compiler = compiler[7:]
     try:
         env = os.environ.copy()
         env["PATH"] = d.getVar("PATH")
-        output = subprocess.check_output("%s --version" % compiler, \
+        output = subprocess.check_output("gcc --version", \
                     shell=True, env=env, stderr=subprocess.STDOUT).decode("utf-8")
     except subprocess.CalledProcessError as e:
-        bb.fatal("Error running %s --version: %s" % (compiler, e.output.decode("utf-8")))
+        bb.fatal("Error running gcc --version: %s" % (e.output.decode("utf-8")))
 
     match = re.match(r".* (\d+\.\d+)\.\d+.*", output.split('\n')[0])
     if not match:
-        bb.fatal("Can't get compiler version from %s --version output" % compiler)
+        bb.fatal("Can't get compiler version from gcc --version output")
 
     version = match.group(1)
     return "-%s" % version if version in ("4.8", "4.9") else ""

