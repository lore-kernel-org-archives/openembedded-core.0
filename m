Return-Path: <massimiliano.minella@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD126C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 09:27:33 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.23896.1699608448611649912
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Nov 2023 01:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hGyeFKCS;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: massimiliano.minella@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-28094a3b760so1616688a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 01:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699608448; x=1700213248; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KdMjtjR/MUX5OOwK69gn6XhFjC55+zPvzk0xmxIx9iU=;
        b=hGyeFKCSWPhz2gnfqjKM+PuwiMED/w/a3CiWZHhGebuibl4Fm1JIcN9CwVzNWx69PM
         ep+ZPt1XXrBHeo86Cr/XyLy/K+y92LRnrYn0WZEo7HZAF/fu03hfhKMyTJX8G75EYuBt
         o013VyUJ8N1WHH2ePPxuuXBtVS4a9wNB3snCzZ9AX8HHcw85kzEKjCJRvm/HvH0iZQ4w
         hd4KPzEhP1K1Djqd9cAHNyer2EBsrk7nu2yKpmoCcCO5znWB+Sfxc1HbZvo4bp9f1XC/
         h4W5zAgQvMbFkdlnNlfrUuuGG+CfTpliF3bAjRS91nuw3LzCS/OGzC8fWBNEv3yz6MZR
         E1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699608448; x=1700213248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdMjtjR/MUX5OOwK69gn6XhFjC55+zPvzk0xmxIx9iU=;
        b=skkaw1X0TlBpa5YRtAopbbk0b9RA3+mSTS+Fmglhrr+2jrYFxuYi49EvGlnfkzV5lk
         UQALXOV/TO9mlGlVovZwLjNhQTtfzKiD77eceyKKzbIK5jDZHRAOizqEzS/LO4wfUYX8
         CUmSAdgZyS2gFMLGRBiuHd1Nls19kR1mCSNRRQ+8D/E5dfYChfDL0D8FgGlZwKWqjoht
         bIx2uegIlEG9AGh9NpaPoIfdhfEr8euFYZaugegaD0uHReTQFy6IyCzXiozugxdD9jHL
         0W0pApUDQHV8bbCzqMxhHU+brD+tdxcEkAmL1f4unH6DuQEfAvdCKMEYP9JQFUTzjfk3
         Im8A==
X-Gm-Message-State: AOJu0Yyi/kr2NkYTkJjiV+vlyMRZZo8frofAP6hYARjR10ktnKUMGISA
	wqC8Zgt6gfEPCbxpVcOKW1ESSBrOFribrsTaOPIDFqLYS0w=
X-Google-Smtp-Source: AGHT+IHAX2WCPgnil3XTzAaJcrV0s6rgJnb2LkAgwxTqQDx62h88Vz+sdaLNKlY+KVrQ6mMNZLBeSLVHHI3f2nRYGoA=
X-Received: by 2002:a17:90b:4f48:b0:281:3f1e:c26d with SMTP id
 pj8-20020a17090b4f4800b002813f1ec26dmr4382198pjb.45.1699608447569; Fri, 10
 Nov 2023 01:27:27 -0800 (PST)
MIME-Version: 1.0
References: <20231006143827.1293689-1-massimiliano.minella@gmail.com>
In-Reply-To: <20231006143827.1293689-1-massimiliano.minella@gmail.com>
From: Massimiliano Minella <massimiliano.minella@gmail.com>
Date: Fri, 10 Nov 2023 10:27:16 +0100
Message-ID: <CAGS_c3XdUekPJ6iEpRSEOTKCaFNnPqiF0KcXRbtD+PcaoZfwjA@mail.gmail.com>
Subject: Re: [PATCH] zstd: fix LICENSE statement
To: openembedded-core@lists.openembedded.org
Cc: Massimiliano Minella <massimiliano.minella@se.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 09:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190403

Gentle reminder.

Regards,
Massimiliano

