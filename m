Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A94A2C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 17:13:56 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.376.1716484427303912553
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 10:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bvUi5v43;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a5d67064885so736498366b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 10:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716484426; x=1717089226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sRxqCX9Aj5ERPXLa2VMW8i9OJ0fKkRw1sTHT2b81f1E=;
        b=bvUi5v43TVIdmVUnopKeHRUVKcDXeaWIoUS8xQ1z5EMPmTxfphdvEy1Z0jt+QuGHr1
         SalT16W4+D0Z+liqOISOqWd/CldrnxyLYgxIV8iyzvhcOmv2jHpyQinCAZbu10L0LZT6
         YFIz5MNa4yXLCRs7DYGhTE+RwWgY300gp1xS1c6U34G81v0m4K6hgcF6NSu9nnUIvmJ1
         c7LxbHSpjW+SdrpTzg9JwvOT2aqEy4hggXhULCBamjHoYtP1N6GaE/0rNcTBcmJc2jqW
         2yQ80LRzax42oknN6xxK9pp15Y1/QH86BlXDTZCWsuV8SK6V1TCMJSj1xQ4I/nuHRFsh
         YSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716484426; x=1717089226;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sRxqCX9Aj5ERPXLa2VMW8i9OJ0fKkRw1sTHT2b81f1E=;
        b=DrkwZ8Al425J7MoeMuWzpQiFNbLbCfZo+J5K2TSKOnhdiQeuC54IwYXC4CDbFHW1Lw
         1OKCaSnG0e6UNrXNvbAuBAbrbsMIoSPKcXDzlxvShWy7WyxDoLuoLU26S4Q48rbRYd+C
         srtJirK4xQWsA/Y1luaPabdtLFhCkP2DkjCulz/inCXI6qVHgmHGVsYb4qn7lae3Dcz1
         yPo0kAQLIH5GmVvU+JDM+MBCt3JHOh0DNsqUD6BUNx5/3xCszCpqTczRhWjGeBmE8iCk
         HEa8BENSkYlFJnaKVSngvu+54qoCqs4ReDBJ8JMRdfeoznSvjn6CzjLAXr/D8kKiiWww
         aowA==
X-Gm-Message-State: AOJu0YxG0rhSjvWLu0oDY6ZpSWOZp7FkbCIKbdhXWuXbRrsvIvpN9tWP
	o4kuL7AnlyiME8UtXjRN7UbRmvynbXcYeuiaH3bG0pPNQCXLOHVM
X-Google-Smtp-Source: AGHT+IF1f7A3dd4ys4p7NQ0K7P9woGjCkBrWw3pSckrAuwvE4ed/LSg9HpyLmgYRP+ylqm/szjlxVQ==
X-Received: by 2002:a17:906:ad86:b0:a59:c0a6:25cd with SMTP id a640c23a62f3a-a62280b0a05mr524541266b.5.1716484425535;
        Thu, 23 May 2024 10:13:45 -0700 (PDT)
Received: from [192.168.0.7] ([194.191.226.159])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a5a179c7e02sm1963999866b.105.2024.05.23.10.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 10:13:45 -0700 (PDT)
Message-ID: <96674a6743679539da9ca805adaf66150540d92c.camel@gmail.com>
Subject: Re: [OE-core] About an issue of run-postinsts.service
From: Max <max.oss.09@gmail.com>
To: alex.kanavin@gmail.com, leimaohui@fujitsu.com
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, Max Krummenacher
	 <max.krummenacher@toradex.com>, stefan.agner@toradex.com
Date: Thu, 23 May 2024 19:13:44 +0200
In-Reply-To: <CANNYZj9UpUdJ2G5ng2Evipz4MeqbK_SuQuuQDpamnnuAxY8-Pw@mail.gmail.com>
References: 
	<TY3PR01MB1105631CC9A9A05E506C8D948A0F42@TY3PR01MB11056.jpnprd01.prod.outlook.com>
	 <CANNYZj9UpUdJ2G5ng2Evipz4MeqbK_SuQuuQDpamnnuAxY8-Pw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 17:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199813

Hi

Am Donnerstag, dem 23.05.2024 um 08:23 +0200 schrieb Alexander Kanavin via lists.openembedded.org:
> On Thu, 23 May 2024 at 05:00, leimaohui via lists.openembedded.org
> <leimaohui=fujitsu.com@lists.openembedded.org> wrote:
> 
> > And I tested by qemu and on PC, there is no issue that mentioned in the patch(fd266b1b66844d660ebd8e33fe22c08c8ddaccbf) which added "--no-reload " in run-postinsts.service.
> > So, can I submit a patch to delete the "--no-reload " from run-postinsts.service?
> 
> I think yes you should. The original change feels like a hack around
> bugs in systemd, those bugs may have been solved long time ago, and if
> they have not, we need a better way to handle this (that does not
> result in systemd warnings).
> 

We since removed any pkg_postinstall_ontarget from our images built with OE master.

I now build an image with a dummy postinstall added to see if the behavior can still be reproduced.
That simple test on an i.MX6 based SoM no longer shows the issue, so likely it was fixed in systemd
/ OE / wherever.

I'm fine with the change to remove "--no-reload " in the run-postinsts.service.

Thanks for pinging us Alex.

Regards
Max

> 
> Alex
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199778): https://lists.openembedded.org/g/openembedded-core/message/199778
> Mute This Topic: https://lists.openembedded.org/mt/106256417/3617484
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [max.oss.09@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


