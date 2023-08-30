Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB673C83F19
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:49:09 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.1292.1693417744719246989
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vVUBTDhN;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.181, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3a85c5854deso4294859b6e.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693417743; x=1694022543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwKECJU+gKUO5+8Ighlt3mrT7FytrGof4uDBYUFO4mU=;
        b=vVUBTDhNfLvjicwLsV3umNOQwgYlRq5ZcqqsAqXt/lHJv59r81xwhmz9ZlN1BEFlUA
         m5GXyKbxdObFNlPHv1uYAqGbsmpbgkcnE36xq8bFMzNz1WfBkGNvAkJQLSPS94NCqfxi
         HzwDAMAYpIrZWoUYjZ7AqbtBdfu2KuJKpUL62w6LOQJIt92X9nGeK9yAMUzXDjSvu0dA
         0ExPnhmlDBIfjmKJBL4ZNJdKFczylelNBZjA46JpQaES7pxuMua1iGQil6O/i4RRbglW
         qFeC5lyNMBYgS2bdtRhlRiS4UA8W3hdA7Hulw/7n3mJYFZhqXve6FhAoLTIJl9psOeoL
         akwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417743; x=1694022543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwKECJU+gKUO5+8Ighlt3mrT7FytrGof4uDBYUFO4mU=;
        b=MCvLtTUp1BUq5HT0sR0MjSBQdqEl9UVJYqvkNf5AOuOT4MKslHwonbjSk+TUxLe0to
         TqJFR4b7hG2bqNnbjCpPrdMi29j8wRzKDbIVsu9qwkQbcttlQHWrk6fh/dxpG8hs4HRc
         euiEE7fPU8Ho9MJxBdll0C4vj6g6UKnkgdgtAjBDtA/uK7LsD+zUz3VOy/gOPOategvt
         nSZGzY+Pjkf1lmUynZD7/YA1kKgnrkjGnocp+mwLD0ONwjc5EqklT8zHHL/VTzIYgJt/
         wf1wqb5Sx444XolXrxXALuEx6jkAY7P8Wg3qjoURG8pGSTMsNSZSzbF5wZanM/6gZqbV
         haMA==
X-Gm-Message-State: AOJu0YyEn4ijvmcHTJW0ERnrOuJVixsbsZ9SqwJpHdTJcEknrrztvp4V
	uWOm8TeyCnIVp5FXQb7iGQAAG/OaFSUU5Gs/jDw=
X-Google-Smtp-Source: AGHT+IE9AnfdLHvGGni9V3MVwH42cKOegLF8PlnOHfrs7K0aEI5NdSb7XQaSnh9ZNbGgoJczn197xQ==
X-Received: by 2002:a05:6808:23cd:b0:3a8:698b:663 with SMTP id bq13-20020a05680823cd00b003a8698b0663mr3621504oib.14.1693417743672;
        Wed, 30 Aug 2023 10:49:03 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b006889348ba6dsm10567578pfb.93.2023.08.30.10.49.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 10:49:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 15/20] pixman: Remove duplication of license MIT
Date: Wed, 30 Aug 2023 07:48:19 -1000
Message-Id: <0a14def83fe2bb4f4cc7cf988c7d31d3108e0ed0.1693417541.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693417541.git.steve@sakoman.com>
References: <cover.1693417541.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186917

From: Poonam Jadhav <ppjadhav456@gmail.com>

Remove duplication of license MIT from pixman bbfile.

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e6c87b267252376ca85b534e3c9ee9b77ff665ca)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
index d26d7f581a..a580d73185 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 PE = "1"
 
-LICENSE = "MIT & MIT & PD"
+LICENSE = "MIT & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
                     file://pixman/pixman-matrix.c;endline=21;md5=4a018dff3e4e25302724c88ff95c2456 \
                     file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
-- 
2.34.1


