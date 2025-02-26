Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6898C021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 06:52:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.706.1740552733965175786
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 22:52:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OkaHr9qQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22185cddbffso9265305ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 22:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740552733; x=1741157533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Evq/fY2O1tYBd0ierxnCF7X3VrNenL3vVXIVL5O+cKs=;
        b=OkaHr9qQaKzcV2egQ2QKkSBDncoF8yOBg9HSvkAzjsKqhd7AqfwfOP3btL2z5cu1hl
         tOOEC+vlE5DuQExXw+CnI4TJ2dnxidCP8rIgapGURyKPWSN6zouxmz8iwTnTH1k4f4rT
         RR1bE+AYS6uFYzEdA9o+lQ1IMM5zaTL9zr/5ofyA1MMP5dyOnEHpuo28T0kE5a+0f8tQ
         XLp7oG+Lb4e23EQtLudvERSiCEoFVIMKazG5NH+ckNmi5S35nF8wnMhCvy8Y5BtqGZ32
         OdvUM2nvzv1gnpFAEnL4rnB55i9PAhNdD/vV2JQig4zQUktxbpRPFQiSz4TjPSXbgF+B
         yZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740552733; x=1741157533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Evq/fY2O1tYBd0ierxnCF7X3VrNenL3vVXIVL5O+cKs=;
        b=DhXZRI9XwvM42o9TUC5zn4e5mr0qfK6oWHcwg6gJyrfAhKlNuV7TnP5YlWaED0/6oA
         pWJYErReOmjZcQTL88ZeYqTGStgU1bAhoKEnAXphTtvny9vyA88HvWoM3FLNSo+GdCGw
         Y2xkopaiFlF2cYw/YbX7lNahjSllRgU7o/mq06FWUMuNYgnJBE9bru/B8GTpfp7zrb8W
         SYaPnMoGRVWauB7znkdZKkF5h32xGBPNTPpH9VrtbibCqkYJGf/dUo7ZFgyZfZDsy7ed
         N7uOYzior8yyM99UDx5OMjKJsapxBhT+WMpTtHs8YYfhLV5aHsu8t9tptX/uPZQSTxvN
         x58w==
X-Gm-Message-State: AOJu0Yw82f596BBpxCgn0y4wqY9pNK6FxNlKSzra9LUgdOKvpF7wY+Zw
	AReMn1FCUhk+MS9/V+D5DKCtDY4hBDVQISGgvEhjDYiFfXq+Feljvlcbow==
X-Gm-Gg: ASbGncsGDf+XwBvBjAVVQnZJfw7r59VYSy4zRXRoLN00pcjz8c9/VuIdPlOBIlhOl0p
	wJFNe4mF6kDdv7u6LOkmt1ThzWhVcmHQ+2o3TSlFJYNpP7ftound6iac2Zmfgcm4k93eRaY6Gqd
	cs5yCL3n8EdniqYxfTBwyY+7EuNzDbByCh5biTcslpmQzn2K0U5QpERvxQpOQRaFbg1FIEtKpFs
	v3/SXVF6/1a6faHhrMxbciXuWh7iuzZ/jBF5UAnzUxJlYUjlTiWfp3QLmb76xnAQn/8gOGJCiWR
	RLVshAeWk3x18QWDnH5hQ0aXSrJ+6vA6Cg==
X-Google-Smtp-Source: AGHT+IGbeJiJO5T0BwTOlF7OMW6wEexjkYPcYdExhY6de89mbJBe5o7ueeOEkq7F/bFmwSDNQ4LrgA==
X-Received: by 2002:a05:6a20:2451:b0:1ee:d664:17a4 with SMTP id adf61e73a8af0-1eee2e6dd98mr39633524637.10.1740552732923;
        Tue, 25 Feb 2025 22:52:12 -0800 (PST)
Received: from L-18010.kpit.com ([49.36.59.15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aeda7f85428sm2431146a12.32.2025.02.25.22.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 22:52:12 -0800 (PST)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Moritz Haase <Moritz.Haase@bmw.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][kirkstone][PATCH] meta: Enable '-o pipefail' for the SDK installer
Date: Wed, 26 Feb 2025 12:21:54 +0530
Message-Id: <20250226065154.365783-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 06:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211944

From: Moritz Haase <Moritz.Haase@bmw.de>

When testing a Yocto SDK installer on Alpine 3.21, we recently ended up with a
broken SDK. One of the commands the relocation script calls in a piped
multi-command chain failed (see [0]), but the installer did not realize that -
since it doesn't use 'set -o pipefail'. Thus, the error was never reported to
the user and the installer claimed to have set up the SDK correctly - which
wasn't the case.

Given that the SDK installer is a POSIX-compliant shell script and that the
'pipefail' option used to be missing from the standard, it's not surprising that
it isn't used. Thankfully however, in June of 2024, a new version of POSIX
(POSIX.1-2024) was released - and that one finally includes the 'pipefail'
option (see [1]). A number of shells already support it, so let's enable it if
available to make the SDK installer more robust.

The change has been tested locally using SDK installers for internal projects,
based on both Kirkstone and Scarthgap.

[0]: https://gitlab.alpinelinux.org/alpine/aports/-/issues/16797
[1]: https://pubs.opengroup.org/onlinepubs/9799919799.2024edition/utilities/V3_chap02.html#set

(From OE-Core rev: 1cb4b41c7faf77fcc347b1276d86d4288968c926)

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 10dce263f0230f94a44a017b5614811e696c5ce9)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 meta/files/toolchain-shar-extract.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index ec5e4aa922..380a25e761 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -1,6 +1,11 @@
 #!/bin/sh
 
 export LC_ALL=en_US.UTF-8
+
+# The pipefail option is now part of POSIX (POSIX.1-2024) and available in more
+# and more shells. Enable it if available to make the SDK installer more robust.
+(set -o pipefail 2> /dev/null) && set -o pipefail
+
 #Make sure at least one python is installed
 INIT_PYTHON=$(which python3 2>/dev/null )
 [ -z "$INIT_PYTHON" ] && INIT_PYTHON=$(which python2 2>/dev/null)
-- 
2.25.1


