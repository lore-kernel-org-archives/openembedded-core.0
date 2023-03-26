Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BD9C761AF
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 17:52:04 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.15512.1679853117664361634
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Mar 2023 10:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VkUOOPkI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so5937443wmq.4
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 10:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679853116;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r1zBDS1KuVNdjPqmp5bkdTuixUrcQiBHhNWdFPXXR6E=;
        b=VkUOOPkIs7V5yuT2iETG1J28oh0ap/MRmEOOzpombIUQe3Y9j/NpA6EO4jFN/mF+p8
         q70JtcjVgDQ8udzoNKr2Ib9o7rwvkEs8Qyzz/Vx9FA0gS5XRD9R4bdnpQO/Er6+jZ9om
         Cd3whg1dZOlbuzCU6/LMxkjuFqJY8FcQA+5w4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679853116;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r1zBDS1KuVNdjPqmp5bkdTuixUrcQiBHhNWdFPXXR6E=;
        b=Po92sm6lp1Q5DOFaymkWrkhxSTU3enCDCMEZWYOQSR/BqQhw4brCNWVvJfdZARt0rI
         15l4UzVFclKsvPwwXsABVrSxHTYcNWvsHLq3/AU46hJv1hiT5xtM2W43aiUrRVwzQFQi
         XpYaGKsUKvHeDYO09+RJf8s7RQIXzx4uVOEj8HIhmC8UDc2cKOLUJsAQtRiUl4re5uTQ
         8LfO6UVA6qm59/Ko+EDZQclDKvHl1ytSm1goZRzM55cyhRY/ChFqP4ZIMeSnJdhfkpdU
         ftz2+nk9+goQiCcPQbQK5gGQHBU4KJXNEggLlJV2XKR+eFsPZudL1AbKYbl/11HdpkRU
         9BVQ==
X-Gm-Message-State: AO0yUKWPRyI9KsNfL0HRFoqOuCYya3c7+Eg7XyrnC4mu9W8uM5/oS+SJ
	8OI9E/pjEFhfgJ7riMSgH4soVdAgk/rgB0+ffs4=
X-Google-Smtp-Source: AK7set8s4239uCSjotyikFDyjfEtNPCpTuldppj6Ag6gfo60h+4/D379Tiv+G8h3MRtK0b11KBPbwA==
X-Received: by 2002:a1c:f70c:0:b0:3ed:d261:50a6 with SMTP id v12-20020a1cf70c000000b003edd26150a6mr7302226wmh.9.1679853116177;
        Sun, 26 Mar 2023 10:51:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7e91:cdb:75c4:1387? ([2001:8b0:aba:5f3c:7e91:cdb:75c4:1387])
        by smtp.gmail.com with ESMTPSA id e13-20020a5d4e8d000000b002ceacff44c7sm23213907wru.83.2023.03.26.10.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 10:51:55 -0700 (PDT)
Message-ID: <2f8d64bec7e1def32b59a29fa9901b4b1ccd0716.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-scons: upgrade to v4.5.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 26 Mar 2023 18:51:54 +0100
In-Reply-To: <9201518f604d50dedb65cd337c42230c23438092.camel@linuxfoundation.org>
References: <20230324141626.1361740-1-Martin.Jansa@gmail.com>
	 <cf263160e22b4caadd5a5c11f3f4871ede96964d.camel@linuxfoundation.org>
	 <CA+chaQcgXJSgp8SAT2ynqvvF8vOZJguq0EerQSJC42vK1z1OAQ@mail.gmail.com>
	 <9201518f604d50dedb65cd337c42230c23438092.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 17:52:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179134

On Sun, 2023-03-26 at 10:00 +0100, Richard Purdie wrote:
> On Sun, 2023-03-26 at 10:57 +0200, Martin Jansa wrote:
> > You're right, the commit which fixed the issue:
> > https://github.com/SCons/scons/commit/a4ab466c6df5bd3187e78c36bfa8f68e1=
fb7659e
> > said #4231 so I went with this less cool number (without noticing
> > that my other tab has the issue ticket #4321).
> >=20
> > Should I send v2?
>=20
> Please. There is some issue breaking master-next and I worry it is
> something which already made it into master as there are only a limited
> set of possibilities in -next including this. I can't quite see how it
> would be related to this one but it is why I was looking...

I found the problem patch and this one otherwise tested fine so I
tweaked the message.

Cheers,

Richard

