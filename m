Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E70BECAAA1
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 07:37:48 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.3896.1662104255582391855
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 00:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S3lhsC1I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id d5so745482wms.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 00:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=A5IgTkS3W3GTNLVglmLxLlZE+O0jAST3EcWEuMYbVVA=;
        b=S3lhsC1Ia1lg7T/wz6f/YR/c6HDZ2m2cXYky7Lm4Xjsx3fJM1xdt9hNhIr6vzKDLlG
         ncssLQGrQQYVnxwJD/RdYeJ6VKghEQhM1dsUsUeueJkY4BbXdjjlA6gfBqX1qbTjMtvw
         sXJx0JYIjm67Tk3D62CSfZOL426H0xjZWD7Sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=A5IgTkS3W3GTNLVglmLxLlZE+O0jAST3EcWEuMYbVVA=;
        b=CdJXX+VPCklaYw9XimWQHwT+ON8nKhGj+glX/C0HWFzCRjlttNtdXXHmX6jlPV1qB+
         VSPIS4kRtfhRHzdVnHgcZgKKtgrlRE/fEuVHWmE0tuh7YMZR7V2b7BDTqtEi/HawTWkS
         ThwdDLNOJh8UTMWunXODeCJOgZxowY0B07Cdpk6NazyzRNvRDJ4Anb30gxAq2Vgj5KEU
         rq0Hf7Fi4QZYkatdRy0mN+urwOtClNrcM/4lOphVv8hJFhAhr6infa5hl44Ygh+HLYlD
         SMTAurocc4RWrI3ThgbMgd0loAtat/6WeV6bxlaJgIH54tNzx4llZLh7PC20qeIYLTnW
         YnCQ==
X-Gm-Message-State: ACgBeo2q1HDpP2vcZNuY2qyStek1Ie0lxHMIzhPQPi+yNAV3Ccd1Xn+B
	PKNBARO3pu5D6/ScuHvUooIP9Q==
X-Google-Smtp-Source: 
 AA6agR6X3WCFzC+AlaTjnRJJScW8IXlAi8HPaJ7TTaL0VJEKDLKFCgqny0NHMppo+zUFNmeJ3xBOlA==
X-Received: by 2002:a05:600c:3c9:b0:3a5:c5b3:4bf with SMTP id
 z9-20020a05600c03c900b003a5c5b304bfmr1784762wmd.195.1662104253935;
        Fri, 02 Sep 2022 00:37:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e969:460c:a8b4:e544?
 ([2001:8b0:aba:5f3c:e969:460c:a8b4:e544])
        by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b003a3170a7af9sm1470576wmq.4.2022.09.02.00.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 00:37:33 -0700 (PDT)
Message-ID: 
 <eca823296bc1d5163f549ab1cbfc9408a2cbcca8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] scripts/oe-setup-builddir: migrate
 build/conf/templateconf.cfg to new template locations
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex@linutronix.de>
Date: Fri, 02 Sep 2022 08:37:31 +0100
In-Reply-To: 
 <CANNYZj-YxzNONuKM5UVsvW7aS+k+aDTUw4GeK=MkMgGCdygxFg@mail.gmail.com>
References: <20220901142328.268769-1-alex@linutronix.de>
	 <d9ec6fa663d94bcc9229066100a140fc@axis.com>
	 <1710F0E3F6A43399.12033@lists.openembedded.org>
	 <CANNYZj-YxzNONuKM5UVsvW7aS+k+aDTUw4GeK=MkMgGCdygxFg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 07:37:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170237

On Fri, 2022-09-02 at 09:16 +0200, Alexander Kanavin wrote:
> On Fri, 2 Sept 2022 at 06:32, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> > We can however add a hint to check what is in
> > build/conf/templateconf.cfg if the test fails, as it is not obvious
> > that TEMPLATECONF obtained from there takes priority over other
> > sources (which are, in order, TEMPLATECONF passed via environment,
> > then .templateconf next to oe-init-build-env).
>=20
> Ok, the more I think about this, the more I'm convinced that
> oe-setup-builddir needs a complete refactor.

That script is meant to be really really simple and push any heavy
lifting off to bitbake or other tools. Ideally we were never even meant
to need such a script and the tools would "just work". I'd prefer it
went away, not rewrite and grow it.

Cheers,

Richard



