Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73DDAC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 12:27:33 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.31135.1702038452604861862
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 04:27:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mgu9bFO6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40c25973988so21707525e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 04:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702038451; x=1702643251; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1+yHWV4cvRUpbHF/bGO7iWHOWpL6rExzN166w/KrN3g=;
        b=Mgu9bFO6WPAce+5eMCkw7vh9sZDJw/bqaUql3uApOB9/Cdt3cv4cbgyKzae1Lvt52E
         HVRqYH6FjhzAcK9vCDhqTi4Pnpc7gvW5wtQwXQxnc5mgRiuN3q/A5OdZda5dkcno6XBT
         NCluHu1dNlbdrpRS2VstyEYBwxOs7r4xvSWtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702038451; x=1702643251;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1+yHWV4cvRUpbHF/bGO7iWHOWpL6rExzN166w/KrN3g=;
        b=Bk7cSqbKHkhiA+UWAFldKrehxC2zTCSN06V1BNkVppBHWt5B5dkRK2Psnq3CbnPhU6
         Eo6sw0XrnuwleEmhjknHbuOIOIkI5vKuOO5jC4i+A/FoqHOaRrBgS/79iWEsJtyX7A5p
         Dq2W3FZqNqmZNtlMg791X8x3Yr+kAg9MBmWu9EtIs4pOdwaU+hsOLhYA6EAKgkWE2uBj
         l+T90PaOrDq1S7QQiobJ9wgr9Zj9xZN+MRdKkgi+2Ozlxwp8H0kR5Lk+vRoC1n1okuZu
         IQwPnhpUuqZBBqVXMaUVjaON7CQygABsMLgTCB/EWfKaG+CRJEmC+q70A3fccoxLjuNT
         v/6g==
X-Gm-Message-State: AOJu0YxmfOqa25sjUhS4/bnCjDoNuDtJIRXl9k+udygXms5leKYLsBIV
	eZLFmA4VjgbXG/5c6R0UEh2sYqGk+fB81SfXbus=
X-Google-Smtp-Source: AGHT+IHlyJMSxZ8lFDWw/V5mG5Xn2D9bjognsvwgmGt4xOc/ZHNmyqMcQhVhhNtn2guir996SeFrNA==
X-Received: by 2002:a05:600c:1994:b0:40b:5e21:e264 with SMTP id t20-20020a05600c199400b0040b5e21e264mr2483028wmq.81.1702038450903;
        Fri, 08 Dec 2023 04:27:30 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b? ([2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b])
        by smtp.gmail.com with ESMTPSA id j13-20020a05600c190d00b0040b478da760sm2685327wmq.48.2023.12.08.04.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 04:27:30 -0800 (PST)
Message-ID: <1e83f69066bb57785aea9e2fbfb81669672f6092.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 6/6] oeqa/selftest/sstatetests: re-disable CDN
 tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Fri, 08 Dec 2023 12:27:29 +0000
In-Reply-To: <CANNYZj9+3AwPdtXSFHyAab1sDzPZMHf9GyjN=1MX4B+R7XJ-Zg@mail.gmail.com>
References: <20231208101522.198832-1-alex@linutronix.de>
	 <20231208101522.198832-6-alex@linutronix.de>
	 <0b9ea27634ed3c7ccdcd74de9cd8418d893e21c5.camel@linuxfoundation.org>
	 <CANNYZj9+3AwPdtXSFHyAab1sDzPZMHf9GyjN=1MX4B+R7XJ-Zg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 12:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192054

On Fri, 2023-12-08 at 13:24 +0100, Alexander Kanavin wrote:
> On Fri, 8 Dec 2023 at 13:22, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > Crazy question - for the CDN tests, why don't we try just setting a
> > dummy SSTATE_DIR, then "bitbake <images> -n" and check the "State
> > Summary:" line in the output?
>=20
> It would be good to know what is missing though, not just how many?

Ideally, yes.

You could do that with a -DD option added and filter the output for the
misses?

Cheers,

Richard

