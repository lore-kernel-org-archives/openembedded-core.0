Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFABEC87FCB
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 17:10:20 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.27963.1754673013445855258
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 10:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oj5zdKVE;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-709233a8609so24232626d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 10:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754673012; x=1755277812; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qx25E6yeDUZ9B9JjqcngZZMmjtzn0lqR4CuO0Xasg5Q=;
        b=Oj5zdKVEIW/xO2glh4G5KT1nDM7kR//D1V5KZ4EKx83bmVJBVlKFWyN2ve/1MgAM3Y
         ncWGJKRK7YLxjlHhnKIw1XrWDzJlWmNtEca1WXkRuATtihHGGWPCrTWa0wtBRmIW1HWw
         KP4k6/um72fYjasCRu3Ocb0B05N0xNVnuERMFhkdnuK4kXLCxQH2uVEQyjk0eqrF02mO
         VvywxHVoJh6AZMLFBi0xeuWBr82fqaYHDFE74CuyOD9pqQFSaqoggysOswi/ttsEF5yB
         LDqJGHk6Qbsh/0exeP7BNWPXszD9g/IKGwI6Rjo65P6zQGBb/VsZ3g+cGjuZoxwbGEdZ
         QpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754673012; x=1755277812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qx25E6yeDUZ9B9JjqcngZZMmjtzn0lqR4CuO0Xasg5Q=;
        b=NtXmoP0PPTwF9txLxllSe143MR6SZM4A+c3V5Zprd95VG++ETQUR+afQrVXD0/AnE0
         96XWOY5aJny+uqnYKgcGL5IQ5R654P6HHZKKEZ6QXpXImS43fIoRzDMhnJCmwPtCBhnd
         WQLsQuxe+lQQgxIwkxpR+tnTXiDgHgKKhON1a/7TFF96IsHJ1RY8ARIUSlO71aGtWsGb
         jGzoTKBHoGgM015wv0BaXLH1MjSqThEhxiXnPrLeBrTLlv5BE7NIx9Sb+tuTg+n9zqut
         hVo+c3TVXod+iY5cW4jMXcF9WYO2MsnliVyn6QigV4juGPPWWLrO+1Y78slgvxmN5fvU
         UHDA==
X-Gm-Message-State: AOJu0YyylYtYH546nv7YKGa4a3ISblNR+Y8rLTRZAJC1HjC9OOCmRtCj
	LtgTHgZi6K/8DD6VBzbSyNo7BkD3PzKBpRuKuN9JbjoGevntxQt8CnCaY5HtbPa1tpInV9rMgKB
	Ta9awrjXgdjeq1h7ZvqwO7qdM1FePA6oLfw==
X-Gm-Gg: ASbGnct6Lhv0I4kqJw+Rj939k20NCR62sDAxHUytZtVksM3sj3SC0tixwSeB+M+K467
	aIpNx8+k8XG7fJwRwWoHY8R30v1eDYqgyDhND2pNI2vG4JZEudt0E6i/geHuSiH9VI5ktfhD4Vb
	z1AA9+R90rtZRpdjp6bEiqzAnO1wl4HugsSX4ZVBCOXnB6h41XfC9P5oX5zeYZn5Djq2XO+IhWo
	q4zNlNpFL8+jYlpQRMFdGwzZyF7oR/tlvjdV+NY5A==
X-Google-Smtp-Source: AGHT+IFQeMTEUbA6KKTCJTfb4Yk/ELr+o+aN64Fiw9B7JgLcx3KFbnp5yjLJn6Gw6ai7cKO29eEZtXJ7jcFbNUyGcV0=
X-Received: by 2002:a05:6214:29cb:b0:705:538:65ab with SMTP id
 6a1803df08f44-7099a32b494mr65124456d6.39.1754673012091; Fri, 08 Aug 2025
 10:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250808161533.13752-1-osama.abdelkader@gmail.com>
In-Reply-To: <20250808161533.13752-1-osama.abdelkader@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 Aug 2025 19:10:00 +0200
X-Gm-Features: Ac12FXz1-N7Rr-SlIFsW8Oj3C_BENVojGIkDQHHhSd2EHDAr4rr7ZNqkP9i8gro
Message-ID: <CANNYZj8_EA6U=o8fR98TA6upx9AzmSh+bf11bKfAuXJhY2G9xQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go-cross-canadian: fix binaries install and GOARCH
To: osama.abdelkader@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 17:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221663

On Fri, 8 Aug 2025 at 18:16, Osama Abdelkader via
lists.openembedded.org
<osama.abdelkader=gmail.com@lists.openembedded.org> wrote:
>
> Canadian cross builds produce host-side binaries (x86_64), but
> GOARCH=arm was leaking in from go-${PV}.inc/go-common.inc, causing
> arch mismatch and package QA errors. Explicitly set GOARCH = "${HOST_GOARCH}" to
> ensure the correct host architecture is used.
> +GOARCH = "${HOST_GOARCH}"

This looks like it is set to the build host architecture, you probably
need to set this to the architecture of the SDK?

Basically, if your machine is x86_64, set SDKMACHINE to arm64 and
target MACHINE to qemuriscv64. Then everything should still work
correctly.

Alex

