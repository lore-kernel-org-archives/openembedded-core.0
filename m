Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A779EC7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 13:55:29 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.9725.1686232526293518700
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 06:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=cVaMmEIH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-30af86a96b4so460680f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 06:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686232525; x=1688824525;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bydGeDsZ/bWDPcK+vfixpCBhR2mZYBS/Dz4rBxYbtqg=;
        b=cVaMmEIHLipYmEsnniB7mAQgIocCHYKKTIxgnFG6PSH7Von6JdTwZ7RjsbgtpD/fh9
         ASPKAmXDM5feAe+HrnWgLTnYd2+tRwI0foFJwew/lpDEfEdrecdBBLrG2MQGQfp4uv+U
         3RIggSPqhIiw0EsvSWAfoN3M3MWwnb8t5H8KI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686232525; x=1688824525;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bydGeDsZ/bWDPcK+vfixpCBhR2mZYBS/Dz4rBxYbtqg=;
        b=PpQOl71gDqRwiHNCCRjPCJQah4hTJFgzL+b2/A9Ci18wWDoDamdYngSED2WW60cyjS
         r5kIdZbH3CoAvv092lcQuzvDTyznU4qbCSy+ywrHLSolIUe4Iegy7MuY8fFFphjouXJx
         vy41lQU16UyFrdQTqpdhRrYDXodx094Sx+t7Cy4sYvSobrm3cYb6iRzcURhwaUQkcVhR
         hah71Gm3H9Iyzpl1PWRdeSZ7Tm+c5IgmQxctx/MvXg8Geg1JGr6s2kPQ2tGntwTi7Rg9
         Pb3hWIGhWStW1P7ZcbH+S67QcxsgBvLXSzBUYNaqICzYOuRWwYr74Hb+fEvfHR4Yp4Be
         SgdA==
X-Gm-Message-State: AC+VfDyetsHh6G2ov0HxQbmow6aneN1cwD6u9CQxeN6adiEugoMwEKoS
	jcut4xBr/beCThfAb/5ZRWWEXQ==
X-Google-Smtp-Source: ACHHUZ6aU/q+pwcNjFEuc/gquhdzGpdU0e0dXpft0FyDuUS7MvT6ZJ7FYrkaz1nDKP8op9HFI6a+Ug==
X-Received: by 2002:adf:ff83:0:b0:306:2841:7abb with SMTP id j3-20020adfff83000000b0030628417abbmr6484459wrr.20.1686232524755;
        Thu, 08 Jun 2023 06:55:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:316b:ce77:4e88:2f02? ([2001:8b0:aba:5f3c:316b:ce77:4e88:2f02])
        by smtp.gmail.com with ESMTPSA id y14-20020a5d620e000000b0030ae4350212sm1683130wru.66.2023.06.08.06.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 06:55:24 -0700 (PDT)
Message-ID: <7326285b062d6b494d9933270bb5811b83e81e82.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5] qemu: Split the qemu package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, "Yu, Mingli"
	 <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 08 Jun 2023 14:55:23 +0100
In-Reply-To: <CADkTA4Mj2WdncdduX+P6fT8HU0KjkS6+vjTePbhPc0FXL2d_CA@mail.gmail.com>
References: <20230607205347759a5df5@mail.local>
	 <20230608054525.3293334-1-mingli.yu@eng.windriver.com>
	 <CADkTA4Mj2WdncdduX+P6fT8HU0KjkS6+vjTePbhPc0FXL2d_CA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 13:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182510

On Thu, 2023-06-08 at 09:33 -0400, Bruce Ashfield wrote:
> At this point, you can probably see why I ended up using the explicit
> variables and overrides versus python when doing the
> meta-virtualization splits. :)
>=20
> I have a few more comments that I made in v1, that I haven't seen
> directly handled or replied to.
>=20
> My only remaining concern (and it may just be my own concern), is that
> there's no way to change this packaging split. Either you take the
> programatic split, or you take the -all packages.
>=20
> Other packages (glibc, kernel-modules) have a variable that controls
> whether the split happens or not, I'd like to see something similar
> here .. but I do realize that it makes test complexity more, and that
> Richard normally doesn't like conditionals like that.

I only "like" conditionals if it is a code path that will be well
travelled, otherwise we tend to find one of the paths is broken. I
don't think we need to make this conditional.

> Alternatively, did we rule out using PACKAGESPLITFUNCS to add the
> splitting routine ? With that, we could remove the processing in
> places we don't want it, in particular for the native/sdk builds, as I
> found that we really don't want the splitting of qemu in those
> scenarios.

FWIW, native isn't packaged so that one at least isn't a problem!

I'm assuming the "all" package can be used in the SDK contexts easily
enough to get the needed behaviour there?

Cheers,

Richard

