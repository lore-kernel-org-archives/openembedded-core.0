Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id BC62A6067C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 00:53:28 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id i68so38353070uad.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 16:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hyRB0wUQHIvTBTzVNKN/YS73+30tqpBdcE2rM+jhi7A=;
	b=T38LxeDaTU0FbX0LTXGFifZ4daoTG+ISd6+ahiZ1rgbbADKhDDiIsPSZHrh7XxY8oq
	hZ6jSTOAJ+r7ZfANHBoo55GzbF5+Zv+rM7xpBFiZ92g23VLxFQ/4JsBK8OGXnYifKGe5
	dgjAQ5W/tohlOHuQhG2C6MrJL38bgRqMJx8n+AuaCheaUkw8d47NHcgqu3U1OcabajlP
	cmVqN+K6bPSxHopEUgKvjpWgo/Ts00D/w584SGH+EWoOu56EScI8dr/+z/RXNhCf7RgW
	SBWA72p94VVhos6AolStLTCh+6I6r3RdfeH9faMZ5auKztX8DKPTW4fKW0Jm4j+VsPTX
	wtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hyRB0wUQHIvTBTzVNKN/YS73+30tqpBdcE2rM+jhi7A=;
	b=nBqjrSH5jvi6IJm2AjEzY/bpPSzZDqEyBlzd0vX4BYgMvpq1OeghXF7vMEKDS8/zeh
	JdU2Y+jLAcbzFphar7OP2vhYdSJ/CxMCvVkuasuGQPsqwm/EsF8B4zHmDu9UGko+tI3C
	1vdr3RJ6VFJ4VtfRdSu0/jFfTwzE5ZJu3Ka/16ps1AtDUIywwJiguV02/ptcJd8JImx7
	r1nRgFQqrkmbNSHw0XTZ7fWhj0vZx2bV6GxA0WVhoaRJT1I5e3hF4UleckZrGUJM5T8A
	mzKQ/yEuNWJfrB2Y9AbDPLd5NwIbtXCQFB5vl2HDUhA9026yun69+GswtSb2g1mJvm4D
	EtRw==
X-Gm-Message-State: AIkVDXJzdMe9FLJg8cAD2+9qvkt/Rtzwg2cws0lhFi8CUCjwYCgJmP/V6DU5FQAGpueYLd3dH+iI8V9UON3utw==
X-Received: by 10.176.1.17 with SMTP id 17mr42886032uak.143.1483577608811;
	Wed, 04 Jan 2017 16:53:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Wed, 4 Jan 2017 16:52:58 -0800 (PST)
In-Reply-To: <CAJTo0LYepu3mAAc=Y76RxBW20w1gEVH1+ms7gpfmSTB-ePfrcQ@mail.gmail.com>
References: <cover.1483570577.git.chris_larson@mentor.com>
	<CAJTo0LYepu3mAAc=Y76RxBW20w1gEVH1+ms7gpfmSTB-ePfrcQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jan 2017 16:52:58 -0800
Message-ID: <CAMKF1so13682b-pR_+EAymDPGHiZG-sh+rGy5LXOC1hjZ1M35Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Add opengl to REQUIRED_DISTRO_FEATURES for some recipes
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
X-List-Received-Date: Thu, 05 Jan 2017 00:53:29 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 4, 2017 at 3:49 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 4 January 2017 at 22:57, Christopher Larson <kergoth@gmail.com> wrote:
>>
>> These aren't buildable without it, and adding it fixes oe-core world
>> builds
>> with nodistro (which does not have the opengl feature by default).
>
>
> Am I still the only person who thinks skipping of recipes should be
> recursive, so if say libx11 throws a SkipRecipe then everything else that
> depends on it is also magically skipped?

Somewhere, we need to flag that user is shooting his own foot by
skipping a given recipe.

>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

