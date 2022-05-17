Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B440C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 11:57:22 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.6171.1652788636830638786
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 04:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MSpzbXjG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id g17so6273509wrb.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 04:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=v/zhIhcedITSPS3ZsVJlRxlq0qHqtic61qMZfjz4cB8=;
        b=MSpzbXjG7LWpOBnzlN2Ai9dGxHj9w01cZSvncWS3+Oi2Wrzoi9BYCjyakVVwwMvdLn
         mY+jAum4TBO9F1HDJDwTbY5zg2zuhMdd4PWBznt5wYIFLmCbZTOHi8RWfbjG72K9HyZT
         o73fk7B70Mn2EWIhXWuNnKJIXxampaMjU11D8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=v/zhIhcedITSPS3ZsVJlRxlq0qHqtic61qMZfjz4cB8=;
        b=3ZAnYWbkhY2pCs64nZRA1+Ms5lmdRLkmWcMZRPCaOO7ZmJdIOP1OaFxGU68rXi3+Jn
         PGSuHmEoV3OYHwcZPN3XKXgEf3XgXiaYE7uwph+WROqII3dMGOPvH0T14dDY+uXIaUDf
         tjf9QlJ20R4SavNQE7l5k3qtLxSAlgIoXFC56eRpE8nXeXdw6kD5cDzLyKqFIUTeA7QD
         P1hLzdCel8dXX2duwjSObRCgdR/lS2P5cqPB+AUBt6DDYpsuVMgH+9JObkXmMlohbwKu
         DpEqxFVKP9ScLIXWPIg44wAh7JjqntLeF9qSLbRmLhWh2lPiCy/YHOLKzjd8/epMDM8a
         tllg==
X-Gm-Message-State: AOAM531mN2C3UcT7/aLZxmRj3lSiQ6eG3LQ8bjfUQFj7XgjVFbpfrimG
	LHIsWK7NLXyp0gzFr2h/5NL4Qg==
X-Google-Smtp-Source: 
 ABdhPJzeO/QkAL/9tYOj4BIVTO2OtlaoZHIOva3RrPyN8VfDMndZS5jQBR6t/fmocRun5ioJNQ+how==
X-Received: by 2002:a5d:5952:0:b0:20d:9f7:ff5b with SMTP id
 e18-20020a5d5952000000b0020d09f7ff5bmr7526597wri.11.1652788635104;
        Tue, 17 May 2022 04:57:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3c0b:65b:e679:a594?
 ([2001:8b0:aba:5f3c:3c0b:65b:e679:a594])
        by smtp.gmail.com with ESMTPSA id
 d9-20020adfc089000000b0020cf071a168sm11540582wrf.29.2022.05.17.04.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 04:57:14 -0700 (PDT)
Message-ID: 
 <3360807bec6071b77bba9c3fff23e55bb5bbb9e3.camel@linuxfoundation.org>
Subject: Re: [OE-Core][dunfell][PATCH] git: Use CVE_CHECK_WHITELIST instead
 of CVE_CHECK_IGNORE
From: richard.purdie@linuxfoundation.org
To: Mikko Rapeli <mikko.rapeli@bmw.de>, ranjitsinhrathod1991@gmail.com
Cc: openembedded-core@lists.openembedded.org, Steve Sakoman
 <sakoman@gmail.com>
Date: Tue, 17 May 2022 12:57:12 +0100
In-Reply-To: <YoOJ9E7KS3A2O1NY@korppu>
References: <20220517111500.735-1-ranjitsinhrathod1991@gmail.com>
	 <YoOJ9E7KS3A2O1NY@korppu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 11:57:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165731

On Tue, 2022-05-17 at 11:41 +0000, Mikko Rapeli wrote:
> Hi,
>=20
> On Tue, May 17, 2022 at 04:45:00PM +0530, Ranjitsinh Rathod wrote:
> > Use CVE_CHECK_WHITELIST as CVE_CHECK_IGNORE is not valid on dunfell
> > branch
>=20
> Good finding, thanks. I think it makes sence to support both CVE_CHECK_WH=
ITELIST
> and CVE_CHECK_IGNORE variables in dunfell as patches will be cherry-picke=
d and
> this issue may creep in again silently.
>=20
> Other opinions?

I wondered if we backport the BB_RENAMED_VARIABLES functionality to
older bitbakes but use it differently - have it error if the new names
are detected?

That way we solve this for the other variable names too.

Steve: Any thoughts?

Cheers,

Richard

