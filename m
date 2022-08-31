Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2B7ECAAD3
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 16:21:27 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.975.1661962881815026712
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 09:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B+7zlX7v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id c7so12296485wrp.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 09:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=lSIh+XVLJMsBRN3k33DQAy2JdnF+ON5TtarIplQB2dA=;
        b=B+7zlX7vtHuWVm7MgdyLtpu9CeVJootwTKDONpClYmRhBNgsIqWy+QD7G+wmcrfi+u
         DD7mJAKnK/KEbcwADscl+FSVchYh4MnOx4XIF/MX7/dtljG5q72DZ5kxlQ8p2gwt0gPg
         /1b+6dYtQpN1iD0ilSONFen+/cPamJo5yXy3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=lSIh+XVLJMsBRN3k33DQAy2JdnF+ON5TtarIplQB2dA=;
        b=Bc66KHtr4SjgB+J+qEpGPnn/DhjRSnL09ipIlw5AWG2bXdIfIMh+s65NmZZg98hVS8
         KG8G5jBnjEVTOfsQcnhGhbJhgq/a8liIY6R8DZQBJCbGBO8VCkUojz4xRih7EZcT+nDp
         ZFhJApFyYWuK5JnWmj8EkaJtY8pEGM6i2s7f/0aan2iRSByo0yR5RYqguHABV89Qa+7T
         MmSOh+PluY32UDtE8vmHG2RV1BtRwjrXLMhj/cIlA12/7VEnlptpMXUNUYN4VQn/4tMJ
         bHtvGCA6Jbvv+Brd69qpxGdX+kQb+nSeB0/Dl3yAGcOniT8WZ7yEYbDivW6x2bfxnfms
         sU6g==
X-Gm-Message-State: ACgBeo3Oj6bBHp03vDb3t3tyLtNq39fL3pNr/sjMTGd6Xd87uEOskOId
	iTNZRRcjLvZb6HezJudeB7nexA==
X-Google-Smtp-Source: 
 AA6agR45h2vZYH/TCf4zn4nKiqrIUNOMlTYGFvYm1WmsmsS6NIB72D0ERy+JZ9GNyrTVcd5jfluIcA==
X-Received: by 2002:a5d:6804:0:b0:225:8b07:ecdc with SMTP id
 w4-20020a5d6804000000b002258b07ecdcmr12251731wru.474.1661962880260;
        Wed, 31 Aug 2022 09:21:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e8fb:7413:92ab:6224?
 ([2001:8b0:aba:5f3c:e8fb:7413:92ab:6224])
        by smtp.gmail.com with ESMTPSA id
 i6-20020a1c3b06000000b003a4efb794d7sm2859155wma.36.2022.08.31.09.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 09:21:19 -0700 (PDT)
Message-ID: 
 <bf42031e0112176dc1efea54df994161f2e554b3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] vim: Upgrade 9.0.0242 -> 9.0.0341
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Aug 2022 17:21:18 +0100
In-Reply-To: 
 <CANNYZj8T_Cntva5-+YXX7Dzhf2YJNOyPkbbEYWWZAmHUm4g3xA@mail.gmail.com>
References: <20220831160712.189938-1-richard.purdie@linuxfoundation.org>
	 <CANNYZj8T_Cntva5-+YXX7Dzhf2YJNOyPkbbEYWWZAmHUm4g3xA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 16:21:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170136

On Wed, 2022-08-31 at 18:17 +0200, Alexander Kanavin wrote:
> I have to wonder, what is really going on there? :-) This never ending
> stream of CVEs makes vim formally the most insecure item in core. Does
> anyone know?

Personally I suspect some kind of bug bounty system may be influencing
things. I have wondered about removing vim from core.

Cheers,

Richard

