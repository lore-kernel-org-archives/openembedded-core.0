Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DCDC61D97
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 22:33:49 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.7262.1700606028308979127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 14:33:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OBqbHZ1U;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6b20577ef7bso5360116b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 14:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700606027; x=1701210827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2XJBkZP1Cos/s2J5er/Fr02Y6Q+pzAVQV0NuMdfzzY=;
        b=OBqbHZ1UpY9AauVjVbXkvPGHtCvqbZ3I1peklvtgryuewpuJeLeY3cGUtLN+hUgmok
         8tszFLcvWaZKyHeA+TRgIQhtdbImB5Ec8mP9cgz9S5ViXBeQRwJvnXheeagQ2n7vDmGz
         ixaoj197nmJ4CpRJd7G2Ghx8yLsjDSdpSw5kbeWltc2Y/Dq8I7ugNGROvaESNFPQLRel
         jXYzfsubkgs7/kfkyowj8TgyX7TVcdQkvBGbCMuXEmFt5a8isUg4lvbgU8v7u5KncDdM
         bX9Oj5oalz5w32E5EeI7F6e1TJbFWcvB99Bd5xFIvTaqdjRvpU0JOkNHECqIeA8NFRFu
         SNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700606027; x=1701210827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2XJBkZP1Cos/s2J5er/Fr02Y6Q+pzAVQV0NuMdfzzY=;
        b=rlkdWlaFi7pYOXbhfpYzlt9hLV869TfDK80WkDWHD+YAROX20PfSwYjFwHwbm+kgsg
         4/R0uQ1yyLN35zVLOW+GuTYAKRw9LBtH3NkkGPizcEaAeByZ2cSsVXER9l+KNtOfxyoo
         9v4mB3DLYJ0tEwGBeBavLEczLqCkRfuplRy62lzoPEfOti3pccdVKRHNoJi4+St5eM5k
         PbPR4LK9OSs7dQ2vRfX+pD4BUd4FK6xQ4jDardtnZai6pR9is5c/f+Ui0oRn0tPjOpqr
         oYTpTg3he7JzNg1X+MXaY2lyA1eMWm5Xm+orrIodmUyQEH0c+gn22yRCs2cPDNW5m1sk
         tQjA==
X-Gm-Message-State: AOJu0YzRvjRLgGj6WhsxX+kykqivKvAp0Q80OM6AThnNq9G7H5jE/Q74
	cLo0RovnoWHth5g1csXPkKg8aP+fHHkNZQ==
X-Google-Smtp-Source: AGHT+IEpcm/ZAumb0Uqyj2eXsKlpXMZm4f8FfW0spUs7FouTw/7hVzT6v+ncvX3UfSdFIjBOYPfdxg==
X-Received: by 2002:a05:6a20:2c91:b0:187:ce9f:e198 with SMTP id g17-20020a056a202c9100b00187ce9fe198mr416885pzj.5.1700606027360;
        Tue, 21 Nov 2023 14:33:47 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0::b328])
        by smtp.gmail.com with ESMTPSA id x10-20020aa793aa000000b006cb88e7c005sm4838793pff.203.2023.11.21.14.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 14:33:46 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2] python3-poetry-core: upgrade 1.7.0 -> 1.8.1
Date: Tue, 21 Nov 2023 14:31:50 -0800
Message-Id: <20231121223149.3942849-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231120210140.3203077-1-tim.orling@konsulko.com>
References: <20231120210140.3203077-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 22:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190993

https://github.com/python-poetry/poetry-core/blob/1.8.1/CHANGELOG.md#181---2023-10-31
https://github.com/python-poetry/poetry-core/blob/1.8.1/CHANGELOG.md#180---2023-10-31

License-Update: add vendored fastjsonschema (BSD-3-Clause)
License-Update: drop vendored attr,attrs,jsonschema,pyrsistent (no change to LICENSEs)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
  * _Actually_ add BSD-3-Clause to LICENSE
  * Clarify that LICENSE remains valid after dropping vendored packages

 ...poetry-core_1.7.0.bb => python3-poetry-core_1.8.1.bb} | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_1.7.0.bb => python3-poetry-core_1.8.1.bb} (71%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.7.0.bb b/meta/recipes-devtools/python/python3-poetry-core_1.8.1.bb
similarity index 71%
rename from meta/recipes-devtools/python/python3-poetry-core_1.7.0.bb
rename to meta/recipes-devtools/python/python3-poetry-core_1.8.1.bb
index 40b6355f4b7..fcb6d30ee00 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.7.0.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.8.1.bb
@@ -4,21 +4,18 @@ HOMEPAGE = "https://github.com/python-poetry/poetry-core"
 BUGTRACKER = "https://github.com/python-poetry/poetry-core"
 CHANGELOG = "https://github.com/python-poetry/poetry-core/blob/master/CHANGELOG.md"
 
-LICENSE = "Apache-2.0 & BSD-2-Clause & MIT"
+LICENSE = "Apache-2.0 & BSD-2-Clause & BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "\
     file://LICENSE;md5=78c39cfd009863ae44237a7ab1f9cedc \
-    file://src/poetry/core/_vendor/attr/_version_info.py;beginline=1;endline=1;md5=b2dccaa94b3629a08bfb4f983cad6f89 \
-    file://src/poetry/core/_vendor/attrs/LICENSE;md5=5e55731824cf9205cfabeab9a0600887 \
-    file://src/poetry/core/_vendor/jsonschema/COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
+    file://src/poetry/core/_vendor/fastjsonschema/LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532 \
     file://src/poetry/core/_vendor/lark/LICENSE;md5=fcfbf1e2ecc0f37acbb5871aa0267500 \
     file://src/poetry/core/_vendor/packaging/LICENSE;md5=faadaedca9251a90b205c9167578ce91 \
     file://src/poetry/core/_vendor/packaging/LICENSE.APACHE;md5=2ee41112a44fe7014dce33e26468ba93 \
     file://src/poetry/core/_vendor/packaging/LICENSE.BSD;md5=7bef9bf4a8e4263634d0597e7ba100b8 \
-    file://src/poetry/core/_vendor/pyrsistent/LICENSE.mit;md5=b695eb9c6e7a6fb1b1bc2d193c42776e \
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "8f679b83bd9c820082637beca1204124d5d2a786e4818da47ec8acefd0353b74"
+SRC_URI[sha256sum] = "67a76c671da2a70e55047cddda83566035b701f7e463b32a2abfeac6e2a16376"
 
 inherit python_poetry_core pypi
 PYPI_ARCHIVE_NAME = "poetry_core-${PV}.${PYPI_PACKAGE_EXT}"
-- 
2.34.1


