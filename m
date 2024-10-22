Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1DA1D1CDB3
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 08:24:13 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.13528.1729585446038404286
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 01:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ut7t6v/5;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539fe02c386so6249912e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 01:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729585444; x=1730190244; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ll1UAJ5qi0wPe9ZD7+NSw8fimia1qTaRbKp8sVkaTpg=;
        b=Ut7t6v/5gdVDBMPdsAzKK5m80OCW0QI/THhb76hU6HAH4OlFgDO7pZf7e/bldzx07o
         bKue28mO6ewL7siJf75MT2TG8OIpo3PZfL7GPndN5kIDxHJz18K+/3LdXJkLRzWeyFM6
         aXH8IKYBZUn9nGrVDluNVMoK8dme8rHs8fs2bzuFqpEDq1hTLSPHny5dWli30f6t6KdS
         XhRyRtqxyaVkGf/zPkZ0SXxb/fp8cExYj8Tuf9b+Bv03LWksBR+oMcYTRit0COt3niIi
         UYg6b/d3IhR6oBH2c3ZzIWXAKFCdW7q8CQzvz9KkDxJoCdPUYNRFLsm3cdzmk0Fnk1pe
         7SfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729585444; x=1730190244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ll1UAJ5qi0wPe9ZD7+NSw8fimia1qTaRbKp8sVkaTpg=;
        b=uFwRzSdSTibLIeQxcLaXD5cP8jIlW50mdP5uQJUU7RaHpzCPMQFWpNiRRQ/+U+FMhr
         ytOIQk0OYaeLznhxfxmRYyn1mZ160VbhrolB9PEy/LRyT+ixL3zhVR0YLCHMnYGO6LUW
         M0WVJF5ExctMXjjZGgzTeh3aJYnSsCVF0U/w62uJ1xBeEFQ+H66Fq4SHolPu0rvEBxzc
         qerJjGx00rCh67gj1CMVgiB+zH03Pf0h5eT+P75/E/Hp7LSI31kkmdYpjzts2Th5d5Gr
         l/GChb84VPlZiFyBsWMTelhJ52SY7vInbSVCfmgcD5m/SekPSn0pmHOKZo7Y0S0SF30n
         Pyrg==
X-Gm-Message-State: AOJu0Yx9tuV+yubT/8CS9fYWuy5dEvPEtbS0IrvqXt7zStEOL5Vl/WZa
	qTMPXeX5CISE06ztov2VZgmoBVv8aanrU+dcMiZXHHmwmXBYz6Jsjuu5olOLJUYyuSPxdn8b8EH
	QdI9bMx/3PPMRmENmpbSkZD47+aw=
X-Google-Smtp-Source: AGHT+IFlRcEDgdW+7jtUEqXOSJaQE5pGoIPdqvnhMYMZ5/agDOvK0xjSdiYqFKkpEW3WMq7NRqBwOXDIczTVrsowBaA=
X-Received: by 2002:a05:6512:1327:b0:53a:1b6:4624 with SMTP id
 2adb3069b0e04-53b131783f3mr630469e87.5.1729585443829; Tue, 22 Oct 2024
 01:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <20241022081140.1464860-1-thakur.virendra1810@gmail.com>
In-Reply-To: <20241022081140.1464860-1-thakur.virendra1810@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Oct 2024 10:23:51 +0200
Message-ID: <CANNYZj8VR90wUtudX4FiA-teKaJFrkgK_hohmb2o6iNXeGL96w@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH] libyaml: Add libyaml ptest
To: thakur.virendra1810@gmail.com
Cc: openembedded-core@lists.openembedded.org, wangmy@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 08:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206145

On Tue, 22 Oct 2024 at 10:13, virendra thakur via
lists.openembedded.org
<thakur.virendra1810=gmail.com@lists.openembedded.org> wrote:
> +++ b/meta/recipes-support/libyaml/libyaml/run-ptest
> @@ -0,0 +1,28 @@
> +#!/bin/sh
> +for testlist in test-version test-reader run-emitter run-dumper run-parser run-scanner run-loader; do
> +       case ${testlist} in
> +       test-version|test-reader)
> +               outputrun=$(./$testlist)
> +              if ! echo ${outputrun}| grep -q "FAILURE"
> +               then
> +                       echo "PASS: ${testlist}"
> +               else
> +                       echo "FAIL : ${testlist}"
> +                       exit 1
> +               fi
> +               ;;
> +       esac
> +       case ${testlist} in
> +       run-emitter|run-dumper|run-parser|run-scanner|run-loader)
> +              outputrun=$(./$testlist example.yaml)
> +              echo $outputrun
> +              if ! echo ${outputrun}| grep "FAILURE ([1-50]"
> +              then
> +                      echo "PASS: ${testlist}"
> +              else
> +                      echo "FAIL : ${testlist}"
> +                      exit 1
> +              fi
> +               ;;
> +       esac
> +done

I'd like to better understand what is happening here. Why are some
items in the test suite run without an argument, and other items with
example.yaml that we created ourselves (apparently, from items in
examples/)? How does the test suite work upstream and why can't we
simply use that?

>  SRC_URI[md5sum] = "bb15429d8fb787e7d3f1c83ae129a999"
>  SRC_URI[sha256sum] = "c642ae9b75fee120b2d96c712538bd2cf283228d2337df2cf2988e3c02678ef4"
> +SRC_URI[run-ptest.md5sum] = "040b47d9b00d2ddbc707792ff6626243"
> +SRC_URI[run-ptest.sha256sum] = "71030494ab116f1c31bf125de9d5fbe2f01aacf4daada36b44202be135a80964"
> +SRC_URI[example.yaml.md5sum] = "d7f8a342650b153d219431633b0c383b"
> +SRC_URI[example.yaml.sha256sum] = "d7c50b29716fcc7445e181c7d7043d70f8e58096793dc1f351c8e7f41034f813"

This is not necessary. Integrity check for files in the layer tree is
ensured through git commit id (of the layer) being a checksum of all
the files.

Alex

