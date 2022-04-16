Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F39C636F6
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:58 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.18596.1650116454335247584
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 06:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CBVBP9J7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 u17-20020a05600c211100b0038eaf4cdaaeso9210165wml.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 06:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=3y6Tyfqc8ljzmrT3gepCZOql0hcsPMim8GxI4WkkLh0=;
        b=CBVBP9J7oECXtNqOwZ/3cW2gOEqi5puo3PUef9x3hwtt1XwDX8kbbx+9sxSP0mexff
         eBKJHX0BpHHEd/xCALbH4Iabi47MCFxJui51kOIO5vREAQCWRNrNUGZkHIYo2BAF82hl
         4XnC15tXDrjkb1IQXE5SCH+ywH9ilGI6IlfcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3y6Tyfqc8ljzmrT3gepCZOql0hcsPMim8GxI4WkkLh0=;
        b=cQBSbceSe/51Q7O3uIv0jhsNRcts3dyxMVTW26oZGczZO3IHmfJYNZwTFh75DJ/Y81
         GNZzoJwK9FbgXKQLg/6J9t8HQ6b21b9VlRGLXdDwUD4fCsTNfoE2kixYfwy6GvGb9MhV
         IV1PvC0uKMvzELtmCtTp6YFaIxkedBjhCdg6vTKdWvjYDg6jfXXm7aSeG17wkWux2uvm
         ArFvuc3egqxBiOjrGWYcyIzCo25pdq7giAieALBEumKbdPIYsWoplVseqUyhsbOg2Rmm
         o/+JnPDxrxAFhYNAJNQ0ZPrcDyC5HTbvIKT8ONqE98PMBsmeBfi4wbTx95q8V8vBiLpO
         CS+w==
X-Gm-Message-State: AOAM532yFLcDOBDamDqtkynmKj3wwFr20L4dRMQx3X+z2UlAHCppFM0T
	Yay1xS14wLInfqqazmuplnHOHg==
X-Google-Smtp-Source: 
 ABdhPJzZ8cNQJRUL0/yBOY3xlFmF3lzJHurFFCYGqumh3cqa8O/t/BAvUMPPQU4D4HWvLfN6aec7qQ==
X-Received: by 2002:a7b:c844:0:b0:38e:7c92:a9e3 with SMTP id
 c4-20020a7bc844000000b0038e7c92a9e3mr3164672wml.140.1650116452865;
        Sat, 16 Apr 2022 06:40:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8fbd:73bd:4d53:ad68?
 ([2001:8b0:aba:5f3c:8fbd:73bd:4d53:ad68])
        by smtp.gmail.com with ESMTPSA id
 r4-20020a1c2b04000000b0038a0e15ee13sm11421747wmr.8.2022.04.16.06.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 06:40:52 -0700 (PDT)
Message-ID: 
 <867078ea62a17f5d45c231887bbca7d758d154d6.camel@linuxfoundation.org>
Subject: Re: [OE-core] Intermittent failure issue summary
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 16 Apr 2022 14:40:51 +0100
In-Reply-To: <df0adffa-18c4-fdf1-008b-6fd1a8d1265a@t-online.de>
References: 
	<d9926e6bc63272234f1e435d97af40888123e7d7.camel@linuxfoundation.org>
	 <df0adffa-18c4-fdf1-008b-6fd1a8d1265a@t-online.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164543

On Sat, 2022-04-16 at 15:31 +0200, Markus Volk wrote:
> the systemd issue could be this ?
> 
> https://github.com/systemd/systemd/pull/22552/commits/de90700f36f2126528f7ce92df0b5b5d5e277558
> 
> Am 16.04.22 um 12:26 schrieb Richard Purdie:
> > Systemd daemon-reload unit restart failures:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14787
> > AlexK has got part way in figuring out the circumstances of this, any systemd
> > experts able to spot what I think is a service file dependency issue?
> > 

Yes, that could well be it :)

Particularly when you read:

https://github.com/systemd/systemd/issues/15316

Alex: Any thoughts?

Cheers,

Richard


