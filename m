Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC58C07545
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 14:11:18 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.174429.1698243070297060289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 07:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aWMPdfLP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4083f613272so47929405e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 07:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698243068; x=1698847868; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpjSXZOqYi+Qaryzw0e95tlnVA7GErz45oEIX9tJWhk=;
        b=aWMPdfLPx/hcCYo+tWfCM4xJuClGi8WDiVlxZOxqISBkXhSMNA/QPUBmXgVCaMfXkN
         BwEZ0Ev/0jp31ClX5h+OYnt1ZbH5IwWpXQrknASrlmiupdlDroXWgvWQOxbUeyfrt8wm
         QDHooQpFhyp57GF0JkGtNLLeDJciefX7RUSoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698243068; x=1698847868;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YpjSXZOqYi+Qaryzw0e95tlnVA7GErz45oEIX9tJWhk=;
        b=B4Cq6e+VVwNX2Adnr+4Aw0Towv5jjUvC1oCvGvHvc0Vr1ypaoFGOrI4DJlIJ1fpK3C
         j39OgNH07QvcIT4xdnACZ6n+VTWWif7xg0aHKnLAFjN+PMGc1OTi3Fu1k2tRvUysrisR
         sb3mOH0F9N80SbH9bVJF0h0v1Wi1lfEkuR/oJnirF8uaRCWGJ5NPwtZWQHii0ZOkYjKs
         0kQYj2vpzbGJBDG+hhzkZYUwsZ756vdMlraDwjOeoXRU938TSzNrD45JPQkeNUF+RAJ+
         B7Hgf6ILqCCCUCjGF5i3XyMk5/UakABRaDNpC5qF8zZJD2zZnI0EkC0w4SveQbRpNUex
         3wxg==
X-Gm-Message-State: AOJu0Yx1cLHrkDTRqi68lQTveXgd+rpoSUM5ZsAoNvZZqaB2AIHcBGoP
	4ZCEWqyXfh2Ia7JRY4WStXlfmA==
X-Google-Smtp-Source: AGHT+IEGGy/RQMBgx9pqkh8zSlbuPmRhSzcGiDmovkJ3JTQ9qITvO5xxX0gaafReTWuVysWWmgrnVg==
X-Received: by 2002:a05:600c:a07:b0:402:cc5c:c98 with SMTP id z7-20020a05600c0a0700b00402cc5c0c98mr12245652wmp.13.1698243068231;
        Wed, 25 Oct 2023 07:11:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:63b1:c4c7:ff33:3a6c? ([2001:8b0:aba:5f3c:63b1:c4c7:ff33:3a6c])
        by smtp.gmail.com with ESMTPSA id u13-20020a05600c19cd00b004068e09a70bsm14900584wmq.31.2023.10.25.07.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 07:11:07 -0700 (PDT)
Message-ID: <19b88e474d716513f4ed23327f1eb6004241d7ee.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 0/4] devtool/recipetool: add support of
 PEP-517
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Julien Stephan <jstephan@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 25 Oct 2023 15:11:07 +0100
In-Reply-To: <20231024144022.1532605-1-jstephan@baylibre.com>
References: <20231024144022.1532605-1-jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 14:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189679

On Tue, 2023-10-24 at 16:40 +0200, Julien Stephan wrote:
> Hello all,
>=20
> This series adds basic support for PEP-517 in recipetool/devtool, plus so=
mes
> others fixes.
>=20
> Recipetool/devtool selftest passed locally
>=20
> Missing features:
> - extra or optionnal dependencies are not handled
> - version number for dependencies are not handled (issue already present
>   for the legacy setuptool)
> - some projects can declare a minimal pyproject.toml file, and put all
>   the metadata in setup.py/setup.cfg/requirements.txt .. theses cases
>   are not handled. If a pyproject.toml file is found, assumes it has all
>   necessary metadata.
>=20
> Changes from v2:
> - try to use tomllib from python core (since 3.11) and if not available,
>   try to import tomli (instead of toml, as tomllib and tomli have both th=
e
>   same api)
> - improve support for poetry: poetry looks for metadata into the
>   "tools.poetry" section instead of the "project" section
> - add the selftests for the 3 supported backends. Skip the tests if
>   tomliib (python > 3.11) or tomli is not installed
> - fix self test failing with the new "python3-" prefix added to
>   recipetool for python recipes

This patch series still doesn't seem to apply against master. Could you
check your rebase is ok or if there is a patch missing or something?

Cheers,

Richard

