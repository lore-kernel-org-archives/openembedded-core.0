Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD95C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 15:11:50 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.13099.1721833902328779029
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 08:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Iy56/F1c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-427db004e36so37133775e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 08:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721833901; x=1722438701; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TglA4rXk8pNF3pR/0mBnm/IMe6bHZbIX7yZoDJcGFIc=;
        b=Iy56/F1cT0cMFfqBm7CBGp5PYk9hPzDlRFJW+G4YRdxpKZR3fSscEP+WYD3xBII9+O
         wzFKJW16/HrVCtfA2oCmUAhB9jEbo2XjvpaivIsCQcFGOC8Ti9zZuVrhHgckSLR1j+dX
         PTWSgReypUKKehtuflDqZEb+59SqZshGdEt2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721833901; x=1722438701;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TglA4rXk8pNF3pR/0mBnm/IMe6bHZbIX7yZoDJcGFIc=;
        b=j9Qr8M4zHS3N+JxHsMNkjOX74cA8LsXx4udCVzJB1u7EiRpw5uEOafbynxyzmDwA6Z
         z6rWHg9fK8+y5FVCL9Y546nB0IqPiof/1DlG882h9QVU8UlbjiA2yQtTJPmFzkDOJDa+
         1NVpGd73Dt2raUXDIgDKv2z5zgBzWoDV5GTfCJcSt/rGZBir9JdaQe+j8QjXCk7R/z6g
         Eeqvmgog1l1hzTtqq8SmqljDe1Y0bPTNJQ41Gx1xRiO7Kb+f/lQtVaFhnJL50uG5RKyM
         9eqCpFWfY0zhNTIJnBeZ0J9sdLHm9ZYHcybd3Ei+HPYHTczPJktI5Ujb25Z2SWy66n5A
         ScdQ==
X-Gm-Message-State: AOJu0Yy9Jl+Cj8C/MjYb0AFneGXwzbJohymfvNpa1j72oEQBLxjVyQPd
	5h+NvAfMMpQXQMVmScjkyzwD1Krojq4VesSHC8mef6hsw24WCKWivZTFVzuw6LI=
X-Google-Smtp-Source: AGHT+IHOyplVabYSn5W5JFVwPGxKVjKg0KbOf1k6t4j16ev0RPlQqRj7ZCKLHhZH7jZuBFqOHWc+Mg==
X-Received: by 2002:a05:600c:1f96:b0:426:5b3b:88b0 with SMTP id 5b1f17b1804b1-427f9555c6bmr18716075e9.14.1721833900739;
        Wed, 24 Jul 2024 08:11:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a74c:d12c:aa87:d7af? ([2001:8b0:aba:5f3c:a74c:d12c:aa87:d7af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427fb7bdfa0sm21466415e9.14.2024.07.24.08.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 08:11:40 -0700 (PDT)
Message-ID: <0900f2b2abc49295eec73e28077df4f53bb57c76.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v7 2/2] openssh: upgrade 9.7p1 -> 9.8p1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, Jose Quaresma
	 <jose.quaresma@foundries.io>
Date: Wed, 24 Jul 2024 16:11:39 +0100
In-Reply-To: <CANPvuRngsusxijoCZ9czY84KqDPEX6cSm8SZnho-zo-V5iX4bA@mail.gmail.com>
References: <20240718165448.1164-1-jose.quaresma@foundries.io>
	 <17E35D00CCAB404F.25516@lists.openembedded.org>
	 <CANPvuRngsusxijoCZ9czY84KqDPEX6cSm8SZnho-zo-V5iX4bA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 15:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202447

On Wed, 2024-07-24 at 15:19 +0100, Jose Quaresma via
lists.openembedded.org wrote:
> Gentle=C2=A0ping.

When in the branch, this this causes libssh2 ptest failures. I did try
just queuing patch 1/2 alone but that caused musl failures without 2/2.

Cheers,

Richard

