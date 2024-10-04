Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52792CFA774
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 12:18:54 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.20577.1728044331016726066
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Oct 2024 05:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aQLFZZ5L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5398e4ae9efso2355035e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Oct 2024 05:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728044329; x=1728649129; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLBWGTmT+Qgy7TQlyCndLGoW27Z7G4RPFw4e+68VxIA=;
        b=aQLFZZ5LPSBGzcfWXnXjKjqZoSWJIrtXmRysuZIBv8t0TAlH0pxulB3XGSgjXUeXVP
         ea8U6fUdeQh4k/zyTqHzzJtnC8uaIz/4vOetuQ+R9Fg6w3T3Q331RQP8Ed2BUs36AYEK
         jQiP44F33ldlHW6zYUeof4PzeMSmyXQpCWtLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728044329; x=1728649129;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NLBWGTmT+Qgy7TQlyCndLGoW27Z7G4RPFw4e+68VxIA=;
        b=DlkgQY1QDgjHhY0U+fEB/6XkzfO9lUbmCP0Y/4vE663S5orek+5Z2jq5ayaySBz6CN
         +hVDsJfeHAiF34b+BGWk/cgwoskNbLDjBVMYnOeh3682jxjx53vLqDHx6n3JLsHEq91K
         hZWoJSgHsgWzt44H5+Tne5wUSQ0cu72nOQttQI+jOkWpUNqC02sWnh213tF9BNbk4H+9
         FPHgF4iXl9ZURJRUGqpkIZ5FqJDIYlvtfTVc3sa+sG/fjfSVi+CM6LIJI5NzZjExdT9Q
         CMy2NDlHXSuIfDEm2sdh/L7r7nWxKeUk5J3K121FZB+XbWafFUdKFS0e8pAhbtxC3kTJ
         ve1w==
X-Forwarded-Encrypted: i=1; AJvYcCUc2ljYDvjGhapwhF1yFHi3+GvX0SGKU69yXMfUBeZ6Yl4XvQFzV/xAO2BZLyioWt9piXEOrrqOXWbbsmi+0FGf3g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxnJD3AwZxEo9ZlvRPvfh8soKjgzKq4u5+rO3OJyl49jkjtLyVW
	fx8ViCpsp0vpfHmgqNTHS2aOUJvzHkLQVom5ZwS0OSTMohhI7D8U6mId/3e33fI=
X-Google-Smtp-Source: AGHT+IFJj6wqZL1YlKT4ejaS8qScsFpX0KIniZGOLuQhvBCp7GmspTczmlzinHrmw1iLJNSW9ZmxRw==
X-Received: by 2002:a05:6512:1092:b0:52e:9481:eaa1 with SMTP id 2adb3069b0e04-539ab877d78mr1483038e87.23.1728044329007;
        Fri, 04 Oct 2024 05:18:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:25ac:3f31:db63:541d? ([2001:8b0:aba:5f3c:25ac:3f31:db63:541d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a0aa79sm14483315e9.5.2024.10.04.05.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 05:18:48 -0700 (PDT)
Message-ID: <2737724880dac4cbddaf23d0f5043c74d83b8bc0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] pseudo: add man user and group to fallback
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 04 Oct 2024 13:18:48 +0100
In-Reply-To: <GV0P278MB0241AA7663023F359DE64A1588722@GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM>
References: <1728037005-31667-1-git-send-email-diego.santacruz@spinetix.com>
	 <5cb8922b31b537468a104e48c3f21a88af41514b.camel@linuxfoundation.org>
	 <GV0P278MB0241E4086F65AC9938075ACB88722@GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM>
	 <c8b8242480e395790b8a7c921835834027da5fe0.camel@linuxfoundation.org>
	 <GV0P278MB0241AA7663023F359DE64A1588722@GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Oct 2024 12:18:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205233

On Fri, 2024-10-04 at 12:08 +0000, Diego Santa Cruz wrote:
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> ...
> >=20
> > This change may make it clearer:
> >=20
> > https://git.yoctopr/
> > oject.org%2Fpoky%2Fcommit%2F%3Fid%3Db5dbdfe90497867a70fcdd69a3e3479
> > 52dff7d3a&data=3D05%7C02%7CDiego.SantaCruz%40spinetix.com%7Ce1c23609f
> > d
> > d8496109bd08dce4667060%7C5f4034faed2d4840a93facb1e9633b93%7C0%7C0
> > %7C638636375834304081%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> > MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&s
> > data=3DrNFZhKXj%2BACXIKC5hi%2F0du4S3sGD25f6KFE3oc7oPl4%3D&reserved=3D0
> >=20
> > We intercept chgrp/chown calls so those won't happen on master.
> > There
> > was at least one bug in the way they were working which that change
> > fixed.
>=20
> Got it! Better that way then, no need for my fix =F0=9F=98=8A
>=20
> >=20
> > There may be elements of this which could be backported to
> > kirkstone.
>=20
> OK, so if I understand it is better to backport the above fix to
> kirkstone instead of my fix in the pseudo fallback, right?

Correct.

Cheers,

Richard

