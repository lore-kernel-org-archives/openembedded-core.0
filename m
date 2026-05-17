Return-Path: <joaohf@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFC5CD4F47
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 13:33:07 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23588.1779024777677071887
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2026 06:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XDkzXBIk;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: joaohf@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8acad04f050so2536206d6.2
        for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2026 06:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779024776; x=1779629576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W2avKcekv/wP3j3QLv0Lbr83SX2rpjpud3+Nxegtdgs=;
        b=XDkzXBIkEnu35p7NKNm7xAuknaG2pmwKLyF9KKjQ3LxeqoqmKA/eyjkWMJUsJdRQj+
         WWjkvmrHz3NwDFivNROYUlbBLF9nvKIBqI5dgcARMV8/nOF+2GLhWr56uh+lyHrdB73D
         FkDHQpRYnVZi1Terp9pmeJWvpFvrGGnpjIuzl8Nb88bdl41uDuJuVvnLaDIcCY0I7TDT
         sfcmBT5x27kaFtYZkGKQ/J18l1TZOHXERGQx1o/gmLAVMoTfkAgR73q237wtXWdKsQNR
         el2nEAdByIebys3e8Kaxn94ECV4jiawQdMMAMCPbpicTzgBCvJLje81O7MTOZoG2oRzA
         lIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779024776; x=1779629576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2avKcekv/wP3j3QLv0Lbr83SX2rpjpud3+Nxegtdgs=;
        b=ZifLafHdeWXu41I3p56glzBtn6ok2RMae2jNHdqPpknkcqZp+DSLZbEgmjjtl+U1vD
         QsdPv5mjFUoANTRzwiIxq4o/h0yiEbsRo5MYwUiu0vwRP9D9K9EozWhsHpSTYzCuVkYp
         G14zZDzRPiRZZvZyVUheX/ijXYxdw0UPitcY4QKwbnjjeBr1V018vJGYOmR4+m1qNppi
         kUuVv/wKLF4qsbHaJF0hwgdr7TsiS1ej1kXYohgTxIc36OQ47qAw1PAvnd+JJBGKwBSM
         GgOfQnxbixxEG7V4QEqCQFJbpdvXlj70x8v4KfFDlB1EMfs0eUL1jVfpgUjT6jljQw3E
         uKEw==
X-Gm-Message-State: AOJu0Yy0n7sxeEoHH9v19EsqE1zrbGDr5vpBnAOnUwzRLAfijtNsksYT
	ptGp3N62Ey6AmNxWQ0LMaCvYV+jzBQAlEmJMNPRDm198xlydToH4Edd2BGnJyQ==
X-Gm-Gg: Acq92OEhsYbDAhm6JSWuRQeKaA/Fc95v3eqoK2LxQ4prinW6Tq8ULKaPJWvwBBUKtZd
	7BEA1/iSSC8lc0gX8pdQxhC4lVsxw2Nb5RIQRBtoGBwpaFZrSgoaCkWqEE6JzWYyr15DZL1BY0c
	0lwFwKU6o76cWcjVcbf/d9PxX1kemJWmz5P0MD37q5UrDGeiNia3FPQ6n8pmJOzRN8zXVzY2x9x
	ojZNKV1vVokKdYsj8Yk+GsZkkDG4RKoX0m7hfWEHWAnQRE1z4ax1k4ZPzekoh2YRdk0Kk61CKPF
	g7P6ABDMHKEM29mky8KH3M6HQjoaKRnuN3iHIzSMXOoYh955/apc4DRyZaTQ29dEmJCWHhzDEMw
	MeHLku7LIcQDOp0li9fUmng5fJGfYBzjc6oeYy3JIDH565KddFvFudg4aNdJPsJdMISRw59k6vx
	cpk6dSn9O4XyRaMcSsuT9DT2QunzUxIPA=
X-Received: by 2002:a05:620a:17a3:b0:90d:11b2:80f3 with SMTP id af79cd13be357-911d13317fdmr1124103885a.7.1779024776537;
        Sun, 17 May 2026 06:32:56 -0700 (PDT)
Received: from porco.local ([179.110.123.230])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bae24879sm1248696185a.18.2026.05.17.06.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 06:32:56 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>
Subject: [PATCH 0/1] meson building nativesdk recipes with python dependencies
Date: Sun, 17 May 2026 10:32:40 -0300
Message-ID: <20260517133241.2972125-1-joaohf@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 May 2026 13:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237188

When building nativesdk-at-spi2-core recipe:

   bitbake nativesdk-at-spi2-core

I got the following issue related to meson not finding the correct
python modules:

| Program g-ir-scanner skipped: feature introspection disabled
|
| ../sources/at-spi2-core-2.60.0/meson.build:200:17: ERROR: <PythonExternalProgram 'python3' -> ['/build/tmp-glibc-beamtools/work/x86_64-nativesdk-pokysdk-linux/nativesdk-at-spi2-core/2.60.0/recipe-sysroot-native/
usr/bin/python3-native/python3']> is not a valid python or it is missing distutils
|
| A full log can be found at /build/tmp-glibc-beamtools/work/x86_64-nativesdk-pokysdk-linux/nativesdk-at-spi2-core/2.60.0/build/meson-logs/meson-log.txt
|
| Last 10 lines of meson-log.txt:
|   File "/build/tmp-glibc-beamtools/work/x86_64-nativesdk-pokysdk-linux/nativesdk-at-spi2-core/2.60.0/recipe-sysroot-native/usr/lib/python3.14/importlib/__init__.py", line 88, in import_module
|     return _bootstrap._gcd_import(name[level:], package, level)
|            ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "<frozen importlib._bootstrap>", line 1406, in _gcd_import
|   File "<frozen importlib._bootstrap>", line 1371, in _find_and_load
|   File "<frozen importlib._bootstrap>", line 1335, in _find_and_load_unlocked
| ModuleNotFoundError: No module named '_sysconfigdata'
|
|
| ../sources/at-spi2-core-2.60.0/meson.build:200:17: ERROR: <PythonExternalProgram 'python3' -> ['/build/tmp-glibc-beamtools/work/x86_64-nativesdk-pokysdk-linux/nativesdk-at-spi2-core/2.60.0/recipe-sysroot-native/
usr/bin/python3-native/python3']> is not a valid python or it is missing distutils
|
| ERROR: meson setup failed
| WARNING: exit code 1 from a shell command.

So, I think when nativesdk python/meson should look into native paths.

The same issue is also true for wrynose release.

João Henrique Ferreira de Freitas (1):
  python3targetconfig: export native python paths

 meta/classes-recipe/python3targetconfig.bbclass | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)


