Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.3313.1586407287479745582
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2020 21:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I4kP6fhd;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bkylerussell@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id o10so704242qtr.6
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2020 21:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=HT8BayMBTw2MvH7Ntg2xNAI7cwyyk4Bepv7GWAw7eFE=;
        b=I4kP6fhdEkuEEO0KNh72eXu6L+9+nvEzqMaMFHi4KJ1zZEuW4OX9lMC+7GL4Ac9xUD
         lWqTIIrHYBjv1HDTXi2IQAgxYp4ubcbTsERZY9JKZv51gL/4tfXCBR1bpaIaE92BYEju
         kz6hcuFZf1XZ/llFtrAs3xQhXkfnpnmlUVhOA3mZwrSYcVPHRQCTfy2BDDirdsIvnafD
         7B3+tvnLVRkBtreWmmF9GJluu+g3W/Ov4DagT24zzhxc4EmkADuBbb9BJSHNF3Fz7Lv3
         FCscKG/nhWCTHZuTICJwiw9KECMJPI/q8vssZAUdlhTOChTkfVGquhYfqgkaziaQH4R+
         0lnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HT8BayMBTw2MvH7Ntg2xNAI7cwyyk4Bepv7GWAw7eFE=;
        b=O78cLXQ8Z+rWaPQK77NU0QwPBhrkcGynS0F/FjLGoFn3js8r09c6ihWnh6n9/CPJZD
         5jW4W5TmOGuQ/vDlUrqWnn3XNz+VjdlCRF3TlUUjbiRPFw25ttMlJKtnrDq6/UoIUliu
         PAcmWnn/yDfbfnmWv34+lYmZIYf3D/+ihr9+9vVrdnE0cTHty4aEgBxnSTgpPdlUJhGy
         93w7Qud1eQwEHMI8tSmfGeRFYDQF4vIHGM1iQIaEve9CzLmaCgwihJIUyu4B55SNz0n9
         QnQoNM4hb/wpzi6YG8YypUuHFMKk9U5EP91DzlstxOfCAyCKS1tRDmhW1N/i6+NXRatm
         ghtA==
X-Gm-Message-State: AGi0PuYAXEbj7726lCtBi/m+pkZZDJc1O7I7HiG/MNqWnGw3S0bz07Pj
	zNf+tAtnZNZH6/bH7TEodOtUq2ncFTE=
X-Google-Smtp-Source: APiQypK7r8BPLM5grsXW8mPKdsQSHk1+BGGWIDizTqdhsP3QzCM2IEw4a42AmG9UpMMnKjbLohHtjA==
X-Received: by 2002:aed:2450:: with SMTP id s16mr2844440qtc.345.1586407286445;
        Wed, 08 Apr 2020 21:41:26 -0700 (PDT)
Return-Path: <bkylerussell@gmail.com>
Received: from poirot.cinci.rr.com ([2605:a000:160c:8831:dc9a:14dd:5a5b:9f19])
        by smtp.gmail.com with ESMTPSA id x66sm15854131qka.121.2020.04.08.21.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 21:41:25 -0700 (PDT)
From: bkylerussell@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: wesley.lindauer@gmail.com,
	Kyle Russell <bkylerussell@gmail.com>
Subject: [PATCH 0/1] patch: don't strip GitApplyTree patches
Date: Thu,  9 Apr 2020 00:41:15 -0400
Message-Id: <20200409044116.27070-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.17.1

I think that the GitApplyTree patch implementation may not be quite
performing as expected when dealing with a non-default ${S} and patch
striplevels.

I'm not quite sure there aren't scenarios where we *do* want to honor
striplevel in GitApplyTree, even though it always appears to apply
patches at the repository's root, so I wanted to send this out for
feedback.

The change does at least address the scenario I encountered, but there's
probably a legitimate use case I'm missing where we need striplevel here.

Kyle Russell (1):
  patch: don't strip GitApplyTree patches

 meta/lib/oe/patch.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.17.1

