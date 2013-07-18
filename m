Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4845E6B118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 09:20:29 +0000 (UTC)
Received: by mail-ve0-f181.google.com with SMTP id db10so2264385veb.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 02:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=IoaOxCnAaLdsJkhsoqgzxT3Wqv7gNcDuNIgKFzSgZ2k=;
	b=imw1FpYoeCrZjHAGD3Uf5nyXN3Eh1LoxgjEIZ5+ZO8oI/fIp10BN4rpyho2W6LQU5L
	9D1IWfmfcvL+tgAtoq/yqHcpsbvYFF4vaPwAnOIjomj1peQ3mMq/FvgrgpqpxajF/b15
	3beaBf6HMC2DsGR7IdlOYu+pwEGmzDbY+d8gmlKydtUIiZQsqq/6KVFd7aeYv+I2qWBS
	yY4+fVui8YqmKA+CvDpeXRhw78M+x57iPa7AP95ZpSXmpRi7u+UhXNlt6wp+USjPHjjQ
	bZO5BIcnfKHnCbYHHyrDZoT3KbGScgME8Vm2/aL/5mQsEJNlTmTRGNcev8ohJsoDk7dW
	/Siw==
X-Received: by 10.221.4.138 with SMTP id oc10mr3761047vcb.26.1374139229693;
	Thu, 18 Jul 2013 02:20:29 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Thu, 18 Jul 2013 02:19:49 -0700 (PDT)
In-Reply-To: <51E7ADF6.3040506@windriver.com>
References: <cover.1374050133.git.sen.zhang@windriver.com>
	<c95d46b97c8167bddcffb4495438227b668e87cb.1374050133.git.sen.zhang@windriver.com>
	<1374057911.2651.118.camel@phil-desktop.brightsign>
	<CANyK_8fG5LJRBVzRQZG6BVbn-AjTgY0CMwStL47qgu0eVvMcig@mail.gmail.com>
	<51E7ADF6.3040506@windriver.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 18 Jul 2013 10:19:49 +0100
X-Google-Sender-Auth: 2TqIvxE8YGinjgDuZe1u2Jr65mY
Message-ID: <CANyK_8e1f5A6+GqS-5sOBUSjt1Ewn_zp=MTwHqSPQ_ezM5sOPw@mail.gmail.com>
To: Jesse Zhang <sen.zhang@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libatomics-ops: force omit frame pointer for x86 builds
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
X-List-Received-Date: Thu, 18 Jul 2013 09:20:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 18 July 2013 09:57, Jesse Zhang <sen.zhang@windriver.com> wrote:
>
> But, I looked at the upstream git repo, and it builds fine. I located
> two relevant commits and made a patch. Please see the new fix below
> (also pushed to my contrib repo).
>
> I'm not sure what the code does exactly, but it at least builds now
> with whatever flags.

If you want to know, see
http://en.wikipedia.org/wiki/Position-independent_code for the meaning
of PIC and GOT in this context. The rest is probably just gcc
weirdness and the way it uses registers to store the frame pointer.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

