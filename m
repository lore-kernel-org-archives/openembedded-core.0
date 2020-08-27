Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.16635.1598527720325399963
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 04:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JvF4bf3O;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id h15so5002294wrt.12
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 04:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XLRUAJJzPHkJR0OAPhp6aOWJWEwEI8dXxiM2+g3fFok=;
        b=JvF4bf3OpzLS6qWqkdMEL+jYEkYBtdlMJiZfyNR6xX/OeRYa/uA9/KLW88mWqtgeB6
         kAdJACmZ/dUIkuUd6bGAWIkXngHRGdRD10u7e0AnslLABC88zo3ii8Axqw9LxzYdHtyd
         X+HhQqDPrlVBTqaJUjwEOg65TsC9K5RsaUtxSNBHLRVX2GVB62jVnEbnhxSCUBcI1uLE
         TcgxnGbPoqHuQ4FR5itWNmHRMzVcNAjYO6QlEgRaMhc0l1gBYz/vMArMdv1SFYvDdjJG
         iKg5D6R0OkuIHxnKPmSotMDadGYVaxAh2eggJrzKejZw60MgL8RZJ3s4ecz/FP/8uN4T
         Ps1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XLRUAJJzPHkJR0OAPhp6aOWJWEwEI8dXxiM2+g3fFok=;
        b=DwNFYg3Q13yEqmbkSLPj3zW0hn7EJz1x5qyZ5N6pE6OAHqMw72kWPzBKZlGLcWmSjn
         /1mT0iIEx/vaVKTG/UQWAE5wyVQKXUP0xU7O/eEP7KoFEIK+SV8+DObqJKGJeqNyWO1p
         YCpS41loZmDQbXE8rJzTurpdZywNPLmLtf/E2SZNRMwqf25HTXUF2QyhkaPYCwevx2h2
         n7/e6/FUnDJeIVbo3NDoK5Gp76m5p+z9iXxJrA8YsSYT0u1AJk/DQ1Oc1HxEhbWec1Mu
         +pbODuGjKltkAimDD6Xkh7BhP1yYJU9ldHU/A6bDUMwdYQeiIOcRZdCdbJvUMOCNS8H2
         6JKw==
X-Gm-Message-State: AOAM530d8jagN5yuVZb5GPT+diF8jjMH6WHzeeWw6jD6ugO3HqWIli/E
	qbFhJsrrxATFEHBtiBMLAH4Jl4T+/W5OVg==
X-Google-Smtp-Source: ABdhPJx0HOdstJQGlQH0Ipgavv8ZTM2KjzO0TedhDE0f/9DhRGU+PHldx/fIvB8nSlibycfvJG3wMg==
X-Received: by 2002:a5d:6692:: with SMTP id l18mr19620219wru.211.1598527718498;
        Thu, 27 Aug 2020 04:28:38 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.ad001.siemens.net (c-82-192-240-69.customer.ggaweb.ch. [82.192.240.69])
        by smtp.gmail.com with ESMTPSA id k11sm5326133wrq.85.2020.08.27.04.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 04:28:37 -0700 (PDT)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-gplv2][PATCH 0/1] util-linux without python
Date: Thu, 27 Aug 2020 13:28:15 +0200
Message-Id: <20200827112816.2138122-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's not completely tested because we do not use meta-gplv2 layer.
But I guess it will solve the Problem of this build pipeline:
https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/2371

Adrian Freihofer (1):
  util-linux: remove GPLv3 and pylibmount

 recipes-core/util-linux/util-linux_%.bbappend | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 recipes-core/util-linux/util-linux_%.bbappend

-- 
2.25.4

