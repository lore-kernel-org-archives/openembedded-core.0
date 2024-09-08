Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2819CD4F4C
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 11:18:44 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.28250.1725794317599119462
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Sep 2024 04:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YzFUAUM0;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.179, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a9b3cd75e5so17565285a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Sep 2024 04:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725794316; x=1726399116; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVgI+kImorokPlm/NMpGiG80sN3i/wVrXHiW691/Q0c=;
        b=YzFUAUM0Ewe80pO7F1fXtCxJ30mjMNDz1TDJv4G9pVm5AM8OoUK6AiI7zY0mnH/DCf
         O6Q+Q+WDRcUk9RwWSuXak0OJVD4MF7UynSX44NTL3zD4HlCf0rTsqi/EOQSg6o0xXEBu
         NPAThzrlhjV+jetZjUUxnAg3uWc9trKhIadT/quoFplS9tz/uKXbiYlKXW8/gkFNwF5k
         A/kHGvbxEm6IYofRDNdKfyvPMHStIPb/dhJfoG5y1pNbhT7doewhCXJW5acTjA6u0H2E
         ROrxVuAs7mp/KV3wVBCnFXMQZL5AXqwXIfGRmPs3EXQ4f2akXAxoArnnS22bafW8JsBP
         0exQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725794316; x=1726399116;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vVgI+kImorokPlm/NMpGiG80sN3i/wVrXHiW691/Q0c=;
        b=bisu9ade2aRvhxhsTyDLqgm5B6vL+AN3kdFYV5C9vPslVI3i9VC/79IW0ZEm3JZtFD
         AdYj909MpV5Gu3CqTSKMEDajKxuZr+oDouf59f8s4Fz5da5xz/brmLXzt900+24Lt4Id
         I0tZlqObp47Lpwmnqi0gdh4OQNfRh9yP1k99XnJ9Ppt6UTpsToCiYJSN3djVEEvEh4tj
         Hlk8ZHx4FbK5ol1D1PfUTJvz2cwEkjFNc0eFzYx7ROoXgKKBIyXRw596Yr75sAmvR2IH
         /EEcREv9tRXYwHqTfbDC6/CUy9r2y2PSuNcVZhSqUGhq6Os4UcHb2FFA2hSXcN0thkyP
         SQnw==
X-Gm-Message-State: AOJu0Yzro1pXre8mnD7JDdLcPWrZ5IC8pdeGjBlnIomxHs58hAIEdvCs
	yKKYRnJhlMFflBcu3bOESYz+aetERva2WPTSXc0Sa1q4iEbnMbsAnFquGbUqQcKhrD7dPcerlNn
	8YHk=
X-Google-Smtp-Source: AGHT+IEp/bmblAmQBpePOuJ3UMD0tpXY+3cTNyqTMGjXyteEuX5021yz7a5HTrUYY6j3MoveOoOZNw==
X-Received: by 2002:a05:6214:3a83:b0:6b5:def0:b60 with SMTP id 6a1803df08f44-6c5282fd551mr92227616d6.4.1725794316480;
        Sun, 08 Sep 2024 04:18:36 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c534339af2sm12008146d6.44.2024.09.08.04.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 04:18:36 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 288E8100367; Sun,  8 Sep 2024 01:18:35 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 08 Sep 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  8 Sep 2024 01:18:35 -1000
Message-Id: <20240908111835.288E8100367@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Sep 2024 11:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204296

Branch: master

New this week: 0 CVEs

Removed this week: 4 CVEs
CVE-2024-35325 (CVSS3: N/A): libyaml:libyaml-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35325 *
CVE-2024-35326 (CVSS3: N/A): libyaml:libyaml-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35326 *
CVE-2024-7264 (CVSS3: 6.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7264 *
CVE-2024-35325 (CVSS3: N/A): libyaml:libyaml-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35325 *

Full list:  Found 0 unpatched CVEs

Summary of CVE counts by recipe:

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

