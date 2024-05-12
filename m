Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D13C25B4F
	for <webhook@archiver.kernel.org>; Sun, 12 May 2024 18:51:54 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.42088.1715539910407969817
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 May 2024 11:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Go+8EyKS;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51ffff16400so5961872e87.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 May 2024 11:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715539908; x=1716144708; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2iaPXS0v7qmJftgGiLcsrDJBVSZ1na42lDdjaifyqX0=;
        b=Go+8EyKSwQ7kOiB9ZtKxvI/Jj13I94xAiStpgLskT5NZ16bMtucSlVcKM2VAU0IWAF
         on7GZaEXeFMPnyMyYoZJH1tOAqHZyTI066kS5bN3xZeCPVZDdu/y/DF3E/AQPX2E7IOH
         NneF7oTs2TLP7gYJokUHFfLjd0OR5JEc6+eDLB2rucmt0YTgllZ47jvI8YEnrY3EZ7O8
         ORCP5xUl1XdKuaBFpYxiNJE2D2WuKdoaX2kqiE+F8+OPv/BBvmHP7RN/vGnjPCzTw0XD
         0V6jNC2y5aV9BXU6CRCgZxw+QqO/QJCnq2mBJkqwUtPpIKzlmfd7iGo/NCgq0tkTKs89
         WwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715539908; x=1716144708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2iaPXS0v7qmJftgGiLcsrDJBVSZ1na42lDdjaifyqX0=;
        b=Ukp5pSVJzAzlBYRFIbGDMUi0kRnxZxcbaighs4A6tx/SnRMJVJjgFdH82go17oc8Ol
         fun+x6sR4o4TxkxQzmGvLvsc5CPVsiWc+eHgOX3agv3AmApXnkWQiNb50tclGSe9K7U0
         aYiUmO5pw18m+WL9/ahZLMHjnQSPicjdqTHW8gEQAw4ZKQHHSRerCusvBsbziBTyCs1a
         WqZfL3JhCwsCf2879jkCUZLKK/6Y1rB8osNC0bX1ma0GsXpG8PKS7hfHkz09pbCXDPfm
         F3tRgi3YBX3SVzjLDy987hlMBTH5DXrBpJzjJOUfr3k42GQslVEhKH7fYKrW83B34pAk
         DB9Q==
X-Gm-Message-State: AOJu0Yyg74hJ5/R+wwFPsJCUraKWhn0kuMyvoIFeco2EwsZE14ZaPfOO
	U8I/xpkt20Z7UkDiimjJTV3bItBLYhUwA4agvbRKYXSq3Mqa62dn1Oyead/Tmr1K3Q2Nc8vcYyd
	SzGs5kuEYtGaLvKhm7ImnLt2WLvo=
X-Google-Smtp-Source: AGHT+IFxUhkXsQf66dbhZPkyC780ZaEsw++umGsUYs/Tfapfhk6PzZAp8BmICATmDgxfo/F6YYmb/K4WEe0xZ4fmKqA=
X-Received: by 2002:a19:3815:0:b0:51f:c8f:e356 with SMTP id
 2adb3069b0e04-52210473fc4mr5893100e87.62.1715539908308; Sun, 12 May 2024
 11:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240511162231.4102212-1-raj.khem@gmail.com>
In-Reply-To: <20240511162231.4102212-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 12 May 2024 20:51:36 +0200
Message-ID: <CANNYZj9yKE4RAUqqZic6v3jSt7Q1bmDeE2MGBmyHOxUN0-2nJw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] valgrind: Upgrade to 3.23.0
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 May 2024 18:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199219

On Sat, 11 May 2024 at 18:22, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
> +From b17b6d7d3a65c14f91f090f3f4f9898d6fa3a9e4 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 10 May 2024 16:27:34 -0700
> +Subject: [PATCH] configure: Drop setting mcpu=cortex-a8 on arm
> +
> +The -march settings from environment expresses the flags
> +appropriately, moreover, this conflicts when using armhf
> +without neon [1]
> +
> +[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=928224
> +
> +Upstream-Status: Pending

Please no pending patches. Submit here:
https://bugs.kde.org/enter_bug.cgi?product=valgrind

Alex

