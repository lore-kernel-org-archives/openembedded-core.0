Return-Path: <lianux.mm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20804C4450F
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 06:45:28 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8075.1784270726744612397
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 23:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MZeaxzZt;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: lianux.mm@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e4beb7cc0so250921a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 23:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784270726; x=1784875526; darn=lists.openembedded.org;
        h=cc:references:in-reply-to:date:subject:to:content-transfer-encoding
         :mime-version:content-type:from:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xMDJIkOZKXykrNARDijn+TEz85pXP8OzpeV6Oaplwog=;
        b=MZeaxzZtn8y+sv5mq0GdlYiRlzuNca+PSs3TiFtzASvJ9SJUpMazbB7AXYY533Y2Jk
         k/CiWkvzziONQnbtwa+yr2gmTspZUP7bdUaf+vEa/KQkRd1hSzjKHYEZQ6IoRddgLS4W
         JXyuNBdhXmO5oHsM092JH9niMgWUFhQA/0gI93UH9d+TQ36nqWshmFVMUMAxjKHQl4Fh
         tzAtx5aLXFv9QhBqI/OGEuH0HV+xttpQD6bv7hxImHRB3JLmI2+mT8agcVQlfCF36nZW
         t6GLVswgOOchr9k765mmqYNDvfIZ5d7rIrCiPGgVJ/MpnyyO7D+jnVt4bhGvPtDjSKLY
         T8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784270726; x=1784875526;
        h=cc:references:in-reply-to:date:subject:to:content-transfer-encoding
         :mime-version:content-type:from:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xMDJIkOZKXykrNARDijn+TEz85pXP8OzpeV6Oaplwog=;
        b=rwoDG57W6UbUZzMcCF9pDZgZwi7I8gGwfetpDQd7UkbAM7uWyx03b4Z3eCwoJYMqlR
         QXQhOp1pdUW0T7PUwvgDdJhb7khrNob71ZWLD/0HjZXcC2ijnVJJV3ZsY2bkr2ZSlUXf
         +wbZ1RjnW8GHcnNOdw/6d0aKlp6QiKZiAGBVduMxJkHrhfJP5SucwCu5dJ0DCyaHDnHc
         fXzpD03eSzqrxHhcgcY668kiUFIB2VSiYwaM9IudTT7G2q+NCm19mgDC2FbXFLI1msKI
         iEnFszUSnCQjtnlHvNjBg+ub/8CMylh4Q3Xa00shPfZxq/jr9abqT4r7TFvr8RnTnx3m
         0IPw==
X-Gm-Message-State: AOJu0Yw33jq/vqLR0ZujUjZeoTAJ98lrLqLHob7VLuNQHHnHNgQn2Dql
	l5RJ6lmLcPYCMfF/bn7u2Gd0mG84CEd9aDtYxkf5UujyNMM+wxZqpUm7Y8QbFcwyb7I=
X-Gm-Gg: AfdE7cmIiZoUXcvFVRs/uCWr6sQBMib0S0d/QlrSQ8eh4j2+YHTmU44lFCyPhAW20Qk
	dhN3gyJdU7fCsZidGih15rbu/cxLR/VEneSkpF5g8aQaNCrjKEDIIw7ONTY7d3ZMmORBUpDCZht
	q1mojYfc/3r8KxzHT7pO8ySGC8R0JkDwhALWV8S8o7QbtPQqBt+kgmiBC9DIuc9CkijPgnPLseu
	DuNzpq5KgPJ6pdwvCuwPcyGTG4CjsgNSxr04z9R+FieuLGBqkZtxcm+fa5fky78/kz/cD/XDYY9
	ubzWyHbtRuvMIhK+Oa1q0yhhkC9932UIGUXQHYBKjSjvcUalZVHPLP8g53NHsDjnR3xxa87LMHO
	y+mSMQMx9JFJcAxM3jUEAruKXkmya6Xwt3Xjqu63LbbgPwcuBoK5fNlmIMXGoBjlnfHJX17o5/L
	5sJFP7OAP30Fs=
X-Received: by 2002:a17:90b:2692:b0:38e:79f:76ad with SMTP id 98e67ed59e1d1-38e4b52efd9mr1331643a91.23.1784270726010;
        Thu, 16 Jul 2026 23:45:26 -0700 (PDT)
Received: from lianux-2.local ([2605:a141:2231:7698::1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39de7790sm2409380a91.3.2026.07.16.23.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:45:25 -0700 (PDT)
Message-ID: <6a59cf85.07a3e4bc.43de0.edb9@mx.google.com>
From: Lian Wang <lianux.mm@gmail.com>
X-Google-Original-From: Lian Wang <lianux.wang@processmission.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpng: upgrade 1.6.42 -> 1.6.58
Date: Fri, 17 Jul 2026 14:45:15 +0800
In-Reply-To: <20260716075137.18584-1-lianux.wang@processmission.com>
References: <20260716075137.18584-1-lianux.wang@processmission.com>
Cc: Peter.Marko@siemens.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241151

Hi Peter,

Thank you for the review and guidance on the stable branch policy.

I understand that version upgrades are not accepted on the scarthgap
stable branch. Please ignore this patch - the existing 17 CVE backport
patches already cover the listed CVEs in the current recipe.

I will follow the stable branch rules going forward and send individual
CVE backport patches for any new CVEs that need to be addressed.

Thanks,
Lian

