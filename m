Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BAACE8D7D
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 12:09:23 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.17971.1726747753406576374
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 05:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TrTMmeIR;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c245c62362so972378a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 05:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726747751; x=1727352551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xeTdQzhOUalRQQ8gjieGxphq0wiTg0z4q2cXcE010Go=;
        b=TrTMmeIRhoyH2kSr5bhYZojgmC7qRMRc84MGvXDeUGrWRXmrQrMK0axd2FkQiwd1EG
         vmaTdEoE8KX0rglYcqtuWlIL6MH/WYwcw1BWmRoL5jB9IBDM/4kaFWmpMvG0lah9oT2A
         KkRa2n+ljg+PbUHKlHY845Fvct34Pbv8HKVESFX4cOrjHi00bQWnvqF9DfGnAMy7if9r
         tfya+9tmp8Mle6uH88kgRHhuVlT+hlO9Ec9aJyONrMt6iEgW1s63zCC0mwYeqk1JoF9K
         u3yJ68GS82hPEawRC3bmeYcja6o71dEA+PSRJcn34+Jb/5fjUuuE9NJfNbiCB8qM5caf
         DFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726747751; x=1727352551;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xeTdQzhOUalRQQ8gjieGxphq0wiTg0z4q2cXcE010Go=;
        b=vPfE8LrI9H82xmmG0nwrZ+hRSs4u9q8+kaoV2kIuCVL2XTPe+yTsptnQNWxoDFTkB9
         TXxLZVSc/EAN6Prm1Jc02r/eFav9lc+b6CYx6rAk+0GXBiDL703Hj5x5jeRmI1u8U4+y
         XVxfJ4SHqppSjPEOn21Y+vihhIuO7lB4JkZtiggf8+21uRiRtQtiUMg/23zQEdswjjdk
         ZMZjsB96fPuRi47AlwdXnhSv1gGkDtFNqAhC1S7vv+x9I1V+pTRxcfcO45zRN7UXDImY
         jplfWy31YlKaOmiwrp0Abmy6Z/QQaRg/lzIqlX30Swtr5fhMPl7zsg7xBHuwbPt3b+rE
         r67g==
X-Gm-Message-State: AOJu0YwXl5VNOWTvs/Z+4MYFJlZCAkKxKPMUh4GfUleVE9ztRO5QFXnM
	0wxSTIvhj85Sf7K5Iik9FBVZ9kEAdF8907AXcqzcnverEwFWyY6mjT0qn8QEoBN11Q==
X-Google-Smtp-Source: AGHT+IECBa2zm/5StDKhNce8vz7WB3cSbC1VvyvfEpQpB/vn2KMMf5+r1qNWfnhdmnSmMK+8UYkO7Q==
X-Received: by 2002:a05:6402:51cd:b0:5c4:1d22:9fd0 with SMTP id 4fb4d7f45d1cf-5c41d22a03emr18793549a12.8.1726747751248;
        Thu, 19 Sep 2024 05:09:11 -0700 (PDT)
Received: from [10.135.2.39] ([83.68.141.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bc8952esm5944807a12.96.2024.09.19.05.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 05:09:10 -0700 (PDT)
Message-ID: <67e57e55a3535fd6771637fdb8b88c3e732bfedc.camel@gmail.com>
Subject: Re: SDK in scarthgap after package_manager: Change complementary
 package handling to not include soft dependencies
From: claus.stovgaard@gmail.com
To: oe-core <openembedded-core@lists.openembedded.org>, Ross Burton
	 <Ross.Burton@arm.com>
Cc: Andreas Helbech Kleist <andreaskleist@gmail.com>
Date: Thu, 19 Sep 2024 14:09:09 +0200
In-Reply-To: <CAHirDJ8tUihjou3-4qirjk1vGVTXVrRg+TjKxmu2qvOtj2EVwQ@mail.gmail.com>
References: 
	<CAHirDJ8tUihjou3-4qirjk1vGVTXVrRg+TjKxmu2qvOtj2EVwQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 12:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204680

Hi Ross.

As we talked about on oss / yocto dev day, I will just follow up on
this mail.

The thread is located at this link
https://lists.openembedded.org/g/openembedded-core/topic/108100662

And the patch causing the issue
https://lists.openembedded.org/g/openembedded-core/message/167303

The patch makes the NO_RECOMMENDATIONS void, as hard_depends_only is
True from the Install method.

So for rpm --setopt=install_weak_deps=False is always set and the same
for ipk / deb with --no-install-recommends.

We could revert the patch, and change the default
for NO_RECOMMENDATIONS. this end with the same default behavoier as
now, where recommendations is not installed in the sdk, but add an
option for overwriting the NO_RECOMMENDATIONS and get the Kirkstone
behavoier back.

Looking forward to your input

Regards
Claus


On Mon, 2024-08-26 at 10:37 +0200, Claus Stovgaard wrote:
> Hi folks.
> 
> I am working on upgrading a project from Kirkstone to Scarthgap, and
> hit a problem I would like to have your input on, regarding the
> change
> in Langdale to not include soft dependencies.
> 
> The background is that the project has 2 teams. An embedded group for
> handling yocto etc. and an application team using a SDK created by
> the
> embedded group to create applications.
> As the applications has dependency on libs and utilites from the
> yocto, and we need to give the application team a SDK so they can
> incorperate the change in dependency before creating an image for the
> target, we have used "dummy" packages.
> 
> This means that we has the DEPENDS located in a include file, and
> have
> two recipes including those
> * dummy-app.bb (used by the SDK, and is just an "empty" package with
> 1 txt file)
> * the_real_app.bb (used by the image for target)
> 
> Until know the SDK has included all the packages mentioned in the
> DEPENDS, but this is not the case anymore.
> In process_depchains - we have the pkg_adddeprrecs method updating
> the
> RRECOMMENDS with a filtered result from the DEPENDS.
> And RRECOMMENDS ends in the recommends for the rpm file - not
> installed in the SDK after we are not including the soft
> dependencies.
> 
> As I don't expect to be alone in needing to create a SDK for some
> applications, where the applications and the DEPENDS changes so you
> need to create the SDK with all the dependencies for this application
> without the application itself part of the sdk.
> What is the preferred way of doing it, now soft dependencies is
> removed?
> 
> A workaround might be to hack the RDEPENDS for the dev package in the
> dummy-app.bb - something like
> 
> RDEPENDS:${PN}-dev += "boost-dev cli11-dev ......"
> 
> But I don't really like it - as the DEPENDS does not really fit 1 to
> 1
> with this.
> 
> Any input on this.
> How do you designs SDK's for applications, where the applications
> itself is not part of the image. Do you manually add to the
> TOOLCHAIN_TARGET_TASK or similar?
> 
> Looking forward to your input
> 
> /Claus - A.K.A frosteyes on irc


