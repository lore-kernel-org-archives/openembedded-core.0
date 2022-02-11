Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDAAC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 13:13:15 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.7008.1644585194620449545
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 05:13:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XqExMSGl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id i14so15142248wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 05:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=OxUz2HUxmvF+pmuytE35mAm6vYfpmjUB5BgRb0msS48=;
        b=XqExMSGltmrOM0zARWhu0AfuoX84JmnqQoDKxq5ugxZIfibKCZnfnkP+tS0v1XtSYy
         guyjRlOdGZ/jz/BigmUHYxQgpTPrsdkn9H4Kf2qMe/w2H8ykF87JQlbMzCFHO9XwO0jF
         oMwwGMC4ifu4mClQN4wq6Om1G/FItMP9DpbL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OxUz2HUxmvF+pmuytE35mAm6vYfpmjUB5BgRb0msS48=;
        b=lPZW1YdMKk6BnpUbaSqWtlXZz+odTeiU7gmuoO6nywqJp73O0hnPZOvpJ27FEzZ6w/
         7jniEDZPCm6mn9rhcQDm5smtjrk+vaSg73UE51IDyTJvkVGCqLDqAtuk5vlqEeEshNSd
         NeHDfTXh9e35JhIwW5FJG9Hbakq8m9LtyOozBPMZ6RUr3PNeeXpQ1MF1MJ2fMQZeD2k3
         WHXHayn5GLYaBV3RZ5JT0i+w7fiwecr2QnwEy6iVD4vvY5YAUg7JXKtkHXIA32WrgURp
         TWhhguIS8sRNZAry4Jrj+Uz1j0vx8Oi1Jg2FzNgIrKkx8pAiOBcHrmj7T5kF2UC4cEeQ
         7mjw==
X-Gm-Message-State: AOAM530ub5BX50+SzJ1WUNWAD12joxFoAkrmjTPpLeezvQ5OAtUsWdt+
	y40XqsBd5AxaDm6fEkD/KPsHlg==
X-Google-Smtp-Source: 
 ABdhPJzWisC/RgWFXVXphiOeXAUlsm4mvCxO8KKSZIseAP6YsZSFU6rCo2x5C13Nxp6pIzAnl2/jXQ==
X-Received: by 2002:adf:e94c:: with SMTP id m12mr1331748wrn.383.1644585192943;
        Fri, 11 Feb 2022 05:13:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e5fe:2e7c:731b:5924?
 ([2001:8b0:aba:5f3c:e5fe:2e7c:731b:5924])
        by smtp.gmail.com with ESMTPSA id
 j35sm3852752wms.32.2022.02.11.05.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 05:13:12 -0800 (PST)
Message-ID: 
 <dd3a42b2c021e8c4813572956a753ce2a6708e95.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sanity.class: Add possibility to configure
 networking check
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, Ross Burton <ross@burtonini.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 11 Feb 2022 13:13:08 +0000
In-Reply-To: <b8ff8c70-ddcd-5a31-ce40-53fe2f43d2b1@gmail.com>
References: <20220211084433.10614-1-pavel@zhukoff.net>
	 <CAAnfSTsvaGZ2khtFLNdkqbMRK_Yx_CmOLtSj_Jt4PSJZOb970g@mail.gmail.com>
	 <be3113b8-81a1-ca3a-32d2-4fa6783bfec2@gmail.com>
	 <CAAnfSTt==tDAVW7DaGKKDwwJvwGbTQPw26-Oc2dDpeQf263Wsw@mail.gmail.com>
	 <b8ff8c70-ddcd-5a31-ce40-53fe2f43d2b1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 13:13:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161649

On Fri, 2022-02-11 at 13:08 +0100, Jacob Kroon wrote:
> On 2/11/22 12:39, Ross Burton wrote:
> > On Fri, 11 Feb 2022 at 11:23, Jacob Kroon <jacob.kroon@gmail.com> wrote:
> > > I vote for removing the check altogether.
> > > 
> > > As I understand it, the check was added in order to prevent
> > > hard-to-interpret error messages when network failed. I can live with that.
> > 
> > I think the check should remain, and example.com has served well for
> > some time now (since 2016 in
> > 423a2645377bff2cd7292e1dc9796eeb3595e937).
> > 
> > We moved to example.com to speed up the check: the old tests were for
> > two yoctoproject.org URLs and it downloads the entire page, so that
> > took time.
> > 
> > If we can get a minimal page added to yoctoproject.org that doesn't
> > involve hitting WordPress, then we can own the URL and have fast
> > responses.
> > 
> 
> I suppose if the intention is that the Yocto server will never ever be
> down, the check is ok. But if it is ever going to need to go down
> because of maintenance you will break bitbake builds for everyone in the
> world, right ? Then I don't think users will be happy, even though the
> downtime was planned and publicly announced on some website.

The reason we added this check in the first place was that people had
interesting corporate environments and would blame the project when it didn't
work. The check made sure we highlighted where the issue really was and in that
sense it was really useful to new users. It was all about the new user
experience. Experienced users can just disable it or reconfigure it very easily.

I think using yoctoproject.org would be ok, but as mentioned, we need a plain
page for this, reducing unneeded overhead is good. Let's see if we can sort
something out. The yocto project site is cloud hosted these days and should be
reliable with good uptime.

Cheers,

Richard




