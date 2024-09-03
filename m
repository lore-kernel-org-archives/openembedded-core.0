Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C893CD37B5
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 21:51:23 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.35712.1725400275327392831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 14:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RNSyLL4M;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a869f6ce2b9so639952966b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 14:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725400274; x=1726005074; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omadIkT66joVPgyzDcL8RMhUkot14fnrIT4qJY9FEYM=;
        b=RNSyLL4MHW/fidVx3daDh/UFgTnJku58ERsrjLfGZRkj3BoylBhbIXL8IKEJKSpAgT
         B/ti8xpD9/JUw4JHmGauDsdjD/GxOyRTNQu+f3B12iuX3XrqKz7OPww8DmHlO7cWQ/g5
         1uoLFxbHHSYkx66Ppp54pSGiHI34zQg9zS+Hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725400274; x=1726005074;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=omadIkT66joVPgyzDcL8RMhUkot14fnrIT4qJY9FEYM=;
        b=wBFk6MAZlbQPl57AsdnjtbntXoJERBBKKCVkxwkbmsMcJgyVV+KxT5A6PUY+8L49uW
         oEi3DHAYEUinByMJGc1whhZSrlq8ycrF00jWfhmQf5E+i4kNVBOurJas+15WcLJUTRve
         yp1/FbVXABq+EPmZmUfFEtXEk3ck7gMNCdAE+2UsIqc9Fn9wzX591npNkTNjFeuQm6ng
         wmjDzIqlWgrfsYJ1MT5lQGPctkthGpn2kAeDbqSQ3VUUJsdFENZCbnCYFYW9e7yJXs7q
         CVh5u4arZcenim62tp7WbRu8mQzR7uHA2IhqW5fD4bM4WLlhAbLHIGhWXqTWJjzVpUyl
         ervw==
X-Forwarded-Encrypted: i=1; AJvYcCWR194hMToFw4+cYZAy0RVBpj3jCEiuRSMYnfgqqz/a/TxAs9Rb5BFbqYYoKsxO8GG10lLa7QJA8fjqSGJhKfJmaA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyahSy0yunOeKaafA0p2wl7rFKHiaegPT55Q6uLhLbZC+zRdwKj
	pgheerkzI1tYaZszrjtVuKFdosAQQvZIFHiQftXBc005cU/zWYRipD8lgyRbq0s=
X-Google-Smtp-Source: AGHT+IH3yrlnjx8xx+0N6Hoct3qVwBXP1hE/PodX3x6x+CPmjKo48KCPq4YN3oQXQ8M+kADlag5RJA==
X-Received: by 2002:a17:906:d554:b0:a86:8196:e04d with SMTP id a640c23a62f3a-a8a32eda450mr162124266b.39.1725400273366;
        Tue, 03 Sep 2024 14:51:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9d96:b0b5:a86a:8114? ([2001:8b0:aba:5f3c:9d96:b0b5:a86a:8114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a898902292bsm726751066b.88.2024.09.03.14.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 14:51:12 -0700 (PDT)
Message-ID: <42ac587c4e691d9c2526e9088de9bc27bb92b0b9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 06/22] json-glib: upgrade 1.8.0 -> 1.10.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Tue, 03 Sep 2024 22:51:11 +0100
In-Reply-To: <1725352379-20334-6-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
	 <1725352379-20334-6-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 21:51:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204179

On Tue, 2024-09-03 at 16:32 +0800, wangmy via lists.openembedded.org
wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> License-Update: Add copyright and licensing metadata to all files
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Improve conformance of the JSON parser
> - Add conformance test suite from
> https://github.com/nst/JSONTestSuite
> - Add JsonParser:strict to enable strict parsing
> - Add '--strict' to json-glib-validate to enable strict parsing
> - Deprecate the signals on JsonParser
> - Port tools man pages from DocBook to reStructureText
> - Add "documentation" configuration option, and deprecate "gtk_doc"
> - Add JsonGenerator.take_root()
> - Documentation improvements for JsonReader
> - Raise parser error for malformed Unicode
> - Build fixes and performance improvements
> - Allow disabling installed tests
> - Support parsing multiple root statements in non-strict mode
> - Allow loading files >4GB with json-glib-validate
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>


https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/6344/ste=
ps/11/logs/stdio

The recipe probably needs to adapt to the change listed above:

'Add "documentation" configuration option, and deprecate "gtk_doc"'

but I didn't look in detail, I'm just noting it was a docs build that
failed.

Cheers,

Richard


