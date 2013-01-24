Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TyLUc-0000EW-Aa
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 13:01:19 +0100
Received: from mail-da0-f72.google.com ([209.85.210.72])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 24 Jan 2013 03:45:41 -0800
Received: by mail-da0-f72.google.com with SMTP id r28so9359968daj.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 03:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=LqFHzQ+7gYpTzU+JnNwhA0o6ohb2OfEE73MK5DkGNsA=;
	b=Vd2GonxmZTwzxUftOAebIg5Y9Z51TwcqBa+MQiUAu9RQ5Q7rmJ44w0YVVibQm7ASRE
	vYf6UH3q6mmi1qhC3LxudC7AMabMNkKo6rB9b4Brznxg71/rSfstjU1R/hoZiL4xhCIH
	bf3TGKlNla1yMelGS4T0L9fmRuNd0BrFuGEsCFT1OPxGu/rQ/VTKF83B3b/VKwTEL3Ta
	RkADaD/slQF4bQId6qs2cVhzcG4hMBAFWq9jjZHYrNhv4V8HoxywqcQ+aaU8pLLLLOhc
	NYeTBnsmD9CUfF96sFngeMGG6APrqDB8f1kvWJMOzIGewqz0lqKV0uqb45SnxVT3X71p
	1uCA==
X-Received: by 10.68.130.195 with SMTP id og3mr4192595pbb.10.1359027940931;
	Thu, 24 Jan 2013 03:45:40 -0800 (PST)
X-Received: by 10.68.130.195 with SMTP id og3mr4192580pbb.10.1359027940815;
	Thu, 24 Jan 2013 03:45:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.66.253.233 with HTTP; Thu, 24 Jan 2013 03:45:20 -0800 (PST)
In-Reply-To: <1359027432.3616.7.camel@ted>
References: <cover.1359014474.git.Qi.Chen@windriver.com>
	<c60b41bd635d38aa01ffdd5c6221fd1a9c34b68f.1359014474.git.Qi.Chen@windriver.com>
	<20130124103150.GA3012@jama> <1359027432.3616.7.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Jan 2013 11:45:20 +0000
Message-ID: <CAJTo0LY9sXyoe9=rgGtstf3umrA+XeLJ1bDbJkM9S9bsqpA=HQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQlKF7yoUuoISLUXBYjqv4miYRBS/utr40gbw+Uw+akUm4ARuSgLxJPxRwIXIkwMoUio11VhvkkoVaUS933R+201N2EWsl2z1dNA7Df4T+jURJV8iqg9ioNAzT5y1uAN/Flrl7V3Di9hofOUMLd0ngCWqJJg0b57Kg9hRekRy4qsL3eGzcoEmMyzYE2FlJg+XJMJb+fL
Cc: openembedded-core@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 05/12] volatiles.bbclass: add recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 12:01:22 -0000
Content-Type: text/plain; charset=UTF-8

On 24 January 2013 11:37, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> > +inherit ${@base_contains('DISTRO_FEATURES','sysvinit','volatiles_sysvinit','',d)}
>>
>> Does "inherit " work?
>>
>> I mean empty inherit when DISTRO_FEATURES don't contain sysvinit? IIRC
>> it will fail to parse.
>
> The above syntax does now work. A plain "inherit " won't but something
> with an expression in does get handled correctly. It did not used to
> work with older bitbake versions.

The syntax works but that expression won't. If sysvinit was backfilled
(pending patch from Marcin) because the distribution didn't pick
sysvinit or systemd explicitly, the backfill happens after this
expression is parsed.

I'm testing a change where these tests happen against
DISTRO_FEATURES_INITMAN instead now.

Ross


