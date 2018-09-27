Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
	[209.85.210.54])
	by mail.openembedded.org (Postfix) with ESMTP id F137379762
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 18:52:33 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id o13-v6so3612689otl.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 11:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fOQG0otE2YThBAZqapQ7t/xD8FgmIGy6N9yu/cIt4bY=;
	b=Mrdx/pkopEZMMjaLteOAbWlpUWa894aPs1fhMqA7LKJpNALzSZXpS+29RzSnktGGW5
	8h7m9c8sCVOdjhyb7xouWx/4PtrV4HOzUMYFWDzcYx6FJxwKuzRnB7Ichyk7DRFfZ04n
	K1YqJdTijYgdx59eau+VJsGDc9kxzSI2NbTjDbakc3YOC84HeT1SSZ0Py1+TaDAiNGwP
	IJNWYlUvpJgXXPjNKUjlu6Jva3A9TPvWNs8f1tSLRf903Wi4OioBwe6BIR979+adURXi
	clvWb9GsmDSpViCI6TL4QAOcC+TIc8SiYIUPpzJ6dtTZu4kOpqK2z4bhhcZK5Mb6ueKe
	T7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fOQG0otE2YThBAZqapQ7t/xD8FgmIGy6N9yu/cIt4bY=;
	b=rBNu3B7GmiiFBXFCCDPWDIcWldb+0c4oxAtWjMiHnibCWf7KxxFCbxpWJFaVztzU11
	yrSehQPbKdDZQaPkZoMcig6L+N14iH8mQkzaiT7bRNRY7ORB5zDfDWsYnHdWKy4bcY1D
	u16TdxczI+1qWgx7RXYiNYWEJUvF/Q0tdrI49EA2HN1PoHpbUqxNk9+mOy6xl3fDvEdF
	fW2srBvWdcZ4HCDhCuOdQuATrWOm1biKNF8AnUHyVzL2FQ5tXDzsGIfBpJahB4Xt6bYC
	kCR8PTuphdduD3fuxaM/LUy4bcbkYwYh6/NPVrW0jV/h1z+EJjmlXUbNP/1qqBrLVAP4
	BY1A==
X-Gm-Message-State: ABuFfoicKxYKgFO+TpFk+6pUXlat12Eyo+SIlEEL1eM4/9acdHmOshtP
	a6EHZETn7X4Sb0mPLrHiVgVSRQ3Ovvyfy7gIQpY=
X-Google-Smtp-Source: ACcGV62wlcXv4SonWGRwot5PH8bIujMlv4ZEc91M1OBCM3jrQylH4F+4KV757ZvOzxOp4VYKb6hcTKM+1kU8JltA/Bc=
X-Received: by 2002:a9d:44ae:: with SMTP id v46-v6mr8189635ote.3.1538074355081;
	Thu, 27 Sep 2018 11:52:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:490c:0:0:0:0:0 with HTTP; Thu, 27 Sep 2018 11:52:34
	-0700 (PDT)
In-Reply-To: <CAMKF1sptrEhQPgRf1kdq4oG8i2CpFQxpPR5mNb=4mRGEYSXvvA@mail.gmail.com>
References: <CALbNGRSPiWuTyLqaWbiH3UDF-maBQusnrbPCH_eWCxzm7n5rPA@mail.gmail.com>
	<CAMKF1sqGCuANwBQH6ZKuNUs1L+7N=WQSxAu1RmWjUooVs5bvxg@mail.gmail.com>
	<CACS+7ZQngcTuxFbyq9Ydb=unRp0raKomB4UbutKNWTHtC2V-cw@mail.gmail.com>
	<CALbNGRTWz-_FPAuCZZRr2baakz99h+3UJpJAF--H0d_jx1od3A@mail.gmail.com>
	<CAMKF1sptrEhQPgRf1kdq4oG8i2CpFQxpPR5mNb=4mRGEYSXvvA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 27 Sep 2018 20:52:34 +0200
Message-ID: <CALbNGRQEHUnK=D0R4ffoBe192_m5=cvLNU5AGkB8HCQOXdiG_g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Run experience with security flags enabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Sep 2018 18:52:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 27, 2018 at 8:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
> I sent it earlier today see
OK thanks!

Andreas

