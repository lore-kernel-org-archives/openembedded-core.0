Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45D1CA101E
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 22:44:44 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.26647.1725230681648651341
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Sep 2024 15:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=glZ+CBi4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.179, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f4f2868710so37972981fa.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 15:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725230680; x=1725835480; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T218M+q8tRDWdjjh1ZXaWQ002OGmZfNzaA5/Z7LXMIE=;
        b=glZ+CBi4RN9zsbi2b9EvvpCNyJT7Q6guqV37/+Wm1yshcnTB+1wjyX6Le2SgBCN6bA
         dKNqhKtyc698KJBF5/xkRKPOm3ufRsjv5rv/wq7+ybAfiF/0DNww5x30N1+VAR0MOcmR
         SKNdKSgVJgeUkzX3cw9Kfm+YqCmdnKQKx3B2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725230680; x=1725835480;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T218M+q8tRDWdjjh1ZXaWQ002OGmZfNzaA5/Z7LXMIE=;
        b=biLv0L9AgCS6B1KbbJ7UjyScvZ/tEmBAbmLu2Fd1LfqNpAH5jrDvI2Rs50zUxAiA3p
         shI2VT3pOHPO9yxcZeylOSObHUvz7wo2Dhm465WwZea3W6f8MGQu7yq5w6lTXJaZtRsK
         FKChEIxGII/MjcyDHQHv1WSbmoka4bir6fEAzESZgvOTEIPIpc6Iz2CeO17121vuDnQ5
         IUQD0Z+Z21ov/d5yEIPCexGLjG8KYySNsbZDQ9iFVF/r7bLtw1G1jUauIY4kvwyGIlKr
         hPhcnpIYioAGq6wcR7a7xQW7HJ9NQMM9TDLAaAIpiVj9xfTGnnBL9HyNPVLRBSqmGHNC
         wTow==
X-Forwarded-Encrypted: i=1; AJvYcCUJ6N3r8SHZ5k6qy3pmeTDyUo26LIeTFPSDajcqbiutqjIMns3u+tY9K+L8Rcnm5AUeYy0aft0VxGMcyBvEA8o/wA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YybiviL36uPAjTyYOidecc79uLuRdhf62U9X8WeDXpZMm3G0Wde
	VEPNBXg9bA86dUDrvWdPk8gkhe424J77bY/4Hro3owzAGytQYcbXZc5V4H6i93E=
X-Google-Smtp-Source: AGHT+IEkIjXuiBMQiEOnW5efGEKLxwEEJCYymDlWMpJF/RWhyvm6EqMHbTW0SMrurkpyOPuKF6cODg==
X-Received: by 2002:a05:651c:b0d:b0:2ef:2c6a:4929 with SMTP id 38308e7fff4ca-2f6108a080dmr97500211fa.13.1725230678939;
        Sun, 01 Sep 2024 15:44:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:510d:dc67:1994:ae2? ([2001:8b0:aba:5f3c:510d:dc67:1994:ae2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c7349fsm4423483a12.36.2024.09.01.15.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 15:44:38 -0700 (PDT)
Message-ID: <4b6689079e150ffe0f015eae0c4f83d814898eb6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [AUH] Upgrade status: 2024-09-01
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 01 Sep 2024 23:44:37 +0100
In-Reply-To: <CANNYZj9fAgYHeJd2bpbR0LEG2cRg-tRf9Sp9kpLXK_6rbZa2dw@mail.gmail.com>
References: 
	<01010191ac50ac04-b8216d99-c9be-45d6-b8fd-f550fd8a6a5f-000000@us-west-2.amazonses.com>
	 <CANNYZj9fAgYHeJd2bpbR0LEG2cRg-tRf9Sp9kpLXK_6rbZa2dw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 22:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204058

On Sun, 2024-09-01 at 21:21 +0200, Alexander Kanavin wrote:
> This AUH run was thwarted by a botched libtool update - it's one of
> those notorious corner cases that AUH hits occasionally. First,
> libtool update failed thusly:
> https://lists.openembedded.org/g/openembedded-core/topic/auh/108206634
>=20
> (if I'm reading this right, libtool-native got upgraded first, but
> the
> outcome was a non-functional libtool-native for the purpose of tasks
> that 'devtool upgrade' needs to run)
>=20
> Then, this somehow damaged the build dir so that no further builds in
> it could happen, but AUH cannot tell when that happens and carries on
> with the list of things to update:
> https://lists.openembedded.org/g/openembedded-core/topic/auh/108206638
>=20
> libtool releases have historically been rare, and RP has issued an
> update for this one already. If new libtool releases continue to
> subvert AUH, we can probably mark it as needing manual updates.

There is a patch specific to libtool-cross and maybe some others but
not libtool-native and that needed to be rebased (fixinstall.patch). I
suspect that is what caused AUH the issues :/.

Cheers,

Richard

