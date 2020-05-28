Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.13523.1590676848744227716
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 07:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20150623.gappssmtp.com header.s=20150623 header.b=BnZlPebO;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.128.49, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-wm1-f49.google.com with SMTP id u13so3414668wml.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 07:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=EGkYMXClqRC4dOfNdmvDCZCGZ5WRo9vKZK6rriT0lAw=;
        b=BnZlPebOP51Cu+rsEjY8NHLfMev8G4CG4Gv5UKPchyITfmdgIxEIpDtIJJN7SHqgNo
         y3peGj7Glo4V+yBZVIZRw6lC9+WwzwPdWzMnvCukUoJ3LcAchsb0JzOu6gT72AWL0YdJ
         ZUd8t9ZvXifr7z3162UBVe+4TXmppVqCEdIWmkxqB2600AfXXQnwDhfgTPRVENDXZuik
         C3sqHJMZyNURinbpPJnO0ekC6FGjbtRwrD8oVRq3fDohMi9Jlqdo0NU99FwyJfigBfff
         tfQss+PgUeeNmh58xHAofeMSwr1pi+TKQCCwBeaTxcMpykVBdO6ym8pebGQStO2EO3ZF
         6vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=EGkYMXClqRC4dOfNdmvDCZCGZ5WRo9vKZK6rriT0lAw=;
        b=C5kRK+AwwO012oPSnAWiZnv3N2E1zuVT/1RtM9HxrIqUt2NxhQk0++BVXlUjKlNtC0
         EtYCfcX6LmufLQXwnO8PhLj52/g37znwDL1gLT08v4UmhZ7/oIpPK/2+dcICibMdoTKt
         L4g5kGu4Y0GnVoG68eOaYxGgsLDvjuD/Ia6gm3xENfemO7lST+4rtp6qdbExgvnitMs1
         I5Sw1ejE10ltN5LLQkrEKk6z4wlvW3HB6M0iOiJl72EjyIxOQw2AHax6X9D9OD1AtIIk
         aMrFAs5n6dzb0wa9Gqqba7kMn2WoAxRoIcC9ZxtM/NVpmZAmyjiOdWMxT8x5ugPFLETv
         KbJw==
X-Gm-Message-State: AOAM5317QgLSlgN96plb7boNaMsAw0TJJNCyR+ydidpcN0aMawg+UoMw
	ebfnXB0i/3RQYsb2LCUD42BvMzxOPJsEQQ==
X-Google-Smtp-Source: ABdhPJwBpzazC4YxcD5PGVAg4AvN3doo904IgO5+wPdFm1h/9ySWit57UnLOP3rWjYgEh3NkSK1xJQ==
X-Received: by 2002:a1c:62d6:: with SMTP id w205mr3508577wmb.97.1590676846928;
        Thu, 28 May 2020 07:40:46 -0700 (PDT)
Return-Path: <daniel.ammann@bytesatwork.ch>
Received: from [172.16.80.18] (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id x186sm7228010wmg.8.2020.05.28.07.40.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 07:40:46 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
From: "Daniel Ammann" <daniel.ammann@bytesatwork.ch>
Subject: go-dev and go-runtime-dev overlapping files
Message-ID: <e04a859c-e00c-e537-7301-6180e052b91f@bytesatwork.ch>
Date: Thu, 28 May 2020 16:40:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi

According to commit 60dcae509a210f2cae8eda525a1b006663aef9bf, there shouldn't be
conflicting files in packages, say go-dev and go-runtime-dev. As far as I know,
this is generally true.

There are however many overlapping files in /usr/lib/go/src/cmd/. Should the 
recipe for go-runtime modified to not include those?

Thanks and kind regards

Daniel

-- 
bytes at work
Technoparkstrasse 7
CH-8406 Winterthur
Switzerland

phone: +41 52 550 50 67
