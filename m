Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B4EC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 14:37:51 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.9177.1651070266843526247
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 07:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DEPvsHgj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id k2so2803202wrd.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 07:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VuU0aSqJyxGd+MZZ4bdbPZvkvvL8/Pe12wE43tqoxJ4=;
        b=DEPvsHgjGrBMTPjl+Rf1feqblG0SvV8PGcNHmoBwDdlaDRwQ9xxD2BdhyoJp+MLBwI
         yv1XyfOAWT1P4jbqTQX9z0mVfilm+6EPvdreiJIMdjE3VgdwZjVBIkEL2n9rB2l8A4Cv
         ZQwbVEst78Tifuho1SNfMo4HDDGdVA7HwAqAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VuU0aSqJyxGd+MZZ4bdbPZvkvvL8/Pe12wE43tqoxJ4=;
        b=qfaNF3wpse1ahkDjRJ+EmyVHrkaKcfgSyTrPBYz79ggFx3M1XXtsjeQUH656a2tVrj
         EoCRaiBp8/bx0YO2INvmQ1HyN2+TPNiaYLALpZ+eKexRsXxozfa/QO5sUGFmvlzEpi5T
         9RosJ/shdAq7Ftn0grq5vGMuBsIa0pqx6198OqCj1TCMNpatlKrduK0OQcik5gC2mv8E
         LUK5KG/jTp3KjIBzIs7KmPSruXYH2CbA0FwHU8dzCq9HTMmaLVI2KoAdl1gv22uPGHKt
         YRKRWr89UQRj5GiVLEK0KW6Bv7ANFlln1GLpESfGZ4L79R+OWx2qxoEqhPU8LqFngb+F
         li9w==
X-Gm-Message-State: AOAM533puGJkejg06XAqGdiYv6U7TYSoYvSBvFPOeYMW5tFDvnJbGgm3
	AIx+GbDqxci3Qi2CXacrCbaOTg==
X-Google-Smtp-Source: 
 ABdhPJxRh2m9+UEJZlpeLR8wNHjbWflk10a5o6tDfbRzL97qv/N115LPSLKWnWzsDEutWaHxhObYng==
X-Received: by 2002:a5d:48c8:0:b0:207:afc8:13fa with SMTP id
 p8-20020a5d48c8000000b00207afc813famr22472915wrs.487.1651070265176;
        Wed, 27 Apr 2022 07:37:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aee4:ace8:5bdc:9ee3?
 ([2001:8b0:aba:5f3c:aee4:ace8:5bdc:9ee3])
        by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c3b8500b00393fb9923basm1760739wms.39.2022.04.27.07.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 07:37:44 -0700 (PDT)
Message-ID: 
 <d90f055950c3891d373d2fdec2358f902d4564de.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 13/18] valgrind: update 3.18.1 -> 3.19.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex@linutronix.de>
Date: Wed, 27 Apr 2022 15:37:41 +0100
In-Reply-To: 
 <CANNYZj9eUzy9-6wLZ3rLpr+cAno33VosPr6qVEBWHt9D8GGbcg@mail.gmail.com>
References: <20220427084009.3406717-1-alex@linutronix.de>
	 <20220427084009.3406717-13-alex@linutronix.de>
	 <bf10143cf121d1a2a8e88080107b482938657078.camel@linuxfoundation.org>
	 <CANNYZj9eUzy9-6wLZ3rLpr+cAno33VosPr6qVEBWHt9D8GGbcg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 14:37:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164925

On Wed, 2022-04-27 at 16:34 +0200, Alexander Kanavin wrote:
> On Wed, 27 Apr 2022 at 15:08, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Did that patch result in:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3176
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3176
> 
> A previous version of it, yes. I addressed the issues:
> 
> +           file://0001-Fix-drd-tests-shared_timed_mutex.cpp.patch \
> 
> +    # https://bugs.kde.org/show_bug.cgi?id=445743
> +    rm ${D}${PTEST_PATH}/drd/tests/pth_mutex_signal
> 

Great, thanks. I just wasn't 100% sure and I'm feeling a little paranoid! :)

Cheers,

Richard


