Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78851C64EC4
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:19:10 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.13840.1676902725953694070
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:19:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=PB1zH6IR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id z2so1670248plf.12
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JPJdxV/rXrayU1ZqofgHzDslP1Y4mlt6Ml00TiScQA=;
        b=PB1zH6IRAG5vfFl0pAbPXSoLRqfamCxlVciAcEPf1n7OS8kuJVlABt3cje+pNIWxHd
         wMXkk/Cb318smJ/llLWFFGYa9D3YkXIR7TU5kq4QBKzum6DXENface1sQ/omwKcoQTKm
         AFVTRGZPsBSJQjBTyh6+qj7ZRMTAafbPDi/q2eFBR7/PwBrcev3Ff2NvKnENI7X8cMxE
         utN7SMEtwWLRRHrBshQ8bERkjvMW140M78g9hfSw742kymy1ArkGTXzMcRhodk/ol7eg
         1i1Ip/3KUaWx5mVSk5F3eXtq6gXMhxKHtIWuCASvLbRPofouWsTOh4Y4FGL1Y+mFFAg5
         yIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JPJdxV/rXrayU1ZqofgHzDslP1Y4mlt6Ml00TiScQA=;
        b=F0QY2LahblADDM/F2KacwhrJd2TWiHjIUGnXnMi/bYr0XmCIvgi1LjASXUJ9OE0hl9
         HeGGvyfOtFgIGQl4E+GG9ImyaLD7WchiLquXck0mVPAQDqDjl9uAIcPaq7Fzm6GW9aK7
         zQKdyp74JaTlE0cWMWqdlJzYaLFaRI+9Uu2+IiUCpfYNUuNPnn8KeZUYmnpXV+RIzIzb
         GP7XAo9piDPWh4OfRULVzZ+Ws/RqJsDZ2c805o89z7OvFSfijjVkmqhGwlUZx5jdl99v
         g2SOcI5c9n0MXag2hqCVHgMRpOeuD6vgJBsQ9WZvLMna31EjMPL9S0QwFMVJr15kOv1k
         UWfw==
X-Gm-Message-State: AO0yUKU6GVRWxVHPDKldbWz/q0sFfWvkXeiBBiGwUhktgK3D1TMGjfMc
	01utHvgh7CmjfbKN2DPjJl8VCWrtjQT2TquSzko=
X-Google-Smtp-Source: AK7set/M1Q1VcaRHLxvITfYE6phDXBQAAI2wwPtmAHElekBl1FYLCjlLol3YKZYbKbLujtZSqAAr3g==
X-Received: by 2002:a05:6a20:a10b:b0:bd:17a4:c339 with SMTP id q11-20020a056a20a10b00b000bd17a4c339mr298831pzk.13.1676902741416;
        Mon, 20 Feb 2023 06:19:01 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.19.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:19:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 13/22] image.bbclass: print all QA functions exceptions
Date: Mon, 20 Feb 2023 04:18:20 -1000
Message-Id: <c2cdbf0a0b2d27778f55db8fc685e62c2515e805.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676902605.git.steve@sakoman.com>
References: <cover.1676902605.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177419

From: Mauro Queiros <maurofrqueiros@gmail.com>

For the QA checks in `image.bbclass`, all exceptions
other than `oe.utils.ImageQAFailed` always print the
following generic message:
"Image QA function func_name failed"

This can be very misleading, as it may hide
python syntax errors and other kind of issues that are
hard to detect without more explicit error messages.

This change makes sure that the error message of all
exceptions are displayed.

Before this change:
 "Image QA function func_name failed"

After this change:
 "Image QA function func_name failed: f-string: empty expression not allowed (<string>, line 13)"

Signed-off-by: Mauro Queiros <maurofrqueiros@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d85b30d8704d38b86f5b006748cebc74bd2a4fa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index e5e5274924..14528e664c 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -318,7 +318,7 @@ fakeroot python do_image_qa () {
         except oe.utils.ImageQAFailed as e:
             qamsg = qamsg + '\tImage QA function %s failed: %s\n' % (e.name, e.description)
         except Exception as e:
-            qamsg = qamsg + '\tImage QA function %s failed\n' % cmd
+            qamsg = qamsg + '\tImage QA function %s failed: %s\n' % (cmd, e)
 
     if qamsg:
         imgname = d.getVar('IMAGE_NAME')
-- 
2.34.1


