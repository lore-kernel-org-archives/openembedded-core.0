Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17165C35FE7
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 11:18:45 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.112703.1726399117642755911
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 04:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JNYlxH/M;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.182, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-45aeef3ce92so840201cf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 04:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726399116; x=1727003916; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oUsG9aRyyP/ZrDysh3NWCxAzW4jylx3MjSVxp6ab+I=;
        b=JNYlxH/MtNkB6TjpbSsb0pLNN8x0ktHlCRoB4KH3qosZtID6VvNDO/zK8pR+YH8+2y
         hkW1ZAnI/6sB/RW1OEfROr/BxZBgi8drQeO8AfsApqQay0RIQGb94yMrQqcdeqt8YsvR
         ZMAo9g/Db1jsp3Plt8+BdyG2ABnFqB3BbSddgGiMJOyVK/4ZlqzDShtJ6ZwVTZl2tAW7
         hvCgpbzA9huwrDWW+2ui0Z9Z8/47jaAXP+gKUlDDFmsjwMjGKHXY2f+UuAcJMaREENfz
         4zCgARhVj9ZbKS6VWLq8tJsa5J+dt1OyYYdrjVpU4QgyNMThR+fyrN1JOxqDcALtwJWn
         80Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726399116; x=1727003916;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7oUsG9aRyyP/ZrDysh3NWCxAzW4jylx3MjSVxp6ab+I=;
        b=SVPVt4X84gr8aWoJBnI5ElA7I9sXhM91+klXwuWmi71iieeJAYA+UZlO3tCK8B4Y/N
         0yM1o3MEhWJXw4xldw8EkYC8XsUtr3reEdFzYISt2zELYc7ppfkTRo5jbiqi0rFttOup
         ay0Ig5kdtuoF+sfklv7ntcp+GKgl5hpE2PMJje1U/NQOnD3cYGhzE3QrdtemkYhVQPfZ
         cOHd2Oe0f+u6r/V1o6kGGOPsB6L8YrmIYjPVWo2dKK8T/4d6B5uXw3u8IDhh2alTgP3M
         DKp8/VoEpYwr+bkmz8atLbgJRzelOC/3CuDOkIbb2A+YMu2GRyooibr1LBev8wf45amx
         hoBw==
X-Gm-Message-State: AOJu0YyolyiXLn3oRiWY3rdEZujX3k6Pw9PnibfwZpa5Jchxr9c87EdM
	WFSqXBeoXCaaLAAS7lNBsGuIu1+nvbqV/8Hut8O5UQYnVBughw2scJcpiHP83DuywHbzrIcnDul
	R
X-Google-Smtp-Source: AGHT+IFRl3pqOK0A3TbxvcfIQSBVpm4es8irT/JTp5W86L+E8z6XfqGbkwh16lYb9JU6TUpI65e4Jg==
X-Received: by 2002:a05:622a:7:b0:458:a70:d9bb with SMTP id d75a77b69052e-458602dc73amr170624571cf.22.1726399116412;
        Sun, 15 Sep 2024 04:18:36 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-459aac624fbsm17111541cf.7.2024.09.15.04.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 04:18:36 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id E28C81003BE; Sun, 15 Sep 2024 01:18:34 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 15 Sep 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 15 Sep 2024 01:18:34 -1000
Message-Id: <20240915111834.E28C81003BE@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 11:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204497

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 0 unpatched CVEs

Summary of CVE counts by recipe:

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

