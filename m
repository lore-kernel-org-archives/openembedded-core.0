Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F52C25B07
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 14:28:20 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.7113.1660228096150811344
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 07:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AQcUMy8v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id z16so21487426wrh.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 07:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=H5kvOH1fYbFNIGIc9bq5HeE28B8Z3VVm/KwdSA/PMyk=;
        b=AQcUMy8vV+3iZjIhdAFuUmd6cSgyHvi82J7J0x3xruJEuZ6knlTn7M/uAv+LDrqRgz
         6M0xOjNB0n8oe693lCu565FEZDncTRUTfVf+QMlV45Uu2B5I9kli6RZzzE4r1Z/QYbDu
         JjinEqZIH6t74jA+DyYPXw/RcjGH/TmWesylw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=H5kvOH1fYbFNIGIc9bq5HeE28B8Z3VVm/KwdSA/PMyk=;
        b=OSZFv9GqHEKMfFYtI9p22NMSDksl/dLsoSXtJPLFh/XTEePqLatxt0fJSSWMvmHDys
         AnEO66yWsfwaJ7g5RwEOTyrleRXfXsCMv15+2+oYOggGKwjF8JkLmsmjFWrmbKLoYoCq
         vQKaMxtOyg4P5ioCzgIcdfPchPIbzl33SUOBQnPuRflB3ZYL95dqY6WnudICmqmnx8O2
         KhL/9h7jUAj/2mPG+HMfxSCokCqCuqFHh7tLDLCKK3wAquOUZABpusHeE7SuYNA2WAO6
         +FLhY3o67pjFETX8IhSTt8n5CyNXV+DGqLxDySnmjdMbTQWfK3ZpInOVJG2BHASoNYkF
         n3VA==
X-Gm-Message-State: ACgBeo2uZ9Bo0RzezCOxjYne/XHXH82awTl0TeC40IVkoLywvKoFF75T
	L7kVZTfPj+rNTOG8M0aLO0a8hAmvwquT5w==
X-Google-Smtp-Source: 
 AA6agR4EmRAx+ae1WYTf/avAOX5f98d6aqWNO9+LMS7qjAN5JZjMyPrj4mSSIwvmdC6gTgsq4eY6qw==
X-Received: by 2002:a05:6000:1a89:b0:222:c186:ca8a with SMTP id
 f9-20020a0560001a8900b00222c186ca8amr14504257wry.333.1660228093942;
        Thu, 11 Aug 2022 07:28:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:95c7:ec9:dfa1:7b7])
        by smtp.gmail.com with ESMTPSA id
 17-20020a05600c26d100b003a2f2bb72d5sm7367178wmv.45.2022.08.11.07.28.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 07:28:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] meta-skeleton/hello-mod: Switch to
 SPDX-License-Identifier
Date: Thu, 11 Aug 2022 15:28:10 +0100
Message-Id: <20220811142812.651737-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 14:28:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169244

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-kernel/hello-mod/files/hello.c          | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/meta-skeleton/recipes-kernel/hello-mod/files/hello.c b/meta-skeleton/recipes-kernel/hello-mod/files/hello.c
index 6b73a795240..4f73455d200 100644
--- a/meta-skeleton/recipes-kernel/hello-mod/files/hello.c
+++ b/meta-skeleton/recipes-kernel/hello-mod/files/hello.c
@@ -2,18 +2,7 @@
  *
  *   Copyright (C) 2011  Intel Corporation. All rights reserved.
  *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; version 2 of the License.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *   SPDX-License-Identifier: GPL-2.0-only
  *
  *****************************************************************************/
 
-- 
2.34.1


