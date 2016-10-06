Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0511E71A21
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 02:59:55 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id b186so243671vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2016 19:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n/bvwotwrmsx+cKg4scFMwNaoW4BbHSbYFHfM7XPtoI=;
	b=hUO8JDBCFy5e3J3pywLFqRFR+uqClvKvYR66WrRMLUTfso9Ey08lyb+cC2WeV74ZjC
	zHC6EgPGEtyVvtq+uiX55jnaouwdA0fA+1MB+MxTbPgp6HnVnQIV9H501vAwUll0QftO
	gWBAHfxzZ1tl13SsAVbtEy1N299jl+TeiwwC8sXpsiBkhNIjJHTNAS/7gHThim5YBCsr
	OgWGAZhbj4I0Rm4Gsx9xqrVuCWSdbXmuimhX6zBwunskjD6NLZrvObryKVJNOk/2QOYz
	qZ10RmY8D4XPQ81Tkzh+K2aGW6YapfIF75HKgErYC3sVgIG9b2Z0S9UhLo6ok+bMw2PB
	W1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n/bvwotwrmsx+cKg4scFMwNaoW4BbHSbYFHfM7XPtoI=;
	b=KyceMqQ0qIH1gIsZz0RCFig5Rqrnhtg+/5ghSugafaYpZkHoXHeZh4izremUJybyUC
	8tG/My80lsJTIECSJG9UBcsUT4TcaEgM8nowlVvKcjYq+4bAjMwRzldDo+ptbdcj4xKl
	gTaNZ/iKNwFgRMbUhAmhBwigSBRzfzEERVEyn3v8ZjvUJJreDyEkI2yuXUGHuHsGqy2N
	b8iq6m1VUWRFbwBpQ79D6I5evLhDjAw4qRq/8E8QLJJKdpZtgsy7veJWVCv/GPzj03bB
	0zfbJy+453BBjeLqIXmyIB0TqfneWIOjX2c0LFka/2NNb4DYypkccl6hKflctT8PWZ3P
	S9og==
X-Gm-Message-State: AA6/9Rk8/k7hiB/jQd4A+bwNIMBs2rspNYbYcE5he8nwhwLjog8mSmFg4MZwUCC6Aj/um7bLxxcx3hrwcCSvjA==
X-Received: by 10.31.120.70 with SMTP id t67mr9740667vkc.140.1475722796980;
	Wed, 05 Oct 2016 19:59:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Wed, 5 Oct 2016 19:59:26 -0700 (PDT)
In-Reply-To: <a3c142bf-8c0b-3f90-dda9-7f72dd4da1cf@windriver.com>
References: <F0CA9E243F4F424B836EAC30E41BF4CF5DF514DB@PGSMSX104.gar.corp.intel.com>
	<a3c142bf-8c0b-3f90-dda9-7f72dd4da1cf@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Oct 2016 19:59:26 -0700
Message-ID: <CAMKF1spG=v7_wb_VYktNBL7NTan28NbB47G7u2B_-E43jBL8vQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: "Gupta, Rahul KumarXX" <rahul.kumarxx.gupta@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: openssl: OpenSSL 1.1.x update
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
X-List-Received-Date: Thu, 06 Oct 2016 02:59:56 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 5, 2016 at 7:33 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 10/5/16 9:11 PM, Tan, Raymond wrote:
>> Greetings, I would like to know if there is any plan / schedule to upgrade to openssl 1.1.0 into OE-core?
>
> Currently 1.0.2 is the LTS version of OpenSSL.  1.1.0 is not scheduled to be LTS.
>
> For the upcoming release (soon), I would NOT expect 1.1.0 to be in it.  There
> are still too many incompatibilities with other components.
>
> For the next version of OE, I think it is appropriate to include 1.1.0, but I
> would also like to maintain 1.0.2 for the time being.  (Beside LTS, it also is
> still the only way to have FIPS-140-2 module, as there is currently no module in
> the 1.1.0 -- and there may not be for a while.)

What do we get with 1.1.0 ?

>
> --Mark
>
>> Thanks!
>>
>> Raymond Tan
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

