Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E40E936FB
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 10:59:28 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.9953.1696589967394893446
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 03:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JNdFZo5j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-323168869daso1908585f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 03:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696589966; x=1697194766; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VEnM4TDXTCawHy7gFtbmZ+Jg3okVKySQaiiz5lxyv/g=;
        b=JNdFZo5jB2OXbJznlBftu+N463MvPF1f9zbScqF/ImwKOJFSy4cSqFZY2NabUiOpdr
         2l9BV8dfIm7LwVY7CVDzXnyYbtrw2pyGKudEo2jjDVS7n/v+cN7gHyRVcOSXUERTKh2i
         +sXYPiiHXd1vsMmUzSgbMymY7GHYA8mVgNABY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696589966; x=1697194766;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VEnM4TDXTCawHy7gFtbmZ+Jg3okVKySQaiiz5lxyv/g=;
        b=Po+lGhI0isJofwOa4rL3tqSPsphY8DeFHBuhN0SMcFex26h+xvNE38rx7SSw3ti/3n
         gsedTcHmuayNIqMnCDZ/Mu+vVyFZjiRt/JqKPaJh4L0XzFM7JwH3zWyp/GZuscCXCi4+
         +rHXrAhhHiBzlhX4aaoqA0uiaX0x2gQLIeyyu3pz2AuvuJNgRTPQAsAt9+SbM4BVHyLI
         Pm9OcxoSQ21yGb/xUXEr1bz/WH7NpaU+aBkGe7zVb8zE7R/hcL8nipW1fZE/C6RXsUTS
         0hacc6NamaoWtCFMQxHE39d/nQe9BZEIMTtdU/UzlvKBj5ZAyW4FyrYHUMuUJ0IbSs6O
         43+Q==
X-Gm-Message-State: AOJu0YxuXATcY0aAUEcfDw8QelN5nJ4Ud5Ta99Kj1z68ELzqU/D/4TNY
	rnQKquq6K5h6LnepJR7mUzQQkQ==
X-Google-Smtp-Source: AGHT+IHPs1wfVRhjhEsVmdPtAbq6DA76G0YfNxmckfA1uzZmq7dO/5Elc6sGi0eB5BsC8hNcKJkLjg==
X-Received: by 2002:a5d:4149:0:b0:31f:eb8d:481f with SMTP id c9-20020a5d4149000000b0031feb8d481fmr7220943wrq.29.1696589965733;
        Fri, 06 Oct 2023 03:59:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2964:cec5:fab8:2212? ([2001:8b0:aba:5f3c:2964:cec5:fab8:2212])
        by smtp.gmail.com with ESMTPSA id l14-20020a5d480e000000b0031c5e9c2ed7sm1366222wrq.92.2023.10.06.03.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 03:59:25 -0700 (PDT)
Message-ID: <70686480d7fd09e2a6f78f99d2f15199892d0d8c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 0/5] Add bblock helper scripts
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Julien Stephan
	 <jstephan@baylibre.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 06 Oct 2023 11:59:24 +0100
In-Reply-To: <2023100610560712ef25f4@mail.local>
References: <20230925080452.803540-1-jstephan@baylibre.com>
	 <20230927101614dd0d974d@mail.local>
	 <CAEHHSvYxWAYjEXBxxyZ-Y4ra3hVPjGxD3+x0GPY_0YYANGxYOw@mail.gmail.com>
	 <6f9dd65547742d68a2e3210070ce7efea80343e9.camel@linuxfoundation.org>
	 <CAEHHSvYc-mDkfG0ok=thQ8OLcHae7M+rUNkMk7MKjiEd+S2GMA@mail.gmail.com>
	 <CANPvuR=nx1dQcshoXU6m6NATHsSvQmAYc9=WS8+qv5u_8OBTdw@mail.gmail.com>
	 <CAEHHSvbZUi4Awcv9+d3KkdbURD5DM6aGUOKa_F-7Le-PEoemRQ@mail.gmail.com>
	 <2023100610560712ef25f4@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 10:59:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188754

On Fri, 2023-10-06 at 12:56 +0200, Alexandre Belloni wrote:
> I started an oe-selftest that passed, I'm going to carry that in my
> branch to see whether there are other issues.

I've had a couple of runs in my branch and not seen any issue from that
as yet FWIW.

I am leaning towards merging this at this point.

Cheers,

Richard

