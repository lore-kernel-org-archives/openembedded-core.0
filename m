Return-Path: <max.oss.09@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id BD6DC734B8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 07:49:50 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id bg3so27813226obb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 00:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=J+b6z0MyzXMMBbNuZ0E0eEgpRxqyKsHPpOeX0y5lHBs=;
	b=lNXhJbcNhqhJLU7K8kiPtgHGJzkX/kM5hg7Wxx0yPKoRH6FmUNLaG3CnXrEl/gW+Up
	4fidOzBKaurY7cdnVJlDt4ouRus8ly9zBXJy35aqR0qh64Dmf8VTba5Iri+GkuXBAS92
	GJ7R8GlcT/BiII2UIPbdhB1k9D4yrfJQGr49rAVEWAroG39pBOKODxQsJhmRWkl/phk5
	+yyO2chMWAQjM+i4ZN5PIJDUx9ZWEDgSbHyJvx26y5ZACKV8rqSKdT++X4FSbqKXks2Q
	N8nv6Q0L5YgPglJ6wW4L5TprhbEw8qg9b838wU4o59QfTu5A8Bwemvz/4pjXVFmOEJ73
	l4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=J+b6z0MyzXMMBbNuZ0E0eEgpRxqyKsHPpOeX0y5lHBs=;
	b=R+rc1yJpiXPfvTFOrT1btJNJitlA3/Ss9EiMd8g15xBwn7f2Z9PhAj3/Kp/trobajg
	C8+knyNTI/maqbezcT3jXjjdj1C60bII7nnrEPz5oy/VNnMjQVZvNVQHXUXGqc7MVgyX
	KWNoV/3L2Etp+pXdcBYb54oipL3JpubnRsu5oSjRC9xof7YObLg/uJAsWb6hz1ia6925
	j6MJpOOdZQYn2RxB17J43JJ/0Gvd2dgwhOGs714/oFbBbK6TIY3L03nA+KLlQ4/BEA/Q
	8r00KDdGhkI6zTgqsuybe4HJ9efUkxZQqS362d8ao5UhqhyLI6wkmWlVz+asm14nY/of
	l1BA==
X-Gm-Message-State: AD7BkJI2/EuuYfabNEQUmjpushKihLUF8sh+rL+9PHry86TyP3lqLy8PgrsjdB54dFDMpT4s+9xzrBQ4QAD1Sw==
MIME-Version: 1.0
X-Received: by 10.60.15.165 with SMTP id y5mr10270714oec.52.1459756191054;
	Mon, 04 Apr 2016 00:49:51 -0700 (PDT)
Received: by 10.157.5.203 with HTTP; Mon, 4 Apr 2016 00:49:50 -0700 (PDT)
In-Reply-To: <CAMKF1spSnyYGJWZOG6vs8kW7y3JjZBo7J843jWhOZzq-RYCeww@mail.gmail.com>
References: <1459717038-10549-1-git-send-email-max.krummenacher@toradex.com>
	<1459719934.7348.141.camel@linuxfoundation.org>
	<CAEHkU3VUnh78uOWRT2gYhAR5QOxYGDnc6J8RAsqkEkyj31HWfA@mail.gmail.com>
	<1459724450.7348.146.camel@linuxfoundation.org>
	<CAMKF1spSnyYGJWZOG6vs8kW7y3JjZBo7J843jWhOZzq-RYCeww@mail.gmail.com>
Date: Mon, 4 Apr 2016 09:49:51 +0200
Message-ID: <CAEHkU3VBBpuCzOBXgyAm_POc6zoV+hZ3XvdH2utCg_y73aJqyw@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe][Patch] package.bbclass: fix host contamination warnings for source files
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
X-List-Received-Date: Mon, 04 Apr 2016 07:49:53 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem

I'm seeing the issue in Angstrom in
 fido, jethro and master, basically since the QA test for host user
contamination has been introduced.

But I only now tried to debug it, meaning I did this on Angstrom
master and Poky master with HEAD of oe-core being no older than 1
week.

2016-04-04 4:36 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> On Sun, Apr 3, 2016 at 4:00 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>> I added some text to bugzilla. The gist is: In poky the sources are
>>> not deployed.
>>
>> I don't understand that. If you mean playing sources in the -dbg
>> packages, poky does that too. Is there some specific configuration
>> Angstrom makes which triggers this?
>>
>> There was a bug in master recently which broke source file deployment
>> into -dbg packages but that was a bug everywhere which was then fixed
>> when we realised.
>
> Max, somewhere in thread you indicated angstrom 2015.12 release which
> would be actually using jethro
> and if it has been recently fixed in master than it would explain why
> it worked on poky/master and not on angstrom
> may be this fix should be cherry-picked to jethro.

