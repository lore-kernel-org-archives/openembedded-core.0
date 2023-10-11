Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519A1CD98DD
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 00:02:17 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.5130.1696982535236758832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 17:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FnSljOS1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-692eed30152so4727068b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 17:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696982534; x=1697587334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qvvG4lvVQ3uKfKvRJgP6xLB/fkwWJe4dx/D0ewP4TEw=;
        b=FnSljOS16/ZE8yaGs4i4IK5EdV6zDLGVCfIPXIskkHnHNNaYVXKRA2x92JdS+/O0Lo
         kjmZM5EbpwXC9g2Vxc5+3QYocqG4R8ChwTC9dXaAF/s6Av6x8ksRHOSFbk8TwWdvA2F7
         rfrCsM3GGZ0u471JSnFcEx8NO+U8gqukTfMg69V3eErEbxUPP9xy9eLaiEizdvyXqPvz
         Z4pMMYSbIs3Ptzh1M7web+QZJsnuOy39JdRe5jk6Nn5IUxGIsNVsMoyttn+n8EnqAcLG
         2EVN9unJ2g7Tp90P6pBhieHPLPKlKQgIStKfo/Ah+Nfklk5Q4YFl9f8VhrSmutvlVY/V
         R+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982534; x=1697587334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvvG4lvVQ3uKfKvRJgP6xLB/fkwWJe4dx/D0ewP4TEw=;
        b=LgyfpbHj+cRPZqGlj0mXDONh0n+AIUnpsxRWrXjeon2UW2irZkHeVMBddpG19I66Iv
         tdnfpAdoU5Hk4QCkT889oMuuU6z90lrDfm0B5UwKaPHHBdQhMeCHLLaFEhnQlaKI1F0+
         OsFlwO+ojVjXy+Tf8WhNHctV1HzUDs0J5EAfFw2PNX4EhYwKBBeZBPzMkJDx7XZAMrVC
         ObkiJ6manbe1Q+23k5yiFRPLNP8XZv7AFmVnUj/Zbgpa85HU3f/bgaeMibMjz+YcqmMC
         7VJVbk1MAYDhnvikr78bqOAfXp9Ewj0Vq7u/vqxKq71Hzy8Wv8OLDln5h63eZGHC551d
         BpXw==
X-Gm-Message-State: AOJu0YzHO7c4HurvqrV+C6BJP+54efqTW/oJxOvCvPkS8vHZWp27K+7D
	zZVE7Ol2A0yxz55MENokX17/gSsKWi3QpBZ2e+M=
X-Google-Smtp-Source: AGHT+IFvxAx7av0eEsfy0vxXn0jkvrLC6sn5osKEGy5zsTLSwVzioTJ4PYtrqtXh4+Vx29fqc6EGuA==
X-Received: by 2002:a05:6a00:26d9:b0:68f:cf6f:e228 with SMTP id p25-20020a056a0026d900b0068fcf6fe228mr14578777pfw.23.1696982534353;
        Tue, 10 Oct 2023 17:02:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a9-20020a63bd09000000b005891f3af36asm10758222pgf.87.2023.10.10.17.02.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 17:02:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 16/20] oeqa selftest context.py: whitespace fix
Date: Tue, 10 Oct 2023 14:01:29 -1000
Message-Id: <fa4204c34efeda543a108c942cd50a6d6322600e.1696982312.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696982312.git.steve@sakoman.com>
References: <cover.1696982312.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188934

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
(cherry picked from commit 8aed3ca405cb3cc5d346eb8da8b3307d93f75d5b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/context.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 0a7a9da72a..6cf1bef212 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -216,14 +216,14 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         machines = []
 
         bbpath = self.tc_kwargs['init']['td']['BBPATH'].split(':')
-    
+
         for path in bbpath:
             found_machines = glob.glob(os.path.join(path, 'conf', 'machine', '*.conf'))
             if found_machines:
                 for i in found_machines:
                     # eg: '/home/<user>/poky/meta-intel/conf/machine/intel-core2-32.conf'
                     machines.append(os.path.splitext(os.path.basename(i))[0])
-    
+
         return machines
 
     def _get_cases_paths(self, bbpath):
-- 
2.34.1


