Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692C2ECAAA1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 19:41:46 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.16556.1661888499850898552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 12:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GK9dKsR3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id bq11so15558051wrb.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 12:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=kHZebKPeT5YHWvlxprZVJ8v6CmRCnWtd608I9Jtk4W0=;
        b=GK9dKsR3XXYFLJ2NTjHwTdJHBljx08PlI54kYmY/ozQfzlYLL0d/6d/ml9tev8HY0M
         wyLW81Tc/2YqMIfel2ZquF3N7jAmZ/8H8wqzj7jpG7F3ri6lYlshhSeG/Y1vGnu+U1zK
         t2A2tNqfTUdu1ZntBA2O6f6CTo6ty260YwHdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=kHZebKPeT5YHWvlxprZVJ8v6CmRCnWtd608I9Jtk4W0=;
        b=fVgxW+N+a6Km9717PCw/lRmB/26yioiywZL4WfDWJMiV/Guq8vG8edGY67h0PxgC1n
         pHGE7Y+1lvIWnsAJC0o+Xa0VfmcXsIB5PUZm1Hl2apJP+4YAF6s8enrHS8QtmH9d9FOx
         WHIJZAhRL7yVaoMXK5gVeM0jcp/UFXnDGQ0uWyeGoxyskndolHTUDu4gNEoEM+gL9L3G
         GOZB0TXGF4AxjK+/4Jsan+ig3263Qtb56zw5hW4vRVM/0gPq4p/fCUXTqLvCDA1dUX9X
         nNmLsmO6fZ9PVP9xSa6EUnHq302H16nvLNGwv+8Xw4w/9Q8OlXHi1Zmk2I/LD+zGKar+
         VN6Q==
X-Gm-Message-State: ACgBeo2PuA72AaNmeb45k4Z8tXhwBLhHQrs/Hw25WiLGaBGJMHa4/S6A
	p1X5gyCPIH5mg4wqRN4c9iux8g==
X-Google-Smtp-Source: 
 AA6agR7GAprPQFqmZt4oHEwdr8E3lJbn8tODfUf6ShhwxAo6ziwG86IDSQskuvcfrg149BW8257oWw==
X-Received: by 2002:a5d:4882:0:b0:225:3148:9f85 with SMTP id
 g2-20020a5d4882000000b0022531489f85mr9675070wrq.224.1661888498139;
        Tue, 30 Aug 2022 12:41:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e8fb:7413:92ab:6224?
 ([2001:8b0:aba:5f3c:e8fb:7413:92ab:6224])
        by smtp.gmail.com with ESMTPSA id
 w18-20020adfde92000000b00226d238be98sm9586054wrl.82.2022.08.30.12.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 12:41:37 -0700 (PDT)
Message-ID: 
 <40daa54c282c0aec73c3cdd366fedc1c76712c75.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] bitbake.conf: Add resource vars to hash ignore
 list
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Wes Lindauer <wesley.lindauer@gmail.com>, Peter Kjellerstedt
	 <peter.kjellerstedt@axis.com>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Aug 2022 20:41:36 +0100
In-Reply-To: 
 <CALBQxSuQcXNq5M3PFDXYSYaR=UgFCOEiYNQ-Pm5F6v_MVVSsnQ@mail.gmail.com>
References: <20220822045919.1262270-1-wesley.lindauer@gmail.com>
	 <cf290a54-3b62-9c0d-32cc-08195f682b99@theobroma-systems.com>
	 <01dce5b603bc47fc195ba4ea738e7a333ac1992e.camel@linuxfoundation.org>
	 <d6dc09aea26447ed99a4ad5cee62c048@axis.com>
	 <CALBQxSuQcXNq5M3PFDXYSYaR=UgFCOEiYNQ-Pm5F6v_MVVSsnQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 19:41:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170088

On Tue, 2022-08-30 at 15:27 -0400, Wes Lindauer wrote:
> I think I understand. I am sorry for the FAD. I was experiencing this
> sstate mismatch on the dunfell branch that does not contain the
> 'XZ_THREADS[vardepvalue] =3D "1"' change. This is probably why I
> attempted my change in the hash exclude list and then tried to "port
> it forward to master". I appreciate everyone taking the time to
> explain. I am still a little confused why calculating every rpm task
> signature with a value of 1 is acceptable, but ignoring the variable
> in the signature is not. Are these not different implementations of
> the same thing?

> > XZ_THREADS ?=3D "${@oe.utils.cpu_count(at_least=3D2)}"=20
> > XZ_THREADS[vardepvalue] =3D "1"

Note we do *two* things, we set it to at least a count of 2 and give it
a known consistent value. It is the two things together than work out
ok.

If the user changes XZ_THREADS, as long as it is set to a value or 2 or
more it is still ok. If the user sets it to a value of 1, builds are
not reproducible.

You're right that we could have just ignored it, but this at least
gives a hint that a value of 2 or more should be used. Ideally we'd
have put a warning around a value of 1 but there are a lot of things
we'd do ideally and limited time...

Cheers,

Richard

