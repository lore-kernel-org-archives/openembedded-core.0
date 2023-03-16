Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4415FC6FD1F
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:46:14 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.5097.1679003169123355113
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Q5b8gxre;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id y2so3056408pjg.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 14:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679003168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjA7poPXi78Xq776K31BaqBi+vHlmIg54HrfH7uRCbk=;
        b=Q5b8gxre5QEuHVZNTU+WOuAgBiU4rGe4tVuuNEDBhYYB/URfmG2Om93b4OIcJqvMHW
         gUY1jP2WZ2URQa/2bBMqsu9YpIeckl3P0KWBA0IxzGjy0LherY6TzQ+vsEXxVFbWYoOB
         UFMfnKlHs2H0tHFWfXSIjcFAviCpwT+XZWYnufsUqK1ABwjI+5XYqBPyuyiaOlKGNItg
         blwTPY/r9RAiBnxFslGtXNeJkS1ZBGH8LuB5ebcZLQmNRhqi4cHGAXqvN9OIZjVAUORl
         UkaZXpD15iSi95PeRfCgjfFHp/LnMXxA5bPtlptlZjOICPqtBik6MrJxrjB26KZu+S0y
         /zmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679003168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fjA7poPXi78Xq776K31BaqBi+vHlmIg54HrfH7uRCbk=;
        b=y0XG9zV8SKu0YKeacym075nH7ENriyvpDdAl2okk+ll6OPusxkGNSc5SPwuAVW4cbP
         lkMkfg/dQ73Rq0Db6SCQv7UjYIGJ22pCllYYcqKpfpHjq7gXKLRB1/LIMK2+iy2fVGVc
         7nX3aOprHBNQAKGRWqahhBD0CyZhB7ol4fJXnq4epqgQI76b2WuEqWeP4Fxm1I2bVrn+
         VwjALDUwqb1CinTs/QGNamipeEz96AmBnSlMmN1uoJKVFt75E4y56RWYXORzse9l2aaQ
         I557/36Ykg2SqrbyYF3wKA0aaNFgi6KSMUk9Ope9ycwFNo7x5qS3ocK56QV4wlnwqmuk
         Pz5A==
X-Gm-Message-State: AO0yUKUYl7sopZ+VrQWxg4AI2NLRVQFAGnTFsHcedXYC3kzN2TreFL6a
	aMHnHGcUmFK39HZJhxILaug/61VVOddfezhD8nI=
X-Google-Smtp-Source: AK7set8jveUDWKp3zFaBMzH8sMS2Gu1p3LgMbLqnkuEPttJ3H0YUzSrJETluSDJdggzGtkyAVEHH3w==
X-Received: by 2002:a05:6a20:4321:b0:cb:aacb:312c with SMTP id h33-20020a056a20432100b000cbaacb312cmr5838279pzk.27.1679003168149;
        Thu, 16 Mar 2023 14:46:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id bn10-20020a056a00324a00b005a84ef49c63sm137746pfb.214.2023.03.16.14.46.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:46:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 23/23] base-files: Drop localhost.localdomain from hosts file
Date: Thu, 16 Mar 2023 11:45:20 -1000
Message-Id: <61f268be804795fadafbc918b465561819b592ec.1679003014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679003014.git.steve@sakoman.com>
References: <cover.1679003014.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 21:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178734

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This was likely something we took inspiration from elsewhere with.
It was added in:

https://git.openembedded.org/openembedded/commit/packages/netbase/netbase/hosts?id=c8e5702127e507e82e6f68a4b8c546803accea9d

in 2005. Debian added this entry around 2004 and discussed and dropped
it in 2005:

https://lists.debian.org/debian-devel/2005/10/msg00559.html

resulting in:

https://salsa.debian.org/installer-team/netcfg/-/commit/3c15ee521b2b8f47b34ccc7f610523cd284f2221

We should drop this for some of the reasons in those threads,
it doesn't seem to be doing anything too helpful and isn't what most
applications expect.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e730d005fa8aec07f9ae25c58d4566eaa92a6997)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/base-files/base-files/hosts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files/hosts b/meta/recipes-core/base-files/base-files/hosts
index b94f414d5c..10a5b6c704 100644
--- a/meta/recipes-core/base-files/base-files/hosts
+++ b/meta/recipes-core/base-files/base-files/hosts
@@ -1,4 +1,4 @@
-127.0.0.1	localhost.localdomain		localhost
+127.0.0.1	localhost
 
 # The following lines are desirable for IPv6 capable hosts
 ::1     localhost ip6-localhost ip6-loopback
-- 
2.34.1


