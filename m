Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3846C433F5
	for <webhook@archiver.kernel.org>; Sun, 22 May 2022 12:12:47 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.15676.1653221563891783774
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 05:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hm+HQ6Vf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id r23so17295562wrr.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 05:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=RekymsrWsZqmv2DsYPDTS8l7i2PVvao07ynms9MlKF8=;
        b=hm+HQ6VfUzsRM+zele66ic+bg5UySMm00a8d8jZnTAmroWENLKuDWPNRKUB8qhmp0E
         9PRuKqz4LLxqGQF7ni/jkk6mkbo6r61AN/kIYqZHTBokB72nnVp7Q1UYa4NMzmE3d8z7
         eg3SD0HKnO8pP0CCWBjsfP6sVbj+rHiJFMa7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=RekymsrWsZqmv2DsYPDTS8l7i2PVvao07ynms9MlKF8=;
        b=2cM6aSH+JkMausjnm6T2aJLBV5W/eFugGXHqGtycUiQ84LE1FbL9qa8DgSAh5zlWU2
         afxTJl0LyUFnXBzXcl+rzyU5aydVVX8Aoj6pp5LW086Lad6HzB43M5vIrHRlu/l1BqwH
         EzHiTwk7iGqKgd7kpW4xqeP5s4abI3cQeyep8ovW4vokCiTCKVdwA7FKXVsAjTLP4gPh
         jWARWtak8IZocpDwUQjaPILFcvHk1gtnWd7pYiXN3Dbdcsp6P3CngasxBtk89WOWCOG6
         JuTLFQHOSXMMazSyNjV3w3qk+p0/mThj06Nb3fJ5riCJnecHVRxQGYcpr4o2oL138xp3
         Y4rQ==
X-Gm-Message-State: AOAM532bhmV3yqj1Yl00z1LqJXh1DOcO7hu6P2bmk9C9t0EuYNVmKvo2
	ADUuPKBKf97oUYnbW2papBGimg==
X-Google-Smtp-Source: 
 ABdhPJznpFSRE5uECxOoDrWD5skG7kFC3IjGqSN8LbUXqfatOW71/ctGWmsKLcImnp4p+KMACQw4mA==
X-Received: by 2002:a05:6000:144a:b0:20c:6b73:804 with SMTP id
 v10-20020a056000144a00b0020c6b730804mr15682974wrx.88.1653221562375;
        Sun, 22 May 2022 05:12:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a337:fcd8:5dd9:46df?
 ([2001:8b0:aba:5f3c:a337:fcd8:5dd9:46df])
        by smtp.gmail.com with ESMTPSA id
 v7-20020adfa1c7000000b0020e5a6753b2sm7533672wrv.2.2022.05.22.05.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 05:12:41 -0700 (PDT)
Message-ID: 
 <67fe6127ff98d96cfd225500535c88d2fe8e945b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][RFC PATCH 1/2] libdecor: initial add recipe
From: richard.purdie@linuxfoundation.org
To: Markus Volk <f_l_k@t-online.de>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 22 May 2022 13:12:35 +0100
In-Reply-To: <080bfcd8-afeb-39a6-6215-88ed6261cd8e@t-online.de>
References: <20220519064312.391164-1-f_l_k@t-online.de>
	 <20220519184315.1e91b017@melee>
	 <70887c7d-4063-93d5-025f-46c4a17e5940@t-online.de>
	 <31d4ac7f1c8db63e0bcc2028c787dc59e30a2781.camel@linuxfoundation.org>
	 <1286dfdb-a0ac-67a7-a026-f95da89c35da@t-online.de>
	 <f304f84a8bb4bd353898d54cf1378b5c0084498e.camel@linuxfoundation.org>
	 <080bfcd8-afeb-39a6-6215-88ed6261cd8e@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 May 2022 12:12:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165976

On Sun, 2022-05-22 at 12:22 +0200, Markus Volk wrote:
> Am 22.05.22 um 11:24 schrieb richard.purdie@linuxfoundation.org:
>=20
> > What kind of issues? :/
> During the build of a systemd-based image, eudev was added. Possibly I=
=20
> was to blame for this by my own changes ;)

Fair enough, I'm not aware of any issue like that in master and I'd
have hoped we'd have noticed.

>=20
> But after updating the master branch yesterday, I also got build aborts=
=20
> for some python modules. I didn't investigate this further, but switched=
=20
> to the kirkstone branch.

I'd be interested to know what kind of aborts as that shouldn't have
happened. I'd be interested to understand what broke as it shouldn't
have done and none of our testing has shown it.

Cheers,

Richard

