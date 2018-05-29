Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0E24560197
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 19:46:57 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id d130-v6so7098246qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 12:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GtCCaaGu46RZoYINPFevfw9svXxqLduwjE9qXR4hvM0=;
	b=LEisZJ1HCnpf2lf3OR23J0Oza4I6C+7RyAYuPSY64ev8T80rSjGU9JSAsBzHFQUzC8
	LAl5LwHP8iVPNNrkMlBOYnoxs6Bi9J1XFd+s5Q/TSudqIigZqnpL98uw1CVZmg1UYp5Z
	AhUdP9R0soC7qKPeA9vx23Qg6hK5im61/0r7RlTo7bUrjFbDeXF85OwTs1r0beFZUDUY
	1BtsCXdtyEBDxijx66my9b4ZN7AEmltLYlkKiQBhv7cq5t/95kwk1zs3jsF46kBaVKKW
	t40bSUFjtpVmW26s3DmPg6XJUm7foznHvzoGDo15yirnCDLTaJJEldRHdsw3AGuwoZVT
	0SHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GtCCaaGu46RZoYINPFevfw9svXxqLduwjE9qXR4hvM0=;
	b=DC4ox8/PtvpeGVMk9JZ6T+nmTPLlCsawsLDFnORQyCqOBh/6m9yenz/cgkQoOtAXDT
	nl+5R8Vmfu6x0lZ2Pg3flAWWcb+veZsrMLK+lPEB9TkHLY1LKl2D2tSGZIaGNWjmObbm
	7ud7wITnOJ69npsWYUZiEBR31eS69A/AYZNgYH4mzDbrR8eWK/CBsioKZIsZY8db3Mer
	R2jA18RE0dqfYMApMVPg0skFOqcuQA7eAJ8xg1dAYUx8RnDouAeWpus5SmETX8wDYrcJ
	HUYXa2SRtMxdYCEc7lUPE9hWao96WdDz8N4Hmrlmpj5kY+Js+Jw4RD0yvjglFK4wTBdq
	7HCw==
X-Gm-Message-State: ALKqPwcM2ImZElDCqN1oscSjlunF1hIDUKujsrYhlT9XT5EpuUzyK0RP
	aZZROACAHPKh27E/2NEwFRFyn2ac1LAuotyJFh8=
X-Google-Smtp-Source: ADUXVKLgK0hgSroZqi6sR4U7B9ErVTWPQHyETxkO/Xt9CX7pxAIxkpl9fUA8JkrtExIO+lsSvumzqLms8GY724JCyYU=
X-Received: by 2002:a37:cbd3:: with SMTP id
	u80-v6mr15674022qkl.290.1527623218498; 
	Tue, 29 May 2018 12:46:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:9a0f:0:0:0:0:0 with HTTP; Tue, 29 May 2018 12:46:27
	-0700 (PDT)
In-Reply-To: <d883f610-cff1-6b16-97bd-74f84225605a@windriver.com>
References: <1527514686-21442-1-git-send-email-mark.asselstine@windriver.com>
	<CAMKF1sqWVd61gS8eksZ_LB2DK00oSzM0BXjDM_5Pxz53SCzGBA@mail.gmail.com>
	<d883f610-cff1-6b16-97bd-74f84225605a@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 12:46:27 -0700
Message-ID: <CAMKF1spAmk-pAmt=efM+vPeCv6uSfXwapTd_z6gRSacAcEShSg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipe_links.bbclass: introduction
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
X-List-Received-Date: Tue, 29 May 2018 19:46:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 29, 2018 at 12:40 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 5/29/18 2:22 PM, Khem Raj wrote:
>> On Mon, May 28, 2018 at 6:38 AM, Mark Asselstine
>> <mark.asselstine@windriver.com> wrote:
>>> This is a new class which can be used (for example via USER_CLASSES in
>>> local.conf) to make your build more development friendly. When
>>> included this class will create symlinks to the various bb and
>>> bbappend files in WORKDIR.
>>>
>>> Normally when you are debugging or extending a package's recipe files
>>> a developer will employ one of a few indirect techniques to determine
>>> where bb and bbappends files associated with a recipe exist. For
>>> example they might use bitbake-layers show-recipes or similar, or
>>> simply rely on their experience to guide them. Even after working with
>>> openembedded for serveral years now I find these techniques tedious
>>> and time consuming, and sometimes even hit and miss.
>>>
>>> Since the whereabouts of these files are already stored in various
>>> files at parse time we can create symlinks to simplify the task of
>>> finding these files, making them available in WORKDIR for easy
>>> inpsection and in a convenient location if using devshel for instance.
>>>
>>> For now this work is completely optional but we could conceivable make
>>> this the default behavior if folks find it is convenient and the cost
>>> of performing these operations across all builds is minimal enough.
>>>
>>> recipe_links can safely be added to USER_CLASSES for existing builds,
>>> care has been taken to avoid this action causing anything to be
>>> rebuilt. After this has been added you can either 'bitbake <recipe> -C
>>> unpack' or 'bitbake <recipe> -c create_recipe_links' to cause the
>>> links to be created in the WORKDIR for the specified recipe.
>>>
>>
>> I think this is not complementing devtool workflow, even though its
>> not going to hurt it.
>> however, devtool workflow is what we should be targeting as primary
>> workflow for OE
>> and I do not see a benefit of this in that regard.
>
> I think the same could be said about other bbclasses that are not enabled.
> devtool is not the only workflow, and a lot of people like to work directly
> using 'bitbake -c devshell' or similar still.
>
> As an optional user class, I do think this is reasonable and helpful to many folks.
>
> (it also does not clash with the devtool workflow at all, so even if enabled a
> devtool user won't be negatively impacted by it.)

Dont get me wrong I do see that part. I was trying to make a case for promoting
devtool workflow.

