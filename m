Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6590C54736
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 20:41:40 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.858.1724791290993001529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 13:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RTG9JkhT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4280c55e488so316385e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 13:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724791289; x=1725396089; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z+mQZrD+hmVdeqV1vRF8NFmTx//XN0UnsgXjeirEt/s=;
        b=RTG9JkhTkWfpiFDq1Ha+BE7p9KZDy4ek2RXm3E5j+TZHaINIi303Rr54uwRm+/VPGU
         uWSND82hppssogOCPrTYeGFVzssumYT3eyVKCOfvPGgTZdLg8AKlLQwliNJWUXAdQBbD
         uKXYpQTqFdlW2o9nawgssqpQoORC2SXuOk9KU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724791289; x=1725396089;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+mQZrD+hmVdeqV1vRF8NFmTx//XN0UnsgXjeirEt/s=;
        b=GRXRtOQOxxnXYAHjPAhjJ1JMa4WJLecU6lzCLQHk5Toz9yPrW6Sny8+qZa8ZKnssKx
         BGLz273p+ItDTdwSX3Kpo7CpfI5Z5+Gt+SxBWGUG95i0VJioSLTp6u8533EcjAR1ZcIs
         pZoo9tnpzNjTDKc592Zj1jo81OXK79pFevUfSFyVP1SpjtUM+OfyhnIMCO+RUb1KEltP
         UqX1yZeWhm8V+AuDtsVxvdw26mM/E6cfK8YF+UvdYjfAidkbXh5J6WNNBfbz9SMjRv5h
         iekbFoFvuxR61aD4HdC4ByzoPYwJ+sFbu/zsRT/5sL8WyFo9rpf47MuqA57AksWsz2vx
         tbeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlTWQ15hdGZf7DlhBsHu0xi7eC0cWXiQ7lZuFGalrmy7XEIUx3M9a85+4g3fRhn/kvM0rTDxmK5xcSXIMbo1OW2w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyhVsHF/DAvBX0MhUagjxT/DV92ydwjP4mXUiMIJQrt8AzNwSCG
	Wgzf68cXEMZUFI3iyGyyJuHDYBcLk3qoV//YqzKRaQnGcSHOcVGahSxlQws242o=
X-Google-Smtp-Source: AGHT+IEGztvbmItc18ptzDIMCQZjH8drBFqwDkJ2xwSskPmoFhontPi4/gE3fDhbn0L9sTTMt91bqw==
X-Received: by 2002:a05:600c:3508:b0:426:67fa:f7 with SMTP id 5b1f17b1804b1-42ba56a9968mr52305e9.9.1724791289175;
        Tue, 27 Aug 2024 13:41:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2440:b6ac:ba90:6483? ([2001:8b0:aba:5f3c:2440:b6ac:ba90:6483])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac5180106sm201776945e9.41.2024.08.27.13.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 13:41:28 -0700 (PDT)
Message-ID: <bcf7e4329803a86e3f9cf8ddf3b62564ee5e8532.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] rust: Upgrade 1.78.0->1.79.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com, 
 Sundeep.Kokkonda@windriver.com
Date: Tue, 27 Aug 2024 21:41:27 +0100
In-Reply-To: <CANNYZj-ozQ+3JPRCJyigf2LFJnAzsWNWK7dtfORzZH_Jz+bLuw@mail.gmail.com>
References: <20240825170553.566798-1-Yash.Shinde@windriver.com>
	 <20240825170553.566798-2-Yash.Shinde@windriver.com>
	 <bbbe564b9b6191edbe62abd69fa3b337ada2ad4a.camel@linuxfoundation.org>
	 <15bf0cae-b114-4ac7-89d9-3f7df77b41bd@windriver.com>
	 <CANNYZj-2yiGpKNc1Jcc6NO8+8MhNYiYV-3xh3BbJqTw4nyJT0A@mail.gmail.com>
	 <1356a3e7519ffca6f65810ea2953429fbe08fa1e.camel@linuxfoundation.org>
	 <152b3da8-8d5d-4dc2-ad60-ab03bc4b361b@windriver.com>
	 <5216855652e912043a3b7a06e1d76956d2babdd7.camel@linuxfoundation.org>
	 <17EFA275ACF95534.20373@lists.openembedded.org>
	 <17EFA28FD32C2C48.20373@lists.openembedded.org>
	 <CANNYZj_p+3JR8QtntEB+PktAhuuxOg7e-dbHv+1nFC=SzzVcSg@mail.gmail.com>
	 <a16d7b2506544ee5ac1df57e98bd160126dcb4b1.camel@linuxfoundation.org>
	 <CANNYZj-ozQ+3JPRCJyigf2LFJnAzsWNWK7dtfORzZH_Jz+bLuw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 20:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203862

On Tue, 2024-08-27 at 22:38 +0200, Alexander Kanavin wrote:
> On Tue, 27 Aug 2024 at 21:51, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > Shouldn't rust complain if it doesn't work with old compilers? Are
> > the
> > compiler requirements for rust documented anywhere? I'm reluctant
> > to
> > throw buildtools at anything that breaks. In theory we also would
> > need
> > to change the sanity.bbclass compiler versions tests and so on too
> > :/
>=20
> The specific error seems to be about libz-sys, which carries a copy
> of
> zlib and that is built using host gcc - I suspect that somehow alma9
> gcc is used incorrectly there. This could be a problem on our side,
> I'd need to first try building cargo 1.79.0 directly on alma9 and see
> if that breaks too in the same way, or not. Don't have any more time
> to look into it today.

The failure is building cargo-native iirc so using the host gcc would
be expected there?

Cheers,

Richard

