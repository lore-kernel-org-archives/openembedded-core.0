Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.7788.1592487914414308365
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 06:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gh6Xxw6Z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id f185so5721128wmf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 06:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=UgRnwRCQgDtHin4IUCGGoZJ+7dJT0GeRUlMJenG5Few=;
        b=Gh6Xxw6Z/XNuS/3A9gZBHXr2pg1iCKuMNxB0VWf88vBLbFECncC3MxzTD5sruGuU+C
         MsHUsrUWFTg8H4ej48AklLnL9SbmQ7VRl3hnUZszic5DhIePhUSWI3OPWEeMuqeE/PI6
         NphrTv+gXaXT/tBeoUwA6utciU2dp7vIOXKUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=UgRnwRCQgDtHin4IUCGGoZJ+7dJT0GeRUlMJenG5Few=;
        b=X1ri216cjiImDQ6raUf82yhAdWIH1r0H6gvcIF5ZThoCt1qg7LzgJ8rw1xt9hTaA9k
         hpKUvAKadvVB/es507HA85u+TPMA6bBmqklmaFNVOZZIduDlv0H7gWObMH/Q2Tvk6Yva
         dttpvCvKrJ9p2CfiHGXEiDmQt0roiV7+XXbGZEbN2QV9kZiKeuPREEoAcljxaHnDaVW+
         VXuibvePEz+g5Ejs6czPTtcXJIgZ329O0JElm7iu2yZN02FHLx4Cg3SDAfnsyFN6TxS9
         hP+pBb81z0I1ocWST1x61H2MShUCZxFUlyEoVHxTot5PiQTWc+driWnxSwPQ7mY4NZaj
         hN5g==
X-Gm-Message-State: AOAM530I/k+COrbF+ex/H0EFzUyg3BTLi0X8/VIEalQTukx7Rpku6HZU
	zdKnbEQ9qOeg46QucGNAM0AVROVT5KgfKg==
X-Google-Smtp-Source: ABdhPJyJilVuRhk0ntUBhksyeDmYFmotXCfYmA9k/CN6wok1G7wxcCI05kxWS/mZy+7soe/idGgigQ==
X-Received: by 2002:a1c:32c4:: with SMTP id y187mr4195327wmy.79.1592487912547;
        Thu, 18 Jun 2020 06:45:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id a10sm3760175wrm.21.2020.06.18.06.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 06:45:11 -0700 (PDT)
Message-ID: <002153a6ef6e2f097ea6c1dace326eb45321fdb5.camel@linuxfoundation.org>
Subject: Autobuilder problematic failures bug list
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Ross Burton <ross@burtonini.com>, Steve Sakoman <sakoman@gmail.com>, 
	Randy MacLeod <randy.macleod@windriver.com>
Date: Thu, 18 Jun 2020 14:45:10 +0100
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I thought it may help to list out the issues we're seeing on the
autobuilder in recent builds and their approximate status where known.
Most of these are stalled and we need to get them fixed as most builds
now fail with one issue or another from this list.


icu do_make_icudata failures:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13869

bitbake-selftest svn externals url failures:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13948

perl storable module sometimes arch specific:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13946
[a patch will probably workaround this but root cause unknown, is a
reproducibility issue]

resource warning for qemurunner:
<needs bug?>
Example: 
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1034

intermittent matchbox-wm segfault
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13908

QEMU PID handling issue?
<needs bug?>
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1031
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1032
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1041
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1027
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1028
(seem to have been dunfell builds but should also be affect master?)

intermittent systemd logrotate failure:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13844

intermittent oe-selftest stdin failure:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13055


Cheers,

Richard


