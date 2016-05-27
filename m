Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id CF98E60670
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 09:55:32 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id f8so12079756pag.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 02:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=tHjLuPfuRuXk2RfG6L3QCQ2xdLZiEpUO/ar6Os7IFMo=;
	b=Hh3bGOBAHRTPBW/66beF5qD7okHNFWtY3IlrYmPGhYrlD5XAhaAK85WiRvx6p089Jg
	1cwqHGNarudi6gh0GD+DvTSOdpbRk17DRv40dsKSogWvNWvaZSH3EkRXEQgn5h4yiMfJ
	ttOuIeJE+KJ5qCoLaPQIfM1wEzmFxmO25sG+tkAkxBdO9mF0JHljVU3XAw6mLuH3PA8k
	5DuTMWUB2n+4ooc3ENcl4CiLBEeFIj5zga7hsVLqa0lwwu1Ed1z1ONdvjw5UpYWlfRWA
	Oh413YbDYoNFRbmYsymvnbSefVCuoWkmNTKN4SlytqeBRpwO52MBmeViKJ4gbEhOAqHq
	JNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=tHjLuPfuRuXk2RfG6L3QCQ2xdLZiEpUO/ar6Os7IFMo=;
	b=hO6aSVHWPgDzA23ov0e2g14wL9yqM29LdCyDqU9Xh6Vd59YbG6LTx0RV8XT7wFd3XO
	/bzVBLo+ueciMOcP0wSjAJuVfGATVKnoS9e1Davk6XNRHvp/wSEFQHd8zt39ThfGo9tI
	rrIEh4F+BB6i4Irwpyc3J1+6ddaF0ivJBm4IQ22oQ7PG5JV3YuoGN/u1pH+ULzn3a9Ck
	8bkNboaVlKBx9ohHYytf3RkqzgzBxpa6+EVtR+WEvmBhJ8I7ZJo8Tpcy07z20Tywc436
	5FBoqQqU9p7xAbcuEbCq5d3UR7FGziH8rwHwEAjohAd6LIVnEKlrk/noaYMYdMJIFvEB
	MvDg==
X-Gm-Message-State: ALyK8tJjj816A6/SrPQF9gfGAYQSfo5Fb10y6xUYCmOHSpad2cY5FGIH7BxEMPCaL/U6zA==
X-Received: by 10.66.50.105 with SMTP id b9mr21083152pao.122.1464342932955;
	Fri, 27 May 2016 02:55:32 -0700 (PDT)
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com.
	[209.85.220.44]) by smtp.gmail.com with ESMTPSA id
	x123sm12298899pfb.54.2016.05.27.02.55.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 May 2016 02:55:31 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f44.google.com with SMTP id xk12so38741384pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 02:55:31 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.6.35 with SMTP id x3mr21055694pax.135.1464342930831; Fri,
	27 May 2016 02:55:30 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Fri, 27 May 2016 02:55:30 -0700 (PDT)
In-Reply-To: <1464270076.19134.19.camel@linuxfoundation.org>
References: <1464036327-4826-1-git-send-email-otavio@ossystems.com.br>
	<1464270076.19134.19.camel@linuxfoundation.org>
Date: Fri, 27 May 2016 06:55:30 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqGzsGm747bAg2N_z-mu-jXt2PB1mFL-2r7-dyNnxC8og@mail.gmail.com>
Message-ID: <CAP9ODKqGzsGm747bAg2N_z-mu-jXt2PB1mFL-2r7-dyNnxC8og@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Improve SSL certificate handling
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
X-List-Received-Date: Fri, 27 May 2016 09:55:34 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 26, 2016 at 10:41 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2016-05-23 at 17:45 -0300, Otavio Salvador wrote:
>> This patchset leverage the OpenSSL certificate handling so it works
>> aligned with Debian and other generic distributions regarding where
>> the certificates are stored and how they are installed.
>>
>> This all started when debugging why SSL certificates were not working
>> properly for a customer which was using QtWebEngine. It turned out to
>> be the integration which was not complete so this patch addresses it.
>>
>>
>> Otavio Salvador (3):
>>   openssl: Add Shell-Script based c_rehash utility
>>   ca-certificates: Use c_rehash utility
>>   openssl: Ensure SSL certificates are stored on sysconfdir
>
> Initial tests were ok but we've just seen:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-oecore/build
> s/792/steps/BuildImages/logs/stdio
>
> I've not looked into it but it would seem to implicate these patches :/

It does seem to be caused by it. I sent a v2 fixing it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

