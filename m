Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D360C3DA4A
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 15:27:48 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.10835.1722871666346371127
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 08:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eVaMuL51;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.171, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ef27bfd15bso131296371fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 08:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722871664; x=1723476464; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NOW9CvqTfwdTFHjz9p5aU96BRKSyhjGiT5r8/Wx4THM=;
        b=eVaMuL51oX8J7NoCKUkdX7nkUqR13nDLXphAZ0lIoOUw0mC8JXEy0jktDXNdn5BuYe
         QkunazbnNAkDf5PPdstdMFqfUzXdb1vfNigbh6UPK/gVVarx2nwvMw36TYc8xtRBZ9D1
         B8e1XtDuxao4VqwzA3oyw7vjJrlrDOzkD/NG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722871664; x=1723476464;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOW9CvqTfwdTFHjz9p5aU96BRKSyhjGiT5r8/Wx4THM=;
        b=wVZKMq0aPyQqNIEF1TeOZD8V2dHRTQMG2ngbozC5QtXsCpslhHC5dMsEIf0BJa2eFj
         8r1NrYVQdYQtvYsWahkt1IEl9yV2RXgdscGSi/2b+4uxBv/xVwB4sT9764gWujD6BKbp
         j0FDGzQidenqpHdPeGQSQbv9Gee+61EDNfz+vKUbtlqqfxbasagz6loBxKIzJHVfDaoJ
         NEySjuNzb/1qjnOG3ip3b3geKO0rW4hNM4ThaLj/Hh0h6m/UDD4kEa5eSaDr/mW+6GV5
         X8msFOze2yrAU7nCPfPPqRQ8p01v/64E4fxSApAq7xU1AL6bVFjKbYVf1dcJzdutH1Jx
         I74w==
X-Forwarded-Encrypted: i=1; AJvYcCWy0GF0Py5IIgyaoQwkWSgh3JUtljJmY4/CrgcczI7508dOhi3IpzTinNAnSurDcDOh3+j6JfezwIveHYvKKkMoODczURuJLGZh9DO81jaYkSQ3WVZ/4GEy
X-Gm-Message-State: AOJu0Yx/hwabfbWAMZTPuH5V3VJz1RQaLo3rHoWjDUduVLJLODMDo/Rm
	2PcnWBmSdfUIeHmESIa+Lh6sFDzQbfwS7x0ZZMSjgC+ldZlvOl8VTr+c9Rqbc2Y=
X-Google-Smtp-Source: AGHT+IHtxBu35sHqvrCl8E6hmv5MMyt3sn9B8YTYpMsSDUgSxwdSqAJBOfZKxsFvZjkbBERrD6xnxg==
X-Received: by 2002:a2e:9dc8:0:b0:2ef:3347:ee93 with SMTP id 38308e7fff4ca-2f15ab39668mr87383791fa.44.1722871664241;
        Mon, 05 Aug 2024 08:27:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e8f5:87f4:f4e7:7ee7? ([2001:8b0:aba:5f3c:e8f5:87f4:f4e7:7ee7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e7dd9esm142558195e9.30.2024.08.05.08.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 08:27:43 -0700 (PDT)
Message-ID: <9fe86c0b0106479e2247153f2be035547239d892.camel@linuxfoundation.org>
Subject: Re: [OE-core] Expired certificate https://git.openembedded.org/
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: reatmon@ti.com, peter.marko@siemens.com, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Mon, 05 Aug 2024 16:27:43 +0100
In-Reply-To: <b2e11089-48f4-4f8e-878d-303f295af0ac@ti.com>
References: 
	<AS1PR10MB569783A5910EC551F00C7170FDBE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <b2e11089-48f4-4f8e-878d-303f295af0ac@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 15:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203000

On Mon, 2024-08-05 at 09:57 -0500, Ryan Eatmon via
lists.openembedded.org wrote:
>=20
> I've noticed it.=C2=A0 I can no longer do a git clone from=20
> git.openembedded.org over https.=C2=A0 Can we get this fixed ASAP?
>=20
>=20
> On 8/5/2024 8:15 AM, Peter Marko via lists.openembedded.org wrote:
> > In case no one noticed yet, the certificate expired an hour ago, so
> > the=20
> > repositories can=E2=80=99t be viewed in a browser=E2=80=A6

This has now been resolved as has the underlying issue with stopped it
being updated automatically. Thanks Michael!

Cheers,

Richard

