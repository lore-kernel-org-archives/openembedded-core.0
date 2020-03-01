Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7468F60ADF
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 22:19:46 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id u124so8316248qkh.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Mar 2020 14:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=93SMxufqJVXNU5sXUeqORz2xu0axCQtWMSg2zh/GjWY=;
	b=vkdIhZy3Ypwrh5494+285nUt+D4JnFVqIttusPeyKEAXivDl+77aFgTiO6B9iYPXOu
	SVwyrs5w1hT2RVeAul3XZMgprQr5UB9zl+RZfrM/jmwnjN9437v+rlqv5rofHtbwGbht
	GaIJ+yD/ZejLFrlE6+Jzxmbt/jqlUUik0MVnVzqEY2An3yMt4lj+o65dCMTyCNC1chHk
	li33cUiKgvS4vGPOkbxFIg8uQpjesgJOIKdcqhWdwb5fj4JyXA7DirRX+UBuW3MFoNL2
	VdkulyZv7GMEc3xtML3xpf4NatIqr5/5+U4OoUbVJODfyFlLz3baWlZKZJFkZ0s6rHug
	F5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=93SMxufqJVXNU5sXUeqORz2xu0axCQtWMSg2zh/GjWY=;
	b=ost8zPXO7fbhJZ3YfOCN3jxiU3POwOZWy5SbtqXtNy9FAy9bUXK3L6XOak7npwkvGG
	nAHL6NPezgdaQlnhtIbEXYXbO3SqXCwvyQNysKOT+8ZEPwzIMdnctEIzUqxYJMGSnw49
	oAzWHLysKA8SM4CBAfSbgegR6tb5/4V4RYpRPGHy3ZKzz4Nc4Q72c6j4mNuIIylQ9leb
	CLx9imhkKg9XkJWRTAV0Vc38GIDwR7gvcCq2obCv3y8QN07HwyD5txOX0ACnjufFEDli
	8iipBIGR9ZEZEk+ZKd/NwqqZthovYu5OQxcdaRoOWmEdWM7371K7UpXWLzl9f8SprUy6
	dM/w==
X-Gm-Message-State: ANhLgQ19T4ZC5q6B59/eanhDfc8WW/arHZOsHRO5fqWjW6ztv3ure39D
	dI7Vb1PK+7wrHnb3GGf+glqUDlL4zandyg==
X-Google-Smtp-Source: ADFU+vviCvS3+iiJriR3oufMursNDhQc3uSSRjYE0PNDvYTaDcv6s/nGXytO+KQUhs0/haY39DY+pQ==
X-Received: by 2002:a37:d89:: with SMTP id 131mr2174479qkn.295.1583101186932; 
	Sun, 01 Mar 2020 14:19:46 -0800 (PST)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com.
	[209.85.219.48]) by smtp.gmail.com with ESMTPSA id
	s13sm9070557qke.67.2020.03.01.14.19.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 01 Mar 2020 14:19:46 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f48.google.com with SMTP id s15so3822932qvn.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Mar 2020 14:19:46 -0800 (PST)
X-Received: by 2002:a0c:ef47:: with SMTP id t7mr11810195qvs.136.1583101185786; 
	Sun, 01 Mar 2020 14:19:45 -0800 (PST)
MIME-Version: 1.0
References: <20200301131353.3470253-1-otavio@ossystems.com.br>
	<CANNYZj_MpJZKA5Nch_QVa64y7Oe_Q+BQgR37dn8n7bmwvbh8Pg@mail.gmail.com>
	<CANNYZj_sFrRzxgy5JYHfs4DhF1nJtKLKjx1TWwZb-W179_f5-A@mail.gmail.com>
In-Reply-To: <CANNYZj_sFrRzxgy5JYHfs4DhF1nJtKLKjx1TWwZb-W179_f5-A@mail.gmail.com>
Date: Sun, 1 Mar 2020 19:19:34 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpPfFu76YUXfZyqe6Ryg8GDyz_MFsMyjr2aq6emjxTkvg@mail.gmail.com>
Message-ID: <CAP9ODKpPfFu76YUXfZyqe6Ryg8GDyz_MFsMyjr2aq6emjxTkvg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] easysplash: Add recipes for 1.0.0 release
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
X-List-Received-Date: Sun, 01 Mar 2020 22:19:46 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Alex,

On Sun, Mar 1, 2020 at 5:41 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> Oh, and: testing this somehow would be nice. Can you add it to the virgl selftest?

I am open to contribute to add it and integrate if needed, however,
the goal of this RFC is check if there is interest from this community
and then we see what is need to be done.
>
> Alex
>
> On Sun, 1 Mar 2020 at 21:39, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>
>> On Sun, 1 Mar 2020 at 14:14, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>>
>>> +++ b/meta/recipes-core/easysplash/easysplash-bootanimation-default_1.0.bb
>>> @@ -0,0 +1,12 @@
>>> +SUMMARY = "O.S. Systems default boot animation for easysplash"
>>> +LICENSE = "CLOSED"
>>
>>
>> CLOSED?
>>
>>>
>>> +PACKAGECONFIG[mesa-gbm] = "-DDISPLAY_TYPE_GLES=TRUE -DEGL_PLATFORM_GBM=TRUE,,virtual/libgles2 mesa libdrm udev"
>>
>>
>> This I think should also be enabled by default subject to opengl in DISTRO_FEATURES.
>>
>> Alex
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

