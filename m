Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED282C4167B
	for <webhook@archiver.kernel.org>; Sun,  3 Dec 2023 13:24:13 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.38871.1701609851986978543
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Dec 2023 05:24:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MoKCURtS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40c09b021daso3768705e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 05:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701609850; x=1702214650; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKxZZe8c4vL98e9UirzKPP1/QJxLjCrnupzyoUYMUmg=;
        b=MoKCURtSZpYL73i048uJC7L9K1X3U5zn/n9OiPKLb9B1JlA333mpIH9Zy6EE9w8iup
         /E+Z0c/sFmz9c2CUzzz/PUdZI22oVf74WzbXc4Oe/V3kXCwivognA0sy6nxXphyiGDel
         le2fo/+xOzm0REpDx6VH2PgO/IKl0qyNXtlHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701609850; x=1702214650;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bKxZZe8c4vL98e9UirzKPP1/QJxLjCrnupzyoUYMUmg=;
        b=A9YSQKE60ysNe3TAZhTAqfziwARAyKYZC+PigEtRVpDMKiHeigSMn/O4haiuWxAF83
         TdUU4qMpEhSIYkVT/d261mBK9tL37Jky04L/w+nfIK20aAbAYeM8siIG0AHBVnMq6HPj
         p11EKdo+vsJZflSXD/kp58K8mHVg59aDsNhPBTbgpDkIx1Si3Pi92AB9xp8FiC2eRrjq
         pF9zf/QyrntY1PXvcakZ8DIMtAVjpZZQUUfGolxefrZe5XT7b28uqnyh/Y9v+uz65lID
         Mr5947z2sGiWJRo5rObqbMz/xFtn4moxdHsfUnHCXoDNdXUOt8ajx2zx8okw0ML0cbKQ
         Fa1g==
X-Gm-Message-State: AOJu0Yx+gDZgIPb5vCLx/tyiEYug2voykIhiOiUwY/42OCKbiCvsHB+L
	kadkalk7p34R6xMg6hx6j2NOLw==
X-Google-Smtp-Source: AGHT+IFkA9tJtq8LtbtYQWlBtaZ0Zefs4VNknr7HNSZlnOWcWrqtPetdZBk/ZFUJFxbjdbkP9ckSCg==
X-Received: by 2002:a05:600c:138f:b0:409:703c:b9b1 with SMTP id u15-20020a05600c138f00b00409703cb9b1mr1490413wmf.40.1701609850431;
        Sun, 03 Dec 2023 05:24:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d528:ea27:1ed8:ce12? ([2001:8b0:aba:5f3c:d528:ea27:1ed8:ce12])
        by smtp.gmail.com with ESMTPSA id az33-20020a05600c602100b0040c03c3289bsm5153753wmb.37.2023.12.03.05.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 05:24:10 -0800 (PST)
Message-ID: <de1b836711c50aca80e47411f9b64d1b2a59076c.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv3] pciutils: add packageconfigs for options
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Sun, 03 Dec 2023 13:24:06 +0000
In-Reply-To: <20231127070746.3199347-1-f_l_k@t-online.de>
References: <20231127070746.3199347-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 13:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191714

On Mon, 2023-11-27 at 08:07 +0100, Markus Volk wrote:
> My motivation for this is to get zlib support selectable, because
> libosinfo requires the pci.ids file uncompressed. Add packageconfigs for
> the other options as well to avoid autoselect.
>=20
> Configuration stays the same besides zlib is deselected by default.

This needs to be two patches, one adding the PACKAGECONFIG and one
changing the defaults.

FWIW I think the default of compression makes sense gives our embedded
targets so I'd argue against that change.

Cheers,

Richard

