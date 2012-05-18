Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SVKiK-0006ys-QQ
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 12:47:16 +0200
Received: by wgbdr1 with SMTP id dr1so2363434wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 03:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=6/+kfYNNZrKJ5HlNNR0h7XGpHZ8N9CAADFPTcAZRxhg=;
	b=FgfDxp/kJBmNNlKgi3Ojb8/Vn0ozU0v9j0lTsmtCe9RDCAw3SRE1Botim3lZdexXzl
	pDt69ri6D9uGFYBIwp6AkOHnPh00tyu8O2sk7tA5X4kJnb0Ut5CMVcIurq4JJFQFq1BX
	FScwbbZ/C3IVIuL6UY+67fug34J/klVEiIPtcqHefgecZi5Vko9TaJvAFnQU9iBmBLKQ
	1ze+pWVWndJyjRFLzEkISZLNfqOaImfX8EMAvko8ROx5u4hTJfYyu7OaDSeUVoSzfzFA
	YGfS43w4khLFdyR1BWrg6tSMh/wTPov0qE/PyPDgBJ7mdgdrcwaFZga5j6/G5dCUUr+f
	AQtQ==
Received: by 10.180.98.39 with SMTP id ef7mr173939wib.21.1337337433168;
	Fri, 18 May 2012 03:37:13 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fm1sm119863wib.10.2012.05.18.03.37.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 May 2012 03:37:11 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1337336951.28145.0.camel@ted>
Date: Fri, 18 May 2012 12:37:04 +0200
Message-Id: <532F4AAC-BBB5-4913-A629-DC6DADDCDD68@dominion.thruhere.net>
References: <1337074341-12708-1-git-send-email-koen@dominion.thruhere.net>
	<CAMKF1srxyZkjFe+aypM_X+Wgyd-8b1X664Y8jWQuPF=xijeg+w@mail.gmail.com>
	<1337286572.7473.10.camel@ted>
	<0FEE2025-8E84-4CBB-8568-483A55233BD7@dominion.thruhere.net>
	<1337288563.7473.24.camel@ted>
	<73807C59-D904-44D4-89D6-50B9C268B911@dominion.thruhere.net>
	<1337336951.28145.0.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlA32haefh2pd5ZbhLK9h5TJ0Wv/YQeiGCm244iW65w3Y1ZV5UErENbzUWoXD+xrzg2OC+C
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kmod: Use base_libdir for installing libkmod"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 May 2012 10:47:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 mei 2012, om 12:29 heeft Richard Purdie het volgende geschreven:

> On Fri, 2012-05-18 at 09:52 +0200, Koen Kooi wrote:
>> Op 17 mei 2012, om 23:02 heeft Richard Purdie het vo
>> Those QA checks are a joke. I can fix the QA warnings by moving all
>> kmod binaries to $bindir or $sbindir since binaries in /usr/bin
>> and /usr/bin are exempt from the checks. That would break the
>> split /usr case as well.  These checks are global as well when they
>> only should apply to recipes needed to get /usr mounted.
>>=20
>> That's why I consider the current checks misguided and harmfull. As
>> seen from the breakage it allows people to break pkgconfig, which
>> didn't get picked up by QA checks. And then it turns out that you an
>> fix the QA warnings in such a way that it breaks the intent of the
>> warnings.
>=20
> So we need to improve the QA checks, no argument here.

Would a new, additional check for /lib/pkgconfig/*.pc make sense?

>=20
>> But this is all a false dillemma, you could have merged Otavio's =
patch
>> (which I Ack'ed) which supports split /usr and puts the pkgconfig in
>> the right place.
>=20
> I likely still will but I was worried when he replied saying it still =
needed more
> testing. I took your reply to the consolidated pull request to refer =
to
> your patch.

I was indeed very unspecific there, my apologies.

regards,

Koen=


