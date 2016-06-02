Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id A585877433
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 15:00:59 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id t13so1244439qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2016 08:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=AiHrLXTAeY9nzXkxJM67Eh+BmboNG9LtfHaYdlo6qXI=;
	b=qEYN5w9FFzKJbOxQd7EpVrRvY4g3B5ltBGv5kXWZGbwq4rjBmi2YogslDTcnBxkbdZ
	0YE9KuQhwrDVYU+tFfEEWEjWsiiman5J0CcQSO/xHylYxAkKELSyj00hJhE5zn82L7UZ
	76DF7FfIqHoQ8ETibzoZlJtmPhMcsxlQo+c/Y5+k7ZfmCDruuNhIITn8YwU2oNhtiK8y
	12tf1n2C41Z+e2kKou9LbqiI5FA45W+9viys+qRsT8kdaMTrLd9zPGPkVd4e5HkNfhJN
	wEJeGp7iNw4FcQXFgKU0LWIPQOxNj8FlyalCyXCaETSnTbYvmx15bPyK4v1h98+hirRk
	Hzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=AiHrLXTAeY9nzXkxJM67Eh+BmboNG9LtfHaYdlo6qXI=;
	b=hsJ16XNK3rourGgQgTRhDLwu13xdqjWA0ntO4kayZjd3sUKdEva/hpqukVUC8ajgft
	CBEmCDYDQsTdZl2dVLQWuwP5cf5SVhgHHa3OsVo2HwdjOn9uo74zzzaS5AED8H1l7vIB
	g4MAxco3ZG+HibMQIDFnQTZY7CDdzxVWA86GjrDGi3dV9ztfsk5KzC9qc5jf3m2cShAX
	+ENtSHPg0huLxxOVgejuLvAGmBkSM1Avvq9Xd0zc3k517XB8eC0RXMVSErwesT4xJJIl
	fE1un+lTbF4XKyAsEyRMf4cfzCoOEbIDkLMOWRcx2pGjymDP0EFXAIXTk/Ps+pqpdd6S
	lkTA==
X-Gm-Message-State: ALyK8tLc7UZS0WvknRdXUHDKZEY3dA5VMZUR/+8a6HwBFEQsPkxMRUUlg7PYGPXFqSqr2Q==
X-Received: by 10.200.37.239 with SMTP id f44mr9531789qtf.57.1464879659699;
	Thu, 02 Jun 2016 08:00:59 -0700 (PDT)
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com.
	[209.85.220.180])
	by smtp.gmail.com with ESMTPSA id b79sm255475qhb.19.2016.06.02.08.00.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Jun 2016 08:00:58 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk0-f180.google.com with SMTP id n63so38307725qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2016 08:00:58 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.55.99.216 with SMTP id x207mr18629643qkb.163.1464879657888; 
	Thu, 02 Jun 2016 08:00:57 -0700 (PDT)
Received: by 10.237.54.197 with HTTP; Thu, 2 Jun 2016 08:00:57 -0700 (PDT)
In-Reply-To: <3646067.LvorxU5kj3@peggleto-mobl.ger.corp.intel.com>
References: <20160527102831.24166-1-otavio@ossystems.com.br>
	<1464645472.19134.107.camel@linuxfoundation.org>
	<3646067.LvorxU5kj3@peggleto-mobl.ger.corp.intel.com>
Date: Thu, 2 Jun 2016 12:00:57 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr3Wt9EYUQEbJHyh4sBSkYb5k=r0egUPpv_RodFnPy2Sg@mail.gmail.com>
Message-ID: <CAP9ODKr3Wt9EYUQEbJHyh4sBSkYb5k=r0egUPpv_RodFnPy2Sg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ca-certificates: Add openssl as a runtime dependency
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
X-List-Received-Date: Thu, 02 Jun 2016 15:01:00 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 1, 2016 at 8:31 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Mon, 30 May 2016 22:57:52 Richard Purdie wrote:
>> On Fri, 2016-05-27 at 07:28 -0300, Otavio Salvador wrote:
>> > The update-ca-certificates script uses the c_rehash utility which is
>> > installed by openssl. Add openssl as a runtime dependency to fulfill
>> > the utility requirement.
>> >
>> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> > ---
>> >
>> >  meta/recipes-support/ca-certificates/ca-certificates_20160104.bb | 2
>> >
>> > ++
>> >
>> >  1 file changed, 2 insertions(+)
>>
>> This broke allarch machine signature invariance however I merged a
>> patch to resolve that.
>
> I think we may still be missing a build-time dependency for
> ca-certificates-native:

Indeed; do you handle it or want me to send a patch for this?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

