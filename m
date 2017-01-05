Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9580160620
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 01:27:52 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 96so32062116uaq.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 17:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OqNlCrTzUGF5yNhg/YCLHvoFe/Sw/cYFtrxMTy27g6g=;
	b=VdydUj/BC+9LBRApvg+V83LfOONLHzYGyKcYSn77s4ZgLTffTCmE22YJ/5clN77wpb
	ut+LelmX4xIXhd6vDdosKq+kEnn4Ew5zcz6v/uMygp9lcyL5CGOToZdmJcFrd9fvXwg7
	41g6iv3JxkcHFOp7Gbe7e2GiT7VWDRtm3vnw6KiIHrH62Myh61q6BUKzIz/zVr8PNlsp
	ZYwPPzyzwWqfPx5xSduhQu2oYNLy9DYkWWpOJmnKIu2TJhGb2jEYjqqBuFOf6zpk/z4z
	VPDqdvjihAt4rZvrDAcyHG29sv76Yc0sYa370qBs/yqIfqdKy+hR6WonnbbgxyxJpEBL
	Bnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OqNlCrTzUGF5yNhg/YCLHvoFe/Sw/cYFtrxMTy27g6g=;
	b=iwwAPnqvi1kHUvSyuI9yOkNqWDn+UqbW6GyTbLK/NNxZslDA7H8WmPXX1OO9IryycN
	GUMiZpTY0Hvhp0A+AjPkyAufNbZQxeZtYqn0bYazHJXYCl/5oWP9GrIiavMmE650PGmQ
	kaxxLZtfi+0BqRdOnUmIbyj9gKTn2xp4fnT1VyXWVrhDV1x6E9vPTw3ZppM9P4LGt1r8
	L4nbC0cN7mb4guVMGG/7cpTL86s+2Jb5hGxugSLM4eACqq4oRLaLqQeW9jmFdi1Rn+TE
	6jj3dfTpurLTK/C3beYUAF0UIQK8xPjT2wIYqrc6G6R96EA6FQPC4Jby/9ZH75jmhOl3
	VW4w==
X-Gm-Message-State: AIkVDXJPrUt1TrH2ZX6RG5TtOp99GkAhHWehKHnXfosrFpMpYR3lMNPobP4OslKEjyier1MdWC6Y3+jWxtCbIg==
X-Received: by 10.159.32.99 with SMTP id 90mr43852117uam.138.1483579672706;
	Wed, 04 Jan 2017 17:27:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Wed, 4 Jan 2017 17:27:22 -0800 (PST)
In-Reply-To: <CABcZAN=yV3qbbQVVcSeWjdEBpf9uSd-f93LDFs-HsEYDjb6tDQ@mail.gmail.com>
References: <cover.1483570577.git.chris_larson@mentor.com>
	<CAJTo0LYepu3mAAc=Y76RxBW20w1gEVH1+ms7gpfmSTB-ePfrcQ@mail.gmail.com>
	<CABcZAN=yV3qbbQVVcSeWjdEBpf9uSd-f93LDFs-HsEYDjb6tDQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jan 2017 17:27:22 -0800
Message-ID: <CAMKF1sqYQ6nkODo-24KGQrfG=q=ZbbErgfo3_bUtNgP4JH5GnQ@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 05 Jan 2017 01:27:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 4, 2017 at 5:13 PM, Christopher Larson <kergoth@gmail.com> wrot=
e:
>
> On Wed, Jan 4, 2017 at 4:49 PM, Burton, Ross <ross.burton@intel.com> wrot=
e:
>>
>> On 4 January 2017 at 22:57, Christopher Larson <kergoth@gmail.com> wrote=
:
>>>
>>> These aren't buildable without it, and adding it fixes oe-core world
>>> builds
>>> with nodistro (which does not have the opengl feature by default).
>>
>>
>> Am I still the only person who thinks skipping of recipes should be
>> recursive, so if say libx11 throws a SkipRecipe then everything else tha=
t
>> depends on it is also magically skipped?
>
>
> I=E2=80=99d agree with that. It=E2=80=99d be a nice improvement. The user=
 would see an
> explicit error if they try to build it, as is always the case with skippe=
d
> recipes, but it=E2=80=99d be silently excluded from world the way skipped=
 recipes
> usually are.

excluding from world builds is a fair argument.

> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

