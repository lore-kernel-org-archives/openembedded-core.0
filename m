Return-Path: <danismostlikely@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6156B762B4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 15:19:25 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id o6so39607621qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Apr 2016 08:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=xkrZYGegaG2sYWj9WB/kqnqyVgg2Jh3DuoLSmLizORY=;
	b=Wi6UgEqVWoEHrUk3jV6D6nATEZVZ6XHpJ+b5sFaoVFqoGclHhKndDhMnCvZshFRFA3
	56q4RvKW7peMGVuAN3rLli3bXcZy3Lqndi6FgG0d8J0pzmlYLhzLRDyoksjkXXnG3njx
	k9ULHrv2JNN/KZ+E5xWSJ6cWhfqXkfLlqDGAQwTMsLVzzFlIjzVZGTPMX2SQ6Eqi35ei
	+PNqK3YrB5eUtETkhfjkaL61a3eUlIJoHbom9MRc7KyQLlrATYDs3RdhdXseZsFtV/Yj
	n9vOOwqTWeodqf5sBOnZ1PqhzUGu6PbRTj0Tl5q8RDSj941hV9d3nLv3Kjnvt21gAqyv
	DlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=xkrZYGegaG2sYWj9WB/kqnqyVgg2Jh3DuoLSmLizORY=;
	b=O8DzFUufxNM6ImNcYh5AtNyEuOySCA3ajSnLxI4CJJFy0Ce+CXxd4CYrVikei8imE+
	zWjDF6o6+9N9FKWTXiATrBWcCeaLtCgKYCZOfD3viyp4PhJJHIAc20d6PIptH7dLbCt3
	zZFnrxFy5W6twdkE4ffjh4NHNBqONL9uiPXDC2PHtvlw/0MvxcOD7blYv2U5PK9VEEnu
	Q2QDd5zwr6Gk5KJcjD1hz+9KcfqZzx6wcYEmmy2DAup8KjdvDx3W6JOCTcFbC7sLYblX
	dhUgpOESMQ/sEnwCKjJOOcv4GSjCH/x0R7DF9ujxqhXpYEp3psU1pQqB4F3gjFyRB5vQ
	oGAQ==
X-Gm-Message-State: AD7BkJIj31pPJyeiMMotEALVNgiotsVid8Su7d/GBf+NuyX0vOLTDI6KmvYkaVjUrN/Xb8YlAqpp5aCjxXOKNA==
MIME-Version: 1.0
X-Received: by 10.176.5.163 with SMTP id e32mr2196515uae.93.1459523966197;
	Fri, 01 Apr 2016 08:19:26 -0700 (PDT)
Received: by 10.103.94.2 with HTTP; Fri, 1 Apr 2016 08:19:26 -0700 (PDT)
In-Reply-To: <CAPhnLPDKabk-Uy0is+v_oDZVOiMLBNLaJoh+ihGQaKfWpdefTg@mail.gmail.com>
References: <1459501616-4775-1-git-send-email-ross.burton@intel.com>
	<1459504783.2322.69.camel@pbcl.net>
	<1459504875.2322.70.camel@pbcl.net>
	<CAPhnLPDKabk-Uy0is+v_oDZVOiMLBNLaJoh+ihGQaKfWpdefTg@mail.gmail.com>
Date: Fri, 1 Apr 2016 09:19:26 -0600
Message-ID: <CACS+7ZRhu19JehnxX-0hf3Ku+FdhKUA6-Lnt-0mBDtXno=pVAw@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: remove obsolete architectures
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
X-List-Received-Date: Fri, 01 Apr 2016 15:19:27 -0000
Content-Type: text/plain; charset=UTF-8

On 1 April 2016 at 06:13, Flanagan, Elizabeth
<elizabeth.flanagan@intel.com> wrote:
> On 1 April 2016 at 11:01, Phil Blundell <pb@pbcl.net> wrote:
>> On Fri, 2016-04-01 at 10:59 +0100, Phil Blundell wrote:
>>> On Fri, 2016-04-01 at 10:06 +0100, Ross Burton wrote:
>>> > Remove ancient and obsolete architectures from openembedded-core, they've no
>>> > real users and are causing complications that can be now removed.
>>>
>>> It seems a bit harsh, or possibly wishful thinking on Intel's part, to
>>> describe most of these as "ancient and obsolete".
>>
>> Oh, hah, I just realised what the date is.
>>
>> Removing SPARC still seems like a fine idea though :-)
>
> Date schmate. If we remove all of them ab runs go faster. Besides, we
> need to make room for the new Windows 10 with bash builds.
>
> -b
>

Wouldn't Windows 10 with bash just be genericx86-64 with no kernel? :P

That reminds me, I need to go test core-image-minimal on FreeBSD's linuxulator.

Dan

>>
>> p.
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> Elizabeth Flanagan
> Yocto Project
> Build and Release
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

