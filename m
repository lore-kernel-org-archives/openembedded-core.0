Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B282EB64DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:27:14 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.7516.1687181227272405126
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=IZJzU1ne;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3112d202363so1884984f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 06:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687181226; x=1689773226;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8Dz4JsdrbNVYIbupXnGUSaJvoDhDRmlwsb+3QuH0alk=;
        b=IZJzU1nenVmOUGmIg74j7p8O3mzHn/04tbdPRtSg5wD2sLL0xFKRpW1bf9yQnzf004
         zQqnmr3V5rscay+q6ScpwLbohGL/vPwBUNwnoMeK2Yk/TGXlIPuPL0Vz9wTbzHf/dK6B
         yvjRTQoKkISrwPPxB621Yp1AgkPTvEulATK0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687181226; x=1689773226;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Dz4JsdrbNVYIbupXnGUSaJvoDhDRmlwsb+3QuH0alk=;
        b=FR/0edQFHbgnIsrqM18IF8M9M4bIfnEb8GG82yhbhrUMdGNMjI++2FtVNhUsBc0jHU
         xg9K05WDNy60JrsbM56BUGydXSruHM65T6GaWrSByWiAKM270gdpWf5nwi7agmWEDEIH
         NyV6D7vMRb7JofX5pHCyNP9C+57jUNSIkHFYg9kt50o9QICFxm2wx6Bvu6Er4l9IGYC9
         TEyHAlL178lD/9uLSVwB9hhrMZJKC1qDz1wXrlCk6r4Y8pK0NY1AaXqWwxlr0KxWTSmR
         pR2QAreg0mHbySi0ba61gdZfLnQM4r4Hmo4CNNfOz1nypyaJvHX3y2zbz3+fo9c5+aRn
         YThA==
X-Gm-Message-State: AC+VfDww7NJf+K21/JX7Ijqyt3cBNgLfBsHwNMW2HU7eeRb4RYEx154p
	fZby/5fqSHyuwjy2+YLnB8apfQ==
X-Google-Smtp-Source: ACHHUZ56vK/bmd6e/RbNiW9kJ3JPid3+H4jyAObjaUrTO4kRC8fd67xDdPukojxtXeIAVE4P8sM4Ww==
X-Received: by 2002:adf:fe11:0:b0:30f:cc8f:e48c with SMTP id n17-20020adffe11000000b0030fcc8fe48cmr6830564wrr.25.1687181225706;
        Mon, 19 Jun 2023 06:27:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f105:ba55:87cc:dc34? ([2001:8b0:aba:5f3c:f105:ba55:87cc:dc34])
        by smtp.gmail.com with ESMTPSA id c3-20020adffb03000000b0030ab5ebefa8sm31331267wrr.46.2023.06.19.06.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:27:05 -0700 (PDT)
Message-ID: <acca71ff9f0c053f16c3b489557415b25659abcc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] base-passwd: fix patchreview warning
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2023 14:27:04 +0100
In-Reply-To: <CANNYZj85WkWiLNMjmGVijaNRXf3uzJRtS6Oi8rGi5QpX=yyZTQ@mail.gmail.com>
References: <20230618212617.232149-1-alexandre.belloni@bootlin.com>
	 <CANNYZj85WkWiLNMjmGVijaNRXf3uzJRtS6Oi8rGi5QpX=yyZTQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 13:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183108

On Mon, 2023-06-19 at 15:18 +0200, Alexander Kanavin wrote:
> Should the regex that finds these lines be fixed rather? It=E2=80=99s
> entirely valid to say =E2=80=98upstream status=E2=80=99 somewhere, it sho=
uld be
> matching =E2=80=98Upstream-Status:=E2=80=99 at the start of the line exac=
tly.

The check is deliberately doing fuzzy matching to spot "broken" lines.
Whether we need that any more now we have other checks for correct
lines is probably a better question...

Cheers,

Richard



