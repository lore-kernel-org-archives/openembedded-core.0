Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226D7C19F2D
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 07:59:48 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.4016.1660204784370118552
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 00:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MJj7D1LV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id z17so20403495wrq.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 00:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=OQz4u/LeY5wZ6FoOFiDATsSVZti15ESrgDZCehhggx8=;
        b=MJj7D1LVSZeQCvwSs/72XmFXg9lsYqpZPR1upXrAEj2j6fwdd2toNbSC/FqubsI+3Z
         8fZVVlEgjn8MVpsov5B5jKM+NOK3mqz5ANulW/ECh8bU+xEakE0olnFZ4qwh/q01e7LF
         ThiYDlzTp8n3EXJEbPxacGjFOD0FsXA4wJGt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=OQz4u/LeY5wZ6FoOFiDATsSVZti15ESrgDZCehhggx8=;
        b=3JNf6VgvH/BaMFTaqOowb0Jld5nKsOw4ZRXMEM88vnjUSvIBb8Q9QrgrbLZ5drBwKV
         5l3hjBBM6Q82i/obFj1QPjQNpH66ewvnWR6fOUhKP2CFBDUOnjpix7K6Jswcotjl3blN
         hSAgpPyj/j7MH8BBSZD054c4ISPiirjlSSGoJVv50uBp7X+dgy3pS/PgzrYbSDwhPYP+
         naidxtWkKcdFHq83fwhM28vgtbPc+1+QODMnODiIaklk458lRzbRpSe/E3rH97bL+8lR
         VDxHzlSObOT1JLHkRE3flQI99EDKq0DpQw3+WQi2C0vTx0FCTLqYgur6dMqZzGrmNgJL
         qODA==
X-Gm-Message-State: ACgBeo1PgjHHPXB+fb3C8bSURs59fYLbXFjiYPSVHsgvOhiTcbfJLrIP
	WxP0lxgEySEXocI4/fo6iin2KQ==
X-Google-Smtp-Source: 
 AA6agR68DottcUfjqoVR59EaTA3lm8MprxxrvdfZw3SWDeyQ9w/M97Iyt2AZEdjNY0RtUbLtZawWXg==
X-Received: by 2002:a05:6000:1861:b0:220:68e0:ac7e with SMTP id
 d1-20020a056000186100b0022068e0ac7emr20131202wri.376.1660204782645;
        Thu, 11 Aug 2022 00:59:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:95c7:ec9:dfa1:7b7?
 ([2001:8b0:aba:5f3c:95c7:ec9:dfa1:7b7])
        by smtp.gmail.com with ESMTPSA id
 m8-20020a5d56c8000000b00222d4dfcdffsm8558745wrw.87.2022.08.11.00.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 00:59:42 -0700 (PDT)
Message-ID: 
 <0d93685bfa828dc7a7bb268ca94e240577bcc9e1.camel@linuxfoundation.org>
Subject: Re: [PATCH 5/5] lib: Add copyright statements to files without one
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2022 08:59:41 +0100
In-Reply-To: <f0b888c9-c467-fae2-5c96-5e01e302a0c6@pbarker.dev>
References: <20220810194510.484900-1-richard.purdie@linuxfoundation.org>
	 <20220810194510.484900-5-richard.purdie@linuxfoundation.org>
	 <f0b888c9-c467-fae2-5c96-5e01e302a0c6@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 07:59:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169234

On Thu, 2022-08-11 at 08:57 +0100, Paul Barker wrote:
> On 10/08/2022 20:45, Richard Purdie wrote:
> > diff --git a/meta/lib/oeqa/runtime/cases/rtc.py b/meta/lib/oeqa/runtime=
/cases/rtc.py
> > index c4e66813249..223cf7b95d9 100644
> > --- a/meta/lib/oeqa/runtime/cases/rtc.py
> > +++ b/meta/lib/oeqa/runtime/cases/rtc.py
> > @@ -1,3 +1,8 @@
> > +\#
>=20
> Looks like an extra '\' has slipped in here.

Thanks, well spotted! I've fixed in the branch.

Cheers,

Richard

