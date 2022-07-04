Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D988C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 13:28:51 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.72369.1656941327140819771
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 06:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TCGiskJ/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id b26so13539257wrc.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 06:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=8Dy+bGQWU+esLaTE6JjQP0+swlq39zA5QB4PIA7cWfI=;
        b=TCGiskJ/NmqOmd0L4v2zmrrOLNUtNonRObG0+j4Z+Ku6BFH7aBw2hzX4sAUjGH2qaW
         0AXjt0wEh9IonRAPDZcQCUJbSIF1sU4RfwRUkc+HC2HR0b4srtftnXY8vGZ5bLCOjrTG
         qZLdwxKwofqlaq8V4nfEKThXmyOV1eqFfLL90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=8Dy+bGQWU+esLaTE6JjQP0+swlq39zA5QB4PIA7cWfI=;
        b=3ULBOCZ0MTNmPCVX6yzXqAOK7euBwR+/lMg1rTtJN4e0vlQ6qvSyHI0dBI9pr9cj2c
         3JxZU6iF2rhKe+SoImz5Bh9Jph3tCBjc7THZUj91H7fDuWqbJCBKj/kNgNEjkQ1RiEt+
         T9X/eteU9UI6dwyUQvCIBsR4ifVkoPoI464fhEXUWtRiRpap4IKsW42zxkSpRfqNf6cc
         7iPLZD/tHGugeTgv4hbbdJgiFtiZ7M4rvCA65C7C7YzPZcsyoK95dQtH2Pp41tDY5gb7
         iLV63DcdD1otpzXgl6v2sN4BJZT893NkuG5oK5sDk+nQPvDWBz+sEe4vS7SrsPUQLH4V
         P/jQ==
X-Gm-Message-State: AJIora+Y2CyS0jyIuHLYvDcOm90O2+PYNv8MvVtBePNqwNtnhnussY5O
	YfdEspD4eI8H/l6cMxEK3/Q88Q==
X-Google-Smtp-Source: 
 AGRyM1seBfSZjeVOYYuaugMFBtXnZpasL5awmaRAjCG4t94gmVN99TlGjlCaoP5U+54ICQWr3aB7ew==
X-Received: by 2002:a5d:4e49:0:b0:21d:6e8a:fa3 with SMTP id
 r9-20020a5d4e49000000b0021d6e8a0fa3mr988740wrt.528.1656941325469;
        Mon, 04 Jul 2022 06:28:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fa18:c075:6c8f:aaa2?
 ([2001:8b0:aba:5f3c:fa18:c075:6c8f:aaa2])
        by smtp.gmail.com with ESMTPSA id
 v3-20020a5d59c3000000b00210bac248c8sm12604224wry.11.2022.07.04.06.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 06:28:45 -0700 (PDT)
Message-ID: 
 <e312ffbe039fac9ee1f25c8b55faad867c24d40f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [kirkstone] Binutils, Glibc: Updated with latest
 commits
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, shivams@gmail.com
Date: Mon, 04 Jul 2022 14:28:44 +0100
In-Reply-To: <20220704071728.3400475-1-pgowda.cve@gmail.com>
References: <20220704071728.3400475-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 13:28:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167608

On Mon, 2022-07-04 at 12:47 +0530, Pgowda wrote:
> Below commits are on Binutils-2.38 and Glibc-2.35 development branches ar=
e updated.

This needs to be two separate commits, one for binutils and one for
glibc. The word "stable" also needs to be in the commit shortlog to
make it clear this is moving along the stable branch for these
releases!

Cheers,

Richard

