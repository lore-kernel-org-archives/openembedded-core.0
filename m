Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.41.1593706779606786522
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 09:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=0oN7bhDE;
 spf=pass (domain: burtonini.com, ip: 209.85.221.54, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f54.google.com with SMTP id f7so26225078wrw.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2020 09:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hPtbbIOAPdVURW0RykNS7KQs18dtijgpjKqUhp8VRaw=;
        b=0oN7bhDEJBsN6Mhc+einLYtJaqtRi9wjS3J95nd36nUniO3rz0tmexi1ldk3cMEgpY
         hFiJNd7lVfr4Ig6/feLJPlHZwOikBay1xDI5ATaxUoZoPnnwakFYf3yVMqtkF4d/fzJw
         cF016IDTZvFF/WOMhC2RS540WaYgVwQzUs+5WoQoZPY/VPUk1JcqYvnlthFI+LhrZkJG
         G5ZcN1mGbxHLy6UlMlWy6k0hz3C5V2xxn+JN9CwHKtry+cVIWsYaePRndVTq4z+oziGA
         jTMlcmppXrCPAKQ0pnwErGTRW9HjaoFTfWUSB4QFk/P9PuDDajggc9i5aS4eG40KY7YN
         2Ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hPtbbIOAPdVURW0RykNS7KQs18dtijgpjKqUhp8VRaw=;
        b=J9Q0/D3O2Luna7jEEV1Clx1bEI87MLcrc5nyFYXj7No6KFOnMFVTzBmoxtt4SKVxx3
         ZxaiTN3/AU6opy3wMPCM6rBv3fytK+Et+LAYWdiv1y0HFqvcKmUOd+ub/rPdM6yAWSp5
         UKT6uwtNXz1jBMBG3ICepVPzGWdA7SXsAKj8HTkZHHabCGjV8DFc2QAEffl3n3i/CrsD
         FeF0EqJNkkBayU/2rIxu0G+FqfRTxccmZQAavuspWl5OxIMK6h9mF889OkiUu4NvhSr2
         z6eYwftAsw1zl89LpHcJJydils2tU3d5W2JqIcU/+PZPzwR/j+US/ljALIC0gt0KdpO7
         s7Jw==
X-Gm-Message-State: AOAM531nTUe+jUM1VEnPLsYf28xTdJZvGMqvZ0hrf0GI/0FIXgDDBgFc
	D77ZP7wD7JKei75SoMuKp035+FlnMEEIKg==
X-Google-Smtp-Source: ABdhPJxqsVIKvQl/hNe4oijENt1L2Sd9IgUndItnIi6wRnftzcfoG2SJKXABVCm/HC23+SZILwu2uw==
X-Received: by 2002:a5d:6045:: with SMTP id j5mr31702003wrt.209.1593706777715;
        Thu, 02 Jul 2020 09:19:37 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id m4sm11091227wmi.48.2020.07.02.09.19.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 09:19:36 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell] common-licenses: fix filename of BSD-2-Clause-Patent
Date: Thu,  2 Jul 2020 17:19:33 +0100
Message-Id: <20200702161933.1997450-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

(From OE-Core rev: 4a9c62d49940b154177d817a845188d827370607)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{BSD-2-Clause-Patent.txt => BSD-2-Clause-Patent}              | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/files/common-licenses/{BSD-2-Clause-Patent.txt => BSD-2-Clause-Patent} (100%)

diff --git a/meta/files/common-licenses/BSD-2-Clause-Patent.txt b/meta/files/common-licenses/BSD-2-Clause-Patent
similarity index 100%
rename from meta/files/common-licenses/BSD-2-Clause-Patent.txt
rename to meta/files/common-licenses/BSD-2-Clause-Patent
-- 
2.26.2

