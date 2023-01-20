Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09D0C05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:12:19 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.82064.1674238296753883379
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:12:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=lT/R70Ux;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 7so4754532pga.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gio/K1ByLVqPetjL+8Gu1fhJYYd3Tl0i1kTcQYzf69Q=;
        b=lT/R70Ux9a07Fw/F/jqixLGHEgYGTQ35JJQ1gi0bPRDBFxe+Wt7KncQRP7eym4Ej4M
         qOr8FqyK9TB3zpS5BCJjXWLtjCaSNWZfbmgiAyASGtXWprbLocm/nwwSwu7F9Bwzln5k
         wGTIFaOYsVFB3QO4+OMX7Cd6aXKVbRjJeCBOQ+LGJqXSOTLwWQNFx02j5i8MlcSHHmQv
         0lrFVNlBmvKjfukEOjoOjCi8tMlDh9Gr+5USdR9Woi4mH8s6AYo/Vq76ONCdp3NlmLVF
         nC/QuXYjxJ52c98yMHAq6SXD5+p8avKIyoGhl0wS0Y8/e6wh9kOkjTbBZohbSCDbeXa4
         5Zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gio/K1ByLVqPetjL+8Gu1fhJYYd3Tl0i1kTcQYzf69Q=;
        b=KuLWPcbXhIJ2/3jBa2JCdO0SjTu7/Ry73stShp3IiV2ekV5pnGoX2V/fG8U8XzqN0A
         V4VCg0pzuvCqqLv6fl6hnXl6KhurhizJ76oAPIy8/KgIIpV3fEqpPdM0ba8L5RQ5I1xl
         H5GjLGz+ZKLbQv18NV9yoWG5y6oo0rro4Kuk+otZO7CbZzFgNwFC33+yFGpBQHQ6r9tg
         BzrQG1POYMiNCGY2jwDZx+G6TMKrTX70FgJbQIxDMP/R4iwlCi6TqifvuGX2LGNKPKSI
         FA3cHuUN9+k6QTXgAHlxT0BLLR93QZukbSb0VsZ+6REkRlBUFiJ5H9k3eIw9imUzAIrf
         /xGA==
X-Gm-Message-State: AFqh2kpTaMrR9jedpZMGUSXHYOXdKWRzxXxwNR0x9xzCtP51m4yM2IPv
	22LeUoK8LmeaYZUimmhBnkfBsq97D1YXbiyDIBQ=
X-Google-Smtp-Source: AMrXdXuIhHKYjzdyvox0xeEKLXLh+jEXTudWJyLMZrnLZM/cbTTeCRpCnws9rYzocIs3CTF9oozLTw==
X-Received: by 2002:a62:1448:0:b0:58d:9588:890b with SMTP id 69-20020a621448000000b0058d9588890bmr22398244pfu.0.1674238329891;
        Fri, 20 Jan 2023 10:12:09 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.12.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:12:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 36/41] libseccomp: fix typo in DESCRIPTION
Date: Fri, 20 Jan 2023 08:10:53 -1000
Message-Id: <d3f6fd26042887b03b5587863a93803553693e86.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:12:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176243

From: Chen Qi <Qi.Chen@windriver.com>

Fix typo in DESCRIPTION: and -> an.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 349e63045298054f9454025d793c67284fce750b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libseccomp/libseccomp_2.5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb
index e89b8f7f4b..505c21917b 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb
@@ -1,5 +1,5 @@
 SUMMARY = "interface to seccomp filtering mechanism"
-DESCRIPTION = "The libseccomp library provides and easy to use, platform independent,interface to the Linux Kernel's syscall filtering mechanism: seccomp."
+DESCRIPTION = "The libseccomp library provides an easy to use, platform independent, interface to the Linux Kernel's syscall filtering mechanism: seccomp."
 HOMEPAGE = "https://github.com/seccomp/libseccomp"
 SECTION = "security"
 LICENSE = "LGPL-2.1-only"
-- 
2.25.1


