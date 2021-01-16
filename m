Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.7314.1610819058210980642
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Jan 2021 09:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UVXRa46O;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id b5so7077389pjl.0
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Jan 2021 09:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=kpQCzac9rB3mbmZ7my7n4HFMP3VTuIcJ+eRBtURi2Mg=;
        b=UVXRa46OqEZpDevrqj7xZdLauufMA/NKJpXej6Cuv6GuFfj0Tis6swDLojybQ+RpS8
         8D9v7h45RXevjh5VtkO5lV05eY3PlZbE6+Tjb6H4cv3Lb5oFGUDVBWhjOMG5FreyJnKS
         FTqTBWSekcjgxTS64s9fG2uE/63/nYl8UOXUYoMMYaNC4HT9MCWdaA2pn9zpxE7lg10Q
         xhQQFeTnkawqpuoM76ZsIrMCNsSPIQy3rWRUsYD72cxyUUPSzpNTMvNxxHeV6FkLLh2h
         pyRQmCyQTSMebCo9qWCyDbnae19WnIFp5ra6/yo2F2cOk4BMcGjSysEIPk8y87UUcQ5t
         CJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=kpQCzac9rB3mbmZ7my7n4HFMP3VTuIcJ+eRBtURi2Mg=;
        b=HPwj424QTUu0XGaZhy0jD58N8AunBN9XGygGld5QicAweJ1Ehlm2lmjnBK3GHZP1zA
         TmMLCpisx2vmMszqu2F1KSPJUv6EQD3W7amM2N16p5clqH4w0eh7rLtKJ37H3hAUQpkK
         v+S3T8NqQgWwzNs2uwo7+/XQryIJmesbnZvITqWH/7xBtSZ2oDnsGqo0v0wkNtvUApC3
         ZzqVxz2LnuUMPopMqJXdTWEBLL5734e+oj5ofqtcNHnGTLzhfl2q6eg1UL7L6fE1iwpV
         ZgxFTVO1XhFLJHHW2vEjfOfISmH0lPgjb7weElBqQ1rdZstD2EBF47c2FWrpPxgCwxxJ
         C2QA==
X-Gm-Message-State: AOAM530kzqm8PJimfMXuF5I9q74d1Fee5K9pQDJ2RzyixT3N3hEZx9g3
	X8F9cuhgemRNmjljfYF3XKKLWp/i2BxYsw==
X-Google-Smtp-Source: ABdhPJzCVwHA2DjfzYetygauD1qWltImaevM8qcI5w9YQUxVv1+p9pr7tKy5Dcu3W1mTK4aTlIHpPA==
X-Received: by 2002:a17:90a:249:: with SMTP id t9mr13265731pje.25.1610819057491;
        Sat, 16 Jan 2021 09:44:17 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:9c08:d62e:30e8:e4f])
        by smtp.gmail.com with ESMTPSA id i25sm11495278pgb.33.2021.01.16.09.44.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jan 2021 09:44:16 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 0/2] Fix build issue for meta-oe
Date: Sat, 16 Jan 2021 09:44:12 -0800
Message-Id: <20210116174414.23584-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

World builds failed for mvp. These two changes fix

Exception: PermissionError: [Errno 13] Permission denied: 'TOPDIR/tmp/work/core2-64-poky-linux/mpv/0.32.0-r0/git/waf'

https://errors.yoctoproject.org/Errors/Details/539929/

Issue introduced by https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-multimedia/mplayer?id=5af46f89fcef5c436786ed81978de60f26abe054


These fixes are in Gatesgarth.

Please concider these for Dunfell.

Joshua Watt (1):
  classes/waf: Add build and install arguments

Ross Burton (1):
  waf: don't assume the waf intepretter is good

 meta/classes/waf.bbclass | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

-- 
2.17.1

