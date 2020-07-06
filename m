Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web12.61263.1594051895333892513
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=LFblD+SN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.68, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f68.google.com with SMTP id k71so13505513pje.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=bItHpbnmoEQTon3adu3vpw8fsac1sLWoszIS/gNsjkw=;
        b=LFblD+SNsySW6n0ffe5zp/yqJOnCKKzGxC7bRK8vOC/VbrA8QW/iof978Bbge8rDv3
         mnjQxqz1RD4H/RLjU8d2dGpdsBV22FcmMPcJZIj0YZpx7zXXgxrOPrWX6p9SuCK4z3Fb
         t35ctsL0rBEUFtbCxDAaGrulGMM4ogt0uli7B64KLQS+u+9V+kLOFKMb4DryaLC1qkmU
         qWRDnmjbj+h7oIFLz6otXae6Py5KL3dXP0Y6QczltF1MWwx/ApYeFfoe8NRTzDIYJDIr
         IMbPh3yqFHQl8j7pC5dcs5hrHyAwp9oaNp5XGgDvhY6Xf3jrfLDvXrqCBE7tCu/yXXvX
         1Ktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=bItHpbnmoEQTon3adu3vpw8fsac1sLWoszIS/gNsjkw=;
        b=VzioV+2rBljHjeCPx2sCQUCE9/OS9Jgg70IpCQwZLeKXEITQG4v5SrT9sPU9k0sGfB
         7L4cPAOZte3CkGwcJ8SFiB2PLGtZTZ7CJB9pb8/ej2534RgX1WiI+w/eYq7zgDd9cHc1
         kiNSYElgwfyZaNQIbq05JZhQMVgw/AnbhFGuo2JtmWeZbJASFnnSYadeQ4dXNy5pAEPs
         q8grl+Y2m05f1Jb1HYOjFTPViSVHNy0EpccE/URj8uSDVX5+w44MqiqiFO3QyOxEYKY8
         Yb/bEza453ayYD/loFxnjq1lls7FiLfVjkC+js0GFJpd91DU2JNfIPjLVigMOyd9gcBb
         zfaA==
X-Gm-Message-State: AOAM532LeSlxP9BOeGw3rRWFa0UMew+8hnhHNuU6HHYR4T11IOthRXKz
	OgGESwBA+QmIVCue6y8TCXzFYvtXElL7BA==
X-Google-Smtp-Source: ABdhPJwroVGKD7RM/Zf5H7w/P6IqDalUhFfoOTVoN0/LzsZ0UdRtuK3wXpznHT9xc5iT+xSj6Fi0VA==
X-Received: by 2002:a17:90a:e987:: with SMTP id v7mr16967pjy.56.1594051894491;
        Mon, 06 Jul 2020 09:11:34 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:33 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/25] common-licenses: fix filename of BSD-2-Clause-Patent
Date: Mon,  6 Jul 2020 06:10:14 -1000
Message-Id: <9f93b8f46fc7e33f07d8fd8d6e0348d7b5bc5414.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4a9c62d49940b154177d817a845188d827370607)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{BSD-2-Clause-Patent.txt => BSD-2-Clause-Patent}              | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/files/common-licenses/{BSD-2-Clause-Patent.txt => BSD-2-Clause-Patent} (100%)

diff --git a/meta/files/common-licenses/BSD-2-Clause-Patent.txt b/meta/files/common-licenses/BSD-2-Clause-Patent
similarity index 100%
rename from meta/files/common-licenses/BSD-2-Clause-Patent.txt
rename to meta/files/common-licenses/BSD-2-Clause-Patent
-- 
2.17.1

