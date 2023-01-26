Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB7BC54E94
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 12:52:43 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.72799.1674737554696853018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 04:52:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Cnl6FMtt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so3903783wmq.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 04:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lzuKZdi3vMZvCAha2qsp96haS6aWy6WeiWbqZHusyDs=;
        b=Cnl6FMttBlKxhPoNa1a3WPVhTJVZCKS1DWDmRDNmrtmJvC5LTyLmMkBmAJpdFB6Wr2
         3zm5ya0bdrCEKQ9ZpZyjSK5wsJcUrDt8gA/QmVPbzVCSkLujupcLXNn3nJ/do8ERReah
         PEpjbt3vB3/mwKfQHXJO+e+KfqVrdjku3g0A0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lzuKZdi3vMZvCAha2qsp96haS6aWy6WeiWbqZHusyDs=;
        b=HKTJZtLg8HFygBFtZbYhGreI1yBkIeYmX9YBnN2ONOVwaRWULyYED+5R/QlBtIb03n
         88wNb13zEuATGbIQmoRx6yfjWK7YfECGeVNHCsv9IrgsBQVhBfLVzNaksGlpMyDAHQkm
         o6jws9E9H7gpTzIdOsIeEcXRdomYGR+chjKXmHHMES8v+g8jg4DhOshwWAHWe9L9805E
         4m/3DFmckgFMYhwBrP4qqFx2fpivcwHyWo+VyNL93YEnO9Z5z4C6rZ6zMSRUcESvvHrW
         gKRPeyrCTxaLfAWVTCM6mgABdw0iwNnp9dlTX/8It6YNLG3DihVRW7sLoJh7BjW80ity
         QoFA==
X-Gm-Message-State: AFqh2koBX+EzO3G0Tg6yO1DlmOLO9e0ULexf18ttrSOnNRR2LwDbd0+c
	XtPOg/VEKuW6WWMuBuOBvGfvGQ==
X-Google-Smtp-Source: AMrXdXvaE4rSWukka8DsjVzR8ZwVWtF8Uqtqo1zaMQwSoo6ujNJ6X8QY+REXdgHVGaq7iWPBehk3YA==
X-Received: by 2002:a05:600c:4e50:b0:3da:f4ef:5e70 with SMTP id e16-20020a05600c4e5000b003daf4ef5e70mr35908517wmq.6.1674737552963;
        Thu, 26 Jan 2023 04:52:32 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f2d7:e330:f537:35d8? ([2001:8b0:aba:5f3c:f2d7:e330:f537:35d8])
        by smtp.gmail.com with ESMTPSA id j22-20020a05600c485600b003cffd3c3d6csm1360232wmo.12.2023.01.26.04.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 04:52:32 -0800 (PST)
Message-ID: <2986f2e9ac85049402a858526b6989028e451a8c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] gdk-pixbuf: remove ptest support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Thu, 26 Jan 2023 12:52:31 +0000
In-Reply-To: <20230126083752.151940-1-alex@linutronix.de>
References: <20230126083752.151940-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 12:52:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176394

On Thu, 2023-01-26 at 09:37 +0100, Alexander Kanavin wrote:
> Moving to x86-64-v3 instructions revealed that the recipe was doing an en=
tirely
> incorrect thing: running native gdk-pixbuf-query-loaders executable again=
st the target set
> of loader .so binaries. This worked, but only by coincidence, and no long=
er
> works on build hosts that do not support v3 instructions.
>=20
> Re-enabling installed tests in a cross compile scenario requires a comple=
te
> re-think (against the need to run gdk-pixbuf executables to produce the t=
ests),
> and is best done upstream, so sadly the cross-testing has to be dropped
> for now.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../distro/include/ptest-packagelists.inc     |   1 -
>  .../0001-Add-use_prebuilt_tools-option.patch  | 173 ------------------
>  .../gdk-pixbuf/gdk-pixbuf_2.42.10.bb          |  30 +--
>  3 files changed, 3 insertions(+), 201 deletions(-)
>  delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use=
_prebuilt_tools-option.patch

I don't quite understand this. Does does mean the ptest was working on
x86 but not on arm and was silently failing?

Cheers,

Richard


