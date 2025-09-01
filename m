Return-Path: <dpmin7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973B4CA0FF0
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 08:08:48 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.46383.1756714125585098330
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 01:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OSKwZuG9;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: dpmin7@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-248c7f955a2so35751825ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 01:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756714124; x=1757318924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bnJVA3XA6hnFiP20xqldfm+qYLzkvT7uhi6vJmnNlDw=;
        b=OSKwZuG9/rg8KBvlrDGfhdjMerUPNkP2NMjTg0ckSSblgHdrgmkYxS0q+BAKmRdlkH
         GCLogAkoOth7hhyadSCkwzU4YEuYPoa78L+QRAOkR/TRbELVMji+kBcJldzJ5ld/tvRb
         cjTq2yI0wgO9cnbYkS5xZPRvRZndqukSvAHvJONQb5nFBeXXNPfHi8BnicbSL6GGXVt3
         Nedm1uuonqeHWYBYO2p7EYZBnDkjZtBxD1uHKJK9ZuPET1ki298/i7kroIH9E6kz5Myb
         X8QmXvswME6wqUTrLaEb1wkqah8HPFZnnOPMCCrFD9B6VB52qjXzw6D8fWP9kvWi4f4M
         1WiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756714124; x=1757318924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnJVA3XA6hnFiP20xqldfm+qYLzkvT7uhi6vJmnNlDw=;
        b=XgJxSRrlRotUc0HLg0terH4xNCVknb1Ag5n3TMFO3l/8yxTo5VOt24bi1YbDWpXPzB
         kdCONgu2NAOsj7uooQMwEELk4KmzNG5HzIHgy9xkg+WsmijlMlmKkBDDjgawRgsGcNZ7
         S9hvWVQzkATI4S3jabGrgrt1lixXzAZqsRza8jZGyNxKHZQ5Ly9PTTBqgS8q7VEudtF2
         XkJbLGOiTZrqmkKEbWnqawmui7uxnhwxEy3P03Wwgq/aV+RiA7n4KUf+K7kNcME86V7z
         Z4F5h4mozLcDOCAAr9UwhlcOk6XsdkToS8tH3z3gNYRDIF/s0dTvCgi1XDWJcUPcI++G
         lneQ==
X-Gm-Message-State: AOJu0YysNprknxdw/a5hQ9Eq54wlpbWe3mrfv7rnPj4l0bi/MtzRuzBd
	HDW4Fg4I2m152IcNlxMLas5801+NxkZCP+E900WNNXfoegZQlQ+6bAPi9+h5BA==
X-Gm-Gg: ASbGnctRIasLPCZOwnJE+iKvHEJoQ5aM+ZHjH/oxQqMsL8DxA3YCRmlCWNiwZNpM65t
	56AaGsP9EtN3iPN+tum+LR0jzVpopfwwIISNb3/YZfBohRN7ezlHktJ/fYDei3bq2wf7tawq6Eq
	Gop0cyI4nln+gUe/SRhOjlrKuaJhDri/2JV6twTJ5THBhjMyltjm/w4TQAsOhIjVWCR5DiBtQ2S
	KjqMzCo/0sNUP61aTflojXmBZRtzhfQ3jy0c64KRQExyuVFszLyjuFtJqide2u2US9E1QgqHSem
	qn4XASlDU8nmrH3Du4bDM6Ptk7s8v2xZNEp3fjgxyEDHAxYeluRZEsIyN5fOKS7VANlQuUvkb5z
	6n6haD8KojA8kS6Aik8q3PQ==
X-Google-Smtp-Source: AGHT+IGExDMsduZjTINzLEhVuPsV5bmRCCFapxKS9t63OsAUT/55djQulK+AnmuQdR3M3b2Pa21NDw==
X-Received: by 2002:a17:903:19ef:b0:249:11e6:381 with SMTP id d9443c01a7336-24944a478e5mr95154665ad.22.1756714124005;
        Mon, 01 Sep 2025 01:08:44 -0700 (PDT)
Received: from dpmin-PC.. ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249066e04e1sm96404485ad.142.2025.09.01.01.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 01:08:43 -0700 (PDT)
From: Kyungjik Min <dpmin7@gmail.com>
X-Google-Original-From: Kyungjik Min <dp.min@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: Kyungjik Min <dpmin7@gmail.com>
Subject: [kirkstone][PATCH] pulseaudio: Add audio group explicitly
Date: Mon,  1 Sep 2025 17:08:37 +0900
Message-Id: <20250901080837.898097-1-dp.min@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 08:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222648

From: Kyungjik Min <dpmin7@gmail.com>

Since pulseaudio-server requires the audio group, we explicitly add it.

When use useradd-staticids or do not use the default group in
base-passwd, an error will occur because the audio group is not defined.

NOTE: pulseaudio: Performing useradd with [--root
TOPDIR/tmp/work/cortexa72-poky-linux/pulseaudio/17.0/recipe-sysroot
--home-dir /var/run/pulse --gid 998 --groups audio,pulse
--no-create-home --system --shell /bin/false --uid 998 pulse]
useradd: group 'audio' does not exist
ERROR: pulseaudio: useradd command did not succeed.

Signed-off-by: Kyungjik Min <dpmin7@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 61d5bb00ba..7b9d245c07 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -147,7 +147,7 @@ do_install:append() {
 }
 
 USERADD_PACKAGES = "pulseaudio-server"
-GROUPADD_PARAM:pulseaudio-server = "--system pulse"
+GROUPADD_PARAM:pulseaudio-server = "--system audio; --system pulse"
 USERADD_PARAM:pulseaudio-server = "--system --home /var/run/pulse \
                               --no-create-home --shell /bin/false \
                               --groups audio,pulse --gid pulse pulse"

