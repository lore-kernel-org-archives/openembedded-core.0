Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E622C52CDC
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:27 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.55953.1722258806540851605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tq4uZWBB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70d1fb6c108so2190285b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258805; x=1722863605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4jdaQwR8aj4iMKQwsHgDJ8ndsmfWXC3Frk+oB3URoY=;
        b=tq4uZWBBVl18YNscRWfwTgEs4sceW4u2iXy9jhq5u9MKItc1oCSYaS+aelnva911wQ
         D0XL0tjTxNmxgcTeN3S4JIn7U2eE3Esra3m8k3/ziPP++0IFQZll1ajoqzWlO9CiQLMl
         pVSHUPQbyz8CFUnE5jV+j9iJ9dzmAuum2hwK8c+P0pzzwJsgumvZdKItc5+3LUob4tJp
         c1ojeBYlE3ICRSMrK64W4SIEP13q7M5d6K/8qq6yOTzF6WqAHRLnoQ2pusTujn5U6AnX
         Zu5myqaO43RWu6ZLzM9dgZnmoNHS1/M3nQD74ixI+yyKlIV6TWDETxTaMsxxbpJkfvb6
         /5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258805; x=1722863605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4jdaQwR8aj4iMKQwsHgDJ8ndsmfWXC3Frk+oB3URoY=;
        b=MZOp5zT8CWvdNICbQXH0qDadnt5mb5mga+4GJKzmPET+vcss9h9X+wfDNur23PjEkn
         9fbRY0ZKoTObaytSndJsdLpRLhCToMZj6M/Dns4i3guYdHp/QThCAiuvBVlXhjD9vPZ6
         zTqfHjVLhQpHBkQRTDforoi4WVhvD6xgS1oz7gBa73bxUxQMLbuPp5lprGnRIE+MY1hj
         jMoNPVY6dtgMIDq/oEo+LS9B9Vw7gJmQ9mUaFe1/julS5DcnorCyJ82l2+ZyQOvU9buY
         3vi7SVdUgfOWeoe5dsBj1fI/WRavZ8hSUiuiWC9NPR10Ane1bArTUMDmZBh0d53pWqjC
         E2AA==
X-Gm-Message-State: AOJu0YzCQLd3P325ImmCxDN9lYi6meY+aeRAFasVzlrFofnM4o+Ev002
	AJSo3jYu4fbAY6JUvg8VH2Ft6iujh7GmUcVWBqoXob+qOBjS03kKUEAVySy6HDs5WkBuRTjqXU8
	vPc+k5Q==
X-Google-Smtp-Source: AGHT+IELMBagniaI+/vXxeDZMphEEW/wnm6Ixd4UrRy+AqTFI5kyq2t2wEOHI1tgIljbD2CeThAn1w==
X-Received: by 2002:a05:6a21:6da6:b0:1c4:8294:3963 with SMTP id adf61e73a8af0-1c4a12cbab5mr6839021637.24.1722258805456;
        Mon, 29 Jul 2024 06:13:25 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/37] gawk: Remove References to /usr/local/bin/gawk
Date: Mon, 29 Jul 2024 06:12:31 -0700
Message-Id: <64ae7492c69599019ef2bec62a834335539908ef.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202635

From: Khem Raj <raj.khem@gmail.com>

Also replace the hashbangs using /bin/gawk to use
${bindir}/gawk

This fixes issues such as
https://github.com/riscv/meta-riscv/issues/384

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f58ad97f6587322b716de1c9dc409bb4e1376f0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/gawk/gawk_5.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
index e94cf19db4..ac9d8500d6 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -52,6 +52,8 @@ do_install_ptest() {
 		cp ${S}/test/$i* ${D}${PTEST_PATH}/test
 	done
 	sed -i \
+	    -e 's|#! /bin/gawk|#! ${bindir}/gawk|g' \
+	    -e 's|#! /usr/local/bin/gawk|#! ${bindir}/gawk|g' \
 	    -e 's|#!${base_bindir}/awk|#!${bindir}/awk|g' ${D}${PTEST_PATH}/test/*.awk
 
 	sed -i -e "s|GAWKLOCALE|LANG|g" ${D}${PTEST_PATH}/test/Maketests
-- 
2.34.1


