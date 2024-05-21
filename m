Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E763C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 10:17:14 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.16272.1716286632162744250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 03:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GGLVY6Kq;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-523b20e2615so6065469e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 03:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716286630; x=1716891430; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rvIGUUH5g20luD+Yl/rjWWU8JaJ0wXRiE5Aa5Uqb/r4=;
        b=GGLVY6Kqdqy2l6EGVotLGpCdlxqwZP+vyoz6pilY2fDGM8xpFGULUhFDMS5+EOrW6D
         Y9gG3pGaLjX0dMyXuHtdO3wjBsYN2rM3RCumqcID+eAGHKWoeSxwR5dC4zWWi05pS2x/
         JNvBnMGjnxrKprXe+8554u3xeq9Y44BvZ5tFiocXJekJzriENZBLAD3m5GR8vV1OTsyi
         ZW+mGkhv7zzBc8C9iyRB7TLKgenCcxgz3ILr8YjMo6PoULNZTYj07ceiEgTaWRYdJRX4
         cCdDA8m7Z5w71GCCOslg3Rl38KLLKof30e1WLarQ1NkNuRtr133DltyQT04osyHsgPNV
         W6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716286630; x=1716891430;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvIGUUH5g20luD+Yl/rjWWU8JaJ0wXRiE5Aa5Uqb/r4=;
        b=c3htzhvHNSJdejmA7Z5O9J74nJ/pWrrMiaB9YHIIAPFB+K33Il2Oq6S1M61WzgWKuB
         Yg9/IQlDYC6i9ccE/CKqYKbnDszAtT+qJxTRNMrkAoguQBmTXMeoLugsy54gniDxeQFQ
         sVoylclESI0II8evhheL1LSoS/8nfwhlJM3cuFRBRi1A9DB/t2cTriQ59U7mnCzNqvUj
         K2Zq108RtyDkWuwMjHvKL+AFOyUHP1D0764mf3kruhk+jx93s99NvaI9mBpmhBWF0drR
         VtxkJaBgEQG7PqeUWflBY9Xnf3sDB2sbl0uCAGeiuPfoShEFkRzIXdp4xfuWWanyAgkt
         Rs3w==
X-Gm-Message-State: AOJu0Yz84SM/FOicrxtgrmR/7+9XHdpmSGplaRUYt3BIZncy2vsXJX5c
	cRg6heJrTPQDxfYhMqZXhHetAv/D1sNkQRM8llD1rcA/QBQKTrL42L/GL7iX+eK/7XF5UT/q2nY
	jePj0nrDaEnExS6nsafJ9HYiF4F8d+A==
X-Google-Smtp-Source: AGHT+IGiCiiQ+GwCC0vWPnrAYrJHRbrsIddPKnuNULB4EY7s0A3e6oNwqpb4TLty0BkvlaZLAZa7hryyVhYh7KJqkYA=
X-Received: by 2002:a05:6512:7b:b0:51f:463c:c577 with SMTP id
 2adb3069b0e04-5220fa718cdmr20205338e87.4.1716286630117; Tue, 21 May 2024
 03:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240518212954.788524-1-peter.marko@siemens.com>
In-Reply-To: <20240518212954.788524-1-peter.marko@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 May 2024 12:16:58 +0200
Message-ID: <CANNYZj9H16P4fPcphNiXV_8Wx3eapUeCQu+f5uL+4HGKRGrzBw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] ncurses: switch to new mirror
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 10:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199609

On Sat, 18 May 2024 at 23:30, Peter Marko via lists.openembedded.org
<peter.marko=siemens.com@lists.openembedded.org> wrote:
>  # Upstream has useful patches at times at ftp://invisible-island.net/ncurses/
> -SRC_URI = "git://github.com/mirror/ncurses.git;protocol=https;branch=master"
> +SRC_URI = "git://github.com/ThomasDickey/ncurses-snapshots.git;protocol=https;branch=master"

After the xz backdoor I'm nervous about switching upstream sources
with no verification of their authenticity. Is this referenced
anywhere from ncurses homepage or ncurses tarball download? Should we
take that tarball rather?

Alex

