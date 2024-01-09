Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8034C47073
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 14:10:20 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.17620.1704809414989195191
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 06:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MZhPzqz2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.175, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-78313803243so272088685a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 06:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704809414; x=1705414214; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AA7iMYJlcjrGccRgtCKmSG5hnYhsidPhmHWD2LGmcsw=;
        b=MZhPzqz2iDXBbqUR3DPTVtQuJJUPNPtTKquhEn5dFYcICYzvCGOu+dnjCzNfawRM70
         7O4DWYvwYMDKT5AxhGfO0F22+KQF4p793VAN5Zyc8sqiSM74gGHGQD6Jee/aBac0bm9B
         0UwHfMpirI71x5cy7psMMhg9pQxhzrD6pEa6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704809414; x=1705414214;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AA7iMYJlcjrGccRgtCKmSG5hnYhsidPhmHWD2LGmcsw=;
        b=l7Q/fDaETUJvkrIco7t5LM89ovD1qWSKGMlFuMucqFVlslKib+c4Zhq4DzjEJmNpUW
         pFbNFTRsCI7KpBV/5IcdkR3FhtRMc26QfCeBl1sITEwlCNgvk8ZbcwBJ5crEOEtzWA3y
         pjfKyj+Pgg6CH0Hn+U6n8zf+yMLf79DFepCGf0hhvsd9GRCP3Mb3PczdFYMgXpnEQNwh
         1Dt/ofidYJQpn+tyryDUSG3/SD9NjrkKuDazw1B8Xmw5cthoqo6IAWKaQlbsuUfyqKCb
         sV5A0s7CzdQpzPSslWPehPsUb1lzUCiGu0ULrHwsvRnzbSjwoYah2zdysryo7343Wmcf
         GF7w==
X-Gm-Message-State: AOJu0YzNU3phRtoRKZMH2Yaox1QCLZVbWF9Q/SubQ3fFfG9J9U0Os/h6
	qh9kLwnOWQJWhbH8bn2SEcfAb6dJ21aAQA==
X-Google-Smtp-Source: AGHT+IHzvgagI9UU7WfXC/JuJouXysfesh8jhBI/krF5Ht4VlYUykJC8L4NhJLdpw867yXFoE/FfSA==
X-Received: by 2002:a05:620a:201a:b0:781:8c5f:9c75 with SMTP id c26-20020a05620a201a00b007818c5f9c75mr5680067qka.122.1704809414033;
        Tue, 09 Jan 2024 06:10:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:494c:2c49:a717:e3aa? ([2001:8b0:aba:5f3c:494c:2c49:a717:e3aa])
        by smtp.gmail.com with ESMTPSA id w7-20020ae9e507000000b007831a0f6e75sm813647qkf.96.2024.01.09.06.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 06:10:12 -0800 (PST)
Message-ID: <ddc2301e942a551d895943886fd69da4038341a7.camel@linuxfoundation.org>
Subject: Re: [RFC][oe-core][PATCH] webp: switch recipe to cmake buildsystem
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Tue, 09 Jan 2024 14:10:10 +0000
In-Reply-To: <20240109132826.2445412-1-f_l_k@t-online.de>
References: <20240109132826.2445412-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 14:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193459

On Tue, 2024-01-09 at 14:28 +0100, Markus Volk wrote:
> Besides the improvements that cmake offers compared to autotools,
> the advantage would be that cmake config files get created.
> This is useful so that other projects can find webp using cmake.
>=20
> Remove EXTRA_OECONF settings because all of them are set like this
> by default.
>=20
> CMakeLists.txt doesn't provide an option for selecting neon but from
> what I have tested it gets selected properly.
>=20
> Downside is that there is no way to deactivate gif,jpeg,tiff,png or
> opengl. The libraries are used whenever they are pulled into the sysroot.

I don't really mind cmake or not but we do care a lot about
determinism.=C2=A0

The trouble is things can end up in the sysroot via indirect
dependencies so this change allows unintended changes to creep in (a
dependency adds jpeg so the config of webp could change too). I'm
therefore not happy about having "floating" dependencies this
introduces.

Could we submit a patch upstream to avoid floating dependencies and
allow things to be specific?

Cheers,

Richard



