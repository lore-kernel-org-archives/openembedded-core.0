Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C113C74A5B
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 08:21:02 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.5804.1679818854291390781
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Mar 2023 01:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a5JRvUdX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id r11so5640390wrr.12
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 01:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679818853;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHPuhYgORjlO+ffbGS6oyxmXJ8077xqXs935GDaNfXQ=;
        b=a5JRvUdXReLyHHNgztPGmmHWKWZtPknfEWfVQ2BaDVEpuGyFu9Tt9U40pudNQvbvS7
         23g2hyAKqL+07DDBKWH37glvst6n4QdDbFVFZ5GQsboaZIR036YuNtJccPk6QJ+AV/uq
         a4gYuT5sLZx9yjSj9vGL2AU+xQ1dQqxKmztfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679818853;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mHPuhYgORjlO+ffbGS6oyxmXJ8077xqXs935GDaNfXQ=;
        b=qjudqcrTWbWwrcsyQjMGK6up7v9bFekdI4/hFW78Z1Kyl0w13wOfah8iK5k+7ZJn37
         HMgX+IHUCCe8CWMnBuO3e2npbEL3ViUcSA3CbI+GhnetkrVH5JzITOa8X1cIesIQtm8W
         1g5zh1G9GK1S7aOVttbYxsLt8XW7nJVpM3b+kqv80p8ZAjDAgWYAVSZdoSUz8a3HUJLz
         aPE9tUiHqcv1PgC+EzA4EAch6t6cigEAekSsrOvRwEOSsfV/sQZfrVcIo5QZs5qsAbQT
         os3F72II6Jqy0kcvuCAI7XhFYE1zfukQZUTNjKPw0Q0j/Pw4DJxf5dozj4/EKQlblUIA
         sfVA==
X-Gm-Message-State: AAQBX9dpxlRKuppbAigyYG/HcTYDijWM53lkMkBRxDHWnrsIFK7eUW2r
	I4JT0rf9mrhT++Nkyx6PyQQMog==
X-Google-Smtp-Source: AKy350YnspMO7jb9Dvi5rcM0BdQ422KWaAGl5sK+J1xmL5ktnbusG4dL9Jo982dZUH3UKoBoWHiwqg==
X-Received: by 2002:a5d:5601:0:b0:2c7:efb:dded with SMTP id l1-20020a5d5601000000b002c70efbddedmr7099297wrv.24.1679818852700;
        Sun, 26 Mar 2023 01:20:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7e91:cdb:75c4:1387? ([2001:8b0:aba:5f3c:7e91:cdb:75c4:1387])
        by smtp.gmail.com with ESMTPSA id e13-20020a5d4e8d000000b002ceacff44c7sm22323404wru.83.2023.03.26.01.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 01:20:52 -0700 (PDT)
Message-ID: <cf263160e22b4caadd5a5c11f3f4871ede96964d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-scons: upgrade to v4.5.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Mar 2023 09:20:51 +0100
In-Reply-To: <20230324141626.1361740-1-Martin.Jansa@gmail.com>
References: <20230324141626.1361740-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 08:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179112

On Fri, 2023-03-24 at 15:16 +0100, Martin Jansa wrote:
> * fixes:
>   https://github.com/SCons/scons/issues/4231
>   which caused e.g. iotifity to fail in do_compile

I think that should be 4321!

Cheers,

Richard

