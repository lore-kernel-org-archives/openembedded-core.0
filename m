Return-Path: <ruslan@babayev.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 94B5271633
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 23:53:33 +0000 (UTC)
Received: by padda3 with SMTP id da3so4049845pad.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Nov 2015 15:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=babayev.com; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-type;
	bh=JHAKsPUYfsDqqrkl7+1EcKe3SwJwgdIc6lTq2SgqbDQ=;
	b=aozwp5foBfD9glsFL1hoUN+TGX993QsHuNsKdIfgIegaUR9G8fFIhYBRh3/+s319aN
	JjYENZ1P6DPwCXaoE8gqF2m2+Or/jF6AYyO7HCQaia6NoUdM2x9nwLxdFv1b4YUKcki9
	xXvz/EtYYdeb1Xd/07g4yGznDfCh2q8Hyp0d4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-type;
	bh=JHAKsPUYfsDqqrkl7+1EcKe3SwJwgdIc6lTq2SgqbDQ=;
	b=K5D3e4kd24r7cGXtwj2EW6r/kIxA/8GL2g8bGZNWtd+tFEpdoz1M3d4w5BcXIeVsFe
	lVBqUmhuXKtL1u9VMNHCST83TkAAXlDMXNeB8fQe5VXXs9NthV/3p4Mt1pulBA/hh4yo
	UMjO++OcuyoDaGqR8Z3OKm4Fp3UKEAqGrggeARyuclsrlQXW+bPBgk67XiJk8GojVqjj
	N/2YhORyuqGy4hH4zlC6voLKMif3305SeYmR0d+1KPVFyFVeHkg2z/bC6ba0QTgZei7n
	I3iQITZQdST5EZ+WnQEMFiDVD6qTaLWPKc6FHBttLYOu5Bee19jUuPpRNKAtzXdvy4cR
	jfmw==
X-Gm-Message-State: ALoCoQmS0LLHzMAkK4joJjC54+e0EOCeIXLPi62i0OP65lEGCD9cM6j9d7F6Wty1CBRwVH5xwHNb
X-Received: by 10.66.123.68 with SMTP id ly4mr14607394pab.147.1446594813819;
	Tue, 03 Nov 2015 15:53:33 -0800 (PST)
Received: from localhost ([50.247.64.110]) by smtp.gmail.com with ESMTPSA id
	tn2sm31619666pac.0.2015.11.03.15.53.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Nov 2015 15:53:33 -0800 (PST)
References: <87d1vqk67s.fsf@babayev.com> <5639431F.6000408@gmail.com>
User-agent: mu4e 0.9.15; emacs 24.5.1
From: Ruslan Babayev <ruslan@babayev.com>
To: akuster808 <akuster808@gmail.com>
In-reply-to: <5639431F.6000408@gmail.com>
Date: Tue, 03 Nov 2015 16:53:33 -0800
Message-ID: <878u6ek2k2.fsf@babayev.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Add LibreSSL support
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
X-List-Received-Date: Tue, 03 Nov 2015 23:53:35 -0000
Content-Type: text/plain

Hi Armin,

It is the latest stable. And it looks like this patch has made it into
2.2.4

http://ftp.openbsd.org/pub/OpenBSD/patches/5.8/common/007_obj2txt.patch.sig

akuster808 writes:

> Ruslan,
>
> any reason version 2.3.1 was not picked?
>
> I believe 2.2.4 is missing  (CVE-2015-5333 and CVE-2015-5334)
>
> - armin
>
> On 11/03/2015 03:34 PM, Ruslan Babayev wrote:
>> Please find attached the patch to add support for LibreSSL.
>> 
>> OpenSSL is still preferred, so you'd have add these to your local.conf
>> 
>> PREFERRED_PROVIDER_openssl ?= "openssl"
>> PREFERRED_PROVIDER_openssl-native ?= "openssl-native"
>> PREFERRED_PROVIDER_nativesdk-openssl ?= "nativesdk-openssl"
>> 
>> 
>> 


