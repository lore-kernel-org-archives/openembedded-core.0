Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5F03D74DA7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 19:11:34 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id j80-v6so13550001qke.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 12:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ew7wkJrVUJZlk6ss/H6tr3lSikh1eF7rsgv0ftK4dS4=;
	b=UMy9cBeqzJsjhG+GIy94jIdJzQpXqR4BTgfdZOJF6bXzNqcLhRJzU5xdDsPSgb3O+/
	hzHa6CEATcWrsgYARwuB0OHvMNKtBHv2X0fU8IFHjOPnWjYc/MC+O8ahxdmwktJP9XQc
	lI5P3MCccvsh2xz11QrvZkMykTdy3y+iHeu4iGwMQNPgAhkN08pn8S4j4BUoBDL+ZNBh
	Y+EGvTJqg7XRGYwpG3eveCMAT+p+uXUhLL/Bio55gD0PO3XsYS+Mp04wiHdh/EorpvUi
	KT8HeD/LuzoWs/TrreSXxiHbs2hSh7ssyDB/G3A/dpI8aCStICcPKugaeqq3B+aqmeDT
	nQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ew7wkJrVUJZlk6ss/H6tr3lSikh1eF7rsgv0ftK4dS4=;
	b=nbhBJhUhuF+0J1DHVGKhNmneCBS+17v3rO1qi346yrjyEqZC7kxgd2G0+NG2hEzoGZ
	dtBMldSf4a9CVoRJCL+n76HXykvnrZc+ildRsZt4Cd2ZVhNQZ4XqCxB8+XeKYoCk6hal
	I8p4dObqEBOYOzeZp4LFP1BUAqjsdhpdOW0abRiI6C850OSqNzd8u5ImWRDWqQxwHvWu
	MrLfEjw4Ta8OqLsHOgVC0goD+T5R0D7q10tDCGoGNFaKPuH8Taj2wypwyMvXh9QCAaRq
	vwV2j765iWbiH2ztg/PEd/pFslTBcg9onR97YrhyjeDzLN2YLRtRVxvmc2pLBUVHimqi
	kcWQ==
X-Gm-Message-State: APt69E0C1O0Yf4IE4EqDqVf6OGJNFo5duoAhkgQAo53re9j0VdvwWaF9
	gMl0Cg9jaro+zKIReaJH72kLvqupzXzrPwCaQ4Q=
X-Google-Smtp-Source: ADUXVKJCHtYBdHzpVdQmLXHtI3VVlhADWy9D7WVxuTArbGKzk2eLhPGIwgR5jbLiaQF0CHJfzs9n0bVuTg2l20Bh1f8=
X-Received: by 2002:a37:b8c4:: with SMTP id
	i187-v6mr3674993qkf.412.1527707494889; 
	Wed, 30 May 2018 12:11:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP; Wed, 30 May 2018 12:11:04
	-0700 (PDT)
In-Reply-To: <CAJ86T=VWrtpr61mxhwJNDz9FcB-V60CWFdL55Zfkw4pOC9wWkQ@mail.gmail.com>
References: <1527629388-3808-1-git-send-email-armccurdy@gmail.com>
	<1527629388-3808-5-git-send-email-armccurdy@gmail.com>
	<CAMKF1sroBR0o=tfORJxX-Fg5itQLEtBxtiTjia4E2YGYuj1OEg@mail.gmail.com>
	<CAJ86T=VWrtpr61mxhwJNDz9FcB-V60CWFdL55Zfkw4pOC9wWkQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 May 2018 12:11:04 -0700
Message-ID: <CAMKF1sqSXP0AqzXZ33t8XxRji_Ah9yLp11y+qrM0cmq=8afqBQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 4/5] bitbake.conf: include ASNEEDED in TARGET_LDFLAGS directly
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
X-List-Received-Date: Wed, 30 May 2018 19:11:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 30, 2018 at 10:46 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, May 29, 2018 at 7:13 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, May 29, 2018 at 2:29 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> Previously, ASNEEDED was appended to TARGET_LDFLAGS from
>>> as-needed.inc via tcmode-default.inc and so may not have been enabled
>>> for external toolchain builds or other configurations which over-ride
>>> TCMODE (ie builds which do not include tcmode-default.inc).
>>>
>>> Include ASNEEDED in TARGET_LDFLAGS directly from bitbake.conf to
>>> ensure that the optimisation is applied to all builds (and for
>>> consistency with the way that TARGET_LINK_HASH_STYLE is handled).
>>
>> We have to be ensure that external toolchains can either override or support
>> --as-needed feature,
>
> External toolchains can easily over-ride ASNEEDED if they need to.
>
>> since we may not be able to control what linker they use
>> or version of gnu ld they may deploy.
>
> When was --as-needed first added to gnu ld? Do you know of an external
> toolchain which might not support it?
>

If they have new enough binutils it should not be an issue. but I dont know
if there are such SDKs out there, thats where external toolchain makers can
help. Otherwise we can assume its fine.

>> From internal toolchains pov
>> this is a good change, but It would be good if some users of external toolchains
>> can chime in.

