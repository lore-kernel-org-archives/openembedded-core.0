Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0F56A713E4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 15:27:28 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id f12so10892103qad.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Sep 2014 08:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Nj2iBLnHeS4RkAKS5wozPjkZ2qbqHg+IcLQfowXkwH0=;
	b=lAr1/QKzAtt9NgYtn35+ksoff8RrboGR2Wq4G4kSsOAO4aXqmu1g3/ZmVwcWkIihDv
	/ZS2P4yfoFsaZLkNDX3e7AnKNnQLgV0P1bpHY1YepzWvF5O6caHOnupdiq0JRVznxXBl
	9w/XPUKYQ7qGKXYp3wHuF8MtB04tRGqsLKE7HYsWJ/LXDivdOKSK/HzknFKIwfIfu9X6
	zU3mjjVwYWAHB+29P5N/jNlKajxw/Di0ifsrTjVOmVk8XYnzyY7qKUGGr9IDkJ6UC5Sq
	G/ZBm64JdeGZWhN6Fc676JxC9FraP53ZLYqhLle8mLDu/JAFeYijkfJeX5sZJWqFYYZF
	ecbQ==
X-Gm-Message-State: ALoCoQkC9+ggh5OwwZZoA0UxuE1jRNDw2LfszASt4OoBxQpTMkdtprHIJCZ12wTH7j59EysMNnPg
X-Received: by 10.140.94.234 with SMTP id g97mr18754852qge.77.1409930849487;
	Fri, 05 Sep 2014 08:27:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Fri, 5 Sep 2014 08:27:09 -0700 (PDT)
In-Reply-To: <CACS+7ZQiCVksBN1FK9wJ56k_hpJhpYFq23sWw3srHQ5ZsE1P9A@mail.gmail.com>
References: <CACS+7ZQq_tHp0vA0FA8e1W+iLhuzEA3tov0B5QGFaUvGp_cgNg@mail.gmail.com>
	<CAJTo0Lb8TdnZqDObaNS5JQROLYF9MG-67+W5i=kFBF8TE+s8-Q@mail.gmail.com>
	<CACS+7ZQiCVksBN1FK9wJ56k_hpJhpYFq23sWw3srHQ5ZsE1P9A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Sep 2014 16:27:09 +0100
Message-ID: <CAJTo0LZNo4MxuZoSOvZU-kaL1v=+Wyy2To=s8Dp68ShszTRSbQ@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Use ${ROOT_HOME} instead of /root
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
X-List-Received-Date: Fri, 05 Sep 2014 15:27:39 -0000
Content-Type: text/plain; charset=UTF-8

On 5 September 2014 15:55, Dan McGregor <danismostlikely@gmail.com> wrote:
> On 5 September 2014 03:14, Burton, Ross <ross.burton@intel.com> wrote:
>> On 3 September 2014 20:57, Dan McGregor <danismostlikely@gmail.com> wrote:
>>>   sed -i -e 's:=/root:=${ROOT_HOME}:g' ${S}/units/*.service*
>>> + sed -i -e 's:"/root":"${ROOT_HOME}":g' \
>>> +        ${S}/src/core/unit-printf.c \
>>> +        ${S}/src/nspawn/nspawn.c \
>>> +        ${S}/src/shared/util.c
>>
>> Sedding service files is one thing, but entire C files is another.
>> Can you please sent this change as a patch to the source?  FWIW for
>> patches where the context isn't that relevant I've started using
>> patches without the context lines so there's more chance of them
>> applying in future releases.
>
> I thought that myself, but ${ROOT_HOME} is a variable. I think to do
> that a patch would
> need to make the root home directory configurable, and not simply
> hardcode it. That shouldn't
> be too hard to do. I'll do that later tonight.

Sed the patch? :)

Creative solutions welcome, I'm just wary of such loose seds in source
code.  If the only sane way is to sed then that's what we'll have to
do.

Ross

