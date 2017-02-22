Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 19139601D4;
	Wed, 22 Feb 2017 20:58:04 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id k127so9186000vke.0;
	Wed, 22 Feb 2017 12:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RijlB1G1ku9YL2owZ6+x4/h5D30pgFBCE3jtnt3NRlA=;
	b=hj3zlrulXLFamkIBR5UAMlx4H387wEXx01sQpuRJnMtzHsctaB4PGSHm5g06G37w7L
	e3g7f1SyjBTJDoIF1GaYUd91vXhQFZiz2bqCdjx2N7elhKIg4XSjn+ovURc3ZRszf8FP
	Th6PIMEomPBUEjtK+7/mSRZfCAu2dcTJyX/QhksZlPkCz34kCoY7tKR8iUjNp+yLopcF
	rU/+gxm5bbkWgIra9ps5oM2yqfc8p8ar5KqwjeKixFjf0fmvTpfDbGpA+PgtxDFnSdAf
	Cxnv70QUJsWHAn0ZP/eGWfDoGVOg3ndi17JELRDLNx1O6MofQkJGkFfo6MrU2OtpqPvD
	0iLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RijlB1G1ku9YL2owZ6+x4/h5D30pgFBCE3jtnt3NRlA=;
	b=G6qIeqv5pjPVjdHnB4qdJ8CUzWK2jIjf6YaIhaVaZoFC4jG4eqQbkRCqLx5I2IyAYb
	Tm9H7+ksYUlHhAh6XSqGwrz0r2/rNtdkz/9PmKQ/nc36kglFn9b2U54j5tfcXqqadKOh
	EnArMVBzvn5I7OjlLWyMwVQrzDOC08ZyUdfSBt/hkkpJHOrOdY+SMuguIYI1rmtbHLWe
	jhI5KaIEukljFAcnIDauTCtsqZuwFLWhfZUt3W007K0sRQDO+Z56KaSI1CcM65z70wbJ
	nFkmJW5GXp0cDCRyX3aqCLi5cAUySKYOlhwlPrrBMl7L1jE1t97w3YXB46QqTOvR6reB
	EADA==
X-Gm-Message-State: AMke39nCbojCl00KNrudx1HsMCJY7SINrC/9tapi45qXg0FxWeNqbSg3GZQcWIMfqEonkcdxpsDjgMumLI6l+w==
X-Received: by 10.31.155.75 with SMTP id d72mr16020721vke.55.1487797082934;
	Wed, 22 Feb 2017 12:58:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.65 with HTTP; Wed, 22 Feb 2017 12:58:02 -0800 (PST)
In-Reply-To: <20170222203552.GF3283@jama>
References: <20170222203552.GF3283@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 22 Feb 2017 21:58:02 +0100
Message-ID: <CALbNGRTfHzxioW7iigi+CitbCHK9tDh8t+1OpjLK26GhMP8BTg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-02-22
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
X-List-Received-Date: Wed, 22 Feb 2017 20:58:07 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 22, 2017 at 9:35 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> 2nd build today just to confirm fix for chromium-wayland on qemux86,
> pidgin and geoclue.
>
>> I've dropped only the last unblacklist for mpd which is still failing,
>> will try it now with unblacklist, but without the version upgrade.
>
> This worked, the qemuarm issue reported in previous log happens only
> with 0.20.4, so I've now merged the first patch to unblacklist mpd.
Thanks - the update was only some mechanical thing. When I touch
recipes I check for updates...
>
Andreas

