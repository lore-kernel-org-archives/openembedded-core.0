Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF4C6C519
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 10:01:05 +0000 (UTC)
Received: by mail-it1-f179.google.com with SMTP id g85so8780176ita.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 02:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9SnGzxp1nTLaWm7Cn5ULLf/Izfms0GJdJ05c5jbohfw=;
	b=MXpyyxS86iEyhBPWvuANAN3brmV04YdM/9xaz/YP4NGzBCmRvr+qiB0not7J1Z39xI
	HpJHYMQ+OX0V52CY3TWp9VGQU7/397XQZKxak4seWZ5YCpvI0cMbo9WiHU3GQ1L3Qb5d
	He60/5Hzyg0yMFX9JhEZpU5CMCaZmg8ZPsUGuzUllINx8T17oicAcCXRVqsXSs727JqG
	0CbrQkyV4KnikW3Hrs72iDzRScMde1TEIlwsYBJHsiNJSPMgJsLFOVn8MQEs86iPVh0m
	nHKhGCIEBEUeCPQvIByO0QqvfD4fh/dBUnOm6qCijCvAtveJFPvbvTuhWUch4Fnd5RV6
	mlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9SnGzxp1nTLaWm7Cn5ULLf/Izfms0GJdJ05c5jbohfw=;
	b=Edo3oxu+oiPmfcAgLo30DmIUtcZIDknN3P362X5o1mOoSh7iK/OXnLm4yGPR+CmFcn
	HLRTuAI9TnCDJYzJCJFO0gaor2FBGzt7bi+DXAfwbwtRw0xNv6dQMt0bmE9zTir4WwoI
	eCTPdfWF8UwJhBtriXObwHBmHJ1f9lKcwL4qJ4E6OQPVvhFrwv1b+OTs+8rQWRXb2XEH
	cF7D9o/1NNlWYkL1CdFh3JzeZXrPzR2G1YMqMP3rmPsbtb8ZP/31ncBW4lCKuEXkfTMh
	LKpFHO3xQzu6jZ9QoqcY2EOxlyDS/82jIrJ4C+BXwE+M+LycBeVA0RjqS2MRLBCndOQG
	r4Qg==
X-Gm-Message-State: AA+aEWa95bDKGMAbrPBtqzBoj4CKXr0B1bF96GRG8glum45uwzt789G1
	mVt/skkG/Ixt7UDg3bR4ZqWbIfoQIrgy20wWO/H76A==
X-Google-Smtp-Source: AFSGD/VfsHmOkCEHsKtvBA89QhkGaftVxo7qf5rjfHmEhNakORRuxDqz7pyXY2+yEpcb3WRyNFGdZMYy1L7yf2/ja1g=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr5537134itj.62.1545213666613;
	Wed, 19 Dec 2018 02:01:06 -0800 (PST)
MIME-Version: 1.0
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
	<E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
	<CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
In-Reply-To: <CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Dec 2018 10:00:54 +0000
Message-ID: <CAJTo0LY=EtEJpniVngfbkxbg3ibnEY9qvR18kOSpjFejh_tomA@mail.gmail.com>
To: Bradley Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, james.feist@linux.intel.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: flto automake
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
X-List-Received-Date: Wed, 19 Dec 2018 10:01:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Dec 2018 at 01:07, Burton, Ross <ross.burton@intel.com> wrote:

> That however leads to the question of should we just change the
> defaults? Does anything break if we use gcc-ar instead of ar?

Answer: yes.

| x86_64-poky-linux-gcc-ar  rc libgcov.a $objects
| x86_64-poky-linux-gcc-ar: Cannot find plugin 'liblto_plugin.so'
| Makefile:932: recipe for target 'libgcov.a' failed
ERROR: Task (/home/ross/Yocto/poky/meta/recipes-devtools/gcc/libgcc-initial_8.2.bb:do_compile)
failed with exit code '1'

I don't know enough about gcc...

Ross

