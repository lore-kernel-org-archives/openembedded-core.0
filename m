Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2378E810D0
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 11:17:50 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.14985.1695813463511552139
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 04:17:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q1yLFM3f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-31f71b25a99so10692132f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 04:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695813462; x=1696418262; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jxMbRRsRioc15NNaAWXIYJaxEIgzqkN9YeFwv1E8iqk=;
        b=Q1yLFM3fTlvGwUO3JcM0yHbGdLU+oEKf7APpgcgoy3AEdIgcutDqJ/6bVRU3rMH0gT
         IrSmwdZwgxLOVLEiyRN0o1kei3NJdBuAnbAXQDt4zSmvjdmBAjmCYd4UHob/8pobXjgM
         5WrBONlEHtYfPdV+hK4S7G0JidlGD27fDicKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695813462; x=1696418262;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jxMbRRsRioc15NNaAWXIYJaxEIgzqkN9YeFwv1E8iqk=;
        b=SyxCTLZE/2FfPUncGdYTCERI3nARWJ8bGMeYiSa/6CwOknZi5wCnbRo2ADlJDw1FNF
         gwDBND4gkCk8RkpmyLIJMVtnj3SSAkk7qhmyOBX4RWQLk9RmsFBkINvd12BmIO961zVy
         Xum+3BJ1lDqSdu4+sra6vCpFq3c+8O1XevS5ohN1BrRJphCyebdfevlBEH+tq2F10jEF
         pahS7+8KbClZi/Q73ufdNXmMm9FSLVGOziG33/FxQ+cTvpRsosYb0RujLOxXnA+y3Frf
         3DF2t6f8MuEUoy+XEwsF+YteTpS/VqlR15GuYwqTbFIS7I0PPNtlSpA08IYQbyBzzz19
         B9uQ==
X-Gm-Message-State: AOJu0Yz4fTwP7UJcvYx08xu6Lv8nHHhxaR7aH+Y3Zd4yrsT83785XV6x
	RmxBEUsjIoXHBjh/4tndjINDyg==
X-Google-Smtp-Source: AGHT+IEMPaahxmt600HZjKwxbML/NaLgBJtGfJYAcEZdOqL6iax6Pbh3Ex950ZMk8abs/IeRqrVK6Q==
X-Received: by 2002:a5d:434c:0:b0:317:e515:d623 with SMTP id u12-20020a5d434c000000b00317e515d623mr1315876wrr.60.1695813461775;
        Wed, 27 Sep 2023 04:17:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ab67:eb18:db89:ef9a? ([2001:8b0:aba:5f3c:ab67:eb18:db89:ef9a])
        by smtp.gmail.com with ESMTPSA id r8-20020a5d4e48000000b00315af025098sm16727094wrt.46.2023.09.27.04.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 04:17:41 -0700 (PDT)
Message-ID: <172606da1e993e01dd23f3dd7490a13783390e64.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] gcc: depend on zstd
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sean Nyekjaer <sean@geanix.com>, openembedded-core@lists.openembedded.org
Cc: kasper@krinvent.dk
Date: Wed, 27 Sep 2023 12:17:40 +0100
In-Reply-To: <20230927104922.3734608-1-sean@geanix.com>
References: <20230927104922.3734608-1-sean@geanix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 11:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188307

On Wed, 2023-09-27 at 12:49 +0200, Sean Nyekjaer wrote:
> Add zstd LTO support for the nativesdk compiler.

This is changing it for the target compiler as well?=C2=A0

Perhaps also mention it brings it into sync with gcc-cross (assuming it
does?).

Cheers,

Richard


