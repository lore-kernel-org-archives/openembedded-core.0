Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6DBC43334
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 09:12:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.5471.1657789927477150419
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 02:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MovV+cge;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 l22-20020a05600c4f1600b003a2e10c8cdeso3117588wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 02:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=/pVLh1bgUuxKkpO7q2giCzBfPae4SXd9hE5aBwALsNU=;
        b=MovV+cgeNS+zGM5lOH4Pq2ev0wEJaoPknO9IaVmM9I807ia/AhluGmG2gtEJfX6crE
         aig0Kk3sGSSWT2QAZm8A050yJbNVbxneiXwTs5dAn4K+7s6R/gZMcDkrPWcEQLMBU8Ie
         y41ASZ2DVc67lDDdGVVzeSOMebq/9AcfB2OsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=/pVLh1bgUuxKkpO7q2giCzBfPae4SXd9hE5aBwALsNU=;
        b=BJmT+9+hEKR52vxffrsNSZvi9X9gG7AlHuYslk1GHhZWQi7e5Wl1CEKj6xSMGnY4/c
         11EcuqfF/q6NgIY8tPDoi3uI2NfogwVeeWa1ixCLgx6SXWuk6GYs/CuKC54lYbLbQm96
         r1X8kHhrS3Cmgc/y12Vcu1MuUfvhFOtRlWsDWACgoFSh02hxjTwRwKiatEDrlBeeq1B5
         XxRiUtO8Zw/B0gyudazDqk4WiCxoI5mq2KQpXAOoOw8B94YDq8/8MO/1McMhCycpTvau
         23tyA1Itj2v2sgHEpRAGdALjH8uZ4/9niG+lpsw/no9Df7xe7PcJQfDcUvQbMMTqdBJ9
         1ZrQ==
X-Gm-Message-State: AJIora+Zf8Esi4W/bQTXMO2FcN5hcKQ4BRXs5QGLDb0KEGFofJHhXuo9
	XhmmWn38UcYfe/85Njn9kUNQHg==
X-Google-Smtp-Source: 
 AGRyM1vITmiyNRfVU2PSb7kpCaGudOw6uwprBR2QFRs5PUwUW+SAifHauxFYRW1VbNohuJa3KR1otg==
X-Received: by 2002:a05:600c:154c:b0:3a1:884e:72ac with SMTP id
 f12-20020a05600c154c00b003a1884e72acmr8518329wmg.23.1657789925491;
        Thu, 14 Jul 2022 02:12:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c037:3be3:5ea0:9a64?
 ([2001:8b0:aba:5f3c:c037:3be3:5ea0:9a64])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a05600c425500b003a2cf5eb900sm1144387wmm.40.2022.07.14.02.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 02:12:04 -0700 (PDT)
Message-ID: 
 <388284feddf07d7535beb381599ea1662864dec1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc : Bug-105039
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com
Date: Thu, 14 Jul 2022 10:12:04 +0100
In-Reply-To: <20220711142425.4152037-1-pgowda.cve@gmail.com>
References: <20220711142425.4152037-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 09:12:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168027

On Mon, 2022-07-11 at 19:54 +0530, Pgowda wrote:
> From: pgowda <pgowda.cve@gmail.com>
>=20
> Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git=
;h=3D9234cdca6ee88badfc00297e72f13dac4e540c79]
>=20
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-12.1.inc        |  1 +
>  .../gcc/gcc/0026-rust-recursion-limit.patch   | 92 +++++++++++++++++++
>  2 files changed, 93 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0026-rust-recursion-lim=
it.patch

The patch is fine but the commit message needs work. The shortlog
whitespace is wrong and it needs to say that 105039 is a gcc bug, that
it is related to the rust demangler. The commit log should really say
why we need this as well. The upstream status should be in the patch
itself (which it is), not in the commit log. The URL to the upsteam fix
is ok though.

Since we'd tested this, I fixed the commit log in this case so you can
have a look at what I merged as an example of how it should look.

Cheers,

Richard

