Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8A7C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 08:47:53 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.2342.1676364465154575017
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 00:47:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QF7Q7bNA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id co8so11064101wrb.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 00:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ho6lBx7ohrFrJFBR+Yi9ZDIntRWP3ZmVavC3JboiE4U=;
        b=QF7Q7bNArSIEM93Nj5H4GtQYnZKh0XmdZmzxIk5PabKYT38zwUoil680wDLbs65sXP
         kncgaEkn/9MWEJeAfOk3hKK6rH7Oni3c3FnXB7T8Ifh1NqnyU5hD81EYgMvmUWOOrwUx
         cbxKJPMLXwZqiQ8+nkN7OTsBvD1kVymQs/fgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ho6lBx7ohrFrJFBR+Yi9ZDIntRWP3ZmVavC3JboiE4U=;
        b=EEqCfjPl9VTKwo2dP8y1+RA4/09U+Jir/ZclnaumMA7pnR+e3k7p1eZzoQpO4KsLZi
         bJlVCIqQX1QhEqRx7yidDmf0k8WFble4zmW6KV8voLsEEmnyLNnFQMPdvw5cRfpc0Wdn
         jbTmfAFvlmcNtvDelxIQfZ06ZbE4PF8+NlZnzeMM8aMwEVjhmgv2qV2TmjptWCfU9hGj
         DPKUObf9rA01E+PTr03TegjQ6vxv6QgMiLQUtfqX/jxiBBYSNy15YAEEIKVQu61/vJln
         JZb2FnyQ+/eUe339KYxJhYVIkmyWp3TobTtgsrpbEeyGBw5u3K58RflGPGWFFnt4GaG5
         GguA==
X-Gm-Message-State: AO0yUKWlP+VSg3Is5Sie340JkNIwX7zuFCPgRSEDwerBfiZekPs83U7L
	I/TwxKHr7FrqUIFpAY1W677/1X95k9EoAOJV
X-Google-Smtp-Source: AK7set+9iXg0t+GvMuBtITbRdjzF/JMNoxUOxXEIai5j899fBepi+O30EzBJb5cWSuTKSdG6tM0/6g==
X-Received: by 2002:a05:6000:1109:b0:2c5:5936:16e0 with SMTP id z9-20020a056000110900b002c5593616e0mr1453933wrw.52.1676364463690;
        Tue, 14 Feb 2023 00:47:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:22a9:5449:456e:31b7? ([2001:8b0:aba:5f3c:22a9:5449:456e:31b7])
        by smtp.gmail.com with ESMTPSA id o7-20020a056000010700b002c559def236sm3832429wrx.57.2023.02.14.00.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:47:43 -0800 (PST)
Message-ID: <ff0ea75fcce5de13f380fb9fa3abaa80d1cb2506.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] rootfs.py: Set PACKAGE_FEED_ARCHS when it
 is not defined
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2023 08:47:42 +0000
In-Reply-To: <6d40f0d943ede3088c8a3f77ef2ee1b7442ddda3.1676363203.git.liezhi.yang@windriver.com>
References: <cover.1676363203.git.liezhi.yang@windriver.com>
	 <6d40f0d943ede3088c8a3f77ef2ee1b7442ddda3.1676363203.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 08:47:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177131

On Tue, 2023-02-14 at 00:28 -0800, Robert Yang wrote:
> The PACKAGE_FEED_ARCHS is highly related to ALL_MULTILIB_PACKAGE_ARCHS, s=
et it
> automatically is better than manually, for example, we may forget to upgr=
ade
> PACKAGE_FEED_ARCHS when ALL_MULTILIB_PACKAGE_ARCHS is changed if set it
> manually.
>=20
> The workflow is:
> Use PACKAGE_FEED_ARCHS if it is defined, if not, check DEPLOY_DIR_XXX/<ar=
ch>, add
> <arch> to PACKAGE_FEED_ARCHS if it exists.

This says what the code does, which I can see from the patch. What this
doesn't say is *why*.=20

What issue is this change needed for? When would we currently need to
set these things manually?

The multilib variables are not really meant to be used in generic code
and the multilib classes are meant to to be getting in the way like
this. Does this mean multilib is not setting up something correctly?

Cheers,

Richard

