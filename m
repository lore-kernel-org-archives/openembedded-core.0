Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D634C6FA82
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 16:55:09 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.986.1663001700180517656
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 09:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=EPM48WbR;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.44,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f44.google.com with SMTP id f20so9245283edf.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 09:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=JQkHi7171kvdHstYrYgUSU0CYuWXaClRHtP5+kyBncE=;
        b=EPM48WbRL6qubRyHGepk7RF8b2cTvELg8h6RH26fVDMAHM6HpMUpJE5Ek3ZV2XaNLV
         YRNgF6iR8hSVTAO2x6DL7o/QJAA5+Z2pkUOKeUaqhYA+pb9OXvvAiLF6EQgnXkJQsVAb
         6r1exfPzXjMyCHwPpBTBEZyvKohR75dDuKcxKO3xw1XcZpPtju4tcn4OhX1eQjzTlqbp
         3OyperuWS/++NlunE5fAjOuibwLZ4ah5GhsxjC/So5TafZqiox/qvYfoTK7SgY9vv4fQ
         ES5PtjgUl0uuXj/phwQWVa8VotlHLF11KYVxAHqQmmDQaecxdjoXknBWugzv2TNcKUYX
         KdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=JQkHi7171kvdHstYrYgUSU0CYuWXaClRHtP5+kyBncE=;
        b=zf4YdegFWUfT+Evgpd2Tpf6B7Y5mhKPPZthO50k35zegkpEOUvcmSOdjO8Qle9qfp0
         1olukuV/frfGm1XrKAmGD5TpoD04AjD4AH/nIg+fNNbrWQa8aF8t/FSV01o8iQ6hv7kP
         w+CgD5Spgj+cUYBliuLnxfrervSRxY5zn9DFHdvYQ7S3dU1GNNi9BrtIKL+nSbQjiPje
         rl140Fmas0dYq+Vs7kvMVkVrIBuMxfKD0xqobKiaIRyL1KWbrWPzsOslQ0VAR46xyXt6
         /iiU6nymaS7P60+l6DLjq3U6LUXLIftsoFnLcnEnX6iv9qLcur/Kv2uM4i6PdUZDyq+K
         eKEA==
X-Gm-Message-State: ACgBeo1HK190OOl+11UTlz6uVfZh3SD/K3IJGOEtCSoUwyYQZopF814b
	h/F2aqrgN7HUa9VfH0WzfqZCEx8891g/mngAAGank4qvWtDmqfvx
X-Google-Smtp-Source: 
 AA6agR4qvg7nOcsQEnmJmTMl7xLGnae0rKPxjEJaPmFr1x6ixcokLzJWLfOzR7xdfIPAXJTgpGDaH9RPk4bgQRiD0UI=
X-Received: by 2002:a05:6402:90e:b0:443:ec4b:2b03 with SMTP id
 g14-20020a056402090e00b00443ec4b2b03mr22365104edz.71.1663001698435; Mon, 12
 Sep 2022 09:54:58 -0700 (PDT)
MIME-Version: 1.0
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 12 Sep 2022 06:54:47 -1000
Message-ID: 
 <CAOSpxdY3j8DAsOQGhG9w1BJi+2ao4sO_KLvbkxX70fwbq8BfzQ@mail.gmail.com>
Subject: CVE raffle: collision avoidance
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 16:55:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170539

Reply to this thread noting which CVE you plan to work on.  Please
don't claim one unless you really intend to follow through!

Thanks!

Steve

