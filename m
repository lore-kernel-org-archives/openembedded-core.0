Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BCDCCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 12:47:03 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.17788.1759841217265325317
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 05:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NRLwc0gw;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e491a5b96so35733425e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 05:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759841215; x=1760446015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hUr1N83aDYefj4cEwmbjvjeXoND48ErYQt0PpUb15Vw=;
        b=NRLwc0gw5G5UY0iT6uGEK1ChUFMTrpTbwWfmxGCBjmlDfhDOOIL+AyVq3sYb+a2BYF
         b6JFyJnFRP6pFMax5u0VmwNtLJIoriVYmn2z9HEz/WjOgGuTxUBwOp1P/eH9GQ208WnK
         DdIGG9SpIivCHcXPMTDC625MIWf01MdKae53d1Nuvt7UspVWGO+yKGq6HCOLURrhE6F7
         RgGaAnSd5Rm6eLp4dxIC7V6udrmQsrWj1NizO1qpBEL3Ie90j6c2szNS9yVNSc1gvd8U
         eELxQfqKIg+pq1b/ZD1dkAJHRZHtmAQW8FchxtIk7bEFPz3fa+FzVMlRJ5dzo1UyfW+n
         mtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759841215; x=1760446015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUr1N83aDYefj4cEwmbjvjeXoND48ErYQt0PpUb15Vw=;
        b=lIsfb2jdGGztInm+TEIz37tjTIH1QDkCeOSx9CSXENKvwAz3rNSdlouSNPog4WS9nq
         403fFCp12PpRZ19YGJ5wL7QkEpU15J/6zhUothMOqeefzAdh3XnCFAFLslVWgFgexiX6
         1voG8CoaoPcFikt1lpdp0jdfGKi21iZCoH30f9JJ+DPrRAb0TNBEmbjYarn9p7jcsk9w
         yx0a2LBopdgCuOvE3yppZwsG0jm32HG7tAYhQ0rS8DdTp1R+ZDYh3rfmgx6OKuikoUEr
         6K833vs08DmWuOK+GJyx41TFiRxHM9P/RqSEJ7NRRHq8iMTVNEkrEKagMA7aVulhkf3r
         bYgw==
X-Gm-Message-State: AOJu0YxajJj8E7iORYVigTv3BFNBJLa1BN8uXsrT6GKa3Nv7R4gAJ5en
	dqbAzVcE6mdAH+jpArNaJAgOi0WSMYMgJGMbfWXKlrtxSRASBt8AF9CuG//ZtQ==
X-Gm-Gg: ASbGncueDK5kKL4k4jlhIhJTn8gR2UdIXoixA9qHE0PPCq06OqGQw6c7zwFC7fPBVkk
	eEve9JOJc703t+OrUFT8xstgZxa3XE56q7F3WZfauP5zAuNJ6/Y2IWWqLfsBMLjZ4qRzs1/9HaR
	qoJgbm4M8S7qFPF4v/DvBIt2E8rnVfpTkvX8A4cPn6s19hYm9LK1doOXqsGqBtG6cTANnZb9e14
	Mtz5Ap/Cv69943mX6aq0eflKfy6O939OyzNDl/9rxiZJERkqImFMqw0x1Ihb4kVDv+Ee90pQp2t
	3c8CdIoWA/qJgsLhSzrh7kt5e0HJjRAqzpM1awPseL4ceGar/Jfrg27oVPilFP9NlOp5ApKp5k+
	Ss1pE4h/9rBhz1SeTuJfdYjixgMQVRL6okhL4FTyTWgYY1oxxCLbePgq4OrhRdWhqGLb8ueVBYq
	mOLUT9siWEGTa7uSJjY/fiJfPav78J8IB/SVz0jo5oVEjSQsdQJ1W7ybKpDdE9Apcj0nd9sdLqJ
	ocPMEHBM/cnN/aqzcsZ
X-Google-Smtp-Source: AGHT+IFf34RyxIC7OY+AauvxpqU22TZviyU9DQhNHrfh8M4O4RwGY4sbiDs3yGifk3Ux6o0vSO5d+w==
X-Received: by 2002:a05:600c:1c28:b0:46e:6d5f:f73 with SMTP id 5b1f17b1804b1-46e710f6c5cmr115257625e9.3.1759841215255;
        Tue, 07 Oct 2025 05:46:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e7234f547sm222707325e9.9.2025.10.07.05.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 05:46:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Richard=20Gr=C3=BCnert?= <r.gruenert@pironex.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 1/3] scripts/runqemu: raise an error when bitbake was not found
Date: Tue,  7 Oct 2025 14:46:50 +0200
Message-Id: <20251007124652.259629-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 12:47:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224531

From: Richard Grünert <r.gruenert@pironex.com>

Running 'scrupts/runqemu' without bitbake in PATH causes the
following error:

```
Traceback (most recent call last):
  File "/home/rg/temp_stuff/oe_2/./scripts/runqemu", line 1807, in main
    config.check_args()
    ~~~~~~~~~~~~~~~~~^^
  File "/home/rg/temp_stuff/oe_2/./scripts/runqemu", line 624, in check_args
    s = re.search('^DEPLOY_DIR_IMAGE="(.*)"', self.bitbake_e, re.M)
  File "/usr/lib/python3.13/re/__init__.py", line 177, in search
    return _compile(pattern, flags).search(string)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^
TypeError: expected string or bytes-like object, got 'NoneType'
```

This patch adds a more helpful error message to inform the user that
bitbake was not found, e.g. because oe-init-build-env was not sourced.

This is an example of the new error message after the patch:

```
runqemu - ERROR - In order for this script to dynamically infer paths
 kernels or filesystem images, you either need bitbake in your PATH
 or to source oe-init-build-env before running this script.

 Dynamic path inference can be avoided by passing a *.qemuboot.conf to
 runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.conf`

 Bitbake is needed to run 'bitbake -e', but it is not found in PATH. Please source the bitbake build environment.
```

CC: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Alexander Kanavin <alex.kanavin@gmail.com>

(From OE-Core rev: c9744f2d294f5baa8c4c9c795eb73d269f943b0c)

Signed-off-by: Richard Grünert <r.gruenert@pironex.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 32c7a2aab3b..c28980e6163 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1714,9 +1714,6 @@ to your build configuration.
         self.cleaned = True
 
     def run_bitbake_env(self, mach=None, target=''):
-        bitbake = shutil.which('bitbake')
-        if not bitbake:
-            return
 
         if not mach:
             mach = self.get('MACHINE')
@@ -1733,6 +1730,10 @@ to your build configuration.
         else:
             cmd = 'bitbake -e %s %s' % (multiconfig, target)
 
+        bitbake = shutil.which('bitbake')
+        if not bitbake:
+            raise OEPathError("Bitbake is needed to run '%s', but it is not found in PATH. Please source the bitbake build environment." % cmd.strip())
+
         logger.info('Running %s...' % cmd)
         try:
             return subprocess.check_output(cmd, shell=True).decode('utf-8')
-- 
2.39.5


