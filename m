Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.8332.1608021486165582930
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 00:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=KRdfC12L;
 spf=pass (domain: nathanrossi.com, ip: 209.85.214.173, mailfrom: nathan@nathanrossi.com)
Received: by mail-pl1-f173.google.com with SMTP id t6so10639377plq.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 00:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=SlwJfal4Os37ocw3aP61/1YVGj7ejeonC/lDJPTUoW0=;
        b=KRdfC12LHXTaF2+KGxY0kZKq+Pwzs7/3Xuy+K5WmAUPpcB1tZAmJqg3UL3OE0ZABc3
         cT+xcn4S3Tk/97Kv7TiN9f7he2ZHc+n9q/fP95DRV8s7Cpkqqfrt6fXzgGNoymztI4oO
         4LNQPSEDuR9WncRLIc/G2ERef3Lf1vSUEl1wKcUEtkEGP7WMfb8r1n+/N129zOjGNTQd
         kLDVsiEU7ADV9oqM6P648eri+q89/4iJASGY4dc58UaXB0WW0+s43ym1TUds9scJhzoG
         p+MA1f//UgDWxoG5WodlnUCAU7OrzepB7f9KkQbjZannMA9jE77AMVuBbtTJ89yTYhF7
         AdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=SlwJfal4Os37ocw3aP61/1YVGj7ejeonC/lDJPTUoW0=;
        b=T9NwRDfx0fJtowRy6DSKAARhXsBeVzXR6J0qkQaSQIbyKfoWaN3dKZ2OZxig4O7N5q
         yv1JmpELIne73SClK0T4r+YwYov5AehtXaW7RDdT7c3hZIoHUt7WRmWaqhB3d+PecV/5
         YmM6LeKFryirAfkDfAng54wtN2gUwyv66CbFAeFmM1/KzAuzfA1w6+34SCs3MWliuamk
         SNS4TNHtTzictxxudy1CUqlxaUd/BmLi9+04XcE/yWQWVudp8+UDM5vcQASeE0ktUbbz
         oIrueQVy2M6bIoPiBSpadawCMQJ+JI7KW0w8b6wbBikSy25Skt9kcSbkcNolmkbIsPTf
         jl1w==
X-Gm-Message-State: AOAM530RtpK+b7kCWmvsEBYaB0+5eAedUJCpSrQm2wJ+k3ru4oXrXNlz
	5bn6qa3hAXUETmSW+mX5Z+RMxwsJhUFXlY56
X-Google-Smtp-Source: ABdhPJyzgpVYSRugDfweQbFlRUEd13mMdG/YWVm11KVTqsWeiSWXBqJ+X3q6FJZvQWZP1WVwQe0tuQ==
X-Received: by 2002:a17:90a:1182:: with SMTP id e2mr28525442pja.152.1608021485646;
        Tue, 15 Dec 2020 00:38:05 -0800 (PST)
Return-Path: <nathan@nathanrossi.com>
Received: from [127.0.1.1] (117-20-70-209.751446.bne.nbn.aussiebb.net. [117.20.70.209])
        by smtp.gmail.com with UTF8SMTPSA id r7sm20566848pjd.55.2020.12.15.00.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 00:38:05 -0800 (PST)
Date: Tue, 15 Dec 2020 08:38:00 +0000
Message-Id: <20201215083800.1362134-1-nathan@nathanrossi.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>
Subject: [PATCH] grep: add nativesdk to BBCLASSEXTEND
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-extended/grep/grep_3.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/grep/grep_3.6.bb b/meta/recipes-extended/grep/grep_3.6.bb
index edf9b29c8f..cb009b9132 100644
--- a/meta/recipes-extended/grep/grep_3.6.bb
+++ b/meta/recipes-extended/grep/grep_3.6.bb
@@ -41,3 +41,5 @@ ALTERNATIVE_${PN} = "grep egrep fgrep"
 ALTERNATIVE_LINK_NAME[grep] = "${base_bindir}/grep"
 ALTERNATIVE_LINK_NAME[egrep] = "${base_bindir}/egrep"
 ALTERNATIVE_LINK_NAME[fgrep] = "${base_bindir}/fgrep"
+
+BBCLASSEXTEND = "nativesdk"
---
2.29.2
