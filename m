Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B9BC433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 14:44:30 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.119683.1669646662818890778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 06:44:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O8a/BDH/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso11810105wme.5
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 06:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cquWpmEY2diRIDADZcRD//Tp2T9LAlDQbFt42IIE7Vw=;
        b=O8a/BDH/EOJdDdbghoL5ng//+8K7/qgnoa06lKu6BP+eCQJ7yR2lQibI0uHO2JnTY8
         DQdDBoIqV2BHP2/xgek0fkP4a4YB6f17k75oQ7OAinsL7dEvRKHJQ+TKMJim++lYfS0+
         zlr4DZ0vCGEBS3xZ6jHADRB6T71Z2ZSGFdanU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cquWpmEY2diRIDADZcRD//Tp2T9LAlDQbFt42IIE7Vw=;
        b=m4xfhyRprrS8dRUXMmyIuikYRPvToDQedr9U47gHeAVudlueKLk1xuXCofTK7TT1eL
         r/3JRFj+qQ/jUErBgKOUaDXbQXvfciWeKN97UMCnMVMo1gx603CTZ4GFL7oddC0jLG80
         UVzo616CvVj8WXavtK8JvL9mrRk35xRqBhrgSOykXNBbKmxWTQQ6xW7OZ5LoC4hJVrrV
         BGeLT8wTF4Ey5mnaiDV1vBEGJU9hxC4fIc801tTOfHqPPFJ65WAezf08uzf4+Io3TSrd
         UhOOi4UXjayUTv3z+uN3dtwwyrKlkdhxpjjLiJ07o2XYGpn6Djk2F/rrOaLcWSgjWclx
         3/Jg==
X-Gm-Message-State: ANoB5plBOn0iYuBuA5ubabIEMKHcL9sF4C1YETVufsmcW3BcYHyJo2uG
	3DImkQEoAQEDjLNRRhTdnX4MSQ==
X-Google-Smtp-Source: AA0mqf6NnjqZS/rQiSfNLRHqgfknRAaIEQf9Dw9I6QZ2Vk7KQQ/sdJk5gk9HIyzB5lnFPybGMs+ruA==
X-Received: by 2002:a05:600c:3108:b0:3cf:8058:43b8 with SMTP id g8-20020a05600c310800b003cf805843b8mr25466259wmo.95.1669646661199;
        Mon, 28 Nov 2022 06:44:21 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1da4:7286:b644:a924? ([2001:8b0:aba:5f3c:1da4:7286:b644:a924])
        by smtp.gmail.com with ESMTPSA id bg3-20020a05600c3c8300b003c71358a42dsm25725492wmb.18.2022.11.28.06.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 06:44:20 -0800 (PST)
Message-ID: <89a3d3880e4da3f35326c7c3c2d4c904bae5f2aa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH RFC] base: Switch to use addpylib directive
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Vishal Bhoj <vishal.bhoj@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2022 14:44:20 +0000
In-Reply-To: <CAKdWgSw2tZ68R531RZgi2bqLrdOXkc1oZnxM_rEugv7S-ysOUA@mail.gmail.com>
References: <20221127213640.539995-1-richard.purdie@linuxfoundation.org>
	 <CAKdWgSw2tZ68R531RZgi2bqLrdOXkc1oZnxM_rEugv7S-ysOUA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 14:44:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173920

On Mon, 2022-11-28 at 19:29 +0530, Vishal Bhoj wrote:
> I get the below backtrace with this patch on master-next. The same
> patchset works fine on debian-11. Are there any specific versions of
> packages that need to be installed as=C2=A0=C2=A0dependency=C2=A0?
>=20
> Tested on host os: ubuntu-18.04/ubuntu-20.04

Which python versions are those? It looks like I perhaps assumed a
piece of newer python syntax accidentally. I suspect this code only
works with python 3.9+:

https://peps.python.org/pep-0584/

I was wondering whether to remove this piece entirely anyway, I need to
check the performance implications.

Cheers,

Richard


